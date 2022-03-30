Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74620C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8662+v3d9iqLsaAA5Xk3f46+J0oLKguBqAi37Gs/us=; b=XDgqJ01vkc1BbQ
	v5HOwkHgDrgOM5IAKtI6yZgtr0bGeBq0u8wxRY3gnRq7gSMN8dOP0yAIPmM03JFfjExhfuTkKhh1l
	VpI3KtLniD9eCBoLCHWZJXIEC9+/IM0vyqrkeoZxN2u94R+UNGR8n7yZEIjiBzTH49dUY2NRigtVw
	RnvSg0kOaIytMy5j4k6ZOHpmeZRx/c36CxkK5W1ynIxqKAzaJJRpwcs1bTpaNiLlvDIE786Qrhfav
	nZuiFD4uYnUZ9oTkH68eUPW0N7e6dIamCbJKheel3FbpZOs2Zr6/1kBQiPbxheO91fKP3TtiTk+/n
	Xovcrqp8Yjr77rCYJnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZYh1-00G9bh-86; Wed, 30 Mar 2022 13:48:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZYgd-00G9UP-6P; Wed, 30 Mar 2022 13:48:36 +0000
X-UUID: a64f3e9507934666b72d35461b28afa2-20220330
X-UUID: a64f3e9507934666b72d35461b28afa2-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1246680014; Wed, 30 Mar 2022 06:48:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 06:38:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 30 Mar 2022 21:38:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 21:38:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 1/4] arm64: dts: mt8192: Add PCIe node
Date: Wed, 30 Mar 2022 21:38:13 +0800
Message-ID: <20220330133816.30806-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_064835_253285_E0836EF0 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QWRkIFBDSWUgbm9kZSBmb3IgbXQ4MTkyIFNvQy4KClNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENo
ZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBG
LiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaQppbmRleCA1NzlhYmJmNDQ4OGUuLjY5ZThkMTkzNGQ1MyAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQorKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCkBAIC03MTYsNiArNzE2LDQx
IEBACiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCisJCXBjaWU6IHBjaWVAMTEyMzAw
MDAgeworCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItcGNpZSI7CisJCQlkZXZpY2Vf
dHlwZSA9ICJwY2kiOworCQkJcmVnID0gPDAgMHgxMTIzMDAwMCAwIDB4MjAwMD47CisJCQlyZWct
bmFtZXMgPSAicGNpZS1tYWMiOworCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47CisJCQkjc2l6ZS1j
ZWxscyA9IDwyPjsKKwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BDSUVfUExfUF8y
NTBNPiwKKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9UTF8yNk0+LAorCQkJCSA8Jmlu
ZnJhY2ZnIENMS19JTkZSQV9QQ0lFX1RMXzk2TT4sCisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJB
X1BDSUVfVExfMzJLPiwKKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUENJRV9QRVJJXzI2TT4s
CisJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BDSUVfVE9QX0hfMTMzTT47CisJCQljbG9jay1u
YW1lcyA9ICJwbF8yNTBtIiwgInRsXzI2bSIsICJ0bF85Nm0iLAorCQkJCSAgICAgICJ0bF8zMmsi
LCAicGVyaV8yNm0iLCAidG9wXzEzM20iOworCQkJYXNzaWduZWQtY2xvY2tzID0gPCZ0b3Bja2dl
biBDTEtfVE9QX1RMX1NFTD47CisJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dl
biBDTEtfVE9QX01BSU5QTExfRDZfRDQ+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1MSBJ
UlFfVFlQRV9MRVZFTF9ISUdIIDA+OworCQkJYnVzLXJhbmdlID0gPDB4MDAgMHhmZj47CisJCQly
YW5nZXMgPSA8MHg4MjAwMDAwMCAwIDB4MTIwMDAwMDAgMHgwIDB4MTIwMDAwMDAgMCAweDA4MDAw
MDA+LAorCQkJCSA8MHg4MTAwMDAwMCAwIDB4MTI4MDAwMDAgMHgwIDB4MTI4MDAwMDAgMCAweDA4
MDAwMDA+OworCQkJI2ludGVycnVwdC1jZWxscyA9IDwxPjsKKwkJCWludGVycnVwdC1tYXAtbWFz
ayA9IDwwIDAgMCA3PjsKKwkJCWludGVycnVwdC1tYXAgPSA8MCAwIDAgMSAmcGNpZV9pbnRjMCAw
PiwKKwkJCQkJPDAgMCAwIDIgJnBjaWVfaW50YzAgMT4sCisJCQkJCTwwIDAgMCAzICZwY2llX2lu
dGMwIDI+LAorCQkJCQk8MCAwIDAgNCAmcGNpZV9pbnRjMCAzPjsKKworCQkJcGNpZV9pbnRjMDog
aW50ZXJydXB0LWNvbnRyb2xsZXIgeworCQkJCWludGVycnVwdC1jb250cm9sbGVyOworCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDA+OworCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47CisJCQl9Owor
CQl9OworCiAJCW5vcl9mbGFzaDogc3BpQDExMjM0MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTkyLW5vciI7CiAJCQlyZWcgPSA8MCAweDExMjM0MDAwIDAgMHhlMD47Ci0tIAoy
LjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
