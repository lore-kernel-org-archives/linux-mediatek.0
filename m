Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8/AHq6clZQ3vgTpJNIxnibCFHZli95Vi3RIdD8Ff7M=; b=iKim6qGNkSNtxD
	hjNMHLrkwO50mUBKqtWGmh47XSphl0gQmMLTp+7qCBdgEXcKMYhP4F1I3e0K9r/Au3nZzKBnMOgEE
	bbY3hnWiu8g4edyUSmSe6gSLLCjrhrVj772QKJ8vOcCf4gyjtoSsbwRWK7S94Aznq4xlbs0tI2QOy
	hOUvBhe9mBIDSQajXbjn5U+cSbmZEsv54Vmt3JYdiQAJMSxNIwJbDyosv/6o2QQK/yKIJSf31FT7Q
	b0hTFdSWMmWgBru5wEo1/4n+AaBWR2CRsClv0ZESpnaIiNQtEFQLCVODebABksanJdhKkpPsqzzQM
	PQMr/ZFqdHYlY+BYnCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nObLk-00B7SL-0j; Mon, 28 Feb 2022 08:25:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nObLg-00B7Re-0k; Mon, 28 Feb 2022 08:25:41 +0000
X-UUID: 13efa97b1c7a40089a86386ff1d08952-20220228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o8A3anVyhGbkwEXbXWjqmN0B1yuy30fGV8Yy3/fmvLI=; 
 b=Le8z7p1vqCanDLiDVtJlPyyJGdKdMSnHPg499GMvGKdkowxhMwVZF3E1Gjge+FRT69V/KEFr+dzFXgm52p/Q6Np3Rqz/bug5FSlUawDip6uCro5nVAgLmFSwDNerK/Y1ZJSufRwgW5VzaNF+FATG+GP5331k8QV0x6jQtVPpbgY=;
X-UUID: 13efa97b1c7a40089a86386ff1d08952-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003333658; Mon, 28 Feb 2022 01:25:36 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 00:25:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Feb 2022 16:25:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Feb 2022 16:25:19 +0800
Message-ID: <0197608e8ce6598b6325ee28862a8e68b2c5dbf5.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: phy: Add compatible for Mediatek MT8192
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: allen-kh.cheng <allen-kh.cheng@mediatek.com>, "=?ISO-8859-1?Q?N=EDcolas?=
 F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Kishon Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, Min Guo
 <Min.Guo@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Mon, 28 Feb 2022 16:25:17 +0800
In-Reply-To: <fa2ebb227418c47ff38fabe6099ab03eaedc6203.camel@mediatek.com>
References: <20220217135620.10559-1-allen-kh.cheng@mediatek.com>
 <20220223173556.u3dx7ugpxpcpir2n@notapiano>
 <fa2ebb227418c47ff38fabe6099ab03eaedc6203.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_002540_109988_496EDEAC 
X-CRM114-Status: GOOD (  23.47  )
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

T24gVGh1LCAyMDIyLTAyLTI0IGF0IDIxOjA2ICswODAwLCBhbGxlbi1raC5jaGVuZyB3cm90ZToN
Cj4gT24gV2VkLCAyMDIyLTAyLTIzIGF0IDEyOjM1IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyB3cm90ZToNCj4gPiBIaSBBbGxlbiwNCj4gPiANCj4gPiB0aGFua3MgZm9yIHRoZSBwYXRj
aC4gUGxlYXNlIHNlZSB0aGUgY29tbWVudCBiZWxvdy4NCj4gPiANCj4gPiBPbiBUaHUsIEZlYiAx
NywgMjAyMiBhdCAwOTo1NjoyMFBNICswODAwLCBBbGxlbi1LSCBDaGVuZyB3cm90ZToNCj4gPiA+
IFRoaXMgY29tbWl0IGFkZHMgZHQtYmluZGluZyBkb2N1bWVudGF0aW9uIG9mIFQtUGh5IGZvciBN
ZWRpYXRlaw0KPiA+ID4gTVQ4MTkyIFNvQw0KPiA+ID4gUGxhdGZvcm0uDQo+ID4gDQo+ID4gQ29t
bWl0IG1lc3NhZ2VzIHNob3VsZCBiZSBpbiBpbXBlcmF0aXZlIFsxXS4gSSdkIHN1Z2dlc3QgdGhl
DQo+ID4gZm9sbG93aW5nIG1lc3NhZ2U6DQo+ID4gDQo+ID4gCUFkZCBNVDgxOTIgY29tcGF0aWJs
ZSB0byB0aGUgTWVkaWF0ZWsgVC1QSFkgZHQtYmluZGluZy4NCj4gPiANCj4gPiBbMV0gDQo+ID4g
DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCpkZXNjcmliZS15b3Vy
LWNoYW5nZXNfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IXl0cm1Hc1FfSVZGX2VaaTVoWGsxdHltMldu
NDViZjZZMWNfQW9lRThPc00xRkdVa2VueENCOFVtX283cWhnb01fTzAzOGVYcWIwVF9wZFRUNllx
VEVfR2c3dyQNCj4gPiAgDQo+ID4gDQo+ID4gQWxzbywgdGhlIGNvbW1pdCB0aXRsZSB3b3VsZCBi
ZSBiZXR0ZXIgaWYgaXQgaGFkIHRoZSB0YWcgZm9yIHRoZQ0KPiA+IHRwaHkNCj4gPiBmaWxlLCBs
aWtlDQo+ID4gdGhpczoNCj4gPiANCj4gPiAJZHQtYmluZGluZ3M6IHBoeTogbWVkaWF0ZWssdHBo
eTogQWRkIGNvbXBhdGlibGUgZm9yIE1UODE5Mg0KDQpVc2UgcHJlZml4LCAiZHQtYmluZGluZ3M6
IHBoeTogbWVkaWF0ZWs6IHRwaHk6ICIgYXMgb3RoZXIgcGF0Y2hlcywNCnRoYW5rcw0KDQo+ID4g
DQo+ID4gT3RoZXJ3aXNlIGl0J3Mgbm90IGNsZWFyIHRoYXQgeW91J3JlIGNoYW5naW5nIHRoZSBU
LVBIWSBqdXN0IGZyb20NCj4gPiB0aGUNCj4gPiB0aXRsZS4NCj4gPiANCj4gPiA+IA0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFsbGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiANCj4gPiBPdGhlciB0aGFuIHRoYXQsDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4gPiANCj4g
PiBUaGFua3MsDQo+ID4gTsOtY29sYXMNCj4gPiANCj4gDQo+IEhJIE7DrWNvbGFzLA0KPiANCj4g
T2sgSSB3aWxsIHVwZGF0ZSBjb21taXQgZm9yIHRoZSBjb21tZW50LiB0aGFua3MuIA0KPiANCj4g
QWxsZW4NCj4gDQo+ID4gPiAtLS0NCj4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLHRwaHkueWFtbCB8IDEgKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sDQo+ID4g
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55
YW1sDQo+ID4gPiBpbmRleCBkMjc5YmEyMjIzMTYuLjdiMmUxYmMxMTliZSAxMDA2NDQNCj4gPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBo
eS55YW1sDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5
L21lZGlhdGVrLHRwaHkueWFtbA0KPiA+ID4gQEAgLTgxLDYgKzgxLDcgQEAgcHJvcGVydGllczoN
Cj4gPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjI5LXRwaHkNCj4gPiA+ICAgICAg
ICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLXRwaHkNCj4gPiA+ICAgICAgICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTg2LXRwaHkNCj4gPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTkyLXRwaHkNCj4gPiA+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssZ2VuZXJpYy10cGh5
LXYyDQo+ID4gPiAgICAgICAgLSBpdGVtczoNCj4gPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+
ID4gLS0gDQo+ID4gPiAyLjE4LjANCj4gPiA+IA0KPiA+ID4gDQo+IA0KPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
