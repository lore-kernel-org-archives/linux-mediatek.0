Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2212C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URs4W+EWUJwmGjXS+Rvf296iDc5Ofk2MhWBfm2wSaaM=; b=u2xyqZ/95R+Vkf
	4erpOcd+EjT1rg/4EqXMtTEXB6LHCXjN6WiqY/ddpC9ZxtsJ7V8YlwxgX9laABXu5kCxTeMbg9XjF
	cD/RnWPHoIBVBJz5ZxmuPqq0UgCREq9paM0V6QilvnXP5XXuCOeKwZYmOHKxTG3a3178T+uaro7yI
	RZSbJ8CcPy7bEhiKSodH38ShYh8aItq5Lz0q1hkwG3lyuUEZyBkJ2fSx9g8vFAKLHVAwUYr9EgTrh
	5uL2670u5/yH7EwiTqLYsFHGJij5gAgSB1uXp1vSH7hSqr0Yb6nUYcEJCuRH7xmgXVloSKAAr40Rj
	x5dYyBgj8QUFI0GhLa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Wm-006gHc-7h; Thu, 14 Apr 2022 17:45:08 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SG-006dhw-JQ; Thu, 14 Apr 2022 17:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958021; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g32l+8hgqG2jlHAkGyf2aftxPyygZoQr+oeoLg/pkbWQS1CTnab0pmTIsscpR/uHPd+i0ifVVmeWxnIkMzSjhNkgHzWkQYNsjZTj6kZH6bRWegI+BeYycIb2g9V6GeoAp730suSfvM9GHArRv7Gy6bHO2/l66pHn/d66e5Eh9ok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958021;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=IMNM5MdolEKAJtDmJ2L/PHlHBjhgQ3P7ALeEsPMkcPE=; 
 b=RH3tKHeYfIOaAblCTyjShRpiqA89T3oU8ZQ9fjZdiUy34EyMUJ8LE6dFyMBEFaMqTin8BALWr8pePQyu9K4hyVHR+WZKahh0+WPBYELf5i9Lu43aN1l4zkDGFdlqyXR70sXZ7PWeYyfCHZ83e0Ws0zBvkH4R+V/cC+qHAAJea1Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958021; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=IMNM5MdolEKAJtDmJ2L/PHlHBjhgQ3P7ALeEsPMkcPE=;
 b=ZNY/n5JCYx3TQwbAbGTHA3bN5nnjYchtA/08g6NTTxK2q9wmWaQeETBY1bNC6sPZ
 2e0OoIVfM6FVXbwewDL+fz69UCFLjzXq4hkULiB5heMKwVX6hLwrtAL2poiyrhW5rNi
 W6PuhSndgYzURR4bcsmbi4/ckvsVT94cpqwr0UgE=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958020478365.7778123721878;
 Thu, 14 Apr 2022 10:40:20 -0700 (PDT)
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
Subject: [PATCH v2 10/14] dt-bindings: pinctrl: rt2880: fix binding name,
 pin groups and functions
Date: Thu, 14 Apr 2022 20:39:12 +0300
Message-Id: <20220414173916.5552-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104028_736765_16ACE092 
X-CRM114-Status: UNSURE (   9.73  )
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

RGVwcmVjYXRlIHRoZSBvbGQgcHJvcGVydHkgInJhbGluayxydDI4ODAtcGlubXV4Ii4gQWRkIHRo
ZSBuZXcgcHJvcGVydHkKInJhbGluayxydDI4ODAtcGluY3RybCIuIFRoZSBvbGQgcHJvcGVydHkg
bmFtZSB3YXMgaW5hY2N1cmF0ZSBhcyB0aGUKaGFyZHdhcmUgYmxvY2sgaXMgY2FsbGVkIHBpbmN0
cmwgYWNyb3NzIHRoZSBNZWRpYXRlay9SYWxpbmsgYXJjaGl0ZWN0dXJlLgoKQ3VycmVudCBwaW4g
Z3JvdXAgYW5kIGZ1bmN0aW9uIGJpbmRpbmdzIGFyZSBmb3IgTVQ3NjIxLiBQdXQgYmluZGluZ3Mg
Zm9yClJUMjg4MCBpbnN0ZWFkLgoKQWRkIG1lIGFzIGEgbWFpbnRhaW5lci4KClNpZ25lZC1vZmYt
Ynk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KLS0tCiAuLi5waW5tdXgu
eWFtbCA9PiByYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbH0gfCAyNiArKysrKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwve3JhbGluayxy
dDI4ODAtcGlubXV4LnlhbWwgPT4gcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWx9ICg1MyUpCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFs
aW5rLHJ0Mjg4MC1waW5tdXgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3JhbGluayxydDI4ODAtcGluY3RybC55YW1sCnNpbWlsYXJpdHkgaW5kZXggNTMl
CnJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3Jh
bGluayxydDI4ODAtcGlubXV4LnlhbWwKcmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGluY3RybC55YW1sCmluZGV4IDlkZThi
MGMwNzVlMi4uNTZlNWJlY2FiY2ZkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1sCisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGluY3Ry
bC55YW1sCkBAIC0xLDIxICsxLDIzIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCiAlWUFNTCAxLjIKIC0tLQotJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwjCisk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1w
aW5jdHJsLnlhbWwjCiAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKIAotdGl0bGU6IFJhbGluayBydDI4ODAgcGlubXV4IGNvbnRyb2xsZXIKK3Rp
dGxlOiBSYWxpbmsgUlQyODgwIFBpbiBDb250cm9sbGVyCiAKIG1haW50YWluZXJzOgorICAtIEFy
xLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KICAgLSBTZXJnaW8gUGFyYWN1ZWxs
b3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CiAKIGRlc2NyaXB0aW9uOgotICBUaGUg
cnQyODgwIHBpbm11eCBjYW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhp
bmcgaW5kaXZpdWFsIHBpbnMKLSAgaXMgbm90IHN1cHBvcnRlZC4gVGhlcmUgaXMgbm8gcGluY29u
ZiBzdXBwb3J0LgorICBSYWxpbmsgUlQyODgwIHBpbiBjb250cm9sbGVyIGZvciBSVDI4ODAgU29D
LgorICBUaGUgcGluIGNvbnRyb2xsZXIgY2FuIG9ubHkgc2V0IHRoZSBtdXhpbmcgb2YgcGluIGdy
b3Vwcy4gTXV4aW5nIGluZGl2aWR1YWwKKyAgcGlucyBpcyBub3Qgc3VwcG9ydGVkLiBUaGVyZSBp
cyBubyBwaW5jb25mIHN1cHBvcnQuCiAKIHByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6Ci0gICAg
Y29uc3Q6IHJhbGluayxydDI4ODAtcGlubXV4CisgICAgY29uc3Q6IHJhbGluayxydDI4ODAtcGlu
Y3RybAogCiBwYXR0ZXJuUHJvcGVydGllczoKICAgJy1waW5zJCc6CkBAIC0yOCwxNCArMzAsMTIg
QEAgcGF0dGVyblByb3BlcnRpZXM6CiAKICAgICAgICAgcHJvcGVydGllczoKICAgICAgICAgICBn
cm91cHM6Ci0gICAgICAgICAgICBkZXNjcmlwdGlvbjogTmFtZSBvZiB0aGUgcGluIGdyb3VwIHRv
IHVzZSBmb3IgdGhlIGZ1bmN0aW9ucy4KLSAgICAgICAgICAgIGVudW06IFtpMmMsIGp0YWcsIG1k
aW8sIHBjaWUsIHJnbWlpMSwgcmdtaWkyLCBzZGhjaSwgc3BpLAotICAgICAgICAgICAgICAgICAg
IHVhcnQxLCB1YXJ0MiwgdWFydDMsIHdkdF0KKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUg
cGluIGdyb3VwIHRvIHNlbGVjdC4KKyAgICAgICAgICAgIGVudW06IFtpMmMsIHNwaSwgdWFydGxp
dGUsIGp0YWcsIG1kaW8sIHNkcmFtLCBwY2ldCisKICAgICAgICAgICBmdW5jdGlvbjoKLSAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgbXV4IGZ1bmN0aW9uIHRvIHNlbGVjdAotICAgICAgICAg
ICAgZW51bTogW2dwaW8sIGkyYywgaTJzLCBqdGFnLCBtZGlvLCBuYW5kMSwgbmFuZDIsIHBjaWUg
cmVmY2xrLAotICAgICAgICAgICAgICAgICAgIHBjaWUgcnN0LCBwY20sIHJnbWlpMSwgcmdtaWky
LCBzZGhjaSwgc3BkaWYyLCBzcGRpZjMsCi0gICAgICAgICAgICAgICAgICAgc3BpLCB1YXJ0MSwg
dWFydDIsIHVhcnQzLCB3ZHQgcmVmY2xrLCB3ZHQgcnN0XQorICAgICAgICAgICAgZGVzY3JpcHRp
b246IFRoZSBtdXggZnVuY3Rpb24gdG8gc2VsZWN0LgorICAgICAgICAgICAgZW51bTogW2dwaW8s
IGkyYywgc3BpLCB1YXJ0bGl0ZSwganRhZywgbWRpbywgc2RyYW0sIHBjaV0KIAogICAgICAgICBy
ZXF1aXJlZDoKICAgICAgICAgICAtIGdyb3VwcwpAQCAtNTcsNyArNTcsNyBAQCBleGFtcGxlczoK
ICAgIyBQaW5tdXggY29udHJvbGxlciBub2RlCiAgIC0gfAogICAgIHBpbmN0cmwgewotICAgICAg
Y29tcGF0aWJsZSA9ICJyYWxpbmsscnQyODgwLXBpbm11eCI7CisgICAgICBjb21wYXRpYmxlID0g
InJhbGluayxydDI4ODAtcGluY3RybCI7CiAKICAgICAgIGkyY19waW5zOiBpMmMwLXBpbnMgewog
ICAgICAgICBwaW5tdXggewotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
