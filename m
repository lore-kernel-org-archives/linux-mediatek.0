Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90381C5DF70
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=; b=uA58nAnAgHYFHczi1XOybiJbx8
	OsTrIKqToXPRoEicdC7EN1epuRu/sruTEJz6ZngdBgXDD70dVLkdU/qw9DFeN8s8bDXZXdVzSRXrT
	3C6tapG3DL5ztjLtRMnqgpe+TZLVlXd4ZljIj5y9j5y7igzQQu0HCec/zlIhmQXY6C2CwFLfy4sDD
	EkFSBFt0Y7IJKZa7kTRCh+YCHFdiIBG1ekA2+KYWYnjVQEEDsrVG6jIfFk5vTUkjxchCyiOIpi/VI
	gw+8l02qW+M45UA5TsP88u5p/Yy6/GyauJR8DMyylN6QbeO2xIjx1/Ic4oNRFQTCGyZWnhWvhzgt5
	xEvSPGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIj-00000007lrw-1nyM;
	Tue, 18 Aug 2026 10:44:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIg-00000007lqt-2xD8
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso47107505ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049850; x=1787654650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=inyPfTkuHrs1+/DOcSeyU+0CnvxWVjCiNkZQ8SJdnHMaD8feNjGHwl6TFVCxh9xLCS
         Y3krprKhtOAyiGKjVri1iISdVJMPJnMGb8SQ2xgwdtAs+m/taFi1Vj4WF36BzBVD41CH
         P7bDAz7Sb807EjIj9L4nkRVsvNfor3X1X8wrcOZRxYxmnAfcCCa6WqRxUAtISoKZApKx
         Rhupo2KbDj5LhMRlZ+u28QibZhnDWpqpi9yTS0qOSVuGlyttGFrfdNrbU6n7NgfvBSwd
         jAn4fYMoStv/cAb4uiNi2H8n/KU/SRBItINUrvoHqd9+89Go9peiG2vP1u0jN1wOGaSy
         TXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049850; x=1787654650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=HfOscBrbWYvU3I6tH0gvE4cknbIfxgJipcIubvoVoJyzXwIeiKtrMDDiCtU1gRGhRV
         i+5pMrsM6XEIsayU7pN6fFFxtvA3DrP/4Z7+/mipuit1uWV6j62+Rgvfrs5S7p0+NebG
         lQoocsd10nUy8ko26pAyOKgvWcUHGZxHK/l5OQvH+RokN+plAw5XVl3mWoCREtyPCSdv
         kR3s8RD9UVVc2JAIxLYKhsrWlWHnkC9QGXAJ+8poY05rcJQf7CrRbu9XylKdfmDPdhNW
         aOl1A1jMBE8hBbXPgenpHEpckRNzuvPRPlf4GocEmSyzw5YBJs49R/OO9l2qxTVbn0Mf
         uCKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9uw9XkElHuof8KVHiDY/CokeiTR8yOOG2R6uZOC1dH0PeMDWGRqoz7+oiYUO3TvtL7wvXZFrlvAE4ND698g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcRkxWtYrfL1P0GkExcRt++P1N8xyLKAy93Px3tY2klK7sDXDv
	n5L8MZhzL9/NKbUhLDX+EB4EQVRq77UDplsjhojhyeenlui9YYmfOBgv
X-Gm-Gg: AR+sD12ubYNdoARQbY5pJS+4yz1vYvJlQKiHASzruFnkDQvUKoWvPv9JFgqdGHJ2wIV
	T0cs+pMNEpfZk8WZHIHF0yL4V+ymWUvgsolW0HzlKkCBr/BV6+pBpNQZlhwvcemDiPfbrCrnddT
	LuCkgCG3iS81qM/WtnoezXNGC9oWPCzhnlYQAMIwnJmFZ0aSquan69ZV6MGvFyq+dXqpUbbI20d
	5Qf+izOKe4CdMTCLEQRrn4PuqgY7ZoEaj1qXe49IxEE/WthL9vSrLEr3q1G25Dgocp+sbbiFjwl
	xanfiRdidPZ97zJ5c8ESrNUTkZGOmWe4hblJHpb988VLiojmfqMG7SQYPUjqf3hI3aS0M9yFlmV
	iEw8wcFXJYNbp0IJ2fh4l0EqaJWHc0CNFNMXd2oFKApy4pwhrf/mtFvwriX559sXY039YOxYnyh
	MaePt0ciiUkY8brQZozH+uf1ihwm1B/09zzYlriKvOKhkFmTeQlMBgYBHvB8KOK4ig5CQSqaVUx
	8FiahipYm0uDqejGwllwhC53pb0niOIRrQrz0wq+1cTb2Ie8du/MSSZZvToxwhA1Tv4Lk4qbcqW
	eruU
X-Received: by 2002:a17:903:1850:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d3b0aeeb01mr407552145ad.1.1787049849560;
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8173: Fix clock error handling
Date: Tue, 18 Aug 2026 17:43:42 +0700
Message-ID: <20260818104344.37824-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034410_748604_D380143E 
X-CRM114-Status: GOOD (  11.08  )
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

The error handling paths in mt8173_afe_runtime_resume() use incorrect
labels, specifically err_i2s1_m and err_i2s2_m.
When clk_prepare_enable() fails, the code jumps to a label that calls
clk_disable_unprepare() on the clock that failed to enable. Instead,
it should call clk_disable_unprepare() on the clock that was successfully
enabled before the failure.

Fix the labels and clk_disable_unprepare() calls to ensure the error
cleanup is handled correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..b4c6ef6f0845 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -997,10 +997,10 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 		goto err_bck0;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S1_M]);
 	if (ret)
-		goto err_i2s1_m;
+		goto err_bck1;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S2_M]);
 	if (ret)
-		goto err_i2s2_m;
+		goto err_i2s1_m;
 
 	/* enable AFE clk */
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON0, AUD_TCON0_PDN_AFE, 0);
@@ -1018,8 +1018,8 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 
 err_i2s1_m:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S1_M]);
-err_i2s2_m:
-	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S2_M]);
+err_bck1:
+	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK1]);
 err_bck0:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK0]);
 err_top_aud:
-- 
2.43.0


