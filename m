Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A1CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 01:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8113160F41
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 01:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8113160F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaATUHQW6qaa8NgnAwnUH3EZYhensntFbkP5iL4Ery0=; b=Y+P2XTSoQ9Rr7I
	iNmmeZyt7vxYEoIz5MeOAzyywXYFhrkO/foCSdJSMV6xOUZAFAbEAW8dzEpkOFMEE5RmHEljWTQas
	I3kFKdqtELf68tk6DwHOeJifq5iRGMXmPXJqDPe+jG+nrd409N+QTqWZXpr0c/tf/Fhc6Zz+X8gEl
	FmtRq/7Ys77GNZq+egFVS3giPxiJsWI83gIdW4GX5CdN5y17LCmoGoqiYuDYeZsDL8QWhc6eB09IA
	Y6xpkmrcb098S+pIIaydBxnaOkLYzoGGQvdYrAJ0rekxuNiYIs15+5pzHhJXllo3SMooocgixk3ZX
	Usapo30SV7X5nVUtY8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8YTt-00GnXm-Se; Wed, 28 Jul 2021 01:35:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8YTd-00GnVU-DV; Wed, 28 Jul 2021 01:35:20 +0000
X-UUID: 2264ea6cf28a4cafb0313a34e612beef-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tystcQCeK1JokSJpr3jNYbyoX8+NJdw5MNRuzT9Nl1s=; 
 b=B5YTcTWL9N2Ccfi/OHpSmHeQ1b5DSpNGkjNIucKMFWfNzier6BvpJ/OC9il7NL3B1NQCPxjNGQXCW/WBvxH/c0kJv8QuGKkvSn7x024/8rJD8bSMUJFrkBNlpLXaBwnQhuMB2iSh92KC0Hcv0bLiz67/4HtV0FlyXwJ4I3krgP8=;
X-UUID: 2264ea6cf28a4cafb0313a34e612beef-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1123893777; Tue, 27 Jul 2021 18:35:13 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:35:06 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Jul 2021 09:35:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 09:35:03 +0800
Message-ID: <1627436103.31194.3.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] phy: introduce phy mode PHY_MODE_UART and
 phy_get_mode_ext()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
CC: <linux-phy@lists.infradead.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Mediatek WSD Upstream
 <wsd_upstream@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 28 Jul 2021 09:35:03 +0800
In-Reply-To: <1627383013-4535-1-git-send-email-macpaul.lin@mediatek.com>
References: <1627383013-4535-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_183517_507632_721966D2 
X-CRM114-Status: GOOD (  23.06  )
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

On Tue, 2021-07-27 at 18:50 +0800, Macpaul Lin wrote:
> Some embedded platform shared PINs between USB and UART.
> 
> For example, some phone will use special cable detection in boot loader
> to switch USB port function into UART mode. Hence Kernel need to query
> the hardware state from PHY registers to confirm the initialzation flow
> for PHY and USB driver.
> 
> To support this kind of PIN switch, new PHY MODE and query API is
> required. Here we introduce a new PHY mode: PHY_MODE_UART.
> 
> API phy_get_mode_ext() can be used to query the MODE from hardware
> instead of reading it from phy attributes.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/phy/phy-core.c  |   17 +++++++++++++++++
>  include/linux/phy/phy.h |    3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index ccb575b..b8f6539 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -373,6 +373,23 @@ int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_mode_ext);
>  
> +int phy_get_mode_ext(struct phy *phy)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->get_mode_ext)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->get_mode_ext(phy);
> +	if (!ret)
> +		ret = phy->attrs.mode;
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_mode_ext);
> +
>  int phy_set_media(struct phy *phy, enum phy_media media)
>  {
>  	int ret;
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 0ed434d..7d32c6b 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -34,6 +34,7 @@ enum phy_mode {
>  	PHY_MODE_USB_DEVICE_HS,
>  	PHY_MODE_USB_DEVICE_SS,
>  	PHY_MODE_USB_OTG,
> +	PHY_MODE_UART,
>  	PHY_MODE_UFS_HS_A,
>  	PHY_MODE_UFS_HS_B,
>  	PHY_MODE_PCIE,
> @@ -70,6 +71,7 @@ enum phy_media {
>   * @power_on: powering on the phy
>   * @power_off: powering off the phy
>   * @set_mode: set the mode of the phy
> + * @get_mode_ext: get the extented mode of the phy
>   * @set_media: set the media type of the phy (optional)
>   * @set_speed: set the speed of the phy (optional)
>   * @reset: resetting the phy
> @@ -83,6 +85,7 @@ struct phy_ops {
>  	int	(*power_on)(struct phy *phy);
>  	int	(*power_off)(struct phy *phy);
>  	int	(*set_mode)(struct phy *phy, enum phy_mode mode, int submode);
> +	int	(*get_mode_ext)(struct phy *phy);
>  	int	(*set_media)(struct phy *phy, enum phy_media media);
>  	int	(*set_speed)(struct phy *phy, int speed);
>  
add prototype of phy_get_mode_ext(struct phy *phy) for both cases that
CONFIG_GENERIC_PHY is enabled or not in linux/phy/phy.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
