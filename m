Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 01:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=exOVbO18VAvGpdy2XcuOstpZ4pYUb34KRK4tKYkLexs=; b=PFJ0vruz68uc7M
	m+0QJ3aeRSqj4Vv5B7h/U/42HI9XIrYzcCF+GKJ7YkAHkql0ZkbXDxrmuwv/rMWxeUKiLmPjRhHqL
	DKU5oFW23b8bum4KOvPfpa3OnZPOKo6NtoDjzIK8s8dXAacnVaHDjv7zT7VB7+j3q3GYgkPDcqrg1
	AaM7SH9+67TWmHvxB1Dm9Stwv7UHgHPZVjYDWdfdTlV2OhRe1azGRQdsFU18mUR9M8ljHLhgwxd2Q
	dlZL2rxmy0L0ZSb5/edGeRgVRKY+09+Xibov3yiPM392/H8a0gTMs7cxVE5/CVj/KoaJo5qjKfFiL
	UDrwkOjg3CvT6NW2yw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv8gZ-00EiaT-P5; Thu, 09 Dec 2021 01:57:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv8gL-00EiWY-Lf; Thu, 09 Dec 2021 01:57:15 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3628515pjb.2; 
 Wed, 08 Dec 2021 17:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5JhuTQaSxTx893jA8OEYjLZ6m+UdW5ZaFdhJ6c8uD0=;
 b=Ba1znVjXLY9GcEcVgPC+HjDyG9n6vEr76BaqSF45Rkblx6GhAiq8SPzc9NJLA23TTx
 QT0pbH1LhxSGNgAeqp8W9y1G2PYsmJx//5tjLbJ20xIy3iOXFJKaAtVBNo7YsorhwAAT
 LU5EllIYETKOGr487pn8D/Ehhg8Es07ACMwAVhNT4x4HrsQijtW51S9o+GuHvukAZoIb
 71+he2EX2hylva4nv7QvraTYh4Pus/ACybGeZR99wQAXKtAXx4GMQff9Qx8RVxygHwzD
 UlduSGJvGrYaPjs050TLuLiG43iKTiq/JYM496cEeqUxyh0alkKc/YZCbyXaN4P/L3xn
 8d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5JhuTQaSxTx893jA8OEYjLZ6m+UdW5ZaFdhJ6c8uD0=;
 b=r+dMpOGjBYKn/A+oC9paqyQqrgDuY7XV/keWypKQAvg5ouRqecVUztlZxZQhZCk1Xy
 yZ43xENGyWgA/bogkBIqBDJ4dBLWylxYEGQa5ZgxbVWe+NSgGWalU9gWt1em/JLafpQ0
 McN7X/a/9XwlCwNkAARxYzX0yl04hPdt8a0/EmwWVc+5WKOTb6K4Wn6zSgy/wnztPpLS
 cY4tQH8cgLW1sFcx804AbgltqjFY36Gw/1wVYV9Me3pjCHMv+x0tms6n66cbaOx+DCHa
 i+ky/R2lM0d9Bq0Kb+bymgaGK9ggP7pDUSRJUrt1XuKciCYiraJPKW3abfhPSm9+lcwZ
 SErA==
X-Gm-Message-State: AOAM532RTxwPY1gncoy1yd6sh6qUJDuRnpoS0LchuHIaetkey34JvcIh
 mZqx0cOObj/ZYj6K6r0Q2lA=
X-Google-Smtp-Source: ABdhPJyn5cV0V2r/Ax01DHo15SrmY4+pGt+Dmaz+wqBD3YLt3imwzKNbDbcT3qSwczTEmqQdiaDiKA==
X-Received: by 2002:a17:90b:351:: with SMTP id
 fh17mr11764748pjb.19.1639015032987; 
 Wed, 08 Dec 2021 17:57:12 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id i3sm4546748pfe.75.2021.12.08.17.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 17:57:11 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 chi.minghao@zte.com.cn, kuninori.morimoto.gx@renesas.com,
 srinivas.kandagatla@linaro.org, pierre-louis.bossart@linux.intel.com,
 pulehui@huawei.com, srivasam@codeaurora.org, lkp@intel.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cm>
Subject: [PATCH] sound:soc:remove unneeded variable
Date: Thu,  9 Dec 2021 01:57:07 +0000
Message-Id: <20211209015707.409870-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_175713_745984_85FB272C 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: chiminghao <chi.minghao@zte.com.cn>

return value form directly instead of
taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 sound/soc/codecs/mt6660.c  | 5 ++---
 sound/soc/codecs/wcd938x.c | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index 358c500377df..3a881523c30f 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -47,13 +47,12 @@ static int mt6660_reg_write(void *context, unsigned int reg, unsigned int val)
 	struct mt6660_chip *chip = context;
 	int size = mt6660_get_reg_size(reg);
 	u8 reg_data[4];
-	int i, ret;
+	int i;
 
 	for (i = 0; i < size; i++)
 		reg_data[size - i - 1] = (val >> (8 * i)) & 0xff;
 
-	ret = i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
-	return ret;
+	return i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
 }
 
 static int mt6660_reg_read(void *context, unsigned int reg, unsigned int *val)
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 52de7d14b139..0033d61d42e8 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3083,7 +3083,7 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 						int micb_num, bool req_en)
 {
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-	int rc, micb_mv;
+	int micb_mv;
 
 	if (micb_num != MIC_BIAS_2)
 		return -EINVAL;
@@ -3097,9 +3097,7 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *compon
 
 	micb_mv = req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
 
-	rc = wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
-
-	return rc;
+	return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS_2);
 }
 
 static inline void wcd938x_mbhc_get_result_params(struct wcd938x_priv *wcd938x,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
