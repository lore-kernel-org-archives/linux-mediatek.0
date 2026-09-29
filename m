Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10347CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=; b=Dn/aQ6kNkDkgQ0EpS0QYyDsQCi
	LBqYk0yMsjfdqJlOCSbyYXNSC+DBbStMhnLypKHNOf6v0WInB4rzRW+SpKSPTylD4VL0j8LAfe8t+
	16KMI+PBK4iEjxkt780tFQtkBrhf4Yko29U7ODU5/Yw/ZWj6yU9dVpUaeqbEHcMgqd3Y61PZ4J2WM
	TuJ/6Fg76lFwa2os/XnjlOkK2RoOCk2ypXpH9/+wAJLAYpEnDNX7wrjn07Hgpj9gTKtoKoSoMN6NQ
	l9pbpISTcO68+bGdJQfZFBTMMGbG+iAknUcHKFc7gaSsv8KmEDquF4fzrY/t2iK1BUvvBzv3cL3Yv
	9duW6hXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR6b-00000002Qiy-0ger;
	Tue, 29 Sep 2026 06:14:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR6Z-00000002QiT-1oL5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=; b=Y0O++ZpJ2RpR9YNFhf+K0IjujU
	5rz9Juq8EDSKEPrkIbhqkebkWlXF8C8+5IsZ1571l1sun4/z3sO8av+G2L1TxbQcGsu0KEjOP5jnj
	HT5sHqxNbTZUx0vCY4PmrOb/ERNS9RwAiKF4OREXQATUtAxuqYmEGgIgnIWupR/0727YW5NUOSNiK
	GqnK12KdPlaJY+b0vuuXoa0S+d79/7UhcB4NGxLUkd43fNuA1zMoe0kkVZtOPXM82G1INXhjDxI+V
	mSMS7Gq3IAWPgF4xW625B+ZnNotMqn1z6JVLZkbq0olcDvZ1jbKEZwJopZryyk/tTT2CKSEvU8l8j
	z7Kpo+1Q==;
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4q-00000002EZc-1ZVq
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:14:15 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a47d6146d1so768304a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662350; x=1791267150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=ezIv2HjcImQkDvBGfYI67UyCa8EpFjpKnFBPWYjP9VjWKcgEq8abivyPta0XHp1vg3
         MH56mBlbYit44f7L3VWLSySVXNkQnsY9Ga6kNBfUNNbjGNQmLndzfc7J/R/fURw78nTX
         0+ICTmFJm0Q1sCPNKFQPeYRIPulfxKFmE8pKzI3bEycsIlJUJ8gTPVaTg/23gVOyg56K
         PhhlqtETks6exBWZsDszcdTI1QIMIvNJoAFYrXs+KlI6OMPATqkbXDR4DJ7vffQ9hEGS
         STnTmFBww3v0aKEi8njFsQhcfcP1p5i5miToA55/CDLoi/KEb8T7gnyT4TMM+jvhjBkG
         kcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662350; x=1791267150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=wC+9aRnL9TGtDMyIOnoonmeXl7zMSmiYxWO+aFSegj7FJp1gkPsocf7ovdm0s6YL84
         BRGN/h1yNDDsgbht+nEDyPZkEIcEIbeiwL8FPuJ70F/IHsSl/u5SHzaDEPWpajl8qZCs
         bAqr72zZmSwhxGMhfelnFlgBqfRn6FKLxYIhTP3ABwZpTfyAOU9mKYaY1v+h9XO9/wZz
         bdpJlIEnA2pU/cHw2BOnCk7/Tb/uojKxAnsMm/dZeAFHyxCYC/HawJqPSiSBIJ0uXm14
         xdHVnwYyqZymWhRr9Jih7ARsmkjASk3b3Bjj+tE4NGIWJ6BjqwQgmRZxkcY6jpIaSE4/
         Bnow==
X-Forwarded-Encrypted: i=1; AKwUvBzFfy2DznoaTCazTbMevW5AZ0pftnvcy/5sGxevNq2LXg5GmArDXZxiJ8qBThPvWpNYLAP/OdMVJVeLoJDPXQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI4kiU6GEoBBXX/xLboOio8pux+2gFBkkXr5ZHJNl/X2Akq3Ffp
	xboHhOA0rhEmnJzeR6bVmn6JN4beIXlTBnDTSMsZbwQuO3MpO3uasUnF
X-Gm-Gg: AYBFou3ezkG68n7+Uyr3gFd02q3eyMtjDLm5b0RjWN0E+JpBotTjPbWcxbIqXp3E+fa
	MckKwxCLSJAiXBp+bHQSsT7SeRjbWID/avz7urEyZ2SZYXfsovbvNN2e7JcjfI44a/WZY7HNhG+
	dCpizWJhMbP2V+EN4E0YQEiht/93ijOKTUD4c+OHCeKaIbSH/KO5rXBG8zt43WhydnWXWK4nnIj
	5AkZq9AO6igrQkuczkRuIMCtLPDmmLb9O4UZRDzt5gYYW62PbEVhyqm7nwHA2HsOxiGv+0xdPB6
	ZfUjUtC5ft27IH8Ps+hX9MlHN66dcvEg71+KPfsAmzj/gIUahGmAR8Qz+azvO6W3E5xl2VkjinE
	DDVlQyr8IdsBoHv6u9QOVSdqvsXTUNrBM2sdjjCmVjgSam6Jl3DMIlfo8I4nM13EfdTonP9OlMc
	rPUOVRplf0gYHFfvEyg/Gz5iS4ZvIPhHAI3p2dgJczDTYrByqfiGnM6bfdq2rGxuwdZmdar1tTr
	4g4JbpnUpIjG+Lp3ne7jDO7EeuA0DWfxRyf7qVqa3FNf6qp7NUUJ3ow/qJxqiWXSyDujWd0vThf
	9g8oaMrJt0N6hw==
X-Received: by 2002:a17:90b:3c0d:b0:3a4:6ff5:778 with SMTP id 98e67ed59e1d1-3a46ff510efmr2033501a91.44.1790662349906;
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/10] ASoC: mediatek: mt8196: fix runtime resume error handling
Date: Tue, 29 Sep 2026 13:11:18 +0700
Message-ID: <20260929061121.124001-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071249_733105_EA57D9F3 
X-CRM114-Status: GOOD (  13.49  )
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

Propagate errors from regcache_sync() and main clock enable operations
instead of ignoring them.

On failure, restore cache-only mode, disable register access clocks, and
clear the 26M clock request as needed to clean up the runtime resume
state.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index dcee037991aa..9888812cd993 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2211,7 +2211,7 @@ static int mt8196_afe_runtime_suspend(struct device *dev)
 static int mt8196_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret;
 
 	ret = mt8196_afe_enable_reg_rw_clk(afe);
 	if (ret)
@@ -2222,7 +2222,9 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 	}
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
 	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
@@ -2233,10 +2235,20 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
 
 	/* enable AFE */
-	mt8196_afe_enable_main_clock(afe);
+	ret = mt8196_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_reset_26m_req;
 
 skip_regmap:
 	return 0;
+
+err_reset_26m_req:
+	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8196_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8196_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


