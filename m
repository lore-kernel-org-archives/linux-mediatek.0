Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5094FEC110E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=; b=4ZkISTAwBmpvb32Rx8YXjjY7rd
	l1/CCvLQ2gyvl6pTIWAOfqgSimDvzsztao3exilIofuNT4qY44qhiUw2NPDr3asyiQSqMNHFBiJM2
	V1B3eIY1hNDyiPb5h47X2Nol8gX8kT3RMv/G8flFwxhqQfSpLvH8C32Hfwg8d4bqOwOZOcG2PU3v0
	R1B0uLHtvB392uzUsmcXaREza/eBo821Nov1d168GcC0EdM/Hdgugim9GusymNJwDWjFcVZqkbw86
	NXBBaIDhqIfuYqqXOiplJ2DFNXqYvPL+tfMtKwgwCIo9VyhmCXbfFkBhx4V+jKaCkgx/7WIK5V0wz
	s5NMuhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZq-00000000kS7-1sKy;
	Mon, 23 Feb 2026 17:18:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZo-00000000kPQ-1qWk
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4359a316d89so4213600f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867110; x=1772471910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=b4sstQiuUnVtDWwAVcE0pq8eY1xv13BLeakpnUxvzxF4n8dsDxteEY88NwR0RpcNXO
         TEp3zz0Bktpk9xX/HDHfJEKIw0ZVdj3+8rNmkMN3oc7RclLkfAMxeZg1HjiXKamdGqGw
         RicnZWEamrVUGrfvL+n+Ab+AmAykut2KUsbtqzDjYjkzZuvF9jvJo1uELitJBuqFQr3a
         neW2a4QUiPNQ7un+LW8jlykKKjD7KW6SQ25g0IpIw4bsbLBY4e1VVZDaaJJvk3hfXnRz
         xXrZ20vLjx52nm+ITBsQIEwR10IPLHoO5j3lBenNKuFqPuEdTgqyGMUdPH6IAELY2U59
         gCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867110; x=1772471910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=W7HB66UPT489DNu7P/Rq7zlExnyEvvrOl4H8aDDO8cuLt4ywIcb2Y5PydwMzVG67ic
         mElW+Oq2Y/Mg20Ocg/Vfv0S9qWYwDsr5LtwjGm+Wpr6zA7w/z4RDdT5xIDUleEzC0Apd
         r78FdkqFYgMUn9b6GBb4fi7MSjfpNDHXyHPx6y8F+0SuRYSBIr1IRCx7tohxWyTNeWIJ
         vRJ7Q0PPgTqwZMUfwXDUVu0E8b2wmmgOH5QUCXA/dwJiGOX2WomfWmK0QAz/U+0Pnzu3
         qj0wzwkLis2DjAzkLVCthy7sPa+wXYNl7En9C1SV2pVzEgn/p+SJt/hz8OJJnwBtQz2K
         jctQ==
X-Gm-Message-State: AOJu0YwUf8Q+g48riLUIswhav1OEzxYaZ0xyHQeUVe8LqpV8pbL+37Bp
	mYJYW8X1EuOUuSuP3wN09cfCK6cldr+NCHKGIHcXrQJhE+VduXNNZ9pdQiRdaQ==
X-Gm-Gg: ATEYQzxI9YXhf5c0TYoyEhXd1XXKl316cAqEF+7KHwbsiOkQrZqy1v03+JxFrCFIMLK
	+Fvq3jn11zXPAIIV2oRRTzjzzNcb4rm1hptl5eOgcr4poGp8tg+7VbgYaT9m6ihxjvApqx3NHeb
	ExdrSysMqMd1MCYOqarc14PYI89NnilNOekXy6JndIcs7ueg6t5aKEyxkh+i8aXJ5uARMMAqqJB
	wctxbjHY9a46u/PJEamR+K3GjHiiGZxF7udh8PzuIt1GVkL3tCHyWXaK02rmN8EsXAIp2os+yOG
	gkqxY+GosK6+Nq5iMoA6sNVe9EYdPzkwSCLpYTPXzM/AMlpiWKGyFW5rgjWNe447Im3f7i8RK8/
	Eq4gnXsAmjMkr9V9eYbgKDQAimTt6nYgC3w9UfCCv8Ax6ed4VOvSCVD/FiU4t7T2Q+m9IgCwW6O
	edgXjtdjH9WoY6BFO8qtY=
X-Received: by 2002:a05:6000:2486:b0:437:81a2:46eb with SMTP id ffacd0b85a97d-4396f17b1b8mr18714978f8f.41.1771867110323;
        Mon, 23 Feb 2026 09:18:30 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:29 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 8/9] rtc: mt6397: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:47 +0000
Message-ID: <1d7d0048eb2d51c7b5551deb765951d33dacfec6.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091832_489511_EEF1F18C 
X-CRM114-Status: GOOD (  11.20  )
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

From: Val Packett <val@packett.cool>

Add a compatible, using the same data as the MT6397.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b..6b67d917f8d5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -334,6 +334,7 @@ static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
+	{ .compatible = "mediatek,mt6392-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }
 };
-- 
2.43.0


