Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A74DE81A46
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqCD0BNLW8XMq70VZYZvuBAvYG0v4co2Px4uvRfSTgE=; b=ggkSHmnpiFr9NcPF8snLsV9I+4
	+A8d7hbE5qbZoDpw7WUk/BxaCFJkW0hoZUnDm+IWUuRUNYz4IRi2ftwLqjxwAkTE1xWlZ94rjKyeT
	7EHzBYrMsE0sk2hMqry9dUJOWSkNs7ILaNw6Gjg2/IdbeGhMJWFyjTJNDcJLK8oq6iHdIdXhiBSyy
	UOnPvRgAmFE9K0l03iEQwfMvJ1k/9jiLNkjah/eY/dhgMnS405YXUV8r05JWkyV2A1T0WLTaBFK3+
	SWJocouUEs+wyK2ElkssIsBxS/CB8FNzDQgP+okwbavldwmmNJ1XpC2aKNCtWg2OLUX8TmVbxCuJc
	3HFk1Vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PO-000000071DL-1uk9;
	Mon, 16 Feb 2026 16:25:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PG-000000070yp-05F5
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-437711e9195so2347370f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Feb 2026 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259104; x=1771863904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqCD0BNLW8XMq70VZYZvuBAvYG0v4co2Px4uvRfSTgE=;
        b=K0atujeeOBxV8oke8setTur2VV25ClJgp1OUSIMUy2nsweBw+jrkUWYFD+YJC5DgX8
         0tcnpi7kb3hy4k40eTkMF/niRTowidg4eu5l4C7/KibRKFiOOFUMlFjYcSWHxNnmZTTR
         WwXHzPxeqR6B5N6jqnftjcXWiKc8FB6pA5QyQxLycObbltk+8ueUgj6EGd42yppke86A
         51REaKqf/lhvSJ8fOTlb8q59Mdiaa37aoxhptQTGuIJ0gsXybcHslNws+j2hFwlAuLwc
         hx62fIxhZbacU3U8JZCSzVLIFbWKPJfH+dmbPKko9XrUHERwHmul5GOq22gXSYfaSAnV
         Y5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259104; x=1771863904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqCD0BNLW8XMq70VZYZvuBAvYG0v4co2Px4uvRfSTgE=;
        b=foWVM96UVBo2zHoh7G6sNnAQIwiyaAqJ51JohiJJHRSS1wWkfr5Cx+Ukm4qu4z/1mJ
         GdQ3qxMrazB+5KisGun9eTQTJ6ddOPkjycGYpxepa9drwcfdsFYejqjgC4fnxsyvmEIk
         IT5A1/wOWID/pqL5SRnhmCjOp22q6fD3uuh9sbrrH5KwTIe3hcmFpUtdlg51IdvFP1NI
         EwgR6Q9ktorctfk/UL/ow+h9epwpq44/fnhKewcIej3ygeNoCe2MuceQer/MzYckhdiV
         nqkoe/lJx5JMQ6WPaCP+hflAJHbmKnmbfBROlOj0clHdWGO5tiBab3F0rGdChgkDZACW
         dZDQ==
X-Gm-Message-State: AOJu0YwkP1ukiLD5FJDLzIjBPFDZ/25V2BaHvq0i8QY+pelxJ3b7WADL
	MSVgKP2/y7VZTpadB99Qgcx4whBN1/AW9NUhRiZjVV/C0enFPyzXAly8EEFKOw==
X-Gm-Gg: AZuq6aKx39shObddzuYHPk/N3k4nilReFR9pb8Eh6vt/gz+MUeL4g65niuLFPxSYc1R
	ns6YrjKbEtgB38Akp2DNb+oJP0NJrEtBWWRzIV2hvbkBprELteOwTi4d2++8XWyK2Zrgm9IPklN
	JGpeZkonsDLgG+TB0V0S8+k/7n6JMqRBnyxM/CuH+xpynH2qrEUMbM1vtU5vYjJ5QC9v3SIRT7p
	R4PRJnF5kLpp/zNmc71+dV0zMVtgo2dZaIaOiZvHAKqdRyi2GsOROT0y6dnBHvGibKnNfwxZjM+
	bHF/ULcfgSayrL0s099TPBkwy1YAOjmHuE5ui0KCAyS1Tg5SJP4gweZaKh6ptNv7GFnb85rVYtB
	mt8L586tcXCITfvbDj4If2es+HKdB6upoSoU4UOYpZBK9QF2HBP0m39OdTMudIRBTKbg8fcOaSa
	eJJ8nAbuY8YbpxE5mb9hg=
X-Received: by 2002:a05:6000:238a:b0:437:6c23:3465 with SMTP id ffacd0b85a97d-43796ac1fc8mr18185802f8f.16.1771259103790;
        Mon, 16 Feb 2026 08:25:03 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:25:03 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 6/6] gpu: drm: mediatek: ovl: add specific entry for mt8167
Date: Mon, 16 Feb 2026 16:22:17 +0000
Message-ID: <ee6bb10f8beb4a9d0d2bf49d5b053c7395ad6b50.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082506_095978_9D9D8F0E 
X-CRM114-Status: UNSURE (   9.62  )
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


