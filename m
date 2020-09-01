Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71839C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 01:52:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D9520707
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 01:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vZcrYQub";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gy8DlTHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D9520707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hPafQkTabjjhqCc3pK5wCvZ4RK8Eh/X3/dzc0sk03tk=; b=vZcrYQubelok7KPLlgIDu2ret
	oJhvyJH72pyWkUV1pg06ao9AEpPzFHMB9zN83CtvhxG7g9yf0zFrNpapMa1/qowaZO01PQdmw1JKv
	kv8LMhlPn3LtjlRAzKDp0+dedLglyZNSws9wjWoWFMxncMijKj0WT2Utow72udWbtssGB6Oadhyqn
	9cPTi+9lWtqjv2glYUMhRn6IGeKa7we5Oycr6DzUiYukuGdf6ZfF92DwuefIqNlhVZSf9DcdPgkvk
	QFGk9k22YrNrfENTMBUBchy/opPa93E3AP0YbxdhpZZOuGyWCyh/xH/P4sflq8IiWo84NMdEv2f0w
	o0kdvFPOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCvSf-0001L2-2K; Tue, 01 Sep 2020 01:51:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCvSb-0001KJ-6R
 for linux-mediatek@lists.infradead.org; Tue, 01 Sep 2020 01:51:46 +0000
X-UUID: fd1bd657a8b04714b65c75c843b6b503-20200831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qJACcI5q4eOD/v6iC3fhkqz1GyF30C7lbgepzbjso/E=; 
 b=gy8DlTHvfVvc0T6QcfiF9Oi9m5JJMrVlEF+76bawofYPM4epNdaDKMVah5Ss2GOgE00pAd/7VLAd4KVGrk388A6HTiTCygffimyAHr4PpVfIliVFvEc7MZOorj3crNbID+Ju7mYg95LDyzgd9cE0sdOrZ9LUpoZDM9X5venRqaw=;
X-UUID: fd1bd657a8b04714b65c75c843b6b503-20200831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1285397997; Mon, 31 Aug 2020 17:51:39 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 Aug 2020 18:51:37 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Sep 2020 09:51:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Sep 2020 09:51:34 +0800
Message-ID: <1598924999.11403.3.camel@mhfsdcap03>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Sep 2020 09:49:59 +0800
In-Reply-To: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
 <1598838539.7054.9.camel@mhfsdcap03>
 <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 724E468EB20BBC4E102A084E01A7702051D82B5CA6D15ABC5921E762D5A8F58F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_215145_359503_516174F6 
X-CRM114-Status: GOOD (  17.57  )
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTA5LTAxIGF0IDAwOjAyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIw5bm0OOaciDMx5pelIOmAseS4gCDkuIrljYg5OjUw5a+r6YGT77yaDQo+
ID4NCj4gPiBPbiBTdW4sIDIwMjAtMDgtMjMgYXQgMDk6NDggKzA4MDAsIENodW4tS3VhbmcgSHUg
d3JvdGU6DQo+ID4gPiBNZWRpYXRlayBIRE1JIHBoeSBkcml2ZXIgaXMgbW92ZWQgZnJvbSBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsgdG8NCj4gPiA+IGRyaXZlcnMvcGh5L21lZGlhdGVrLCBzbyBh
ZGQgdGhlIG5ldyBmb2xkZXIgdG8gdGhlIE1lZGlhdGVrIERSTSBkcml2ZXJzJw0KPiA+ID4gaW5m
b3JtYXRpb24uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1
bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIE1BSU5UQUlORVJT
IHwgMSArDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiA+IGluZGV4IGRl
YWFmYjYxNzM2MS4uMTkxYmFjZjAyMjA5IDEwMDY0NA0KPiA+ID4gLS0tIGEvTUFJTlRBSU5FUlMN
Cj4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiBAQCAtNTc5Myw2ICs1NzkzLDcgQEAgTDog
ICAgICBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiAgUzogICBTdXBwb3J0
ZWQNCj4gPiA+ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrLw0KPiA+ID4gIEY6ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrLw0KPiA+ID4g
K0Y6ICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pKg0KPiA+ID4NCj4gPiA+ICBE
Uk0gRFJJVkVSUyBGT1IgTlZJRElBIFRFR1JBDQo+ID4gPiAgTTogICBUaGllcnJ5IFJlZGluZyA8
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IENodW5mZW5n
IFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gPg0KPiANCj4gQ291bGQgeW91IGdp
dmUgYW4gJ0Fja2VkLWJ5JyB0YWcgb24gdGhpcyBwYXRjaD8gU28gSSBjb3VsZCBhcHBseSB0aGUN
Cj4gd2hvbGUgc2VyaWVzIGludG8gbXkgdHJlZS4NCkFja2VkLWJ5OiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQoNClRoYW5rcw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBD
aHVuLUt1YW5nLg0KPiANCj4gPiBUaGFua3MNCj4gPg0KPiA+DQo+ID4NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
