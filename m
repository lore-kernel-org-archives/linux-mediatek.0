Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D29D41169
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WE0RWARsaKg0rFspeBJE0WP71nACAH/yPh0vzKzFJo0=; b=irtzaE01VVdE46SksvzI1s7HN9
	K7tQrpLiVN+kSVPHtisXcwuc3KtWd0YpRQ46PRmBlOsd8bm6VSHoOJzeBZ8paJwZRiuspWxGOvNhn
	9JnsIypE9bjNKi/RpBX4l87pxs9aFnrTEcknzF685CxnLSTDtwVfELMlv2/x7akPd9pALhiL3kyPd
	fWb67XavUq50Y31JbVdpdGMWl4rrhaHm5J2jblhvIqUfWSrHy1g9x/2Gr3AMKDOelZSJi4G3nDZbJ
	S8BnxhdhRnqSqYdZiz2CQUivyMDlGswxiqb+v9aQL75VwIWk9PlWu1BE9uXDRmOCIPCXm8JTJemDl
	6nRETzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKnO-0000000CAdA-43UU;
	Thu, 15 Jan 2026 10:41:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKnM-0000000CAbs-1hmy;
	Thu, 15 Jan 2026 10:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768473697;
	bh=i143L/c/+nu5jz2jDioSlaedlF3KgucGB2V/bWwK19s=;
	h=From:To:Cc:Subject:Date:From;
	b=cgmjtH104Z3FmidsoB7JgtmBXh+1Am7UA8YFFeGfBs6QrWZe/6sydYmXOHX7LYlcn
	 5BWTSkdbFWXZNhxYAwGaXNObGVEnvl46wq2OYdhAbaCYyvTKTA1Xnm5wDeD4P4KUPV
	 bnLcRZeLS2Jhj+S6fVtWIUT71HNQyYEBxSmL9q024OSvFCMYewlkJA4339STxwZ5AS
	 Ux8WW9OEg7QZ9VJ/P7xatQzrhK4iY93nP5mVIMf5/h/gnepeRYJvMv/L718hMGU737
	 ffjRxSNL3c2nRf9LcBYk/8mRaW4ZNAbG9S51R5rl/4fMOsBVSi2X8QgHqraJS6CyR1
	 kiPpESZAOg1Jg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C31817E07FA;
	Thu, 15 Jan 2026 11:41:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: mediatek: mt7981b-openwrt-one: Add address/size cells to eth
Date: Thu, 15 Jan 2026 11:41:12 +0100
Message-ID: <20260115104112.56970-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_024140_613489_EF329303 
X-CRM114-Status: UNSURE (   8.60  )
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

The ethernet node has two MAC subnodes and cannot use the default
address/size cells: set address cells to 1 and size cells to 0.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 48b80af90438..b7ff7b8e1375 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -90,6 +90,8 @@ reg_5v: regulator-5v {
 };
 
 &eth {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
 	/* WAN interface */
-- 
2.52.0


