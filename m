Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E36C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 23:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3LwCz1aU/kXQ72xZFgj5Bh5vpHchd70TfX75AzssXE=; b=JRaKRtQUjudKCs
	UAR8ph290ijy1Uisk0OqEi8DKjJQYOC4uE664Krg0N28iif5+Y6vyc4jHfH67aWKkZnjn8GWt1FoU
	WvMnRV6s7ib3dhgy3gZ4M7c1Ly2vkL+FxRSWEMWpm5oZM7Pcd5ht1Vi1mItJwfb/L+uNQ4p1dbnaW
	P4xttrVRKL6ipjlh9QvVXzoRfaZhns1xh8qHjIUI9Bgq5xQGrR6WtNhQG9nxEGevofB1sSiUPrDQr
	TEI0TZufZoR0ys9ksxtcrva5pvDtLvY+KTCVHW5ZGtgU8Vw7am0RlI/u2UkLg8zjykuRy9pGzmfE2
	bTVKTRs4uwRnwezzof2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS5ga-00Amnm-Ma; Wed, 09 Mar 2022 23:25:40 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS5gR-00AmlJ-Mv
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 23:25:33 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 8A970B125
 for <linux-mediatek@lists.infradead.org>; Wed,  9 Mar 2022 17:25:25 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id S5gLnRbjN22u3S5gLnBMpy; Wed, 09 Mar 2022 17:25:25 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j2oKgn9eLs375qgfE96Bspnkel26NAPBR0e3aVigLuw=; b=VCjIdmK58ynNO/iJx0ibGOYrGa
 Xz6VUjXhlFYjVIKSabx4AgiaYKW/pZuFAINqpRTo1en+nDXx8LaG7u095SUH7ntqjrjQEVQcPLSpB
 mjExvyJQ+k36LQfCMBZQN4C3mDnIUdcPki3diEXSZ9WjOz5r5rQ6Jo6P4llFXS3JAKVmFk/BfonG7
 IMzq0DZa62vEuUy2PVzwIh2pxz9dhTHIWiQpNLUFL9QyPAm46dG2jhEjyWcAhDSC8XT9G7Mk4LZDc
 w3jffoxYlBhkZe1nDzeWZraDQp4ffh64VwFQwPBNUS6Sj3UNYlgDIAz3INC2gNW3qYrC33qOES3eo
 zaj0V5hg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57414 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nS5gK-000V88-Nj; Wed, 09 Mar 2022 23:25:24 +0000
Date: Wed, 9 Mar 2022 15:25:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Ryder Lee <ryder.lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt7986: Add reset-controller
 header file
Message-ID: <20220309232523.GA3804043@roeck-us.net>
References: <20220105100456.7126-1-sam.shih@mediatek.com>
 <20220105100456.7126-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105100456.7126-2-sam.shih@mediatek.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5gK-000V88-Nj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57414
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 83
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_152531_892046_03644922 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 05, 2022 at 06:04:55PM +0800, Sam Shih wrote:
> Add infracfg, toprgu, and ethsys reset-controller header file
> for MT7986 platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/dt-bindings/reset/mt7986-resets.h | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt7986-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt7986-resets.h b/include/dt-bindings/reset/mt7986-resets.h
> new file mode 100644
> index 000000000000..af3d16c81192
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt7986-resets.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Sam Shih <sam.shih@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT7986
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT7986
> +
> +/* INFRACFG resets */
> +#define MT7986_INFRACFG_PEXTP_MAC_SW_RST	6
> +#define MT7986_INFRACFG_SSUSB_SW_RST		7
> +#define MT7986_INFRACFG_EIP97_SW_RST		8
> +#define MT7986_INFRACFG_AUDIO_SW_RST		13
> +#define MT7986_INFRACFG_CQ_DMA_SW_RST		14
> +
> +#define MT7986_INFRACFG_TRNG_SW_RST		17
> +#define MT7986_INFRACFG_AP_DMA_SW_RST		32
> +#define MT7986_INFRACFG_I2C_SW_RST		33
> +#define MT7986_INFRACFG_NFI_SW_RST		34
> +#define MT7986_INFRACFG_SPI0_SW_RST		35
> +#define MT7986_INFRACFG_SPI1_SW_RST		36
> +#define MT7986_INFRACFG_UART0_SW_RST		37
> +#define MT7986_INFRACFG_UART1_SW_RST		38
> +#define MT7986_INFRACFG_UART2_SW_RST		39
> +#define MT7986_INFRACFG_AUXADC_SW_RST		43
> +
> +#define MT7986_INFRACFG_APXGPT_SW_RST		66
> +#define MT7986_INFRACFG_PWM_SW_RST		68
> +
> +#define MT7986_INFRACFG_SW_RST_NUM		69
> +
> +/* TOPRGU resets */
> +#define MT7986_TOPRGU_APMIXEDSYS_SW_RST		0
> +#define MT7986_TOPRGU_SGMII0_SW_RST		1
> +#define MT7986_TOPRGU_SGMII1_SW_RST		2
> +#define MT7986_TOPRGU_INFRA_SW_RST		3
> +#define MT7986_TOPRGU_U2PHY_SW_RST		5
> +#define MT7986_TOPRGU_PCIE_SW_RST		6
> +#define MT7986_TOPRGU_SSUSB_SW_RST		7
> +#define MT7986_TOPRGU_ETHDMA_SW_RST		20
> +#define MT7986_TOPRGU_CONSYS_SW_RST		23
> +
> +#define MT7986_TOPRGU_SW_RST_NUM		24
> +
> +/* ETHSYS Subsystem resets */
> +#define MT7986_ETHSYS_FE_SW_RST			6
> +#define MT7986_ETHSYS_PMTR_SW_RST		8
> +#define MT7986_ETHSYS_GMAC_SW_RST		23
> +#define MT7986_ETHSYS_PPE0_SW_RST		30
> +#define MT7986_ETHSYS_PPE1_SW_RST		31
> +
> +#define MT7986_ETHSYS_SW_RST_NUM		32
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7986 */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
