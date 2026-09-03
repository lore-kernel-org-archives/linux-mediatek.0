Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBB4C624A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=; b=LD445+gz9JjzQoZRMxj7FYJUjb
	zACVIKH9enXCL5pPRYrLDi2pW7C7Er8C7Wf78znBn3Pep09qAjx1mGCLCerbpcDo/hnPKrk0O+pfK
	no7VFJL5O48lfNNTdfJpoRNyR/FylaqAgVq2Ci6+JtUzFC02zvjjqgvjoq3DoXF4b1nkfBigx0xfx
	UY7DRmnWok8KhSLQ/1P2NhXj9/1UOZbmMVmyYtcb1RGFXZ7AUG15j7452yn01Am1S42HxNWK1ScMU
	yDseuV/RN2Df5e63+/g2ssDhRfgkv17GOeiAMz4AqMKIaTZbP/0Zm/oB9MLzxWlFJ6Eqf0TzfBESw
	6KFrY9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRh-0000000GLkw-2KIH;
	Thu, 03 Sep 2026 04:53:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRg-0000000GLj3-0E0d
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:53:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-395cf2535acso665262a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411183; x=1789015983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=jOkTY/R1zG5uTu6wpKtjOX76YKsA05n3r+fJFN3qAcBaTv+6XBlq0miiEg1mq0x/du
         9vbjO4y7EbDRT++DcEwiNNxJHKrq4uM/jM3PFkyplggac27I4s8VmpcKiP6Xl7+KvM2c
         jCKFKQtLsMAmSUdsEhegfPCYwLi5z2gJKcqZBeBIeR/0LYogF0Okw2zxiFXVKMmh6Mmn
         mtnJuLI93wKimgAKyelusnP8wIzsKyc2g1eO38LoOW/+hkpRFW0H/6cUbaZ4+7IASKmb
         iIqIRyByVmhi2GOKFKzfMGJ6Udlyy0JzEDv+oUMFYjglHMQzm15iZXfM+XXMcNmTxlZp
         li+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411183; x=1789015983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=pS5pQ+XQvdKbVxlq6kTZu5ldvWy+WiEv4dn3Xt4f4pUR5/YqMAE3LiKQCvuWGTcO8Y
         dQdZQrjfxP+qEfBxbzAXtoix5t8mGKTow/cPgagzhnfPPTmhc6N/6rcQ/r4L1FjhMswa
         Hh5GwkBvVlmC8JX9o2yA3NYHIsguk9hxY4XcGDM3SsCr8SDtN/QBMLFAMlSCN/UinQG9
         fSZ01koQ69IsxVdlhN8xInRQicLF/wZEX7DQqqIfOdcB7wHaLdnPbt9w4v+UpRiGwM/T
         tB2Pj17nfkS0LWT4LGIgPc8Dj9Y+hll/pG9GW0zumkJCPzF+Tgm+GNaQUZOTqpPSg6vA
         /zVA==
X-Forwarded-Encrypted: i=1; AKwUvByf3SBXXZ6jN/W9DTP1lYNXlxsuND9vdG+/FBjZ6YaP56YYXC//S3DrZii8+f1eMZFoU2gdMqKm6Fu+8Qsf5g==@lists.infradead.org
X-Gm-Message-State: AFuF++lV1cCph5DgCm0gNUHjkh6KOCowa1kWRULjDaXF7TMtNJmEwF/a
	4vWZ0vrQBqFtPX89qZ/3smrvpKBZv4hC1M+TSHr9hHXPxW6C4Qy+JIdZ
X-Gm-Gg: AYBFou2UO5m8XluI616hW6aeMdMz+y/UGlfuzfpqxVQwgIdCCM+3wuCyzGpDO+bSem5
	QxMNJkdl0uwLJbc6YWPS0RCzqsFYCgNYLpUR2mlC/FSJS9LuVaLsDAK0yu6h2Fh7DMZpzZ1TMI5
	yeLDmPXuFB6CBe0Iph44At0B/A2/ym66qoYQXc2VSZEkWgI521r8+HqIroA14+MdBMhQUePaC0V
	PM7nitxxOmkj/3oxWnKsPCjdFDNKzMkZS0P3lKSd2CC8PuxDLm+Ul5Fgoe8J6khoSxgxFOBTPab
	iVyv7dV+ZqqDEWFX8nywfMQHPcR8W32ZAUR/UgMniEzB9DgbsqqFU/MgJUIkwKaJ4cAMost1Pm7
	FZUKaQh6EGX8LOZ+edARpeII/dXl6LDbqT4TSQjfl2HwgUQznWE7eGTf3IQYcLI8tzRT26LxPa7
	NPNXO4A49ZBLVUUkOyaNh7Vk8aF4BJjEsYo9lw0YuKnQAQV5O/apoSYHgz8SlvaYl8MMg3RhE5M
	ARDfPxgVZddEb5UD+MlQgVyubt9/a85QTDdvQNZZcvU3VUV0q7R1aFSfzgXLQ7QRkpYejRaTyhK
	0LIV
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1191332a91.15.1788411183106;
        Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Thu,  3 Sep 2026 11:52:02 +0700
Message-ID: <20260903045203.175337-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215304_094777_32FA51AA 
X-CRM114-Status: GOOD (  10.98  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 06556689976d..40f9afcdaa16 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


