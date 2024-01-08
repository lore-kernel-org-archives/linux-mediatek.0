Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C482C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXargCYC5tp6JJ5K6cG6yI4OFY52NWFfheJBVFalhQw=; b=EY90iLiMYKb0eBO6+AblAJhMvP
	X9Gk2KYdc1nJCk6LuU40Xn/bEYl5k81XSd7XxqUjM0B7fyQ9VgktDbe3XewsZ+R6FDIId2mUkkFel
	Fa39XbF/0+hn+BWFe2fkXxeNBSX3VWN2VXBj0PEOGAcDfXWDmC+KdDZ5q9lhkUme6jdKkdqOjsfEo
	O4ihoL8r8OHlYVs3+2SJz6bDxlrCto3CJqxOScRK0nIGR2FrULQ0XJpdYGT6knYkJn75G6V16JoXN
	UzQds+tQpRu+vytbpEATER+nQ7D9msXur8fdzG+jGgPZMqvi2I8X4w1D2iFrut3d1T6TlzhkWAEeQ
	Fm+Eom3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwWy-006CMN-1b;
	Mon, 08 Jan 2024 20:47:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwWt-006CJ9-2Z;
	Mon, 08 Jan 2024 20:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704746837;
	bh=UQ/Pqq9hCugSxC3Fzh31NRAczf6loqtAEVkRzY9ZrUY=;
	h=From:To:Cc:Subject:Date:From;
	b=fu3FyYNgD+idTI4piSZ17tN+M/ZavzrqZBkRgO1z+9KFmMqXzHO/8MaMHHeKbgKmT
	 FCunKCxfVFTFdoQar8AN/9ZqZr73MNkTPjR4aPHsgoeJMS3NuE0UjmZFmJZh9B/wfm
	 uBEtKjRtItys+DDipV5HuIPi+QxZbVslRP6BrQ25fHTV6u4sqn6rq+CbWBPIPNKJIu
	 Z7TIDqO1NBgHE+VnrVF1jYrZ+UsjsfAxgLF+mpZLRIqqcC8Nrg5QeSBRea5wf5wLY2
	 BeZvGKI5a1tuhoHWLF+B5uVf+5ch4VRy95pl7af70cunodjkUWc85q+yz1zoXVfAPQ
	 RwNDbkGikAX2Q==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 924B33781475;
	Mon,  8 Jan 2024 20:47:12 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado=20via=20Alsa-devel?= <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name before dereferencing
Date: Mon,  8 Jan 2024 17:44:58 -0300
Message-ID: <20240108204508.691739-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_124727_994038_F9BD4C76 
X-CRM114-Status: GOOD (  11.53  )
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

Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
Component via COMP_DUMMY()"), the dai_name field is only populated for
dummy components after the card is registered. This causes a null
pointer dereference in the mt8192-mt6359 sound card driver's probe
function when searching for a dai_name among all the card's dai links.

Verify that the dai_name is non-null before passing it to strcmp. While
at it, also check that there's at least one codec.

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://linux.kernelci.org/test/case/id/6582cd6d992645c680e13478/
Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5bd6addd1450..bfcb2c486c39 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1208,7 +1208,8 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			dai_link->ignore = 0;
 		}
 
-		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
+		if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
+		    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
 			dai_link->ops = &mt8192_rt1015_i2s_ops;
 
 		if (!dai_link->platforms->name)
-- 
2.43.0


