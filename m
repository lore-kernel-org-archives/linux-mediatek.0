Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15639C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D747320873
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwJeol8P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pm+zucoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D747320873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OupCEcolSVp81evzHUyQshYMX6pdU2AtBnhepdY/1wo=; b=uwJeol8PPYFJW0
	J/8faHi0oFYeoRfyKb1vvtR/rO6Q259VIsxhclq0hPoO4zrOOaiLr6BXQmdyOpnFuQFvjmFM+0oDY
	nB4pJwslXz+48w5jN2UDcoDiSlQIHeVuf+nhJnlQP4NEn9TSlscXcpZmZhcASECpXJRvi22Lvj2Np
	NilaTw/nkW1FX8IZw+caDo2fWtXuPM9TnrU4/K46wxYNvib2l2xkSzP7q6+ZbbrvREEAo4WjqMQ8i
	muEtp3hNAhHqhDkKU6Ri2Z+1jS6RFOhqaP5hls4RF9EXKZFcn/P7QpSOjp8PkvdiOHoOEgSYQOA6l
	5YZTss7N+huwbwlDWU5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC141-0004CC-7Y; Wed, 11 Mar 2020 13:06:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC13h-0003pj-Bb; Wed, 11 Mar 2020 13:06:03 +0000
X-UUID: b659522118fd46c0927e2b8e91efd116-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Mp2aZPUa6vRdl4F4YlSPXJ1sI5MSD/01Q/eOy0GtTQI=; 
 b=Pm+zucoG/kvsBN9Ow++Vdj3Sj76CavNu7zETryL6YMUx2du9eTCP5Y8AWsmv/A29O2MbmaUQHupsGYZUvhjucSUeZ7opr0SFIHW9iBmg9kP6qzRzOXUNmS1v+vClxUAb0VBY5BvAeGWQg1ch7n4xGzRxhflFOfmrj/Tlan7ehpI=;
X-UUID: b659522118fd46c0927e2b8e91efd116-20200311
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 341878624; Wed, 11 Mar 2020 05:05:55 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 06:06:01 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:05:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:05:01 +0800
Message-ID: <1583931952.29614.5.camel@mtksdaap41>
Subject: Re: [PATCH v11 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 11 Mar 2020 21:05:52 +0800
In-Reply-To: <20200311115614.1425528-4-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-4-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D784D3DAEEA661B9A0D6E2A96065163283990E8ECB339D1E7BA070311362A5752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_060601_478698_9CA60FD6 
X-CRM114-Status: GOOD (  14.76  )
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
 linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 wens@csie.org, linux-arm-kernel@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Enric:

On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> There is no strong reason for this to use CLK_OF_DECLARE instead of
> being a platform driver. Plus, MMSYS provides clocks but also a shared
> register space for the mediatek-drm and the mediatek-mdp
> driver. So move the MMSYS clocks to a new platform driver and also
> create a new MMSYS platform driver in drivers/soc/mediatek that
> instantiates the clock driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v11:
> - Leave the clocks part in drivers/clk (clk-mt8173-mm)
> - Instantiate the clock driver from the mtk-mmsys driver.
> - Add default config option to not break anything.
> - Removed the Reviewed-by CK tag as changed the organization.
> 
> Changes in v10:
> - Renamed to be generic mtk-mmsys
> - Add driver data support to be able to support diferent SoCs
> 
> Changes in v9:
> - Move mmsys to drivers/soc/mediatek (CK)
> 
> Changes in v8:
> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> 
> Changes in v7:
> - Free clk_data->clks as well
> - Get rid of private data structure
> 
>  drivers/clk/mediatek/Kconfig         |   7 ++
>  drivers/clk/mediatek/Makefile        |   1 +
>  drivers/clk/mediatek/clk-mt8173-mm.c | 146 +++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8173.c    | 104 -------------------
>  drivers/soc/mediatek/Kconfig         |   8 ++
>  drivers/soc/mediatek/Makefile        |   1 +
>  drivers/soc/mediatek/mtk-mmsys.c     |  50 +++++++++
>  7 files changed, 213 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> 

>  obj-$(CONFIG_COMMON_CLK_MT8183_CAMSYS) += clk-mt8183-cam.o


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
