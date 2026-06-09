Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E0CD8CA7
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=; b=kG8BAgEzTIv2NhTt85pySZeIgr
	igoF7l9VDuxZsecWRBFNsTnI/IVUinEchVk1AwU1E4m493bAj4ZVE4ptPdsqH18xweq/R6O15PuV+
	VDOh/0MpM/q2V+IkRCWmCcVq/r68z81ER/8SYJKl+Rbc0tfFUoUU3DfYtQQki2yLP4QwYQW8q0Ice
	BVf4biC6mUW7p3kq/ulXmzYHF1rh7UJZzDdxtKQIVl1/75slG0CcG/sbyCh5Q3G4XtxCePbvp3cqB
	+aceK1XUei/jM+VNUvb/MTn6BpYGkW2aQ0sYurXsXtN+6EuhdnTqX2QyOnIM6bX7AaTK+r8058iem
	GVvrnrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrx0-000000054tH-32mA;
	Tue, 09 Jun 2026 08:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrwz-000000054sP-22Ta
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=; b=N19X5nar7opGzbAuoXSJr6GHsR
	0u8ZgZ/TRM8rjrBf1MXvd1OvW0a2+yM5/yMhvO86iDp+6840bSEYdqzbZL9ypcBk2oWsGg6gKxo7C
	/6V8P7XO071AdoXWHqzAd3VTzxxDZFGr4m6iLRu3wQ4gSQHGafJNCyn2k5e4ptTnAtJAuNSJCnwvX
	LECdCucz/j4oW/v1OT+vho3S1dkKz/DTPg+DqDlshRe45V21I4+FCLqL9QzV1aHmcb2VkiJy3j899
	WVYNkEz2BnhMJTK/DJNDC20db3PaKdmSPfmVQhZv1ymm/+bJJWxCwH+cWWqGQprnjnoFB6LhoPbUm
	NCGVQZ2A==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWrwv-00000002BR4-1DDl
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 08:36:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so5511259a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780994198; x=1781598998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=;
        b=YHVSo07+Sh+TNIUGWEiouOi+LWohY/upqlcMTnbx1nFLWGPOke6ICePLEuQ5kZKJQ0
         a6DFIQYOD4iN/HvDasFxflVGlWJxaLJZdX6wg0zCUbxAupcjc7gaa2xoDpn0UmiYeJFp
         qFicHYmVZqxjj3hR7IpwNw9EqxM2f1Zmat8Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994198; x=1781598998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=;
        b=m+AzsD1dK/9qrpeFhnKNjDGS/NgqO6Uz1o4N3p9rrHP//fGjYxUCc+jF4gDuzhFnbM
         foCY6vMPTClqNn80Q2uipTXsL+kelWDDlm7mUVBm4OmN5ZPrH1cZIXig4Nx1KbSe5eqJ
         CPtyi9cvZEFiv58E6bZt0Aaga/w8Fnt9fZamcC0N9A9qP6+qIDQ9ocaxt1BEl3i3GSdQ
         Sfc7OJ2yGISKbAxjdPjbQm816uRfx4LhipLW5QcxenfyBMNcz2qy9qZi9vH98+jWv/Mm
         7UKa43EQFS45vDwtuQG5A6jffI7gZp0Uw6C+6hxbiPauncNlBV+IJFmnM6XkW4bBd571
         p8kw==
X-Forwarded-Encrypted: i=1; AFNElJ9DHlAfGvzDp9lc1p9X2GsAL3kl7RpvdaDzVTZmORNmCFkGf4PHmYDp6G0AQkrPYGMAq19sqCooMemQQi58hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyepmMSgSDJFmp4smjnIBbzEtgEpeXTNcMbDNNfU1oTdE9QKBiF
	xrk0MHHbl1oy8K+sUUpkMkrXLwkrVTczoKy/yoXjHl4dbM/4IP6M7ajhkrMpy/Jz2w==
X-Gm-Gg: Acq92OFVibJttaPQWAyEPBkRkspuiuICp+Vtgz9f8Xf3rKuCC6Wk3b45Y30YCJBHxNA
	lMoIEqWxR4RfdSgYRJUDuhcd0KcQVbP4eFpqjlfk1OzB/8yd+60OqEmaSVt2QRYzKNknrmevvEj
	X9J/mUTzp/iFRyLo1l8I1iyq94WzTHkn9Yw/9FuOsecBo6mlWWTLB/GtMLPdfPYVyHgWiBKR2nX
	ba0lg2gxDZiCxiCOCutLmsJoRAwAZMqT9tG6f4PvKPtePJc9FMsbOt7sCCo0fDdzbTH/8JL9R64
	gSPA+lstUcU28bQSAyoMC7J5EC9OOkmgCVoME2tTVJmYYvjCIk5FE0MXHpz4Hf1KtTVsQGaE0kj
	FWVOa/ESx2NMQtiuTrMiym0+llvKCfQLXJnfoZ5MPZmeP9qS85VJ9WysKDk0UZKojCXDMUIkvy9
	G+i+5QqUHfVwVo8IEulLwLAqVeO0kFmZdKaYHVzfVlwWxvSNByHXYpw2dDlkCrUfoMI2VWIS0yQ
	244zYyC3q5W+FKXh4w=
X-Received: by 2002:a17:90b:3c02:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-370eeb160ecmr20413100a91.10.1780994198511;
        Tue, 09 Jun 2026 01:36:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e2d3:e3de:692d:5f7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18211629a91.2.2026.06.09.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:36:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: mt6359: Fix vbbck default internal supply name
Date: Tue,  9 Jun 2026 16:36:27 +0800
Message-ID: <20260609083630.1600070-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_093641_846864_11AF9B6C 
X-CRM114-Status: GOOD (  13.47  )
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

This issue was pointed out by Sashiko.

vbbck is fed internally from vio18. For the MT6359, the default supply
name was incorrectly set as "VIO18", instead of the supply's default
"VIO18". In practice this still works, but it causes the regulator
description copy and replace to always happen. For the MT6359P the
name is correct.

Fix the supply name for MT6359 so that both instances are the same and
correct. Also copy the comment about the internal supply from the MT6359
list to the MT6359P list.

Fixes: 10be8fc1d534 ("regulator: mt6359: Add regulator supply names")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6359-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index a27427974186..d9afbcc6a97c 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -706,7 +706,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
 	/* vbbck is fed from vio18 internally. */
-	MT6359_LDO("ldo_vbbck", VBBCK, "VIO18", vbbck_voltages,
+	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359_DA_VBBCK_B_EN_ADDR, MT6359_RG_VBBCK_VOSEL_ADDR,
 		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT,
@@ -947,6 +947,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
+	/* vbbck is fed from vio18 internally. */
 	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
-- 
2.54.0.1064.gd145956f57-goog


