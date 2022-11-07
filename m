Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19551C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zth7KOlMoWhqf1aWOgLJYn15uj/RILU1/au2R5lrHlQ=; b=m/q3YM3y3166hs8agfMyEnc5zE
	cix3cJyfa6pAJUQShQlPG5Nuf4X4sA5A7HjZAkClQAh+GDwJMekQMiblnS1YKihsSdLrKsAjyi9+f
	r0OOYdmsYLGzRzqA8dCGIoMdpuhBS/U5DpDIH4DmaFKMKjz8/AQDlAMHRLTW1ss3ufh51xJwtX7RG
	hCStQkTLuXv8noeZNfVi/NkeDPYlpENIIq/ulGowsTf+T+WZ7yEk/Nagmpfez31E5M3Dy/4PXyGAa
	185dxLsYB+PYC4gEQ73ersKWBo3Uoj/g8DQ6PZljdpLvgz6es9FdmLaUZzb6pEG0cHr2sWVC/2hAw
	n1bVNzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4eu-00G1B5-1G; Mon, 07 Nov 2022 16:07:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cc-00FzgE-IX; Mon, 07 Nov 2022 16:05:15 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D1D266602965;
	Mon,  7 Nov 2022 16:05:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837113;
	bh=oWRkrDOmNJ2dmIVe5ehfgdnkPnZtvtRMYH1LSztA4/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPN1eQI+7jezHkamwk1HZ83zy7ukfs4L6sTCR6xZHpu/bu1zpRls/3yENC7JX7xvR
	 a/FoukoFapv9GKGXxmAiAF89zt6I4untu+Unf5lDZxoIbFoXqrwLV/0KYafeZOlKXx
	 /SdtT5fK7JCl75PnyRZ+mbhOvToMtYXVoVhlRyZHBvlF5BxYDs/0fOVLCVKDzAuFPf
	 FXkO73a5CVSewIyHYP9P8QhRLITCkE+3ZW9iKMhVI5RyPoEtksEDFMHTAEy9GvdUfI
	 YAN9xsthNEmATiRdln1fYBhhweSTNXFiBVeF32tvUhXJT0xUbTMxuuDg36DhuGoRbc
	 OF1/GDse4c1SA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 8/9] ASoC: mediatek: mt8192-mt6359: Register to module device table
Date: Mon,  7 Nov 2022 11:04:36 -0500
Message-Id: <20221107160437.740353-9-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080514_791686_B34B847D 
X-CRM114-Status: GOOD (  11.39  )
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

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index b93c3237ef2d..16660eda577e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1261,6 +1261,7 @@ static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8192_mt6359_dt_match);
 #endif
 
 static const struct dev_pm_ops mt8192_mt6359_pm_ops = {
-- 
2.38.1


