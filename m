Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F86C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ytz3zd2XzWPu+nFAbpA/0laCkm3lri72QZtfgCT9tw=; b=Vj35bSplI2eZ94P6ZYUugOmh46
	ssLd/2fOxXUi48R2QS5ERAxbJT1JUE5NNkOY8hK5ng8mDTq7y8oDqxgeqwduzJAleDIS4Ysl1vFzn
	JYzq5HLWCMFZJv9q8RxZJjkGLzICYwyBjVvQKNKB+hCL1h1QLSuBoBiH4lYzSVbTwmG+tdjTxLnct
	tQEVRiH0i9BIMHKOQAAuuBZcfS4PAGWgQsnxX+K3spjCh5IoevtEw2+Xll8Md0k4xXAnYq5YysDOB
	BVlzxhGBXxwmZQMi8+RN82IN7bBlKfZW9Nz+1t2SzkjiTQ6wBvbe7fM/0g2cxjiADvw+mr0i1JB0v
	v9kaG4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah4F-005T9b-A5; Tue, 20 Sep 2022 17:29:55 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah25-005Rl8-57; Tue, 20 Sep 2022 17:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RJuyl7+w0Zfr4UcIJq1U2uiJbejf+/Q0e4JpiPfmnKJCeN3aTeX4+keTWjN0EuBY7nhFHrl37mmWBdA0vnRpjq0EaoPS93qSi3niR0Q2Ni5Xtrac3lrNL0XYXTuwCi1wT2t/aRcZgylESyOAwsdfUELoZaj4+bE/qfT8YZBAaDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694840; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+Ytz3zd2XzWPu+nFAbpA/0laCkm3lri72QZtfgCT9tw=; 
	b=RjAhd+7Indr44ljvFkRYw0ax7CRp7c/EJVa7ALdcFwhcKy7ejWPcP2RoNUKGj/getRny5XC/571/+sD89t40jJ67ijWnRA58mqpwc2p9IbKGVyn5a2VkKeXG+rrxG1yTfNDrEkaUMerg0shxz/tsU+HO5MPBGvKI8dUKea2lgIA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694840;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=+Ytz3zd2XzWPu+nFAbpA/0laCkm3lri72QZtfgCT9tw=;
	b=Rlzv1ewdb7UFgWR6QtVeyNLvW7RObvQeucq4FH24IEdHNsc/AJDtYlhkZB/8VUK0
	snWoAFWvu0a2ubEUp0pWbtWKXukyasYxauhU8ZzGK23mPX/2UDT+cvo9xV3fStYJIoX
	zJ/khEqz1yZ0cVl0KPms64JXLtb9bXv0N6oEnFIo=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663694839331119.58991385266972; Tue, 20 Sep 2022 10:27:19 -0700 (PDT)
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
Subject: [PATCH v4 net-next 07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
Date: Tue, 20 Sep 2022 20:25:53 +0300
Message-Id: <20220920172556.16557-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102741_451323_1DF9040A 
X-CRM114-Status: GOOD (  11.19  )
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

Change phy-mode of gmac1 to rgmii on mt7621.dtsi. Same code path is
followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index bcedb84e1618..edb7dd8b34da 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -333,7 +333,7 @@ gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
 			status = "disabled";
-			phy-mode = "rgmii-rxid";
+			phy-mode = "rgmii";
 		};
 
 		mdio: mdio-bus {
-- 
2.34.1


