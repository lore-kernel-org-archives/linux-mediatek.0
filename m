Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B410E6101A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B410E6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRtuHabESoO/s5JOsUaFF9FmNahjUtOKbfwz9rQQAjA=; b=35iojdd1Zu1pai
	n/lg2JI0Xizx7o4v2Oi+YmTAS/0D+s6tkD6AXJLlSDg3sl87aaOIpKkhpr7aq8Qe4Er5bdPU2WtA0
	NVil3jCdvOngE7xYglNlnPF2877QseLSwt6WAsQ5IDfiwQhF2j79XeoTmgGzIHQIyCHeki31uZLEK
	gesw+3lsGssAZkEGEE5Th6Ktp1bVnipFA7P9+ozJtKPTZk2YY3GdnRa0Fvt6ZYLIu/fAuFMp/FLNz
	Hi0dbCYiV8pB7cfWxfUH7Lz0NlmCtj3U0vqpFKwmZ3hNkgtQtFvK3/Pj5RF+tjJCOGduCY9ns4dc0
	ya9z6nF7/KvW3zoo6KCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUnws-002IYb-Ps; Mon, 27 Sep 2021 10:33:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUnwp-002IXs-Sc; Mon, 27 Sep 2021 10:33:25 +0000
X-UUID: 205dde817a524b419c04c5cc91c8a575-20210927
X-UUID: 205dde817a524b419c04c5cc91c8a575-20210927
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502905369; Mon, 27 Sep 2021 03:33:19 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 03:33:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 18:33:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 18:33:16 +0800
Message-ID: <03494ad08689e43358d554bbc48936118a63fd45.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <aaronyu@google.com>, <linux-arm-kernel@lists.infradead.org>
Date: Mon, 27 Sep 2021 18:33:16 +0800
In-Reply-To: <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
 <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
 <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_033323_956466_BF80C168 
X-CRM114-Status: GOOD (  18.85  )
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

T24gRnJpLCAyMDIxLTA5LTI0IGF0IDA5OjQ2IC0wNTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3
cm90ZToKPiA+ID4gPiA+ICsvKiBNb2R1bGUgaW5mb3JtYXRpb24gKi8KPiA+ID4gPiA+ICtNT0RV
TEVfREVTQ1JJUFRJT04oIk1UODE5NS1NVDYzNTktUlQxMDExLVJUNTY4MiBBTFNBIFNvQwo+ID4g
PiA+ID4gbWFjaGluZQo+ID4gPiA+ID4gZHJpdmVyIik7Cj4gPiA+ID4gPiArTU9EVUxFX0FVVEhP
UigiVHJldm9yIFd1IDx0cmV2b3Iud3VAbWVkaWF0ZWsuY29tPiIpOwo+ID4gPiA+ID4gK01PRFVM
RV9MSUNFTlNFKCJHUEwgdjIiKTsKPiA+ID4gPiAKPiA+ID4gPiAiR1BMIiBpcyBlbm91Z2gKPiA+
ID4gPiAKPiA+ID4gCj4gPiA+IEkgc2VlIG1hbnkgcHJvamVjdHMgdXNlIEdQTCB2MiBoZXJlLCBh
bmQgYWxsIG1lZGlhdGVrIHByb2plY3RzCj4gPiA+IHVzZQo+ID4gPiBHUEwKPiA+ID4gdjIsIHRv
by4KPiA+ID4gSSdtIG5vdCBzdXJlIHdoaWNoIG9uZSBpcyBiZXR0ZXIuCj4gPiA+IERvIEkgbmVl
ZCB0byBtb2RpZnkgdGhpcz8KPiAKPiBTZWUKPiAKaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvbGljZW5zZS1y
dWxlcy5odG1sP2hpZ2hsaWdodD1tb2R1bGVfbGljZW5zZSppZDFfXztJdyEhQ1RSTktBOXdNZzBB
UmJ3ITB4d3Fzb2Rpek03akZJNGx3cFQ3X2gyYms2eEh0ZE5iMzJZRG8ybG5lWjl1LWNzNWhBcXFk
cVRjaTg5cUs4RndMZyQKPiAgCj4gCj4gTG9hZGFibGUga2VybmVsIG1vZHVsZXMgYWxzbyByZXF1
aXJlIGEgTU9EVUxFX0xJQ0VOU0UoKSB0YWcuIFRoaXMgdGFnCj4gaXMKPiBuZWl0aGVyIGEgcmVw
bGFjZW1lbnQgZm9yIHByb3BlciBzb3VyY2UgY29kZSBsaWNlbnNlIGluZm9ybWF0aW9uCj4gKFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyKSBub3IgaW4gYW55IHdheSByZWxldmFudCBmb3IgZXhwcmVz
c2luZyBvcgo+IGRldGVybWluaW5nIHRoZSBleGFjdCBsaWNlbnNlIHVuZGVyIHdoaWNoIHRoZSBz
b3VyY2UgY29kZSBvZiB0aGUKPiBtb2R1bGUKPiBpcyBwcm92aWRlZC4KPiAKPiDigJxHUEzigJ0K
PiAKPiBNb2R1bGUgaXMgbGljZW5zZWQgdW5kZXIgR1BMIHZlcnNpb24gMi4gVGhpcyBkb2VzIG5v
dCBleHByZXNzIGFueQo+IGRpc3RpbmN0aW9uIGJldHdlZW4gR1BMLTIuMC1vbmx5IG9yIEdQTC0y
LjAtb3ItbGF0ZXIuIFRoZSBleGFjdAo+IGxpY2Vuc2UKPiBpbmZvcm1hdGlvbiBjYW4gb25seSBi
ZSBkZXRlcm1pbmVkIHZpYSB0aGUgbGljZW5zZSBpbmZvcm1hdGlvbiBpbiB0aGUKPiBjb3JyZXNw
b25kaW5nIHNvdXJjZSBmaWxlcy4KPiAKPiDigJxHUEwgdjLigJ0KPiAKPiBTYW1lIGFzIOKAnEdQ
TOKAnS4gSXQgZXhpc3RzIGZvciBoaXN0b3JpYyByZWFzb25zLgo+IAo+IFNvICJHUEwgdjIiIGlz
IG5vdCBpbmNvcnJlY3QgYnV0IGZvciBuZXcgY29udHJpYnV0aW9ucyB5b3UgbWlnaHQgYXMKPiB3
ZWxsCj4gdXNlIHRoZSByZWNvbW1lbmRlZCB0YWcuCgoKR290IGl0LgpUaGFua3MgZm9yIHlvdXIg
ZGV0YWlsZWQgZXhwbGFuYXRpb24uCkkgd2lsbCBjb3JyZWN0IGl0IGluIFYyLgoKVHJldm9yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
