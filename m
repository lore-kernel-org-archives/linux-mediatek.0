Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43621CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=; b=dnN9rQ3Dfz5L4H/6d5DLh7wtri
	hFPLfTwGF60kFYkbanW6TeqdLQeLKcSZXNpAXVO5deE0pApojWRnfJnzOwR+EVm4N9tTSZiDlBu7l
	0gZbwIcpC9Q8ZOl/ra1RTapl34PG61Y3rku+HtANRm2qdQI5GKcvJAwhvZdbJlq+v00UMVQZxki4X
	Rl1+PqCXvdAJg1ofW4+SL3UFSHvMA8ogYfMdcE5Bchis3807LUr/tjBKudauzm8Tun3uJJjboKEyi
	CJmkgX7ygKYI8shj9rOHlsV9zys1QEBB+SCvU/u/pVyf2DIVWeJ21ZoD7vgT0v9sNkpOxAzmD6H1s
	wO967FCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4p-00000002Pxt-1710;
	Tue, 29 Sep 2026 06:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4o-00000002Pwl-2ctE
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=; b=EIgPBDN3Y1xpR2W1mvlKFuSEIz
	COb48ykwQOf0JY7/z3x3E2zF/skoSy06XV39sSoVDj2fNmavnbkaXKWhmfzZqnc71BIUiwcAB2fBD
	umnMgIz/iEa4DcTCSoYpXqvaoSoSQum85AWCvd+CybEnOPl7a8SE3bqfQHrm//pjfXoSul0Ty+Ywg
	RYrQw2YwhT+qHeCDYijrsscg13ZS7jInA21XL7ERyv0WbgTT2fvr9JtBV+0+XmWh7L4d+Oanzj847
	nuOITTe0ROrD2tZA73fw8iF6siVPfhRHQzwRdJfEKsUym5KA4YFXHIMKZXLadP5DcMdCMpOyQjCKy
	JBpfZYmg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4k-00000002EYa-407s
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:29 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d93ff61046so19838235ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662345; x=1791267145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=lxVURu3h2XUzk4kgWX7sD1aWDt+SpfX5WAZ0i4SCfpIdraFDKOynE9cyJGN2eL7pOq
         iTKdKRKjDNgGiFQDDvu7uoUpfiNb95Ox6jTabCAAY387yIcY8B7hJWVeL1CN2O6zOxdD
         iwF7IES9YUEiv74Qz4mcvfu9attXo00RYRQN3Y4fywstjchKx8cuckhTA27rGwe5iwLW
         RsznukTfaEa3wykl/IVdQaaWwZBBBtIoTMqTU2yEdP5ntjkPFEAkx7QqBtkZZUChzSSc
         LD00f0qDmDtX4Ynz8BpaU/208Ag1A6+SzYVjfCDHgoJUqySgvcbAaSLovQCpAYs89xta
         G7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662345; x=1791267145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=1h6Ri7m1xsaX1HJQnh2HOu7mWhWPNbnM2upxM6ziLezluSdn58uusD35cddAuv4er+
         Q8F7DH1eSCLlxs/ev1BQpm7pihNhpueCS+yrjKpKsL8bPYuiupge5CZQ9ufG28Quvjxd
         QeE/D78L77QmxjSMH60JQgmFBMOMqWV9h7tXEhyr7r1YtqSpFR9edxENPeAlRS3Mig8t
         IXGKKXHX09WlIK4LHP6b+lPrNkiqYH9nQ24ENBhLsGdwyCwhltTCvFYMWlbZEDYfyWMB
         fKq5sJv7IUupn3AE83adQf24vZQruLbiGd9PZX3RzEEfHvl/Y/T1mdR2wK0PJTtzYumW
         bkyg==
X-Forwarded-Encrypted: i=1; AKwUvBxX3Ugfql2fGZ8EPZErPEOm6ljF4H/RUpT1fAtkxv3QPXxwPgTOShdDPdi6xCFo9cSRfAZBkGdomblDexhrJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKXIuVik9g5apR1GiaNMr8DJrePzT0iyf0SPfHD2TNRFbv5xeIg
	vL/TSJ0HV2ds1O80GcqOYRKNxaPUj6imYiFFm/mPjH7AN9xgGv61Ls/Q
X-Gm-Gg: AYBFou2m2lDrkx9ofjP+cOryiElz2xqNU3GeyXxt7RHCr3Q2bATmvUFzj20YI2jEjA8
	EQww7CEk5DqIDVjuuHR2i7/xV+ogZLjzsRpllu8ydgbPtdnEEpp9U9uIAg0o/+j8N+7S4ClPAH+
	JE2ySQNP5oDaXK8Mo6V02j8s5exUyNDkS+5OVfvnG3kxNsVYvaMQ874RdR7BaSeky0WJ+GVt1P8
	Ta2/b7aXXcDMJimzdsoh+KJWkgVzFwRf663pn9GjsFJFgGTWL5seuT6ubDo5XxqlsT4LgMHlJbl
	z0VxBYndSo6KNJHpH/oKaU8/W8yU5wgU5rSK3jWNoEZx3RTrDm/JbymL6nSmDIap4NQLwSTtxRT
	meT5vNeaTDyAxUPwBedDb7mIfUtmve2LMRqxbOB7ozCyS8DSEzgrZuACIfiGNl2O0Tup2TIo7Pr
	jTFo0DTnth+VAFmDvQn2MV/b3I3lJ5OGtX6BI9yO6+EfHrBUPOil/k7HWOxQI6/0CyE/jSAgSBQ
	IVvm9DeLjCfE6StI+IvllAwx7mAeb6xI3uIHfen/Axv3FmEsrPABdDHUXdj1wbWOAS//ktDHVsG
	sIXQJeFlYMsKbQ==
X-Received: by 2002:a17:90a:bc9:b0:3a0:a515:c47d with SMTP id 98e67ed59e1d1-3a0a515c8f3mr8329776a91.34.1790662345126;
        Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:24 -0700 (PDT)
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
Subject: [PATCH 06/10] ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
Date: Tue, 29 Sep 2026 13:11:17 +0700
Message-ID: <20260929061121.124001-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071227_504481_3615DF90 
X-CRM114-Status: GOOD (  12.40  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index dbfd02d20338..91a05ea6b8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -618,10 +618,9 @@ int mt8196_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8196_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


