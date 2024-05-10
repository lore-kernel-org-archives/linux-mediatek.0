Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10AAC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVfreqw0uH1zijg8e8Ue3UOGCbiqwXXFS7aG6Qf97+s=; b=2YpY7MsO3iSTeR
	GaEa4Y6YuH6vrte/BHh5IIc1syzNZ43oAH/NqUKItU12rF2aA9DauDK52tduruvPW/tuc+/wFD+Ne
	0KZQEK8UtjhQyZGJEv1I4rP97NAZySz1MKGPjJvhI4MbYbM9CKSoAezDyTAE8dTQFn+AdyZhFytDX
	xpG9p5pPYHE+OLlsm7B4YO6UjrTEkz8CIIpe3LBzqoyDojbWirhEbsSkMqRIrh85eWamrzc7md8AV
	TvRtdK6cJXzyKrkvgbyc5ANeKxjxvyL4fCAVSPUAXQJjTjPdat2Nxv15pbgdw91HPQ3D1WixLlbV3
	RgQ0Q97ghFVKy2dVhgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N0F-00000004lkK-1QAR;
	Fri, 10 May 2024 09:57:23 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N0A-00000004li3-1tT1;
	Fri, 10 May 2024 09:57:20 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 5202B601EA;
	Fri, 10 May 2024 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715335034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IVfreqw0uH1zijg8e8Ue3UOGCbiqwXXFS7aG6Qf97+s=;
	b=kf2YVc0heVGoBZ53oLQl/aIWN0YfO6Btzz2ymGfSLu5TcJjA9CUbRcjTEDh1mdLmzTOW9h
	6kUa7GHs8sRbYcSciagYZwUSiX5kZKZV4vUBFzAthz9P+UOkTZbOa8QL1wGeDP4wg1Anx8
	w5VS1dTPbFnht8wPbrw7kBW/SQP3Ejc=
Received: from frank-G5.. (fttx-pool-217.61.152.152.bambit.de [217.61.152.152])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 086F640029;
	Fri, 10 May 2024 09:57:12 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/2] Add Bananapi R3 Mini
Date: Fri, 10 May 2024 11:57:05 +0200
Message-Id: <20240510095707.6895-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ec672c86-1632-4f96-8758-6e1f268feb06
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_025718_674861_F1D705C5 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7986 based BananaPi R3 Mini SBC.

changes in v3:
- fixed unicde parenthesis in commit description of dts patch
- dropped "dts:" from title of binding patch
- added AB to binding and RB to dts patch

changes in v2:
- dropped patches for unrealated binding fixes which are already fixed in next.
- add missing node for nand
- add some information about the board in description
    
change dts based on review from angelo+krzysztof
    
 - drop fan status
 - rename phy14 to phy0 and phy15 to phy1
 - drop default-trigger from phys and so also the binding-patch
 - use regulator names based on regexp regulator-[0-9]+v[0-9]+
 - add comment for pwm

Frank Wunderlich (2):
  dt-bindings: arm64: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


