Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915ECC388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EBD221FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMdoEcIu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dIg0y8yn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EBD221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m6CpZ6MIuEBOQ90qfnhGp6U3zq0RnWliCeBz0mf0Guc=; b=tMdoEcIujmBwUeTCaUGZY/AuX
	rJQ6DsDagqvc6TXzq5wqywabcQD9+4Jw8UDAvYz/nNyBPvM4wVf16z/OEfk4d+fdlMf9RaWH+JTWK
	kQj/FpMD9uXfOR0qgWTBfcDpMQ3CVuUNW7eIh9CWvMEt5trsELCExzJSHHUJKfz6x8F7fnPJ38VCM
	yeDJ30kZIA9Qk8CgJ5aIbvFatn4Vz0WvBtTmw6eW0sPAhlwm+2V7oazrxNXMWkpPBDja5TiWdrIa7
	ytmXhtfNlWOJnlLVadMo4pzoHuKVghsrA2AhvzKyaZObcYOwJPGvmNMRSMMrzfIMJP0UjKFYE0fy9
	LICE8zl2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwMX-0006jd-OS; Fri, 20 Nov 2020 02:41:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwMN-0006fw-A8; Fri, 20 Nov 2020 02:41:16 +0000
X-UUID: 54ecfed7e0614bc7a15e7b15387864d7-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YoK3jK1pSYIAliScFNJFqvUHELequQpW9bqfs/0bYK0=; 
 b=dIg0y8yn5cXusZLJ2OS00oIvsOrrQkqWO9jNc/HbKmkwppbZ1DnrYODnEogdm2DoggH02liRJlo6V5eAeenl03aaWiBaSYHFg+zgwPmJO22mh9bQwDpD6a6RMCb9PlEFcwPt3wpypr9OPBwm3kP9cRCcEIBPMN+/k4FSFAROSeU=;
X-UUID: 54ecfed7e0614bc7a15e7b15387864d7-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <daoyuan.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1747368845; Thu, 19 Nov 2020 18:32:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 18:29:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 10:29:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Nov 2020 10:29:09 +0800
From: Daoyuan Huang <daoyuan.huang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v4 3/4] media: platform: Add Mediatek MDP3 driver KConfig
Date: Fri, 20 Nov 2020 10:29:05 +0800
Message-ID: <1605839346-10648-4-git-send-email-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_214115_526115_34894A38 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, menghui.lin@mediatek.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, drinkcat@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, daoyuan huang <daoyuan.huang@mediatek.com>,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 linux-arm-kernel@lists.infradead.org, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, ben.lok@mediatek.com,
 moudy.ho@mediatek.com, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

This patch adds Kconfig for Mediatek Media Data Path 3 (MDP3)
driver. MDP3 is used to do scaling and color format conversion.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 drivers/media/platform/Kconfig  | 17 +++++++++++++++++
 drivers/media/platform/Makefile |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..2eb8ecab4fb8 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -248,6 +248,23 @@ config VIDEO_MEDIATEK_MDP
 	    To compile this driver as a module, choose M here: the
 	    module will be called mtk-mdp.
 
+config VIDEO_MEDIATEK_MDP3
+	depends on MTK_IOMMU || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SCP && MTK_CMDQ
+	tristate "Mediatek MDP3 driver"
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select VIDEO_MEDIATEK_VPU
+	help
+	    It is a v4l2 driver and present in Mediatek MT8183 SoCs.
+	    The driver supports for scaling and color space conversion.
+	    Supports ISP PASS2(DIP) direct link for yuv image output.
+
+	    To compile this driver as a module, choose M here: the
+	    module will be called mtk-mdp3.
+
 config VIDEO_MEDIATEK_VCODEC
 	tristate "Mediatek Video Codec driver"
 	depends on MTK_IOMMU || COMPILE_TEST
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 62b6cdc8c730..36559eaf2607 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -73,6 +73,8 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)	+= mtk-vcodec/
 
 obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
 
+obj-$(CONFIG_VIDEO_MEDIATEK_MDP3)	+= mtk-mdp3/
+
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
