Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291D7C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADFF16128C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADFF16128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=80FataZAFImkDB15wCqUoQKXgVWmrskM9292jnk4FVk=; b=lD3M0OEnqE7JCNiFv+PCBG0Vq
	iZdG+mEtyLgwWcNxhP8pu5q0TPuSggc4qy7vPZshwcO++vzfZsLrF/fagXjk6F0wnjjFHXIcOZcvk
	eHkT+Tpi4Aa4J2bnCkLQ5N444FWC9plNfDj81qp/1eax3YqD+lu3bczLM5rpEoEK6roYLRCRqMg9i
	jfHOjjKR/EDyRL/jtR4shb6y6Vv7sdazexcX5tcSC4c3gyKDrjW5fWlW27yPHqSOu+enGpzSQxzP4
	tKiRb4tNnrg9ck5mN93GGha213CQeKNYXMlN0t0CKiwMcU3TEBJhdr4ldi/Jz5dwQFVNTNGc7mOAv
	DPnqLH5Ng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVv7C-006bma-Is; Mon, 12 Apr 2021 11:52:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVv6i-006bin-Tc; Mon, 12 Apr 2021 11:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+1HpqL5RFRPiL9LjYAn4wWTVR8knBGYm3+fh7zyH20E=; b=dEw3U0oI6pHT0y8tBTxI3c//Bz
 IpWbLcbGZvv4Lq7qzglIwqGfH9hWExK5d+V2+NHGFSSf+Oa+qUUJW93X0RI1b5YrQncC1BlGnqSTK
 6P04QCqcg4yVG+VhE8Cxrpfn6pLgaY3kE+yI26h8TXe1orRCEKpYmycapJPM2kPIFUJ+jtL47Ks8Y
 vLi3gMbmAWMKjtSLwFXmPb1bdoRZ76nRBct3iU/S1XOwAjXRbQif9M0toXKM02VFdLHlClMReN8mm
 cTe81kAh3jZrCaAvIMAmt2B9U1tw7wZQv9oJKgdZFACaM1Gc1SFxDg8vHXZfi9C5qHsCu3KK3DZA4
 2/cwEyHg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVv6e-006C4X-Jf; Mon, 12 Apr 2021 11:51:55 +0000
X-UUID: b7d911b79b614541a03aa1a71ff7b855-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+1HpqL5RFRPiL9LjYAn4wWTVR8knBGYm3+fh7zyH20E=; 
 b=F+STF0m2PjEl1KHJzFS1OaGYcXIW7MkqioCqr0J+fwLOdoL/CK1B531te1AX8dqly3QqywjKsaO8qtdKOANmDh7tXg1/B3vwbg3fmdCFruFQAgw3c8IQgSpL3wr8Mwrkc2zCxJfVXVjAu5OEJBML4x8P79gL8QpxEgO9t2Exgd0=;
X-UUID: b7d911b79b614541a03aa1a71ff7b855-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 319665940; Mon, 12 Apr 2021 04:51:48 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:51:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:51:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:51:40 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v4, 2/3] arm64: dts: mt8192: add gce node
Date: Mon, 12 Apr 2021 19:51:29 +0800
Message-ID: <1618228290-18413-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618228290-18413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618228290-18413-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7288CDD4AA948AC0AD9C3381E31145A6D318BC945581D4339BD225C3B4EE22E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_045153_831450_F80D0FEA 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add gce node for mt8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138..1afa6ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gce/mt8192-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
@@ -291,6 +292,15 @@
 			clock-names = "clk13m";
 		};
 
+		gce: mailbox@10228000 {
+			compatible = "mediatek,mt8192-gce";
+			reg = <0 0x10228000 0 0x4000>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <3>;
+			clocks = <&infracfg CLK_INFRA_GCE>;
+			clock-names = "gce";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt8192-uart",
 				     "mediatek,mt6577-uart";
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
