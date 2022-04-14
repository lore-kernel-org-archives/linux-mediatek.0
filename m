Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9qHriW/hSMGmCYultJq72RsYNJQIs1IuVV1nM/kzQc=; b=2xA8YiHKpEXRf/
	MdhHkg19QkEJ4ySgH5698FWhp/5c1AZ//XLs99zC6kslluQZ1hcqaX9i/nD5obBl9dioDbewCfmIa
	lmqmnQouR8DCZHLXdKaK84k2p/Uoqftwv6LG7UiiPxd2gTu822X+8CSicI/bqcZyhakmWHOp5fPEB
	H2pnh9qKe4v5L24iJ3LTbvbKnzA2c5BtSBoNk2U9/w1Tw8jvZBjxW0gaDh8+MzC7sQLPfBWVZm7SZ
	ckM3JurR3OGGByhOOvUTOWqOuGvogpYwltBf7P7osfEA1D6GH9XWk4WMBFFayMRNxZIGAvmqeTKw3
	eWZUUnyBF5qRpFt6wmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Y5-006gxT-GI; Thu, 14 Apr 2022 17:46:29 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SP-006dle-0G; Thu, 14 Apr 2022 17:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958029; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KVeMzSgeDpo4GcXnQH3o4fRt/ep537h8o9yZbvlijzmMaiwXL0jElXwHJYMMUgQayMCPeYDgio39SWuB5My+hEEzRoU0bZewOxAse7zkJJBGLI9M+K7Y0qJnsQfT0L/bCmXivhDUA14O7LMD8NJczYPyl8DngTPJiBwQGzoiRoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958029;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ibmv8AUMMdSWzgOCsWD+VVMc5Jm5c8uINz1Zok6MZAc=; 
 b=dFl666zh9FnLkvypFpBGshhWsxpqoVM9pLfKnLi7bImdpRAtnu76dK5kwTDQo6eXp4ASy0GDkRAD0jrvomwQJR4LuNq8Cg7WJrGx8VwUQbhKUNzWpKZdVtWS18HXDnvEqic5+azePt2MfujspzJEHDcKELvHPjqAutZz2CAO0vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958029; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=ibmv8AUMMdSWzgOCsWD+VVMc5Jm5c8uINz1Zok6MZAc=;
 b=AM3xkdTZEDBXNJgBRUoIkqC80c74W+ZEG4Oy4DzkuyuRrT1LXe8nULvZ7McrlJ5x
 pr+c9mb2BtX8aJeX9dT783qwvMPC1ZTrIkfrsxb7xrV1rZPwmvpjyHwGv52TcYJNGwF
 aVqrwVFhXgOYrTohpamQap3w6kYfrXZTnkeTdI98=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958028615793.6488409177414;
 Thu, 14 Apr 2022 10:40:28 -0700 (PDT)
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
Subject: [PATCH v2 12/14] dt-bindings: pinctrl: add binding for Ralink MT7621
 pinctrl
Date: Thu, 14 Apr 2022 20:39:14 +0300
Message-Id: <20220414173916.5552-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104037_155442_CC33E470 
X-CRM114-Status: GOOD (  12.90  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgTVQ3NjIxIHBpbiBjb250cm9sbGVyIGZvciBNVDc2
MjEgU29DLgoKU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzku
Y29tPgotLS0KIC4uLi9waW5jdHJsL3JhbGluayxtdDc2MjEtcGluY3RybC55YW1sICAgICAgICB8
IDcxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmFsaW5rLG10NzYyMS1waW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxtdDc2
MjEtcGluY3RybC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
NjFlNWM4NDdlOGM4Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMS1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw3
MSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIE1UNzYy
MSBQaW4gQ29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+CisgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1
ZWxsb3NAZ21haWwuY29tPgorCitkZXNjcmlwdGlvbjoKKyAgUmFsaW5rIE1UNzYyMSBwaW4gY29u
dHJvbGxlciBmb3IgTVQ3NjIxIFNvQy4KKyAgVGhlIHBpbiBjb250cm9sbGVyIGNhbiBvbmx5IHNl
dCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRpdmlkdWFsCisgIHBpbnMgaXMg
bm90IHN1cHBvcnRlZC4gVGhlcmUgaXMgbm8gcGluY29uZiBzdXBwb3J0LgorCitwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiByYWxpbmssbXQ3NjIxLXBpbmN0cmwKKworcGF0
dGVyblByb3BlcnRpZXM6CisgICctcGlucyQnOgorICAgIHR5cGU6IG9iamVjdAorICAgIHBhdHRl
cm5Qcm9wZXJ0aWVzOgorICAgICAgJ14oLiotKT9waW5tdXgkJzoKKyAgICAgICAgdHlwZTogb2Jq
ZWN0CisgICAgICAgIGRlc2NyaXB0aW9uOiBub2RlIGZvciBwaW5jdHJsLgorICAgICAgICAkcmVm
OiBwaW5tdXgtbm9kZS55YW1sIworCisgICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgZ3Jv
dXBzOgorICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4gZ3JvdXAgdG8gc2VsZWN0Lgor
ICAgICAgICAgICAgZW51bTogW2kyYywganRhZywgbWRpbywgcGNpZSwgcmdtaWkxLCByZ21paTIs
IHNkaGNpLCBzcGksIHVhcnQxLAorICAgICAgICAgICAgICAgICAgIHVhcnQyLCB1YXJ0Mywgd2R0
XQorCisgICAgICAgICAgZnVuY3Rpb246CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11
eCBmdW5jdGlvbiB0byBzZWxlY3QuCisgICAgICAgICAgICBlbnVtOiBbZ3BpbywgaTJjLCBpMnMs
IGp0YWcsIG1kaW8sIG5hbmQxLCBuYW5kMiwgcGNpZSByZWZjbGssCisgICAgICAgICAgICAgICAg
ICAgcGNpZSByc3QsIHBjbSwgcmdtaWkxLCByZ21paTIsIHNkaGNpLCBzcGRpZjIsIHNwZGlmMywg
c3BpLAorICAgICAgICAgICAgICAgICAgIHVhcnQxLCB1YXJ0MiwgdWFydDMsIHdkdCByZWZjbGss
IHdkdCByc3RdCisKKyAgICAgICAgcmVxdWlyZWQ6CisgICAgICAgICAgLSBncm91cHMKKyAgICAg
ICAgICAtIGZ1bmN0aW9uCisKKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisK
KyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworYWxsT2Y6CisgIC0gJHJlZjogInBp
bmN0cmwueWFtbCMiCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKworYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAjIFBpbm11eCBjb250cm9sbGVyIG5vZGUK
KyAgLSB8CisgICAgcGluY3RybCB7CisgICAgICBjb21wYXRpYmxlID0gInJhbGluayxtdDc2MjEt
cGluY3RybCI7CisKKyAgICAgIGkyY19waW5zOiBpMmMwLXBpbnMgeworICAgICAgICBwaW5tdXgg
eworICAgICAgICAgIGdyb3VwcyA9ICJpMmMiOworICAgICAgICAgIGZ1bmN0aW9uID0gImkyYyI7
CisgICAgICAgIH07CisgICAgICB9OworICAgIH07Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
