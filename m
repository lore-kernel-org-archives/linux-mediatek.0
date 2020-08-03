Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41A7C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 04:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81392206F6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 04:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CpoMb6x1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LKG2P4md"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81392206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6CjoQLYC46y32PttoBIc2aHgXv7crCixFbAhwzyVEo=; b=CpoMb6x141PLaSApiGly+hn8S
	qwQqb4dyktyVc+3QJmKjl7QBfH4ZUJx8Iarl7OR3q0tcMV9cHfq4xfTjWEzB+Zn/eIpwQG9k73Bn7
	Vid7pN4j4fVIOKelbAT6SMYHCbSXkzwR9W4Z8QK79SH5N1JJTNQb+dwm3TfiCSbM8c9I4n03Vob2C
	Y5nuiPj8XhB4zmsmDzpnwOwdyEFqK9uyeafBIfRYELkH0/fIW8MoqwmKTJDNilofxFnDyZpFJzTeY
	9emtToIonsWHOZxYgBI/ZR3iV+5rf093P/RIaIMOt70Dz6SE9Lc7Pb7b1rAMs/SQuRgYNqfSJH5+s
	L4n/mG1rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2RoJ-0007Oq-Mn; Mon, 03 Aug 2020 04:10:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2RoF-0007Np-BV; Mon, 03 Aug 2020 04:10:48 +0000
X-UUID: 0ff5161a487f4dc7abeb860098e29614-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Zgi3EbJa/AeWx8xMnAPwVqIIwAidH8IpACy77bhI1VI=; 
 b=LKG2P4mdp9x4iZWjhLakvUIF/fYH5wLLS2tk+IuIQyxA3lRAMQT0VXEb3EOdRKdD6m669uGwaE1VAXQiQl43h4VOV3Dh8u8MBe3EZQZfE0hH0DpNQ2/kQtACaD0BkqfUnA/lm8MHMRDqF9cZC2InJ2kn0apILyPbBfxf3Qg6VSQ=;
X-UUID: 0ff5161a487f4dc7abeb860098e29614-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 70989191; Sun, 02 Aug 2020 20:10:40 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 21:05:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 12:05:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 12:05:46 +0800
Message-ID: <1596427546.22971.23.camel@mtkswgap22>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Aug 2020 12:05:46 +0800
In-Reply-To: <CAAOTY_-RMT-1+-5aPxqhgLbk74j0MH8U78mibBZppt_OPPQrJA@mail.gmail.com>
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-RMT-1+-5aPxqhgLbk74j0MH8U78mibBZppt_OPPQrJA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_001047_640446_3A3FB31D 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KT24gU3VuLCAyMDIwLTA4LTAyIGF0IDA3OjUwICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDI55pelIOmAseS4iSDkuIvljYg0OjI55a+r6YGT
77yaDQo+ID4NCj4gPiBNZWRpYVRlayBidXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1
cml0eSBzdXBwb3J0IGFuZCBkYXRhDQo+ID4gcHJvdGVjdGlvbiB0byBwcmV2ZW50IHNsYXZlcyBm
cm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQNCj4gPiBtYXN0ZXJzLg0KPiA+IFRoZSBz
ZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3IgZm9y
DQo+ID4gZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuDQo+ID4NCj4gPiBBbnkg
b2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJydXB0
LCBhbmQNCj4gPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFwYyBkcml2ZXIuIFRoZSB2
aW9sYXRpb24NCj4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhl
IG11cmRlcmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1QG1l
ZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4gK3N0cnVj
dCBtdGtfZGV2YXBjX2NvbnRleHQgew0KPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Ow0K
PiA+ICsgICAgICAgdTMyIHZpb19pZHhfbnVtOw0KPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpk
ZXZhcGNfcGRfYmFzZTsNCj4gDQo+IFRoaXMgaXMgZGV2YXBjIGNvbnRleHQsIHNvIHByZWZpeCAn
ZGV2YXBjJyBpcyByZWR1bmRhbnQuDQo+IEFuZCwgd2hhdCBkb2VzICdwZCcgbWVhbj8NCg0KJ3Bk
JyBtZWFucyBwb3dlciBkb3duLiBPZiBjb3Vyc2Ugd2Ugd291bGQgYWxzbyByZW1vdmUgaXQgYXMg
d2VsbC4NCkkgc3VnZ2VzdCB0byBjaGFuZ2UgaXQgYXMgJ2luZnJhX2Jhc2UnLg0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBj
X3Zpb19pbmZvICp2aW9faW5mbzsNCj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBj
X3BkX29mZnNldCAqb2Zmc2V0Ow0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNf
dmlvX2RiZ3MgKnZpb19kYmdzOw0KPiA+ICt9Ow0KPiA+ICsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
