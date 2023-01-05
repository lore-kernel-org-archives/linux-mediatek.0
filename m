Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE16EC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eugSkOX8HmjCkF2oQW5G7OlUBt9XxVRELc9o58/Y36s=; b=KI0F3GWMUPsQ3u
	9DoHk8Bbc3RDL7/GEbWFK4Kvct3uwP/9T/wyjXzPWXnq0SffQeHpJx9ZE0I9zjP5LnDSTEWvaS1XL
	v/trggVBzM1l92/AcVVF9CMntFyofQ7nOyeq726652Mq1fBl2bj2nbDn7SAPGZgOTHl8KIAW7GyqA
	BsQroXyKp1SoZpIBE95s8w/EYY6HRaisaUFpRs5aaTJwQH4+oviy7iPmN9yV15qNdAyW+3fVwP0jB
	YFy/ezv/e0WLI+0iy8zvJK5Z8sZfvyuZZ7bFn8wb7wIXhPgZRb2ShmZKYfIgi4SxItvCFJ9l33Gq3
	gKhQqROQ/f6H1vln763A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYkI-00FbgQ-Kd; Thu, 05 Jan 2023 22:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVH2-00DoNU-SL
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Cc:References:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eugSkOX8HmjCkF2oQW5G7OlUBt9XxVRELc9o58/Y36s=; b=NrqoDKXJDY1jJSXLdKCwjCUXoo
	XPzNisWyHm09s3BwO1Ibhg6Tnv9RPnj+wAtUk4Xru/DLIfEsZBpGlokIHfUhFGSTFcLX0HvqMPOpn
	nvH49bfJBXQB8Nz4mm+9dldNVLt/sYrOQlz6y6oJ5Jlgu5FhBKA/39Xfpnffugrk51GQdcLm3+g3X
	bBhVLUafCg+WE+avdLQYJz9KLVOfz5gzZjF0fCGiKeCYDSAoILNS4Rm57UKTLB/af+sNH1riFO2qf
	UHwP7W1iPCIVDfnxD/2vP6aUqLcC/Cbutw3uryJPXIVcPLmshU8EoM8B+INcYROZULTirmrzZIkrp
	We0LAGSA==;
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDPFZ-001JFa-1Y
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 12:21:40 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDPFZ-0000SS-Aa; Thu, 05 Jan 2023 13:21:37 +0100
Message-ID: <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
Date: Thu, 5 Jan 2023 13:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Ricardo Ribalda <ribalda@chromium.org>
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Language: en-US, de-DE
In-Reply-To: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672921303;c8deff93;
X-HE-SMSGID: 1pDPFZ-0000SS-Aa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_122137_699882_DA85F763 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[CCing the regression mailing list, as it should be in the loop:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 27.12.22 11:28, Frank Wunderlich wrote:
> Hi,
> 
> the following commit breaks SPIM-NOR on mt7986:
> 
> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready

Ricardo, do you have this report on your radar? Just wondering, as it
was posted a week ago and didn't even get a single reply afaics. This of
course can happen at this time of the year, but I thought a quick status
inquiry wouldn't hurt.

>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
>>
>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> 
> after reverting the commit, no trace happens and nor is recognized on my board

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

