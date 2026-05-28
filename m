Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84987CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=; b=y4OzZwNRZOvIQ9xEaBGN0MfrdV
	a7mmnkb2WuWVlrW0dpTa6Qc53Nq/aucbLZeqxd6DBR6HfsbH5ioW8Wv3Yhy0+OQ167OxxbMuLgEoO
	R7bDMMxpPRqvatr4PAsVG7t0SFD/Ap99VwlwAnJouAxq5a+mIcOgkx9UCw7M+tLzpt1MDsgT9o1bN
	tKZIA9+U8we0W5vgv1JObYkv7Axh7vG1nbZTngnhp4vVrwklggChm7EN/IY9kbDnpFZXVbTOBmrOn
	K3N6D4AAsQ/Jrzgefq+0kOD7gjZAcvhXAPQDcZu8HlhEJGsSMRXY/CtQyHwnrY8m+xQDd/TYzRoir
	P3RL29gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSURH-00000005Cww-3KCw;
	Thu, 28 May 2026 06:41:55 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSURF-00000005Cw9-2API
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 06:41:54 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso5138989a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779950512; x=1780555312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=itAX+fe58TyxwUX+vf1r36WMLK6xuIgs8Ecg/C1a09t+iViyHmQ8YAUBKSMeB0Fz4w
         WPpLc0/8G5wTQuodbHMLooH9PcYfg5CiM6O4c/IyAv+6rmC2xc0UKa9WBNsNUmzgwGEl
         IquJT+ANfjzhFk9O+s1scCC7V0CXSoZ0+2WYnoUWGW9ZpcY8LYJu6n4O9IAgpOss+4jb
         SGW72OJIrpX6lVXh/erlKXDl7fVsm/6yQUlXnzQdMLsonRCt+3zAAd7gxnFnTlCLLkcP
         hzUk4MNz0ZqwpDAPRJoPz/OGW6MPMjfFGZ4S4fL3EStdmmVnJeM2dqWw9mfSoYhVUS9U
         xm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950512; x=1780555312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=LV1zCsxYP9bCDvtIqG8uMHnaffKg9TnZkFREsSgOEbJNx4TfmzJhj6nL5+zu/JxYvD
         557e3VNY1XFRQlypaNNObBZng09dYCr9LWm9OKSIk9uM/iHwADuRvHjV7tGnghBQ2bTG
         EikKY898lkaNwY5zGCnu+CKjsNQGAVUfMb+C+rXEOmP10l0NnaJEFomyvhadTWWUvW+P
         EZlnubFGbqKBmCbGL2H5pCtutuaPSRoxWYtWn0YVDzYemsl+JnT5dbw4zFKfjiAev5/5
         jcxGk98/MlR1m3p4gAGcQk6QI1tt8hVGoi6qQGMnuZR28i4O7+tuWc0dZRY08H10ONVw
         bb3g==
X-Forwarded-Encrypted: i=1; AFNElJ9z9IRfy6KkVWwzNaiX02Hql3EKy6GVajRhTN5ZHR+GcKSDst0C1iAilKFkO8USZhhgdXLC9D22VDG9R/04Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJK+AP3ND1ej3tzcHRnpwuzYcI1R2A2OOSMiQ4wXbdSNkDkQWy
	M0vvnbDApVLEZRibhQL7Gol8CnfEys2L3FpGZWsr8DzIn9ix734IOWP2
X-Gm-Gg: Acq92OGdrAEp1qS8/5PIjpTrPEIp2Is/d+9CNz08CM92rNr2VySbkYscZoDQ8J5RKPl
	KGoK0j01JwMtSzGeiFjNnDXusxYdaagykhMUJo4Ihey/N7VCNGN+gm11pJwNbrN6cRDSZ38qcSR
	gu588UlKt6vhrEmRGEmnpEGqOfM0N6+vMvqh6VPckgOzEt5Iw9NlNOnD8M7rPGh0FfRUe/oRsQe
	MGupfinwSN9jTL8NoJUhsvZgF+6Ex35fwiaEyhtupYTwVBeSIwPFNtARjgppEOo76lK+ilDqhsa
	TYKRu5MbnUDVB/Au2zpjO0cVslpazFvsW0lWPkhyIIa4Gniz6Mfd4S/mhKgliH67fxrdzIDG8Yu
	abUqUpCJ+ibC2jLw//xSPR7XsIxVEdQata3kXom84Hxp8ekDZRdP3OgZqa9gvCmT+Lo11TZEG8j
	HSHcXoybEdgmgNtnHmf7sr+Vbspdk2WbzJTL8WjchlmMJE2jbkoTfAQ6YhmVc88S39Gw==
X-Received: by 2002:a05:6a21:9d91:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b328ee2e52mr27362688637.37.1779950512300;
        Wed, 27 May 2026 23:41:52 -0700 (PDT)
Received: from oslab.. (n058152075021.netvigator.com. [58.152.75.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm14417515a12.27.2026.05.27.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:41:51 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com,
	vulab@iscas.ac.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
Date: Thu, 28 May 2026 14:41:06 +0800
Message-ID: <20260528064107.470824-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234153_553431_DB35C37D 
X-CRM114-Status: GOOD (  15.39  )
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

mt8365_afe_suspend() allocates the register backup buffer with
devm_kcalloc(), but does not check for allocation failure before using the
returned pointer. This may lead to a NULL pointer dereference when
accessing afe->reg_back_up[i].

Add the missing NULL check and return -ENOMEM on allocation failure after
disabling the main clock.

Also propagate the return value of mt8365_afe_suspend() in
mt8365_afe_dev_runtime_suspend() so that the suspended state is not updated
when suspend fails.

Signed-off-by: Tuo Li <islituo@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f22..5966ca18c7c9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1974,10 +1974,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
@@ -2011,11 +2016,15 @@ static int mt8365_afe_resume(struct device *dev)
 static int mt8365_afe_dev_runtime_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	int ret;
 
 	if (pm_runtime_status_suspended(dev) || afe->suspended)
 		return 0;
 
-	mt8365_afe_suspend(dev);
+	ret = mt8365_afe_suspend(dev);
+	if (ret)
+		return ret;
+
 	afe->suspended = true;
 	return 0;
 }
-- 
2.43.0


