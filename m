Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F36C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRCnsdFmI22oXmR3+NVxPYEvtrF+nUtfGP7abgQ7HbY=; b=s9EMZQL10RZY4pNBfVMsuyntmD
	jfrQe05ECMQo/gWdicPjsQzBgmXQrL/LQNopxp/+OMCD0c7F+afpxq8rlgHg5gneVc3zaMKhR90vz
	kCPvOi4myBedvbh8UprHtIii0llTMHVCJ+WXjIttVvi6HjwYaD/NptAQCt/bXKyeHq6a/lIOzzHON
	4CR1bViG7sNwoxJ0T1gzCmshBp+CKc8nzTTZip7efmvH2G16NFGN9YIuCIK8nhDqK8Ypn7Kujpq2Z
	mMeonVTRyxlrjC3MW+IbLsPd/IMM7WF+w0cy8Ny75+X6OeTMAuonZJZ7T1TSY8asUbTEgyUzaqvfv
	ZdELTVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4ds-00G0TP-Mh; Mon, 07 Nov 2022 16:06:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4cV-00Fzcb-AU; Mon, 07 Nov 2022 16:05:08 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9482D6602923;
	Mon,  7 Nov 2022 16:05:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667837106;
	bh=cWcFrxjVwWRyWpHfqO+h4s6yyK8WemwZSSHtSbA6Aew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=caGmBwZ9FxdBpYduYe9IVamXR+zFGl3SvC2rT/tF4Pq1KyiVgPZBt+G5AUPR44yXR
	 6kPqCJOjWFL+0lycdDmoUWSaLEArIkyG31S6IqvlUqlLKVIrda+KoXJLVYhVgISbqq
	 3QiQOrzlHPIJQ5aRTQ6zOMFbMbNewarUl6QkT1034UEAM+uU1acL4pX6c0dcHCB2Fb
	 8mZ3vvxGJzP5ggpp9bBrhUPTtAgjJYpaAE4GaBgzo5AGNZ678AKL1oB3EzZl3+3JQJ
	 rld7o3VuXIZeTGJJW8MxNn6apulJSK2sOC0AAgUo72bWxCOwnhRN039Dn6itHsFikP
	 LnIL4wi+F55lQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/9] ASoC: mediatek: mt8186-da7219: Register to module device table
Date: Mon,  7 Nov 2022 11:04:34 -0500
Message-Id: <20221107160437.740353-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107160437.740353-1-nfraprado@collabora.com>
References: <20221107160437.740353-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_080507_513319_A9085AB7 
X-CRM114-Status: GOOD (  12.00  )
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

 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cfca6bdee834..08ff57f7189c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -1161,6 +1161,7 @@ static const struct of_device_id mt8186_mt6366_da7219_max98357_dt_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, mt8186_mt6366_da7219_max98357_dt_match);
 #endif
 
 static struct platform_driver mt8186_mt6366_da7219_max98357_driver = {
-- 
2.38.1


