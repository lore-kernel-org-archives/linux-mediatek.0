Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdaWoRmHr6HKQFlSI0h+RuqZGAg95iY7JXRTRT0g6R4=; b=rBX3fJcVYOy+Mn
	DgfCzh8w5gGTJXMJd4U54dbANh0Qj34Z0dldJ/jxYomENkzLblSi8ruC8rk8i4ef91cKyVxRsZHLh
	5IOuy+8e9oLRSbaEhwfcus3XWyT4foS8pf9bTT/4z9+/n1rsYF5dRv3QpNf7BfzsEoVcUdPLoLFJY
	z3zkjZNHa6Veao2ELx9F9Btyi/5UR+CHZYOFtlgDNC8q1r/IZoVKQmd6CH+QBDc3TZfg/NC62bAgF
	azHIafUPJuw4Mzd/kqcC5Fvpj+6AmHbjZP8BgUz/uFoiQQw6ze/Yet3CG1F5ugPONwsAbm3QgGJa1
	jbMD1uMifSBBsRbG2Ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Zc-006hgU-9G; Thu, 14 Apr 2022 17:48:04 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SY-006dtZ-5a; Thu, 14 Apr 2022 17:40:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958037; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=joc2zAh9PnYoF6a3Fpj18fCOK4TGDnIhxildQ4C1cnbiq7AGRMfWP9qkuOdCwnImjqS7nCuC/3bz/wCrtTZd4dJiIXAskG2SNlTjtGXR6jY+02xHHwVUXxaAYVukvydl4R3uN7XS/fypsYRkVyTvu4+YPRS6zAGCNySC+Qu5jRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958037;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=rffJtQeH1wfjiUy7isMajL4hWPrAoIiKaMOQgFEbJNU=; 
 b=M/zCJuaOGJN1Vm8m1yts/WAOpd+Jq1+O0TIoD9LBNBhwW/DWVazpA8gVrYBtiMJNN/bpiJ6/Gw1MyNrDqbSrV6DclvSGp9/jwcu8Cl7VwXn/QOxK/NM+dkhe+ZZhJ3gjm1TYv+7lBT+f0ENomHyVUqRfU39XeQtdbSA1HnHGAw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958037; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=rffJtQeH1wfjiUy7isMajL4hWPrAoIiKaMOQgFEbJNU=;
 b=caHMaWu3G8Ofzf70Fdijp0G0038JQoum2KD4GkZKn5sG1ZsvGPvdan402XdMvFsu
 GPAt5ZC0uLV9MEZZ9X87/9rXNjER43/EhRVJ8iz7dhTdlRjy1s9FZmEV8Y8dZQy54rt
 RveQgWTQru6PxpGuVA0PLA8aN9mYj35fbzKY8bE0=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958036757805.531660630592;
 Thu, 14 Apr 2022 10:40:36 -0700 (PDT)
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
Subject: [PATCH v2 14/14] dt-bindings: pinctrl: add binding for Ralink RT3883
 pinctrl
Date: Thu, 14 Apr 2022 20:39:16 +0300
Message-Id: <20220414173916.5552-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104046_318548_1D842C12 
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgUlQzODgzIHBpbiBjb250cm9sbGVyIGZvciBSVDM4
ODMgU29DLgoKU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzku
Y29tPgotLS0KIC4uLi9waW5jdHJsL3JhbGluayxydDM4ODMtcGluY3RybC55YW1sICAgICAgICB8
IDcxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmFsaW5rLHJ0Mzg4My1waW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDM4
ODMtcGluY3RybC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
ZmViNmU2NmRjYjYxCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mzg4My1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw3
MSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIFJUMzg4
MyBQaW4gQ29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+CisgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1
ZWxsb3NAZ21haWwuY29tPgorCitkZXNjcmlwdGlvbjoKKyAgUmFsaW5rIFJUMzg4MyBwaW4gY29u
dHJvbGxlciBmb3IgUlQzODgzIFNvQy4KKyAgVGhlIHBpbiBjb250cm9sbGVyIGNhbiBvbmx5IHNl
dCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRpdmlkdWFsCisgIHBpbnMgaXMg
bm90IHN1cHBvcnRlZC4gVGhlcmUgaXMgbm8gcGluY29uZiBzdXBwb3J0LgorCitwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiByYWxpbmsscnQzODgzLXBpbmN0cmwKKworcGF0
dGVyblByb3BlcnRpZXM6CisgICctcGlucyQnOgorICAgIHR5cGU6IG9iamVjdAorICAgIHBhdHRl
cm5Qcm9wZXJ0aWVzOgorICAgICAgJ14oLiotKT9waW5tdXgkJzoKKyAgICAgICAgdHlwZTogb2Jq
ZWN0CisgICAgICAgIGRlc2NyaXB0aW9uOiBub2RlIGZvciBwaW5jdHJsLgorICAgICAgICAkcmVm
OiBwaW5tdXgtbm9kZS55YW1sIworCisgICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgZ3Jv
dXBzOgorICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4gZ3JvdXAgdG8gc2VsZWN0Lgor
ICAgICAgICAgICAgZW51bTogW2dlMSwgZ2UyLCBpMmMsIGp0YWcsIGxuYSBhLCBsbmEgZywgbWRp
bywgcGNpLCBzcGksIHVhcnRmLAorICAgICAgICAgICAgICAgICAgIHVhcnRsaXRlXQorCisgICAg
ICAgICAgZnVuY3Rpb246CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlv
biB0byBzZWxlY3QuCisgICAgICAgICAgICBlbnVtOiBbZ2UxLCBnZTIsIGdwaW8sIGdwaW8gaTJz
LCBncGlvIHVhcnRmLCBpMmMsIGkycyB1YXJ0ZiwganRhZywKKyAgICAgICAgICAgICAgICAgICBs
bmEgYSwgbG5hIGcsIG1kaW8sIHBjaS1kZXYsIHBjaS1mbmMsIHBjaS1ob3N0MSwgcGNpLWhvc3Qy
LAorICAgICAgICAgICAgICAgICAgIHBjbSBncGlvLCBwY20gaTJzLCBwY20gdWFydGYsIHNwaSwg
dWFydGYsIHVhcnRsaXRlXQorCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgIC0gZ3JvdXBz
CisgICAgICAgICAgLSBmdW5jdGlvbgorCisgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQorCisgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2FsbE9mOgorICAtICRy
ZWY6ICJwaW5jdHJsLnlhbWwjIgorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisKK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgIyBQaW5tdXggY29udHJvbGxl
ciBub2RlCisgIC0gfAorICAgIHBpbmN0cmwgeworICAgICAgY29tcGF0aWJsZSA9ICJyYWxpbmss
cnQzODgzLXBpbmN0cmwiOworCisgICAgICBpMmNfcGluczogaTJjMC1waW5zIHsKKyAgICAgICAg
cGlubXV4IHsKKyAgICAgICAgICBncm91cHMgPSAiaTJjIjsKKyAgICAgICAgICBmdW5jdGlvbiA9
ICJpMmMiOworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OwotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
