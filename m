Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E075C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYyE/taaFQxdJOUMcTNaafHp1n1FddPhXA/xMaCsMQg=; b=ScySpDAgiDbN+r
	kgyrMM5Q6GOeIN1LCVWp5wVqUY+2OTiIcR+VrvJ0pDMBJmS88OF4QXqXgXYcOgWIZTKT94xkhEB0S
	zPvwPGdjx8RQondRppmfo5n9SkFUHvbO/eikETHV0YJ+SnZTYMtLxtONODrk5JgVqWb4vqQoSO1MA
	R6X8Ji6oUBe7L4jj/GzJaHZMpnYhWKxcZz+xgAJ1lDkL5DRhv7pTM1W1aUO4HmMvRJ0lBz7aHwIxk
	wo6FEqLIBZVS+rRAnU1RCt0RgwdKIoIbjCdTjP8jV9ai0cjNEC7hetDFAdRtJldsMwxCMJ8Z8y6iQ
	w5LPcD3u61cPjsaHbECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFeC-000ilk-63; Mon, 07 Mar 2022 15:51:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFdq-000iZW-CX; Mon, 07 Mar 2022 15:51:24 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0E2B30B;
 Mon,  7 Mar 2022 16:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646668278;
 bh=SfxEEhRPvuDd44PxQZDXnX/DJ2LqiwGXoarMuJp/ZM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V8ImryOJpGHpy5ygU0+dU6R2BhB3NGcuHbiW2AFKjATgPv9k2CQe2tGPptepqjkK5
 diWkulTMnS2WWAi4ycvJW5/QCFZNvk9B93dackkT/b7YjSFI2YgRAGlOgQmR9dwvkU
 fXI6DpLrdmaARIp54QP+2+HuL7TIsF240W0BxaZg=
Date: Mon, 7 Mar 2022 17:51:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v1 0/2] Revert vendor property from anx7625 bindings
Message-ID: <YiYp6bKJPdIoKD+f@pendragon.ideasonboard.com>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307154558.2505734-1-robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_075122_609252_E8E89E7E 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Rob,

Thank you for the patch.

On Mon, Mar 07, 2022 at 04:45:56PM +0100, Robert Foss wrote:
> An issue[1] related to how the V4L2_FWNODE_BUS_TYPE_PARALLEL flag is mis-used
> was found in recent addition to the anx7625 driver.
> 
> In order to not introduce this issue into the ABI, let's revert the changes
> to the anx7625 dt-binding related to this.
> 
> [1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/
> 
> Robert Foss (2):
>   Revert "dt-bindings:drm/bridge:anx7625:add vendor define"
>   Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
>     endpoint"

If this is enough to avoid the wrong bus-type becoming an ABI, even if
the corresponding driver support isn't reverted, then, for the whole
series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
>  .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 -
>  2 files changed, 2 insertions(+), 65 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
