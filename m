Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF70C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kUrset8IRus9e1o4gtegJyZ/BgSNNlIYLwp2NoZD30g=; b=sDbf0qFlwi7mwX/nW1FmF1cPVY
	mA9VI7No+AZWEWkeHHeT60tqsq0voIYmPDwUzwzviK61byTEEn37w8wZUeTRi6/7NxzYeeFRgaFQX
	0mEMOIHUz7ltlMaqIjHuEhjJifogL2PUSKl9fm2OZLSe+sqapLz5hcBiD476NsRrTSjc+no8eK6SD
	o1M/kzJafY0LzWuBJ0b7gvW8j4QEFQ9HSKRWQNp2LBlggio98+DEJeA0L0u6IKzRcTXSUB4bpC2cP
	TdGb0BB1Xm3Y4ANtElyIUEvwGPUUcZZYEQQJY4E0TPSweMFfKN8bnsAPtnMXS0BmMhWq7njtuVE6d
	Te65qctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIsA-00AGu2-33;
	Wed, 17 May 2023 15:15:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIs6-00AGt5-2w;
	Wed, 17 May 2023 15:15:24 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 999F4660574E;
	Wed, 17 May 2023 16:15:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684336521;
	bh=JXHlQGqLZnwEd+1ywgBD3qSPq+lFVpm0deC33quGJxg=;
	h=From:To:Cc:Subject:Date:From;
	b=hU6gxKKpauEvIDnRRvhNe5X+xvq1mbElAP7P78bkk/hHN4XTRExPEbV+YZ3Pzhtid
	 kKq19X8KSghlsJ399B8CEZafU6kvVxFno7r6UGH+R2DBgq8QUdvrC6qDrCyhdhl0CW
	 Q/Jy9PIGGy4HAtAzB/Pzto/dUnSC2l4QAe9h/LsXsJ/Yz8XirEyQfAtP8CzMgjG8T0
	 j6bPn2QLepvjETscRoG1aV4+9GcnZTs3VzscIdM88AxfkjKOPTHeImTgIBFTHTx6zq
	 tWvrb/HDXVO7OY2eRSXaPzukoqLGZp4l27t/Yl50Ec2cXqRak34CuP/WjdzTV3iKzT
	 oMYE3MMzvdNew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone pin name
Date: Wed, 17 May 2023 17:15:16 +0200
Message-Id: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_081523_106483_03F91ED9 
X-CRM114-Status: GOOD (  11.54  )
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

Function jack_kctl_name_gen() will remove the redundant " Jack" from
the name, if present, and then it will add it back, so that all of
the controls are named "(pin-name) Jack".

Remove " Jack" from the Headphone pin name to spare some CPU cycles.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5e163e23a207..4e0d5bf12b47 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack_pin mt8192_jack_pins[] = {
 	{
-		.pin = "Headphone Jack",
+		.pin = "Headphone",
 		.mask = SND_JACK_HEADPHONE,
 	},
 	{
-- 
2.40.1


