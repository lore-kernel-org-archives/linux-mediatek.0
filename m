Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A48C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCYQq5bO2xhMfdvtrAGMfe6FlgIlf6NK2r9+JpOyTLM=; b=iHTI4icM/cNFrX
	GBAKOwfVMaEwRoi0J6cuHjhdNiU/h22ftCMlIMwM5MbBZ5o/6lwtjsVGV9qa6XpXVN4aCnmFFwX3F
	njOBe4fe6eOP/Rqhajws+B3BcozcTC6DdOCnnrCAqhaTtYfd5kHdkGby60JvY3cIR1eEa2z1CsyZt
	jUDcw1IIJE9C5gUTNfznMMmHHspFPP+UCiE+UP/rXiSGNLOlxVDkxk4q+3AmzSkC+LdQ0JRLdaJuf
	tdK6AKjZrebvIkHngzaSp1cOE1AabCuEiSMr765iiKrev14VyMaakqjGVv/7FtASx9GMz/0Dagwlt
	rFXPSge0dOzM5d2VXLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3SN-006dlX-Us; Thu, 14 Apr 2022 17:40:35 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3Rx-006daG-K2; Thu, 14 Apr 2022 17:40:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649957997; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oIzejjUmH+pgkTOsabERwvBmbs3BGw89sc/ntUWoXz8EQHqw3wB+A/0xJoA/vCK2UumCnYEAcEbao3swgKDnHG2xhOrXIA5RHK+ZI2ORSeRd86JU/L0Ag3d1HnPzGF0fsqnEzuAiCpa6kqAm7evUKxo7aIH6Bc9xGJEe6/Ki4uc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649957997;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8miZcTOH0rWiGd+6wcqTTPeMsb9x57xBzzuSkUegm3c=; 
 b=f79w8zfBqO6/kTe//cMnyz+lzO4KluiRk5WvpHKQK7PxQ4se+tOPdw7tDyE1KAlJ0XsjUTVpQJh1YBFeY6PyJiDUs5qRE9lSKHZ9YAt7OROctDH/Qi+rYrVyPyaYWgbqT1BPcko/LSI/02GzWM3kKXgH5Sex/4694n5z3TDzSgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649957997; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=8miZcTOH0rWiGd+6wcqTTPeMsb9x57xBzzuSkUegm3c=;
 b=WTi5pB8hmR93vNGwPpg59Oodh1g6+G1UJtC02v/QcxtfkxPcMW6EDTc8RGY1blxm
 bF6BRnuZW54/dn6HYom/HLyqpLvlHak3qs96RfDOkaBXxKpGPTaatR6adqEkbyM4FPD
 2cnE3CHdO/m/Ht/DP8adhgEXu2H7+mKFJn3S2zu8=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649957995568600.5755065695765;
 Thu, 14 Apr 2022 10:39:55 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 04/14] pinctrl: ralink: rename pinctrl-rt288x to
 pinctrl-rt2880
Date: Thu, 14 Apr 2022 20:39:06 +0300
Message-Id: <20220414173916.5552-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104009_869050_37133C12 
X-CRM114-Status: GOOD (  13.44  )
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

UmVuYW1lICJwaW5jdHJsLXJ0Mjg4eC5jIiB0byAicGluY3RybC1ydDI4ODAuYyIgYXMgdGhpcyBp
cyB0aGUgUmFsaW5rClJUMjg4MCBwaW5jdHJsIHN1YmRyaXZlci4gUmVuYW1lIFBJTkNUUkxfUlQy
ODhYIHN5bWJvbCB0byBQSU5DVFJMX1JUMjg4MC4KUmVuYW1lIGZ1bmN0aW9ucyB0aGF0IGluY2x1
ZGUgInJ0Mjg4eCIgdG8gInJ0Mjg4MCIuCgpTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxh
cmluYy51bmFsQGFyaW5jOS5jb20+ClJldmlld2VkLWJ5OiBTZXJnaW8gUGFyYWN1ZWxsb3MgPHNl
cmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3JhbGluay9L
Y29uZmlnICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcGluY3RybC9yYWxpbmsv
TWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3twaW5jdHJsLXJ0Mjg4eC5jID0+
IHBpbmN0cmwtcnQyODgwLmN9ICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMyBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBkcml2ZXJz
L3BpbmN0cmwvcmFsaW5rL3twaW5jdHJsLXJ0Mjg4eC5jID0+IHBpbmN0cmwtcnQyODgwLmN9ICg3
OCUpCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3JhbGluay9LY29uZmlnIGIvZHJpdmVy
cy9waW5jdHJsL3JhbGluay9LY29uZmlnCmluZGV4IGQwZjBhOGYyYjliNy4uYWE4MmFjZmFlODI3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKKysrIGIvZHJpdmVy
cy9waW5jdHJsL3JhbGluay9LY29uZmlnCkBAIC0xNyw4ICsxNyw4IEBAIGNvbmZpZyBQSU5DVFJM
X01UNzYyMQogICAgICAgICBkZXBlbmRzIG9uIFJBTElOSyAmJiBTT0NfTVQ3NjIxCiAgICAgICAg
IHNlbGVjdCBQSU5DVFJMX1JBTElOSwogCi1jb25maWcgUElOQ1RSTF9SVDI4OFgKLSAgICAgICAg
Ym9vbCAiUlQyODhYIHBpbmN0cmwgZHJpdmVyIGZvciBSQUxJTksvTWVkaWF0ZWsgU09DcyIKK2Nv
bmZpZyBQSU5DVFJMX1JUMjg4MAorICAgICAgICBib29sICJSVDI4ODAgcGluY3RybCBkcml2ZXIg
Zm9yIFJBTElOSy9NZWRpYXRlayBTT0NzIgogICAgICAgICBkZXBlbmRzIG9uIFJBTElOSyAmJiBT
T0NfUlQyODhYCiAgICAgICAgIHNlbGVjdCBQSU5DVFJMX1JBTElOSwogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BpbmN0cmwvcmFsaW5rL01ha2VmaWxlIGIvZHJpdmVycy9waW5jdHJsL3JhbGluay9N
YWtlZmlsZQppbmRleCAyYzEzMjNiNzRlOTYuLjBlYmJlNTUyNTI2ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9waW5jdHJsL3JhbGluay9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5r
L01ha2VmaWxlCkBAIC0zLDYgKzMsNiBAQCBvYmotJChDT05GSUdfUElOQ1RSTF9SQUxJTkspICAg
Kz0gcGluY3RybC1yYWxpbmsubwogCiBvYmotJChDT05GSUdfUElOQ1RSTF9NVDc2MjApICAgKz0g
cGluY3RybC1tdDc2MjAubwogb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ3NjIxKSAgICs9IHBpbmN0
cmwtbXQ3NjIxLm8KLW9iai0kKENPTkZJR19QSU5DVFJMX1JUMjg4WCkgICArPSBwaW5jdHJsLXJ0
Mjg4eC5vCitvYmotJChDT05GSUdfUElOQ1RSTF9SVDI4ODApICAgKz0gcGluY3RybC1ydDI4ODAu
bwogb2JqLSQoQ09ORklHX1BJTkNUUkxfUlQzMDVYKSAgICs9IHBpbmN0cmwtcnQzMDV4Lm8KIG9i
ai0kKENPTkZJR19QSU5DVFJMX1JUMzg4MykgICArPSBwaW5jdHJsLXJ0Mzg4My5vCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODh4LmMgYi9kcml2ZXJzL3Bp
bmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODgwLmMKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1l
IGZyb20gZHJpdmVycy9waW5jdHJsL3JhbGluay9waW5jdHJsLXJ0Mjg4eC5jCnJlbmFtZSB0byBk
cml2ZXJzL3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODgwLmMKaW5kZXggZGI1YzA5ZWQ1NjAx
Li45YzVlODI4YWY0M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9yYWxpbmsvcGluY3Ry
bC1ydDI4OHguYworKysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODgwLmMK
QEAgLTM0LDI3ICszNCwyNyBAQCBzdGF0aWMgc3RydWN0IHJhbGlua19wbXhfZ3JvdXAgcnQyODgw
X3Bpbm11eF9kYXRhX2FjdFtdID0gewogCXsgMCB9CiB9OwogCi1zdGF0aWMgaW50IHJ0Mjg4eF9w
aW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgaW50IHJ0
Mjg4MF9waW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJcmV0
dXJuIHJhbGlua19waW5jdHJsX2luaXQocGRldiwgcnQyODgwX3Bpbm11eF9kYXRhX2FjdCk7CiB9
CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJ0Mjg4eF9waW5jdHJsX21hdGNo
W10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBydDI4ODBfcGluY3RybF9t
YXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAicmFsaW5rLHJ0Mjg4MC1waW5tdXgiIH0sCiAJ
e30KIH07Ci1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydDI4OHhfcGluY3RybF9tYXRjaCk7CitN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydDI4ODBfcGluY3RybF9tYXRjaCk7CiAKLXN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0Mjg4eF9waW5jdHJsX2RyaXZlciA9IHsKLQkucHJvYmUg
PSBydDI4OHhfcGluY3RybF9wcm9iZSwKK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0
Mjg4MF9waW5jdHJsX2RyaXZlciA9IHsKKwkucHJvYmUgPSBydDI4ODBfcGluY3RybF9wcm9iZSwK
IAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJydDI4ODAtcGlubXV4IiwKLQkJLm9mX21hdGNoX3Rh
YmxlID0gcnQyODh4X3BpbmN0cmxfbWF0Y2gsCisJCS5vZl9tYXRjaF90YWJsZSA9IHJ0Mjg4MF9w
aW5jdHJsX21hdGNoLAogCX0sCiB9OwogCi1zdGF0aWMgaW50IF9faW5pdCBydDI4OHhfcGluY3Ry
bF9pbml0KHZvaWQpCitzdGF0aWMgaW50IF9faW5pdCBydDI4ODBfcGluY3RybF9pbml0KHZvaWQp
CiB7Ci0JcmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmcnQyODh4X3BpbmN0cmxfZHJp
dmVyKTsKKwlyZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZydDI4ODBfcGluY3RybF9k
cml2ZXIpOwogfQotY29yZV9pbml0Y2FsbF9zeW5jKHJ0Mjg4eF9waW5jdHJsX2luaXQpOworY29y
ZV9pbml0Y2FsbF9zeW5jKHJ0Mjg4MF9waW5jdHJsX2luaXQpOwotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
