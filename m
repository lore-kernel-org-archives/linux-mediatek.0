Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB479C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWANT87NwtljX4mpWHQe9oFTWeUM/+2Oh/KJEvsYct4=; b=SuyNo2Q4boFxlQ
	MxXWZ5IhE0btYh01tZXgC0VQ3srR3SKwD/8I+bw6wV9xPzlh0eTP2C03uIuOI71iTdyNzzR7tD0ip
	PtewC6ff1woqT9T0T7RWVxmyxELpNUtjKC3OoMNUOerqkq7UBJhcerCgGPVzKpuauNheLofJmVNz2
	xMjpQbe1NghBYfjaFB5aIIYjy+wR68PuNSSUT7tt1wwS1mvAyiznrGjBNS3hJoMr8obWky1IDKJij
	SmIEAwrLzUndRLRambBTORY4m394YFDpAMvH3cd5r8Od1u4s7I5w2HiznTOYNFVYziCnFaWanoCAM
	fxFW6CMJW+xbiCBuykUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhamK-00EUwl-Tr; Thu, 21 Apr 2022 17:39:40 +0000
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net ([173.201.192.239])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhamI-00EUve-5T
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 17:39:39 +0000
Received: from localhost.localdomain ([209.234.248.132])
 by :SMTPAUTH: with ESMTPSA
 id ham9nkETPic8fhamAnljNp; Thu, 21 Apr 2022 10:39:32 -0700
X-CMAE-Analysis: v=2.4 cv=Q+QXX66a c=1 sm=1 tr=0 ts=626196d4
 a=QYjdx1n8fnJJ/8JFsBbjTg==:117 a=QYjdx1n8fnJJ/8JFsBbjTg==:17 a=NEAV23lmAAAA:8
 a=_twTT5zqAAAA:8 a=6R0Kyn_f9nWU-igJ6UUA:9 a=ILoXdGDbYT3DTB7Z0gVI:22
X-SECURESERVER-ACCT: dhu@hodcarrier.org
From: Du Huanpeng <dhu@hodcarrier.org>
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Du Huanpeng <dhu@hodcarrier.org>
Subject: [PATCH] mips: dts: ralink: mt7620a: rename nodes to generic names
Date: Fri, 22 Apr 2022 01:39:28 +0800
Message-Id: <20220421173928.61467-1-dhu@hodcarrier.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNdzv5jfK0g153WJIHj7b/tW+my450a5GCAClM5BMyMirAAl9evuviFEomChLrbZ9pQ2US6SzFvOAdYtcZgEoKG46y8McajnjV6wPAA6XLFGkdD1YL6+
 MnEhfsrJyuHnw4AEl83jDHTL2vCcpQmgMj41NsKQjMm7vZ2cP0w6DupGwbbmIdXizbdz2U9hjswjU/ABszjKrf6CXsyMTORkQeSroVu3Q8CWNYj6n0ZlLea/
 qDsTHyoon65jUfuAH4Gxke073BgwMGgYjaz5PIdIXjpH50LjRFDlFsCBuyL3aSzELsTrrBt7nz4/OQjLaxeawvb4H8BS9mWg125lO2ecwMz7IKXWEMRaQ/hV
 vlonII2bpS70THRM3Hw7Mty4YUaEdrwSEkovpe59KIMvKsaO0ktVPhjWkeVOGLFqgE1KHRpLQByWCTUYie2JXDo6Cffm4g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_103938_259217_B27BA605 
X-CRM114-Status: UNSURE (   7.94  )
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

The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model.

- interrupt-controller
- syscon
- memory-controller
- serial

devicetree-specification-v0.3.pdf
link: https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3

Signed-off-by: Du Huanpeng <dhu@hodcarrier.org>
---
 arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
index 1f6e5320f486..b9cbde603778 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -10,7 +10,7 @@ cpu@0 {
 		};
 	};
 
-	cpuintc: cpuintc {
+	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
@@ -25,12 +25,12 @@ palmbus@10000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc@0 {
+		syscon@0 {
 			compatible = "ralink,mt7620a-sysc";
 			reg = <0x0 0x100>;
 		};
 
-		intc: intc@200 {
+		intc: interrupt-controller@200 {
 			compatible = "ralink,mt7620a-intc", "ralink,rt2880-intc";
 			reg = <0x200 0x100>;
 
@@ -41,12 +41,12 @@ intc: intc@200 {
 			interrupts = <2>;
 		};
 
-		memc@300 {
+		memory-controller@300 {
 			compatible = "ralink,mt7620a-memc", "ralink,rt3050-memc";
 			reg = <0x300 0x100>;
 		};
 
-		uartlite@c00 {
+		uartlite: serial@c00 {
 			compatible = "ralink,mt7620a-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
