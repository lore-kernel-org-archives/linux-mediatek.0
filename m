Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFCBC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbmmCsTSdg67BQWRU4NVfV27akWwbl+q9FTNw5D2JCM=; b=yRbdXWmNCoki2yBuZEq5eIOzaT
	nQFdZ/BQqit3SRQCWhiYNHcJyCHLvGXXc0w67ig5YU5pTBIe44zZtLvs9mllg4fNr+1uIUFAEabI3
	uOg1xvo6TDxbEW0Zzy9JYlA31qVCF6+9QAyYvAIYtzysT7jClwxsjq5KZIRnanZpt+kq+BwZ5Se5F
	sH1W1hF+HvvcLVyVCAoolkRPVW1E4TQ4puOCQrTxoKMqiKX27PI7i2jYFv9+DiSVDc9RYuxea6TPu
	uhRVX00rBzt9p70tGJT5uqSUTDiVWg1etpncqpOsf8sTd83+VBdNx1WZFupuwFww5IG9dGwJypzX1
	x23Xoegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9nOQ-0048a7-Gv; Mon, 26 Dec 2022 13:19:50 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9nOD-0048PP-6K; Mon, 26 Dec 2022 13:19:40 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p9nNz-00041d-7W; Mon, 26 Dec 2022 14:19:23 +0100
Message-ID: <fdc65b23-df50-cce0-35ad-4b6ec6527321@leemhuis.info>
Date: Mon, 26 Dec 2022 14:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] spi: mediatek: Enable irq when pdata is ready #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221128-spi-mt65xx-v1-0-509266830665@chromium.org>
 <166965653185.677424.5326738316899525692.b4-ty@kernel.org>
 <Y6dL2ZWgd1BD6kew@makrotopia.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Y6dL2ZWgd1BD6kew@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672060777;33ab6be2;
X-HE-SMSGID: 1p9nNz-00041d-7W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_051939_042271_52D6E44B 
X-CRM114-Status: GOOD (  11.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

Hi, this is your Linux kernel regression tracker.

On 24.12.22 20:02, Daniel Golle wrote:

>> [1/1] spi: mediatek: Enable irq when pdata is ready
>>       commit: c6f7874687f7027d7c4b2f53ff6e4d22850f915d
>>
> 
> Testing next-20221220 on the BananaPi BPi-R3 MT7986 board it turns
> out that this commit is *causing* a kernel oops and strack trace output
> actually quite similar to what is described in the commit message:

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced c6f7874687f7027d7c4b2f53ff6e4d228
#regzbot title spi: mediatek: oops due to race
#regzbot monitor:
https://lore.kernel.org/all/Y6hZA19rWuDkGJa2@makrotopia.org/
#regzbot fix: spi: mediatek: Enable irq before the spi registration
#regzbot ignore-activity


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

