Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A72C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0ZkpApH9Uyl/XYPLTJH+Oty+sLxkUjSVHrKn2yb7ns=; b=ChcAjYFjAAtbG/SMkxxAZ44t9K
	RQbhgLONPLctsVLlvs3q1rvoQlFWko2kJTdY+0DPNE4bfy4ubYPNATrfHTQT0KlyTD+4MdIFMMB9p
	6x6XrpMFS4NZAI8QPoSyS5CygT6eOsGQMcCIayQC34AtGbGmhlKESGx3SM09oBe4OW8Kbu2T2WhkQ
	htkP++8hVt6DpKfs5EdYKq23rnv/DKDFGMZdeNsbKfIj1tCIRmTFPu+jKBFz+ta2S95k0ny9qA/xv
	KnUP8NmWmTCwntcOAhbppVd8h2XaF+YNy7ZmTG5PU4AYeIBNixE87bc09BBFmheHmdGcn+BMI0HcC
	Zytnb+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJjD-00F44s-1h;
	Mon, 01 May 2023 02:57:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptJj9-00F43F-2v
	for linux-mediatek@lists.infradead.org;
	Mon, 01 May 2023 02:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682909841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T0ZkpApH9Uyl/XYPLTJH+Oty+sLxkUjSVHrKn2yb7ns=;
	b=COMFe4VyR+AuULFo/o/q2buVnJhO4ROuY+OSpvRJG+l1tyl0yoR6QRGzekUmaGsQq+wDbd
	4vE75NjXq2NQBpnikoBwEKNOOtl6ylpNY3Vrt9irvHMA/VNvEXpf7pPexQ8MQZLjq1ZMKm
	2TqZozQklLeGITZtBETZqc2DmRix5bo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-uv6sGWcSPAieL4-nUcnXYA-1; Sun, 30 Apr 2023 22:57:20 -0400
X-MC-Unique: uv6sGWcSPAieL4-nUcnXYA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7515a7ba88aso217181085a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Apr 2023 19:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682909840; x=1685501840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0ZkpApH9Uyl/XYPLTJH+Oty+sLxkUjSVHrKn2yb7ns=;
        b=V40vXdMR89pNpeTl3o3f7uEOmBHttBX71i4su2fB9apQA6K5NRL5nWMKYFphoKv7rG
         xgLzJxq+QxltpkRs86gkzE9rzPErF6JlNiPmeX7Xk/K/c+9bDPaeqbNvruG/13gbWOeV
         zTpnAYfUtJ9nCBqOnvLRxvtqUUio9HuqikIOmWfhN5Xdvp2gzGFNtvbj7VUKvnNy7ffP
         Bdyxl3WoSqnR/4ID571xTh4dS0Ql7PWmYlNNqxPFtL/cg2umjCSPuL0DLZi3muUKDThK
         yy12zK8iWN2qEm9bj475xjJ6ThMx607b/UDtDh70Xz1EbdWZXndVz/Yqkr5eIlht7fOB
         cRUQ==
X-Gm-Message-State: AC+VfDxqXVyBEKwioE/G7ez1CuQhrXCmoYJyCKSJDXjvQcGVq+RYbfg1
	sYpwfyqhbAlW+27KWxUUefCZNKxZjz5/z8Y1TBmOVX6BGtta+9PISvgd9aiB5sJYP49yfw8P35Y
	DMicrlOI6/fLgVlk5POl+u9/kJPbjODcj
X-Received: by 2002:a05:6214:c82:b0:60e:98be:8694 with SMTP id r2-20020a0562140c8200b0060e98be8694mr16050596qvr.46.1682909839914;
        Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/ljLsU87nCmXWBl5vPSzg7xYiesizXksCYmzOcSH/wrxt2VTaDcOJnMVYcKodfsqf+KRBQA==
X-Received: by 2002:a05:6214:c82:b0:60e:98be:8694 with SMTP id r2-20020a0562140c8200b0060e98be8694mr16050578qvr.46.1682909839687;
        Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i7-20020a056214030700b005eedb5cebd1sm8307482qvu.130.2023.04.30.19.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 19:57:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] phy: mediatek: rework the floating point comparisons to fixed point
Date: Sun, 30 Apr 2023 22:57:16 -0400
Message-Id: <20230501025716.2905609-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_195724_034534_6706A076 
X-CRM114-Status: GOOD (  11.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

gcc on aarch64 reports
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
  is incompatible with the use of floating-point types
  240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)

Floating point should not be used, so rework the floating point comparisons
to fixed point.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..c9501a3d90a5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -237,11 +237,11 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 	 */
 	if (tmds_clk < 54 * MEGA)
 		txposdiv = 8;
-	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
+	else if (tmds_clk >= 54 * MEGA && (tmds_clk * 100) < 14835 * MEGA)
 		txposdiv = 4;
-	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
+	else if ((tmds_clk * 100) >= 14835 * MEGA && (tmds_clk * 10) < 2967 * MEGA)
 		txposdiv = 2;
-	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
+	else if ((tmds_clk * 10) >= 2967 * MEGA && tmds_clk <= 594 * MEGA)
 		txposdiv = 1;
 	else
 		return -EINVAL;
@@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 		clk_channel_bias = 0x34; /* 20mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
+	} else if ((pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
 		data_channel_bias = 0x34; /* 20mA */
 		clk_channel_bias = 0x2c; /* 16mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
+	} else if (pixel_clk >= 27 * MEGA && (pixel_clk * 1000) < 74175 * MEGA) {
 		data_channel_bias = 0x14; /* 10mA */
 		clk_channel_bias = 0x14; /* 10mA */
 		impedance_en = 0x0;
-- 
2.27.0


