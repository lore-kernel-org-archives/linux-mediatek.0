Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68309C79FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=; b=TcbA6GYULRNK1vYn260guQlMN4
	BEIC4tttexUiYFdHDPXWvP9LxYrd+ATe5NTwpIgLwhaer76NVfWgbkj6phIi06w17WcSH2rCfWhIF
	hNhFF7sfSXaNKWjoWUjk9IdBoTMd2TiFq54/Aa9stmvGMq4tvXoWzwoNefJM6Sdtcf8VLKcu5K3u1
	RTdAq7yg4+dPTiv/7xO9AXizYW7v6iNqkLkQhFx3mrTDUVy15cnnxXu3kDMV3zY5mTSvM4PVS1q7v
	0Wn5Ss+a9R0RKSUVdBmYFMgaWeMqGpjIasdkGa6YGEImBG8Li3syRQ0UcSfMYMgqKEsj0sNuLjzWh
	3uBL3jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlN-00000008VEH-0lRI;
	Tue, 08 Sep 2026 09:05:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlK-00000008VBg-1WxJ
	for linux-mediatek@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=; b=FBSxkE5sXZxZS6/8IoqIcjIRFI
	5aX1G/6UxXKVLRsN5FaiwLX7H+YKfPumn6LUjGjUg3o30Q5SUkOVSpkj6NLj0tse6AG/fmmvOhCkN
	s8UocVW7wrDMusWJBDx4D97FDyEi6EL8zmk339Pe8zFEnHQylLUt1yitYAx0NWrsRy2+eFXwfEaQ7
	yiurKiMhoHVbzf0HgIpJE4ALO36WCtonrgVuy6ZOCHrBViTzqkrr9yXIBceNJitSP7XfWQlRiEEDs
	JKttRBiZBI/IPBcEUysSaiCpBJiMOeqCzQvW2R6qHmPhKlnBLcA2P1/iATAF4D2nk57iztk6rqw5n
	t3FQjeyQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rlH-0000000HAEc-1sNN
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482dd6ee390so5018236f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858301; x=1789463101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=cWWD6jIFyfDZY87w9iiIrZj+owbANpHdGx1iyM7hHJSqjbZOHQlsFLoFhXeRMrKx33
         /1cJ5Whl0XxXKmmmZ0ICwXZbLUMbjQqMVWKGyvM2q3DFPydqzWptvElrsyqtCBZ8itql
         LAlOBG8KwSYceZBZccFTwDIyqwOjo2ewv8MNCyRW/5CE87dqd41pUHloj0aUK21zNqtj
         mvSx/m+vWu63YBSynfnTtTS0/FkaRf7Dhvw8gUTwaiDv8Cf+L57U/RBZwQWSlqeBmTxn
         cJ88J04ZoH5mJ3Iph36P9U02JFW1/PydmJP6MrsonMK9GxGJaiQ0kXbwqv0dseAmDs6S
         5Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858301; x=1789463101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U4zFNvqb3TCUq9G6zwsXaSter1qm2jsnjI9BXrVsaKk=;
        b=HZpyyrGn/+EnbYsruEXCZHSB0su1Apbfe+ORH2lynDn/b8l5kxsqeAuxB9gU5AfdVM
         iUYdMS07nqO7xnuSn02rYv+mgjwXHFxG6+btOZM5qMPiL7cJT4clqE/NXoyIF263RknF
         AUGQfK9sHIHcdRceU2NIzF4wW4gRZhfrVYYkseVoz262aZnZrn4EnWXJjwB6O6bSbYT5
         jwv8MuGqfJQnjJMRhSYMRBPKtn0bDPKudpOfanwxqWqGZzSYpv/Fk7HGJWtzKRnIbu8R
         yxdkZEiYWpcOq1itADieS/6gHdEUDzgbNqA+FGMbc9OPKJqO8gu1x32UYpkjtkMcU9PH
         lW8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsnuGrS/lekhF4NdY8qqziw0nkY1daAApCuVSpZJ3/wlsyXgowWaKnbx+qcUM+FXEQXe1sF5OoHxv6sCrd+Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nr9ZVXXAek0K9HSdqjHi29dMkPeAlnwC83dsiM2WBKiRqeooVC
	KBepCAjyjO60YJxB8gdy7JRexNvERcYDC4uTf87aBIAIejmLzNiQ1/b2
X-Gm-Gg: AYBFou0al18sUyjagb6IguC5XpNo804ovGyIa3MI4ft72F/lTWKQ7bPxEyGrUg+BWgR
	2hY3UGIcv0rgL2hNWeOT5X+3NlXbv6caOxvsRl1+ikEy8u0or+c1PEvQLlGJZknPoQ0mcaW22Cg
	T+tSm5CjFTiuaxS7BFXqN7twmn/hp96gO2mlZs3KSWtOAkCsst+9ZZkKGarGge8peFQHI5EuPTm
	y8XGjS00Kn8vSX4GDPe81T1IIWB8FWfj/b5PpSU15eZgViWCr5dpi1CTPUUh7LzBnzaQblZBrdV
	FRZD4Fe4D0KNjJZ+tIUkd0Cavg2o1f0yd4Uvsw1FuecXeek7ruFSIkadX15mTh9bo/vXGnVhRzf
	Q+C4QS6YhsYB0NH4fLjjtw1EjHbJL957tm9JOiImCjTVI/FvzG98cxAMJpL/sWoErW0jEMzlODL
	KOJYr4llG3/TnBzmRT5Y90isPzDVgtN4/gbeg/Alow+hAWPck/9ocjSk+mkP27mHqww/SUXBDG+
	WpP9ZKCG3Qs08yZpPE4k+06D/r1+DBzt6kKSGpjEJgytCkNIW58
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr28074029f8f.21.1788858301380;
        Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 3/5] ASoC: mediatek: common: permit to provide dedicated regmap for irq
Date: Tue,  8 Sep 2026 11:04:45 +0200
Message-ID: <20260908090448.3332-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100503_795749_96C6BDFA 
X-CRM114-Status: GOOD (  15.77  )
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

Some SoC might require dedicated regmap to configure some specific IRQ
register.

Add an extra entry in the base_afe_irq struct and use the specific
regmap if defined.

If not defined then the global AFE regmap is used instead.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 +++++++++-----
 sound/soc/mediatek/common/mtk-base-afe.h   |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 2a20fa5dba49..948f606cbaf2 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -204,11 +204,15 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
+	struct regmap *regmap = afe->regmap;
 	int fs;
 	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
+	if (irqs->regmap)
+		regmap = irqs->regmap;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -220,7 +224,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* set irq counter */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_cnt_reg,
 				       irq_data->irq_cnt_maskbit, counter,
 				       irq_data->irq_cnt_shift);
 
@@ -230,12 +234,12 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (fs < 0)
 			return -EINVAL;
 
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_fs_reg,
 				       irq_data->irq_fs_maskbit, fs,
 				       irq_data->irq_fs_shift);
 
 		/* enable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 1, irq_data->irq_en_shift);
 
 		return 0;
@@ -248,10 +252,10 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* disable interrupt */
-		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
+		mtk_regmap_update_bits(regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
-		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
+		mtk_regmap_write(regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
 		return ret;
 	default:
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a406f2e3e7a8..b5300c9ed415 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -153,6 +153,8 @@ struct mtk_base_afe_memif {
 struct mtk_base_afe_irq {
 	const struct mtk_base_irq_data *irq_data;
 	int irq_occupyed;
+
+	struct regmap *regmap;
 };
 
 struct mtk_base_afe_dai {
-- 
2.53.0


