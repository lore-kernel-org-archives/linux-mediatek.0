Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A7AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAaOwbX+swrOlidOTZ9jHlcB0JPpGX+hIgT3Uz2GcqU=; b=s+kYuPxg/cgXlGV6t07xjQ3u2N
	xiZIwZlNEJlxKR7eesEhPfuCNuWEyDksp7JHcDsgrDg3bGux1J4i3K0pEuY5u3UTYs7LGDEmgF8L0
	/gI3qbNoKOskJDrCTCb8VNw3kLk/leIhvS2V1FToOh2YWO/r+QZrW8jSimgK7kLUOj78qJcaeKGEO
	v42wn6m005FsQ0fAprh0ct973NgNJ9EQx07W/p+N7e0Txod7CB549+xyd3pBcyHxs995iTEI3mE1m
	XkM1SScTp2i4vO/K/BTBc14RG1yyFjHaEK1sDwMhfYNBJX9u50hgHKYvLy7ZZeMeHEpj5ahkh5wnV
	O5p1VLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29vN-007FEY-TJ; Fri, 17 Jun 2022 11:14:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29r3-007DMO-Oh; Fri, 17 Jun 2022 11:09:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9199660179A;
	Fri, 17 Jun 2022 12:09:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655464172;
	bh=kG26VQ8Q/x/unvWddSRifHSxyfpmVSj9DL0msaHnGTk=;
	h=From:To:Cc:Subject:Date:From;
	b=SzZc7AaVQv6BGAz6/bQTRF7VdL+oQJ8Y+4L3ENHmaHaPTpwWr6CByK1pWvczLCZnK
	 IHUHYfhfRL11eAzIUyL2O14QTYYXPON3437DiCYM+GxwQZAyjp6eTY5EIvyP/fcNka
	 GE0dZFrn171c5+7rG9c5AUQgbh3n5HOCNoO0GZOPQYyB5N+T2CbbekkVEbIIj2we+w
	 upQN7isUtnaH/rYvaLaxI19tinmeuCXhzHUOaY8CVo0scHEAGLhryv8qlpn2ez3FEV
	 DLHOkp7fxRC8f6Krl28Yk/sQCsf0J7x6KA43UjHCHSkcQD5Ac9O1463VtNmWq/fg6z
	 R45l4D5zWADKw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: viresh.kumar@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	rex-bc.chen@mediatek.com,
	jia-wei.chang@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] cpufreq: Add MT8186 to cpufreq-dt-platdev blocklist
Date: Fri, 17 Jun 2022 13:09:26 +0200
Message-Id: <20220617110926.90313-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_040933_993936_66B4C47E 
X-CRM114-Status: UNSURE (   9.36  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This SoC shall use the mediatek-cpufreq driver, or the system will
crash upon any clock scaling request: add it to the cpufreq-dt-platdev
blocklist.

Fixes: 39b360102f3a ("cpufreq: mediatek: Add support for MT8186")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

v2: Moved fixes tag on top of SoB (oops!), added Matthias' R-b

 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 96de1536e1cb..2c96de3f2d83 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -127,6 +127,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
+	{ .compatible = "mediatek,mt8186", },
 	{ .compatible = "mediatek,mt8365", },
 	{ .compatible = "mediatek,mt8516", },
 
-- 
2.35.1


