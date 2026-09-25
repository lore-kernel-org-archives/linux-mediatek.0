Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC41C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=; b=5DB/NR1rAjwS13yQgyyhpdfrB8
	c2N7bCPoOme5OB0rFVfOn51b+9CtrOSAu5XDCFJpoWWuMPjB5EHji/x35PCJg49jh44IEaq5OPeY0
	Y4sgJbrMmFaOY7cvhquYiKzqi+6XeMmyJm0Hy54Akwh2O+Uj7RmoNKBc73ZjItnU0YU2cnFO5iSeu
	MSFwCq4gft/Px0EecJomg5KrkrTselmgdQq/eQUkwLaHAXOyJaaYdZkM2qLndU+c1LgOGWhkL0iYZ
	tWfqeWysQAzdzVjcRydKk+gZnK/O5Xrtt1QVl4XrYw22STZ7jtKMWt63PJGgu2qqnSCfNdZD6BN5M
	G+Q6D+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtu-0000000Ce9x-25Vo;
	Fri, 25 Sep 2026 04:51:10 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtU-0000000CdoF-0tCU
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:45 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso35115a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311843; x=1790916643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=LRi1482o+P+yKBhKWLUn6BJ/qIckW1LvdcBPJtScx8oQIKLQBjvIduxiATSVeisLAq
         ldaMzAmNtOwC1d7RFF+y0XQTkuiY4ySpofapcAn84tfTqSCP3wFWDeF33olKcwoQSS5q
         YjnyxSbmSx61Oc0L2FmK/AEs3TxT4lQBt9r20cSQoqcqUT+58QUvWuaN3P1WkWJmA+W9
         yTi26L/PVUjMbquDTJ3ANrvhc9Sg37g3k9LTgY2qp8lJTZJaTDOlY2WJBn2RV3hvqcpc
         onEn5tLdp/WKoO/JjDTRRAF+vEdzqco/uB+Cke41v9sDnr/og9uOW8cXqRKuaDFRT2dJ
         R6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311843; x=1790916643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=HVZCU/8nMgbJVLh1uM4ywGAA37jNoJtMOK6uFtFcNMDI0viU9j9gFDex8/YpXVZtox
         YN+uAcB0LY0O0n0+5EA5pzwp+GKFm6z1vCt2j2rlIrfoxi08BnJLOahixW9YgshJgPx3
         u//n1fQcN0m5zQEQd1Bg38v6DXJ43UfR6ZTtDD8Ziri0LdXEtWcwTbcFS+uUvxUwDlGl
         W6/Zw5pG+UAIqdtWavaN3V+xTbOFQ1k39gDLIBt8el6OlTLs7m6u2AYtMMsPBK3qEjhc
         ZYJ6gPDCgiuSYvU/h/GZB00UbhQoHAHM/UuicZ5gY7nFChOcpF+i4nqGiWVGFE75zu00
         gwwg==
X-Forwarded-Encrypted: i=1; AKwUvByJDkVmL1RwrJKhWu5PKjN1TktyXLkY+l540uK3pNlC3ZYs62xGYb0luylNdUUjZYnL6t8wmxZWJKQijnCzIw==@lists.infradead.org
X-Gm-Message-State: AFuF++kMTV2/5Cvk7rIgnaF7J8g75SaCT4iNM/1wTRK5Ir5y7fwYOTqZ
	UfP9yCW6ZNA1CiSCeYnDFosiL5HFL+oyrU86K0vfDV+HfIKUqROT97nh
X-Gm-Gg: AYBFou0+UbpUhsc3CfwKXgRtn3ORhadu3LCYBGZ5+bwBZCieRgEnH2cj4K6ReTyWgDV
	VjZYxOgflqiF8ekNPfMucm9lGuRDzenMfoPmqv90tOSBnLVA54CZI5aVXKWzvDtIASq1E7FAMBx
	9M8UWZhUF6yb59AK5YuixT1w8EPgWjeVMYdrPtRQGQboXA5vagDXXSG+JJyg0UAYL4F+6077gwu
	Niw7oB4P6qT3fMlCJICt9PGd5Xd2ORBzxhYHJadcIp/XASgxq4rYwNuSPcTGjPvRH3weM/9u3NP
	uhI6MkoTX6V5zIXFa3SKwjtrR8nvR8Yjr3uY0orJ/adYw8MKfHTowOzBS9p0iWCh0m/Uj4Xtrsi
	oEQGnoJkqinfswZC/HPPb4/VAPFZxBcCgaHdZJBkquC0gDFJtmzNl7/uBf8N425VknhbhtabY77
	67udY4DYnLEfFVJcmAdG64g+oJsZ9Mv8I6ZDbsfUJIrPhEN2E0v0BMWwhSfpe7UNNbfEuw11UbV
	7S3iMFiWwFk7gDDT4KlKD5FFLVpLEe0sYmwCN86n4/IGoU3h2v4LMzvrbz7eWUJtJMNWcFFwPsP
	x1yOHNONXyqIeg==
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr301956a91.17.1790311843503;
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Fri, 25 Sep 2026 11:49:05 +0700
Message-ID: <20260925044908.450775-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215044_254630_D8B16E0D 
X-CRM114-Status: GOOD (  14.22  )
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

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


