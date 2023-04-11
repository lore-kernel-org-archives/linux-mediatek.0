Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C938CC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VV8PXIioY+lpB4ukX6X0D5BOfhtAOO5OAgem+yfBPzU=; b=emNSnwkWUrMgPiF3M/NlsBoZD1
	rqcexpwMJ4N2rdQgtgomlCgR2DbB4Ugq0VfWTgLbMY8NsjgNcO6D54HjG37IdzaKfIIexk0yEcMYD
	Dlqomfj69WDV0mAh481gG7dBjrjPB+VyRErAdFZs5r7KsxnteJ8BV7Qfah2DCPMs3lFB8Vp8cvo+R
	VEC7CRL8w2+ma4ZbNmhBDVRDyP9vxN0gCezPAAhGCPn+r35ji21Ee0vX45Z7onBzBdafLIsWBOrxh
	cmLlzIFl36YhNKRcL4Y1q+jsxDpgYNVSz1TzcT+YgY8wGI/rQgTfoTQOBo0C5gL0L1moWql6+bSNy
	cIQdzdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1yH-00G9pn-1G;
	Tue, 11 Apr 2023 00:34:53 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm1yC-00G9oZ-12
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 00:34:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-54c08fa9387so142240987b3.10
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 17:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681173285;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VV8PXIioY+lpB4ukX6X0D5BOfhtAOO5OAgem+yfBPzU=;
        b=DwHddE9ICDDWjQSM54RArNBxPbpLZ/n6gkwcx9BCskxL2erXnG3TX1P1/lmatz71h8
         e94TF8KXKDvpyL4+PvFL49b96iK4zjO7oAD6oKVkKVTugVr/ROAVKTo6DG3IYXBNNIwd
         KZwGLSxNmgNkFDNODIwPNAG9WGleBFL4Lg8DGM0uPXamolTJCKG1FeSxuwZta+gWzIs8
         GEieLq6UzVi9zxIKuSHQrSuVRgg613rdEsagFCHxGrV1UU9im61ClVqEDPa9FRAv74zx
         VtHQ3ba/QpGls+Yf8jJ9cbGHYt0miiDAZ36gBf5/V7GI1LYNdafonbUf2M4vYCef0HDE
         FW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681173285;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VV8PXIioY+lpB4ukX6X0D5BOfhtAOO5OAgem+yfBPzU=;
        b=7KK7KymIHqg1hWOFxWQiuCev8whfg4P7qAiamC/6J9JMybwODDY6JL/dyuMGRQA9Qx
         XFGITfvWlHpDLD0dXhQKfCFAscTaWeO5SkGNbT50eJfzGTA/XXgSAvAxKH8tGWglR1MW
         /zKOxucYY7jKygm4NyURCnZdvpPORj2DNQ4baQDnLa+hwVGRdzHpvAEBP7EwRt5BDIA2
         zmG/unSUiWCEIJDVL5AUxj8Ti/GQR/hlTfZ7sQHsvtubHQy5fo4YiigPtZEnf/bAFOvv
         fKgIPt8bOmUIqMOGrEsun/TE9aMg1xuP5z2cWHFAkfdg35+o7BZrvbgO0xfQ0FKc+0+6
         jIZg==
X-Gm-Message-State: AAQBX9ecdGhmGgD64cc2ppT1wjzAJaNAqYLTfqmJ8tmqF4Rxc1HaWH7J
	hDuhOSaLg+HxWItO4zkwwNsCHfFPNZCt
X-Google-Smtp-Source: AKy350ZOwDyxZ5zmnvjOtmK+m8d2Zb+sInKjo5gza1IG8xreF6QccHiFCV8qDL7zjDXDQLZcFmYPSNKGp1ua
X-Received: from ezekiel.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a81:b284:0:b0:544:94fe:4244 with SMTP id
 q126-20020a81b284000000b0054494fe4244mr636814ywh.10.1681173284695; Mon, 10
 Apr 2023 17:34:44 -0700 (PDT)
Date: Tue, 11 Apr 2023 06:04:31 +0530
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230411003431.4048700-1-shraash@google.com>
Subject: [PATCH] ASoC: mediatek: common: Fix refcount leak in parse_dai_link_info
From: Aashish Sharma <shraash@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aashish Sharma <shraash@google.com>, kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_173448_403520_FF16996D 
X-CRM114-Status: GOOD (  11.77  )
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

Add missing of_node_put()s before the returns to balance
of_node_get()s and of_node_put()s, which may get unbalanced
in case the for loop 'for_each_available_child_of_node' returns
early.

Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common code")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/
Signed-off-by: Aashish Sharma <shraash@google.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 7c55c2cb1f21..738093451ccb 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -47,20 +47,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
 	/* Loop over all the dai link sub nodes */
 	for_each_available_child_of_node(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name))
+					    &dai_link_name)) {
+			of_node_put(sub_node);
 			return -EINVAL;
+		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links)
+		if (i >= card->num_links) {
+			of_node_put(sub_node);
 			return -EINVAL;
+		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(sub_node);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.40.0.577.gac1e443424-goog


