Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA74C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=; b=KvQav7KHe2j2cYSoU7JIKTvtML
	PNiirDNVUmEWTBEJt3UrBwwBG0Ha8UJ+3PYj56EowHob4HoTvFqO+zmJMjlkNmxQqrRUMjhjPAJoT
	iZqOpJ41yCMoZTgyFePSqBUyLonSPw1MsS/ikDNyGUn0Ok+KbNot+wJL4KP/csGq/AFEpPght3f6G
	6/UMwcr6xX7ZtSUgyW/sW8hi+bF920CTOvaNHmzd094/KohMYBtyHqq/IG8xLAXjc+gclxi0y61gN
	jJ0Qg9+KZVbCknyrnALn0EKRy+k7fu3i3y0xHQ1D5Ljy7gasFFudu59+Ibd/FMuO9JH0VRqfdQO1A
	zspRg4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fyr-00A4GB-2x;
	Sun, 19 Nov 2023 11:28:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4fyk-00A44c-1X;
	Sun, 19 Nov 2023 11:28:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54366784377so4702084a12.3;
        Sun, 19 Nov 2023 03:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393320; x=1700998120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=H1JcCdqcVW11oTyhl9UDgd0Zcca+jXQsCnBJiEg2gLJOCyiRqg5RdLTs9a6H1ZZafR
         TtY58EcUFO1/F+KKiT+/7X7C9DAFoSayhrwNJRL/GLOs2Bp6S1crtK82K8EbC/KxAuWv
         hlPz3t3o5XactmKfWjKM/ogUrLsaEEFHgOgVlmhyjnw0tCT1VVWXuuRUdSZv4wJeMOx5
         MXPmQR//fjx4c3afN6OoGNZfrHcnJfRiH/gk/cq+dhHM/K3gAAG2QOeqiejEAdR9bP+x
         +8nhUqf3PlZUTioycoKqpFcBpMkQ1IoLrPRbQLjFmcSOMpIXo4uA3VvVddB9guWX/FLX
         0n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393320; x=1700998120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=QUNr8GoxZd/XRkLzPh+Nkn6kY1yRSkJ7fvTL/QdimcThWjC7I3zbJkwib1s9r2+M2A
         MZPfq+7MRwUVNU4FOZ6ZdCHf1G2dosGuH/vat7FLz7EtGlzHi/mwzhF4QG7gQub9tN0R
         j/G1TxSqk1I1Wz3LLPhZGsHe443xOyUlvxuPkX+5V/+3BF3uhhNtdz6Pm2mVBX01YoUv
         FDhKcoUjnAG7jJu7FvlHnGMISbw81O8PGZzu0T8Oc6t1f1lzuLVZQeJIaE9mkUKcSSXk
         v09GqpvO8Mi7U2xpFPBE8HaIa5V4TIw/cevTWczItg3r2ipZSIX9vJWeldYzzLDtg6Kw
         3wjQ==
X-Gm-Message-State: AOJu0Ywo9cvh/z8e5LiaqtoIHQm5Rw/Ig0UhheXpb9VH9Uv8J/PypagM
	ljcFoQ88HrVzTmZmCPxSn6Nx5Y8QmGIfJg==
X-Google-Smtp-Source: AGHT+IE+w9pgQvDl2Y3wxx8qGfyopeIAjzUYE/Lxfmit0zeTDVBO1PBeuPJks8PhZkZ7FJV0jaU+YQ==
X-Received: by 2002:a17:906:7396:b0:9fd:8da1:5c9f with SMTP id f22-20020a170906739600b009fd8da15c9fmr571228ejl.15.1700393320105;
        Sun, 19 Nov 2023 03:28:40 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:39 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:17 +0100
Message-ID: <20231119112826.5115-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_032842_616091_CC6B12A6 
X-CRM114-Status: GOOD (  13.35  )
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

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


