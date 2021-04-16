Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26794C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:53:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C231610E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C231610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vj7k3GZFr88qzxTeo8IQB111BCjbbCmh73R3XRJx+i8=; b=Le/WYq4N6pJId8OXEoHFy3udH
	puNdEeNJ7uAvEzsYFgsXXxyQTaZTe7rDiig77++7Y9dtW1lHWGTkGhiPSiy7WirtcpTYgX3G2HT2L
	hoBSrpp109aoB4P1giMxwQCyrawKB86/f2gtl1PZa4x6fbrnljpG5o4jnjv2m19nVEjqVkMq37yuL
	qKXJYtE3JyfsmDPFFS8YonVkCO/PNqsinSyJJi8VHHHf9dCUaEFwbzK97ls5NjkaVTFgnL1NVWIpn
	C3Le2LhYIb/ffymAVeuzip1XTM2Ye2Bdim8qns+HtsAirdkjjuRQ5av4kmGAjcOuaIRn7S8dRvBj2
	d4Bv5Z8CQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL9l-001cx6-5F; Fri, 16 Apr 2021 09:52:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKzk-001aQV-C4
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 09:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Hy95d7HVkEITJjeYMQ/9TEtbJgMH0jMHwQbDF9iu4EU=; b=fXYx/c4za7CASn4uD7+VeDBCj6
 pIX8yJBIR7P8nxWxsnwEKzKKB4pStESkzAqJp819CzzeSJWy4lgdUGTD2J1cztE36kY5Woh5kTDvM
 u7jWbYZP6RcruyM/tNyXNfclLUC3+k/IgNaqsp5aPRuP5+IweVhGZaxQL7lQ2F5WZx2dxy8V6qb1d
 pZ3dJ/l9mzFCDkoOKdWMMvsJphEmkjhImLUEZk+sm1BisTbA8RSx4aL5tKr6lBglEoRHeMfCj1R6m
 TqS4prDnl90mlTOayUmOAYvGBOqoAFWCExY+ezjt/8bQLPAbYbPyI+2AxdTgMpO6akM4F+cFOfn0J
 HCH0CqsQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKzh-009FaH-Mk
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 09:42:35 +0000
X-UUID: c49bb9902d424abe8408bf474a0945a5-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hy95d7HVkEITJjeYMQ/9TEtbJgMH0jMHwQbDF9iu4EU=; 
 b=GNPXMwobhWjGZk97/IzlkhAwoq0p/Myl8xqs1HKqDz/7mvSGCgL2THxpieBKNLxUPefIaWxlDUFFLTPfcXljY2E00sp5JqQ5Wje41AxpYGpFcTGbkVzcr+fwidQR/HXEXWCtfa5wnxv+Kj6S7FTdZMYFFEpAza+1e4xIYjeneLY=;
X-UUID: c49bb9902d424abe8408bf474a0945a5-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1611854497; Fri, 16 Apr 2021 02:42:28 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 02:32:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 17:32:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 16 Apr 2021 17:32:24 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>, CC Hwang
 <cc.hwang@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v2 3/4] arm64: dts: add DRAMC node for MT6779
Date: Fri, 16 Apr 2021 17:32:17 +0800
Message-ID: <1618565538-6972-4-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_024233_769445_A94FFFDD 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the DRAMC node for the DRAMC kernel driver.

Properties are divided into three categories:

- Platform DTS:
    MediaTek DRAMC platform common part.

- Project DTS:
    Runtime filled in by bootloader according to the board
    hardware configuration.

- Driver level:
    Hardware-specific register settings, encapsulated as
    compatible data for better DTS compatibility.

Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts |    9 +++++++++
 arch/arm64/boot/dts/mediatek/mt6779.dtsi    |   18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
index 164f5cb..5d2dde7 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
@@ -29,3 +29,12 @@
 &uart0 {
 	status = "okay";
 };
+
+&dramc {
+	mediatek,dram-type = <0>;
+	mediatek,channel-cnt = <2>;
+	mediatek,rank-cnt = <2>;
+	mediatek,rank-size = <0x0 0x0>;
+	mediatek,mr-cnt = <1>;
+	mediatek,mr = <0x5 0xff>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf514..28492a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -206,6 +206,24 @@
 			clock-names = "devapc-infra-clock";
 		};
 
+		dramc: dramc@10230000 {
+			compatible = "mediatek,mt6779-dramc";
+			reg = <0 0x10230000 0 0x2000>, /* DRAMC AO CHA */
+				<0 0x10240000 0 0x2000>, /* DRAMC AO CHB */
+				<0 0x10234000 0 0x1000>, /* DRAMC NAO CHA */
+				<0 0x10244000 0 0x1000>, /* DRAMC NAO CHB */
+				<0 0x10238000 0 0x2000>, /* DDRPHY AO CHA */
+				<0 0x10248000 0 0x2000>; /* DDRPHY AO CHB */
+			mediatek,support-channel-cnt = <2>;
+			mediatek,freq-cnt = <6>;
+			mediatek,freq-step = <3718 3733>,
+				<3094 3200>,
+				<2392 2400>,
+				<1534 1600>,
+				<1196 1200>,
+				<754 800>;
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt6779-uart",
 				     "mediatek,mt6577-uart";
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
