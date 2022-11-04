Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB94C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fou4J33orvJPRJZJVv3MZe6syB9YzcftMX35Qce/P0=; b=ew8tgaDAfjWzm99W1J6QAciFVx
	YIxiCEqDBBHuFA5LX0xiwbVwI7Pu8irRtMqo0fa91r6jkN2zfQoSytr49FRaErbZmwIcwLVuCKcrM
	hbFT6yzenNCyLSWr1opPM7QF3wcvVhz7OcCB3yFt9Ec7j6LTok0Ph85WyCPQXBhOFMDBRYQ9hkyy4
	r8tp+N56Sz28HgIeb63ikgBXLIL7R4AemFu72LUPT3i9pUEVYmsOAVeE5177QuKTE40wRt1nxNX4K
	ytxpnYeTPm+rP2v1pLVublffYS0J797lEdlg3CcUVbAgxbd0P6AD0dn22SRNVTUe2FOva6PXWO2jx
	Fz9X4Ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Ay-005C3F-BS; Fri, 04 Nov 2022 21:24:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Am-005ByN-EC; Fri, 04 Nov 2022 21:24:22 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 26FFB660298A;
	Fri,  4 Nov 2022 21:24:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667597055;
	bh=uuFnxcWfl5++HD7bZPixLE+GB/VdJsnKSziUJa+HwpM=;
	h=From:To:Cc:Subject:Date:From;
	b=AsC3JSUiy8ATScgoKbobipTzEIeVkpxY7awI94quhKG+i4VkQevrmJCg0ey1kG/IN
	 QTs735SZ3cltlzwM/HEzsg/9w3ZdTHdTN61DXBO979AxB2d3i1+vsVzhTZTCxnHu8d
	 ipqJXY4mOx+wj5VEo/wJhMlRQcEmE3kbXR7wf1Mmu8KGsediEn6OEPv7tZYXBwwuuQ
	 s3g12ZKk6E/nFdG4bfdH+Wn4i+t6gA7P0BzSliCwDxys5vhmYN6Jb5muyTGIZA1wZb
	 5qmi/tb066woqT/IN8Rde7vKYYYARokJu4jJBKt1LGtY2SHzkwU0kyRe9trcKWXVzw
	 jcwbOsIOvNttA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Subject: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module device table
Date: Fri,  4 Nov 2022 17:24:07 -0400
Message-Id: <20221104212409.603970-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_142420_753589_269C5DB7 
X-CRM114-Status: GOOD (  12.18  )
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

 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 9f22d3939818..0e572fe28c58 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -842,6 +842,7 @@ static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8183_da7219_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8183_da7219_max98357_driver = {
-- 
2.38.1


