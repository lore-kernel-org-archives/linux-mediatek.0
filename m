Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A654CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 05:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zeNTz9dZI8LnTBatn2bq2v7BK5j7Weg7XVPNxsiLDY=; b=NnHCpi298/ExeU
	8VYVojJCHxg+2rd2thXOGvJMoCagXr9pAPH58P/azqmMkmVxY+6XWz1UqWw8nqGm83f6P6UpKKY55
	lWv1dDkNVSYs4UX/I1Qdgab22gOCqth6R527jrwz02Jup+A+98IJ9Tg0JK9A06Y7NC74P+Tabdeyf
	x5i5MsGSCBFricQhGABODTgxGUyXfmFqK2xh/mQ0ShzqedNiJe38RA63rdYXnVlih+hGgqLRW1LZE
	Vl9ZebvTTU7XvcVE3ZRhK714/da9VOk1FNko6SQ0qMpjrlnJqVNfhj0JS3l2X6+o3mpLnN2NI/YMK
	Iax6WTIRvaM9MUwVmdmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lwp-0000000FE2C-0146;
	Fri, 03 May 2024 05:59:07 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lwl-0000000FDzp-1fJa
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 05:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=7zeNTz9dZI8LnTBatn2bq2v7BK5j7Weg7XVPNxsiLDY=;
	t=1714715943; x=1715147943; b=M0cnn2eT2YnmcNA6JrTjERz8r6UN9sim8EqkzqSHw6O7yap
	q4AvDcXGwFmnMAy5ThDz7je5Nna5YC9wSmW7tJBj7ljyzFtoHl9cC7GH8i8xwHeFLLPFYKj7+r/RG
	zxCnQl7Geqp5CWyCBcZLnUeIkc4C/TiVDDR7fOpYPdGvS527MDhxnKk061p+Z6rapf9lwLsuhcO9t
	0pCyvokQ2wTq3MvRSDMHuFQI5ToeYhOVcmaJ2ShUDxzHQU78aazPY3UHdCAvGYbZYc4z1cj70z8Lz
	AQCUi8/yXhwIIebtKbpmwr/f8A4wVIY05h7+UwP+islq6ExYa4FtB9OZYtapd88A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s2lwZ-0004pK-RV; Fri, 03 May 2024 07:58:51 +0200
Message-ID: <82fde49f-5dc8-47de-b220-83f9d7555485@leemhuis.info>
Date: Fri, 3 May 2024 07:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Tri-band AMD RZ608 (MediaTek MT7921K) has 6GHz band
 disabled in kernel 6.8 despite working in <=6.6
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <e17e5bf2-657a-4a22-a925-94db95fe8ca1@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <e17e5bf2-657a-4a22-a925-94db95fe8ca1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714715943;2c5fd770;
X-HE-SMSGID: 1s2lwZ-0004pK-RV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_225903_642706_5C130FEF 
X-CRM114-Status: GOOD (  16.58  )
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

On 18.04.24 10:48, Linux regression tracking (Thorsten Leemhuis) wrote:
>
> mt7921 maintainers, I noticed a report about a regression in
> bugzilla.kernel.org related to your driver. As many (most?) kernel
> developers don't keep an eye on bugzilla, I decided to write this mail.
> To quote from https://bugzilla.kernel.org/show_bug.cgi?id=218731 :

FWIW, the reporter meanwhile confirmed that this happens with 6.9-rc6.
No bisection so far

Mt7921 maintainers, so you have any idea what might be wrong? Or is this
a situation along the lines of "uhhps, we screwed up somewhere (hardware
detection, regulatory stuff, ...) and had to fix this, which leads to this".

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>> On kernel 6.6.27-1-lts, running `iw list` shows that 6GHz channels are supported:>
>> [...]
>> Similarly, discovering and connecting to 6GHz APs works fine.
>>
>> However, in recent kernel 6.8.5, running `iw list` shows that 6GHz channels are disabled:
>>
>> [...]
>>
>> And scanning or connecting to 6GHz APs does not work. 
>>
>> There's nothing in `dmesg` that differs between boots of the two kernels. On 6.8.5, 6GHz band doesn't work like it did on previous kernels. 
>>
>> I can provide more logs or help debug the issue if needed.
> 
> See the ticket for more details. Note, you have to use bugzilla to reach
> the reporter, as I sadly[1] can not CCed them in mails like this.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> [1] because bugzilla.kernel.org tells users upon registration their
> "email address will never be displayed to logged out users"
> 
> P.S.: let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
> 
> #regzbot introduced: v6.6..v6.8.5
> #regzbot title: wifi drivers: mt7921: 6GHz band stopped working
> #regzbot from: AlexDeLorenzo.dev
> #regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218731
> #regzbot ignore-activity
> 
> 

