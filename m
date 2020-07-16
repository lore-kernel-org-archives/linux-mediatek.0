Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCA9C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 03:53:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1042071B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 03:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2gLudhP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ot8bMGEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1042071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gx88Z1Gh0YkRo5gTc+2imG+Io7MkcVGjR15OS/26IC8=; b=n2gLudhPysgSVdAXp/SxxxVUt
	+ADL2N2lfd//xiglAF/B7OSXVOUxOVXJ+PuEnm9i5C9wAKMdSyig3Xzq9SB9U7Kxh2bHnBZ4Bs3mf
	zmxdhxW1MZFNWOYNhG7MEKL6YWm97ptBmkHqAiDuiAHvpj+1dSfP5X3krwXLnGzWFC/wpM+dFTeOZ
	vIr/M5rT15HWyB0tVgAUFUR10lpUODG0okxcIA18Eap7u3SXVlXVHCSCb1z5g5999bo563qe6MNNU
	HxWsVGEbRCpqys+eDsqDAFywYAIA1+qJaFRirgmeRMSZvW3z1xTcf0Kekum2jkpLoUxHtcPGTt8U5
	UWZkHCSHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvux1-000135-GP; Thu, 16 Jul 2020 03:52:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvuwx-00012S-Hu; Thu, 16 Jul 2020 03:52:49 +0000
X-UUID: e45180f9119a4855a5a3706c35d122d8-20200715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CEsk1XhS81S7YqCL2/cfWNZFVQ4l+rq1KaxE7ps3pAk=; 
 b=ot8bMGEuqZnvlaEM5bTelmKbuXoEhy3D168PxipH1v4qMrueDtoW5Jpa65+AtkCq40uGMlBhPfiX2xRM+UwggvVU7yQjJZ0JCvpm/QFLhItZwRyibzn6zndysV3u2dmJu1IZva0SFd3T3vliUEaZvJRBBf/ipeeS5fVgvsvcK5c=;
X-UUID: e45180f9119a4855a5a3706c35d122d8-20200715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1612189449; Wed, 15 Jul 2020 19:52:41 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jul 2020 20:42:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 11:42:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jul 2020 11:42:29 +0800
Message-ID: <1594870950.5018.3.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 16 Jul 2020 11:42:30 +0800
In-Reply-To: <CAAOTY_-6d12FUf5XnYco0f0CfeWsb-XjsCESsLixLr_Q=jnc0Q@mail.gmail.com>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-6d12FUf5XnYco0f0CfeWsb-XjsCESsLixLr_Q=jnc0Q@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_235247_789172_D20A85C1 
X-CRM114-Status: GOOD (  20.46  )
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

SGkgQ2h1bi1LdWFuZywNCg0KT24gVGh1LCAyMDIwLTA3LTE2IGF0IDA3OjQ2ICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBISSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDnml6Ug6YCx5ZubIOS4i+WNiDU6MTPlr6vpgZPv
vJoNCj4gPg0KPiA+IE1lZGlhVGVrIGJ1cyBmYWJyaWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3Vy
aXR5IHN1cHBvcnQgYW5kIGRhdGENCj4gPiBwcm90ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZy
b20gYmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3RlZA0KPiA+IG1hc3RlcnMuDQo+ID4gVGhlIHNl
Y3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHByb2Nlc3NvciBmb3IN
Cj4gPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4NCj4gPg0KPiA+IEFueSBv
Y2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBpbnRlcnJ1cHQs
IGFuZA0KPiA+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4gVGhlIHZp
b2xhdGlvbg0KPiA+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUg
bXVyZGVyZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVk
aWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICsNCj4gPiArLyoNCj4g
PiArICogbXRrX2RldmFwY19kdW1wX3Zpb19kYmcgLSBzaGlmdCAmIGR1bXAgdGhlIHZpb2xhdGlv
biBkZWJ1ZyBpbmZvcm1hdGlvbi4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBib29sIG10a19kZXZh
cGNfZHVtcF92aW9fZGJnKHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgKmRldmFwY19jdHgsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHNsYXZlX3R5cGUsIGlu
dCAqdmlvX2lkeCkNCj4gPiArew0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZpY2Vf
aW5mbyAqKmRldmljZV9pbmZvOw0KPiA+ICsgICAgICAgdTMyIHNoaWZ0X2JpdDsNCj4gPiArICAg
ICAgIGludCBpOw0KPiA+ICsNCj4gPiArICAgICAgIGRldmljZV9pbmZvID0gZGV2YXBjX2N0eC0+
ZGV2aWNlX2luZm87DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGdldF92aW9f
c2xhdmVfbnVtKHNsYXZlX3R5cGUpOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgICAgKnZpb19p
ZHggPSBkZXZpY2VfaW5mb1tzbGF2ZV90eXBlXVtpXS52aW9faW5kZXg7DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgICBpZiAoY2hlY2tfdmlvX21hc2soZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwg
KnZpb19pZHgpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiANCj4g
SSBndWVzcyBpZiBvbmUgdmlvX2lkeCBpcyBtYXNrZWQsIGl0cyBzdGF0dXMgd291bGQgbmV2ZXIg
YmUgdHJ1ZS4gSWYNCj4gbXkgZ3Vlc3MgaXMgcmlnaHQsIEkgdGhpbmsgeW91IGNvdWxkIHNraXAg
Y2hlY2tfdmlvX21hc2soKSBhbmQNCj4gZGlyZWN0bHkgY2hlY2tfdmlvX3N0YXR1cygpLg0KDQpO
by4gRXZlbiBpZiB2aW9faWR4IGlzIG1hc2tlZCwgdmlvX3N0YXR1cyB3aWxsIHN0aWxsIHJhaXNl
IHdoZW4NCnZpb2xhdGlvbiBpcyB0cmlnZ2VyZWQuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAoIWNoZWNrX3Zpb19zdGF0dXMoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgKnZp
b19pZHgpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgc2hpZnRfYml0ID0gZ2V0X3NoaWZ0X2dyb3VwKGRldmFwY19jdHgs
IHNsYXZlX3R5cGUsICp2aW9faWR4KTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGlmICgh
c3luY192aW9fZGJnKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsIHNoaWZ0X2JpdCkpDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICBkZXZhcGNfZXh0cmFjdF92aW9fZGJnKGRldmFwY19jdHgsIHNsYXZlX3R5cGUpOw0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+IA0KPiBJIHRoaW5rIG11bHRpcGxl
IHZpb19pZHggd291bGQgdmlvbGF0ZSBhdCB0aGUgc2FtZSB0aW1lLCB3aHkganVzdCBwcm9jZXNz
IG9uZT8NCg0KV2UgcHJvY2VzcyBlYWNoIHZpb19pZHggZm9yIGVhY2ggaW50ZXJydXB0Lg0KSWYg
dGhlcmUgYXJlIG11bHRpcGxlIHZpb19pZHggaXMgcmFpc2VkLCBpdCB3aWxsIHRyaWdnZXIgYW5v
dGhlcg0KaW50ZXJydXB0IHRvIGhhbmRsZSBpdC4NCg0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1L
dWFuZy4NCj4gDQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIGZhbHNl
Ow0KPiA+ICt9DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
