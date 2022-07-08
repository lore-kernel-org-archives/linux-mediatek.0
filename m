Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AEBC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 02:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1nzotkOABl7OCJlNnnM2mS9ytvB/1yubrP9ZFwrsivc=; b=5E2O/AchlUlCzlUZunHj5qHR3x
	bMlAssJAVqLyw9iTJt0AffwNwRVY4W++FiFH/ZNqTFkmTm+UHTu7wRsadldTuAhJk/PmTSVW95V/Q
	14CGzf1NFPkoTQYGe0pS9gZV8miFSoNhOHgWiDYtyq8IEoB7k4qJz/Rt/dN2JWfMlj26HQX1uq6GJ
	cdS83HyuKr+nuoaxEun2IlSimpffjDoip2BFe7oOC64ZJp+Cu/RTQ0v5XHbsAVP6+hnxDko+8Ow13
	/SEUYMCwVrti3XuKjx92ZMmR3CxIic3ceqIAL3qv+CYfnV3iHrR6T/G3iy/7Wee7oZDn5vZg08nf/
	n/DM3tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9e22-001PYZ-F8; Fri, 08 Jul 2022 02:47:50 +0000
Received: from m12-13.163.com ([220.181.12.13])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9e1r-001PTi-6y; Fri, 08 Jul 2022 02:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1nzot
	kOABl7OCJlNnnM2mS9ytvB/1yubrP9ZFwrsivc=; b=Z6IgAEVGPLj7J97ZlgIO9
	O/S8/ta7p1gaNebKIYKo8zdYOsuVrxf/kyVLHnNIUN/3zcols739BRu7cUWBnnN3
	MiRKs3wrv7JN6ufqfzEGKZHASbWudTS+F6HLrEmqf06HlPQkPemIvJHlSahWc/5q
	qWBbowSiBEOsrcRm1+/1po=
Received: from bf-rmsz-11.ccdomain.com (unknown [218.17.89.92])
	by smtp9 (Coremail) with SMTP id DcCowAAHCKihmsdiYmyhNw--.45193S2;
	Fri, 08 Jul 2022 10:46:58 +0800 (CST)
From: Zhongjun Tan <hbut_tan@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.c,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jiaxin.yu@mediatek.com,
	tanzhongjun@coolpad.com,
	colin.king@intel.com
Cc: alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Date: Fri,  8 Jul 2022 10:46:51 +0800
Message-Id: <20220708024651.42999-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAHCKihmsdiYmyhNw--.45193S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWxur4xXr1kGrW3Xr15XFb_yoWfKFc_G3
	s7Gw17ua45GFW8C39rtr4kCr1DXFWrCa4v9F13twnIq34DWF4ru3sIv3s7ur4DZw4kZayf
	Jw1Svr1fXrWqvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnqjg3UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBXgM4xlaD+mHdqgAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_194739_671695_4228B875 
X-CRM114-Status: UNSURE (   6.79  )
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

From: Zhongjun Tan <tanzhongjun@coolpad.com>

Remove condition with no effect

Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index db71b032770d..6be6d4f3b585 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMU:
 		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
-		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
-			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
 		else
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
 		break;
-- 
2.29.0


