Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B8DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OccnILZwAZ1iW7ZSQATU7VS3BdSsH1TXTafd12dSgdI=; b=Ft4RYGPcdEE02SCUvtVVYeGIit
	2+SIiR6sahZAsXzfsfr0Pn0j3PSwCoaKqje0WEvso8rSF4twRvdGx858d5We3JQKpLGwGrIa+WHJB
	36fUIKrdiGg9IMsdqP8IBgQDnELR6tS48aR3VHMs3/z5HccCiFXYy2ewgajLTvNenPB1p1on3eqPj
	PtRUQMSrquk4gDOD5fcoJN5YG6YhE+CJF298lpExLNEK8snyf+nkVYe3UgFlNfZhVJmwNZCpt+fGt
	QXWEd0/4L5yZfvlutzeY+pzlku0iX98nypZHTQYAyZK6kQKPrVIK0NgLGsmkBxwOOD09uT0I+tJnZ
	i4zV2KXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4fO-00G1St-8I; Mon, 07 Nov 2022 16:08:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cf-00Fzhi-Pj; Mon, 07 Nov 2022 16:05:19 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BE87566028B0;
	Mon,  7 Nov 2022 16:05:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837116;
	bh=bP8o3ce5ZgXYubneNGO6GUzIYsV6S7bzhWTdLtO4yUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2Ep22NpGLHP5/VWW983UeeWT9Jv6oVhDPstT7b4AK3Ja3Jlj2EOCivxH/eXfWbsF
	 g44fjgHkbLkZ+MtzgHP61Pnij2w68rASg2JsrADGE9Xa9FpnDx8u1s3HPEhCtBkI1N
	 ue0bi2D6ACxLmroy5kFfawfTY0FP0cGg2g69KMctlJfemQWrUWo3kqMQoXxsnIr357
	 NemKv0btLzMj3qxlMCGZlSAOvDiCGxZh2ge03bUZ5D2v+F3MIn2fRLxNNkw4O4q0dB
	 VECXJLkTMVB0iqi6GVbFSxNbZfD76HrppGwwXgY5wWoQcmLJc34DWu6EyE5hpr1x1p
	 hMHW+a5dqIiBg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 9/9] ASoC: mediatek: mt8195-mt6359: Register to module device table
Date: Mon,  7 Nov 2022 11:04:37 -0500
Message-Id: <20221107160437.740353-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080517_994206_FB43C540 
X-CRM114-Status: GOOD (  12.16  )
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

Register the compatibles for this module on the module device table so
it can be automatically loaded when a matching device is found on the
system.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 480ed3e08d5b..61be66f47723 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1544,6 +1544,7 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, mt8195_mt6359_dt_match);
 
 static struct platform_driver mt8195_mt6359_driver = {
 	.driver = {
-- 
2.38.1


