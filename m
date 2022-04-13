Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4YI3Nkepk0gSCcSjZ1fys3fp7QRNjXaURzuckW3EK0=; b=d6UDxCW7bwflEW
	lTwCV11rN6QjiDTYup49NQrLrktmRfwRXY5uBWZuI/k3w1stkyJJlxliKSM/i9uY3VklWHAll0qt9
	cv4mZx6IR9K/WcrvWi9G3BMqB38STWckY8tdRPuBQULXA5nFMjTRu+Uy6hTIjZv8JF8mtwvqgA9wo
	w+OD/GqUl3m9CxxohbGtv4DRmAR16wUHLnO3tUsP5jm2P6uwgWP2RI6eSCLNoOuenVaIgt2tRSycq
	TvYKtm64kEABBaStEsBa4CaaPwKmWjnIGJ/ND5TPR/m8yo09kg6XbWcenv2jB+Q8iSyyvZ+Ozc6ob
	IZDY2mn8LCJ6+TrIiyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWMw-00H6GC-Iv; Wed, 13 Apr 2022 06:20:46 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBa-00H0wa-OD; Wed, 13 Apr 2022 06:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830134; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=avtSYMatMQJTrvfdxH9tcMztEPmn8u2zb4O7F+3j+jyn7fN+YJ+hUKHj62tjFqaBwVG9RBXaSBPETmVn8m++fw5RabDjKwAzIXW/cHJ7Aemgj1Bwc79/uKU8Dq9MokCsK7DAgL69YYudAc8n1b24ISEiNAUFeoyHWNguyd4iOfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830134;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=vTUK5pF/zz+MqI8xc+MhrlHhkZm8+zGbv4qzWp+bAOE=; 
 b=NhDgpIiMVBktiDlGV/krs0IHM+bqOylp/Al5kOTSrW0I8AbVInNxMNnwjziWm/4PcdUSjFnxZ9Nk0ipfowPLsMBmELrrqdZdSl57zL8INo4GYcpmXNOEowOj4ei21DYJBith5K0Y7dlbeuc/x53A5sl5JeZrx2Xgf8mwPCrdKFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830134; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=vTUK5pF/zz+MqI8xc+MhrlHhkZm8+zGbv4qzWp+bAOE=;
 b=ejk/5EvrqsknZXlaLdvQGYU93zbCdTKVMlIZ4j8DpZkISNRrzojLACKDOitPIi5c
 L06j4w4zK9iwD3VF03Y9CMTmMWY97rHnxPpV43b+Szwce/LmhbrZ66u+L+AD9lhl7NO
 X9NGzPIuZvHT1HFCCnt0/Ftsm6RSh4wzqFg9DJZU=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830132114573.9252729984381;
 Tue, 12 Apr 2022 23:08:52 -0700 (PDT)
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
Subject: [PATCH 14/14] dt-bindings: pinctrl: add binding for Ralink RT3883
 pinctrl
Date: Wed, 13 Apr 2022 09:07:29 +0300
Message-Id: <20220413060729.27639-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230902_998130_D6753D8F 
X-CRM114-Status: GOOD (  12.86  )
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
IDY5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmFsaW5rLHJ0Mzg4My1waW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDM4
ODMtcGluY3RybC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
NTgzZWZjMGFkNTFjCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mzg4My1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw2
OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIFJUMzg4
MyBQaW4gQ29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+CisgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1
ZWxsb3NAZ21haWwuY29tPgorCitkZXNjcmlwdGlvbjoKKyAgUmFsaW5rIFJUMzg4MyBwaW4gY29u
dHJvbGxlciBmb3IgUlQzODgzIFNvQy4KKyAgVGhlIHBpbiBjb250cm9sbGVyIGNhbiBvbmx5IHNl
dCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRpdml1YWwgcGlucworICBpcyBu
b3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQuCisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHJhbGluayxydDM4ODMtcGluY3RybAorCitwYXR0
ZXJuUHJvcGVydGllczoKKyAgJy1waW5zJCc6CisgICAgdHlwZTogb2JqZWN0CisgICAgcGF0dGVy
blByb3BlcnRpZXM6CisgICAgICAnXiguKi0pP3Bpbm11eCQnOgorICAgICAgICB0eXBlOiBvYmpl
Y3QKKyAgICAgICAgZGVzY3JpcHRpb246IG5vZGUgZm9yIHBpbmN0cmwuCisgICAgICAgICRyZWY6
IHBpbm11eC1ub2RlLnlhbWwjCisKKyAgICAgICAgcHJvcGVydGllczoKKyAgICAgICAgICBncm91
cHM6CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIHBpbiBncm91cCB0byBzZWxlY3QuCisg
ICAgICAgICAgICBlbnVtOiBbZ2UxLCBnZTIsIGkyYywganRhZywgbG5hIGEsIGxuYSBnLCBtZGlv
LCBwY2ksIHNwaSwgdWFydGYsIHVhcnRsaXRlXQorCisgICAgICAgICAgZnVuY3Rpb246CisgICAg
ICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxlY3QuCisgICAgICAg
ICAgICBlbnVtOiBbZ2UxLCBnZTIsIGdwaW8sIGdwaW8gaTJzLCBncGlvIHVhcnRmLCBpMmMsIGky
cyB1YXJ0ZiwganRhZywgbG5hIGEsIGxuYSBnLCBtZGlvLCBwY2ktZGV2LAorICAgICAgICAgICAg
ICAgICAgIHBjaS1mbmMsIHBjaS1ob3N0MSwgcGNpLWhvc3QyLCBwY20gZ3BpbywgcGNtIGkycywg
cGNtIHVhcnRmLCBzcGksIHVhcnRmLCB1YXJ0bGl0ZV0KKworICAgICAgICByZXF1aXJlZDoKKyAg
ICAgICAgICAtIGdyb3VwcworICAgICAgICAgIC0gZnVuY3Rpb24KKworICAgICAgICBhZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UKKworICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQor
CithbGxPZjoKKyAgLSAkcmVmOiAicGluY3RybC55YW1sIyIKKworcmVxdWlyZWQ6CisgIC0gY29t
cGF0aWJsZQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgICMg
UGlubXV4IGNvbnRyb2xsZXIgbm9kZQorICAtIHwKKyAgICBwaW5jdHJsIHsKKyAgICAgIGNvbXBh
dGlibGUgPSAicmFsaW5rLHJ0Mzg4My1waW5jdHJsIjsKKworICAgICAgaTJjX3BpbnM6IGkyYzAt
cGlucyB7CisgICAgICAgIHBpbm11eCB7CisgICAgICAgICAgZ3JvdXBzID0gImkyYyI7CisgICAg
ICAgICAgZnVuY3Rpb24gPSAiaTJjIjsKKyAgICAgICAgfTsKKyAgICAgIH07CisgICAgfTsKLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
