Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46291E64001
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b/1+h/woDJ+LRlAGuVlOPR5DC6XTRRSPJZgjVIzkrNo=; b=JJS9zcp2dUyVSq
	1nEOsZ4pPaNp2/KbQWqZnOpdq8CuG5/XOv4So8zUr7wj90zWJ2GX4IPko/5xvuMGTjmiPq2V6mIRX
	UDNwXj+C2nPkv+OoPEQ+dub1hMdrNrHlHA+VpSH6mO48QMavFvBLKE0yRBoVTsxZCEvGpCE6b88IC
	xMfFERkkJwjcpuJ4fvpoLnzsJZ7oRhqMuMoZHV7gjE231whdkCmAypYO5GFiMiKUSncgF7aJeqkgF
	W/lfWS+mEtZogdxIR90D+iWx5wnTqwGshlbMycNdRnzrXUcEbJt29ykg4VxlNcj6AFzazRKqZK5w3
	4oRTd3Wv1F8yvUDiKmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2i-0000000ECCT-2qh6;
	Sun, 12 Apr 2026 09:23:48 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2e-0000000EC9j-3jF2;
	Sun, 12 Apr 2026 09:23:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 43F953FD57;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b/1+h/woDJ+LRlAGuVlOPR5DC6XTRRSPJZgjVIzkrNo=;
	b=W71RaUil2TlB22R4Oj27Frd8eB/xlxBF5yLCx+8I2kbJNzBYYaJnGCO1BB1Y/1RpVkclTH
	AKEWqUUc6TI2LFVulCgtMpD4rmZYvIBOul+0pbFD4EbUQkOCWEBvh6f72aP+O5cX+kxfBx
	pDdSagnUCxWeAZY2IQnFJmVYYqiualU=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 112E11226B6;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/4] some BPI-R4Pro dts updates
Date: Sun, 12 Apr 2026 11:23:28 +0200
Message-ID: <20260412092333.6371-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_022345_077820_D4F5DC58 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Andrew LaMarche <andrewjlamarche@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

There are some parts of BPI-R4Pro DTS that need to be changed. Currently
there should be not much users of the mainline-dts and we noticed some
things while openwrt integration.

v2:
- added mgmt port renaming as this patch is still outstanding to keep
  all in one series
  https://patchwork.kernel.org/project/linux-mediatek/patch/20260303202006.37515-1-linux@fw-web.de/
- dropped default-state in gpio-leds patch as suggested by daniel

Frank Wunderlich (4):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling

 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 +++-----------
 4 files changed, 51 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

-- 
2.43.0


