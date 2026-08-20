Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14AEC5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=; b=j61hs50lk2FHhWEAm9JaLsf6SW
	8a/NNB89zR3sLuwDFKtTcpRm5TWZs5QDhsPtXBYs455p5R6bHGfg0Nzs256uqfQTIKOuS7Evqyb0/
	+ZRcKr7bdC+i9YlZ5XLgZ9vMOC0fvq598jXj4BIkLc0FZ3FdQzsRHVWmIlE55KLR8tAsK4IsFyuzU
	PAzmdvB8AyNtlsXJa4Ywkw6bkjr63QGnkfS8/iujLdo2iQ0xfR1vg4zOJ6j3BAo/uL4KbxqWZ63US
	Eu2vc+KI690UzoK1+hnIM8RAKfeYQHXZ4cXqsySZOnYR2Gc8OzYGSwuKIrpDvGxQ3KV/O9Py7voTF
	N+Stgb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iY-0000000BQPv-3y2p;
	Thu, 20 Aug 2026 11:13:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iT-0000000BQLD-0G2i
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1991655b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224428; x=1787829228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=G9nC6fGnk1PKOP1HS/PqLqyhzCockdVv6UQiu6K1lY0Is/3MQE3QEvZLdOBe63/6gA
         JIA8sPY6GPQ2Xt4kwE6CvimOhQuShIBYnAiACtZ9FbdQW0lRHPM19ZzlNaAvduv/KnfQ
         +RD/EHkbV5b+7RparoLhyyvV3xzd0FiZ1ZFAEVzqvN00LOWspEe9uwvGhgQnRIyYmFJ/
         2fcXg8BVM8a7/v1XJ+enbsh2VYUCQzqqMlukat5K9kARU6CyL+xhkJmYV1sbNLhuCvml
         e8OeiH4ZFRDLFyoyMEqaLIbaeHLQTb/NIg28LR7YkOUHyHrebnWv1LmMI+ESuzvWsrUD
         iyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224428; x=1787829228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9ybHqnWFVYiAtnm3we5B2R9frVzEugQA8Zyjjnu3r8=;
        b=QbzYJpJPenJd3LDeSWW6NQh6HWM4L0Lgp6jWMc69G6PP6jRJd6kUIawSM9uCE/Zjx7
         D24RXsdd9uTuLd/wNQE0/g9uc6HU9ZTrf67r53P1sxfN9/mpUBWtAU1jtH6m7Jqa5Dk4
         xzEnPlHxfOoRZxHtkfZCWUrYwYPkWbITRiCqNqoUwtC3UeJ3K+1GA9UYIfo07bOnq1ti
         Jx98nHGTXFUYp1YUWUEXS7X8HQz1rDdRSUBTva4ddkusbsvPcvcaye+IH+WgfmOyeWev
         /2DHFGPCC/4oAmrThIDkVCOGCw7PNJufX4/vYtzUavk22iQaX/4ZsVyUwkTE5AXjhhcY
         MB+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrI/Wha9bhOStFnhY/uTvlXXjq0gRKBTBuah3b6B9mzuK3lTWtILNcFcmA3ylVqHS20WC/AQdHIwgLFF2GeKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZP63FM04qE3DagXwI4okedl3udEJuwaAH/tKiLr3NCBWcS4V
	RT3YGRbath+IF8pf5ISWitOTtyNJOomz+gtyqVSOplq0ilR1pP/ptP95
X-Gm-Gg: AR+sD138RrnMOph/MW4FMSQ1bJI4HMMIIZJCpi7Dk7UMp63q1BzD0ZJ+3uLroPv05Ex
	2R9CDHQgn7Uq0FH55GvDA8aba0QygOZGucsBKs4EuTbJGpY/j1R7ED8K3dxUf3NsOoE1JnwD1h8
	hFw7ojl67SE+YHSt8luwx3dvO6yjXuBNPpsfQj/KcTyECWd53lBokjAEeo5CWJuIZwrJMK7wYPB
	f1WbfM6C/ertKegmtXkvPQ49AUYIqE6dpN1ubynO9wuVJwGPi88CR5zU3t6A3QPd0dsA0ePA/eU
	zY7+HqMYmsogmFUZ/3/8MqMZf8z0NqnI7y4KGIOsS9CLt01kwoeo8IKDoE32QgrovN7pdX9zB2S
	btTLLYea1ieCovaase5aBYRgfJaz0xUBkF5DWzhxu/IkgN8B4gjKGiuAstNHxSTkIEAX7dH6FRP
	+iDOxXRJVD0ZOdT190YpXiSC2cZKqopZ7lUJtOprHlqGChzIM+Uyi23Lwje/AhF2gJDyiQo9ZLJ
	nprP4Ln6jL+nbEpAN5LvaKwvjuNwfM6L7Xz/AG6pmtFKMtQpv2CTcfdXbUTNIWxKEXEgq+9sMN8
	TyDH
X-Received: by 2002:a05:6a00:9514:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-851d395a3b5mr18400958b3a.15.1787224428046;
        Thu, 20 Aug 2026 04:13:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: mediatek: mt8186: Propagate clock lookup errors
Date: Thu, 20 Aug 2026 18:12:53 +0700
Message-ID: <20260820111253.97866-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041349_102658_35E59501 
X-CRM114-Status: GOOD (  13.20  )
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

The driver currently clears the clock pointer when devm_clk_get()
fails and continues initialization. The clock operations later in the
driver do not check for missing clocks before using them.

Return the error from devm_clk_get() instead of continuing with an
invalid clock state. Use dev_err_probe() to report the error while
preserving the original error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 8cc8eb8022b5..ddd509ca851b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -592,12 +592,9 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				__func__,
-				aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0


