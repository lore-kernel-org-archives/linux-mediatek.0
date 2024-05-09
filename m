Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F01CC10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fotgTM148ZqesmSfyYXvxrplZmNhg1acut380A13LMw=; b=UH0VKMTR+NF2AC
	TndWQP8Xm0+LLDpYRQNm7NyqB8e041HG0K+gD9KzIBBV+iEhfaMKX0iLk63JX+r6I7meDIQ6m/tf6
	qNpnGf4UwebBF6EfdrF6PFWi8tlDdWKe4cHK5RHYFGjnAltyzW74JRU23uLa0k+C4aFNBhmUzUJMJ
	lXVngPWMEIQq9gUaO+//1rvUXRdrhgHChBQe+fC+uoqLgKpZWAQdn+lW5lMxjMvApWR/9mbnSziYj
	gYl/+sKkxAmrAloGDQCvs1jR/a31imEQWL3lZinWBbTt5SCibP8ZmsmpeGFxgPuslGny0Dq9cnkMu
	YnWOV7oiMoSV0WcYI60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55bF-00000001s7s-3CiZ;
	Thu, 09 May 2024 15:22:25 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55b7-00000001s2m-2HAX;
	Thu, 09 May 2024 15:22:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 591226024A;
	Thu,  9 May 2024 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715268126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fotgTM148ZqesmSfyYXvxrplZmNhg1acut380A13LMw=;
	b=pZGwikcb0fsbAnFSwhOmJmJNL+0A2wQOMwfNjjzcAj22oltjQL3GjN20xnOEnqYHVNOoVV
	REm5ejw0Mgx31iV60ZmucqomylPsXnLM0aTrabFSw0IBcbmX/Q+46paSNjj2BZWKaI0zrV
	OotCNlOIyCPo3WMRuYr0/9V0+VI8CA8=
Received: from frank-G5.. (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 0BF403604D4;
	Thu,  9 May 2024 15:22:05 +0000 (UTC)
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
Subject: [PATCH v2 0/2] Add Bananapi R3 Mini
Date: Thu,  9 May 2024 17:21:55 +0200
Message-Id: <20240509152157.10162-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 576f1382-99ca-463f-b168-02acee2867b6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_082217_732988_6FFD35C3 
X-CRM114-Status: GOOD (  11.83  )
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
  dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
  arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
 3 files changed, 495 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

-- 
2.34.1


