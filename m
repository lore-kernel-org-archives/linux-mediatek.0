Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1222BCF07BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+MYsewPHw+DIVFJnkGujgFmnXVbd08dq12DCsOchfs=; b=sj2HJLXDcN19wss+P0S4OVjFOL
	A197y90kTBngULPGIdF3NfSnvuG137OjI9k5Jyg3pX5dHRb1FJQnENGDHjQn74+kh0nyQg5kFGy3D
	zvQkoza5QtutSel2urSrh/2Co+ij4PTr0v+XOCKdRjAdkAIa5OICCKEfzK38+Esj9RHrThal2h+JF
	aXTu8Baogi6daQMjFWz1lhkdP6TGQZfYnE9vPr2HbAu/13JPEPPUk7cbQfoGnflIXaIsZb1STwjfq
	Q6/7R86iwqMIXw/1mL1o9a/BKsrS0nE/NxvCFYCGRllrp68liMhdFUdaW7tpl9XuKgWq/3oU9ozTU
	zepqjx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synxY-0000000BsXe-0PC2;
	Thu, 10 Oct 2024 07:51:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synid-0000000BrBP-2b4N;
	Thu, 10 Oct 2024 07:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b+MYsewPHw+DIVFJnkGujgFmnXVbd08dq12DCsOchfs=; b=BSBq00OjaIQo9maxcS5R23xlUV
	W8HYwAqHDCZ/QWShcbGl4uxo/3HlAKRzbCh5D29CtYUphNVlRSIW/SfdhKbpxsfESQhs2zV4/RYEq
	MkNyL0CqzCXmAOVntSyjVLrkLH4PuREHFNpVNCuBQyOUNJn89IW2msRNt9uWqsBY+onxrT/Y0Jd6k
	bMnBE8n3gNtHzvzMO+Ybw7qLDblic/G0qAB5ITQsFLHn5itJr5t992IQvg8cJXco0FXeQMiH/TaO4
	yb7BVqMNeQ0JpPoj08QugLMZ8JzBWuRZDFXIS69OYA85yAgoCjlntpfYkzzUe3D2+EbdcCfXfgEgT
	cLEeiKag==;
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta3.chinamobile.com)
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syniX-00000005DuT-4BUe;
	Thu, 10 Oct 2024 07:36:17 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9670783e2fea-fbff7;
	Thu, 10 Oct 2024 15:36:02 +0800 (CST)
X-RM-TRANSID: 2ee9670783e2fea-fbff7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1670783df7fd-3f86b;
	Thu, 10 Oct 2024 15:36:02 +0800 (CST)
X-RM-TRANSID: 2ee1670783df7fd-3f86b
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable assignments
Date: Thu, 10 Oct 2024 15:35:47 +0800
Message-Id: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_083615_123590_56E56B47 
X-CRM114-Status: UNSURE (   7.50  )
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

In the function mtk_dai_hdmitx_dptx_hw_params, the variable
'ret' is redundant, thus remove it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 2a48f5fd6..69a091dad 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -2422,7 +2422,6 @@ static int mtk_dai_hdmitx_dptx_hw_params(struct snd_pcm_substream *substream,
 	unsigned int channels = params_channels(params);
 	snd_pcm_format_t format = params_format(params);
 	int width = snd_pcm_format_physical_width(format);
-	int ret;
 
 	if (!is_valid_etdm_dai(dai->id))
 		return -EINVAL;
@@ -2450,9 +2449,7 @@ static int mtk_dai_hdmitx_dptx_hw_params(struct snd_pcm_substream *substream,
 		etdm_data->data_mode = MTK_DAI_ETDM_DATA_MULTI_PIN;
 	}
 
-	ret = mtk_dai_etdm_configure(afe, rate, channels, width, dai->id);
-
-	return ret;
+	return mtk_dai_etdm_configure(afe, rate, channels, width, dai->id);
 }
 
 static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,
-- 
2.27.0




