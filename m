Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56BCAC5B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=; b=bdTrmXTea3chKF84Kp5OuqzWlK
	kYMH+lksGZN7fVTmky4edyCI73urUM2XnD8WuSEEQ0s2ejEvjnAcW4EzCtw8dUmnLLyBNXB682aHC
	8MWqR0tbqH+ItaszpQUmwCyYcAwDSJTeOPFOlvNFxANx9LPlwzUKO+8oM8QJmdunhyVeF/dG8NJ7f
	N8b4n0T/lFX8oYHp2OBcfATfMIQ43ZHgEAfS5hJ5kTYyY5XUhwlQamEoWLX5jISUJG/Gt15JDZp/p
	iHBdoVCg2+vOet/V3Wesr0RPlYJZ6FI5YepxubseTot2GZE74jJYIe/US+/epUueYKcrRexcb1dtS
	AIa2VTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v121d-0000000DIZ9-1Q30;
	Tue, 23 Sep 2025 12:21:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v121a-0000000DIWw-3p0t
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 12:21:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-77f22902b46so2701734b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758630098; x=1759234898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=;
        b=FnGaaT1v+NSlKBuFHrpkZflRiv4no5b8ZVeei/ZDfDMFYMOaCIyr2zSBQcjQi3YGwQ
         BSjRoqzRmSm5Luh8KsCFP8VrP4S8piYfFnwQ+6WLtQJXHU/ZdkJMrsO4wxOZ6QV64l9D
         fKAnxuY+ONKJw+aRHBESIOYQ3CsKcQKPee26C3nr3gnOC+lTl0yENi+XoeI4HxL/6dsN
         s29Pl88cNjuPVJfYtPOQIEPT60NeUDg0KCIGHQuBTyw8qnKwvN7jDiN/yxzldbR/wOjU
         gYjygdFz6bmHUMindh+sdO241Z8m10xRnwYwPCbOKvTPDN5/z6muhhi3oiw+pz1PUNA1
         MWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758630098; x=1759234898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31NDFIT1J77T6WgOgaD6KtRWo1pajt4U43lgn0M+eTk=;
        b=CBHp/O6MtcwEWvPmErXfHClV2Y7RFs+KzY20CZlEIhpfbatfWFrXz7xh24sQq48iim
         TInGfHe1Z15d9zxpeSIJ+v7ZeVjYtpg0l2oUtOC2HgvBj8LYQ778HEkte9iImguM+NFA
         fWxuT5BnpmsWxcL2s1DQAkgITTdgGb7CPyNeKSwnnakB24rjO38UssyVHJcWKSWWKYb4
         JEVDBV3WjykNQEiJe2FAQRlmqw0dh19MgXGP7ygn7JsmJatyJTreQ54cJ1KAl6AJOG91
         NJCufm8ktabrwccyyPVCEtqan8Rxpt1y5gLFfrCvxrnri1z1KDjlpU2SNicre6UPVhz9
         YM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5ju2Kez9s9ZOupyZhXoEe2x4QUnlOgRcDlGzzVPUWetsuTq19BVH0mKIY066Q8ynq4msP6+vrpgR6TB9U3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK31swW7++nALsPdYaodH1f6xDFg6clDnc5/Z2ibrDeTTBCKsq
	I3iJ909JF/3s2+0ZBl2SZb7bznzHGrybqdcPog8UyCulNZEKSKZgN9v1
X-Gm-Gg: ASbGncuWlk2qqn1dOKVvQp8rEpHOZEDbAX+SlkaZm3kiVzf14wetxhMqTD5LByn/pC1
	x7echAQcMBIzKnMcHqZYVkQAlH4tvj3QF1b2fNXKegH2+ZoiHWfdyWAXcRkxhmhkkibbH2jdk9N
	AKCzsmalOVYJHR+jJ02qqejPCT/cxMFDcGpM7bdVPpvG6Hnu7IwrN1tt5zw1bWMswhJEvALRLEe
	Z16oyqUrfD8taztPEP+wKs08kph4JSYj/h3yGvFU2ZDN6ML4RcXFAUcDPEBZx21zsyDRjzDNmfQ
	7wKQKvZ4pGmhox10pcsLWcYBvxuDuuRI9rL+Xpcwl/iA1Vt7CSU6zE9OPX8rivMg/LuGKECCGvn
	VnVWSGDvyjuM4lJ4=
X-Google-Smtp-Source: AGHT+IGapQYbJxxDclXfWf1hQJL8kcsiV3WYPv+6b0/vrntM1EgcdnY/IVTVQnQOpFXNKfmNw7kNBw==
X-Received: by 2002:a05:6a00:1706:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-77f53a2a233mr2209045b3a.16.1758630098030;
        Tue, 23 Sep 2025 05:21:38 -0700 (PDT)
Received: from lgs.. ([172.81.120.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4fd7223esm2786939b3a.103.2025.09.23.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:21:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Tue, 23 Sep 2025 20:21:21 +0800
Message-ID: <20250923122121.1855051-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_052138_976669_4FBADAB5 
X-CRM114-Status: GOOD (  14.14  )
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

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock before returning to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
changelog:
v3:
- Move the Signed-off-by line above the '---' separator.
- Restore the original spacing/indentation in the devm_kcalloc() continuation line.
- No functional changes.

v2:
- Return -ENOMEM directly on allocation failure without goto/label.
- Disable the main clock before returning to keep clock state balanced.
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..570fb10c306d 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1975,11 +1975,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
-
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
 			    &afe->reg_back_up[i]);
-- 
2.43.0


