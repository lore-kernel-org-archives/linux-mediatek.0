Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYw+4HlWumCo0ID5B25o2zR1OxcQnc3L7tX5Z6TE+AQ=; b=iFlYniPrBxiEGJ
	sKPmE6jMet0zEVFCzvZBJG7G02bi4BYyc+UlOLYIa6XMOAjQAUwALRVH33iCWqNPpJ1irQBwh/Snh
	aFaLzwbNt8nk8lCIZ0CQJM67LC3iU+xZue000QTCA4RKd5oxmjk4ZOiCandqWSUdbG8FMRCK6HzdS
	Tc3MjeLBkVn+byJKYCh+JAz22zouEMvSa2bMY3ksnw6Q0g0INGfTJqOXekc9G5tVlD4n0jrbhnkat
	sB7lfkF30oqNTO01qSBtxGCvBcFBwwqUnLUZ7rKXqGvvB/RSCZPwgO5ouLsmqhqnZsrWcwmlk8iOp
	y2+BVDoMTgJca1Gf2Eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWFa-00H2kQ-3O; Wed, 13 Apr 2022 06:13:10 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWB2-00H0d9-Cs; Wed, 13 Apr 2022 06:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830093; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HxLN/QLiCQ+RM6poc5lMejJm/4ZE30uuKJtac4LBa1V5YIJiCAFr7c3FRINtYpOmVJ09lRCoZRWkwJFuSAuSMk3hVHW15DGFA2NN0j9gRAOsUzks0FK1QV2508o2gYDJGh0Bpzs6Ps06ZKvhq4NvL1CG2w1+2I9vKBlwLOIf+8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830093;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=T64RVpELLCvs3awQZyxnL3gIGoe8/MngxdFI+qg8tng=; 
 b=j4KarLreEyuMgIcdcwe2dS62HthogvLpttpVLbqA3j1WcOGMEZSa6f+y7eWQjkXkBnnQnRf5E5/LyVB5qTwTgyCTetG0jTyYBIr1ey8iN2YwQUYscYXqTjJmrZBfb5M1Ky2C0lpl8SYQwJ2lXQZtzG6kyCHsm/P3Jr3ICkPiMJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830093; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=T64RVpELLCvs3awQZyxnL3gIGoe8/MngxdFI+qg8tng=;
 b=e1EJZvnsBx/+I/0ypgPmYvIjoMsAMQlAgjEYb44dH+dPy/0muQhz9ryLoS2z4YTo
 frPnjctYfZDuyWJR0Ro4xoXc6DReXNVxVDKP/pb2jP85AXYPgc8YpGzbVrh5I/pC6hN
 HMYAzP2FnI7wWwcNZXaAzGrJ30zduakDpChYxFPM=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830092041237.3768558657706;
 Tue, 12 Apr 2022 23:08:12 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 04/14] pinctrl: ralink: rename pinctrl-rt288x to pinctrl-rt2880
Date: Wed, 13 Apr 2022 09:07:19 +0300
Message-Id: <20220413060729.27639-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230828_662764_A0D8BA55 
X-CRM114-Status: GOOD (  13.28  )
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
cmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3JhbGluay9LY29uZmln
ICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvcGluY3RybC9yYWxpbmsvTWFrZWZp
bGUgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3twaW5jdHJsLXJ0Mjg4eC5jID0+IHBpbmN0
cmwtcnQyODgwLmN9ICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBkcml2ZXJzL3BpbmN0
cmwvcmFsaW5rL3twaW5jdHJsLXJ0Mjg4eC5jID0+IHBpbmN0cmwtcnQyODgwLmN9ICg3OCUpCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3JhbGluay9LY29uZmlnIGIvZHJpdmVycy9waW5j
dHJsL3JhbGluay9LY29uZmlnCmluZGV4IGQwZjBhOGYyYjliNy4uYWE4MmFjZmFlODI3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKKysrIGIvZHJpdmVycy9waW5j
dHJsL3JhbGluay9LY29uZmlnCkBAIC0xNyw4ICsxNyw4IEBAIGNvbmZpZyBQSU5DVFJMX01UNzYy
MQogICAgICAgICBkZXBlbmRzIG9uIFJBTElOSyAmJiBTT0NfTVQ3NjIxCiAgICAgICAgIHNlbGVj
dCBQSU5DVFJMX1JBTElOSwogCi1jb25maWcgUElOQ1RSTF9SVDI4OFgKLSAgICAgICAgYm9vbCAi
UlQyODhYIHBpbmN0cmwgZHJpdmVyIGZvciBSQUxJTksvTWVkaWF0ZWsgU09DcyIKK2NvbmZpZyBQ
SU5DVFJMX1JUMjg4MAorICAgICAgICBib29sICJSVDI4ODAgcGluY3RybCBkcml2ZXIgZm9yIFJB
TElOSy9NZWRpYXRlayBTT0NzIgogICAgICAgICBkZXBlbmRzIG9uIFJBTElOSyAmJiBTT0NfUlQy
ODhYCiAgICAgICAgIHNlbGVjdCBQSU5DVFJMX1JBTElOSwogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvcmFsaW5rL01ha2VmaWxlIGIvZHJpdmVycy9waW5jdHJsL3JhbGluay9NYWtlZmls
ZQppbmRleCAyYzEzMjNiNzRlOTYuLjBlYmJlNTUyNTI2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
aW5jdHJsL3JhbGluay9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL01ha2Vm
aWxlCkBAIC0zLDYgKzMsNiBAQCBvYmotJChDT05GSUdfUElOQ1RSTF9SQUxJTkspICAgKz0gcGlu
Y3RybC1yYWxpbmsubwogCiBvYmotJChDT05GSUdfUElOQ1RSTF9NVDc2MjApICAgKz0gcGluY3Ry
bC1tdDc2MjAubwogb2JqLSQoQ09ORklHX1BJTkNUUkxfTVQ3NjIxKSAgICs9IHBpbmN0cmwtbXQ3
NjIxLm8KLW9iai0kKENPTkZJR19QSU5DVFJMX1JUMjg4WCkgICArPSBwaW5jdHJsLXJ0Mjg4eC5v
CitvYmotJChDT05GSUdfUElOQ1RSTF9SVDI4ODApICAgKz0gcGluY3RybC1ydDI4ODAubwogb2Jq
LSQoQ09ORklHX1BJTkNUUkxfUlQzMDVYKSAgICs9IHBpbmN0cmwtcnQzMDV4Lm8KIG9iai0kKENP
TkZJR19QSU5DVFJMX1JUMzg4MykgICArPSBwaW5jdHJsLXJ0Mzg4My5vCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODh4LmMgYi9kcml2ZXJzL3BpbmN0cmwv
cmFsaW5rL3BpbmN0cmwtcnQyODgwLmMKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20g
ZHJpdmVycy9waW5jdHJsL3JhbGluay9waW5jdHJsLXJ0Mjg4eC5jCnJlbmFtZSB0byBkcml2ZXJz
L3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODgwLmMKaW5kZXggZGI1YzA5ZWQ1NjAxLi45YzVl
ODI4YWY0M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9yYWxpbmsvcGluY3RybC1ydDI4
OHguYworKysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL3BpbmN0cmwtcnQyODgwLmMKQEAgLTM0
LDI3ICszNCwyNyBAQCBzdGF0aWMgc3RydWN0IHJhbGlua19wbXhfZ3JvdXAgcnQyODgwX3Bpbm11
eF9kYXRhX2FjdFtdID0gewogCXsgMCB9CiB9OwogCi1zdGF0aWMgaW50IHJ0Mjg4eF9waW5jdHJs
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgaW50IHJ0Mjg4MF9w
aW5jdHJsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJcmV0dXJuIHJh
bGlua19waW5jdHJsX2luaXQocGRldiwgcnQyODgwX3Bpbm11eF9kYXRhX2FjdCk7CiB9CiAKLXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJ0Mjg4eF9waW5jdHJsX21hdGNoW10gPSB7
CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBydDI4ODBfcGluY3RybF9tYXRjaFtd
ID0gewogCXsgLmNvbXBhdGlibGUgPSAicmFsaW5rLHJ0Mjg4MC1waW5tdXgiIH0sCiAJe30KIH07
Ci1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydDI4OHhfcGluY3RybF9tYXRjaCk7CitNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBydDI4ODBfcGluY3RybF9tYXRjaCk7CiAKLXN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHJ0Mjg4eF9waW5jdHJsX2RyaXZlciA9IHsKLQkucHJvYmUgPSBydDI4
OHhfcGluY3RybF9wcm9iZSwKK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0Mjg4MF9w
aW5jdHJsX2RyaXZlciA9IHsKKwkucHJvYmUgPSBydDI4ODBfcGluY3RybF9wcm9iZSwKIAkuZHJp
dmVyID0gewogCQkubmFtZSA9ICJydDI4ODAtcGlubXV4IiwKLQkJLm9mX21hdGNoX3RhYmxlID0g
cnQyODh4X3BpbmN0cmxfbWF0Y2gsCisJCS5vZl9tYXRjaF90YWJsZSA9IHJ0Mjg4MF9waW5jdHJs
X21hdGNoLAogCX0sCiB9OwogCi1zdGF0aWMgaW50IF9faW5pdCBydDI4OHhfcGluY3RybF9pbml0
KHZvaWQpCitzdGF0aWMgaW50IF9faW5pdCBydDI4ODBfcGluY3RybF9pbml0KHZvaWQpCiB7Ci0J
cmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmcnQyODh4X3BpbmN0cmxfZHJpdmVyKTsK
KwlyZXR1cm4gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZydDI4ODBfcGluY3RybF9kcml2ZXIp
OwogfQotY29yZV9pbml0Y2FsbF9zeW5jKHJ0Mjg4eF9waW5jdHJsX2luaXQpOworY29yZV9pbml0
Y2FsbF9zeW5jKHJ0Mjg4MF9waW5jdHJsX2luaXQpOwotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
