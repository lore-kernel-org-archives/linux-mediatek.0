Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA9C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly4ImqVJ8nFpq8SIw5/ZGX4jKcnms3UqozgWVFQtu/A=; b=Vp2gGyDsTlbBrZkAItlcNOtwRY
	xI6MF4u7ngqyCdIUSuRPKLqbUgpjA91NV1cPZxXgy25lWr/iXyONj6N45qxmOUg/tcT5RywjdP7Mq
	pHD9oFUHWps+az/9frnAQdWqii7v6xMECCqmcf9eAvKNwlq6aYD5E/pJ/Xuaq8EMQnHRjieT8b8r7
	FFeW8kr4qgHTiMT2JBlFrzWYfZXAFKUU4KKGrfs+cHz6tLhHcw02EUIU8BJh0+Y/niSOGsXaDVcja
	sekmpdfZId9I18emGJymHN5AsC3PfkDRmvMu3KX5DTjIt7Rptg9JLFFCTUy/bnwbht95eeyTR61yK
	dw9iLz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGUY-007Diy-EV; Sun, 26 Feb 2023 12:51:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWGU0-007DPv-62; Sun, 26 Feb 2023 12:50:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4837B80159;
	Sun, 26 Feb 2023 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB669C4339E;
	Sun, 26 Feb 2023 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415816;
	bh=JEDiIUtaX6g3tzXr94u0tVLuH331wW8Kksrsq52VVaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KJDl+HGre8yXeUx2qaDrDi2wZvNZ2dIYmMUG1rcPYUNvYuSzehbaEh/fOnI5/IWNt
	 qd1XCLGO/mvCyeWMu1+YPB2h/n2SjS7KNu0prq0VQ2EGUQies2if/laQpoMK/VkfKL
	 4als1i4T3HaS4Bea6b8FXV9R2FwynDxiowMh3L6MB3lPDDKvAAvuzCDb3nGvQg2wSj
	 9GGiOKXHVtZs8jFhn9qG5MEyLb16B5OpWUmpd7vSCZBIIqzR/A/rraz2ujnZt2DyfU
	 nVcL9+iBGAPKuELGEKic7vJlBeqQU2b1VqRtpsyU3xHkJwgyI8FGVG9n/xJiCtBtUp
	 XY3gaYU+0A8TQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:49:57 +0000
Subject: [PATCH 2/2] ASoC: mt8183: Fix event generation for I2S DAI
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt8183-quick-fixes-v1-2-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JEDiIUtaX6g3tzXr94u0tVLuH331wW8Kksrsq52VVaw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1WAnugavWTX+9Hg/IvfRmt51ua6j+yicn0pEbPH
 asQEgkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVgAAKCRAk1otyXVSH0CYYB/
 0YSxCulCFXlrJOmzm6bM8diam+8P0CaA2QdRk+4WzbchuF3GPtZYVkpLATCYcFkge0COsUx4/f25Ng
 DEm6IaKvDx3uPBKT6F2o2utQBxHYPzaotQ0l6AzJ/CakQC+7h0FKRcwjK5yEWYGT0Y4LoVeZStSKfu
 rvLgBlDdRsXMEDGzXAhDzzpuU9y22LBshUeP/DQZnhpzYxFtUOlvCA+Xzavgn7FpA9Wxeut5Ztpq3f
 xsAVW6NAEr6b4xUwsgMfUazDH6Hh2dwnDuj9DzhaVKP+QLRrMZeKKBNHRjjCE/RTJRSODi+FkaI/nE
 4tr+kl9q1aYhrH7pGqFNzIEqt7tVnq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_045028_590633_9E550438 
X-CRM114-Status: GOOD (  13.24  )
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

ALSA control put() operations should return 0 if the value changed so that
events can be generated appropriately for userspace but the custom control
in the MT8183 I2S DAI driver doesn't do that, fix it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 38f7fa38ee95..8645ab686970 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -141,7 +141,7 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	int hd_en;
+	int hd_en, change;
 
 	if (ucontrol->value.enumerated.item[0] >= e->items)
 		return -EINVAL;
@@ -155,9 +155,10 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
+	change = i2s_priv->low_jitter_en != hd_en;
 	i2s_priv->low_jitter_en = hd_en;
 
-	return 0;
+	return change;
 }
 
 static const struct snd_kcontrol_new mtk_dai_i2s_controls[] = {

-- 
2.30.2


