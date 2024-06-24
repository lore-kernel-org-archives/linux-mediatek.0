Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BBCC27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4PPIWnSntGbucOj7Qa3cqUKyDG1tJZ+G6Ih4WCPC9Q=; b=H1e101wETcQS5FszEoSVZ+ehlE
	+iKkl7kkpjKpT0V0c62AfWOkhKDXwnnhW35uMnMxmMNtchQOjzaxTeJxkcc/gN2ZFp8xuAv2iZ4LM
	Lcbt0XgjO+ZLk/yrw+j+oAYtcC9rB2/TNvS7uf65Sa2pIaOu0e5MArBBYxu4ZEnO1pj7Co4/iXl15
	fdbe7R81fn28HyiqLVwOmsKBlYDblp++Zr/beH1DutOu0V82DZJ5U4pj/ld4WnhXUbDtMT4H04msn
	2phHvqrbKlWCLMvBo1ItTXxbAhojbqAzJgIfd6QEd5ZSnqDiSb14Nn/Py8VUk29h7B7VBRGljWe4x
	752533Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZuT-0000000FKzA-3HRc;
	Mon, 24 Jun 2024 02:58:25 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZuO-0000000FKxm-00nT
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 02:58:22 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5B07C2C044B;
	Mon, 24 Jun 2024 14:58:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719197896;
	bh=b4PPIWnSntGbucOj7Qa3cqUKyDG1tJZ+G6Ih4WCPC9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Dsy541IrOR2d7+JHSboOJseQcChjXtH3AMCiKMq/ThI06AZChRzDre90/ueGy6KEG
	 nsOn7SRhoHvUxK93974Deux6kurnivArLz4klNMtvcLV4WPdr4u71BcDP2U/gOb7Aj
	 rM8eM5tSI3XKwjZ/HlvlDgYO1GQhdqLIImm346mFCtbymD4i3h2RKOwMGZfrlV2keb
	 ztf+57xL7DMaQPrpQg1Nvy35UGvbldS7RLsSewP5zVXr58G6D+tOBNdr4SIp7bur6s
	 hB1dPqg6KXosTFLvORaImFOoA1fCvoo+ljQ3/Iqm7EtXVhVx2hEhUcf4YJWZWdjryq
	 cOq312Bfe3BDQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678e0c80000>; Mon, 24 Jun 2024 14:58:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2856013ED63;
	Mon, 24 Jun 2024 14:58:16 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 228A9280AE5; Mon, 24 Jun 2024 14:58:16 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Minor grammar fixes
Date: Mon, 24 Jun 2024 14:58:11 +1200
Message-ID: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678e0c8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=Mc0CNVgLlbBwIVVfR90A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_195820_806979_D53AF456 
X-CRM114-Status: GOOD (  11.31  )
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

Update the mt7530 binding with some minor updates that make the document
easier to read.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    I was referring to this dt binding and found a couple of places where
    the wording could be improved. I'm not exactly a techical writer but
    hopefully I've made things a bit better.

 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.ya=
ml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 1c2444121e60..6c0abb020631 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -22,16 +22,16 @@ description: |
=20
   The MT7988 SoC comes with a built-in switch similar to MT7531 as well =
as four
   Gigabit Ethernet PHYs. The switch registers are directly mapped into t=
he SoC's
-  memory map rather than using MDIO. The switch got an internally connec=
ted 10G
+  memory map rather than using MDIO. The switch has an internally connec=
ted 10G
   CPU port and 4 user ports connected to the built-in Gigabit Ethernet P=
HYs.
=20
-  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/1=
00 PHYs
+  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs have 10/100 =
PHYs
   and the switch registers are directly mapped into SoC's memory map rat=
her than
   using MDIO. The DSA driver currently doesn't support MT7620 variants.
=20
   There is only the standalone version of MT7531.
=20
-  Port 5 on MT7530 has got various ways of configuration:
+  Port 5 on MT7530 supports various configurations:
=20
     - Port 5 can be used as a CPU port.
=20
--=20
2.45.2


