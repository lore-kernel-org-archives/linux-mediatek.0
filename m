Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A1BC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ceJILIOVA2WDBG4d054KS51MjWUMSrgtQobFchiud7w=; b=GqDXuOEwyCKvNm
	LaLNf/RreqdP1El6hmRlgFUex0EBLQEs7HjdoNool+CHjlLQEQAY4Xh7U8w20hhXtktlubR5B2bqR
	Dgo//aI10XZHsF/Ha/lkOTTSu2IvPkFbfxILe+LLTzKTQjKflhe1ywDnzuRfFn40yUY3ozKTl+XEO
	zSXwP6bwmwHBO7AnjS2wF1e36blQhQaWqMid0U6cb2Exk3q6mTdidE9wc/fHL2Bbww0JP69Fhy+cF
	OvnQvssys88ALHqmrIs3ZgszNwtlqgjW9r7Z4GlbOqd8W3Ng/+xBlSVvskF8Et5TVSV2UZW0VWTF3
	ViK+JBcz89FGkAHzmg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNRu-00000001Uss-1S2m;
	Thu, 18 Apr 2024 08:48:54 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNRq-00000001Uq7-1Kld
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 08:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:Subject:Cc:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To
	:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ceJILIOVA2WDBG4d054KS51MjWUMSrgtQobFchiud7w=; t=1713430130;
	x=1713862130; b=zkCUe13NkDJLG9v0bQ4CcYogb9oV+aIuZSn6hOtKzyRKQnYwXk8EZu6uMGfQu
	Jm2PpZWRwcirXoHKWF/Q84NsGRWZpPaWN4Wgkqk32LUtASXGv6aErxOeT4ztARy10Li2agqOOyRQ7
	Xz2T3VHYEAZmi6P12GP8vaGlxKo2m4ydn0AJ3cyy2Nk/gGOvlIki9FHyXFSlINFxIEtERNkkRirgv
	9qJiW98s+8Jk8nzK2sjH9hraURaIfGARO/6YFvy2c6DOcALCHj37+MYGUQQXbTDDLFWCc2kZvUnP/
	fst/tlZREQxb0NI22NOlFYEYdZado+ynNiqzWNzOoGZuoRwipA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rxNRi-0004qb-BO; Thu, 18 Apr 2024 10:48:42 +0200
Message-ID: <e17e5bf2-657a-4a22-a925-94db95fe8ca1@leemhuis.info>
Date: Thu, 18 Apr 2024 10:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regression] Tri-band AMD RZ608 (MediaTek MT7921K) has 6GHz band
 disabled in kernel 6.8 despite working in <=6.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713430130;ed21fcb4;
X-HE-SMSGID: 1rxNRi-0004qb-BO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_014850_592991_C3BFF509 
X-CRM114-Status: GOOD (  10.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Thorsten here, the Linux kernel's regression tracker.

mt7921 maintainers, I noticed a report about a regression in
bugzilla.kernel.org related to your driver. As many (most?) kernel
developers don't keep an eye on bugzilla, I decided to write this mail.
To quote from https://bugzilla.kernel.org/show_bug.cgi?id=218731 :

> On kernel 6.6.27-1-lts, running `iw list` shows that 6GHz channels are supported:>
> [...]
> Similarly, discovering and connecting to 6GHz APs works fine.
> 
> However, in recent kernel 6.8.5, running `iw list` shows that 6GHz channels are disabled:
>
> [...]
>
> And scanning or connecting to 6GHz APs does not work. 
> 
> There's nothing in `dmesg` that differs between boots of the two kernels. On 6.8.5, 6GHz band doesn't work like it did on previous kernels. 
> 
> I can provide more logs or help debug the issue if needed.

See the ticket for more details. Note, you have to use bugzilla to reach
the reporter, as I sadly[1] can not CCed them in mails like this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"

P.S.: let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.6..v6.8.5
#regzbot title: wifi drivers: mt7921: 6GHz band stopped working
#regzbot from: AlexDeLorenzo.dev
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218731
#regzbot ignore-activity

