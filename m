Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ummbj54yHXNeBYdgAiHgUhCtaYYVUHXpFJUx3S4KcSw=; b=Nb0KuHScSr58u9
	vzTb1soCMoLB+3GTLAIhoRLqn/PtIPgOvimmL6albs65IonDOsiHWavEpo5CzSq4I9Ux1VBbl8015
	vHlUdGKqqrb3rPJc6w4hwNEkPmErwkllFT8jTkBvnQ+m8WBKPpTSuArsAXa2GChhv2CCpJUkgY+PS
	Y9nWekl6EnWq52NWe0A88BfMW1So4doBxWtgcodDDJ2b3nX0YZXOne4cyYUd0K12uj4XrlRk65csZ
	z0aHLSF9H4c3HX6pD0GkhG/puNRcOiapJcUmy/9FYH5eyf4rmH+VB6T7tVA72tt8wQoi0bBBPrhc0
	ezxgIBPTdJmyuXFhP8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Ym-006hI6-EL; Thu, 14 Apr 2022 17:47:12 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SS-006dob-FD; Thu, 14 Apr 2022 17:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958033; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HmBlFh49I5d+3fOI1GKxvLytOXmNgP1fBtydOZs8BNrN8me3t1ryRdFPFHLrLVmfb5iQxqKRXGpUJf1Ct/2/5nsknrW9AxoHKJXcIc3UBaKPF6I0OyQZ26yWhSpuS5ipKmJpM11IyWest+q5bg9ycX6RlsGNI5gtnq48Z9RwnII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958033;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=6WorpwNzRGvitFn8B8dTme9JwnssgeQFz9v0cURTiC8=; 
 b=C6fADviAfg4UclzJnIwrrgchvrT1Rn2gzuUzcE8WdZUzWVlvJ7cwEyu36FxDtJ9T22pPG+y+vkloBNxzvV4YNBDQ+1sycRhE2SXPw+TLKcHmzzhpOkaYB0y3UkpTLabYEe7sZCN3giSQOpYSnIZ8LXkB5A3wrG0dvQSPqMTNDPE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958033; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=6WorpwNzRGvitFn8B8dTme9JwnssgeQFz9v0cURTiC8=;
 b=Bh6yL6OHatcspOpXw2TZiHB0ITqcWhOFQoqPzeb4fixH1Abz+48ChkV15yQVbhR0
 Ubt2hMWV2bPDrY854+YQrXqDx+2N91LEBtlTjOVXrLCUnHSNKSVcCr/02RiHTKrljNi
 epawh+Ch135EdrAAdWxEV7iYCB5roms9sUd5FZzg=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958032683220.010621040307;
 Thu, 14 Apr 2022 10:40:32 -0700 (PDT)
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
Subject: [PATCH v2 13/14] dt-bindings: pinctrl: add binding for Ralink RT305X
 pinctrl
Date: Thu, 14 Apr 2022 20:39:15 +0300
Message-Id: <20220414173916.5552-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104040_567770_A28E5CEA 
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgUlQzMDVYIHBpbiBjb250cm9sbGVyIGZvciBSVDMw
NTAsIFJUMzA1MiwKUlQzMzUwLCBSVDMzNTIgYW5kIFJUNTM1MCBTb0NzLgoKU2lnbmVkLW9mZi1i
eTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgotLS0KIC4uLi9waW5jdHJs
L3JhbGluayxydDMwNXgtcGluY3RybC55YW1sICAgICAgICB8IDkyICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0MzA1eC1w
aW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9yYWxpbmsscnQzMDV4LXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1sCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDI1NDAxYzU0MjY5Ci0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFs
aW5rLHJ0MzA1eC1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw5MiBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9yYWxpbmsscnQzMDV4
LXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIFJUMzA1WCBQaW4gQ29udHJvbGxlcgorCitt
YWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cisg
IC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgorCitk
ZXNjcmlwdGlvbjoKKyAgUmFsaW5rIFJUMzA1WCBwaW4gY29udHJvbGxlciBmb3IgUlQzMDUwLCBS
VDMwNTIsIFJUMzM1MCwgUlQzMzUyIGFuZCBSVDUzNTAKKyAgU29Dcy4KKyAgVGhlIHBpbiBjb250
cm9sbGVyIGNhbiBvbmx5IHNldCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRp
dmlkdWFsCisgIHBpbnMgaXMgbm90IHN1cHBvcnRlZC4gVGhlcmUgaXMgbm8gcGluY29uZiBzdXBw
b3J0LgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiByYWxpbmsscnQz
MDV4LXBpbmN0cmwKKworcGF0dGVyblByb3BlcnRpZXM6CisgICctcGlucyQnOgorICAgIHR5cGU6
IG9iamVjdAorICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgorICAgICAgJ14oLiotKT9waW5tdXgkJzoK
KyAgICAgICAgdHlwZTogb2JqZWN0CisgICAgICAgIGRlc2NyaXB0aW9uOiBub2RlIGZvciBwaW5j
dHJsLgorICAgICAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIworCisgICAgICAgIHByb3BlcnRp
ZXM6CisgICAgICAgICAgZ3JvdXBzOgorICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4g
Z3JvdXAgdG8gc2VsZWN0LgorICAgICAgICAgICAgZW51bTogWworICAgICAgICAgICAgICAjIEZv
ciBSVDMwNTAsIFJUMzA1MiBhbmQgUlQzMzUwIFNvQ3MKKyAgICAgICAgICAgICAgaTJjLCBqdGFn
LCBtZGlvLCByZ21paSwgc2RyYW0sIHNwaSwgdWFydGYsIHVhcnRsaXRlLAorCisgICAgICAgICAg
ICAgICMgRm9yIFJUMzM1MiBTb0MKKyAgICAgICAgICAgICAgaTJjLCBqdGFnLCBsZWQsIGxuYSwg
bWRpbywgcGEsIHJnbWlpLCBzcGksIHNwaV9jczEsIHVhcnRmLAorICAgICAgICAgICAgICB1YXJ0
bGl0ZSwKKworICAgICAgICAgICAgICAjIEZvciBSVDUzNTAgU29DCisgICAgICAgICAgICAgIGky
YywganRhZywgbGVkLCBzcGksIHNwaV9jczEsIHVhcnRmLCB1YXJ0bGl0ZSwKKyAgICAgICAgICAg
IF0KKworICAgICAgICAgIGZ1bmN0aW9uOgorICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBt
dXggZnVuY3Rpb24gdG8gc2VsZWN0LgorICAgICAgICAgICAgZW51bTogWworICAgICAgICAgICAg
ICAjIEZvciBSVDMwNTAsIFJUMzA1MiBhbmQgUlQzMzUwIFNvQ3MKKyAgICAgICAgICAgICAgZ3Bp
bywgZ3BpbyBpMnMsIGdwaW8gdWFydGYsIGkyYywgaTJzIHVhcnRmLCBqdGFnLCBtZGlvLCBwY20g
Z3BpbywKKyAgICAgICAgICAgICAgcGNtIGkycywgcGNtIHVhcnRmLCByZ21paSwgc2RyYW0sIHNw
aSwgdWFydGYsIHVhcnRsaXRlLAorCisgICAgICAgICAgICAgICMgRm9yIFJUMzM1MiBTb0MKKyAg
ICAgICAgICAgICAgZ3BpbywgZ3BpbyBpMnMsIGdwaW8gdWFydGYsIGkyYywgaTJzIHVhcnRmLCBq
dGFnLCBsZWQsIGxuYSwgbWRpbywKKyAgICAgICAgICAgICAgcGEsIHBjbSBncGlvLCBwY20gaTJz
LCBwY20gdWFydGYsIHJnbWlpLCBzcGksIHNwaV9jczEsIHVhcnRmLAorICAgICAgICAgICAgICB1
YXJ0bGl0ZSwgd2RnX2NzMSwKKworICAgICAgICAgICAgICAjIEZvciBSVDUzNTAgU29DCisgICAg
ICAgICAgICAgIGdwaW8sIGdwaW8gaTJzLCBncGlvIHVhcnRmLCBpMmMsIGkycyB1YXJ0ZiwganRh
ZywgbGVkLCBwY20gZ3BpbywKKyAgICAgICAgICAgICAgcGNtIGkycywgcGNtIHVhcnRmLCBzcGks
IHNwaV9jczEsIHVhcnRmLCB1YXJ0bGl0ZSwgd2RnX2NzMSwKKyAgICAgICAgICAgIF0KKworICAg
ICAgICByZXF1aXJlZDoKKyAgICAgICAgICAtIGdyb3VwcworICAgICAgICAgIC0gZnVuY3Rpb24K
KworICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQorCithbGxPZjoKKyAgLSAkcmVmOiAicGluY3RybC55YW1sIyIKKwor
cmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KworZXhhbXBsZXM6CisgICMgUGlubXV4IGNvbnRyb2xsZXIgbm9kZQorICAtIHwKKyAgICBwaW5j
dHJsIHsKKyAgICAgIGNvbXBhdGlibGUgPSAicmFsaW5rLHJ0MzA1eC1waW5jdHJsIjsKKworICAg
ICAgaTJjX3BpbnM6IGkyYzAtcGlucyB7CisgICAgICAgIHBpbm11eCB7CisgICAgICAgICAgZ3Jv
dXBzID0gImkyYyI7CisgICAgICAgICAgZnVuY3Rpb24gPSAiaTJjIjsKKyAgICAgICAgfTsKKyAg
ICAgIH07CisgICAgfTsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
