Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sdYY1TH37hOBWp48T/YGXhzxABZauOWNwdUh9kbrc8=; b=kF87Iwdd0VI8pg
	f2hkoFpOjl29Ureu9PDHHNsBl90Bx8u9W16Ir9jJyYqa+7iFVXfZsuf2k52HIq/C/+qqFEuQV7Is1
	saIEUF3U9N3uDky4BpNBNSSfyC2ONJuHZWHIp93bNpIpvEhaqUss96Lzqf7Wq0YsmecQGHeFQnsKM
	rREE5W9bmQqOZLojQAhuI1bO486nKX5/I401ZunSjsvpoEy/nOgY2qWCTVrKKtJUR++00FK5Gxt9V
	36qFw6JkLpmm350ngRBDULLZobpoi3/Ev3OXm2HbezPbLsR4kudJvZ4vyvTuDt9crUIWQj2zWKjmP
	AhKiMfPYJbrHUjiwGE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npLUs-00EFBm-8a; Fri, 13 May 2022 02:57:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npLUn-00EF9D-De; Fri, 13 May 2022 02:57:40 +0000
X-UUID: e3afef5a125e4f5bb39723e183b8bd4c-20220512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PoO87b0mEdv3Slm7oRAxvr/PjjRrGNf1fw4ziP6caWc=; 
 b=nSgdmQnCRWSQ3UOY0sozpebzL7xiOed10pTLxlsCLdPEFu6lqERNa1QGJWJ/T67SYiZlbIJGUxaYUfT8Xf9Bmddbea51HITMZxDGbduhrD3BWnDoApwHyD959t/Lgym9yQwNBxvklqNdVXDfwdIz7AyvVqrKPbxGkqnos3mgwEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:652dea8b-62f2-43d8-91a4-e306ba4280ae, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b0590df2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e3afef5a125e4f5bb39723e183b8bd4c-20220512
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1444021745; Thu, 12 May 2022 19:57:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 19:57:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 13 May 2022 10:57:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 May 2022 10:57:22 +0800
Message-ID: <875b24355315311db3a0c846be5f553b3d0c7498.camel@mediatek.com>
Subject: Re: [DKIM] [PATCH v12, 13/17] media: mediatek: vcodec: Extract H264
 common code
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
 Steve Cho <stevecho@chromium.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, <linux-mediatek@lists.infradead.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Date: Fri, 13 May 2022 10:57:22 +0800
In-Reply-To: <03e09da3-c068-a372-a3e5-dc0459f90682@xs4all.nl>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
 <20220512021950.29087-14-yunfei.dong@mediatek.com>
 <03e09da3-c068-a372-a3e5-dc0459f90682@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_195737_519324_600DEA3A 
X-CRM114-Status: GOOD (  27.72  )
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

RGVhciBIYW5zLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCk9uIFRodSwgMjAyMi0w
NS0xMiBhdCAxMTozMSArMDIwMCwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBIaSBZdW5mZWksDQo+
IA0KPiBPbiA1LzEyLzIyIDA0OjE5LCBZdW5mZWkgRG9uZyB3cm90ZToNCj4gPiBNdDgxOTIgY2Fu
IHVzZSBzb21lIG9mIGNvbW1vbiBjb2RlIHdpdGggbXQ4MTgzLiBNb3ZlcyB0aGVtIHRvDQo+ID4g
YSBuZXcgZmlsZSBpbiBvcmRlciB0byByZXVzZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
dW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBO
aWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0t
DQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvTWFrZWZpbGUgICB8ICAg
MSArDQo+ID4gIC4uLi92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX2NvbW1vbi5jICAgICAgICB8
IDMxMCArKysrKysrKysrKysrDQo+ID4gIC4uLi92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX2Nv
bW1vbi5oICAgICAgICB8IDI3NCArKysrKysrKysrKw0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVj
L3ZkZWMvdmRlY19oMjY0X3JlcV9pZi5jICAgfCA0MjcgKystLS0tLS0tLS0tDQo+ID4gLS0tLS0t
DQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjI5IGluc2VydGlvbnMoKyksIDM4MyBkZWxldGlvbnMo
LSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX2NvbW1vbi5jDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3Zk
ZWMvdmRlY19oMjY0X3JlcV9jb21tb24uaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvTWFrZWZpbGUNCj4gPiBpbmRleCAzNTk2MTk2
NTNhMGUuLjNmNDFkNzQ4ZWVlNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvdmNvZGVjL01ha2VmaWxlDQo+ID4gQEAgLTksNiArOSw3IEBAIG10ay12
Y29kZWMtZGVjLXkgOj0gdmRlYy92ZGVjX2gyNjRfaWYubyBcDQo+ID4gIAkJdmRlYy92ZGVjX3Zw
OF9pZi5vIFwNCj4gPiAgCQl2ZGVjL3ZkZWNfdnA5X2lmLm8gXA0KPiA+ICAJCXZkZWMvdmRlY19o
MjY0X3JlcV9pZi5vIFwNCj4gPiArCQl2ZGVjL3ZkZWNfaDI2NF9yZXFfY29tbW9uLm8gXA0KPiA+
ICAJCW10a192Y29kZWNfZGVjX2Rydi5vIFwNCj4gPiAgCQl2ZGVjX2Rydl9pZi5vIFwNCj4gPiAg
CQl2ZGVjX3ZwdV9pZi5vIFwNCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfY29tbW9uLg0KPiA+IGMN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY19o
MjY0X3JlcV9jb21tb24uDQo+ID4gYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi40ZTdjOWQ0Nzc1MWQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
DQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNf
aDI2NF9yZXFfY29tbW9uLg0KPiA+IGMNCj4gPiBAQCAtMCwwICsxLDMxMCBAQA0KPiANCj4gPHNu
aXA+DQo+IA0KPiBIZXJlIHRoZXJlIGlzIHN0aWxsIGEgY2FzdCB0byBpb21lbToNCj4gDQo+ID4g
K3ZvaWQgbXRrX3ZkZWNfaDI2NF9jb3B5X3NjYWxpbmdfbWF0cml4KHN0cnVjdA0KPiA+IHNsaWNl
X2FwaV9oMjY0X3NjYWxpbmdfbWF0cml4ICpkc3RfbWF0cml4LA0KPiA+ICsJCQkJICAgICAgIGNv
bnN0IHN0cnVjdA0KPiA+IHY0bDJfY3RybF9oMjY0X3NjYWxpbmdfbWF0cml4ICpzcmNfbWF0cml4
KQ0KPiA+ICt7DQo+ID4gKwltZW1jcHlfdG9pbygodm9pZCBfX2lvbWVtICopZHN0X21hdHJpeC0+
c2NhbGluZ19saXN0XzR4NCwNCj4gPiBzcmNfbWF0cml4LT5zY2FsaW5nX2xpc3RfNHg0LA0KPiA+
ICsJCSAgICBzaXplb2YoZHN0X21hdHJpeC0+c2NhbGluZ19saXN0XzR4NCkpOw0KPiA+ICsNCj4g
PiArCW1lbWNweV90b2lvKCh2b2lkIF9faW9tZW0gKilkc3RfbWF0cml4LT5zY2FsaW5nX2xpc3Rf
OHg4LA0KPiA+IHNyY19tYXRyaXgtPnNjYWxpbmdfbGlzdF84eDgsDQo+ID4gKwkJICAgIHNpemVv
Zihkc3RfbWF0cml4LT5zY2FsaW5nX2xpc3RfOHg4KSk7DQo+ID4gK30NCj4gDQo+IDxzbmlwPg0K
PiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfaWYuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVjX2gyNjRfcmVxX2lmLmMNCj4gPiBpbmRleCAy
NzExOWFhMzFkZDkuLmIwNTVjZWVhNDgxZCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY19oMjY0X3JlcV9pZi5jDQo+
ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVj
L3ZkZWNfaDI2NF9yZXFfaWYuYw0KPiANCj4gPHNuaXA+DQo+IA0KPiA+IC1zdGF0aWMgdm9pZA0K
PiA+IC1nZXRfaDI2NF9zY2FsaW5nX21hdHJpeChzdHJ1Y3Qgc2xpY2VfYXBpX2gyNjRfc2NhbGlu
Z19tYXRyaXgNCj4gPiAqZHN0X21hdHJpeCwNCj4gPiAtCQkJY29uc3Qgc3RydWN0IHY0bDJfY3Ry
bF9oMjY0X3NjYWxpbmdfbWF0cml4DQo+ID4gKnNyY19tYXRyaXgpDQo+ID4gLXsNCj4gPiAtCW1l
bWNweShkc3RfbWF0cml4LT5zY2FsaW5nX2xpc3RfNHg0LCBzcmNfbWF0cml4LQ0KPiA+ID5zY2Fs
aW5nX2xpc3RfNHg0LA0KPiA+IC0JICAgICAgIHNpemVvZihkc3RfbWF0cml4LT5zY2FsaW5nX2xp
c3RfNHg0KSk7DQo+ID4gLQ0KPiA+IC0JbWVtY3B5KGRzdF9tYXRyaXgtPnNjYWxpbmdfbGlzdF84
eDgsIHNyY19tYXRyaXgtDQo+ID4gPnNjYWxpbmdfbGlzdF84eDgsDQo+ID4gLQkgICAgICAgc2l6
ZW9mKGRzdF9tYXRyaXgtPnNjYWxpbmdfbGlzdF84eDgpKTsNCj4gPiAtfQ0KPiANCj4gYnV0IHRo
YXQgZnVuY3Rpb24gd2FzIG1vdmVkIChBRkFJQ1QpIGZyb20gdmRlY19oMjY0X3JlcV9pZi5jIHdo
ZXJlIGENCj4gcmVndWxhciBtZW1jcHkgd2FzDQo+IHVzZWQuDQo+IA0KPiBEaWQgeW91IG1pc3Mg
b25lIGlvbWVtIGNhc2U/DQo+IA0KPiBDYW4gSSBjaGFuZ2UgbXRrX3ZkZWNfaDI2NF9jb3B5X3Nj
YWxpbmdfbWF0cml4KCkgdG86DQo+IA0KPiB2b2lkIG10a192ZGVjX2gyNjRfY29weV9zY2FsaW5n
X21hdHJpeChzdHJ1Y3QNCj4gc2xpY2VfYXBpX2gyNjRfc2NhbGluZ19tYXRyaXggKmRzdF9tYXRy
aXgsDQo+IAkJCQkgICAgICAgY29uc3Qgc3RydWN0DQo+IHY0bDJfY3RybF9oMjY0X3NjYWxpbmdf
bWF0cml4ICpzcmNfbWF0cml4KQ0KPiB7DQo+IAltZW1jcHkoZHN0X21hdHJpeC0+c2NhbGluZ19s
aXN0XzR4NCwgc3JjX21hdHJpeC0NCj4gPnNjYWxpbmdfbGlzdF80eDQsDQo+IAkgICAgICAgc2l6
ZW9mKGRzdF9tYXRyaXgtPnNjYWxpbmdfbGlzdF80eDQpKTsNCj4gDQo+IAltZW1jcHkoZHN0X21h
dHJpeC0+c2NhbGluZ19saXN0Xzh4OCwgc3JjX21hdHJpeC0NCj4gPnNjYWxpbmdfbGlzdF84eDgs
DQo+IAkgICAgICAgc2l6ZW9mKGRzdF9tYXRyaXgtPnNjYWxpbmdfbGlzdF84eDgpKTsNCj4gfQ0K
PiANCj4gSWYgdGhhdCdzIE9LLCB0aGVuIEknbGwgZG8gdGhhdCBtYW51YWxseSwgc28gbm8gbmVl
ZCB0byBwb3N0IGEgdjEzLg0KPiANCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUsIHNvIHRo
aXMgaXMgdGhlIG9ubHkgaXNzdWUgdGhhdCBuZWVkcyB0bw0KPiBiZSByZXNvbHZlZC4NCj4gDQo+
IFJlZ2FyZHMsDQo+IA0KMTogRm9yIGgyNjRfcmVxX2lmLmMgbm8gbmVlZCB0byBhZGQgX19pb21l
bSBhbnltb3JlLiBZb3UgY2FuIGhlbHAgdG8NCmNoYW5nZSBpdCBkaXJlY3RseS4NCg0KMjogQ291
bGQgeW91IHBsZWFzZSBoZWxwIHRvIGFkZCBmb3Igd2hvbGUgc2VyaWVzOiBUZXN0ZWQtYnk6IE7D
rWNvbGFzIEYuDQpSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQoNCmFjY29y
ZGluZyB0byBOaWNvbGFzJ3MgbWFpbC4NCg0KSGkgWXVuZmVpLA0KDQpXaXRoIHRoaXMgc2VyaWVz
LCBhbmQgdGhlIG5ldyBzY3AuaW1nIGZvciBtdDgxOTIgWzFdIChzdGlsbCB3YWl0aW5nIHRvDQpn
ZXQNCm1lcmdlZCksIEkgd2FzIGFibGUgdG8gZ2V0IHRoZSBmb2xsb3dpbmcgZmx1c3RlciBzY29y
ZXMgb24NCm10ODE5Mi1hc3VyYWRhLXNwaGVyaW9uOg0KDQpWUDg6IDU5LzYxDQpWUDk6IDI0OS8z
MDMNCkguMjY0OiA5Mi8xMzUNCg0KU28gZm9yIHRoZSB3aG9sZSBzZXJpZXM6DQoNClRlc3RlZC1i
eTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KDQo+
IAlIYW5zDQo+IA0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0DQo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
