Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78917C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+mpRvqm50m8bJJuINp2cWOKh1ESP7g/w6BKH1lQmlM=; b=1FS6297/1t2kET
	GE9jcC3Hc3LmLzySjY3d2RXZhlcAYxysZDtLniTw6zDTQ3Baj2dBUlLXEZQwgDqhOcDKBqhSxuuzv
	b0TX9XcpXjXBQzT+HcVqZ7LofnpMGaYF+gv92M3kfL9Zx4CVnH6E3Y3hUT4mskW7Hs19x4ffq0bK6
	q9dvqQXBMqPcPiG8rtR+jc7Aq8tZI7frxrokLp9dk2WZOKz0O9MNSt/OpAU8XZT9KBltHsd0+XjiF
	cX1h/vYBA2SJanCXxeBaI7uEx/t5D+ozopd9z+m7+zMDvKnhUxqLV6AcASIpAh4wWsy0I4L87teGN
	1m+hIVCMg9yjkOrArqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclSq-00GFhq-Hi; Fri, 08 Apr 2022 10:03:36 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclSa-00GFau-48; Fri, 08 Apr 2022 10:03:21 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id f3so7069743qvz.10;
 Fri, 08 Apr 2022 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpqWb+qabLme++eyAmbSMoF69YNe99IcopaKHvnYnE8=;
 b=o1UGymQOBCjDdm5i0afuF4mfy7UgESaASrEg+kHv98rKvf2kjfs+KLgyy67VV1mSF/
 TW3edcjv3JT293ZlEsNVZgP0MplS+xLZLyUtF5jxOmE1zr+siFaLmEXjl7AUw2IliXkF
 z5FEh0vmlu3QfcRNNe7tVcTzcWkk1FOcteC8cvXuPZbNYxdpqKy8Rer2q30XPevLMxQn
 7hBXhC2Y5kTk98vwDs9E842kKJrhCEERlH5rjFV8oNTPfbYnkMcM1LbaiXZ49JVV3RhX
 vRj5WIUXlcgZk6u+e00dyv5GGYih2AOX1ktcDT59USWYDn1pcANUcA9QijkSUhkRb32d
 ltMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JpqWb+qabLme++eyAmbSMoF69YNe99IcopaKHvnYnE8=;
 b=hVvGPI67IZu7aASGUUaCXdfLN75UD8AytAOIb6e26jQz7w+1Rl66hCkpcNwFc04nPH
 3D8Lsn/RQog2gB5BPzzSeIIL9P9VpZfPj/YDL/plXwdhm27bOvKIcQVd7cry6kMZOoVq
 jOZ74Xjuvd7XP7YULgKUdCfrkNGabPdRREj6DNp1cu+dTktrqBicvSC7g95UtZa6GJsD
 VheBJEYHkJO2U9jvYCa/ospF6eLxQPx3vF+G36SspiVMpGtiKhYoYsTlJRYFXUVy7SvB
 1XdawuN33IvnvqeI1NEmLJ9UKjLWXyke7Y9RoP91I5nli1+jUf90jMCQvAlTd3M3ZmaM
 lHTg==
X-Gm-Message-State: AOAM532jiUybY6CrRZlW2j2ihKn04Q1ij+vpAEidtSml7L57Qo+eXgfF
 cCzk6PQwembhJJlcvcDX3g0=
X-Google-Smtp-Source: ABdhPJwmwY5DgTWhekwLTVj5UPKZKwOWKCsva1KAAGSWO7vxkZYgMV8T2DFwn5GOULQY015v2y5Uvw==
X-Received: by 2002:ad4:5de4:0:b0:443:5d80:e379 with SMTP id
 jn4-20020ad45de4000000b004435d80e379mr14863077qvb.37.1649412198101; 
 Fri, 08 Apr 2022 03:03:18 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e13-20020ac85dcd000000b002eb9458498esm17174364qtx.95.2022.04.08.03.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 03:03:17 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Cc: tiwai@suse.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, angelogioacchino.delregno@collabora.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ASoC: mediatek: mt8195: Make sure of_device_id table are NULL
 terminated
Date: Fri,  8 Apr 2022 10:03:09 +0000
Message-Id: <20220408100309.2495462-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_030320_206347_D011518E 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Fix the following coccicheck review:
./sound/soc/mediatek/mt8195/mt8195-mt6359.c:1657:1-2:
mt8195_mt6359_dt_match is not NULL terminated at line 1657

Fixes: 86a6b9c9dfff ("ASoC: mediatek: mt8195: add machine support for max98390 and rt5682")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index bc8c30b33969..262a54e590e8 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1655,6 +1655,7 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8195_mt6359_max98390_rt5682",
 		.data = &mt8195_mt6359_max98390_rt5682_card,
 	},
+	{},
 };
 #endif
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
