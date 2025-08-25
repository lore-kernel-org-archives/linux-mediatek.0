Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DADCCA0EFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYv1SFw8KHRTBAs11RxrIjSXI0+Dq/l8nNXuXGxjK1Y=; b=BIN2mCjDE8D8tz5JjAkmAluCbZ
	gBNTB4IJzQaQTsw846mjIk1uuz5y6n04HzAuS/1DNcB5pIWd4+VtxRFMo0ix3lTAqXrQv55C5MXvi
	tQjNCRYGO2cgQXPm6yjbVSyi4rDzRkBMXMYi3RENvAume8sRFrknr1+28PO6v76JDM7EO+9gY9xgg
	jzHqm2xlT8Bu1muXrqdy+qTU1Fk6idUAIXDIjl0i0klLfCX+MGA4ZCzqIkCk6ataNJ8GtFBcn84JL
	s+jEe9VC5a/9XH/clR2rn4/GDh0ctvRgFwps9xESxgesvpsk/hVqxXwNmYnAKrvC4W2lv2WkQrW2h
	vO3tCo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXl-00000008Zv8-2WEu;
	Mon, 25 Aug 2025 15:55:37 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYqv-00000008T5z-29kh
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 15:11:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so4277369b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134681; x=1756739481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYv1SFw8KHRTBAs11RxrIjSXI0+Dq/l8nNXuXGxjK1Y=;
        b=VKMJirks3e/vVyAzQUiaRV1xUs8u/p00DgFoXFT9YgykQJ59VgwsdbESvA9Io0PekQ
         hbRPYOPDnHffhKgLLFWP5vW68V1knJovMt7wULuO2Io99qotLlLS6wli1IXj+Yvjv8Ve
         tI5FnK1nt3OJeZcBH3KXLy8TEq820vuAehyAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134681; x=1756739481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYv1SFw8KHRTBAs11RxrIjSXI0+Dq/l8nNXuXGxjK1Y=;
        b=ZZEEsufUK0zTDaZ48O7N5EGno8pxIgGCrH6nMMMYlq8zvR8TKn75oXcDHGInZ5wRdI
         SqFboRl3OlQ6spY9djCAGuDSlirXDquqHzRzbP5d3WZLEbkIA/ajzm2oLukwDtIM9RWf
         SwpbAKR1ewvIlY2/zbjxTPZxMv8XnrATlbPu6cnWq321Asg+hsdpKUW07/kN6O1N3nm7
         xxRBByWf/4bIQ9Sg9DgvcoNa4NYBKB+uPCSsUSR6DYmu2YISajQk3gkGcaT67V3WPrfD
         ZNoBb4AKXEVuFPC0ePTgzDbXvsGqPC9d54nKVDpGL1COfhkjO4D9ddIxtNpTbO5A3lsH
         kjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXXJrFJJgNmpmWe8I2nCNm40uymM1wPKdXs0Xy8ggzUpXENxWd5YYiwVNpFLUyQ+zjTnGf+gfsdFLK/CpHVBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCuZPHCH38B/t4TP+4lcqb5sn445Bq+BLKVsQfNKbVkSWcukPL
	1eFvveWd5tx5LQmsyXMHBlW1CNOCwWp2s4bcwc2t8qFDoVhhUVZ1/x+mhFcqIrAidg==
X-Gm-Gg: ASbGncvW1ALWowWYCeRg8GG4b7MDQk5Xnw60JQ47TIRjRnSeCz3e0GCVqAChIZrJREG
	e88Ibpe7vccVZdSG2JUW22h/eWwOTcSsGAzFMcPcEU/yrUe8ET+twx5t7K2Hv0Q6PscMqzbGSo4
	PashHXtSeMVg4EeZvjNC7O9X5CxUYoQcvhbqoM8z6H/viYGcEtOwvHTNEIa7+UlJUL6/tTLACOa
	uTX2rRq1+S5o/C/WeXQeEcd6U1uwRmgLVsN7f0nKwHiYRTqYVbqNcBNhug1oLPS2xqQ8ydIgIZu
	4rRjrnB81agSdzEJsaXbds4p+YOM1S2PZF1u+sXZxE5J17I/gaymnCXU9ZzXxF29E7J+iQwMMFK
	/N9hHKNH21+45VbgpTBlj0Pph9YD2ZAvdAqD/fMLV
X-Google-Smtp-Source: AGHT+IEdQuMc4qvfjOIBTCp/6aJwd6EcXET57GS+m3OZRdtWe1hoQXNFWqvIycN2W/2OBfSyp1B9yg==
X-Received: by 2002:a05:6a20:7f85:b0:240:30c:273e with SMTP id adf61e73a8af0-24340c42b16mr19202183637.15.1756134680661;
        Mon, 25 Aug 2025 08:11:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d5a9:711e:13f5:e60f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb88fac4sm6956517a12.9.2025.08.25.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:11:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
Date: Mon, 25 Aug 2025 23:11:09 +0800
Message-ID: <20250825151111.3696404-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_081121_559937_702A3D3A 
X-CRM114-Status: GOOD (  12.98  )
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

Using for_each_available_child_of_node_scoped() allows us to get rid of
of_node_put() calls from early returns or breaks in the loop. It also
fixes issues with missing of_node_put() calls.

Switch to for_each_available_child_of_node_scoped() in parse_dai_link_info().
Also drop the braces around if blocks now that the inner block is just
one statement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unused variable
---
 .../mediatek/common/mtk-soundcard-driver.c    | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 95a083939f3e..a2a30a87a359 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -89,40 +89,31 @@ static int set_dailink_daifmt(struct snd_soc_card *card,
 int parse_dai_link_info(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
-	struct device_node *sub_node;
 	struct snd_soc_dai_link *dai_link;
 	const char *dai_link_name;
 	int ret, i;
 
 	/* Loop over all the dai link sub nodes */
-	for_each_available_child_of_node(dev->of_node, sub_node) {
+	for_each_available_child_of_node_scoped(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name)) {
-			of_node_put(sub_node);
+					    &dai_link_name))
 			return -EINVAL;
-		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links) {
-			of_node_put(sub_node);
+		if (i >= card->num_links)
 			return -EINVAL;
-		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = set_dailink_daifmt(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.51.0.261.g7ce5a0a67e-goog


