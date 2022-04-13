Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjZRJhzzk/W3+Q4mK1YeVG6NSzAvNcyC7NCGJAidqX4=; b=vmf0QeSdMB4ERS
	n/WvFjMabORd1JWMbwC2vIs9xQ1zGPgqWqv06MiHarkQHqNSuoVs7SWgz1lm8gedjj7vcTCweTa6i
	m4kNEMQWABluORhoXwPpIB5B+doVQpCaLiWS2hElxENnqDlzPIFqviF/Fm230eoa1k8vPPAoj17AG
	iEMFQLRp/2IZeE4WOP3itMMFk/0WRShodt49vOFd+qxKZd2JrOaj9Au/VxtpoTwoZTTyaPm7aYAtP
	wHpHhOBGoMcra2aBie71WhB1up+pNqo1YGc8DnLZodLxCzXUNB9pe/XHviWM/1tAYaMV5TJZTTv7D
	EajzWTkwPylwM32BiJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWJD-00H4cf-AB; Wed, 13 Apr 2022 06:16:55 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBJ-00H0ou-Dw; Wed, 13 Apr 2022 06:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830117; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BiUbEUIHXIRrZXDGJfUo+W4AjUSABlHdBC7OBng3VUCiSKZKDU6D3TBYmK8fqDSvJrvfnps5ofUkU9TaeGrksgD7v/eO4s+fz7FpK2v8w4OKJc1vl+HXL3qDajtZ7DhmNf5xI+OgVun7wYbhHjfIBB9XQA0sy55nNqmXgIjiDwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830117;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Z9OI2iyoJdnz5EmsHXut+vIwbquSFmvba6kvk2HobWI=; 
 b=XTAzbS+8EZ8Bu6v0dMvLdTZquGM/yeCJD8xPa1T13ihP2I5MjcU0D9IWlc8mjroyOfkL3TKEFwrx04FtVEGLsWGCyHOpXsRSD83gIukhLzyGnF21+OzYgDmuvVeOz9Mc+abZ3aogZI2PZteuDgIXFHQBJM+Khe+KZBdNw2yhscI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830117; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=Z9OI2iyoJdnz5EmsHXut+vIwbquSFmvba6kvk2HobWI=;
 b=W+1HVaE9dKQqi+fuU/u3fF9/R9Php3FUcYw1ol2/wyrno4+bIZuccws0yocO+Avr
 w/2b8LTjVgDim9Zfa3KWx9IboSBD2zXDmpqcFptQ56ebepqpAl47173EUjomnjsEsoV
 ZxiLT78Vkv1zvawFFrMCkcHkutUVAFMnWJ5nQAQA=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830115843597.8661474284708;
 Tue, 12 Apr 2022 23:08:35 -0700 (PDT)
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
Subject: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name,
 pin groups and functions
Date: Wed, 13 Apr 2022 09:07:25 +0300
Message-Id: <20220413060729.27639-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230845_609066_9BE4C446 
X-CRM114-Status: UNSURE (   9.86  )
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

Q2hhbmdlIGJpbmRpbmcgbmFtZSBmcm9tIHJhbGluayxydDI4ODAtcGlubXV4IHRvIHJhbGluayxy
dDI4ODAtcGluY3RybC4KVGhpcyBpcyB0aGUgYmluZGluZyBmb3IgdGhlIFJhbGluayBSVDI4ODAg
cGluY3RybCBzdWJkcml2ZXIuCgpDdXJyZW50IHBpbiBncm91cCBhbmQgZnVuY3Rpb24gYmluZGlu
Z3MgYXJlIGZvciBNVDc2MjEuIFB1dCBiaW5kaW5ncyBmb3IKUlQyODgwIGluc3RlYWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogLi4u
cGlubXV4LnlhbWwgPT4gcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWx9IHwgMjQgKysrKysrKysr
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQogcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3ty
YWxpbmsscnQyODgwLXBpbm11eC55YW1sID0+IHJhbGluayxydDI4ODAtcGluY3RybC55YW1sfSAo
NTYlKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbApzaW1pbGFyaXR5IGlu
ZGV4IDU2JQpyZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1sCnJlbmFtZSB0byBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbAppbmRl
eCA5ZGU4YjBjMDc1ZTIuLmM2NTdiYmY5ZmRkYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5tdXgueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgw
LXBpbmN0cmwueWFtbApAQCAtMSwyMSArMSwyMyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQogJVlBTUwgMS4yCiAtLS0KLSRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55
YW1sIworJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxy
dDI4ODAtcGluY3RybC55YW1sIwogJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCiAKLXRpdGxlOiBSYWxpbmsgcnQyODgwIHBpbm11eCBjb250cm9s
bGVyCit0aXRsZTogUmFsaW5rIFJUMjg4MCBQaW4gQ29udHJvbGxlcgogCiBtYWludGFpbmVyczoK
KyAgLSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+CiAgIC0gU2VyZ2lvIFBh
cmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgogCiBkZXNjcmlwdGlvbjoK
LSAgVGhlIHJ0Mjg4MCBwaW5tdXggY2FuIG9ubHkgc2V0IHRoZSBtdXhpbmcgb2YgcGluIGdyb3Vw
cy4gTXV4aW5nIGluZGl2aXVhbCBwaW5zCisgIFJhbGluayBSVDI4ODAgcGluIGNvbnRyb2xsZXIg
Zm9yIFJUMjg4MCBTb0MuCisgIFRoZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhlIG11
eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKICAgaXMgbm90IHN1cHBv
cnRlZC4gVGhlcmUgaXMgbm8gcGluY29uZiBzdXBwb3J0LgogCiBwcm9wZXJ0aWVzOgogICBjb21w
YXRpYmxlOgotICAgIGNvbnN0OiByYWxpbmsscnQyODgwLXBpbm11eAorICAgIGNvbnN0OiByYWxp
bmsscnQyODgwLXBpbmN0cmwKIAogcGF0dGVyblByb3BlcnRpZXM6CiAgICctcGlucyQnOgpAQCAt
MjgsMTQgKzMwLDEyIEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogCiAgICAgICAgIHByb3BlcnRpZXM6
CiAgICAgICAgICAgZ3JvdXBzOgotICAgICAgICAgICAgZGVzY3JpcHRpb246IE5hbWUgb2YgdGhl
IHBpbiBncm91cCB0byB1c2UgZm9yIHRoZSBmdW5jdGlvbnMuCi0gICAgICAgICAgICBlbnVtOiBb
aTJjLCBqdGFnLCBtZGlvLCBwY2llLCByZ21paTEsIHJnbWlpMiwgc2RoY2ksIHNwaSwKLSAgICAg
ICAgICAgICAgICAgICB1YXJ0MSwgdWFydDIsIHVhcnQzLCB3ZHRdCisgICAgICAgICAgICBkZXNj
cmlwdGlvbjogVGhlIHBpbiBncm91cCB0byBzZWxlY3QuCisgICAgICAgICAgICBlbnVtOiBbaTJj
LCBzcGksIHVhcnRsaXRlLCBqdGFnLCBtZGlvLCBzZHJhbSwgcGNpXQorCiAgICAgICAgICAgZnVu
Y3Rpb246Ci0gICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxl
Y3QKLSAgICAgICAgICAgIGVudW06IFtncGlvLCBpMmMsIGkycywganRhZywgbWRpbywgbmFuZDEs
IG5hbmQyLCBwY2llIHJlZmNsaywKLSAgICAgICAgICAgICAgICAgICBwY2llIHJzdCwgcGNtLCBy
Z21paTEsIHJnbWlpMiwgc2RoY2ksIHNwZGlmMiwgc3BkaWYzLAotICAgICAgICAgICAgICAgICAg
IHNwaSwgdWFydDEsIHVhcnQyLCB1YXJ0Mywgd2R0IHJlZmNsaywgd2R0IHJzdF0KKyAgICAgICAg
ICAgIGRlc2NyaXB0aW9uOiBUaGUgbXV4IGZ1bmN0aW9uIHRvIHNlbGVjdC4KKyAgICAgICAgICAg
IGVudW06IFtncGlvLCBpMmMsIHNwaSwgdWFydGxpdGUsIGp0YWcsIG1kaW8sIHNkcmFtLCBwY2ld
CiAKICAgICAgICAgcmVxdWlyZWQ6CiAgICAgICAgICAgLSBncm91cHMKQEAgLTU3LDcgKzU3LDcg
QEAgZXhhbXBsZXM6CiAgICMgUGlubXV4IGNvbnRyb2xsZXIgbm9kZQogICAtIHwKICAgICBwaW5j
dHJsIHsKLSAgICAgIGNvbXBhdGlibGUgPSAicmFsaW5rLHJ0Mjg4MC1waW5tdXgiOworICAgICAg
Y29tcGF0aWJsZSA9ICJyYWxpbmsscnQyODgwLXBpbmN0cmwiOwogCiAgICAgICBpMmNfcGluczog
aTJjMC1waW5zIHsKICAgICAgICAgcGlubXV4IHsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
