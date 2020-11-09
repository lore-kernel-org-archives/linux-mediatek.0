Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4E5C388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 01:47:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21ED9206C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 01:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FmbxEhvW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bW6/AYYJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21ED9206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T4vu7o2rUJKXo27lAMPQPx9tTlHm+FFraEeaFMxWADY=; b=FmbxEhvWAEVW2iRwvyDQ+KFrY
	ZhEoUkSELj7Ory57X0Q0YapG2pwBrQKGvUfqvL/3II0WC0+tCBMj2H3XcQrrw8rRrtev7OtyMRNg9
	xIuPEFUYNbnWWvgEyzlkxc6QZKn13KcJMcurd2T4VSGbdnS0qpaJq8l1TGWWoAPXIvYZhucuPtXll
	yAL8FImk/WlJh5+IRtUdh2ZrnCk248JnWvYkPhPqzacZFgIFBU9BBIzxU9XcA9ZOgcP06yEi85Ix4
	nkutsDD2393FyQZWGVtuC9OisIWMUny7Mg6/Xj+kLzbOnQfs1Z+W1F6vOfKbMFJzkVXF5VqRs2JBd
	FZnfQOzug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbwHH-0001T2-SF; Mon, 09 Nov 2020 01:47:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbwHF-0001SO-9A
 for linux-mediatek@lists.infradead.org; Mon, 09 Nov 2020 01:47:26 +0000
X-UUID: f58722483d634314a8897311b17baded-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=P2/u2G2PWkxrVDOi7euvixdoAYgr4i4zVGrK1c98XqI=; 
 b=bW6/AYYJ6dsXDslM5kKRFAy0RAuZ8lA20HPypc+46xtn2jRAvNHpwUR5TLHeO4pCh3zkYX/xcpa5sRu2dwXIhQJClxcNiUPNsek+1MxvHCa9ZmMuHhXYbi/upqwqmnpyKO4Qi/1cxI4g694YtN0elmY8KsqCbqhcuvxlAhVii0E=;
X-UUID: f58722483d634314a8897311b17baded-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 432096953; Sun, 08 Nov 2020 17:47:14 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 17:47:13 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 09:47:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 09:47:10 +0800
Message-ID: <1604886429.31607.20.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Nov 2020 09:47:09 +0800
In-Reply-To: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-4-chunkuang.hu@kernel.org>
 <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18D2AF7C1A1FFBD221F4820A9D115C9E1FA2F4AA454C834A65245B32E995E8E02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_204725_471131_47A59899 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIwLTExLTA4IGF0IDExOjA0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiArIFZpbm9kOg0KPiANCj4gSGksIENodW5mZW5nOg0KPiANCj4gQ2h1bi1LdWFuZyBIdSA8Y2h1
bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIgyOeaXpSDpgLHlm5sg5LiL5Y2I
MTE6Mjjlr6vpgZPvvJoNCj4gPg0KPiA+IE1lZGlhdGVrIE1JUEkgRFNJIHBoeSBkcml2ZXIgaXMg
bW92ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsgdG8NCj4gPiBkcml2ZXJzL3BoeS9t
ZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVyIHRvIHRoZSBNZWRpYXRlayBEUk0gZHJpdmVy
cycNCj4gPiBpbmZvcm1hdGlvbi4NCj4gDQo+IFdvdWxkIHlvdSBsaWtlIHRoaXMgcGF0Y2g/IElm
IHNvLCB5b3UgY291bGQgZ2l2ZSBhbiBhY2tlZC1ieSB0YWcgb24NCj4gdGhpcyBwYXRjaCwgc28g
SSBjb3VsZCBhcHBsaWVkIHRoZSB3aG9sZSBzZXJpZXMgaW50byBteSB0cmVlLg0KQWNrZWQtYnk6
IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzDQoNCj4g
DQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gIE1B
SU5UQUlORVJTIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiBpbmRleCBl
NzM2MzZiNzVmMjkuLjE0ZjUwMThjMDFiNiAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0K
PiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTU4NjcsNiArNTg2Nyw3IEBAIFM6ICAgICAg
ICBTdXBwb3J0ZWQNCj4gPiAgRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrLw0KPiA+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
Lw0KPiA+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKg0KPiA+ICtG
OiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKg0KPiA+DQo+ID4gIERSTSBE
UklWRVJTIEZPUiBOVklESUEgVEVHUkENCj4gPiAgTTogICAgIFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+DQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
