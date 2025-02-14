Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E4CC021A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlq54jWBVD9Rm0zHtwMOcSIjo2+gkktdxezngWCjnSI=; b=3HIg8HAw3c02jjcKpxAmZyFAj2
	8JHw+GLcuyzf/gPLqwTmFoO4ShSncajKJhd3ovoqdhzZ+N8UAsaBc5OAnm6PtNbvIsZBYR8IfNkK3
	stp/6rNkaL5BGe/F9IZlX7UiCIYnoJS8PH9MfJPHJSm3oWivFLQrxsp6TjiBHe0BaljtxIUZSBqD2
	XgakmsoI0JVn2PkKaOQ+nla/Xys4vxmm0RIHHMRhm6yeyRSfHbn/ew0K6Snw+brr92T+yB/ODG+d+
	Rs3PqKrISyDjXjTptLoUiEBcCYLy+i9EfI2J5Pilm5ednC2WoPDdlLQ2iWRUyR3GtZD9CV02v+M5m
	7Lntjhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizxP-0000000FnBk-3Q54;
	Fri, 14 Feb 2025 17:58:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLv-0000000Ffz3-1EuK;
	Fri, 14 Feb 2025 17:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553585;
	bh=vJ93fyDfMroysl58pmK4LB0ei52PWUbfp+wax1ulrhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iRu7SqZnHmZMxyu8W02fGyQa/wGbL/cGVz4tnGT41QMdkwm5K4om+wH1Z0TbKS25L
	 vevjesfWzwLfXnc5iovD6wAsDrI0baCey402OdpA/mLYf77xkCd2Y8oGOmqqY7r94t
	 1hdfIrUTJk6fRVFI9lwD08R7/wa9lzaWhDCaWIdBVa4MQxqDtcwzlpKKu06oPFeEZd
	 HQdUa15mIJzyiBCHAeboi/rnPCtVNuK6K22LB0lIbjKzHDOJYHNQUFNXDAqk96ZuAy
	 t0eKrMigLmMpKKXFPBIXh1e7cJQ+XHNX6+Kal7Rq13rQVaGOJshaypy30Ql4QdjXpm
	 kKH9KKEKvDVTg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4931E17E1553;
	Fri, 14 Feb 2025 18:19:41 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:37 -0300
Subject: [PATCH 06/13] ASoC: mediatek: mt6359-accdet: Use
 IRQ_TYPE_LEVEL_LOW not raw value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-6-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091947_505170_C1F94419 
X-CRM114-Status: GOOD (  10.77  )
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

From: Andrew Perepech <andrew.perepech@mediatek.com>

The symbol IRQ_TYPE_LEVEL_LOW is equivalent to 8, but the former should
be used for legibility. Update the code accordingly.

Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index eee676d1faef2076bc837a12a2ee3615216752b7..b71957f7a2edb352add23884fd9e231e36b08621 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -581,7 +581,7 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	ret = of_property_read_u32(node, "mediatek,eint-level-pol",
 				   &priv->data->eint_pol);
 	if (ret)
-		priv->data->eint_pol = 8;
+		priv->data->eint_pol = IRQ_TYPE_LEVEL_LOW;
 
 	ret = of_property_read_u32(node, "mediatek,eint-use-ap", &tmp);
 	if (ret)

-- 
2.48.1


