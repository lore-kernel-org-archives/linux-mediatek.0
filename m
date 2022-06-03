Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D425DC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qg009EGwwhevlOeYkWcnk03qeddjWq6YdvD7xXI67Ss=; b=i1fa9rDzboMSh5
	mTPcf7KDvZ809PER/Jua+syWfeQn2nx8UOaBchpbS0KXpZKh8mRxu7RyBiY8tYgNmcdeb9HrM/Zoa
	B5keXVoLJG6qqVxJ23v/dJlIIPa6bmnBjZXx80eBuLCgmf5FQgIqt+Gw4LK//Wqd4Z+FkUVk18We9
	9Pwk8VqFu0wfASQcAjz5W+IN+QpIQ9sS4l3/nFp7JQiPhNYdBfKiehpot+WlNw3mJU/zpRriMpAkf
	mxeMU8BETnO9/4Zn8/Dp+az/PJs52PRH4agcALwz0Ryjz8HctuXUJYIK6xNWn63DSO72tdKV0FSYB
	sY9YKrU5Sz7CQl8/zWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6KL-007Omh-H0; Fri, 03 Jun 2022 12:22:53 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6JV-007OQ7-O1; Fri, 03 Jun 2022 12:22:03 +0000
Received: by mail-pf1-x42a.google.com with SMTP id g205so7048742pfb.11;
        Fri, 03 Jun 2022 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VC0YJVZn7Kv6rn/9H6pSETWMjRj00JSP4l9cAHh5eU=;
        b=hROkOAQnkmQctmhtlL1X5NiOE3QXbtEkfIJvBno2MFCdveIkW1Kx36uOmAKO4ebT0Z
         QFcLvV1FAiydy4xwFUEtjTgcTg7kDI7nAD7s7AusEVTao1eFqEJtHnMINWF8Ki5oe5nU
         6M+t9EyIWLPH060tBgvGubZ/UtPZzcg8iTOjyIteG1qOQ2rJdBuUZ9VjymAASIPMsk95
         FZZihZ3m/6Q/GfUE3fn2Vynix8OvJ9N2t35TnUiWRflNGc6TogspMjzsXRkSaiVSm/cA
         2Gd4PdL359hpW+FgdiSNaZIa0iIo5p6Yn+Uf3HupeYEQIdFEafpNpt/91kuianpwz6JB
         HAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3VC0YJVZn7Kv6rn/9H6pSETWMjRj00JSP4l9cAHh5eU=;
        b=bMKhghvYTw21iVUI/eO87hGxc+geYVXVOKZq4Bcps/id8p7qXdOZ4GKvAZ81CW/xW6
         GPz7Z/BWwnIxJ1R1DM41tVaEIL4q8/nDopWGYbxtUagImIaUfi7VWTlSAQvNjO9MWFyF
         kw4+Y2lN/IH1wYEWHbyXBKwbvtHPMr+aU0vvFjIRY0UajIP5SOjrku0zE/kd7mH6wGW8
         dC5odbNu+INnaIAe2IPXzvLaYgnEuaVn1ymTY8kitYnTQEkB6PfCOAxYw4hJ0yDECjqi
         WzRwKRSCxPWG8XauQq3rKdlqft+jLREcLh8JpYsjJZOg/VDZCY/jPhggY/QT6v+gSVzp
         MXog==
X-Gm-Message-State: AOAM5339F43G3WRIblOJb73s581eD+A05hpTolJHXbqiK7qHkMz768wY
	pbgyRW5Qz4Q5yCrfzAab7Hw=
X-Google-Smtp-Source: ABdhPJxCUQk6p5MU7RZHc5xtq+78cZYza7i9U7uf70adLQBe3kOuHC+oOulaqSKHxDVn+zUwwg3Q2Q==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id g9-20020a656cc9000000b0039926da29afmr8711774pgw.489.1654258919680;
        Fri, 03 Jun 2022 05:21:59 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id h15-20020a17090a470f00b001df51dd0c93sm8330001pjg.1.2022.06.03.05.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:21:58 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Kai Chieh Chuang <kaichieh.chuang@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
Date: Fri,  3 Jun 2022 16:21:47 +0400
Message-Id: <20220603122149.25117-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_052201_839608_43D2787B 
X-CRM114-Status: GOOD (  12.76  )
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: f0ab0bf250da ("ASoC: add mt6797-mt6351 driver and config option")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag
v1 link: https://lore.kernel.org/r/20220603083417.9011-1-linmq006@gmail.com/
---
 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index 496f32bcfb5e..d2f6213a6bfc 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -217,7 +217,8 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -230,6 +231,9 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+	of_node_put(codec_node);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
