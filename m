Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAF3C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:36:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C1B20873
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 13:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKtwZKmS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q7F2/kHw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C1B20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKRzY8sc6865oXy1h2XsrQ5WpOrOmgXIgWzQek5mhT8=; b=sKtwZKmSw5Feir
	Q6btBhwougJoMs+2HsKBUZ6I4Ya7jrBJM0eJmHpWUaBnX+f9roPhq0ZrQV04KJPXJJ+jHQp+6nUvr
	vKA1Y9Rq4Smtb3KZ8Jnd3fVBfGzNOadBujViDYm+x2SdIShvztmEVyPo3anvczmwjHjitK55AiZdu
	0CxxK/ACZoAHH+dPnK/IB7F9eUsUokUXYRV161Zk3NdYr36Qf3gVX+cW7VlgPNO8r22txpsujCXaO
	4Cvi9my08FMxj/lKosEWWA6GClSaIjdQTTKcYwwAnMaYdIDBorp87Iy2VCR//qJTu4anOLs6st+dx
	52ZGKH4EQWC2sJ4Bj99w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1WZ-0000Mh-4S; Wed, 11 Mar 2020 13:35:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1WI-00007g-2p; Wed, 11 Mar 2020 13:35:35 +0000
X-UUID: e56f0075960d49c5a2992a60b3ab4135-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=McO5u8qL+2dJhFVvrj+B5fmGSNs+dJJtNOnC6DdTdJc=; 
 b=Q7F2/kHwommk2mz09pXfwLp7xVMeNpjJtHnnQuSsY8y3FL7SRMEmMszyIIh1OfI6DCofaMjxggnOXg9SUePwRdan+GDZFoZ5XaQac+rmB3Pq7Dqx6jZFCph6UtpdcGXB6XvPtBCq7HAwfw93VOqGTuXl6lnYYpT+YKeDE4ryRX8=;
X-UUID: e56f0075960d49c5a2992a60b3ab4135-20200311
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1973424822; Wed, 11 Mar 2020 05:35:29 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 06:35:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:35:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:35:10 +0800
Message-ID: <1583933726.1550.1.camel@mtksdaap41>
Subject: Re: [PATCH v11 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Wed, 11 Mar 2020 21:35:26 +0800
In-Reply-To: <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-6-enric.balletbo@collabora.com>
 <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_063534_136143_B3B56045 
X-CRM114-Status: GOOD (  15.20  )
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
 Allison Randal <allison@lohutok.net>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 matthias.bgg@kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-11 at 14:26 +0100, Matthias Brugger wrote:
> 
> On 11/03/2020 12:56, Enric Balletbo i Serra wrote:
> > In the actual implementation the same compatible string
> > "mediatek,<chip>-mmsys" is used to bind the clock drivers
> > (drivers/soc/mediatek) as well as to the gpu driver
> > (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
> > that the only probed driver is the clock driver and there is no display
> > at all.
> > 
> > In any case having the same compatible string for two drivers is not
> > correct and should be fixed. To fix this, and maintain backward
> > compatibility, we can consider that the mmsys driver is the top-level
> > entry point for the multimedia subsystem, so is not a pure clock
> > controller but a system controller, and the drm driver is instantiated
> > by that MMSYS driver.
> > 
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Same here.

Acked-by: CK Hu <ck.hu@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
