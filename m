Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52CC46CD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IkfpsQwlGoht/zhXbGgHeb5SDBdQGUW3Q1g4b0FGIXY=; b=pr39XC5403lyvkXUcfpvnzGphs
	u7VvfmCINIiZpRbefTUOSqoQwVzIhIzlX4Tc3AtB9wL/7pb75M0aCVdUT9ZOFtkGAduZObcKYQfL7
	ahUbI848/jX/nS91ZrnEc7kNncB4rFPNppCEi+4EknhgAvEr4RK2Gz6o1xHlenFcpWCw+85aiTgea
	W9d+RLH8AVpVzbL4Irt3OyxycHjArz7AXqDLRrOkKOC7NihmfJd7miJUKgL6juE77/JJTzw4DOAaD
	1GseCdluvR6xJRDKpEMZpqHkGa8TXqVXEWOsmsNCs7s2iR/1BBWVlk1zzByy+3zCtZ2JsgGMWGhPX
	SYMpMXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJBHT-000rLo-0D;
	Fri, 29 Dec 2023 11:43:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJBHO-000rKY-0y;
	Fri, 29 Dec 2023 11:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703850229;
	bh=/XUlLtN0OxNKjkOJY7EN5g0ejaPbJLN+tXv+cAsFoO0=;
	h=From:To:Cc:Subject:Date:From;
	b=P8P+qE2Dr4SdxxZxZVWTVycv0wuw0hQNA9rlk+75OvuRAOyl49K4sPBUsh7UVcrH1
	 JQcdy0L1oHiDCwoh19hfvmHLy69+stMoc15UMGbS6v8lilmPSWNgawImb4zeONS/Ux
	 1Tb2DYp0R88ewniCzT67LGc0tM3LvHpYsajTB/BYyNjznhbFLRFUqjdAN4EAih/Uib
	 YIE8W0ivxVblq/f9Ow58CUxUUHSasWzd8Vf9Iu1JdkvHq3aq0NwtJEzxvdFfoeoiH6
	 CRl/GyPC45TNODnsxvrdZ0R/+MSFT4bByCEYqyUVV+PeEoK40je76qTGAvG9Z2JCEB
	 ryT/iDW3RXaYg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 40DE73780894;
	Fri, 29 Dec 2023 11:43:48 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	jiaxin.yu@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and offset
Date: Fri, 29 Dec 2023 13:43:42 +0200
Message-Id: <20231229114342.195867-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_034354_508718_D38A5D95 
X-CRM114-Status: GOOD (  11.43  )
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

AUD_PAD_TOP widget's correct register is AFE_AUD_PAD_TOP , and not zero.
Having a zero as register, it would mean that the `snd_soc_dapm_new_widgets`
would try to read the register at offset zero when trying to get the power
status of this widget, which is incorrect.

Fixes: b65c466220b3 ("ASoC: mediatek: mt8186: support adda in platform driver")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index 85ae3f76d951..ad6d4b5cf697 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -499,7 +499,7 @@ static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
 			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_SUPPLY_S("AUD_PAD_TOP", SUPPLY_SEQ_ADDA_AUD_PAD_TOP,
-			      0, 0, 0,
+			      AFE_AUD_PAD_TOP, RG_RX_FIFO_ON_SFT, 0,
 			      mtk_adda_pad_top_event,
 			      SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_SUPPLY_S("ADDA_MTKAIF_CFG", SUPPLY_SEQ_ADDA_MTKAIF_CFG,
-- 
2.34.1


