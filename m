Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E975FECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NobuUIDGzyuidvw+6ptTtuOVjxh1cmrEHK3JsUmEAlI=; b=sKx+1bnNzyaN9/Xo/um+CSABu4
	nXuExZh71g3kve6MxiaN/c312hdEVFT1B42bfUB8aJ02vnK6gajn7uhS2PLWMUNA5i6hTBs2cuFk1
	z/QumBz+OMEGHJXVv3QuSgNSsfG36nEzJFpVobAt6zAxQ+27bBUsGPWyJYUjoyxPDU6JI9zU3W4hW
	2I+B5wnfjztact6sZGfIAnse+0ojc+yhiQk4FHO3WzLM3Htbt5L7I7jFR3R5200wk8dnUbuQH1ifz
	C3gGfWemRHvNxgoMNkGf73OrG/EyxtpQw5YOdex7YBqy0KT+n7DbTo0zEKQyuUJ03aJA+2/xLHNNJ
	UjVdEpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOUl-00E2Zp-J5; Wed, 14 Sep 2022 09:15:47 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBb-00Dl9S-Oi; Wed, 14 Sep 2022 08:56:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145739; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ltoEjcbZu+opUCeFag1Q3m7T+Wvgafb9HBaXi1x0kMcJXQCpqDkknwg/Sz+n4EDN5wBPEsYgwyiJtOuevJOU66maHNCz13IqUuQ+JDY9k3NfACIuZTkXDTatC1RzpRlpVvQobtJ/059fc1iMyKdTk832yVA1HwM2IKVc4oMoggQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145739; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NobuUIDGzyuidvw+6ptTtuOVjxh1cmrEHK3JsUmEAlI=; 
	b=D6YppVTMq1IKIFBBHO51zYCXPUDbmljIhtc+W+2ghJGl8pkjUgv+wE5s3Hjy8cPIBxA9p3WuObaZmRdPckABcjTYRWpadUxMMeet8PuSCymiOQFkt88lFFrBpmaeJcFlDJ5wqZ+mA7h9W2xtTmX+dKlEy8DJL48usAdJbWBubmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145739;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=NobuUIDGzyuidvw+6ptTtuOVjxh1cmrEHK3JsUmEAlI=;
	b=d9d6wRiqyFYSNwC13megxI0ulVgIr/OK5BuklH6+pELdxYqUZ6cw9DAjGb7ICG/i
	KDsGKbl2SDDvS3/ruCcef+IFCpyeZNAAfUUXadlJdi7ro2hwBxoxrjQT2So9ZKVLzB4
	+O+sE0g7VcVBW71Y3AaliQylY+wE21VxB7NIswYg=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145736632721.7554876765212; Wed, 14 Sep 2022 01:55:36 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 06/10] mips: dts: ralink: mt7621: remove interrupt-parent from switch node
Date: Wed, 14 Sep 2022 11:54:47 +0300
Message-Id: <20220914085451.11723-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015600_023506_07D25B14 
X-CRM114-Status: UNSURE (   9.35  )
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

The interrupt-parent property is inherited from the ethernet node as it's a
parent node of the switch node. Therefore, remove the unnecessary
interrupt-parent property from the switch node.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 9302bdc04510..e9203fec3fdf 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -346,7 +346,6 @@ switch0: switch@0 {
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
 				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
-- 
2.34.1


