Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF49CF2568
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0h2d49jGEJ8TqYqr97bccjBuIfL/jaq+AJ2XRu1lnHk=; b=LNLKg2QN5tfbAE
	2fqC4zmDGk+Ek+hNeWqBFPGwIQcBDK17r6Pamse/bMcbqbNFVMwVXGArt3MCwmZXej+0yeKQ/8kJi
	I5RMHWF4/4L80YjV4nU41fZ28rt3HyN8zF06/4Se73pTzdpDNP/j9a7jrTshK8qwhtKRt2O2Q4CVP
	I88FSSgZ7aZqehPiDublVXXLmqhtD1HFxogRDeddbDsO9yExSEeZ6AssXmeoZHOUpXjgvoVf2HT2g
	AmPemdl87URztLvl7+AgKJFD9ZOXu56clczSVDSmOR07DZK0LNYd3v2k4ug9jmECsKb2qJEcLLjUm
	rj5SLMRuD9C+I3zx/DIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szdKb-00000001MmU-19pS;
	Sat, 12 Oct 2024 14:42:57 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szdGT-00000001LWK-3M9r;
	Sat, 12 Oct 2024 14:38:44 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id E8F45100292;
	Sat, 12 Oct 2024 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728743916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0h2d49jGEJ8TqYqr97bccjBuIfL/jaq+AJ2XRu1lnHk=;
	b=On5QsgKLCEt3JoWgchtFpx3tF/Dr17vsxIBTjMAJ6Me7r4fUac1tUKt+YdeNM8NvZfszgC
	WBYeYw5Vhx0l6y7NLLLZMcVt/XALYZRW2WWJi1b7rITiqFzDYHdfqWuJrTOYranRL2XU4D
	CiyL4jDT8dlvgGZaFoXjkGDS/++bzkQ=
Received: from frank-u24.. (fttx-pool-217.61.155.16.bambit.de [217.61.155.16])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id A62254012F;
	Sat, 12 Oct 2024 14:38:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v4 0/2] Add mmc support for mt7988
Date: Sat, 12 Oct 2024 16:38:21 +0200
Message-ID: <20241012143826.7690-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f9b58133-ca2e-4d2f-bc1b-1157f73252bd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_073842_009306_D3D8D2DC 
X-CRM114-Status: UNSURE (   7.59  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add MMC-Support for MT798 SoC

changes in v4:
- drop minitems because of dt_binding_check error
- explain mt7988 compatible with mt7986 platform data in commit description
changes in v3:
- use mt7986 platform-data with the mt7988 compatible

changes in v2:
- corrected minItems to require all 4 clocks


Frank Wunderlich (2):
  dt-bindings: mmc: mtk-sd: Add mt7988 SoC
  mmc: mtk-sd: add support for mt7988

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     |  1 +
 2 files changed, 23 insertions(+)

-- 
2.43.0


