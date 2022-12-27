Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D850C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp0oG4pOFc7Fcy8pqouj3kEPIVdGicbvjMgv2F/4h6I=; b=wf8wkzXOplZKhM5YE8j9XDpOfG
	D4NwgCth4cKTzennJyEq41SxKW6aTasR2HkH8IoQ2M2Qi0ZaIpSB9HRrRx0VeqtVl6pQC9ko5CVFE
	ZYOvbQZGXoZCBbALKV9E6r7eLJxKAlVjhst/yCKAfixhCRI+VVRXmQPuQ5m0Z1aqjQYoOr/X1Z0Bh
	tx7dTUAICqyn+gQADEmBMXz6i8Z7mIsA1QMtZWzGl8sQIsQQvpffKVuv0dmAgALiwTkcWvSoIAjYW
	GobDBW80VS1ExPZn8mSNxiu81mXMQUVoq/pser3lHaVlDIE0b/+OsdIfWPoDhaVUV1CX3nu1ghufV
	5ZbCv+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAxq-00Dg0N-IS; Tue, 27 Dec 2022 14:29:58 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAAxn-00DfwK-FP
	for linux-mediatek@lists.infradead.org; Tue, 27 Dec 2022 14:29:57 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pAAxi-0003rR-3J; Tue, 27 Dec 2022 15:29:50 +0100
Message-ID: <b76fca16-9a7a-e8a7-6d4a-36fd88ea15ac@leemhuis.info>
Date: Tue, 27 Dec 2022 15:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986 #forregzbot
Content-Language: en-US, de-DE
To: linux-mediatek@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672151395;26aa413e;
X-HE-SMSGID: 1pAAxi-0003rR-3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_062955_797319_38E92280 
X-CRM114-Status: GOOD (  10.30  )
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

On 27.12.22 11:28, Frank Wunderlich wrote:
> Hi,
> 
> the following commit breaks SPIM-NOR on mt7986:
> 
> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
> 
>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>>
>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> 
> after reverting the commit, no trace happens and nor is recognized on my board
> 

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced c6f7874687f7
#regzbot title spi: spi-mt65xx broken on mt7986
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

