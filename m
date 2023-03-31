Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F0CC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAyGVXTjqAgQr1cR3LadNzJfCZDfBgbh7GubvqstaT8=; b=Xln7k/CMeItb2beXhl3t7zfRJw
	6E4JfL88+J0sKqFiam/pGSnKseZptKWWKaeKBKAwkP4h2VaERmrwau5nwdRQVcZlhBa5XUgK8pHBh
	I9SbL83IKZTXU2riKpjFRK+3qLV/NQRqHjLmfD1SrmjkiPKKMef2xshiUavhRQOg9rBDJEIAOwjvk
	GRn2O1M7ky44qhmMWE0E/qGR2F53Buk+Ct6kowRg8KMgpP4FUWeOSEkAqQ5HwGAtotzVt9Pvb1swq
	H08kNc/8DyYImu5h0YJHpZqtSIUiPmklNhsAEq7orqYZFXRzpfEcHp/Wv6BSdLm3s/uxUBTIOz/sP
	VJNsQxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBUP-006obZ-28;
	Fri, 31 Mar 2023 09:56:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBSb-006nTl-0H;
	Fri, 31 Mar 2023 09:54:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 425FD6603193;
	Fri, 31 Mar 2023 10:54:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256455;
	bh=hrO+9NSRC8A7pRF/PfGSFBIT/KlisRF3mp3XM93I+9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i7vMGsiqpc4TBi36g69n2gj5dnKhp2oOkO0RbZPHkL6W7UBYK+thNqPsLFj8W/MtR
	 WlAtxHP8JXf3wV14wbHag/8bnHhDRA4RTakbgUa6MW2xUEfyrH60u973tmetWUEfL5
	 QqqkoAH4MfhtFlf+/TmWkL5ebFEnKB6ReKHPf9tRlYJx3i7WhmqS3cxlaBYSlK3A1+
	 em2Z+2/S1Kr22cpzjYOB3v97/eDkZu2ss8Ku9LNv4vBFdA3gcML8sLS9OJYAkmSpUA
	 /hgf9Y+AzmU4iQ7skUgXb/KbVxNjvGyR32uz+Cprc8b2i0A1hvIpzoBU7ixpnUh/sn
	 VDlo3CCUKxTiA==
Message-ID: <f8ae97e2-ee51-1b70-4fc9-98d7655a7fb0@collabora.com>
Date: Fri, 31 Mar 2023 11:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 07/19] clk: mediatek: Add MT8188 ccusys clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-8-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-8-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025417_360637_0E296B03 
X-CRM114-Status: GOOD (  12.84  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>   drivers/clk/mediatek/Makefile         |  2 +-
>   drivers/clk/mediatek/clk-mt8188-ccu.c | 50 +++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index c235e9a0d305..fc4faee04636 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -102,7 +102,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186_VENCSYS) += clk-mt8186-venc.o
>   obj-$(CONFIG_COMMON_CLK_MT8186_WPESYS) += clk-mt8186-wpe.o
>   obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>   				   clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o
> -j-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o
> +obj-$(CONFIG_COMMON_CLK_MT8188_CAMSYS) += clk-mt8188-cam.o clk-mt8188-ccu.o

The 'obj' typo has to be fixed in patch [06/19], after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



