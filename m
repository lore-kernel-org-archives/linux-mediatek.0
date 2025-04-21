Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376E0C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=; b=1xaOrbV8P10I55OzvRT2tjTXtn
	XWKthPVfVW7YD/lFe2QMn0O1CgcMG9ut/8iCABUbNdOgyZz5Uw720myXzOq+GPeq1zM4rX89TQDTX
	TA2IKMtG6TS8JbWhpd5bC9CkmA1wZX8bjvwqNdg6KC3+eEHrOL+7u/EjeYRS3yg1X076LhVS3wfJW
	ZwwqZ8bqsg/HvTjQD2AE5Kw2bxqlgrNsU7FIhQFGiD968WIcVvt2iXWeUVZEdDNKvwOF0FblOcoU2
	ZuE00npHE/XUUfuee+420/obsrSUjN/LecnfxJc2JWkanb6f6oeyBk8XcrIeTrPOSu8NBYDY07ksd
	/28rRmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nBx-00000003y1x-3tvb;
	Mon, 21 Apr 2025 09:11:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6nA5-00000003xpG-2flN
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 09:09:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22622ddcc35so55786765ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745226596; x=1745831396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=JcP/wEkBUvTjAAq8x2ykkmhybpqiZcbbSlDco2OIPDF+6Wz5O0JAo+Szm7ot2EdR0Z
         vi5h35loPl4NZyRngg6HrBYcaIfFErYOj7vMhq4/0CYJVZjdouJveinKD/6ASHTEIZDa
         x2Jk715OV4xr/JTjrIj136F5IvvHygbqY0dn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226596; x=1745831396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw8UIDvZBCcr83U5CXKVA2bqzTMOFGkmm5WFSkBADIc=;
        b=UAFMdB/w8oYqIdOgawWtQS6EvzejuX0dsDP/gTLq6mmeJIIURO0nkZBDoJvgj9txVs
         y4fk6gHmTTLV4fnSvsO+1hXmEGK+sOtufzvYjd947V73KwSoacGZPwDd2A7aPLdJPuw/
         nVtkGoXLQklGlXIXmKGXozhm2w0ZQHpK78I7j3RNQWORdQjznSuuHp2FaJE05pDUR7Hb
         83/8Bws02LY3B0sdt6mBaEG/oAZlgNhmKBwWTpdEHCSJJU7ZM8vUTGWcxfNSp0usmC/k
         shb7a67DJjUAlGYIq2vLykFQ5Qr1AQGVd6qn6TglrLbNmVe4LNQBzw66MzGteKymnBFp
         Zz0A==
X-Forwarded-Encrypted: i=1; AJvYcCVIeTpTv7y5yscDNwX2ReKJ2heQ2XuXLXjqZFq4Xk+hVON3/1tfugkzL9Fiq9ezMCY0HXKH484+DgoJKveKKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJooQO25HGMf8DuoNKuS17Tqd37ZaeLqfogM7UmZvMerW0kBnp
	hYElv/nJIJo3CKRsl7xHaMOfbvTbFR5U6uP/yYxSCCPdJ63lBM2M/QG4FxMKtQ==
X-Gm-Gg: ASbGnctfAFkxsDohHe0KuvaqoFJGSry17GKkzGSvoZ8KhI1e5md3tOSt6ZgdLx580RL
	clqAMNeLiGOO+iBdBVKf6rTOKirpTWVtqIvmuoV+5DNSNHULFhrxUcXjFja95SNE6dCmG52dsjf
	zAnjY8S4/PNGM36RUjcTfP2y8HtbyxIcsm0mVmHol6QecUitm3FEhrb03d5wiSByexOCPYKhnjP
	aCm2FU4aqLMbG8ZPw/pkpxgc67nPpk7e9Q1BVQXp397itXyEJ63UbnuI9IztYUdW3ki4lGT9G9E
	r3oBi0tDRIPLEPv/nHUXbAlN3LSzScLr2WkAua/m8dyRIuGLlnr5/87U6nFP93tB4EKDPw==
X-Google-Smtp-Source: AGHT+IHDl/Ex7FBzvgMFPAFFoh7YhHYfxUvKL5Gx49McL1TrmyCRhCWjmqZwJhpIy+Bel/jx902Q6g==
X-Received: by 2002:a17:903:2ca:b0:224:1609:a747 with SMTP id d9443c01a7336-22c535cbfb0mr168110325ad.31.1745226596121;
        Mon, 21 Apr 2025 02:09:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3d4asm6113079b3a.70.2025.04.21.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:09:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pmdomain: mediatek: Add error messages for missing regmaps
Date: Mon, 21 Apr 2025 17:09:50 +0800
Message-ID: <20250421090951.395467-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_020957_666924_A664116D 
X-CRM114-Status: GOOD (  11.07  )
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

A recent change to the syscon regmap API caused the MediaTek power
controller drivers to fail, as the required regmap could no longer be
retrieved. The error did not have an accompanying message, making the
failure less obvious. The aforementioned change has since been reverted.

Add error messages to all the regmap retrievals, thereby making all
error paths in scpsys_add_one_domain() have visible error messages.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index b866b006af69..22cdd34ed008 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -397,20 +397,26 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 
 	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
 	if (IS_ERR(pd->infracfg))
-		return ERR_CAST(pd->infracfg);
+		return dev_err_cast_probe(scpsys->dev, pd->infracfg,
+					  "%pOF: failed to get infracfg regmap\n",
+					  node);
 
 	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
 	if (smi_node) {
 		pd->smi = device_node_to_regmap(smi_node);
 		of_node_put(smi_node);
 		if (IS_ERR(pd->smi))
-			return ERR_CAST(pd->smi);
+			return dev_err_cast_probe(scpsys->dev, pd->smi,
+						  "%pOF: failed to get SMI regmap\n",
+						  node);
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_HAS_INFRA_NAO)) {
 		pd->infracfg_nao = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		if (IS_ERR(pd->infracfg_nao))
-			return ERR_CAST(pd->infracfg_nao);
+			return dev_err_cast_probe(scpsys->dev, pd->infracfg_nao,
+						  "%pOF: failed to get infracfg-nao regmap\n",
+						  node);
 	} else {
 		pd->infracfg_nao = NULL;
 	}
-- 
2.49.0.805.g082f7c87e0-goog


