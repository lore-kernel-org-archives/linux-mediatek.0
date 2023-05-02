Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF63C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XhmeR7C2zfghm/IL/as+Y+pN51ISJ3AaRZIBkHirVVA=; b=jds7e3UP4CPi+BGYUOIgNHh9pt
	nD2dXyrsUaKiXsfNrfJiqaIt5Rn3NVtWaZUN5GuBYWsG06FP8p+XVTbZ7esNQv9ARSnI1MAtYfeC+
	sFHT2/ViEuEBO+eBRZGc9+zx8iclYqCd4eCqqRSGMTkNsWV2zSHlKVJgXzCKcZTGCR2VQp23S2CLq
	wkKUg56p6jQ/jrvQN9TkEwDP4lf6GsWOusrIwCo2pWqwANGmw/98kubFipmRodFgtfx6E52oVE3PO
	k+C04C6YJc7tENDDuP4uWqNkUwp4e9zP8TbSxFl4PcLfjJUhw+xtJnQr/EuWMl0+tWVva6ZyWoxVq
	mvbWconQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrKs-001rem-2K;
	Tue, 02 May 2023 14:50:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptrKp-001rdg-1b
	for linux-mediatek@lists.infradead.org;
	Tue, 02 May 2023 14:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683039029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XhmeR7C2zfghm/IL/as+Y+pN51ISJ3AaRZIBkHirVVA=;
	b=ERAMhrv3lSDVezXotdGhSK033aFoiZCby3cyuxxhgoJ5TCOWLeWADjX6BffvRmnVZM3x4y
	PcUkqN9wSLwS+NHQeXMplGU6dzkqde5EORc42Av4apwGWLcYDlkpxZ+jsOnx+OxD24kvcb
	pU+aNHbphUtKELKEu2GHvI4Kkl6smxs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-nNSt_n8zOYy7zJkzeI4SIw-1; Tue, 02 May 2023 10:50:27 -0400
X-MC-Unique: nNSt_n8zOYy7zJkzeI4SIw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-74dfe945c74so215378285a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 May 2023 07:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039027; x=1685631027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhmeR7C2zfghm/IL/as+Y+pN51ISJ3AaRZIBkHirVVA=;
        b=bHoFjfaw7Tve/GCJZuy8eMGBpMqb0tbP97TINoIHVBd+RYHgLLHQvRog7ALPlJiSsw
         fFfPuJMu1B0SnOrX9yWjtwmTrRsTWX23BTaEc/o7vQhVsL5t4f5YzWAVg2QwH7ckz/JH
         ihciER6zkBIoGZfxg4OPYoT4VtKBIRBC3EC+1LHvh1bNDb2PbW2aKhNsOldK4dzq19Gi
         I78EaiHY4ls3LrKRPzAZN3Zrl8ZSP546nVOW7UC4wwqAVRPvx7NSOM1MLbMskcIzZB//
         asR1XUjORkXem4v9nf1Qa4it8Ngsy3+v+2+qp+MMC78nK7ZA9qm1EYBOUGwKJC9HAL3d
         lSIA==
X-Gm-Message-State: AC+VfDyB+dLm4Frf9d4E0uaR4qZajHTrV+FKRCOcyl/9W8VsbDbE8UVZ
	2WWGuTUWSAUfYLlpXVnm6xQXpVi6e6NT0o4su0nRtfifcfJqUZLEOL3L8aGGZn3+ANnq+l2eIKt
	DXu7fhb9RSTMjBOYxfFiWtGACNnCblHUd
X-Received: by 2002:a05:622a:143:b0:3ea:bec4:ef57 with SMTP id v3-20020a05622a014300b003eabec4ef57mr28954473qtw.13.1683039027429;
        Tue, 02 May 2023 07:50:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dHp9unnIVk0+Doy1XuqLSB0Po7DZSJ94Ylm3eZ5tLIvbR2wMADu2J7HkOiAWMy91uB3Mwgg==
X-Received: by 2002:a05:622a:143:b0:3ea:bec4:ef57 with SMTP id v3-20020a05622a014300b003eabec4ef57mr28954428qtw.13.1683039027172;
        Tue, 02 May 2023 07:50:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g7-20020ac81247000000b003ef3bbd242asm10343812qtj.32.2023.05.02.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 07:50:26 -0700 (PDT)
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
Subject: [PATCH v2] phy: mediatek: rework the floating point comparisons to fixed point
Date: Tue,  2 May 2023 10:50:05 -0400
Message-Id: <20230502145005.2927101-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_075031_631179_BCE05669 
X-CRM114-Status: GOOD (  11.81  )
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
v2: silence robot by casting types to u64

---
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..093c4d1da557 100644
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
+	} else if (((u64)pixel_clk * 1000) >= 74175 * MEGA && pixel_clk <= 300 * MEGA) {
 		data_channel_bias = 0x34; /* 20mA */
 		clk_channel_bias = 0x2c; /* 16mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
+	} else if (pixel_clk >= 27 * MEGA && ((u64)pixel_clk * 1000) < 74175 * MEGA) {
 		data_channel_bias = 0x14; /* 10mA */
 		clk_channel_bias = 0x14; /* 10mA */
 		impedance_en = 0x0;
-- 
2.27.0


