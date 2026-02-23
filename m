Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A58EC1109
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87mY3bGihT8b8D/6Pcxz8+DKkw+N82+sh9Y6maoLJGk=; b=si6ihTsb6a4sjs3HtmX54n7fBi
	VMg0YiEyWfLF6hGAU4EGZ4C0bRbQHy41TkDeYiHIFvTTeDZQVJzwnJH02KiLTTQB5U6fHEK5N6Hb9
	4c5G7ybF0bN1XSZYhvda4mID4+yXjppqMjM1AhIoTlTFCynwfW7kDapeYmrnC5YAYR4Wje31amjeq
	u5fdk4GzoKw/vBjb57JIunxDAqtJoOaQ0Ev3j4Xz1/RlNRfKGzJCjLp7O6rJBf6iI3uXvzZSwWJqA
	bL5A3F7znIwG5mUtwWGy4wJHWTU47tzlX7DdrV+wTH0xhTNVkOBu9uBJZZfHUmZDFMOXBY6NZpjby
	u3F859fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlv-00000000g5d-1T2A;
	Mon, 23 Feb 2026 16:26:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlo-00000000fwq-1gQW
	for linux-mediatek@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=87mY3bGihT8b8D/6Pcxz8+DKkw+N82+sh9Y6maoLJGk=; b=oRjVijdcpHdlwz/CTJyVkb7QRC
	2qjYdD4Rh/LpkVvkA5edXIplNsa8jqipv69bbHhiVXxDS4KATafn1pN9qKy5cZxYGT6g2KtCVh8Yg
	YqQ9m3gpBBrE37QsCC7oHcWsL1gMPBIOuVyqqlOykEI64M+fZt6tyaNF6OUtynltopZSkYEISHujr
	krFb7agB+/9Z1xsZHteU0lmxbucsLrzyu+uAPaJRNT+3VCrnCNTXLM/OO7L46GFPcm++wNO70q1Cb
	ZklJfhmXVMLH1Fa5MNYSpWcUemlMqblB7MyiQSJlFZynneRnaj1ZlA36MZ42IlTPNhZdZY4cl/op5
	XZwXhweQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlk-00000005TDp-4AJg
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4362197d174so2892849f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864007; x=1772468807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87mY3bGihT8b8D/6Pcxz8+DKkw+N82+sh9Y6maoLJGk=;
        b=U+O793/viVyHlABQJeorWNfURwfVdWwLb3Nev9Xuzbj97tt1EwyPGBBhoPBSLsYqGP
         QXOIhdJSRa6MxtvHtxbXbcl4bkdcLLRjuM6rCCk/T2zW/npsD8n/AYLGJ2agYOG/qlWT
         I9vnriOykLfoZw8Y8YGZ2Yzb8isUVE7EHhmqYOQxthcC7x/TBrLvIgpGd/DCFATJoljV
         vppTdnwGj97teo0DfpL0hEsUGGbgQ3uS7gu4iTcu1sa87QBXn5rRUozp9Npw3CM4MHaK
         OUAbd+7jnKDI1PC2+3tSPNIyK/zdp9QHb06178ov1FX44Qv1rcYVIvjiiQydSi/ThA2K
         0SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864007; x=1772468807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=87mY3bGihT8b8D/6Pcxz8+DKkw+N82+sh9Y6maoLJGk=;
        b=bjcmvTbpnQwxci02bQytUo/mPuomtxyNnI88xngL/LneP8pAEHQ+rYJiq76vo12Ewf
         bEB9d148Zo2R1Bx0l4nQ8xQsFHywXet00WVeosfFv7H8+23hYrQQS+k2IwLVudOjGzhC
         2nwQ6kaTBaXOT7JTPew+pj8l7L5SwhrQvy0MZ8aAw0tQ88qh4HlpVhkWr3aIz2H2G4xu
         B8T8o5M0GeEMH82rr7gptt7WrrfQaWbA/0tnAP5qWa0otpIYQuyAP+9jJPQzDPHHG+4f
         WaP4LBGPnOSQIf9+uwHbG2WH6Co+jsNljttoXDS+TpyBgYsj3uiEu8L7wO9bW82zgW84
         ALnQ==
X-Gm-Message-State: AOJu0YzOIbFAK6eUcxrbxJ5KfeFJfuH+hP2X0hwK2diKjmh0hiJiB62U
	1YlLbcx26yrN9HUQl6RxWOdMpFScP844Heu0Un753iJXc/KL9YdgFQs1Fvp2QQ==
X-Gm-Gg: ATEYQzyXGjGrJ+zbDpLohdZ3pc4psHB+9LhnOOzPmfxeU42sfy8DrSwekaz4r808oRz
	tDhefOCm5JSOudwUAHlG8H8DbjNcpzBDQaQjx6o2z8j1gJI+YCN2xjV8OAmACgjR1lDy4UFX0Z+
	UTt8rQH1zvq32dpqav/mx+DKukHjQgIMgEU8Ksz0WLrJFwGI2MrMLLxHyOPUjXEXAfkyUDItugd
	znXpJzp3mMr+ul5w17IavGFOTmzhU4L8Ri7RUl1OljKhrmFT6+38TCHqYtf+CISFKb6F+3qT3n6
	YPYRB1xpnl3C2cFEw4GakIeg5efxHE7bC35y5gaNHGwx/2OjNAMuC24FHcxLOGdTGXeG8t9+nGc
	YM/oHQjzq7OOQS/rRj38RTajWJiG/S7qS6rAb6FH0EJQPHRPdhzCE6n7/T6K0R53qDotMBaejln
	bxdMTMvAcl2ZU2pqYAZ7Y=
X-Received: by 2002:a05:6000:2dc7:b0:436:1a24:df81 with SMTP id ffacd0b85a97d-4396f15416cmr16926092f8f.2.1771864007344;
        Mon, 23 Feb 2026 08:26:47 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:46 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 6/6] gpu: drm: mediatek: ovl: add specific entry for mt8167
Date: Mon, 23 Feb 2026 16:22:50 +0000
Message-ID: <5f880f1334aa93184afee3e36132ca42628821fb.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162649_158622_664E0F10 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

From: Val Packett <val@packett.cool>

While this configuration is otherwise identical to mt8173, according
to Android kernel sources, this SoC does need smi_id_en.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e0236353d499..97a899e4bd99 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -671,6 +671,16 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
+static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 8,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
+};
+
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 8,
@@ -742,6 +752,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = &mt8167_ovl_driver_data},
 	{ .compatible = "mediatek,mt8173-disp-ovl",
 	  .data = &mt8173_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl",
-- 
2.43.0


