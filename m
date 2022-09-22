Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FFC6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWk/s4LfB123Y5K8PVxmwj3bw6Op8J5ZtsVtB01jLes=; b=q7o4wRrwS/iR5wLoA2D7cXbKX7
	KFS/BbJ31zo2yRJzXx2/FWAWm0X6kN61OnYn+VCVG0jqDM+t5QspulTMfodsdyrjlplaHi62e7jln
	dsZnDu0IqX/89ZPkMG7VfF58sc6hNioqna/BtLhhuCGwaL1Ni38TGmZUp0yS33mycBXDW/8SmYM8E
	suyv46cabdWfiwGa4dSpBDsft8TuogQ2KHszwYu8XB3o2u9oVW7Un/CcWa/qPp30FuDCfylf6nKvc
	0nA9AJdSUaJUPf5GxYy76htiOXdAnwGJ01ENxKuIlu0mmahCwYWMfNVl58ndgeDvs1iX2jddG3Z96
	ZjLL3jlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8I-00EnI2-3g; Thu, 22 Sep 2022 10:08:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIpb-00EZ3j-GL; Thu, 22 Sep 2022 09:49:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88F5C660221C;
	Thu, 22 Sep 2022 10:49:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663840154;
	bh=/sD//Fx1hRIgFZ1vKpgrsJe4DfP3ojqL+kjqLiG5HQM=;
	h=From:To:Cc:Subject:Date:From;
	b=Ac8iISjW5bF7fiHTQjUlLMkOyosReAbqjI1vruuU2AJnF3BMWGzcSHExlLDelG/Rm
	 OEzolRwICeQAoCpaMGZWVGIltjiPG7FMhekes9gNT1ghf+uE0YXRyBKYHmDuyO6551
	 mwAIuGBdzE6ojsV0joG3jyPR7FKSvAo8ztMKfmwW+38h7EjYQnwKXf9CaLJdma9lk0
	 SY6QJHuhzhdLw5UgCcxvL0rPD0BOzpNVylvuHYf6Hrph4ykC8Uo8LOFmdGxXICvgBO
	 YxF2LkN99kmLsikXGrPYxWYkMzH6d1qfvSdPwGcPvjuj993PLU8pS+H74oHaOZ1nZJ
	 ZkXe+rymvKnYQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/4] MT8195 Acer Tomato - Audio support
Date: Thu, 22 Sep 2022 11:49:04 +0200
Message-Id: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_024919_863562_45FA8402 
X-CRM114-Status: UNSURE (   7.48  )
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

This series enables full support for audio, with DSP, on the Cherry
Chromebooks.
Related ALSA UCM2 configuration was already merged in its upstream
repository [1]: this is fully tested and working as-is since all of
the required fixes for MT8195 SOF drivers were picked and are present
since `next-20220908`.

[1]: https://github.com/alsa-project/alsa-ucm-conf/commit/a59c3b1a57de8eb424c4f754bb031265e856260e

______________________________________
_________ Platform overview: _________

What's still missing?

* Format:    feature  (location)
*
* MediaTek vcodec enc/dec (mt8195.dtsi only)
* PCI-Express WiFi card (mt8195 and mt8195-cherry)
* VDOSYS1 (mt8195.dtsi and mediatek-drm/mmsys drivers)
* DP/eDP outputs for external/internal display (mt8195 and mt8195-cherry)
* LVTS Thermal Sensors (mt8195.dtsi, driver is missing)
* GPU support (clocks and mtk-regulator-coupler are awaiting for review/pick)

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: cherry: Add Audio Front End (AFE) support
  arm64: dts: mediatek: cherry: Enable the Audio DSP for SOF
  arm64: dts: mediatek: cherry: Add external codecs and speaker
    amplifier
  arm64: dts: mediatek: cherry: Add sound card configuration

 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  10 ++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  10 ++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  10 ++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 109 ++++++++++++++++++
 4 files changed, 139 insertions(+)

-- 
2.37.2


