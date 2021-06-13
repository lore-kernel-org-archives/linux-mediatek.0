Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C7CC49360
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 11:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F1D611CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F1D611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bP4OM1vtz/u1iyhM5N0ymiRDexBEnXZNNbKzuQKuylk=; b=dxzaMJX8c4L3+i
	uNhGGlWv4VXIwuXQXOeaChmU8bJKdnN6/FTq/slmfKWOY6mI/Exw5Ug4Yw7aeYYtNt65Zz4soG9rk
	FnPS8qgUC2H00Q+NudZlyZ61F+vi3P0IZN8oagPu4qK89JfNpAIhnWl/Jxcr8CBPD8Om/nCdSDGr3
	nqnSTGsttz51ovqFTTfTH4h4Rf/uTlcot9poFRspQzTtvSllxqE5CPhMUKRsrZ7jL8IWCgpAK5dip
	OA5DUm1mVx+7P8+3nWAUmqI8MLRyuwyAkLNcmJJW3LQoytcttGXLXZ5f9ei6WKReD/xjLb1N8g/HM
	O38ECYfM4asYdv35dGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOlO-00ANnO-RP; Sun, 13 Jun 2021 11:58:50 +0000
Received: from mxout012.mail.hostpoint.ch ([2a00:d70:0:e::312])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOlM-00ANmQ-5B; Sun, 13 Jun 2021 11:58:49 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout012.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsOlF-0001z5-Sq; Sun, 13 Jun 2021 13:58:41 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 (helo=eleanor.home.reto-schneider.ch)
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsOlF-0008UX-Qz; Sun, 13 Jun 2021 13:58:41 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: net: mediatek: Support custom ifname
Date: Sun, 13 Jun 2021 13:58:18 +0200
Message-Id: <20210613115820.1525478-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_045848_234811_5465821C 
X-CRM114-Status: GOOD (  10.39  )
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

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

The (optional) label property allows to specify customized interfaces
names.

The motivation behind this change is to allow embedded devices to keep
their first switch port be named "eth0", even when switching to the DSA
architecture. In order to do so, it must be possible to name the MAC
interface differently from eth0.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
---

 Documentation/devicetree/bindings/net/mediatek-net.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 72d03e07cf7c..93e35f239a0a 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -51,6 +51,9 @@ Required properties:
 	is equal to 0 and the MAC uses fixed-link to connect
 	with internal switch such as MT7530.
 
+Optional properties:
+- label: Name of interface, defaults to ethX if missing
+
 Example:
 
 eth: ethernet@1b100000 {
@@ -76,6 +79,7 @@ eth: ethernet@1b100000 {
 		compatible = "mediatek,eth-mac";
 		reg = <0>;
 		phy-handle = <&phy0>;
+		label = "mac1";
 	};
 
 	gmac2: mac@1 {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
