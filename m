Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHOgfgpsW4nLwBuEGDxTTlUsfxO97qAiq25aqMImeVw=; b=qxh8CXJMuY57KhPdWx+lqvJVMw
	WZztL1RcxHWbIms4lF7qxK7GBkufVw8xqqlWmERB4B5R3K8yU/tfHZoEU7wUE7qNFi8RN/quU7iKY
	shm1udE4kXkUyhbW8SBTCHKrkBNH6FZQf8dhkxk1UGZuIv2gxKnXAEBCcccxdV6JycxrzylL8F5Su
	AitPI5W5vE7piBsq+GgjZvYehFSnuL89sOghG0EJ4yQmWVrL/7AG3FKohhEQsH7t85KtX/DQXNyhv
	mopXUNnlI73cit31UU5S4tiRp0uyVCB8OuLhPgcrr9UYApsGgJU+r8oCGXpdLmTXqoGOCvYNc9qYu
	/gm4Ze6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AXF-007SjD-Vs; Fri, 17 Jun 2022 11:53:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AX2-007SYP-Q8; Fri, 17 Jun 2022 11:52:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id me5so8327271ejb.2;
        Fri, 17 Jun 2022 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KHOgfgpsW4nLwBuEGDxTTlUsfxO97qAiq25aqMImeVw=;
        b=BqF4RNXYk8K9Iki1F0cYB6z5xz4WvyB8IdQMN3FibIqvi4eC6c9/ond0wRlZeItNgk
         S7DSgmRy3o8tpw199K29JdFbEjmQQ/8Q2rz07ukpGjVtZNIF7A2hjyiuU4y8dqXzc1WG
         ReOb26yMlOEd82dLckIaAnfsCBAK6VuB5IS1Sr3lr0DLLQNSdYQGIC4RE82edvMODEMD
         lYlR39ePqrJEMPK32htuNnC6Dx4DQfwM2HwOq89hVkpox8iUvM15xkAvAaTvzKsM5w0j
         Q5zwurv0nzezllB7hSqF0wTY9jXBbHvL1aGqOD7dglinF/ctclE6QRqOxV8Hsd0Liy1Z
         v7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KHOgfgpsW4nLwBuEGDxTTlUsfxO97qAiq25aqMImeVw=;
        b=byLEhjrCn1Lm0IDh/As/jgU6ssl9hAYBdhEo4tmcae54LEKDGhhDNh4zlPz6hWcFmn
         ji9RLX3lP764DXZk5KYkoKNnmxrkJlnY05xlyqxObtxTGVlhw8jRNxqSLzGFSAOWj9S6
         3bP6KTfvnde+mt4okIFryZnNaDar6XAeKwj3xbxj+afVMlHA14z/pK80ocxn8gzLbj2N
         OmVHLFjGUKjwEkafrvtcncI//CABmx4jNwXIh+y/P+BC/MMhbK0MPumIcM/LFSrpr3FW
         wVLcXo4wevv+UGpt8PXgmsVy4u5vDnOPYB1XH/fqS1qqwp6qHFQfT/5J3yW+JdiyBv0e
         CdjA==
X-Gm-Message-State: AJIora+pHTcmg6M5/u95Smy8iTuLPYiU0L59UT2LrFLZrGILokO33mAK
	Jz0FmaMYcU/7XBvrIjmEwrw=
X-Google-Smtp-Source: AGRyM1v0irqam6RwrJGC2OGEDr+fATI2OcyCqhfg2eJzqSagIOarK5ERGfmnR1AJMfTc+aLeDL4feQ==
X-Received: by 2002:a17:907:971b:b0:711:dc09:fde1 with SMTP id jg27-20020a170907971b00b00711dc09fde1mr8799237ejc.749.1655466768089;
        Fri, 17 Jun 2022 04:52:48 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id kx8-20020a170907774800b006ff802baf5dsm2084866ejc.54.2022.06.17.04.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 04:52:47 -0700 (PDT)
Message-ID: <eb498209-3d5f-b60a-b596-4d3f46b5f9b1@gmail.com>
Date: Fri, 17 Jun 2022 13:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] soc: mediatek: Add support always on flag
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220617095841.23031-1-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220617095841.23031-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_045256_905765_37E3A4B6 
X-CRM114-Status: GOOD (  25.67  )
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



On 17/06/2022 11:58, Chunfeng Yun wrote:
> There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
> used by PCIe, when power off its mtcmos, need software reset it
> (workaround way, usually hardware do it, but has an issue on mt8195),
> but it has side effect to USB2 phy(works with USB3 phy to support
> USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make its
> power always on;
> Another reason is that USB3.2 Gen1/2 need keep power always on when
> support runtime-pm due to hardware limitation until now;
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

I changed the subject line to add pm-domains to it. Also Reviewed-by tags come 
under the patch author Signed-off-by tag.

For the next time, please try to get a better commit message. It's difficult to 
understand when reading the first time.

Applied, thanks!

> ---
> v4: add reviewed-by AngeloGioacchino
> 
> v3: make always-on flag exclusive with defualt-off flag
> 
> v2: keep active_wakeup flag for mt8195
> ---
>   drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
>   drivers/soc/mediatek/mtk-pm-domains.c    | 3 +++
>   drivers/soc/mediatek/mtk-pm-domains.h    | 2 ++
>   3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
> index 938f4d51f5ae..0529d130b675 100644
> --- a/drivers/soc/mediatek/mt8195-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8195-pm-domains.h
> @@ -67,7 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
>   		.ctl_offs = 0x334,
>   		.pwr_sta_offs = 0x174,
>   		.pwr_sta2nd_offs = 0x178,
> -		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_ALWAYS_ON,
>   	},
>   	[MT8195_POWER_DOMAIN_CSI_RX_TOP] = {
>   		.name = "csi_rx_top",
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 5ced254b082b..a3dae391a38a 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -428,6 +428,9 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
>   			goto err_put_subsys_clocks;
>   		}
> +
> +		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> +			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
>   	}
>   
>   	if (scpsys->domains[id]) {
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index daa24e890dd4..7d3c0c36316c 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -8,6 +8,8 @@
>   #define MTK_SCPD_SRAM_ISO		BIT(2)
>   #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>   #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
> +/* can't set MTK_SCPD_KEEP_DEFAULT_OFF at the same time */
> +#define MTK_SCPD_ALWAYS_ON		BIT(5)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210

