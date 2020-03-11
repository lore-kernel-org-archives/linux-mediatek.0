Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F77C18E5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500EB20873
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g24ptMgi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jxcyz81u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500EB20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVDdoDSNUllvjo1Tr552h5e0ASLKxS1a0iPXw87lhKA=; b=g24ptMgiRyqaZ9
	OQdGXfhpWDfbB3VAOv73yt47K9erVweu1u0I3i/lsWBuHPlIiUMFoUAhN+O6XobAl4f3KYcTqrVMI
	7ZaPKbOhACknxBbvwXdha/n43XvLE9VI+O3MEDYsVd9UJ747usiZHnKkum7QbmoN1Ea1o0IQtDNbc
	t0gbVHliR18R+wpsUNmDZCTT62OPY0WQh4fQb5B2KIPivgjggv3+Q7kiyuERaHM5csO2qT2857NWg
	hDsPd9uUwD+q4TustV7zIFN0XB/up9eIoefyOzsQQvbl2eJEg6IS/xQVgTKpFMvz1JaytyvMScZpa
	Br+UchHy2RM/mcOHbBNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1W5-0008Nm-K9; Wed, 11 Mar 2020 13:35:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1W1-0008Mj-UH; Wed, 11 Mar 2020 13:35:19 +0000
X-UUID: 99e51e58aab14518b7b59e90e546f499-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aPE7C1DToCF06kD0ZOb8rAXB9DZEZ5xKdvZNq0Iup4g=; 
 b=jxcyz81un/6Novry9rPZmgcoZbpA27/olfviVY5rtF4Gcsw4IIZf0dpSPuQgv6Zkgo3LvLMW6L55PDtazzh+r70bsISnwB1UmpbuKBvQxsZlrL2Pc3RE1AtY73SdxxZHP2R0rrnIA2gmUCCcWEzbWsxJTjI8kfMm6eTt3qsy9tk=;
X-UUID: 99e51e58aab14518b7b59e90e546f499-20200311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 205890951; Wed, 11 Mar 2020 05:35:11 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 06:35:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:33:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:34:39 +0800
Message-ID: <1583933694.1550.0.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Wed, 11 Mar 2020 21:34:54 +0800
In-Reply-To: <db86a097-db98-1952-8afb-875ba7719719@suse.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-5-enric.balletbo@collabora.com>
 <1583932064.29614.6.camel@mtksdaap41>
 <db86a097-db98-1952-8afb-875ba7719719@suse.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FEED9D50E1FD1D5B5973048C686B2F8561908BC0A65B8DDC33BB0FC3950D5EFA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_063517_987576_31237E9E 
X-CRM114-Status: GOOD (  17.41  )
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
 Allison Randal <allison@lohutok.net>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-11 at 14:25 +0100, Matthias Brugger wrote:
> 
> On 11/03/2020 14:07, CK Hu wrote:
> > Hi, Enric:
> > 
> > On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> >> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
> >> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
> >> Those functions will allow DRM driver and others to control the data
> >> path routing.
> >>
> > 
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > 
> 
> If I remember correctly you are OK me taking the patch through the SoC tree, right?
> 
> In this case I'd need a Acked-by tag. Not a big deal, just trying to remeber the
> tag policy in the linux kernel :)
> 
> Regards,
> Matthias
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> ---
> >>
> >> Changes in v11: None
> >> Changes in v10:
> >> - Select CONFIG_MTK_MMSYS (CK)
> >> - Pass device pointer of mmsys device instead of config regs (CK)
> >>
> >> Changes in v9:
> >> - Introduced a new patch to move routing control into mmsys driver.
> >> - Removed the patch to use regmap as is not needed anymore.
> >>
> >> Changes in v8: None
> >> Changes in v7: None
> >>
> >>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
> >>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
> >>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
> >>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
> >>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
> >>  drivers/soc/mediatek/mtk-mmsys.c        | 279 ++++++++++++++++++++++++
> >>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
> >>  8 files changed, 316 insertions(+), 282 deletions(-)
> >>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> >>
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
