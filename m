Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F02D0EE29
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 05:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=; b=JP+3blxtJb+U+/t1F/KdIVrq9s
	Tk3F1LHFgfkinls4bnw+bO6Jilbo8NyioNpjkEkmFumoOagCieso0tLr1Npld/gNDe58RdDn62job
	mOZdtF0s0jmb3KZhsR2SPI7P4wLamwVaHYkdVw9AY2sGN+05OiCZLAXCqQs6o2EQIO0rIzjZUMOfE
	NKla36yYv6zXvlVhIrPM7QiIWOtoU4ujea9eQ5dCkCflwCDHgcRAYlKsDltQyQgKRRezlG+OaMBOK
	rXXZGt0U9A+v3wO27JX5/5l0g45V+I3iXYaKxM3zIGtmXERLWeeHmQapObnoeS++CQX2JguIAvMrq
	NUgIiyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8He-0000000EPAp-1fzw;
	Wed, 26 Nov 2025 05:41:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8Hb-0000000EPA3-1sTd
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 05:41:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3636301f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Nov 2025 21:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764135697; x=1764740497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=iNAfPyavoIsky3lrkpUEssx7UqQE6LVBOlcCLgZt0LXIWlBi8cQNCvDo6DwzcarMRI
         IT+Jpl/97Cz6whdP3T+orFGy/wteHwKltIyWwyZsT9yPnzuzuvigRHUnkSovgsiRG9Qo
         7Iaeo1FS6ggozxG0Sv3q3JRLA0lXkGT6Z0bndvUASB7/DVtLeoky28lWgNDap3yYzR+M
         uiqKUzGgvkSgAHQrPCKTIZYbMELPNLPFW8R3/4N9qbxpFBSJOvoaW3OOlnJn+yl1TpBe
         SKX4i89w8xIEZY8FIuoBzLLoaJ/aqnp3+OPrnkXWehe711nse5uHrzK0PJoCpUmN1EY5
         3g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135697; x=1764740497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=FCuzegj0NhiBY8gXDQubPMflB9e+jmmhkWB319bPoLKrry4zNoy01rKeUclkRmMkDB
         kVSuLba3ostiAOVqxIY/SSaU16Y9VTSmVk9fUhvtlIs+mwEbDediYlgw5O2abGWtoGSu
         nznPEouxNQ4HXai40uPMGWu5f6SqP9tWlColQsuAgPlsDj/yO9vVzgoIFtQFsh3vPl8D
         UQOAVG3LlzOPZvMt3CMkOWQVOkiSlKi6UMyz71XiGiE6QnqWeOz/+JL3UfEXKNAR1iXb
         7deLSgeGFcgofyk4mYjYLvbQm+1UNI5w68GBgshF+ecL/lqL1/qIxCU+dCFCmTjRoBNR
         PMqA==
X-Forwarded-Encrypted: i=1; AJvYcCVRwg4Q2HulPDAxxa4YN6/2rux7OJ7DNHzKbA8dRm0A3agvIQv6Z1uJDcUu1BpoLgCx1Mbk1eKvROhy+ojoQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7VlTripP5A0Y440+3WBwnCAszg+b/T4jXyD7TvIkZhmquxpeD
	ZT14tsHoD64zl0kQbOKXfp43sjBf64k/Pz7qXkVen6QZMpMwng+HEoHV
X-Gm-Gg: ASbGncs+yCxTeqAD7kG+GiRVnAmtaY5pHxS1MxN8bDV32pNZ+m6QFoEVQY1SHlLlN08
	ZRYWzbANZyHFnmTnMsoIqBQvPAeCQN8bUgTk2xRzqWWCBQMSWqsPi7foeDmseen7MTEd0fQmgQe
	O5tuRBzjB8CGWfh/6HA0kiyFx/+SFPCdzcSSAC8ZcCgxYR6Gg7C28OGD1Bh3FvvGQkx5cAxhHHa
	Upbou24DBQg4yVoyjYONs6yXiG1oKgyXDBL2pTNVBV3l2sLn6HlRTze/AxDwu8Rm0X9sbL51FMs
	RDKFN9qmVqIltX3snQwKtlUZkN7nU/x7xbVdk9+RYVpPg5n+2NTVBJnVLq1yt9rttj2/dl9Ch+S
	Y3JjfkH7JXyo/0QGASBBs+e4Tfi9gQqNAWn6jgD6xmxvXEW7DxfLgo8zxaMTUV6XN5IlojPqnO4
	/kviBW7i/GC6Jz
X-Google-Smtp-Source: AGHT+IF5V48oVy47DDAvZnj5lN2hPNi8IKQoV7v+luO0VgruXL17m6le0MnbAaH8JmcsbJdk8AXskQ==
X-Received: by 2002:a05:6000:240b:b0:42b:3661:304a with SMTP id ffacd0b85a97d-42cc1d08715mr20198687f8f.38.1764135696988;
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
Received: from gmail.com ([147.161.143.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363b0sm38658536f8f.13.2025.11.25.21.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:41:36 -0800 (PST)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
Date: Wed, 26 Nov 2025 11:05:02 +0530
Message-ID: <20251126053500.56353-3-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_214139_506571_2F6F456B 
X-CRM114-Status: GOOD (  10.02  )
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

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace snprintf() with scnprintf() when constructing the property
and remove negative return error handling as scnprintf() returns the
actual number of bytes written to buffer.

snprintf() as defined by the C99 standard,returns the number of 
characters that *would have been* written if enough space were 
available.Use scnprintf() that returns the actual number of 
characters written.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch optimizes the error handling part of property formatting
using the scnrpintf().
Removed the error check ret < 0 as scnprintf() doesn't return the
negative value as per contract.
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.scnprintf

Thank you.

 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 44 ++++++---------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fd4f9f8f032d..77c58c9ec3e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2652,14 +2652,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-mclk-always-on-rate",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-mclk-always-on-rate",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
@@ -2668,24 +2663,14 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 					 __func__, sel);
 		}
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-multi-pin-mode",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-multi-pin-mode",
+			    of_afe_etdms[i].name);
 		etdm_data->data_mode = of_property_read_bool(of_node, prop);
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-cowork-source",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-cowork-source",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			if (sel >= MT8195_AFE_IO_ETDM_NUM) {
@@ -2707,14 +2692,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 		dai_id = ETDM_TO_DAI_ID(i);
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-chn-disabled",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-chn-disabled",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_variable_u8_array(of_node, prop,
 							 disable_chn,
 							 1, max_chn);

base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.43.0


