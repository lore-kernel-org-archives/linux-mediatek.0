Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B944C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 01:50:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6A720782
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 01:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vLvF3px9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k8jguoJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6A720782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kh7nFLYt5/l94DNxPFHqfAGLjqn3TKcDYQM0m1dp/U0=; b=vLvF3px9gITSwPVLdtpTKZm0r
	uZ60PSVCXTbmsgohhBrhB/FkYhjEw2H0OKeZOk6rAGryBG6VrxvDWC1MKtb1P9m5aqIWs77e7EBF2
	FJsGKQV3APEyfyiVRiXQ0Ytvf8JIpzYa31UM3x7RR6c6dovqN5FuLcareBi0FrNGRW2F8n3EPE108
	mh/ryGfTFzFcahUDDEZrmGJQijniu35Gz+Cm5Yfmoy/R4RF5dAMhuzcgvhdjwWlsw/Hj3zrTvoQE5
	tIyMuSaXd9KRK/FnsNXCN7z3/R5IZGYUryqjid2T3YfZ5CiCSmBO627TP2aB/xFvJHZEc3jEGi0ST
	6PbKcdlyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCYy5-0003gh-N2; Mon, 31 Aug 2020 01:50:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCYy4-0003g5-2b
 for linux-mediatek@lists.infradead.org; Mon, 31 Aug 2020 01:50:45 +0000
X-UUID: f3b02dbf40274bb9bef57f35748883e7-20200830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s+O33/eGp7dWd0QU6yX77AekPJjIOCIf4Necc446y1c=; 
 b=k8jguoJzrw39NfQqGy5IijQ8DDU073rlaB6CjvuclozdQeecUCgScz1jFckhTZF2sWjT97JlDzx/prAXHbfv0u1YyeX642O3Y3+RpfUXveplfvUmP/NNKxz9YEc0HdH6VkV0E61ziU5fTg1OgksZG4OqCK3fX5NccqxU0sgLcW0=;
X-UUID: f3b02dbf40274bb9bef57f35748883e7-20200830
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 282692300; Sun, 30 Aug 2020 17:50:37 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 Aug 2020 18:50:35 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 31 Aug 2020 09:50:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 Aug 2020 09:50:33 +0800
Message-ID: <1598838539.7054.9.camel@mhfsdcap03>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 31 Aug 2020 09:48:59 +0800
In-Reply-To: <20200823014830.15962-5-chunkuang.hu@kernel.org>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D668365A83D97117FF652764C1C8C4D5D5E78AECFE5584A33530F1932BFEA8AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_215044_346379_C926BCDA 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-08-23 at 09:48 +0800, Chun-Kuang Hu wrote:
> Mediatek HDMI phy driver is moved from drivers/gpu/drm/mediatek to
> drivers/phy/mediatek, so add the new folder to the Mediatek DRM drivers'
> information.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb617361..191bacf02209 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5793,6 +5793,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/display/mediatek/
>  F:	drivers/gpu/drm/mediatek/
> +F:	drivers/phy/mediatek/phy-mtk-hdmi*
>  
>  DRM DRIVERS FOR NVIDIA TEGRA
>  M:	Thierry Reding <thierry.reding@gmail.com>

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
