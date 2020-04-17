Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F95FC2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 05:35:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD09D21D91
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 05:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+Yw1ao4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gkrEUm3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD09D21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okj/EBn5NQcad8ArGyCgiizMO84aMqrWKfjOWUgn0aQ=; b=u+Yw1ao4wT09KC
	R3leSMvAzYrNpq7rArajn3mI3ga09+lQ6JrchqSny1GprXCEDZCBpMB4L5W/HVL4fRuhRu0malU3c
	MMxGgieoym6TbFx0uEfJ1MPNVOUBWBUsgEqMoIoJLTzmOEZ+hVB5F5muiVoiTLyQ73xl/X20KoV7+
	tpc5c0DVTON2XtWtCWftsBOrYDnSrcWn6S+iu21yO+kH+p0mQFgndBnmDE2VWs4/ZQtvqy4Q/ZSXk
	O03wewc6Cslak/8iJd87sPo4Ej4WcVJf+Ectz2D317f/1tTZEmNLvAgwvRdCsh461r4rWvGGQS4Z1
	XfORTxH6VmTHX2TLjUXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPJeX-0000rj-CX; Fri, 17 Apr 2020 05:35:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPJeU-0000qs-5V; Fri, 17 Apr 2020 05:34:59 +0000
X-UUID: 78cd0454403c4b22b5356deedeaedd5b-20200416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bUFVZsbh1IFtMkOupYY4so6J8bYhLyH6LTR/8vJHYYg=; 
 b=gkrEUm3w60ugcgkguxL1Bn4Ig9RN61y4MGn+YRCsokMcs7qvTVlq3kX7a/xDRXhTNHsjwBRUEdHF+MEBne7QFcHBmkHFwV8vy8YxzJmdE7ztFugu25oToBT8eOYpqtyxqOqa0kdf3gFut8wpPbu89oZK76igo1/XU1Zt2zMPZ0A=;
X-UUID: 78cd0454403c4b22b5356deedeaedd5b-20200416
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1805863052; Thu, 16 Apr 2020 21:34:49 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Apr 2020 22:34:52 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Apr 2020 13:34:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Apr 2020 13:34:47 +0800
Message-ID: <1587101661.28772.40.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] phy: phy-mtk-tphy: introduce force_vbus for u2 phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Fri, 17 Apr 2020 13:34:21 +0800
In-Reply-To: <1587100986-3104-2-git-send-email-macpaul.lin@mediatek.com>
References: <1587100986-3104-1-git-send-email-macpaul.lin@mediatek.com>
 <1587100986-3104-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF05952D618A127CD5818E03CF14DCD593C923CD996704F9E83F26F467CE44782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_223458_209567_20945751 
X-CRM114-Status: GOOD (  16.74  )
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
Cc: devicetree@vger.kernel.org, Mediatek WSD
 Upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.Guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Macpaul,

On Fri, 2020-04-17 at 13:23 +0800, Macpaul Lin wrote:
> For some platforms, they don't have vbus pin connection between usb phy and
> mac. Hence we need to control force_vbus related registers to keep hardware
> works normal.
> This patch add corresponding behavior of force vbus in u2 phy related
> functions.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
NACK, I tried to support it early, but found this will cause some issue
for SS/SSP device only mode, so please abandon this patch, thanks


> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index cdbcc49f7115..46f0fea175e5 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -99,6 +99,7 @@
>  
>  #define U3P_U2PHYDTM1		0x06C
>  #define P2C_RG_UART_EN			BIT(16)
> +#define P2C_FORCE_VBUSVALID		BIT(13)
>  #define P2C_FORCE_IDDIG		BIT(9)
>  #define P2C_RG_VBUSVALID		BIT(5)
>  #define P2C_RG_SESSEND			BIT(4)
> @@ -318,6 +319,7 @@ struct mtk_tphy {
>  	int nphys;
>  	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
>  	int src_coef; /* coefficient for slew rate calibrate */
> +	bool force_vbus;
>  };
>  
>  static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
> @@ -611,13 +613,20 @@ static void u2_phy_instance_set_mode(struct mtk_tphy *tphy,
>  	switch (mode) {
>  	case PHY_MODE_USB_DEVICE:
>  		tmp |= P2C_FORCE_IDDIG | P2C_RG_IDDIG;
> +		if (tphy->force_vbus)
> +			tmp |= P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID;
>  		break;
>  	case PHY_MODE_USB_HOST:
>  		tmp |= P2C_FORCE_IDDIG;
> -		tmp &= ~P2C_RG_IDDIG;
> +		if (tphy->force_vbus)
> +			tmp &= ~(P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID);
> +		else
> +			tmp &= ~P2C_RG_IDDIG;
>  		break;
>  	case PHY_MODE_USB_OTG:
>  		tmp &= ~(P2C_FORCE_IDDIG | P2C_RG_IDDIG);
> +		if (tphy->force_vbus)
> +			tmp &= ~(P2C_RG_VBUSVALID | P2C_FORCE_VBUSVALID);
>  		break;
>  	default:
>  		return;
> @@ -1187,6 +1196,11 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>  			retval = PTR_ERR(instance->da_ref_clk);
>  			goto put_child;
>  		}
> +
> +		/*
> +		 * On some platform, vbus is dis-connected between PHY and MAC.
> +		 */
> +		tphy->force_vbus = device_property_read_bool(dev, "force_vbus");
>  	}
>  
>  	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
