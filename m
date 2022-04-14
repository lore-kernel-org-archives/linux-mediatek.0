Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C16C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kj096UzypWdufbVQDWBau/euPSGzhZDxtFpxC5rVKtA=; b=XEUaDLOktO+j0+
	JUCgdTSDDasc3WjHlxnkLMgTZdNXD6qEU3eSTqnpRHEFE5+MJFMqplCAVPvb9uagOF/IELsQAXCbQ
	KO77XpaOh7ntoOLDfppLbN4qnyPZQLoOTmXSVSr5LTy8vOZHcAQ8d4qjg6288rD0ewsgWH8pH2Jc3
	pVKpiDSLrBuAmMnwP+z5Idzg64TJDnW69zGcFYo7Z4X/eg4A3LdumBVqxVa09ZIzhDhYSBJFqktxj
	DJiJYscMxqYwxrabDEVNxswNvOUzI+rv3rpahmtojDwmbvQKU6o+bnFrcQMEW5yo3k+W0HbKC0GAl
	pdnmtSY0ghNnYlFLVWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf2AQ-006PLv-R5; Thu, 14 Apr 2022 16:17:58 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf2A0-006PAr-UM; Thu, 14 Apr 2022 16:17:35 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 g16-20020a9d6b10000000b00601ded2a06fso646139otp.6; 
 Thu, 14 Apr 2022 09:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+dYyu7y5UVTMexCQcf0EtUHGOdwuv57lNmgQ07q4u5Y=;
 b=s+MBFxAR1PYGj1+3n2vm0UIKA7nfFOmW3vU3U1k2Ac1LGtOSgzyRuGkZxdNQL6nItd
 44GseUhsNXxc25RrmJpAIA56hEiAO4AXI1WJ96eMz98ErPcXdZhJ+VviYgd/skschZR7
 0pCCiaZ4CNUqKGPTv4+4utNdIieC8LPNu+WxUqeaakbM4copPALDIu8V1MI9SMfVjc8V
 8w9IYa8uMpPHG0ZIQdcO2D3IYtcCZnuYfQ2sKYpf0ClE+G6lfJEPHjCEoefXxK8CqIvn
 /ziIhdvXJz1Z6UBQr863AevBiJ55L4Fd8JEP/HifMM4dPqqBjepdUyvt9/DxsHkVBfXI
 Am/A==
X-Gm-Message-State: AOAM532M7/M19Y336mfJLs9jF0BNJD/fh7mj8SO7axypAAklY1QZEUfs
 0bUt50RmzeTVnNVHs+gv8w==
X-Google-Smtp-Source: ABdhPJzm1hyipOam0Bbm1/ZIUN7HVSh8anI4Sp0p0Vi30YCcZ20K4EDM6Ws/WU/LJosQ8gdb9KAMKQ==
X-Received: by 2002:a9d:75cc:0:b0:5cd:9f3a:6ee6 with SMTP id
 c12-20020a9d75cc000000b005cd9f3a6ee6mr1186806otl.10.1649953050470; 
 Thu, 14 Apr 2022 09:17:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t6-20020a056870f20600b000e2a451bcaesm874137oao.17.2022.04.14.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 09:17:30 -0700 (PDT)
Received: (nullmailer pid 2164706 invoked by uid 1000);
 Thu, 14 Apr 2022 16:17:29 -0000
Date: Thu, 14 Apr 2022 11:17:29 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name,
 pin groups and functions
Message-ID: <YlhJGerakzbsXwnv@robh.at.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-11-arinc.unal@arinc9.com>
 <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
 <550b20f2-098e-0f25-ad9f-3ff523879cb7@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550b20f2-098e-0f25-ad9f-3ff523879cb7@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_091733_023853_EFEF9B7D 
X-CRM114-Status: GOOD (  28.13  )
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

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMTE6MzQ6MzFBTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3
cm90ZToKPiBPbiAxMy8wNC8yMDIyIDE4OjI1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
ID4gT24gMTMvMDQvMjAyMiAwODowNywgQXLEsW7DpyDDnE5BTCB3cm90ZToKPiA+ID4gQ2hhbmdl
IGJpbmRpbmcgbmFtZSBmcm9tIHJhbGluayxydDI4ODAtcGlubXV4IHRvIHJhbGluayxydDI4ODAt
cGluY3RybC4KPiA+ID4gVGhpcyBpcyB0aGUgYmluZGluZyBmb3IgdGhlIFJhbGluayBSVDI4ODAg
cGluY3RybCBzdWJkcml2ZXIuCj4gPiAKPiA+IFdoYXQgSSBkb24ndCBzZWUgaGVyZSBpcyB3aHkg
eW91IGFyZSBkb2luZyB0aGlzLiBwaW5tdXgvcGluY3RybCBoYXZlIHRoZQo+ID4gc2FtZSBtZWFu
aW5nLCBJIGd1ZXNzPwo+IAo+IFdoYXQgSSB1bmRlcnN0YW5kIGlzIHBpbm11eCBpcyByYXRoZXIg
YSBzcGVjaWZpYyB0ZXJtIGZvciB0aGUgbXV4aW5nIG9mIHBpbnMKPiBvciBwaW4gZ3JvdXBzLiBQ
aW5jdHJsIGlzIHdoYXQgd2UgcHJlZmVyIGhlcmUgc2luY2UgdGhlIHRlcm0gaXMgbW9yZQo+IGlu
Y2x1c2l2ZSBvZiB3aGF0IHRoZSBzdWJkcml2ZXIgZG9lczogY29udHJvbGxpbmcgcGlucy4gQW55
IG1lZGlhdGVrCj4gZHJpdmVyL3N1YmRyaXZlciBpcyBjYWxsZWQgcGluY3RybCBzbyBJJ20gbm90
IGRvaW5nIHNvbWV0aGluZyB1bmNvbW1vbi4KClRoZSBjb3JyZWN0IG5hbWUgaXMgcmVhbGx5IHdo
YXRldmVyIHRoZSBoL3cgYmxvY2sgaXMgY2FsbGVkLCBub3QgCndoYXRldmVyIHdlJ3ZlIGNvbWUg
dXAgd2l0aCBmb3Igc29tZSBjbGFzcyBvZiBkZXZpY2VzLgoKPiAKPiA+IAo+ID4gPiAKPiA+ID4g
Q3VycmVudCBwaW4gZ3JvdXAgYW5kIGZ1bmN0aW9uIGJpbmRpbmdzIGFyZSBmb3IgTVQ3NjIxLiBQ
dXQgYmluZGluZ3MgZm9yCj4gPiA+IFJUMjg4MCBpbnN0ZWFkLgo+ID4gPiAKPiA+ID4gU2lnbmVk
LW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgo+ID4gPiAtLS0K
PiA+ID4gICAuLi5waW5tdXgueWFtbCA9PiByYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbH0gfCAy
NCArKysrKysrKystLS0tLS0tLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gPiAgIHJlbmFtZSBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC97cmFsaW5rLHJ0Mjg4MC1waW5tdXgueWFtbCA9PiByYWxp
bmsscnQyODgwLXBpbmN0cmwueWFtbH0gKDU2JSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBp
bm11eC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFs
aW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiA+ID4gc2ltaWxhcml0eSBpbmRleCA1NiUKPiA+ID4g
cmVuYW1lIGZyb20gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFs
aW5rLHJ0Mjg4MC1waW5tdXgueWFtbAo+ID4gPiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiA+ID4g
aW5kZXggOWRlOGIwYzA3NWUyLi5jNjU3YmJmOWZkZGEgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDI4ODAtcGlubXV4
LnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiA+ID4gQEAgLTEsMjEgKzEsMjMgQEAKPiA+
ID4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xh
dXNlCj4gPiA+ICAgJVlBTUwgMS4yCj4gPiA+ICAgLS0tCj4gPiA+IC0kaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5tdXgueWFtbCMKPiA+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9yYWxpbmsscnQy
ODgwLXBpbmN0cmwueWFtbCMKPiA+ID4gICAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gLXRpdGxlOiBSYWxpbmsgcnQyODgwIHBpbm11
eCBjb250cm9sbGVyCj4gPiA+ICt0aXRsZTogUmFsaW5rIFJUMjg4MCBQaW4gQ29udHJvbGxlcgo+
ID4gPiAgIG1haW50YWluZXJzOgo+ID4gPiArICAtIEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxA
YXJpbmM5LmNvbT4KPiA+IAo+ID4gTWVudGlvbiB0aGlzIGluIGNvbW1pdCBtc2cuCj4gCj4gV2ls
bCBkby4KPiAKPiA+IAo+ID4gPiAgICAgLSBTZXJnaW8gUGFyYWN1ZWxsb3MgPHNlcmdpby5wYXJh
Y3VlbGxvc0BnbWFpbC5jb20+Cj4gPiA+ICAgZGVzY3JpcHRpb246Cj4gPiA+IC0gIFRoZSBydDI4
ODAgcGlubXV4IGNhbiBvbmx5IHNldCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBp
bmRpdml1YWwgcGlucwo+ID4gPiArICBSYWxpbmsgUlQyODgwIHBpbiBjb250cm9sbGVyIGZvciBS
VDI4ODAgU29DLgo+ID4gPiArICBUaGUgcGluIGNvbnRyb2xsZXIgY2FuIG9ubHkgc2V0IHRoZSBt
dXhpbmcgb2YgcGluIGdyb3Vwcy4gTXV4aW5nIGluZGl2aXVhbCBwaW5zCj4gPiA+ICAgICBpcyBu
b3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQuCj4gPiA+ICAgcHJvcGVy
dGllczoKPiA+ID4gICAgIGNvbXBhdGlibGU6Cj4gPiA+IC0gICAgY29uc3Q6IHJhbGluayxydDI4
ODAtcGlubXV4Cj4gPiA+ICsgICAgY29uc3Q6IHJhbGluayxydDI4ODAtcGluY3RybAo+ID4gCj4g
PiB5b3UgbmVlZCB0byBkZXByZWNhdGUgb2xkIHByb3BlcnR5IGFuZCBhZGQgYSBuZXcgb25lLgo+
IAo+IERvIHdlIHJlYWxseSBoYXZlIHRvPyBUaGF0IHByb3BlcnR5IG5hbWUgd2FzIGluYWNjdXJh
dGUgZnJvbSB0aGUgc3RhcnQuIEkKPiBkb24ndCBzZWUgYSByZWFzb24gdG8ga2VlcCBpdCBiZWlu
ZyByZWZlcnJlZCB0byBvbiB0aGUgYmluZGluZy4KCkl0J3MgYW4gQUJJLiBUaGVyZSBhcmUgZXhj
ZXB0aW9ucywgYnV0IHlvdSd2ZSBnb3QgdG8gc3BlbGwgb3V0IHRoZSAKcmVhc29uaW5nIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4KClJlYWxseSwgd2hvIGNhcmVzLiBJdCdzIGp1c3QgYSB1bmlxdWUg
aWRlbnRpZmllci4gVW5sZXNzIHlvdSBhbHNvIGhhZCBhIApoL3cgYmxvY2sgY2FsbGVkICdwaW5t
dXgnIGluIGFkZGl0aW9uIHRvIGEgJ3BpbmN0cmwnIGJsb2NrIGl0IGRvZXNuJ3QgCm1hdHRlci4g
V2UgY291bGQgdXNlIGp1c3QgR1VJRHMgaW5zdGVhZC4KClJvYgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
