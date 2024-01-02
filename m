Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDvW3sjoSZAfuwAm/hbpL/iSvJJ8dkyAFEfhRbq1dGY=; b=YIeEskE+CI2D/jJ2UUAENpPwKP
	aANxSncOlxPkZFXBpFOKvGU0O9Tnm6DqWcoXk+XJ7Obt4vDOtmfDd88k9kBlOqubCaXdMyTasETlo
	XQ2Jj8t/zSyjRlQq1YmULbkoUYWlXYdernZblEbqudThqflmv4DHnqAXqmZAdUSKkkQzIPQa/u2eH
	4QdAnMD+7jH2FjfphatHa4KPT9jNH+ORlRTYaSMoyEKuHd+iQQrL6VQi7ySd6o2I7xSdAKGgXsX5n
	hmxcW4ZCdzuwWHvHar0Yi+99oXrSXgy8qmAcw0ilmyl3mgNOd3VwQ9IWtWrIuRRfjG741DbSSm7LG
	1yJiV5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZS4-007Gvf-06;
	Tue, 02 Jan 2024 07:44:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZS1-007GuV-0A;
	Tue, 02 Jan 2024 07:44:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a27e824d65aso217843466b.1;
        Mon, 01 Jan 2024 23:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704181475; x=1704786275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDvW3sjoSZAfuwAm/hbpL/iSvJJ8dkyAFEfhRbq1dGY=;
        b=ddPRCNwxKElYH3XH2ePqV0cPbOd0HNoAanhe6k2/gBfVWYZp4Co6iGXeLGtPK96Ubp
         jhhfn8mTJ8jldrY0Fb8uDEIahlrS8Is2oqgekHCuGUk8YXzzIEzae+O0mvAVbcRX6wX7
         Yn2aF4ohkl1NAGIStMGZFTjdDVfcwkO9eK26mKKbjTdGcgxOXEiD3fXDrbybSfMZ5u7j
         HRZvPd7gRCdxtKw8H5NitCyr4UmRZ3k1FqD8PWFpjRCgIUCeNcj3k5zhlnN5G0TUzc7r
         Z16FKyZzGPYYNuOufmfic58SdgmwmZQ1EB4JJ3lsg9qMBBzJ5IsHZVnY09lY3jk0N3cA
         rv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704181475; x=1704786275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDvW3sjoSZAfuwAm/hbpL/iSvJJ8dkyAFEfhRbq1dGY=;
        b=VfGGo0Ii9uvqzWd81PkVTZC5eYI+ArOEywPBBqtzUaV23ku5ZSkcbfS8VdvuFLueJt
         wq6u4GSSyMUzcCqG7yb0RuLUZ/zETFsAQOQcVPMdDSqTgrboOugs8lB4cTFyYTJjis4u
         Kj420bnm36jI0q1gc619AdsOzHsZD899x84lQLjqwNOTu8VeYW7dvT/LMArpGplSx9Lr
         wmFplyoqWvcXcfObK5/dGFFzawV2zdsZI5m+YfZXq+BdmY2F0e/bwKDCeptbLmGzFKID
         loIAihNpeqMKQ1GyLktFXwCsyYGJPqfKBgSse+apys4lSAPEtiVnl+5k8uVciJ6l/9JR
         og0Q==
X-Gm-Message-State: AOJu0Yzzk7sL87lJx7kTktTK8cSpzjKZ14A+u9ZOXWF4+z/BH9JY/mIn
	imBUS9trPcUaEziVBZUo7Hg=
X-Google-Smtp-Source: AGHT+IFrNratpgXrVJ41/63gbNL2DtrJxYnkligcXJH/H+RePQqwbz2GDOycmpYVEmhbrqbh1f2mjw==
X-Received: by 2002:a17:906:c181:b0:a1e:3a14:e84b with SMTP id g1-20020a170906c18100b00a1e3a14e84bmr16246013ejz.44.1704181475049;
        Mon, 01 Jan 2024 23:44:35 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709063da200b00a26e4986df8sm8362638ejh.58.2024.01.01.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 23:44:34 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix mtk_pcs_lynxi_get_state() for 2500base-x
Date: Tue,  2 Jan 2024 08:44:08 +0100
Message-ID: <20240102074408.1049203-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_234437_089398_92B76102 
X-CRM114-Status: GOOD (  17.04  )
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

From: Daniel Golle <daniel@makrotopia.org>

Need to fix mtk_pcs_lynxi_get_state() in order for the pcs to function
correctly when the interface is set to 2500base-x, even when
PHYLINK_PCS_NEG_INBAND_DISABLED is set.

When the pcs is set to 2500base-x, the register values are not compatible
with phylink_mii_c22_pcs_decode_state(). It results in parameters such as
speed unknown and such. Then the mac/pcs are setup incorrectly and do not
function.

This is part of preveously rejected: net: pcs: pcs-mtk-lynxi:
use 2500Base-X without AN. But I believe this is not the part why it was
rejected.

fixes: net: pcs: add driver for MediaTek SGMII PCS

Changes to be committed:
	modified:   drivers/net/pcs/pcs-mtk-lynxi.c

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 8501dd365279..dd0a1e0dbbc7 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -92,14 +92,23 @@ static void mtk_pcs_lynxi_get_state(struct phylink_pcs *pcs,
 				    struct phylink_link_state *state)
 {
 	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
-	unsigned int bm, adv;
+	unsigned int bm, bmsr, adv;
 
 	/* Read the BMSR and LPA */
 	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
-	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
+	bmsr = FIELD_GET(SGMII_BMSR, bm);
+
+	if (state->interface == PHY_INTERFACE_MODE_2500BASEX) {
+		state->link = !!(bmsr & BMSR_LSTATUS);
+		state->an_complete = !!(bmsr & BMSR_ANEGCOMPLETE);
+		state->speed = SPEED_2500;
+		state->duplex = DUPLEX_FULL;
+
+		return;
+	}
 
-	phylink_mii_c22_pcs_decode_state(state, FIELD_GET(SGMII_BMSR, bm),
-					 FIELD_GET(SGMII_LPA, adv));
+	regmap_read(mpcs->regmap, SGMSYS_PCS_ADVERTISE, &adv);
+	phylink_mii_c22_pcs_decode_state(state, bmsr, FIELD_GET(SGMII_LPA, adv));
 }
 
 static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
-- 
2.42.1


