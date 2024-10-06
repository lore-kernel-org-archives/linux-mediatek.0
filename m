Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE02CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8a24Wv8+IF6YtpnxD3MAY1GU/+RJAr6bKEjkH7W3iMA=; b=VdQxUWJPZXkUjg
	kqHEIrvZcdvpKFUEkNFQ9ImAquuGHMpvxkMZQ4KBKobZMj0lrOXU8Z9zZJeuObfASxpVvk1+Q27ea
	4Fbb9vdp+HB+YClZTD0rb2wLEbfbcr1AqbavCmRO+bjpRAp7BrJ9UIEEV6subAFIGiUkN1+UbWfRQ
	kxfs4nBGfqSwQZ1MpCm6vF5uQChO9A+1w7QRa0jHVxugWde8UMmO89qOmwZ9UaGNkt6Ej7ZXmkRaC
	v6CnkN168jAyryZ+2pR3l1fsR+89IhkOTTKWkoOLzFi4nmiqKCU8itVkbg7uKDQOtwFwMoIwOl6QE
	862uIARnHdhItkbWFYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTIu-00000000ENQ-3M5G;
	Sun, 06 Oct 2024 15:36:16 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxTHc-00000000E9i-0ctX;
	Sun, 06 Oct 2024 15:34:57 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id DA73A3FEA0;
	Sun,  6 Oct 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728228894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8a24Wv8+IF6YtpnxD3MAY1GU/+RJAr6bKEjkH7W3iMA=;
	b=plBxpYlwni/+QKRwhvtDms/ca6FJXKkSf1piZBiOQdpOegHZyj6vnztjuo29vkmKdGRHxN
	Ftmc96qyYOquQj2f3wyqFVW0+i8vE330iKQBkYn7/8G6gixsImuS0SaqQhlW1FT7xNP2lB
	wRdNXMHbjN8uq7e3OajHEdGGzj27ZF0=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B75F1100546;
	Sun,  6 Oct 2024 15:34:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 0/2] Add mmc support for mt7988
Date: Sun,  6 Oct 2024 17:34:44 +0200
Message-ID: <20241006153447.41377-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a14421cf-f9da-47e1-aaa2-7eacc01207e4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_083456_371801_6B4C8882 
X-CRM114-Status: UNSURE (   6.68  )
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

changes in v2:
- corrected minItems to require all 4 clocks

Frank Wunderlich (2):
  dt-bindings: mmc: mtk-sd: Add mt7988 SoC
  mmc: mtk-sd: add support for mt7988

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     | 14 +++++++++++
 2 files changed, 38 insertions(+)

-- 
2.43.0


