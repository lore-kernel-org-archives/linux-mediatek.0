Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1FAC10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B689222C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVgGS3nD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R3riNyrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B689222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UYQ74JcvIap6o2ZlGGE9Z1O/kcv3rhTI8nvIgfrPac=; b=fVgGS3nDDAdxtF
	IVO2Cy53KYLSXuwam+tSYoDiMp7+mqSQ4KfFd4/nZ/mBcJbmPQU8VBx+x89t0/AIUGWcFawHWRe3L
	S77wPhBT8ZkmtI2PTXNLzdstjOYNLzUwDv3rQQ5bQb8rpUkoZtXzyrUceGAV//ztU1aBAyEJ7rSJp
	HJ5YBvzsqdSjckwSJKvw3j7SFFnSS2vOy4iHN4CSrhH3azR8QX9b6F6MNXc/4FLIH7nLTSZOV9C9A
	jcW9JynB4xr7iGAtQaVdylgN399jLW88c6O/JQdHVufQAzKgcTKkYHD3u6kSBHd9IqSMmKVBRpCUj
	sxoDk4p2c1dk82Pc1/pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC15k-0004cX-QK; Wed, 11 Mar 2020 13:08:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC15X-0004S2-N9; Wed, 11 Mar 2020 13:07:56 +0000
X-UUID: 7c98eb37a7674907a45f065bba826e73-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ClGTqPIGoVqVr3jF7yujqXX6Xpj7o2+++464APlQxj8=; 
 b=R3riNyrTKlFRg/nE77hSNB+cMojHvOJccg03w5lKqBSuhZJ1/IqS7itKTQ8FTTiYJhPACmBWBluoWXdlXUG/zbTf2rQqkvqqYWpmrziqM7WynKyhbTNTXnBXUvVrSOLmFpWLB95B+aksgIkMQE+6S6ygBytfaOyrLegh+GR/0BM=;
X-UUID: 7c98eb37a7674907a45f065bba826e73-20200311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 471549127; Wed, 11 Mar 2020 05:07:54 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 06:07:52 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:07:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:06:53 +0800
Message-ID: <1583932064.29614.6.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 11 Mar 2020 21:07:44 +0800
In-Reply-To: <20200311115614.1425528-5-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-5-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D78B7E686CD1B535834D80DC0678BB113F1681C82C2C2E34388BCBCE202CC48B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_060755_761296_02194B5B 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
> Those functions will allow DRM driver and others to control the data
> path routing.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
> Changes in v11: None
> Changes in v10:
> - Select CONFIG_MTK_MMSYS (CK)
> - Pass device pointer of mmsys device instead of config regs (CK)
> 
> Changes in v9:
> - Introduced a new patch to move routing control into mmsys driver.
> - Removed the patch to use regmap as is not needed anymore.
> 
> Changes in v8: None
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>  drivers/soc/mediatek/mtk-mmsys.c        | 279 ++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
>  8 files changed, 316 insertions(+), 282 deletions(-)
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
