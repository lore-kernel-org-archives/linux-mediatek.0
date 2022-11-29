Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FED7C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wuTnTkxy7g0Gw/TD9R0MRukx2llcST0fSdcHE1S5IGA=; b=M8WfIBBYLzBu3heXiheWD4y/Uz
	WIOIoR1GHSWDt1d37WzzU9t51AIUbD8jMP4YI2+ERO+cx+TageDRt8sMP7BDB3cWEVSjdFeT0+D3F
	sFHcu2PPSv4BG8kiS67myeX4G6D5iU1ZohiGrNsX2eMKDtYjmIGcVz6Ud8yO9NV/dZDTu4VauWTwp
	B6jtq4p3VgKsKCE65PyV0HubKorplMVEl0DbmnIdA0mE+U6XkpIH5BN8r2RSBK9T8EBwslcODuvql
	SLhETswun7cjPoPR5Y4jh2HBgeRr3u6F8xlMJKgs10hoaWm7T/A9i44p+9X4V2tXtKy/zn4WCFEir
	ajxQoEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozycO-008RK4-5U; Tue, 29 Nov 2022 11:17:40 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozycC-008RIU-S0; Tue, 29 Nov 2022 11:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669720643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NzHdiQtyKF/lIeeCj234BMnDVnChfQiZ4TMMUtRxWQ/hyZoV5gAl27aNoWKxRwnbgyQ/fCQzVgT0C6PQP97Yr8TUS7luOlo+GHN5u0s+6f5DSQyqi6uQ+AVFLFGvQOHqh2ZAG/0m7uS06gSfk1UrvbaE+3PxK2nr5HzEMHnIc04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669720643; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=wuTnTkxy7g0Gw/TD9R0MRukx2llcST0fSdcHE1S5IGA=; 
	b=e8S+Dgn1tw8kEdp9CuAn04PRXtg3P1tIDdpSLxD11tZczlxy3m4A+/uUKIc0Jb+G6VEHTrxzHCm51QJ46x3YrSZlgDhU/KzLrM2rINd/TGcmj+JXPIv5OcGbfx6L8iB6/1Uym9hhGT1gAzAYS7k6AcvfkoIVXOX8l7FhDYr0mY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669720643;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=wuTnTkxy7g0Gw/TD9R0MRukx2llcST0fSdcHE1S5IGA=;
	b=g0PWVxHbZb0J/8V1o4Y1dd0u14cyZz5T6Fd5s7vZ9ILfCAcTajdu+7WZCEeiOYCv
	mxMqzgbP0VuYoAPw7NFgjCJ7tQYp191JpmEI5rcl6bVAG/ZIWXPHNDerQi1on+uTvee
	thMd9BQuaHfy734PYvJOAETCTQuQFMZwd+AJ4UHs=
Received: from arinc9-Xeront.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669720640742618.9209820853164; Tue, 29 Nov 2022 03:17:20 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH] mips: ralink: mt7621: change DSA port labels to generic naming
Date: Tue, 29 Nov 2022 14:17:11 +0300
Message-Id: <20221129111711.2739-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_031728_974965_100FBFF7 
X-CRM114-Status: UNSURE (   9.71  )
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

Change the labels of the DSA ports to generic naming for switch ports.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index f3f4c1f26e01..1a601d7c73d7 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -357,31 +357,31 @@ ports {
 					port@0 {
 						status = "disabled";
 						reg = <0>;
-						label = "lan0";
+						label = "swp0";
 					};
 
 					port@1 {
 						status = "disabled";
 						reg = <1>;
-						label = "lan1";
+						label = "swp1";
 					};
 
 					port@2 {
 						status = "disabled";
 						reg = <2>;
-						label = "lan2";
+						label = "swp2";
 					};
 
 					port@3 {
 						status = "disabled";
 						reg = <3>;
-						label = "lan3";
+						label = "swp3";
 					};
 
 					port@4 {
 						status = "disabled";
 						reg = <4>;
-						label = "lan4";
+						label = "swp4";
 					};
 
 					port@6 {
-- 
2.34.1


