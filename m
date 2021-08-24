Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EACC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 04:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F1D61356
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 04:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88F1D61356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6zIQ0AsJisuT84X4ha/pTg+ne2m2Uf0p1LM4rHGeDQ=; b=qx6kq+9/gNMmE3
	8f0bmWnfPOE4A6AOoA21JI1VWz0VDdn7lBma8XevqI0+LQZd2HNt8eeSAKvZ3lod2uK5RA/fmz3qL
	j3kP86vHnoerI+1osQSECp5U3DCCfokX6Rl662qSl5rocj/5i6VxVy7opYSTrvc1d6eUcJBcoRjQY
	rNIf7iFrwagLeNGwujsFhcZm6POf7kHC+j9L35QnC6eXIuNcGy9ggOcF0ML6wZZLOaRER/shSA8FO
	t/FKQZZhAb4VpHlS8SdrmfYfAhznX4nHkOT0DEhG4gL7wLySOFM0yJPeQUV0vcLAiGzXORbkBDM6U
	2VVq7D+caNVrmcpVFxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIORo-001arj-OA; Tue, 24 Aug 2021 04:54:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIORk-001apX-3J; Tue, 24 Aug 2021 04:54:03 +0000
X-UUID: e9d2bb85d5594d0cb7bb47bd845e9fb3-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VmCTcsc6OQs5xiP6AIS4kmDLg5iYQQYaJHtFNW6YXx8=; 
 b=QclphshFZ6ZpfMh8tQEk0523m27Fd4csvcPYCahvYxTHrbOUjzcac4UlH/4pcXPifDVaRqiPEzjwXgQRfcEus+cNxlznOTMFNeAJfIrQxlyxVl68ywti35bL6oUfrgH7Jig6H6TDb0s+vWjUvzPfZlCn6Bv4CGKFGlAUCa6iVdU=;
X-UUID: e9d2bb85d5594d0cb7bb47bd845e9fb3-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1182018103; Mon, 23 Aug 2021 21:53:52 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 21:53:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 12:53:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:53:49 +0800
Message-ID: <231a458307f3037034cfbcb9254b5d6b20df7922.camel@mediatek.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Tue, 24 Aug 2021 12:53:49 +0800
In-Reply-To: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
 <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_215400_173426_6A01C62B 
X-CRM114-Status: GOOD (  19.08  )
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

SGkgQ2h1bi1LdWFuZywNCg0KCVRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gU2F0LCAyMDIx
LTA4LTIxIGF0IDA3OjM3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmFuY3k6
DQo+IA0KPiBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0OOac
iDE45pelIOmAseS4iSDkuIvljYg1OjE45a+r6YGT77yaDQo+ID4gDQo+ID4gQWRkIGRyaXZlciBk
YXRhIG9mIG10ODE5NSB2ZG9zeXMxIHRvIG1lZGlhdGVrLWRybSBhbmQgbW9kaWZ5IGRybQ0KPiA+
IGZvcg0KPiA+IG11bHRpLW1tc3lzIHN1cHBvcnQuIFRoZSB0d28gbW1zeXMgKHZkb3N5czAgYW5k
IHZkb3N5czEpIHdpbGwgYnJpbmcNCj4gPiB1cCB0d28gZHJtIGRyaXZlcnMsIG9ubHkgb25lIGRy
bSBkcml2ZXIgcmVnaXN0ZXIgYXMgdGhlIGRybSBkZXZpY2UuDQo+ID4gRWFjaCBkcm0gZHJpdmVy
IGJpbmRzIGl0cyBvd24gY29tcG9uZW50LiBUaGUgZmlyc3QgYmluZCBkcm0gZHJpdmVyDQo+ID4g
d2lsbCBhbGxvY2F0ZSB0aGUgZHJtIGRldmljZSwgYW5kIHRoZSBsYXN0IGJpbmQgZHJtIGRyaXZl
cg0KPiA+IHJlZ2lzdGVycw0KPiA+IHRoZSBkcm0gZGV2aWNlIHRvIGRybSBjb3JlLiBFYWNoIGNy
dGMgcGF0aCBpcyBjcmVhdGVkIHdpdGggdGhlDQo+ID4gY29ycmVzcG9uZGluZyBkcm0gZHJpdmVy
IGRhdGEuDQo+IA0KPiBTZXBhcmF0ZSB0aGlzIHBhdGNoIHRvIHR3byBwYXRjaC4gT25lIGlzIHN1
cHBvcnQgdHdvIG1tc3lzLCBhbmQNCj4gYW5vdGhlciBvbmUgaXMgc3VwcG9ydCBtdDgxOTUgdmRv
c3lzMS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KT0ssIEkgd2lsbCBzZXBh
cmF0ZSBpdCBpbnRvIHR3byBwYXRjaGVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5
LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMgICB8ICAgNCArDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgfCAgMjUgKy0NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMyArLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgIDE1ICsNCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8ICAgMSArDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAzNzINCj4gPiArKysrKysr
KysrKysrKysrLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
aCAgICAgIHwgICA4ICstDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMzU0IGluc2VydGlvbnMoKyks
IDc0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
