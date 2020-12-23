Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC85EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 00:43:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A39F206E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 00:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A39F206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5MMUGV149JsVvWaBn7fOmjmviriDBStFd4gedCzrV4=; b=L2X9gJZRjtjynGUmllplJnQJja
	wAxzpuRLnzOG2m02eFyZpukWZJ3lpvpBmOi46j+9S7DETnBv7ta6fitK6jUs2VdbibiHjzpRrMgBa
	HJyShYvnieSEGCw7fzm44FLSKsFMHnd771l6im5w3qWhPIsH747T5l7g+4xQhWzbF0rwuhQ32VBSV
	nowpvejA4fWknSfIL4WNoZim0tXvADfLDrIr+EAx6vpBKRPEg3y1RUvy1TQlEgdMbZRi6SCicMJFE
	VvMyTrDN32OmrPr2ZU3HjSF/ixfs+StiEsqg7176z2xj1iwcbV3V40JXWVT7kc4Mj5YRNBvBfTk9M
	qm5373nA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krsFj-0005ZV-5l; Wed, 23 Dec 2020 00:43:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krsFa-0005X0-Ds; Wed, 23 Dec 2020 00:43:36 +0000
X-UUID: 019add27132142cabbc0e4da6e6a0917-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xqA5Ou9eTp2m/ylc+cO93423/qpI0vhuXJVv63vcPeA=; 
 b=C8RjATbaiDJhubZO6ML7gzKhkCI9GNsqB5GSdTK0HNoFMA4fGDpgSgO4VId9yDVudL4ZgYTCghv/3FB4HB+K0UlzWgEMVQR1uZVCCdoH7HHTzbaBrEaTcoz/EbkuXP/9/8U7S/UwjPFSNoE5ITPMBpAzW7UOblbvsr60rSpOkVk=;
X-UUID: 019add27132142cabbc0e4da6e6a0917-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1634037444; Tue, 22 Dec 2020 16:43:20 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 16:36:20 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 08:36:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 08:36:14 +0800
Message-ID: <1608683777.18252.1.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 4/5] soc: mediatek: cmdq: add address shift in jump
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 08:36:17 +0800
In-Reply-To: <CAAOTY__2CQ5mo6f0mXNHqcOg_xUCAd7LjkXS2OCf341Dm6rNCg@mail.gmail.com>
References: <1607141728-17307-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607141728-17307-5-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCX+iPXVg-xqVKBGNTfJty=cu+MQYaujjv4NgTd1C740A@mail.gmail.com>
 <CAAOTY__2CQ5mo6f0mXNHqcOg_xUCAd7LjkXS2OCf341Dm6rNCg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_194334_694417_0271880C 
X-CRM114-Status: GOOD (  24.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTEyLTA5IGF0IDIzOjE2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1
bS5vcmc+IOaWvCAyMDIw5bm0MTLmnIg15pelIOmAseWFrSDkuIvljYgzOjMw5a+r6YGT77yaDQo+
ID4NCj4gPiBPbiBTYXQsIERlYyA1LCAyMDIwIGF0IDEyOjE2IFBNIFlvbmdxaWFuZyBOaXUNCj4g
PiA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEFkZCBh
ZGRyZXNzIHNoaWZ0IHdoZW4gY29tcG9zZSBqdW1wIGluc3RydWN0aW9uDQo+ID4gPiB0byBjb21w
YXRpYmxlIHdpdGggMzViaXQgZm9ybWF0Lg0KPiA+DQo+ID4gVGhpcyBsb29rcyByZWFzb25hYmxl
LCBidXQgdGFzay0+Y21kcS0+c2hpZnRfcGEgaXMgbm90IG5ldyBhbmQgd2FzDQo+ID4gaW50cm9k
dWNlZCBhcyBwYXJ0IG9mIG10Njc3OSBHQ0Ugc3VwcG9ydC4NCj4gPg0KPiA+IERvIHlvdSB3YW50
IHRvIGFkZCBhIEZpeGVzIHRhZz8NCj4gPiBGaXhlczogMDg1OGZkZTQ5NmY4ICgibWFpbGJveDog
Y21kcTogdmFyaWFibGl6ZSBhZGRyZXNzIHNoaWZ0IGluIHBsYXRmb3JtIikNCj4gDQo+IEFkZCB0
aGlzIGZpeGVzIHRhZywgYW5kIG1vdmUgdGhpcyBwYXRjaCBvdXQgb2YgdGhpcyBzZXJpZXMgYmVj
YXVzZQ0KPiB0aGlzIHBhdGNoIGlzIHJlbGF0ZWQgdG8gYWxsIFNvQyB3aG9zZSBzaGlmdF9wYSBp
cyBub3QgemVyby4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KDQoNCnRoZSBu
ZXh0IHZlcnNpb24gd2lsbCBtb3ZlIHRoaXMgb3V0IG9mIDgxOTIgc2VyaWVzIGFuZCBhZGQgZml4
ZWQgdGFncw0KDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogTmljb2xhcyBCb2ljaGF0IDxkcmlua2Nh
dEBjaHJvbWl1bS5vcmc+DQo+ID4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRy
aXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgfCAzICsrLQ0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiA+IGluZGV4IDFjMDFmZTAuLjVlZDM5ZjggMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gPiBAQCAtMTc0
LDcgKzE3NCw4IEBAIHN0YXRpYyB2b2lkIGNtZHFfdGFza19pbnNlcnRfaW50b190aHJlYWQoc3Ry
dWN0IGNtZHFfdGFzayAqdGFzaykNCj4gPiA+ICAgICAgICAgZG1hX3N5bmNfc2luZ2xlX2Zvcl9j
cHUoZGV2LCBwcmV2X3Rhc2stPnBhX2Jhc2UsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHByZXZfdGFzay0+cGt0LT5jbWRfYnVmX3NpemUsIERNQV9UT19ERVZJQ0UpOw0K
PiA+ID4gICAgICAgICBwcmV2X3Rhc2tfYmFzZVtDTURRX05VTV9DTUQocHJldl90YXNrLT5wa3Qp
IC0gMV0gPQ0KPiA+ID4gLSAgICAgICAgICAgICAgICh1NjQpQ01EUV9KVU1QX0JZX1BBIDw8IDMy
IHwgdGFzay0+cGFfYmFzZTsNCj4gPiA+ICsgICAgICAgICAgICAgICAodTY0KUNNRFFfSlVNUF9C
WV9QQSA8PCAzMiB8DQo+ID4gPiArICAgICAgICAgICAgICAgKHRhc2stPnBhX2Jhc2UgPj4gdGFz
ay0+Y21kcS0+c2hpZnRfcGEpOw0KPiA+ID4gICAgICAgICBkbWFfc3luY19zaW5nbGVfZm9yX2Rl
dmljZShkZXYsIHByZXZfdGFzay0+cGFfYmFzZSwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJldl90YXNrLT5wa3QtPmNtZF9idWZfc2l6ZSwgRE1BX1RPX0RFVklD
RSk7DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDEuOC4xLjEuZGlydHkNCj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gPiBMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QNCj4gPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsNCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
