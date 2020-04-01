Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6A7C43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:20:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D14BC20842
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 02:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZk202u0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JDVVCCfK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D14BC20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQ48ek7grAu1ciskT7NM48u/6mGdExv0mvIwh/CYK+E=; b=mZk202u0D7UDic
	netSpKeVqBD0wP3xww1RIIMjykzSkPZMr/B2hCnmyvWQlz/0dF25Qv19zy7Mq7ZDGFbBO3zKsjhmV
	3G3wIAVUQBnK795SDvIf+oSFBHzcebrYiO7JcsKNmX5T9aB5n6A+dc8js/4JACsd73O8C3xkakt6o
	Eg5dGpYjWa4gHv+yluZPUjPwU1CIlQKVyn/AVScMcga50A9+lHWfq6mXQeGRBL7m0EY7DcslgllZO
	sFuKE8dnasdRZHx2BOXc6kBs+C3CcZFHFn0j+ly22iGc6uTQu4q3aqBzoaN6ho44cGek923TQWmVN
	ArR1X2liWZzVObwh0ZxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJSzd-0006hR-Ng; Wed, 01 Apr 2020 02:20:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJSzb-0006ge-4n
 for linux-mediatek@lists.infradead.org; Wed, 01 Apr 2020 02:20:36 +0000
X-UUID: af28c2343fa947fba8dfa75f67e14f15-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EVfDkcSg67rWMGV0bZzmWDij5Lm1irRxXDFbaSycSd8=; 
 b=JDVVCCfKPIcaFE+3QJ9jrIVYE0pQUFP1P/g+iuorb9ojc7ZQIUgsfBZwgPQn8TSTUhgQL1OzQ8L9G41GWpSZp2kxhx3vyyOKFiUWgb2d6cO0pIDwQncsg5/7RIxS+inWE+c3pQd9aKguYWFvLOQi8sBwFM/Wk2cUEOwvNqpCPFM=;
X-UUID: af28c2343fa947fba8dfa75f67e14f15-20200331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1560492243; Tue, 31 Mar 2020 18:20:19 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 19:20:20 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 10:20:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 10:20:17 +0800
Message-ID: <1585707625.28859.23.camel@mhfsdcap03>
Subject: Re: [PATCH v3 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 10:20:25 +0800
In-Reply-To: <20200331155728.18032-3-chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-3-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_192035_188529_981A3C18 
X-CRM114-Status: GOOD (  10.21  )
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
 Kishon Vijay Abraham I <kishon@ti.com>, CK
 Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is a part of mtk_hdmi module, but phy driver should be an
> independent module rather than be part of drm module, so separate the phy
> driver to an independent module.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig        |  9 ++++++++-
>  drivers/gpu/drm/mediatek/Makefile       | 11 +++++++----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c     |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.h     |  1 -
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h |  1 -
>  6 files changed, 17 insertions(+), 8 deletions(-)
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
