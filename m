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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A7922571
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A7922571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc/2vZ6JhP2JbMxmR7X51FcRKe34U4VAObSP2/si8Qs=; b=I6OCRnIrbGLb/KucJma5KZRy6l
	9IfEXHflWlTzrH3nR6k69BbbHPzAaNyPqsc9ZAxFcFSPAySV81dkC00WUgol2UM1m1P7IEJNaaAVe
	cqvVcKAbBlgwJ51ulhKilH2/A091shuavqdsE2t/uC8v+LwcLnW4eRpk7C2ujbtWNZFpR35LGLXnZ
	N3iedL0E4aI3qHte+FR8ecewD0WglYjgIf4bWvlx+n3bOX6YTDLrFq28BPfUhYQ0NtQa57rLwiXv5
	HVSln/tKl4PFLWjPfMOyvm0o8dG1MqS0bbEVAV/kL8bYEGRgXHNnpD5gVt86099SZ2KGFgzjzJ9z5
	dZOMY1ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtG7-000445-2N; Wed, 23 Dec 2020 01:48:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtFz-00041d-PR; Wed, 23 Dec 2020 01:48:05 +0000
X-UUID: 6bc6019b774c485eb941d0255b40c781-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xbwGmFFXUIPvzjsYAQjwo15U9o4mg+NebaRJaHTcEIw=; 
 b=IQ0FX7iSbNyPH+p7BIgU/4YTue6UXjJGT6T4BJ0TLxhVSdlphfjOmJvJiwCFrLLK+y7XwimF23P+ks/kt5z03K49Bb5icm1GUDUr9Qp3Up/i2dwLYqoxwnp7EIQ7831kSBcAx5iC7Qrf3zZQ30+OEIcobOctX7j9s3DIUFD72I0=;
X-UUID: 6bc6019b774c485eb941d0255b40c781-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389203631; Tue, 22 Dec 2020 17:47:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:37:54 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:37:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:37:50 +0800
Message-ID: <1608687471.18252.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:37:51 +0800
In-Reply-To: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_204804_087000_948C1A1B 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDA3OjQwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTPlr6vpgZPv
vJoNCj4gPg0KPiA+IGZpeCBnYW1tYSBzaXplIGNvbmZpZw0KPiANCj4gSSB3b3VsZCBsaWtlIHlv
dSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24uIFRoZSBvcmlnaW5hbCBjb2RlIHdvcmtzDQo+
IGluIG10ODE3Mywgd2h5IGRvIHlvdSBtb2RpZnkgdGhpcz8gVGhlIGRlc2NyaXB0aW9uIG1heSBi
ZSBzb21ldGhpbmcNCj4gbGlrZSB0aGlzOg0KPiANCj4gQWNjb3JkaW5nIHRvIGRhdGEgc2hlZXQs
IHRoZSB3aWR0aCBpcyBpbiBiaXRzIFszMSwgMTZdIGFuZCBoZWlnaHQgaXMNCj4gaW4gYml0cyBb
MTUsIDBdLiBFdmVuIHRob3VnaCB3cm9uZyBzZXR0aW5nIG1heSB3b3JrcyBpbiBzb21lIFNvQyBz
dWNoDQo+IGFzIG10ODE3MywgYnV0IGl0IGRvZXMgbm90IHdvcmsgaW4gbXQ4MTkyLg0KPiANCj4g
UmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCg0KaXQgc3RpbGwgd29ya3MgaW4gbXQ4MTkyLg0KanVz
dCBtb2RpZnkgdGhpcyBmb2xsb3cgZGF0YSBzaGVldA0KDQo+IA0KPiA+DQo+ID4gRml4ZXM6IGUw
YTVkMzM3MDI0NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2ljIGZ1bmN0aW9u
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYw0KPiA+IGluZGV4IDAwZDU2ODcuLjUyYjZmYzcgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gPiBAQCAtMjk3LDcg
KzI5Nyw3IEBAIHN0YXRpYyB2b2lkIG10a19nYW1tYV9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IHcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywgc3RydWN0IGNtZHFfcGt0ICpjbWRx
X3BrdCkNCj4gPiAgew0KPiA+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAx
NiB8IHcsIGNvbXAsIERJU1BfR0FNTUFfU0laRSk7DQo+ID4gKyAgICAgICBtdGtfZGRwX3dyaXRl
KGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsNCj4gPiAgICAg
ICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1NQV9DRkcsIGNtZHFfcGt0KTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
aw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
