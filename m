Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QASoh5INw/e/ywU1J9l11/zDTMHL3dTJ40bS7CA8SsY=; b=Wm45rxGd6cooy/
	DQ/X5FNd1nIBKz/c33z0mPEHM3za+47A/nFYUR6Rc6362rKF9mzBBNvQTnY/qY8ZjGncHW5gTSKT/
	utVi+4qGirVDc/IGYqOJxUj5P4vVauSNkNBBY6Sl5xeA0TTZWXxJV60tFyzyzd2uRUQg1V1YAQozD
	5CZHvbOFRfn/eVLj2Tj0KmehImgPuqrKi70zq+KSI37IHO3yfYu8IejSFwsjnzJB+m5abrF76/0sP
	HI7vU1igDfVfIhbm8wUlfn/6V7J5V0UKFDUj/6eoiQRwJp0JUbNCo56rXRd7AIQSBizvB+FN7mG/U
	aYf87Zg2oIr0qcA6SysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFsv-00DSIg-Nw; Thu, 12 May 2022 20:58:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrB-00DRB7-P9; Thu, 12 May 2022 20:56:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 080321F4586B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388980;
 bh=HKwC3lI9favjFgNO9EQQwuJbOivLz3FL/dhuFZiFRJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F0CR1JuByPufcykXJw1jufsCrJyWEadGstXfOtkquInYmZQ13OFnq1b5IxJDBKI8A
 mdmBruxw590ZGfvYRRFGkgcIRTRf3+sSJM1E72pi35RDvD8tEjyKPBT+xsSD5v9QAK
 9RY/027juUVLXD13up1eoOVPU4vqIaNrs4iwMzwXa6b0D10sq8UJ3cbaskH5iGXaBq
 JwePtdYZOZ0Z1TJ0wg6X5TgRb6OFlAYrsBZ44/QL787S5rHrCkolNikZDQxHq92JK+
 +DDufalGUIzo/6du149JDsXoZVtkOenPNuEoC3j0H2r3lv9mO9mj3Ui0+2nh4ixGeB
 EDG115OleyZRA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/16] arm64: dts: mediatek: asurada: Add system-wide power
 supplies
Date: Thu, 12 May 2022 16:55:51 -0400
Message-Id: <20220512205602.158273-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135622_057952_7A2E4533 
X-CRM114-Status: UNSURE (   9.62  )
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

QWRkIHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzIHByZXNlbnQgb24gYWxsIG9mIHRoZSBib2Fy
ZHMgaW4gdGhlCkFzdXJhZGEgZmFtaWx5LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4KVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVtLm9yZz4KCi0tLQoKQ2hh
bmdlcyBpbiB2MzoKLSBSZW5hbWVkIG5vZGVzIHRvIGJlIGdlbmVyaWMKCiAuLi4vYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCA2NCArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQppbmRleCBlMTA2MzYyOTg2MzkuLmNh
NTVkZDA5NWU4MCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
OTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LWFzdXJhZGEuZHRzaQpAQCAtMTksNiArMTksNzAgQEAgbWVtb3J5QDQwMDAwMDAwIHsKIAkJZGV2
aWNlX3R5cGUgPSAibWVtb3J5IjsKIAkJcmVnID0gPDAgMHg0MDAwMDAwMCAwIDB4ODAwMDAwMDA+
OwogCX07CisKKwkvKiBzeXN0ZW0gd2lkZSBMRE8gMS44ViBwb3dlciByYWlsICovCisJcHAxODAw
X2xkb19nOiByZWd1bGF0b3ItMXY4LWcgeworCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhl
ZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gInBwMTgwMF9sZG9fZyI7CisJCXJlZ3VsYXRvci1hbHdh
eXMtb247CisJCXJlZ3VsYXRvci1ib290LW9uOworCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDwxODAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CisJCXZp
bi1zdXBwbHkgPSA8JnBwMzMwMF9nPjsKKwl9OworCisJLyogc3lzdGVtIHdpZGUgc3dpdGNoaW5n
IDMuM1YgcG93ZXIgcmFpbCAqLworCXBwMzMwMF9nOiByZWd1bGF0b3ItM3YzLWcgeworCQljb21w
YXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gInBwMzMwMF9n
IjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CisJCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsKKwkJdmluLXN1cHBseSA9IDwmcHB2YXJfc3lzPjsKKwl9OworCisJLyog
c3lzdGVtIHdpZGUgTERPIDMuM1YgcG93ZXIgcmFpbCAqLworCXBwMzMwMF9sZG9fejogcmVndWxh
dG9yLTN2My16IHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0
b3ItbmFtZSA9ICJwcDMzMDBfbGRvX3oiOworCQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCQlyZWd1
bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJ
CXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQl2aW4tc3VwcGx5ID0gPCZw
cHZhcl9zeXM+OworCX07CisKKwkvKiBzZXBhcmF0ZWx5IHN3aXRjaGVkIDMuM1YgcG93ZXIgcmFp
bCAqLworCXBwMzMwMF91OiByZWd1bGF0b3ItM3YzLXUgeworCQljb21wYXRpYmxlID0gInJlZ3Vs
YXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gInBwMzMwMF91IjsKKwkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CisJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDMzMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsK
KwkJLyogZW5hYmxlIHBpbiB3aXJlZCB0byBHUElPIGNvbnRyb2xsZWQgYnkgRUMgKi8KKwkJdmlu
LXN1cHBseSA9IDwmcHAzMzAwX2c+OworCX07CisKKwkvKiBzeXN0ZW0gd2lkZSBzd2l0Y2hpbmcg
NS4wViBwb3dlciByYWlsICovCisJcHA1MDAwX2E6IHJlZ3VsYXRvci01djAtYSB7CisJCWNvbXBh
dGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAicHA1MDAwX2Ei
OworCQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDUwMDAwMDA+OworCQl2aW4tc3VwcGx5ID0gPCZwcHZhcl9zeXM+OworCX07CisKKwkvKiBz
eXN0ZW0gd2lkZSBzZW1pLXJlZ3VsYXRlZCBwb3dlciByYWlsIGZyb20gYmF0dGVyeSBvciBVU0Ig
Ki8KKwlwcHZhcl9zeXM6IHJlZ3VsYXRvci12YXItc3lzIHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1
bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJwcHZhcl9zeXMiOworCQlyZWd1bGF0
b3ItYWx3YXlzLW9uOworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwl9OwogfTsKIAogJnBpbyB7Ci0t
IAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
