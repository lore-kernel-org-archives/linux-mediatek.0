Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A590C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 01:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0KpaH44VyzeyXsAlHHtGF0vXcjRzPvsO9V39NIIJwY=; b=RewVau4+upYKDL
	reh2aa0QNuMbqOx/lLcvlZ0KMbgqc3iBVDnEJdtx+KlUc0U5dkYQfaimIzb4/UzyCjAQyrKL0nshV
	5Q2syio4bMufDbjGyAFSWrb4n3N6KeOxXR0APw+pivpUGiHxhXlpqbkN5Eu/w9/NsaWZ3KSpWed8p
	fU7V7qGfyHVk6Chbae6hOwXtdo5gVq5QK4q8XdPAGE/GeCqqDmbd1olluN3VmmRMReZzEDZVbJqcm
	Bl2JXCX69T5cKUgNztw/Msk/Eu/RnzYKxlWlei/Uh7fijG3RoaYmt0iUw5B/3qPmoB6MjZBvXsDCp
	YrMTPnJ6660CU1wFppYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noExZ-00H2bj-Ty; Tue, 10 May 2022 01:46:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noExX-00H2a2-5n; Tue, 10 May 2022 01:46:44 +0000
X-UUID: 865979c7dfbc46d698e73ee13375def6-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0b6eaa1e-b002-44c4-9258-3c1fccf02443, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c0e6cf16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 865979c7dfbc46d698e73ee13375def6-20220509
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288499458; Mon, 09 May 2022 18:46:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 May 2022 18:46:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 09:46:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 09:46:27 +0800
Message-ID: <2a480ca0cf640e59a12d55435d02cb3892035a35.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: "airlied@linux.ie" <airlied@linux.ie>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Jason-JH Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?= <Jason-JH.Lin@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 10 May 2022 09:46:26 +0800
In-Reply-To: <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
 <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
 <85fcdcd0-e7c5-5192-9113-c69f9c3a6385@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_184643_245411_6682A66D 
X-CRM114-Status: GOOD (  19.12  )
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

T24gTW9uLCAyMDIyLTA1LTA5IGF0IDE4OjUwICswODAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToKPiBJbCAwOS8wNS8yMiAxMjo0NCwgS3J6eXN6dG9mIEtvemxvd3NraSBoYSBz
Y3JpdHRvOgo+ID4gT24gMDkvMDUvMjAyMiAxMDo1NCwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiA+
ID4gPiArICAgIHNvYyB7Cj4gPiA+ID4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsK
PiA+ID4gPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gKyAgICAgICAgZGlzcF9ldGhkckAxYzExNDAwMCB7Cj4gPiA+ID4gCj4gPiA+ID4gTm8gdW5k
ZXJzY29yZXMgaW4gbm9kZSBuYW1lLiBHZW5lcmljIG5vZGUgbmFtZXMsIHNvIGRpc3BsYXktCj4g
PiA+ID4gY29udHJvbGxlcj8KPiA+ID4gPiAKPiA+ID4gCj4gPiA+IE9LLCB3ZSB3aWxsIGNoYW5n
ZSB0aGUgbm9kZSBuYW1lIHRvIGV0aGRyIGxpa2UgaW4gZHRzCj4gPiA+IGxpa2UgdGhpczoKPiA+
ID4gZXRoZHIwOiBldGhkckAxYzExNDAwMCB7Cj4gPiA+IC4uLgo+ID4gPiB9Cj4gPiAKPiA+IElz
ICJldGhkciIgYSBnZW5lcmljIG5hbWU/IElzIGl0IGFuIGFiYnJldmlhdGlvbiBvZiAiRW5lcmd5
VHJhY2XihKIKPiA+IEhpZ2gKPiA+IER5bmFtaWMgUmFuZ2UiPyBJZiB5ZXMsIGl0IGFsc28gbG9v
a3Mgc3BlY2lmaWMgdG8gVGV4YXMKPiA+IEluc3RydW1lbnRzLi4uCj4gPiAKPiA+IEJlc3QgcmVn
YXJkcywKPiA+IEtyenlzenRvZgo+IAo+IAo+IFRoYXQncyBtZWRpYXRlay1kcm0sIGFuZCB0aGlz
IHJlZmVycyB0byB0aGUgSERSIGJsb2NrIGluIHRoZSBkaXNwbGF5Cj4gSVAuLi4KPiAKPiBUaG91
Z2gsIEkgaGF2ZSBubyBpZGVhIG9mIHdoYXQgIkVUIiBzdGFuZHMgZm9yIGluICJFVEhEUiIsIHNv
LCBpdAo+IHdvdWxkIGJlCj4gZGVmaW5pdGVseSBuaWNlIGlmIE1lZGlhVGVrIGNhbiB3cml0ZSB0
aGUgbWVhbmluZyBpbiB0aGUgZGVzY3JpcHRpb24sCj4gbGlrZQo+IAo+IGRlc2NyaXB0aW9uOgo+
ICAgIEVUSERSIChFPz8/IFQ/Pz8gSGlnaCBEeW5hbWljIFJhbmdlKSBpcyBkZXNpZ25lZCBmb3Ig
SERSIHZpZGVvIGFuZAo+IC4uLmJsYWgKPiAKPiBDaGVlcnMsCj4gQW5nZWxvCgpIZWxsbyBLcnp5
c3p0b2YgYW5kIEFuZ2VsbywKCiJFVCIgaXMgYWN0dWFsbHkgbWVhbmluZ2xlc3MuCkVUIGlzIG9u
ZSBvZiBtZWRpYXRlayBkZXBhcnRtZW50cyBhbmQgaXQncyB3aGVyZSB0aGUgZW5naW5lIGZyb20u
ClRoZXJlZm9yZSwgSSB0aGluayB3ZSB3aWxsIGFkZCBkZXNjcmlwdGlvbiBsaWtlIHRoaXM6Cj4g
RVRIRFIgKEVUIEhpZ2ggRHluYW1pYyBSYW5nZSkgaXMgYSBNZWRpYVRlayBpbnRlcm5hbCBIRFIg
ZW5naW5lIGFuZAo+IGRlc2lnbmVkIGZvciBIRFIgdmlkZW8uLi4KCkJScywKUmV4CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
