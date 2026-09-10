Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD700C79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=; b=vT6IHk0VdVOZ4sz7hfyD/uHkGZ
	PX5Gm0tkC9iMXfCmnLK6yZt0DrU2IHnUtMbCpXQMKXOIxxqvLUkHVtNpfZDT0Yn5XR9Y+xrZcLuQD
	7CsBbkwL0zRw58bWTAoIKyw9CiKM4t4kykxDreYWWcy8muj0zq0NxO3aiPdiQXNfnUS2TpUZwwDjh
	kNjWTF2+oMN2CEhGwLAIoJ0smZSlQQnH9IkwCvxSC/tI2TQ4htsPm7rPJ2Jp6SG+sKI8ZZ/z3T8A1
	kKyBMT0sUFzzBlopiQ75ujLukYYvaNOFxjLq+hEEOPRoX5BRyxgA1GcAHnGW1DjJhcJsQWmzy0Gbt
	VbJmS4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM5-0000000EOTH-3pOc;
	Thu, 10 Sep 2026 12:58:17 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM3-0000000EOQs-2yPo
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:16 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso300640a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045095; x=1789649895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=f4qHWe+SzHO2RyQAdhtLO3mizrbYMQDeWyVa/D9Cm/UsQghfdI5rOcToIIYEbI1PaS
         KUSE3jPkm/QQxHu1mFd7mJs+wVjN9lCaMXKzwB5M9d+o/nwCBncgBobt50NSzHcnRy9B
         JAZhbmsUOHe1CX8oGRB01iHoJICkHVWaAE1xEBiFjPZY92VsKBRcwUVrvizddt7Gl98Y
         QPW9eNAnieU2wI8s3yIOkAFewAW2ZxkeFHKWZZIPCgVXlwK/LNiUd6GpxH6dPWqW8Osi
         3HY8YeZ7bPqXnrWZFGP9gMyy8xZb/Y2707CwrmX1e7I92Rwe0gaKchz1TDLqPcGvY3LZ
         roCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045095; x=1789649895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=PO/7EDqsJknKuX96wBJRDEtBzX61LHmtbnCYGv0fvr3ckj18m6otyBpjv9bkKWwW8l
         BvJ+kQUEb0/H01dvnI7JmlCXP5Oshj21ezun/g0haRIJIusO7EWEUR7xs2AvfCAWDtsD
         p5hxWdw+5eZMe8mtH6NADcDMDqAxPlliHy5tyOHbvAF36ACSwlvvLr7/SLMjcrm80Gqh
         TSfOhnxdPP4FSJCgXxKS1Za171KBifPgevo3diPLK1fmEEFEXpb7VDnAgn6hKa0TiQA4
         TnSg4umZJxZ8e1CrA3yvS1kV6lraxFEs344Z63tbtONKhl916lDBBFKr5aI40wzPjRpB
         fFIg==
X-Forwarded-Encrypted: i=1; AKwUvByjnKxzaBdxMeUnmBmRDgQbAN84250f3D3xkMpSjf/iFslBUt0PO/GTi5QsxVKbQ7g1AP36d5q7UbNZQJMaZQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kJREjRCruGizGQh0SN9KOYhTvBKCeXBy6HF4JIsKhQdyc8kj4b
	1yGrTtNMOe3b83pR+4+xrNjrJ84K/EodCi5rGvO5ZdGtZGxzfgQQy+cA
X-Gm-Gg: AYBFou1k5MNXJbzboROBEeMkvhLkQ6FcEy8jqsbgQystmRBSZ7Kn9ZTFEGnwDtfF5kR
	+L6DfGRyrb/elYhkEdODF1EQx4Nh6tIYKErn1tQ5B2u6KGZf9nKHWLZq2VUJd1WXn86KK6A4BZy
	FLUM2h1z/dqkRGYDbl3lVc8OxWmtm0AhyZqPxhWnwb9DhfH/be4f/xKrTgJ8/0gTecsjhvXgjOs
	wFyrDNmUfJFa20jeayXfPlqbeenqp5f5L9GlQ1hubiHm5SL6fyDcfz8mzt1/DbexFD4YGxdklUG
	YpgYeYG7GK+9k7GxizCx39oSlX8MeaKvuRI30vvcBvpqFXTBpKv7Bu0E1nHxtZTVFTqnf/xP+7I
	lUX+SSLGnfSO6v4spF8O/twfkG3SS50uKqDqzj8ohzuZfA4iOiy/u1YDz2aXz3OqUj+tgAjvpd1
	FfJ5yuzD01NdaAGrQ+scydYfsa/p1n7Kb8a89NfyCYbxFgebRpIGvToXfT2m4KNEPuzFGAjaDmC
	jJG4SxnlV4gEdP6nDvaGC1B9IFOcECz+LaeXPI+VoiuM0DPySelBCWEqzJob/UuEmN3J6j7RjZT
	Gz5h4ozn4cUHlbY=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr10985783a91.10.1789045094591;
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
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
Subject: [PATCH 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Thu, 10 Sep 2026 19:57:32 +0700
Message-ID: <20260910125742.150902-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055815_756165_829F0295 
X-CRM114-Status: GOOD (  10.60  )
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index a901be97e75f..933179f2a5ba 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_m_sel;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_m_sel;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_div;
 
 	return 0;
+
+err_div:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_m_sel:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


