Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7E1C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD3C238EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD3C238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=15K+kHSqRHwHnJOIYWUQYdilxXdAm1lCgcU9cTwRtBQ=; b=ZumVZI0QMhAuOASzDjywAzp1u
	jKYwi9sYJmQJfI/wnYleavDwLHfddAiuBN7g7UtQq35VzuDjBmE+W04VmuAy8nhhjmPQDhrbk3ikC
	Bo2TmfRsu0WdQKS6r4Q+OaKWcSUiH6DcXCSkXPVxMd+/Vg+U0ZTlc8kXqnNYm++OBH9Ya0NDLZLh3
	8mgcADbkbjfYtlwUTXhH8KQxoxZXTWhR2UFLRiYh29GQUFzyZrIzPq7Fx+YLkqMGul1YhaJea3PUI
	feazVj6nmKVij9rB8khkwICEio9As/F7NsfXesXDTllE/eX2qjKZBQgHJvFXJ2k5kODBDcFxnoagn
	TLTf4KSYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TYN-0003jz-BX; Thu, 21 Jan 2021 06:34:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TYJ-0003ip-Qj; Thu, 21 Jan 2021 06:34:44 +0000
X-UUID: a8a52b1ae5fc4af0a95fa85b14b2ab97-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u/2JBongcc8EOmFCMEZfjQxigadfi0DwujXfFHAcodo=; 
 b=Bqwxte2tZ3n/5PkJnk6mDiQxGlK9q9hgB/NtFzAcYjH6fV5CE6S5dMQvQLs1j7XI1rFVEerUSEfI1o9cRopO8LnuHjyAaymhUUQwu0yieLdHrjJM3jHLpFkC+JjrJTjUbK7Hw0fDXB9YQ8/Yo5IscPslStq53FS5hkq0kNoqRQ4=;
X-UUID: a8a52b1ae5fc4af0a95fa85b14b2ab97-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <skylake.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 137973793; Wed, 20 Jan 2021 22:33:37 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 22:25:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:24:53 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:24:53 +0800
Message-ID: <1611210278.32249.12.camel@mtksdccf07>
Subject: Re: [PATCH v2] dts64: mt7622: fix slow sd card access
From: SkyLake Huang <skylake.huang@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
Date: Thu, 21 Jan 2021 14:24:38 +0800
In-Reply-To: <20210113180919.49523-1-linux@fw-web.de>
References: <20210113180919.49523-1-linux@fw-web.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_013443_986316_F0E85559 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Wenbin.Mei@mediatek.com, sin_wenjiehu <sin_wenjiehu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Jimin Wang <jimin.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-13 at 19:09 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Fix extreme slow speed (200MB takes ~20 min) on writing sdcard on
> bananapi-r64 by adding reset-control for mmc1 like it's done for mmc0/emmc.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v1:
>  - drop change to uhs-mode because mt7622 does not support it
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 5b9ec032ce8d..7c6d871538a6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -698,6 +698,8 @@ mmc1: mmc@11240000 {
>  		clocks = <&pericfg CLK_PERI_MSDC30_1_PD>,
>  			 <&topckgen CLK_TOP_AXI_SEL>;
>  		clock-names = "source", "hclk";
> +		resets = <&pericfg MT7622_PERI_MSDC1_SW_RST>;
> +		reset-names = "hrst";
This looks ok to me. I think it's also necessary to trigger software
reset for SD(mmc1) because loader(uboot) might mess up MSDC's registers.
"Software reset" here will reset registers of AHB/AXI bus domain, such
as MSDC_CFG[8:15]. msdc_reset_hw() in mtk-sd.c will only reset registers
of MSDC CK domain.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
