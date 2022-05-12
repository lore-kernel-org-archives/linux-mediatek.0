Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKiWQ7glvNnDi+NXDeKnUJINYfasmG07XhTs74YwvmI=; b=IBxJ4ffDYK0pD0
	C3kITb01271csyoZjLsFRgBnnNNULIWG9pXEFdclDrYMIBILTYx8qSsIUPaSfH9+KB8X7mvkUQxvE
	Or7G9o9pOke+PGpSpzArVC++FnF+EVf+JGZQygP//ZmW08w2VhhxevNCMBy4QZObvkl0OQVNq/0Cx
	p8R4ZgiChOhMfFM/wh6lPTHfBWk3p0c63IS7J0XTbBzZJo9h8m1Of30DIuhGndaUjEQwpVMyh7Ppg
	6zvgX9j5yuFPM0XKkMiBWH1zQcNC4kriWwrOvwnmTLqgDz8QBLSOpEfK//Dc5pDvQvcj2MAwjq/+6
	9+09wbJog87gWnTgAQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFtC-00DSSQ-2d; Thu, 12 May 2022 20:58:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrD-00DRBm-HS; Thu, 12 May 2022 20:56:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EF0091F4586A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388982;
 bh=YqWlVpmLvyMqVh31pbNW57iaZRVckJ8tr9KyK+2OHmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ADLIjj2n3ZAFp4Hg6jXTr9H+pg6wj9FtJseKNE+UWqtNdkGuQt7cl/xyEd9+WFulX
 3YM6Kf+h4JKJTI/YCaqGIfQKSWwfZHFRdqZXKAkcJM53wbRvdzhOYd9fNoVf1IhqHJ
 f/Iudlfq7KgMxpJNqGD1YfGsyvdX3wfsPXO3fbNUaTR0DM/AmBPjcLrGYJphLyk2Ci
 dhq0gyXO/01gc9TuUMkwxzajbL3W1ePojbvGRJQHxIL/8TwnBGQkxBkKTAPZ0GQkZv
 QUFMwk8kLK6mFcwJDYQw/48wgbYGxij+qnZdweqRGm5sqxc+hTNCe2tNfkVfsFg/N/
 EcRaHoqIqmjmw==
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
Subject: [PATCH v3 06/16] arm64: dts: mediatek: asurada: Enable and configure
 I2C and SPI busses
Date: Thu, 12 May 2022 16:55:52 -0400
Message-Id: <20220512205602.158273-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135623_765402_0CC5BFCE 
X-CRM114-Status: GOOD (  10.13  )
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gaGFzIGZpdmUgSTJDIGNvbnRyb2xsZXJzIGFuZCB0d28gU1BJ
IGNvbnRyb2xsZXJzCnRoYXQgYXJlIHVzZWQuIEluIHByZXBhcmF0aW9uIGZvciBlbmFibGluZyB0
aGUgZGV2aWNlcyBjb25uZWN0ZWQgdG8KdGhlc2UgY29udHJvbGxlcnMsIGVuYWJsZSBhbmQgY29u
ZmlndXJlIHRoZWlyIGJ1c3Nlcy4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClRl
c3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+Ci0tLQoKKG5vIGNoYW5n
ZXMgc2luY2UgdjEpCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kg
ICAgIHwgMTMwICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFk
YS5kdHNpCmluZGV4IGNhNTVkZDA5NWU4MC4uNGZjZTQ4ZDBmNjUzIDEwMDY0NAotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC04NSw2ICs4NSw0
NyBAQCBwcHZhcl9zeXM6IHJlZ3VsYXRvci12YXItc3lzIHsKIAl9OwogfTsKIAorJmkyYzAgewor
CXN0YXR1cyA9ICJva2F5IjsKKworCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+OworCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZpMmMwX3BpbnM+OworfTsKKwor
JmkyYzEgeworCXN0YXR1cyA9ICJva2F5IjsKKworCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+
OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZpMmMxX3BpbnM+
OworfTsKKworJmkyYzIgeworCXN0YXR1cyA9ICJva2F5IjsKKworCWNsb2NrLWZyZXF1ZW5jeSA9
IDw0MDAwMDA+OworCWNsb2NrLXN0cmV0Y2gtbnMgPSA8MTI2MDA+OworCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZpMmMyX3BpbnM+OworfTsKKworJmkyYzMgewor
CXN0YXR1cyA9ICJva2F5IjsKKworCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+OworCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZpMmMzX3BpbnM+OworfTsKKwor
JmkyYzcgeworCXN0YXR1cyA9ICJva2F5IjsKKworCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+
OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZpMmM3X3BpbnM+
OworfTsKKwogJnBpbyB7CiAJLyogMjIwIGxpbmVzICovCiAJZ3Bpby1saW5lLW5hbWVzID0gIkky
U19EUF9MUkNLIiwKQEAgLTMxMSw2ICszNTIsOTUgQEAgJnBpbyB7CiAJCQkgICJBVURfREFUX01P
U0kxIiwKIAkJCSAgIkFVRF9EQVRfTUlTTzAiLAogCQkJICAiQVVEX0RBVF9NSVNPMSI7CisKKwlp
MmMwX3BpbnM6IGkyYzAtZGVmYXVsdC1waW5zIHsKKwkJcGlucy1idXMgeworCQkJcGlubXV4ID0g
PFBJTk1VWF9HUElPMjA0X19GVU5DX1NDTDA+LAorCQkJCSA8UElOTVVYX0dQSU8yMDVfX0ZVTkNf
U0RBMD47CisJCQliaWFzLXB1bGwtdXA7CisJCQltZWRpYXRlayxwdWxsLXVwLWFkdiA9IDwzPjsK
KwkJCW1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiA9IDw3PjsKKwkJfTsKKwl9OworCisJaTJj
MV9waW5zOiBpMmMxLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBpbm11eCA9IDxQ
SU5NVVhfR1BJTzExOF9fRlVOQ19TQ0wxPiwKKwkJCQkgPFBJTk1VWF9HUElPMTE5X19GVU5DX1NE
QTE+OworCQkJYmlhcy1wdWxsLXVwOworCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CisJ
CQltZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgPSA8Nz47CisJCX07CisJfTsKKworCWkyYzJf
cGluczogaTJjMi1kZWZhdWx0LXBpbnMgeworCQlwaW5zLWJ1cyB7CisJCQlwaW5tdXggPSA8UElO
TVVYX0dQSU8xNDFfX0ZVTkNfU0NMMj4sCisJCQkJIDxQSU5NVVhfR1BJTzE0Ml9fRlVOQ19TREEy
PjsKKwkJCWJpYXMtcHVsbC11cDsKKwkJCW1lZGlhdGVrLHB1bGwtdXAtYWR2ID0gPDM+OworCQkJ
bWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2ID0gPDA+OworCQl9OworCX07CisKKwlpMmMzX3Bp
bnM6IGkyYzMtZGVmYXVsdC1waW5zIHsKKwkJcGlucy1idXMgeworCQkJcGlubXV4ID0gPFBJTk1V
WF9HUElPMTYwX19GVU5DX1NDTDM+LAorCQkJCSA8UElOTVVYX0dQSU8xNjFfX0ZVTkNfU0RBMz47
CisJCQliaWFzLWRpc2FibGU7CisJCQltZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgPSA8Nz47
CisJCX07CisJfTsKKworCWkyYzdfcGluczogaTJjNy1kZWZhdWx0LXBpbnMgeworCQlwaW5zLWJ1
cyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xMjRfX0ZVTkNfU0NMNz4sCisJCQkJIDxQSU5N
VVhfR1BJTzEyNV9fRlVOQ19TREE3PjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW1lZGlhdGVrLGRy
aXZlLXN0cmVuZ3RoLWFkdiA9IDw3PjsKKwkJfTsKKwl9OworCisJc3BpMV9waW5zOiBzcGkxLWRl
ZmF1bHQtcGlucyB7CisJCXBpbnMtY3MtbW9zaS1jbGsgeworCQkJcGlubXV4ID0gPFBJTk1VWF9H
UElPMTU3X19GVU5DX1NQSTFfQV9DU0I+LAorCQkJCSA8UElOTVVYX0dQSU8xNTlfX0ZVTkNfU1BJ
MV9BX01PPiwKKwkJCQkgPFBJTk1VWF9HUElPMTU2X19GVU5DX1NQSTFfQV9DTEs+OworCQkJYmlh
cy1kaXNhYmxlOworCQl9OworCisJCXBpbnMtbWlzbyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQ
SU8xNThfX0ZVTkNfU1BJMV9BX01JPjsKKwkJCWJpYXMtcHVsbC1kb3duOworCQl9OworCX07CisK
KwlzcGk1X3BpbnM6IHNwaTUtZGVmYXVsdC1waW5zIHsKKwkJcGlucy1idXMgeworCQkJcGlubXV4
ID0gPFBJTk1VWF9HUElPMzhfX0ZVTkNfU1BJNV9BX01JPiwKKwkJCQkgPFBJTk1VWF9HUElPMzdf
X0ZVTkNfR1BJTzM3PiwKKwkJCQkgPFBJTk1VWF9HUElPMzlfX0ZVTkNfU1BJNV9BX01PPiwKKwkJ
CQkgPFBJTk1VWF9HUElPMzZfX0ZVTkNfU1BJNV9BX0NMSz47CisJCQliaWFzLWRpc2FibGU7CisJ
CX07CisJfTsKK307CisKKyZzcGkxIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwltZWRpYXRlayxw
YWQtc2VsZWN0ID0gPDA+OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0w
ID0gPCZzcGkxX3BpbnM+OworfTsKKworJnNwaTUgeworCXN0YXR1cyA9ICJva2F5IjsKKworCWNz
LWdwaW9zID0gPCZwaW8gMzcgR1BJT19BQ1RJVkVfTE9XPjsKKwltZWRpYXRlayxwYWQtc2VsZWN0
ID0gPDA+OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJcGluY3RybC0wID0gPCZzcGk1
X3BpbnM+OwogfTsKIAogJnVhcnQwIHsKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
