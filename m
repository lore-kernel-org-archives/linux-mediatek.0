Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dSv2KZGjt0dgL1P0XxqifQ+osMev+Ban1MIXKw+r980=; b=TaNkqtGpDerk1J
	dmI7jHzVQPwJ3OE26YRvNxjOQndq0Osc3M1KXxgHU2nRmq7HIRbyP8QmUafjeBkzWcfQGonrvTCF2
	Nwp2SPtgs4FH9vsMXsPppWnQ1K1Y82SNw/SBldW3SumZi70c86DWeW1Cx2JVlCfyrLxouzg7usbEf
	SoY/fnoNTnfMW965pQQAaVZ57Dt8itx4a4KUbwepCl9v/zDZOZfHhan6CTsh7V9tTEH+ckSbaXmFl
	VxM3qhdrAiVWBizF9aoAMe/KX+blSWkmXENbxNtkbJT6SIQ+Jd7ibVuqWA2Wng2K2XHVCpziO6L6I
	Sv2+V/UX7bstgIrgxM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYO5c-005K5S-9j; Sun, 27 Mar 2022 08:17:32 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYO5Q-005K3v-2f; Sun, 27 Mar 2022 08:17:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id f3so8736502pfe.2;
 Sun, 27 Mar 2022 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=gk8h605KYyOaQkK8GayRXSvbqa84qjOB4akygZBA5nk=;
 b=LAKy3CHdIodKnQ+HOvEdnnQw8iw0xZlKosPEZUSXrRkUWJ//+VKiQd+cbIOeoUtP52
 mlhuysstOCwAXn5c91thFW8SkNi9dow/rkpmbHGiAdEIN4KTu3GRUjrZQvxe8VRw/Oxv
 cwaYHBmYnZc/HsT2Gr4R4laxRymuYI4ge9siqHlW6di2hYPeh/Rk9Rs8nM52er9vs4VT
 3UxD9EntXWGIT1gcuL3NsVPLLmgN06blXZ32mHwiL4p5sY7D7nUrqQcpFw5RbLdCwwpy
 ahJhKdWHiJQwtlkRjHMd0zvbZScUnCGNJ2LActIbvm4S4fWhtZZ58C6e05wH3xR3M6Xo
 M23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gk8h605KYyOaQkK8GayRXSvbqa84qjOB4akygZBA5nk=;
 b=0uztS9iCHklKouKB8gIUOOq14jEJTy4dF0AQppXBmNa8aRUBzk3H1CGRAJqJbJ/L81
 vR78UBUnC9dpgVZTookxDsQ3PT/UsyPpejxmi49d/AQZSTC66ZsJcAOIfzvKe4PASbs0
 /pkqPfNC2EEdDr5qRKMI4yo+ahu16D5hEAa4iUuCAgmhwJv1Bex9lCdnEawGl+1ZmZVE
 RNm0Rs7vFqj1c99gjJbPg7S6XoJYVqEf66RtmO19mkPS0T59hM/h68D6vS6UF82S5uix
 +u27bzHOd+isI7XIjvh+rzThKNdsoBT225Ipx0NpUSVKmGYz7UgNUzLt8q7CEj/TrzVN
 qLlA==
X-Gm-Message-State: AOAM530litJ3W4AizSL2VZoiiSO+odrXOLnbHKXo+oFXdXj1+CZ6RZd/
 vrgSMMvAYY1JLgkTAttSfrQ=
X-Google-Smtp-Source: ABdhPJzrMtufiuUSfPFRFyW/Lmgnl8OMtHUoxn5VcC8mJqseO1qEDX8kB+apZiI5JWTCwNez2mCBfA==
X-Received: by 2002:a05:6a02:105:b0:381:fd01:330f with SMTP id
 bg5-20020a056a02010500b00381fd01330fmr5885943pgb.483.1648369039023; 
 Sun, 27 Mar 2022 01:17:19 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056a000c8700b004fb55798f64sm453861pfv.90.2022.03.27.01.17.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:17:18 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com
Cc: trevor.wu@mediatek.com, tzungbi@google.com, dan.carpenter@oracle.com,
 jiaxin.yu@mediatek.com, rikard.falkeborn@gmail.com, yc.hung@mediatek.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mediatek: mt8195: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 16:17:12 +0800
Message-Id: <20220327081712.13341-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_011720_145600_E1466A41 
X-CRM114-Status: GOOD (  13.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The bug is here:
 mt8195_etdm_hw_params_fixup(runtime, params);

For the for_each_card_rtds(), just like list_for_each_entry(),
the list iterator 'runtime' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix the bug, use a new variable 'iter' as the list iterator,
while use the original variable 'runtime' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 3d00d2c07f04f ("ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 29c2d3407cc7..dc91877e4c3c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -814,7 +814,7 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai_link *sof_dai_link = NULL;
-	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_pcm_runtime *runtime = NULL, *iter;
 	struct snd_soc_dai *cpu_dai;
 	int i, j, ret = 0;
 
@@ -824,16 +824,17 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		if (strcmp(rtd->dai_link->name, conn->normal_link))
 			continue;
 
-		for_each_card_rtds(card, runtime) {
-			if (strcmp(runtime->dai_link->name, conn->sof_link))
+		for_each_card_rtds(card, iter) {
+			if (strcmp(iter->dai_link->name, conn->sof_link))
 				continue;
 
-			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
+			for_each_rtd_cpu_dais(iter, j, cpu_dai) {
 				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
-					sof_dai_link = runtime->dai_link;
+					sof_dai_link = iter->dai_link;
 					break;
 				}
 			}
+			runtime = iter;
 			break;
 		}
 
@@ -845,7 +846,8 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
 	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
-		mt8195_etdm_hw_params_fixup(runtime, params);
+		if (runtime)
+			mt8195_etdm_hw_params_fixup(runtime, params);
 	}
 
 	return ret;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
