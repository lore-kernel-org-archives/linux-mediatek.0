Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6B2C47089
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVa4SBMWf0cJk973qfgmDDD5XVUgzDvkwfsTpMSYivQ=; b=Nvr24SddXJOrW5rygs+L35rapJ
	ToJ/xNitIJnlZe/FdAJOFp4sqXGbzKBquG1rt8/oyGhtjPOqJpMEzWTQlKUGa4oYqg1Qcoc/EPqrM
	XG6GO6xt/QpXlTfxDb8pKCqN08jeiNAwWIZl6Sps0aa/r8+Pk4NSMxRKKC8E4jv4UaZzMfh5v+iyW
	m3I2pbJ6CeP4n8ou1KQsN7mLVPLliQmqALsKbCjqhQHBsbD041kNTkrcSDDvp6K9oKAJ205K1srxF
	k2HPJQnI7HYlIJfQ2636+dlEiMySwf2i9G4eReeyVNUsaW4p0+59+ZpUibIvD95yPPFSr01L6y/KG
	OcUzeaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ubG-00ArtG-VZ; Sun, 04 Dec 2022 19:24:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1u6Y-00APnN-8F
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 18:52:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id qk9so5276993ejc.3
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVa4SBMWf0cJk973qfgmDDD5XVUgzDvkwfsTpMSYivQ=;
        b=CUKaXErfIsP67bFO/VqI2crHhKyX6YmMOE1PKmCgRdEUaZqHUsmeW/WQdBVzF25lvd
         FlfXhVb+DNKUaRfjDvml1dna7L4CTTUNZzaVTceLZ7OiHLSF0lYN09poBg4fo4N+PlTW
         JMsalZ830SiPX477zBmT3sMOU3h0UmH6tZbLJAT2iDtIKEn+utNnbH0JeGtaMuzxsHOu
         UVOQk/Ey7yTmU3uDvRpWpPr2Gf2/yPbC8oFsMUK6PYnnZ4iylG0AwqCsiKYnvvXtJhhD
         eNBOgVSbniCqXQbmqLZaXneyoczPE3sA/jEmftGicbM6kMlhoyg/CxXyYj0sZp/r21l0
         5mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVa4SBMWf0cJk973qfgmDDD5XVUgzDvkwfsTpMSYivQ=;
        b=uHuwbPRVvwlE2u0dqJnDDra/KjgQA8FQYMgWvIw+xE8vwdIEu0/cLsm/KW4MOUoHUu
         lAeYFUzBXN9HxyFPg3GLQ79xfFhAc2kRARVJWuaFeZVHB/g/7S4EgQr2ZaC3rdqJVk91
         XghOjn4Dk5xCuWB/oO57hradWIGHsFv0RvV8YwGUwgKCskcjxw7tfOP/sA5fR79lSlqe
         kcP8GAIXBzvzDT2BNUbqKDo8x2z1zPoXcnsXXDBt8fDKzQ0nNTn95W2wi3gddu4QfM1F
         JCQj4iTySlLnZtUzfZ0hvrwDvd3me7nNfjEZXICPLURP+hIDEpzsmAWRqH5LVYnz2BSy
         Qgdw==
X-Gm-Message-State: ANoB5pk97Rdyrrn9jMrdK5EKhTGiaKWqCDQGrFFXp1ND1fDUOAnyOv+6
	R/UJpYkW0rCmeCd9zFDUCj4=
X-Google-Smtp-Source: AA0mqf55UyAUjqtIhhPbAj06nf+q+dxwAswo2zKiXaK4oZA9xv1RSCwv6Ru1aDgJhZv8q2pvkSo4RA==
X-Received: by 2002:a17:907:a0ca:b0:7c0:b4bc:eed3 with SMTP id hw10-20020a170907a0ca00b007c0b4bceed3mr12331981ejc.735.1670179963240;
        Sun, 04 Dec 2022 10:52:43 -0800 (PST)
Received: from [192.168.1.101] ([37.252.91.128])
        by smtp.gmail.com with ESMTPSA id i9-20020a170906698900b007bff9fb211fsm5408674ejr.57.2022.12.04.10.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 10:52:42 -0800 (PST)
Message-ID: <64aada78-8029-1b05-b802-a005549503c9@gmail.com>
Date: Sun, 4 Dec 2022 22:52:38 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH net-next v1 01/13] net: wwan: tmi: Add PCIe core
Content-Language: en-US
To: Yanchao Yang <yanchao.yang@mediatek.com>
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev ML <netdev@vger.kernel.org>,
 kernel ML <linux-kernel@vger.kernel.org>,
 MTK ML <linux-mediatek@lists.infradead.org>, Liang Lu
 <liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>,
 Hua Yang <hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>,
 Felix Chen <felix.chen@mediatek.com>,
 Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong <min.dong@mediatek.com>,
 Aiden Wang <aiden.wang@mediatek.com>,
 Guohao Zhang <guohao.zhang@mediatek.com>,
 Chris Feng <chris.feng@mediatek.com>,
 Lambert Wang <lambert.wang@mediatek.com>,
 Mingchuang Qiao <mingchuang.qiao@mediatek.com>,
 Xiayu Zhang <xiayu.zhang@mediatek.com>,
 Haozhe Chang <haozhe.chang@mediatek.com>,
 MediaTek Corporation <linuxwwan@mediatek.com>
References: <20221122111152.160377-1-yanchao.yang@mediatek.com>
 <20221122111152.160377-2-yanchao.yang@mediatek.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20221122111152.160377-2-yanchao.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_105246_376401_3984F385 
X-CRM114-Status: GOOD (  22.96  )
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

Hello Yanchao,

On 22.11.2022 15:11, Yanchao Yang wrote:
> From: MediaTek Corporation <linuxwwan@mediatek.com>
> 
> Registers the TMI device driver with the kernel. Set up all the fundamental
> configurations for the device: PCIe layer, Modem Host Cross Core Interface
> (MHCCIF), Reset Generation Unit (RGU), modem common control operations and
> build infrastructure.
> 
> * PCIe layer code implements driver probe and removal, MSI-X interrupt
> initialization and de-initialization, and the way of resetting the device.
> * MHCCIF provides interrupt channels to communicate events such as handshake,
> PM and port enumeration.
> * RGU provides interrupt channels to generate notifications from the device
> so that the TMI driver could get the device reset.
> * Modem common control operations provide the basic read/write functions of
> the device's hardware registers, mask/unmask/get/clear functions of the
> device's interrupt registers and inquiry functions of the device's status.
> 
> Signed-off-by: Ting Wang <ting.wang@mediatek.com>
> Signed-off-by: MediaTek Corporation <linuxwwan@mediatek.com>
> ---
>   drivers/net/wwan/Kconfig                 |   11 +
>   drivers/net/wwan/Makefile                |    1 +
>   drivers/net/wwan/mediatek/Makefile       |   12 +
>   drivers/net/wwan/mediatek/mtk_common.h   |   30 +
>   drivers/net/wwan/mediatek/mtk_dev.c      |   50 +
>   drivers/net/wwan/mediatek/mtk_dev.h      |  503 ++++++++++
>   drivers/net/wwan/mediatek/pcie/mtk_pci.c | 1164 ++++++++++++++++++++++
>   drivers/net/wwan/mediatek/pcie/mtk_pci.h |  150 +++
>   drivers/net/wwan/mediatek/pcie/mtk_reg.h |   69 ++
>   9 files changed, 1990 insertions(+)
>   create mode 100644 drivers/net/wwan/mediatek/Makefile
>   create mode 100644 drivers/net/wwan/mediatek/mtk_common.h
>   create mode 100644 drivers/net/wwan/mediatek/mtk_dev.c
>   create mode 100644 drivers/net/wwan/mediatek/mtk_dev.h
>   create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.c
>   create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.h
>   create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_reg.h
> 
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 3486ffe94ac4..a93a0c511d50 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -119,6 +119,17 @@ config MTK_T7XX
>   
>   	  If unsure, say N.
>   
> +config MTK_TMI
> +	tristate "TMI Driver for Mediatek T-series Device"
> +	depends on PCI
> +	help
> +	  This driver enables Mediatek T-series WWAN Device communication.
> +
> +	  If you have one of those Mediatek T-series WWAN Modules and wish to
> +	  use it in Linux say Y/M here.

 From this and the series descriptions, it is unclear which modem chips 
this driver is intended for and how does it correlate with the T7xx 
driver? Is the TMI driver a drop-in replacement for the t7xx driver, or 
does the TMI driver support any T-series chips except t7xx?

> +
> +	  If unsure, say N.
> +
>   endif # WWAN
>   
>   endmenu
> diff --git a/drivers/net/wwan/Makefile b/drivers/net/wwan/Makefile
> index 3960c0ae2445..198d8074851f 100644
> --- a/drivers/net/wwan/Makefile
> +++ b/drivers/net/wwan/Makefile
> @@ -14,3 +14,4 @@ obj-$(CONFIG_QCOM_BAM_DMUX) += qcom_bam_dmux.o
>   obj-$(CONFIG_RPMSG_WWAN_CTRL) += rpmsg_wwan_ctrl.o
>   obj-$(CONFIG_IOSM) += iosm/
>   obj-$(CONFIG_MTK_T7XX) += t7xx/
> +obj-$(CONFIG_MTK_TMI) += mediatek/

The driver is called mtk_tmi, but its code is placed to the directory 
with too generic name 'mediatek'. Do you plan too keep all possible 
future drivers in this directory?

--
Sergey

