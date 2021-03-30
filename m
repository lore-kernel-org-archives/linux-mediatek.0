Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FB8C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:32:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC25D6192F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 05:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC25D6192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0iAz+PeFEWbL0D62K2MVeHvC+P3A5EQ7SGZHIW6G+fI=; b=AR3qpVACA7FOk9SH4UAZFuXTs
	o43+7Yl3W2Vx0HVkeEEhQJg770YSlbMeTa6qJe/sJ7+4GZ7gDMRyWlxpdZwt0zrBL22Kx/9ZXGmyw
	OHMcxbGhrn+4qT65IfvPwhQS1GB52Qk2rYYvf9UqhYisVOqcNCJT6dkEJi+bGFnvW+HQyLTMNS98+
	b6K49qLd1ieWAnuy65qXTJ3iyl8pYYqU5e97G4Lv4X+MOafRA0Wtjpyxp0CuEmY9NBrjgvrNrAdGd
	DEZfZ78A35THXrIQzj700HAz2NOq5GzbjxW2HQuwQa91d8iwBYF6h/2Ns0xLjBHcDnmBfXE7Le65p
	KJmdpnS/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6zR-002kwk-Eq; Tue, 30 Mar 2021 05:32:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6zM-002kve-Ib; Tue, 30 Mar 2021 05:32:31 +0000
X-UUID: 16b66e5f46da48179b32f3c21ea69396-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4j+N6fF5Ir/xrGk8HcaSsDxfJ+nSFHgpJo+5rYLfCsA=; 
 b=H4EsSFdAZcW0pBj0uDpt7rEVeNAo0QaNkcHZTrPRYJhbWlgagi9OyVVdIziPNXDfSNNMqRe64mX5kcWT/3C6Qh4ZZe+CD+EENkBt/1SmwkJffzqPmp53+KrF5yxZDT3I2FP/EDgO1gszlNWLqnnWSNImStsrXd0nCKLuNsJmIkE=;
X-UUID: 16b66e5f46da48179b32f3c21ea69396-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <pk.chi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1704972201; Mon, 29 Mar 2021 21:32:22 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 22:23:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 13:23:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Mar 2021 13:23:23 +0800
From: Po-Kai Chi <pk.chi@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
 <loda.chou@mediatek.com>, Po-Kai Chi <pk.chi@mediatek.com>
Subject: [PATCH v1 3/4] arm64: dts: add DRAMC node for MT6779
Date: Tue, 30 Mar 2021 13:22:10 +0800
Message-ID: <1617081731-7408-4-git-send-email-pk.chi@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
References: <1617081731-7408-1-git-send-email-pk.chi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_063229_381104_02CFA1B4 
X-CRM114-Status: GOOD (  10.66  )
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
index 164f5cb..9a556ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
@@ -29,3 +29,12 @@
 &uart0 {
 	status = "okay";
 };
+
+&dramc {
+	dram_type = <0>;
+	channel_cnt = <2>;
+	rank_cnt = <2>;
+	rank_size = <0x0 0x0>;
+	mr_cnt = <1>;
+	mr = <0x5 0xff>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf514..332d48d 100644
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
+			support_channel_cnt = <2>;
+			freq_cnt = <6>;
+			freq_step = <3718 3733>,
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
