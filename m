Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F934C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRthrZMnNdjlh0CSLwbifN6jfZBfwVIbcu4KaSkpjvE=; b=4FNDCHY+YITwTs
	r52IWtIon/KHySi16znwRCy7jvYvYkTygr1tze2NxbK1mRm6hPk6YlPJZs2ChTaUsOvvUQHlw5lW9
	i7q8xwy4c8SgCF+oyLlkXOtFOT9501sDKrzyCapEBIFBaezFnPD7NZSjQjWlglzKEU4yXcnjF508q
	sKpE3sZv+qp2afA4Y/xKsu/ZH7qiRzqMyrsm8Xne9TkiUtuwt0Jtlo+MCarL+ZAnchxCpjQR/ojst
	JZzYnVf7w0kdzAwgdMSNp6P3niiKq4qtLjc0tivJOwXH6IvSEgIfkdxEKMyG2hem/LoaIYzeym33R
	Ip8ucZB4yaouC+gCtH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myyCM-00GEkK-PB; Sun, 19 Dec 2021 15:34:06 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myyCJ-00GEiT-JA; Sun, 19 Dec 2021 15:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=sspF05V7CZICI/IPjtaDGeRZrd1FYSuOUYo3Eh1tq5I=; 
 t=1639928043;x=1640533443; 
 b=K3/KyWifyxkf64ql2P7x7v5zIGxMlf4bJvX+v3EQXmfWIyaS8SAiitvYX2N5gEMntmWrk1xurj/neW1g2l0zagvhqwlVgnjPU0JxbqDF+Yum80JsppwDsO6DChXfa2RBAMy0+YQK7Kdh8Nj/2aqAR4xeQ9oOMday0ioCaT3CyHT0jE/k/AuHYuhYCI+YJZgw/BUfi1gmd9kTwxrxFk5ztKMdyyCmOeBfc16WHrYD0XivxFt31JIbiVXF9+mfoo+M9QDAU5K6xv5sBo/Jm0iICD5DAfLk1Fl/s7t95CWvcMDoR4SC92ykURbdk79HNW4t9AR67ziduprXZ6dvtdUPzQ==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1myyCE-0000Gy-3J; Sun, 19 Dec 2021 18:33:58 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxim Kutnij <gtk3@inbox.ru>
Subject: [PATCH 2/3] Add initial support for Prestigio PMT5008 3G tablet
Date: Sun, 19 Dec 2021 23:31:33 +0500
Message-Id: <20211219183134.3849-2-gtk3@inbox.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211219183134.3849-1-gtk3@inbox.ru>
References: <20211219183134.3849-1-gtk3@inbox.ru>
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B5397E24C93BDA67F88FBE458FE372A9945AE7C6AF368CC2182A05F5380850408E2C77D129F0B5C16304B23D06679737E5FBAADC99B392C1F5F520FB6CC348BD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE795306D5781316A8AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CF19945FAF91394A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D845F50ADDCC460C1AD304FF04C0A8E4D96F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC55D5BE2F85BDEC5FA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520140C956E756FBB7AC26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6D795DB135F84D771089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CFFD95778845B350B31DBFF92B5B027D87F496CBF847303B29C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF6EFF71F1B3C06F72699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F8A2DF183797A6A868A028D754E26ECE12AA7051C3A50D618188574968B9794164E85CE49EE79D661D7E09C32AA3244C27CA708908193D0041A148F766E49F32B4DF56057A86259FDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYItFUluOT4tU3Tu06atfVA==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D159C0F68C27BC24D23DECCF391034DD18F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073403_967433_8327D278 
X-CRM114-Status: GOOD (  10.01  )
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

Add initial support for Prestigio PMT5008 3G tablet

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 .../boot/dts/mt6582-prestigio-pmt5008-3g.dts  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts

diff --git a/arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts b/arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts
new file mode 100644
index 00000000000..6e7db2a9819
--- /dev/null
+++ b/arch/arm/boot/dts/mt6582-prestigio-pmt5008-3g.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021 Maxim Kutnij <gtk3@inbox.ru>
+ */
+
+/dts-v1/;
+#include "mt6582.dtsi"
+
+/ {
+	model = "Prestigio PMT5008 3G";
+	compatible = "prestigio,pmt5008-3g", "mediatek,mt6582";
+
+	aliases {
+		bootargs = "console=ttyS0,921600n8 earlyprintk";
+		serial0 = &uart0;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
