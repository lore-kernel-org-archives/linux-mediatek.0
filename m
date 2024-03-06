Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6954CC5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 20:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpSsgGhBR4FyYxEHKoURzmKgm4LkFv8WoyeKAG8oCW8=; b=d40bsmkcp+gVs8RY1p6g2wKuce
	f1vdfWlMhaiJJ9D5VMFOL46ssGszE+lSyfXmlF5tOORW5WYIBIdkWgm12n6fFyat3ktcBzMnnLG49
	JK6kHzvIiMEubjciqCv94QjGc2kQv+AvmkyHYApjOkQYqhpGlOnvmxh1OCbU4jXIfZD9V7kVwWcqL
	zLJVaLT7sL6yV2zNs5s8/19+E7NJAQJf/9DxXsV85OVChhUdQDW2RfxKHPM+ddxDnhUQg7YbAqCQX
	2ahwEGqOiIWrbpjv6FO8MnvczXvElIj+M9sBWCu46c5P2Fo1ytRbWX9yk34h9UyBXxKZlhZBSuqnL
	Z6+zVrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxcE-00000001m2b-474m;
	Wed, 06 Mar 2024 20:11:50 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxcB-00000001m1J-197q;
	Wed, 06 Mar 2024 20:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc
	:content-type; bh=VpSsgGhBR4FyYxEHKoURzmKgm4LkFv8WoyeKAG8oCW8=; b=UsPsRiTvYIn
	ONbx1DqucGDf7Chz692IAbQp8V9Bl519eP2W4rVQVL0a7P2kiYUdeaC29BCW3kCxo+y/AFMp72mMq
	K+LlWXSJziXzZg1hFqVNtSep8PQAeYNg+vAyvqU1LTbA8AXtRmPd/+jgEmGVmuVthbXCN5+/l8nYo
	w87JnPyZOMXid3mB71NXsD6awQZKkNOwdL6JzFhyemSW6u4P2/Sye88T1eYD/Y8yOeBbyKxH79RIf
	q9jhvFddz0waPbWqHr4ynUn+6BPApoV5ztTpUdH320fTntyURH8QCp1jw1sonrE15sEBBuR2pq/h9
	BceqntpkkD6+EUXNInookCA==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rhxc4-0088az-M9; Wed, 06 Mar 2024 22:11:41 +0200
Received: from [41.144.0.96] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rhxc3-0005PR-QU; Wed, 06 Mar 2024 22:11:40 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Swartz <justin.swartz@risingedge.co.za>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] mips: dts: ralink: mt7621: add serial1 and serial2 nodes
Date: Wed,  6 Mar 2024 22:10:44 +0200
Message-Id: <20240306201045.1475-2-justin.swartz@risingedge.co.za>
In-Reply-To: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
References: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00758473274125)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8C6SK0vybqcYHmQCnhqJHcPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNnAWQx3FS11bhwUa9HCIwKB+TroNcRY33
 oNmH4nRQzHQazgY7lmveanvOdQzf6IMJ3345q/s6ySNrGnXycmhg3BNVdpEcm8g/6PJN7TvsruKC
 n3oZFShGuGVczvnnMQuyLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMECwtAGwNe0eOvXAXd2nqZdzIUka7Uq615Mik1qzcz30/jNv+A51L2swh0gYW0eVWShle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVK0T+c9pM0FteOLwuqFxkZtxbXpCgbiKBsA+Ddi6m
 awd1jemntr2PrMOTF1fDnHo5A9JQxMw0XtBqT5kbx7zuprmKeJENT1oiQUtfU17WEZPRHu1+r6ov
 Q/IKaojN7gdb+Glhdb8DP7Iz3Z0Qa+VGiF/lfNRtaK1t4SnssY938wKgOC3c9GkW+OmRHU05XGuW
 g+VcQ3bZb7F7k2CvWvw8dbdRONqsj33t0is+SdoOwsk2luZvMBiCgALm/XUigxDlb5qgpERsDkCX
 BgcGBwKlYailDNhe7w2QIanZ/NegoJ79AXUnIiEEoyCaZXMG8LAkbJoO2tY/Mg5ClXd30oBm8U++
 JlmpaolH3tK93iPfP9/LMV7rNH+khni30uZSXlsmCOj6IY0UX9+ySU70SxRmHXLYM3A6BXfvel8O
 EFDbU51Q2S43vcWL3lM20b9wQESc+PquLiZOpxiedGbqX4nzL9MgCv99rrli2UQdOGeuQqV2IVXB
 o/3R5VqqcOmERbjE+D5FzT0EaduWMjGSdmMR5Ch1HY0a4RW7JP9zvdSGB9tIDxuFtg36jUhUk8/b
 P2/Mw1j9lmNQqiIAMR1SEszVdPY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_121147_458433_93584517 
X-CRM114-Status: UNSURE (   7.89  )
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

Add serial1 and serial2 nodes to define the existence of
UART1 and UART2.

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index dca415fdd..2069249c8 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -128,6 +128,44 @@ serial0: serial@c00 {
 			pinctrl-0 = <&uart1_pins>;
 		};
 
+		serial1: serial@d00 {
+			status = "disabled";
+
+			compatible = "ns16550a";
+			reg = <0xd00 0x100>;
+
+			clocks = <&sysc MT7621_CLK_UART2>;
+
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;
+
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_pins>;
+		};
+
+		serial2: serial@e00 {
+			status = "disabled";
+
+			compatible = "ns16550a";
+			reg = <0xe00 0x100>;
+
+			clocks = <&sysc MT7621_CLK_UART3>;
+
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 28 IRQ_TYPE_LEVEL_HIGH>;
+
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_pins>;
+		};
+
 		spi0: spi@b00 {
 			status = "disabled";
 
-- 


