Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A62C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:48:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C955D610E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C955D610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9wtsqMNiflENCsY36L/G5wpZxIa1Ucwihwo1yfAHlc=; b=SSQtgngK/29X8R
	1ksBrPhCDFCG69cxAl3isl69JYhiJ+bjYkSTvevT87Ss+Zp/SfX+eHHEfHaLizgTpSBoZ6Yg4+KxH
	y0Xb8KBb4POHf3HDYyDN2N+uzlsTL5nKt0brE71gCYNYt5cwyjVCURpvdbCYNHFnwaq+eEqCpOpOL
	tjXqMu0wYtcsOk4Lh/RhJ+XLBEC8dHFztmL67t0UdPZGCCXA7pLcfCk14vsM43I+/pjsksrJJJMMO
	WB0AwqC1/mockJEwolJYiRR5gkFuzOabf98I2rqzBEEHPpQ2bfqC6Ii/v+crYmkYbphzIk7Z/2Aor
	ogQurZLQ1K68PJklhCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqRv-006dQh-MU; Wed, 25 Aug 2021 10:48:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIqQx-006cvj-U3
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 10:47:08 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mIqQf-0007JP-JD; Wed, 25 Aug 2021 12:46:45 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mIqQe-0002C4-QA; Wed, 25 Aug 2021 12:46:44 +0200
Message-ID: <0cdce7a43a0b74fabc110730d2b2ec9dce5cbbff.camel@pengutronix.de>
Subject: Re: [PATCH v4 10/17] soc: mediatek: mmsys: Add reset controller
 support for MT8195 vdosys1
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie
 <airlied@linux.ie>,  Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,  "jason-jh
 . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com,  srv_heupstream@mediatek.com
Date: Wed, 25 Aug 2021 12:46:44 +0200
In-Reply-To: <20210825100531.5653-11-nancy.lin@mediatek.com>
References: <20210825100531.5653-1-nancy.lin@mediatek.com>
 <20210825100531.5653-11-nancy.lin@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_034704_007775_0D0F657E 
X-CRM114-Status: GOOD (  11.07  )
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

Hi,

On Wed, 2021-08-25 at 18:05 +0800, Nancy.Lin wrote:
> Among other features the mmsys driver should implement a reset
> controller to be able to reset different bits from their space.
> 
> For MT8195 vdosys1, many async modules need to reset after
> the display pipe stops and restart.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h |  1 +
>  drivers/soc/mediatek/mtk-mmsys.c    | 76 +++++++++++++++++++++++++++++

Cc: Enric - this patch clashes with [1], please coordinate.

[1] https://lore.kernel.org/linux-arm-kernel/20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid/

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
