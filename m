Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA43C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2EnYmPGY0peJ9gFaF0fVsKaAMpsV0cBWAliQRS3UnA=; b=4EGCVYFWWSCXkm
	RFOJy9fJVyQWLra2pdXbVoQyRVycl/qw0TKEfIty1yl9dSSur1CueFdnbmM2SeZ1NkLKxIOFZhUvI
	NRdzjrtiLtpC7l04kA/h0YgPYfR7dszOASjOxPAAhDBc/EoiBFo5eJf3VTy7pVuB59CLyfy69/pk0
	H+aw/mROf5LBAWn9g2FYbPe/8uBvx4ZR2EM33J3edUA5Cbp6pp4tSqqsgsUEbDzd3nhURK5eKnuAZ
	1Xk5GM2cLs31XCwKhZsVKH0g5+ui1TdW9IiFphfGPbLEs8r74K8lFhmhAB4XXA3WswHNwtixxs2nl
	JTK8sjPJHghI6pX1uzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsEc-005VWo-S5; Tue, 19 Apr 2022 18:05:54 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsEQ-005VSs-AX; Tue, 19 Apr 2022 18:05:43 +0000
Received: by mail-oi1-f182.google.com with SMTP id a10so1526117oif.9;
 Tue, 19 Apr 2022 11:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1O+KyyhxbKVGh/D16i1ET31wxfeZw0J9Z5ULpq64bTk=;
 b=n4IwjzGCUgvel4hv+SbbH1gxV0mh3SveHhKoTxMOiuifxkewA23ErScvLRz1y63FAV
 QdpjuHIG7F2rymcLhIbLOZcpuEBMAg9S5AcuXpZxqY5DOkbioCxRh8R/AjeZczQ4+WUq
 xynU9MOrFeSio+dvQNYjtrLPVmoUUbAC4AP5nCBxOnj811Qe4cuNDaOQ4TMUnkI61bBf
 zZJpSqLI74K0+6Ci3NHNdwwGz7rPD+fiX0gNEnbYBZJoTb5a9/CuuZfclDUCr6lr2yGd
 1ENX7N9JKuCwxpD6nX7gumbobCMITaoLkJSo+eTXZvbNKgeNlIM+FIPpTS7FyqzoFJDf
 ELwA==
X-Gm-Message-State: AOAM533kvQMziXNdGVGHmeSvCLjMKGicQb+e/GK+uQ037yd0XtupQY05
 Nyq8gbVSOv65Au7ZlWFdyw==
X-Google-Smtp-Source: ABdhPJzFDWZidT+kxj6ha1sr2oIoRXGgkoEbccfVw9/gVPmUJO5HKTGUHtPk1/R9599eDC8/tUF0eg==
X-Received: by 2002:a05:6808:2ce:b0:2f7:2327:5205 with SMTP id
 a14-20020a05680802ce00b002f723275205mr10426857oid.289.1650391540040; 
 Tue, 19 Apr 2022 11:05:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j5-20020a4a7505000000b0033a47bb6a74sm948330ooc.47.2022.04.19.11.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:05:39 -0700 (PDT)
Received: (nullmailer pid 3069490 invoked by uid 1000);
 Tue, 19 Apr 2022 18:05:38 -0000
Date: Tue, 19 Apr 2022 13:05:38 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>,
 erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 13/14] dt-bindings: pinctrl: add binding for Ralink
 RT305X pinctrl
Message-ID: <Yl758u9iIMnhYPz2@robh.at.kernel.org>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-14-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173916.5552-14-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_110542_408959_7704D284 
X-CRM114-Status: GOOD (  19.84  )
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

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDg6Mzk6MTVQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBBZGQgYmluZGluZyBmb3IgdGhlIFJhbGluayBSVDMwNVggcGluIGNvbnRyb2xsZXIg
Zm9yIFJUMzA1MCwgUlQzMDUyLAo+IFJUMzM1MCwgUlQzMzUyIGFuZCBSVDUzNTAgU29Dcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4g
LS0tCj4gIC4uLi9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1sICAgICAgICB8IDky
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3Ry
bC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5r
LHJ0MzA1eC1waW5jdHJsLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNDI1NDAxYzU0MjY5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1s
Cj4gQEAgLTAsMCArMSw5MiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1s
Iwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPiArCj4gK3RpdGxlOiBSYWxpbmsgUlQzMDVYIFBpbiBDb250cm9sbGVyCj4gKwo+ICttYWlu
dGFpbmVyczoKPiArICAtIEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPiAr
ICAtIFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KPiAr
Cj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFJhbGluayBSVDMwNVggcGluIGNvbnRyb2xsZXIgZm9yIFJU
MzA1MCwgUlQzMDUyLCBSVDMzNTAsIFJUMzM1MiBhbmQgUlQ1MzUwCj4gKyAgU29Dcy4KPiArICBU
aGUgcGluIGNvbnRyb2xsZXIgY2FuIG9ubHkgc2V0IHRoZSBtdXhpbmcgb2YgcGluIGdyb3Vwcy4g
TXV4aW5nIGluZGl2aWR1YWwKPiArICBwaW5zIGlzIG5vdCBzdXBwb3J0ZWQuIFRoZXJlIGlzIG5v
IHBpbmNvbmYgc3VwcG9ydC4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiAr
ICAgIGNvbnN0OiByYWxpbmsscnQzMDV4LXBpbmN0cmwKCllvdSBzaG91bGQgaGF2ZSBhIGNvbXBh
dGlibGUgZm9yIGVhY2ggU29DIHVubGVzcyB0aGVzZSBhcmUgYWxsIGp1c3QgCmZ1c2VkIG9yIHBh
Y2thZ2UgdmFyaWVudHMgb2YgdGhlIHNhbWUgY2hpcC4KCj4gKwo+ICtwYXR0ZXJuUHJvcGVydGll
czoKPiArICAnLXBpbnMkJzoKPiArICAgIHR5cGU6IG9iamVjdAo+ICsgICAgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gKyAgICAgICdeKC4qLSk/cGlubXV4JCc6Cj4gKyAgICAgICAgdHlwZTogb2JqZWN0
Cj4gKyAgICAgICAgZGVzY3JpcHRpb246IG5vZGUgZm9yIHBpbmN0cmwuCj4gKyAgICAgICAgJHJl
ZjogcGlubXV4LW5vZGUueWFtbCMKPiArCj4gKyAgICAgICAgcHJvcGVydGllczoKPiArICAgICAg
ICAgIGdyb3VwczoKPiArICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4gZ3JvdXAgdG8g
c2VsZWN0Lgo+ICsgICAgICAgICAgICBlbnVtOiBbCj4gKyAgICAgICAgICAgICAgIyBGb3IgUlQz
MDUwLCBSVDMwNTIgYW5kIFJUMzM1MCBTb0NzCj4gKyAgICAgICAgICAgICAgaTJjLCBqdGFnLCBt
ZGlvLCByZ21paSwgc2RyYW0sIHNwaSwgdWFydGYsIHVhcnRsaXRlLAo+ICsKPiArICAgICAgICAg
ICAgICAjIEZvciBSVDMzNTIgU29DCj4gKyAgICAgICAgICAgICAgaTJjLCBqdGFnLCBsZWQsIGxu
YSwgbWRpbywgcGEsIHJnbWlpLCBzcGksIHNwaV9jczEsIHVhcnRmLAo+ICsgICAgICAgICAgICAg
IHVhcnRsaXRlLAo+ICsKPiArICAgICAgICAgICAgICAjIEZvciBSVDUzNTAgU29DCj4gKyAgICAg
ICAgICAgICAgaTJjLCBqdGFnLCBsZWQsIHNwaSwgc3BpX2NzMSwgdWFydGYsIHVhcnRsaXRlLAo+
ICsgICAgICAgICAgICBdCj4gKwo+ICsgICAgICAgICAgZnVuY3Rpb246Cj4gKyAgICAgICAgICAg
IGRlc2NyaXB0aW9uOiBUaGUgbXV4IGZ1bmN0aW9uIHRvIHNlbGVjdC4KPiArICAgICAgICAgICAg
ZW51bTogWwo+ICsgICAgICAgICAgICAgICMgRm9yIFJUMzA1MCwgUlQzMDUyIGFuZCBSVDMzNTAg
U29Dcwo+ICsgICAgICAgICAgICAgIGdwaW8sIGdwaW8gaTJzLCBncGlvIHVhcnRmLCBpMmMsIGky
cyB1YXJ0ZiwganRhZywgbWRpbywgcGNtIGdwaW8sCj4gKyAgICAgICAgICAgICAgcGNtIGkycywg
cGNtIHVhcnRmLCByZ21paSwgc2RyYW0sIHNwaSwgdWFydGYsIHVhcnRsaXRlLAo+ICsKPiArICAg
ICAgICAgICAgICAjIEZvciBSVDMzNTIgU29DCj4gKyAgICAgICAgICAgICAgZ3BpbywgZ3BpbyBp
MnMsIGdwaW8gdWFydGYsIGkyYywgaTJzIHVhcnRmLCBqdGFnLCBsZWQsIGxuYSwgbWRpbywKPiAr
ICAgICAgICAgICAgICBwYSwgcGNtIGdwaW8sIHBjbSBpMnMsIHBjbSB1YXJ0ZiwgcmdtaWksIHNw
aSwgc3BpX2NzMSwgdWFydGYsCj4gKyAgICAgICAgICAgICAgdWFydGxpdGUsIHdkZ19jczEsCj4g
Kwo+ICsgICAgICAgICAgICAgICMgRm9yIFJUNTM1MCBTb0MKPiArICAgICAgICAgICAgICBncGlv
LCBncGlvIGkycywgZ3BpbyB1YXJ0ZiwgaTJjLCBpMnMgdWFydGYsIGp0YWcsIGxlZCwgcGNtIGdw
aW8sCj4gKyAgICAgICAgICAgICAgcGNtIGkycywgcGNtIHVhcnRmLCBzcGksIHNwaV9jczEsIHVh
cnRmLCB1YXJ0bGl0ZSwgd2RnX2NzMSwKPiArICAgICAgICAgICAgXQo+ICsKPiArICAgICAgICBy
ZXF1aXJlZDoKPiArICAgICAgICAgIC0gZ3JvdXBzCj4gKyAgICAgICAgICAtIGZ1bmN0aW9uCj4g
Kwo+ICsgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArICAgIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAicGluY3Ry
bC55YW1sIyIKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsKPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAjIFBpbm11eCBjb250
cm9sbGVyIG5vZGUKPiArICAtIHwKPiArICAgIHBpbmN0cmwgewo+ICsgICAgICBjb21wYXRpYmxl
ID0gInJhbGluayxydDMwNXgtcGluY3RybCI7Cj4gKwo+ICsgICAgICBpMmNfcGluczogaTJjMC1w
aW5zIHsKPiArICAgICAgICBwaW5tdXggewo+ICsgICAgICAgICAgZ3JvdXBzID0gImkyYyI7Cj4g
KyAgICAgICAgICBmdW5jdGlvbiA9ICJpMmMiOwo+ICsgICAgICAgIH07Cj4gKyAgICAgIH07Cj4g
KyAgICB9Owo+IC0tIAo+IDIuMjUuMQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
