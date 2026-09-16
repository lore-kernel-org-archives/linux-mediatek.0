Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E41C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=; b=rpw3QKUn9KJpXH3YRaTAqK5AB/
	H3h9x4Fby3uerM4b3WCEeZ7qlVxKz0ecL6U2EVBXr7lrdy0jByJEsX7DStHYG40POcg+FdaTBLBuD
	o+w1SpWEvQLHKedMSf1KpCow39ZnE8KEwp2/kWWKL1MyGdVQGrIcafg6Abyxbe0VMYJFmHfc3aW+g
	r2y8rKKkFOiMyMNnP/keaNvU/yIACFFqiMTSo7HZRZIRfLtZsdjNQra8aUsUvGpL3XZLKWGk+wqGP
	mwPWXpoLrH4ca8/+nlZw5xidPtvcve0E9TzlwAlqCoRD/NeHFATs3X+lOTK6EBz5cd54qqT2WE+EK
	fwSyMBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlj-00000008LKQ-06ls;
	Wed, 16 Sep 2026 05:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlZ-00000008LFo-0iuX
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=; b=Lnze0d7RMPSh1ADncv+QCyQEmY
	QXKZ+TttSQiSjisbcxATrkP2Nv4WMbf51fbGe/kB4D4DJGGxe/q36nUlzkuY2rsrD1OT6uCZX8ytG
	XV/i2xPZdMZBkqPOg7Ugqp7FBieJy2Ert81T4FdhDHqZr80gVXja5xhE2AhFbJ/MGR+dRF2Au4ZdP
	XIj+NcUNYQblGDTDW4tYtuz/D90cF62Ilb+YwjDOrzfaDdXXWIjX2PIMZc2YraIEuj+9ijlwvU5Bs
	JeYOz5aHkiGvf5qiyVIzThsuE+9lbm3UojRAECc90o354PI4TSlxynZx8y7W679B79odLBsVKJq6N
	Aw6d5qAg==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlV-00000007UJg-44eg
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:03 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so306098a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534860; x=1790139660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=;
        b=LXLV4CwYMNzsbv4+SLoTp7dxmkgV+B4mMl/OXE7d87zsgMjPr5B4dauCi+r5GaTsj8
         RELNI3AcVsCmuRwnsV1uuIn1Te03R5KepxFy1g59Lhl2cEA2BVemTl+EbVOyCQSzJvE2
         hduEfDyWl0PPpH4oDTHOPHN0+eBSIa84JPJUFhUubhDbzN9YHCMeTcP5zMpVyT18B892
         ALmAe0MwcBLMYAb8Z65KVQ1BLAoXQUSRaUGk5qzaKMTF5sPr7D89gu4Mv4ur/5SmwKVi
         VulT+rAkE9ESeBO3MlrzG6Cnzt/H7u379GnhoYaGelLRbVcc7XcBhl8jQxILJuxKjqbk
         o1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534860; x=1790139660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=;
        b=TTQ872BVAw7ypgRgpUATzrHRI8Ef5Nt81y8u7KQ9NaNeZDk3uNRqpFJLHBSvoABCza
         a7Dyzl/Qo+n37AFazL4Sqbc7GJj/d9ghnczzO6UFzo5cnBk9K0bVSsSiGpk+Fby9SVXk
         mY/5pnsKpYHHXugmzz2lZU/0bA46UWs4TF6mKsTQsqA3DLE5Mm+TglWY/6bO8fxJZ6YM
         Uj9Lh6b5Zf0XSZMGGzlUVD1G2wgtWRbY1VFwM8W6PzTLGV6UErnB6M17ngcoJ7kTzOwh
         gMvMX1UeC8h+baJ2UDE8OUHMt5IeiWiTQ6ypRKluWtdlKh4UyzLBInaFIM2ZjR7rI6Gs
         P9aw==
X-Forwarded-Encrypted: i=1; AKwUvBz7q4YlGtq6545vpBHuhCk3jFXM5AVYvV2dvuBGPeMbNqBdS4LAq8zACRxpIivCKGHpGsIBbGqG2bWO05erKQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nwglL9IanSNo6qLFhNGk1VLa5I+xwQO/hagsttKNtm3A4AFTjx
	VSgkjWP66mrp8kUVro39esMCw410o4ONXtnV7AOHdH3SLf0Mf6rzac2u
X-Gm-Gg: AYBFou1yyxDgIGS5qc2vlLZbgcDSrlWJg2bF3NW2l4I6f5WUge8Iey5kXjbsqUWY86V
	U9ADfMWDdKWpk74XMRj2vo7WNJHLETC14M0KfdDzcHreqUm9losFX/DHMOmOjUsBMzAMuEtSiw/
	4O3tf5VfQ+A7+R6OgFeQ4PDOb32e9BAGI0/a/HsTPGDRz6MyOslLTcGFCPFRkq5tCI1xx9viQzt
	jAHnG/ZvJyxRK0UGlHIVUSip7YuUmBjfnw9WNh5i/V3mZRngzsqFN9WreDnZySTYYz3L5trvqdf
	gKCWXaNi+p9GOTOUBFwMhK5Ac8FisuY6ChjEcd3zq8wRGpK+BpnLV0HVuDO+46JH53YozbiGjCZ
	kn7ydzEfiXFD2NFk7jenZPhFAcvo8zLuPmJS180DSlJhHNfpo8vCgOZBzoq9FGJZROXe1EaVpWk
	cQ8DgK9OWTpe3JGH/0mVWs/iKsph98gJ4nYUAKbq/eDzsQxBsqxL4/Uh9wpBQoOhA9F/jqKyGJu
	T8B/cCXdlAi4Fb+e/Zep3ltHgHR0NT/sKB9/MoSZoGz7VxYHoW84TT+nXKjsbvG/s7Eycx3Mrqu
	sBp1TjS5rpXyrbo=
X-Received: by 2002:a05:6a21:4a81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd5f3f8a8fmr2852962637.4.1789534859652;
        Tue, 15 Sep 2026 22:00:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 04/12] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Wed, 16 Sep 2026 12:00:11 +0700
Message-ID: <20260916050020.14575-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060102_328348_40C97D25 
X-CRM114-Status: GOOD (  11.71  )
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

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 7fe9d01006d5..1132c924158d 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audio_h_clk;
 
 	return 0;
+
+err_disable_audio_h_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_disable_audiointbus_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


