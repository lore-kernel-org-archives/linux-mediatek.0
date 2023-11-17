Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F073C072A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bshaVLl7I5VmG/9PhcP3nuXBjaqS8pv5wJ1Ry067DEY=; b=UcDKRc4seMG9Bwbf9ihTNLKmoz
	VM2tIs7emHNQk6qVkHtIKz6aJrF32gE43jvbRCKPBy0J0Gt4NVrlPYmVfuTv/txK9XTvW/aQ1C0lj
	gL4R2k9WPw+CsbaKxT9SUon62VfE55KOtZFpnNALjEM17DwGy07U4yrUWTRgMTCVDJgGqB5UnUIge
	uymqBugW88Jsnwzpa7eVEm1lfJ8yuM2vJp5IK/Od24QsrPlydkY+vJd+DQNm1VKCShbVUM/q2yv9L
	rw13TkAMmj/nER2yosUK1geVMyrteTu//6bs/r9kfsuPZXLFyhO6F+ocwwkC+A9bCn7Ir5OSrDSvP
	FcPF9xSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vO3-0067oX-0j;
	Fri, 17 Nov 2023 09:43:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNF-00672u-0W;
	Fri, 17 Nov 2023 09:42:55 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27FDE6607390;
	Fri, 17 Nov 2023 09:42:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700214172;
	bh=P8X/98SRN6b58tyqRku7rqXinlOozOu5V7sRiK56qy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5IXmwIy38/fn23gDLxutrx/u8ezb9RKv66d3sxgwtwtqHzmo5NVoIKEFJvkwXZoc
	 FqNAkMqP5dhJBy04ctNGA9n6ZOiqEuw1KsuImURIMDXVzpt+SXtnum1z19F7n5TWTb
	 /GczntLx6lys/5PZ5802zi+qaWDgsb63dQHBQCfgsop9E+nKjH1Le7mkg4MyOZhNpB
	 f7LNImqXvXJL17GXLDDAXs2jrV/NPq8OFTvQ2UlKJ9PloDib+PwcP8esUHpWWzkzfy
	 dGTFjbgQ36BeuOramFMBJEcFqG0+xK5L3Uvxrj6uoNLgFI7aZyYEEhJVyHQ42TZK1t
	 8UnQ4cH+2eJuA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v1 17/20] soc: mediatek: mtk-svs: Use ULONG_MAX to compare floor frequency
Date: Fri, 17 Nov 2023 10:42:25 +0100
Message-ID: <20231117094228.40013-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
References: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_014253_339029_4736BBDA 
X-CRM114-Status: GOOD (  12.59  )
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

The `freq` variable is of type unsigned long and, even though it does
currently work with u32 because no frequency is higher than U32_MAX,
it is not guaranteed that in the future we will see one.
Initialize the freq variable with ULONG_MAX instead of U32_MAX.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 16a16c5a3f24..df39e7430ba9 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1804,7 +1804,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 			return count;
 		}
 
-		for (i = 0, freq = U32_MAX; i < svsb->opp_count; i++, freq--) {
+		for (i = 0, freq = ULONG_MAX; i < svsb->opp_count; i++, freq--) {
 			opp = dev_pm_opp_find_freq_floor(svsb->opp_dev, &freq);
 			if (IS_ERR(opp)) {
 				dev_err(svsb->dev, "cannot find freq = %ld\n",
-- 
2.42.0


