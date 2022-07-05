Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA7C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 05:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImMuOzLi9dVLtMFzQh+aSk7QVa0GtW9tqx+Zeslw0rY=; b=glqvg2/FT2YnguVugJnQu6NzKQ
	Oz8MI9cCz9l9ToWYKSWAUxYvuCZMICBcq9FgGPfYIOW4e5hAJbBDvB/8OFzNdpGMEq8UrsZsz88vJ
	ftuCohrx7dwxW+VtzqsOKw+GsyphCDP053pi5BJiWYFBbxMmHDsDhJ9JjX6SlGMJdw7UHZClqId4t
	1Jnnq6TJCHi2HIWpmiVhelataXRljqDrgFA/AV3dicFxvZ6envMSi07vYUdSDAu1dYiuGmQd4GtZH
	Vl3OxV7sbXK0LuYqLl53Q8t5JnOV3sLxPC8Nj2Ds+pF9bm2G8bZw9KWOCjKvtLPEYmWok8bbhkhyH
	4OIdJr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8aqX-00EbeX-N8; Tue, 05 Jul 2022 05:11:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8aqM-00Ebbm-LL; Tue, 05 Jul 2022 05:11:28 +0000
X-UUID: ef1c1b9530e3466b8f635d40ba9c4446-20220704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ImMuOzLi9dVLtMFzQh+aSk7QVa0GtW9tqx+Zeslw0rY=;
	b=AiOpRvJ64nAnoQhNy1TgKY6oZ4NA3SNpy+HknwnNfRVLt50b9TQpwvDRIBQbueXx2nPdVW648Z91T/bcTfdouxDXblr5Lvb4l2l16SZH/crOTqHw/J13BzHtzG8SvWblG/Q5bDJ/EoDaW9BHZV8B9Pt/BB90G2qy+YCwY1cCUVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1db3e59a-95a9-43b4-ad35-e6d5f87b8370,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:47a58f86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ef1c1b9530e3466b8f635d40ba9c4446-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1792226378; Mon, 04 Jul 2022 22:11:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 12:10:39 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jul 2022 12:10:38 +0800
Message-ID: <3f253ca6e2ec058f6172ad1146a2cc954895b97c.camel@mediatek.com>
Subject: Re: [PATCH 2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
	<enric.balletbo@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Tue, 5 Jul 2022 12:11:09 +0800
In-Reply-To: <81dd89d9b77b3a16068493269f400254f94c609f.camel@mediatek.com>
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
	 <1656645344-12062-3-git-send-email-xinlei.lee@mediatek.com>
	 <81dd89d9b77b3a16068493269f400254f94c609f.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_221126_748587_313D6A53 
X-CRM114-Status: GOOD (  22.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIyLTA3LTAxIGF0IDE0OjMzICswODAwLCBSZXgtQkMgQ2hlbiB3cm90ZToNCj4g
T24gRnJpLCAyMDIyLTA3LTAxIGF0IDExOjE1ICswODAwLCB4aW5sZWkubGVlQG1lZGlhdGVrLmNv
bSB3cm90ZToNCj4gPiBGcm9tOiBYaW5sZWkgTGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4N
Cj4gPiANCj4gPiBEcGkgb3V0cHV0IG5lZWRzIHRvIGFkanVzdCB0aGUgb3V0cHV0IGZvcm1hdCB0
byBkdWFsIGVkZ2UgZm9yDQo+ID4gTVQ4MTg2Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW5s
ZWkgTGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyAgICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaCB8ICA1ICsrKysr
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gaW5kZXggZTYxY2Q2N2I5NzhmLi44MmE1
MjA5YTFkZDggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gPiBA
QCAtMTUsNiArMTUsNyBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5o
Pg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1t
bXN5cy5oPg0KPiA+ICANCj4gDQo+IFBsZWFzZSByZW9yZGVyIHRoaXMuDQo+IA0KPiA+ICAjaW5j
bHVkZSA8dmlkZW8vdmlkZW9tb2RlLmg+DQo+ID4gIA0KPiA+IEBAIC0yOCw2ICsyOSw3IEBADQo+
ID4gICNpbmNsdWRlICJtdGtfZGlzcF9kcnYuaCINCj4gPiAgI2luY2x1ZGUgIm10a19kcGlfcmVn
cy5oIg0KPiA+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiA+ICsjaW5jbHVkZSAi
bXRrX2RybV9kcnYuaCINCj4gPiAgDQo+ID4gIGVudW0gbXRrX2RwaV9vdXRfYml0X251bSB7DQo+
ID4gIAlNVEtfRFBJX09VVF9CSVRfTlVNXzhCSVRTLA0KPiA+IEBAIC04NSw2ICs4Nyw3IEBAIHN0
cnVjdCBtdGtfZHBpIHsNCj4gPiAgCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5zX2RwaTsNCj4g
PiAgCXUzMiBvdXRwdXRfZm10Ow0KPiA+ICAJaW50IHJlZmNvdW50Ow0KPiA+ICsJc3RydWN0IGRl
dmljZSAqbW1zeXNfZGV2Ow0KPiA+ICB9Ow0KPiA+ICANCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgbXRrX2RwaSAqYnJpZGdlX3RvX2RwaShzdHJ1Y3QgZHJtX2JyaWRnZSAqYikNCj4gPiBAQCAt
MTI1LDYgKzEyOCw3IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgew0KPiA+ICAJYm9vbCBlZGdlX3Nl
bF9lbjsNCj4gPiAgCWNvbnN0IHUzMiAqb3V0cHV0X2ZtdHM7DQo+ID4gIAl1MzIgbnVtX291dHB1
dF9mbXRzOw0KPiA+ICsJYm9vbCByZ2I4ODhfZHVhbF9lbmFibGU7DQo+ID4gIH07DQo+ID4gIA0K
PiA+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX21hc2soc3RydWN0IG10a19kcGkgKmRwaSwgdTMyIG9m
ZnNldCwgdTMyIHZhbCwNCj4gPiB1MzIgbWFzaykNCj4gPiBAQCAtMzkzLDYgKzM5Nyw5IEBAIHN0
YXRpYyB2b2lkIG10a19kcGlfZHVhbF9lZGdlKHN0cnVjdCBtdGtfZHBpDQo+ID4gKmRwaSkNCj4g
PiAgCQltdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVUX1NFVFRJTkcsDQo+ID4gIAkJCSAgICAg
ZHBpLT5vdXRwdXRfZm10ID09DQo+ID4gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9MRSA/DQo+
ID4gIAkJCSAgICAgRURHRV9TRUwgOiAwLCBFREdFX1NFTCk7DQo+ID4gKwlpZiAoZHBpLT5jb25m
LT5yZ2I4ODhfZHVhbF9lbmFibGUpDQo+ID4gKwkJbXRrX21tc3lzX2RkcF9kcGlfY29uZmluZyhk
cGktPm1tc3lzX2RldiwNCj4gPiBEUElfUkdCODg4X0REUl9DT04sDQo+ID4gKwkJCQkJICBEUElf
Rk9STUFUX01BU0ssIE5VTEwpOw0KPiA+ICAJfSBlbHNlIHsNCj4gPiAgCQltdGtfZHBpX21hc2so
ZHBpLCBEUElfRERSX1NFVFRJTkcsIEREUl9FTiB8IEREUl80UEhBU0UsDQo+ID4gMCk7DQo+ID4g
IAl9DQo+ID4gQEAgLTcwNSw4ICs3MTIsMTAgQEAgc3RhdGljIGludCBtdGtfZHBpX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LA0KPiA+IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkN
Cj4gPiAgew0KPiA+ICAJc3RydWN0IG10a19kcGkgKmRwaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiA+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOw0KPiA+ICsJc3RydWN0
IG10a19kcm1fcHJpdmF0ZSAqcHJpdiA9IGRybV9kZXYtPmRldl9wcml2YXRlOw0KPiA+ICAJaW50
IHJldDsNCj4gPiAgDQo+ID4gKwlkcGktPm1tc3lzX2RldiA9IHByaXYtPm1tc3lzX2RldjsNCj4g
PiAgCXJldCA9IGRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGRybV9kZXYsICZkcGktPmVuY29kZXIs
DQo+ID4gIAkJCQkgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMpOw0KPiA+ICAJaWYgKHJldCkg
ew0KPiA+IEBAIC04MjMsNiArODMyLDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9j
b25mIG10ODE5Ml9jb25mID0NCj4gPiB7DQo+ID4gIAkubnVtX291dHB1dF9mbXRzID0gQVJSQVlf
U0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTg2X2NvbmYgPSB7DQo+ID4gKwkJLmNhbF9mYWN0
b3IgPSBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvciwNCj4gPiArCQkucmVnX2hfZnJlX2NvbiA9IDB4
ZTAsDQo+ID4gKwkJLm1heF9jbG9ja19raHogPSAxNTAwMDAsDQo+ID4gKwkJLm91dHB1dF9mbXRz
ID0gbXQ4MTgzX291dHB1dF9mbXRzLA0KPiA+ICsJCS5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9T
SVpFKG10ODE4M19vdXRwdXRfZm10cyksDQo+ID4gKwkJLnJnYjg4OF9kdWFsX2VuYWJsZSA9IHRy
dWUsDQo+ID4gK307DQo+ID4gKw0KPiANCj4gcGxlYXNlIHB1dCB0aGlzIGJldHdlZW4gODE4MyBh
bmQgODE5Mi4NCj4gDQo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Ow0KPiA+IEBAIC05NDUsNiArOTYzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQNCj4gPiBtdGtfZHBpX29mX2lkc1tdDQo+ID4gPSB7DQo+ID4gIAl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kcGkiLA0KPiA+ICAJICAuZGF0YSA9ICZtdDgxOTJfY29u
ZiwNCj4gPiAgCX0sDQo+ID4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4Ni1kcGki
LA0KPiA+ICsJICAuZGF0YSA9ICZtdDgxODZfY29uZiwNCj4gPiArCX0sDQo+IA0KPiBkaXR0bw0K
PiANCj4gPiAgCXsgfSwNCj4gPiAgfTsNCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRr
X2RwaV9vZl9pZHMpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaV9yZWdzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3Jl
Z3MuaA0KPiA+IGluZGV4IDNhMDJmYWJlMTY2Mi4uMjRkNGNkZjM2OTZiIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaA0KPiA+IEBAIC0yMTcsNCArMjE3
LDkgQEANCj4gPiAgDQo+ID4gICNkZWZpbmUgRURHRV9TRUxfRU4JCQlCSVQoNSkNCj4gPiAgI2Rl
ZmluZSBIX0ZSRV8yTgkJCUJJVCgyNSkNCj4gPiArDQo+ID4gKyNkZWZpbmUgRFBJX0ZPUk1BVF9N
QVNLCQkJMHgxDQo+ID4gKyNkZWZpbmUgRFBJX1JHQjg4OF9ERFJfQ09OCQlCSVQoMCkNCj4gPiAr
I2RlZmluZSBEUElfUkdCNTY1X1NEUl9DT04JCUJJVCgxKQ0KPiA+ICsNCj4gPiAgI2VuZGlmIC8q
IF9fTVRLX0RQSV9SRUdTX0ggKi8NCj4gDQo+IA0KDQpIaSBSZXg6DQoNClRoYW5rcyBmb3IgeW91
ciByZXZpZXcuDQpJIHdpbGwgc29ydCB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJlc3Qg
UmVnYXJkcyENCnhpbmxlaQ0K


