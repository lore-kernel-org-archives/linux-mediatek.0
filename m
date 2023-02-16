Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E887C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLQJFu/YeHJZ+e6PfLY6thqunBy9QxUaZpPGg1FO/6c=; b=UW/3w9pe9IoFlZfEwiw3Y2PZEa
	y86/eRkKlWdG+Mf8TGsy3wI/BAHsn37GTOjV4PUqGoNUgnvMzjNt6riLomGOp8d/pAIREH11UyVcf
	vaGqoZ7m+1JAn4W9oA1IGF+Tkd4eh3dNREIgSNDX8aChlS8VfFFBz9c9lRFcG4tstHTu3lAlN+7oy
	19UuVbHuwKn6bWF9q9JESamriAHutpzSuPUSGtiW0WFQ8AQEYUbjHUX6od0AyfuRcnGXFUadCCTUp
	hRg/gdq5KiGrlerDBVeq0Trrtf+FhB4+UZodQMayUZSLbumGsIIzdJxDDRIw4dxgDOVFrYfXdwOqv
	fsk5VGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSefW-00ARLo-JM; Thu, 16 Feb 2023 13:51:26 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSefT-00ARHn-FN; Thu, 16 Feb 2023 13:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1676555471; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n3e6V0OoPliLCxnynkYX1BT0oz7+TNyIk8cvea0eiqe4uhM7lO/JuA1xYU4LF6Pmu849emz0P83ccBnCu9I8xfoeNLdO31As5D7so3LUl6ajWqeLvaYfNll8kW6Am9AQVQ7oAMehd5swybxSegfKpfRmCOzHxAt3eC8p6j+9NYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1676555471; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=oLQJFu/YeHJZ+e6PfLY6thqunBy9QxUaZpPGg1FO/6c=; 
	b=TZjmtyk4aNX8lmMDa8z05GXFEswC/XBFhHCG7FcGwH+yGYwufq4MqXV1qUL3rJvrt+cbW0eITS/EX9lqq/1YARtTPQ08KQXu/wvpzqS+mgA4we6WbNKGoUbK9Ca+ZY5atYQCyRGVuL7dRuPaoxJkd1YvmBgcYfkKdgHme+J6jqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1676555471;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oLQJFu/YeHJZ+e6PfLY6thqunBy9QxUaZpPGg1FO/6c=;
	b=gpemIUQvj1NFOsbN+oIYoYJhtN85CpnezhoiwOevE2FgZUTT82C5P0v41oOomAth
	5+e/V+j7szwyaemk5Z0DndHE5YFJt0orAMRyHIdwzjg3Kk/kAnY/hXCXTYV3x1X9Rne
	zbN+TM9mUbHjGtk1euDfw9IYlekPufisbh5I22b0=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1676555466955976.4479803295967; Thu, 16 Feb 2023 05:51:06 -0800 (PST)
Message-ID: <88ef812b-b8e8-f640-f9f7-a1579ea69d31@arinc9.com>
Date: Thu, 16 Feb 2023 16:50:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] pinctrl: add mt7981 pinctrl driver
To: Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Sam Shih <sam.shih@mediatek.com>,
 Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674693008.git.daniel@makrotopia.org>
 <ef5112946d16cacc67e65e439ba7b52a9950c1bb.1674693008.git.daniel@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ef5112946d16cacc67e65e439ba7b52a9950c1bb.1674693008.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055123_607024_73772E17 
X-CRM114-Status: GOOD (  15.33  )
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

Hi Daniel,

On 26.01.2023 03:34, Daniel Golle wrote:
> Add pinctrl driver for the MediaTek MT7981 SoC, based on the driver
> which can also be found the SDK.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/pinctrl/mediatek/Kconfig          |    5 +
>   drivers/pinctrl/mediatek/Makefile         |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7981.c | 1048 +++++++++++++++++++++
>   3 files changed, 1054 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7981.c
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index fed02c6fea062..f20c28334bcbf 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -127,6 +127,11 @@ config PINCTRL_MT7622
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_MOORE
>   
> +config PINCTRL_MT7981
> +	bool "Mediatek MT7981 pin control"
> +	depends on OF
> +	select PINCTRL_MTK_MOORE
> +

Is there a reason why you removed these lines from v1?

+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK

Arınç

