Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB38BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOb58zGV+oganWcK8Y1o3SKy9fqPMRPrGs4L/hMh9yA=; b=o88IhkRU7Vg8JN
	i8uScD+xQFlcyDJjscARkR4ndCnyGknI6+ypj9Ay9oAXixLmr2nGri2aImpwrizT3jaVdCQvNycMB
	N+od0msZx7S+f5hJmclZiypwGhYuQKoqHFct2Rv747meJ6cuCi+eNsAtDnBj4t8ahfT72wLG1QX/9
	vKO04bq+UDUmD0ewKg+t02H00yTdhZltBrD5/h8uXPZ2DCuJEVS2qeeotUqJ+tOdLCmXDZk6ehFR9
	SdFuZokHP0bEpQ1QyIQ5V4AK4v7gu27k/s5rapMYcOeYtfjkPqrX16OvymVaiaXQaRadRT/61ZWfR
	MwL/5JmLuFVONyADh+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3XM-006gaM-NU; Thu, 14 Apr 2022 17:45:44 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SK-006djN-1I; Thu, 14 Apr 2022 17:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958025; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k/q9eXTFM3bj6T0VYQGFHBQF39Z4kjz/0P9AuilBKrcxelVvHddFmuFr5Fp89kh+KwxXptvpan3miGrwRaC6PhCVvHlDecaV0P4ofmGFhRa2QCLKXLRFcKQrMvsTyvSbBOib5sFtC3SIuNMCiizkmp8L+5J3yX+o1U8GuV+pVBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958025;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ThSA3OlMdtKDRied4vhuun5OS9ubpkDQSHM9sks5C/8=; 
 b=QW9gLR7WsLMzbijBz7E1p+B9Qn4KjJ8hRzd+Z7mcRj1M70V5unUNT+GVOE8HEMqDDA6bTTMyq6My8c/ddiguz0sRYNfCRVzg9xkXAgbpgMZylNdXMTa3mch1l9aoyX/nrkVYPvx4q+/Mofw7xPoiGVN7TeZctG+UUGRW7J4WXTs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958025; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=ThSA3OlMdtKDRied4vhuun5OS9ubpkDQSHM9sks5C/8=;
 b=A3yymyo7nniDqwgMIYRccuIexWf6yNALaHsCG/mMt1/DAZaZM3zpBQ9WO3Xfmw9m
 5HLrji1uXscRN4n47I4kdyAbAo0PV9HGWdBMkpfHzenCk3OZjfShmahy0D/4MHV1Knt
 6R/+cExkdmZBfZh6FVZ8yueRByY1clcH71Ibc9Ug=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958024558393.88923947858166;
 Thu, 14 Apr 2022 10:40:24 -0700 (PDT)
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
Subject: [PATCH v2 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
Date: Thu, 14 Apr 2022 20:39:13 +0300
Message-Id: <20220414173916.5552-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104032_216241_B6A184E8 
X-CRM114-Status: GOOD (  12.75  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgTVQ3NjIwIHBpbiBjb250cm9sbGVyIGZvciBNVDc2
MjAsIE1UNzYyOCBhbmQKTVQ3Njg4IFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogLi4uL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1w
aW5jdHJsLnlhbWwgICAgICAgIHwgOTEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDkxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0cmwueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGlu
ayxtdDc2MjAtcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi40ZDgyMGRmMjRiODkKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0
cmwueWFtbApAQCAtMCwwICsxLDkxIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxtdDc2MjAtcGluY3RybC55YW1sIwor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisK
K3RpdGxlOiBSYWxpbmsgTVQ3NjIwIFBpbiBDb250cm9sbGVyCisKK21haW50YWluZXJzOgorICAt
IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KKyAgLSBTZXJnaW8gUGFyYWN1
ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CisKK2Rlc2NyaXB0aW9uOgorICBS
YWxpbmsgTVQ3NjIwIHBpbiBjb250cm9sbGVyIGZvciBNVDc2MjAsIE1UNzYyOCBhbmQgTVQ3Njg4
IFNvQ3MuCisgIFRoZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBw
aW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpZHVhbAorICBwaW5zIGlzIG5vdCBzdXBwb3J0ZWQuIFRo
ZXJlIGlzIG5vIHBpbmNvbmYgc3VwcG9ydC4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToK
KyAgICBjb25zdDogcmFsaW5rLG10NzYyMC1waW5jdHJsCisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgor
ICAnLXBpbnMkJzoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBwYXR0ZXJuUHJvcGVydGllczoKKyAg
ICAgICdeKC4qLSk/cGlubXV4JCc6CisgICAgICAgIHR5cGU6IG9iamVjdAorICAgICAgICBkZXNj
cmlwdGlvbjogbm9kZSBmb3IgcGluY3RybC4KKyAgICAgICAgJHJlZjogcGlubXV4LW5vZGUueWFt
bCMKKworICAgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICAgIGdyb3VwczoKKyAgICAgICAgICAg
IGRlc2NyaXB0aW9uOiBUaGUgcGluIGdyb3VwIHRvIHNlbGVjdC4KKyAgICAgICAgICAgIGVudW06
IFsKKyAgICAgICAgICAgICAgIyBGb3IgTVQ3NjIwIFNvQworICAgICAgICAgICAgICBlcGh5LCBp
MmMsIG1kaW8sIG5kX3NkLCBwYSwgcGNpZSwgcmdtaWkxLCByZ21paTIsIHNwaSwgc3BpIHJlZmNs
aywKKyAgICAgICAgICAgICAgdWFydGYsIHVhcnRsaXRlLCB3ZHQsIHdsZWQsCisKKyAgICAgICAg
ICAgICAgIyBGb3IgTVQ3NjI4IGFuZCBNVDc2ODggU29DcworICAgICAgICAgICAgICBncGlvLCBp
MmMsIGkycywgcDBsZWRfYW4sIHAwbGVkX2tuLCBwMWxlZF9hbiwgcDFsZWRfa24sIHAybGVkX2Fu
LAorICAgICAgICAgICAgICBwMmxlZF9rbiwgcDNsZWRfYW4sIHAzbGVkX2tuLCBwNGxlZF9hbiwg
cDRsZWRfa24sIHBlcnN0LCBwd20wLAorICAgICAgICAgICAgICBwd20xLCByZWZjbGssIHNkbW9k
ZSwgc3BpLCBzcGkgY3MxLCBzcGlzLCB1YXJ0MCwgdWFydDEsIHVhcnQyLAorICAgICAgICAgICAg
ICB3ZHQsIHdsZWRfYW4sIHdsZWRfa24sCisgICAgICAgICAgICBdCisKKyAgICAgICAgICBmdW5j
dGlvbjoKKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgbXV4IGZ1bmN0aW9uIHRvIHNlbGVj
dC4KKyAgICAgICAgICAgIGVudW06IFsKKyAgICAgICAgICAgICAgIyBGb3IgTVQ3NjIwIFNvQwor
ICAgICAgICAgICAgICBlcGh5LCBncGlvLCBncGlvIGkycywgZ3BpbyB1YXJ0ZiwgaTJjLCBpMnMg
dWFydGYsIG1kaW8sIG5hbmQsIHBhLAorICAgICAgICAgICAgICBwY2llIHJlZmNsaywgcGNpZSBy
c3QsIHBjbSBncGlvLCBwY20gaTJzLCBwY20gdWFydGYsIHJlZmNsaywKKyAgICAgICAgICAgICAg
cmdtaWkxLCByZ21paTIsIHNkLCBzcGksIHNwaSByZWZjbGssIHVhcnRmLCB1YXJ0bGl0ZSwgd2R0
IHJlZmNsaywKKyAgICAgICAgICAgICAgd2R0IHJzdCwgd2xlZCwKKworICAgICAgICAgICAgICAj
IEZvciBNVDc2MjggYW5kIE1UNzY4OCBTb0NzCisgICAgICAgICAgICAgIGFudGVubmEsIGRlYnVn
LCBncGlvLCBpMmMsIGkycywganRhZywgcDBsZWRfYW4sIHAwbGVkX2tuLAorICAgICAgICAgICAg
ICBwMWxlZF9hbiwgcDFsZWRfa24sIHAybGVkX2FuLCBwMmxlZF9rbiwgcDNsZWRfYW4sIHAzbGVk
X2tuLAorICAgICAgICAgICAgICBwNGxlZF9hbiwgcDRsZWRfa24sIHBjaWUsIHBjbSwgcGVyc3Qs
IHB3bSwgcHdtMCwgcHdtMSwgcHdtX3VhcnQyLAorICAgICAgICAgICAgICByZWZjbGssIHJzdmQs
IHNkeGMsIHNkeGMgZDUgZDQsIHNkeGMgZDYsIHNkeGMgZDcsIHNwaSwgc3BpIGNzMSwKKyAgICAg
ICAgICAgICAgc3Bpcywgc3dfciwgdWFydDAsIHVhcnQxLCB1YXJ0MiwgdXRpZiwgd2R0LCB3bGVk
X2FuLCB3bGVkX2tuLCAtLAorICAgICAgICAgICAgXQorCisgICAgICAgIHJlcXVpcmVkOgorICAg
ICAgICAgIC0gZ3JvdXBzCisgICAgICAgICAgLSBmdW5jdGlvbgorCisgICAgICAgIGFkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQorCisgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisK
K2FsbE9mOgorICAtICRyZWY6ICJwaW5jdHJsLnlhbWwjIgorCityZXF1aXJlZDoKKyAgLSBjb21w
YXRpYmxlCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgIyBQ
aW5tdXggY29udHJvbGxlciBub2RlCisgIC0gfAorICAgIHBpbmN0cmwgeworICAgICAgY29tcGF0
aWJsZSA9ICJyYWxpbmssbXQ3NjIwLXBpbmN0cmwiOworCisgICAgICBpMmNfcGluczogaTJjMC1w
aW5zIHsKKyAgICAgICAgcGlubXV4IHsKKyAgICAgICAgICBncm91cHMgPSAiaTJjIjsKKyAgICAg
ICAgICBmdW5jdGlvbiA9ICJpMmMiOworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OwotLSAK
Mi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
