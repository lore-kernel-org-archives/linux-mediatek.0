Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3A0C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 03:07:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738FE217D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 03:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HQtUPsR6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RVJaPakc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738FE217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3i4TMxpNsItvbNhaHBud3jyYxkxWtVkZD+UKrtia1O4=; b=HQtUPsR61k8pgP81QylqUjkeY
	UKNC6mtAD/qx2FE2GUiRmXFevn+IaTeCpAY6BWI1ZJsozumRzxJsZpDYWB80ROeXaiv/rUzShL9OB
	liQ066bQ8w/sl0cuMMtAG/Zlq1Mduk+9Ry+3DemjLQbrSQ60fYXgcpJI6eWg9UtvQouBEhHbx8S8V
	1PC+djHiFTJWy8kuQckkiMGp9OcJd+uLTDzI1WmvKtVwAgEUvu9qJkQ+SvROhnrDupTqOdL53vWcz
	amd5cZIfqgZtSKkvOec3aJGDmriOW6Dw7afGoTQYTiaz7FJnVoqvavMS6IfusmMcC1m/B51P0XirJ
	ZibsQm7HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvBHc-0004vM-Ih; Tue, 14 Jul 2020 03:07:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvBHY-0004uh-Fh; Tue, 14 Jul 2020 03:07:02 +0000
X-UUID: f86bda5fea4a40ea9914350408cf3637-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FgffRArMkE/7KEXUhK6dJi/sJmpWs+uSsflJMwEGte0=; 
 b=RVJaPakcNXSKxBc7GF0k/PXAN/NN2OhEay0CM0gyj/mX6Tu23d4/MUe2WyXjBROAo6medcMq+qWhwGM4Ov1Ee2OkXbn2k1iojt34+gEm/i2zHKoFX/Ix2fQRbsGDFRaP8SPsEgEgsQ+lCN5THsdSjM2CRkZxhqpSlSp92iVhQl8=;
X-UUID: f86bda5fea4a40ea9914350408cf3637-20200713
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1661967495; Mon, 13 Jul 2020 19:06:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 20:06:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 11:06:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 11:06:51 +0800
Message-ID: <1594696012.26207.11.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 14 Jul 2020 11:06:52 +0800
In-Reply-To: <CAAOTY_931nJb2Ove5NzfAWX=xy0D3oj6y5d0ThRsvhANFf1_BQ@mail.gmail.com>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
 <1594351423.4670.18.camel@mtkswgap22>
 <CAAOTY_9MPYi=FAisE50UzT=eceSykN+Z8HnfFLLg_uRDhPAkpg@mail.gmail.com>
 <1594628844.22730.48.camel@mtkswgap22>
 <CAAOTY_931nJb2Ove5NzfAWX=xy0D3oj6y5d0ThRsvhANFf1_BQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_230700_788010_57E07BB4 
X-CRM114-Status: GOOD (  45.36  )
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

SGkgQ2h1bi1LdWFuZywNCg0KT24gTW9uLCAyMDIwLTA3LTEzIGF0IDIyOjIwICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDEz5pelIOmAseS4gCDkuIvljYg0OjI35a+r6YGT
77yaDQo+ID4NCj4gPiBIaSBDaHVuLUt1YW5nLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHJl
dmlldy4NCj4gPg0KPiA+IE9uIEZyaSwgMjAyMC0wNy0xMCBhdCAyMjoyMSArMDgwMCwgQ2h1bi1L
dWFuZyBIdSB3cm90ZToNCj4gPiA+IEhpLCBOZWFsOg0KPiA+ID4NCj4gPiA+IE5lYWwgTGl1IDxu
ZWFsLmxpdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDEw5pelIOmAseS6lCDkuIrljYgx
MToyM+Wvq+mBk++8mg0KPiA+ID4gPg0KPiA+ID4gPiBIaSBDaHVuLUt1YW5nLA0KPiA+ID4gPg0K
PiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUaHUs
IDIwMjAtMDctMDkgYXQgMjE6MDEgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+ID4gPiA+
ID4gSGksIE5lYWw6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVk
aWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIg55pelIOmAseWbmyDkuIvljYg1OjEz5a+r6YGT77ya
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBU
cnVzdFpvbmUgc2VjdXJpdHkgc3VwcG9ydCBhbmQgZGF0YQ0KPiA+ID4gPiA+ID4gcHJvdGVjdGlv
biB0byBwcmV2ZW50IHNsYXZlcyBmcm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQNCj4g
PiA+ID4gPiA+IG1hc3RlcnMuDQo+ID4gPiA+ID4gPiBUaGUgc2VjdXJpdHkgdmlvbGF0aW9uIGlz
IGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZvcg0KPiA+ID4gPiA+ID4gZnVydGhl
ciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
QW55IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVy
cnVwdCwgYW5kDQo+ID4gPiA+ID4gPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgbXRrLWRldmFwYyBk
cml2ZXIuIFRoZSB2aW9sYXRpb24NCj4gPiA+ID4gPiA+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQg
aW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVyZXIuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
PiArc3RhdGljIHUzMiBnZXRfc2hpZnRfZ3JvdXAoc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAq
ZGV2YXBjX2N0eCwNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBz
bGF2ZV90eXBlLCBpbnQgdmlvX2lkeCkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IHZpb19pZHggIGlz
IHVzZWxlc3MsIHNvIHJlbW92ZSBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiB5ZXMs
IG15IG1pc3Rha2UuIEknbGwgcmVtb3ZlIGl0IG9uIG5leHQgcGF0Y2guDQo+ID4gPiA+DQo+ID4g
PiA+ID4gPiArew0KPiA+ID4gPiA+ID4gKyAgICAgICB1MzIgdmlvX3NoaWZ0X3N0YTsNCj4gPiA+
ID4gPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpyZWc7DQo+ID4gPiA+ID4gPiArICAgICAgIGlu
dCBiaXQ7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIHJlZyA9IG10a19kZXZh
cGNfcGRfZ2V0KGRldmFwY19jdHgsIHNsYXZlX3R5cGUsIFZJT19TSElGVF9TVEEsIDApOw0KPiA+
ID4gPiA+ID4gKyAgICAgICB2aW9fc2hpZnRfc3RhID0gcmVhZGwocmVnKTsNCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICsgICAgICAgZm9yIChiaXQgPSAwOyBiaXQgPCAzMjsgYml0KyspIHsN
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoKHZpb19zaGlmdF9zdGEgPj4gYml0KSAm
IDB4MSkNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4g
PiA+ID4gKyAgICAgICB9DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIHJldHVy
biBiaXQ7DQo+ID4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gW3NuaXBdDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsvKg0KPiA+
ID4gPiA+ID4gKyAqIGRldmFwY192aW9sYXRpb25faXJxIC0gdGhlIGRldmFwYyBJbnRlcnJ1cHQg
U2VydmljZSBSb3V0aW5lIChJU1IpIHdpbGwgZHVtcA0KPiA+ID4gPiA+ID4gKyAqICAgICAgICAg
ICAgICAgICAgICAgICB2aW9sYXRpb24gaW5mb3JtYXRpb24gaW5jbHVkaW5nIHdoaWNoIG1hc3Rl
ciB2aW9sYXRlcw0KPiA+ID4gPiA+ID4gKyAqICAgICAgICAgICAgICAgICAgICAgICBhY2Nlc3Mg
c2xhdmUuDQo+ID4gPiA+ID4gPiArICovDQo+ID4gPiA+ID4gPiArc3RhdGljIGlycXJldHVybl90
IGRldmFwY192aW9sYXRpb25faXJxKGludCBpcnFfbnVtYmVyLA0KPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRl
eHQgKmRldmFwY19jdHgpDQo+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+ID4gKyAgICAgICBjb25z
dCBzdHJ1Y3QgbXRrX2RldmljZV9pbmZvICoqZGV2aWNlX2luZm87DQo+ID4gPiA+ID4gPiArICAg
ICAgIGludCBzbGF2ZV90eXBlX251bTsNCj4gPiA+ID4gPiA+ICsgICAgICAgaW50IHZpb19pZHgg
PSAtMTsNCj4gPiA+ID4gPiA+ICsgICAgICAgaW50IHNsYXZlX3R5cGU7DQo+ID4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gPiArICAgICAgIHNsYXZlX3R5cGVfbnVtID0gZGV2YXBjX2N0eC0+c2xhdmVf
dHlwZV9udW07DQo+ID4gPiA+ID4gPiArICAgICAgIGRldmljZV9pbmZvID0gZGV2YXBjX2N0eC0+
ZGV2aWNlX2luZm87DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgICAgIGZvciAoc2xh
dmVfdHlwZSA9IDA7IHNsYXZlX3R5cGUgPCBzbGF2ZV90eXBlX251bTsgc2xhdmVfdHlwZSsrKSB7
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiBzbGF2ZV90eXBlX251bSBpcyAxLCBJIHRoaW5rIHRo
ZSBjb2RlIHNob3VsZCBiZSBzaW1wbGVyLg0KPiA+ID4gPg0KPiA+ID4gPiBzbGF2ZV90eXBlX251
bSBpcyBkZXBlbmRzIG9uIERUIGRhdGEsIGl0J3Mgbm90IGFsd2F5cyAxLg0KPiA+ID4NCj4gPiA+
IFBsZWFzZSBjaGFuZ2UgY29tbWl0IHRpdGxlIHRvICJhZGQgbXQ2Nzc5IG10ay1kZXZhcGMgZHJp
dmVyIi4gVGhpcw0KPiA+ID4gcGF0Y2ggaXMganVzdCBmb3IgbXQ2Nzc5LiBJZiBzbGF2ZV90eXBl
X251bSA9IDEgaW4gbXQ2Nzc5LCB0aGVyZSBpcw0KPiA+ID4gb25seSBvbmUgc2xhdmUgYW5kIHdl
IGRvbid0IG5lZWQgYSBzbGF2ZV90eXBlIHZhcmlhYmxlLiBBZGQNCj4gPiA+IHNsYXZlX3R5cGVf
bnVtIGluIHRoZSBwYXRjaCBvZiBhZGRpbmcgb25lIFNvQyB3aGljaCBoYXMgbXVsdGlwbGUNCj4g
PiA+IHNsYXZlcy4NCj4gPg0KPiA+IElmIHNsYXZlX3R5cGVfbnVtIHZhbHVlIGlzIHBhc3NlZCBm
cm9tIERUIGRhdGEsIGNvdWxkIHdlIHN0aWxsIGFzc3VtZQ0KPiA+IGl0cyB2YWx1ZT8gRG9lcyBp
dCBtYWtlIHNlbnNlIHRvIGhhdmUgdGhpcyBzdHJvbmcgYXNzdW1wdGlvbj8NCj4gDQo+IE1haW50
YWluZXIgaGFzIGFza2VkIHlvdSB0byBtb3ZlIHRoaXMgZGF0YSBmcm9tIGRldmljZSB0cmVlIHRv
IGRyaXZlcg0KPiBbMV0sIEkgZG91YnQgeW91IGNvdWxkIGdldCB0aGlzIGRhdGEgZnJvbSBkZXZp
Y2UgdHJlZS4gRXZlbiB0aG91Z2gNCj4gZGV2aWNlIHRyZWUgaGFzIHRoaXMgcHJvcGVydHksIHRo
aXMgZHJpdmVyIHN1cHBvcnQgb25seSBtdDY3Nzkgbm93LCBzbw0KPiBpdCdzIG5vdCBuZWNlc3Nh
cnkgdG8gaGF2ZSBzbGF2ZV90eXBlX251bSBiZWNhdXNlIHNsYXZlIHR5cGUgaXMgb25seQ0KPiAx
LiBJIHRoaW5rIHdlIHNob3VsZCBub3QgY29uc2lkZXIgc3VwcG9ydCBtdWx0aXBsZSBTb0MgaW4g
dGhpcyBwYXRjaC4NCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY1MzkxMS9fXzshIUNUUk5LQTl3TWcwQVJi
dyEySDhDUUVfX0FMQWhHVWhOYUw3eUIxTFhMc2tCa3ltRWZiMkZTVDBqcmJKZ21PTUthOC1BZUpY
TUF5VWtIakFsJCANCj4gDQoNCk9rYXksIEknbGwgZm9sbG93IG1haW50YWluZXIncyBzdWdnZXN0
aW9uLg0KDQo+ID4NCj4gPiBJJ20gZ29pbmcgdG8gcmVtb3ZlIG10a19kZXZpY2VfaW5mbyBzdHJ1
Y3QgYXJyYXksIGFuZCBwYXNzIGFsbCBTb0MNCj4gPiBzcGVjaWZpYyBkYXRhIGZyb20gRFQuDQo+
ID4gSXMgaXQgb2theSB0byBrZWVwIHNsYXZlX3R5cGVfbnVtIGFzIGEgdmFyaWFuY2U/DQo+ID4N
Cj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAoIW10a19kZXZhcGNfZHVtcF92aW9fZGJnKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsICZ2aW9f
aWR4KSkNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qIEVuc3VyZSB0aGF0IHZp
b2xhdGlvbiBpbmZvIGFyZSB3cml0dGVuIGJlZm9yZQ0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAqIGZ1cnRoZXIgb3BlcmF0aW9ucw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAq
Lw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHNtcF9tYigpOw0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShkZXZhcGNfY3R4LCBz
bGF2ZV90eXBlLCB2aW9faWR4LCB0cnVlKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdoeSBkbyB5
b3UgbWFzayBpcnE/DQo+ID4gPiA+DQo+ID4gPiA+IEl0IGhhcyB0byBtYXNrIHNsYXZlJ3MgaXJx
IGJlZm9yZSBjbGVhciB2aW9sYXRpb24gc3RhdHVzLg0KPiA+ID4gPiBJdCdzIG9uZSBvZiBoYXJk
d2FyZSBkZXNpZ24uDQo+ID4gPg0KPiA+ID4gSWYgZG9uJ3QgZG8gdGhpcyBiZWZvcmUgY2xlYXJf
dmlvX3N0YXR1cywgd2hhdCB3b3VsZCBoYXBwZW4/IFRoZSBjbGVhcg0KPiA+ID4gd291bGQgZmFp
bD8NCj4gPg0KPiA+IElmIHdlIGRvbid0IG1hc2sgc2xhdmUncyBpcnEgYmVmb3JlIGNsZWFyIHZp
byBzdGF0dXMsIEl0IG1pZ2h0IHRyaWdnZXINCj4gPiBhbm90aGVyIGludGVycnVwdCBiZWZvcmUg
Y3VycmVudCBJU1IgZmluaXNoZWQuIFRoZSBuZXN0ZWQgaW50ZXJydXB0IHdpbGwNCj4gPiBoYXZl
IHVuZXhwZWN0ZWQgYmVoYXZpb3IgYW5kIGhhcmR3YXJlIHN0YXRlIG1hY2hpbmUgZ29lcyB3cm9u
Zy4NCj4gDQo+IFRoaXMgaGFyZHdhcmUgaXMgc28gc3BlY2lhbC4gRm9yIGdlbmVyYWwgaGFyZHdh
cmUsIG9ubHkgY2xlYXIgc3RhdHVzDQo+IHdvdWxkIGxldCBoYXJkd2FyZSBzdG9wIGludGVycnVw
dC4gUGxlYXNlIGFkZCBhIGNvbW1lbnQgYWJvdXQgdGhpcw0KPiBzcGVjaWFsIGhhcmR3YXJlIGJl
aGF2aW9yLg0KDQpJJ2xsIGRvdWJsZSBjb25maXJtIGFuZCBhZGQgY29tbWVudCBpZiBpdCdzIG5l
Y2Vzc2FyeS4NCg0KPiANCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNsZWFyX3Zpb19zdGF0dXMoZGV2YXBj
X2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lkeCk7DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsIHZp
b19pZHgsIGZhbHNlKTsNCj4gPiA+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiA+ID4gPiArfQ0KPiA+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiArICogc3RhcnRfZGV2YXBj
IC0gaW5pdGlhbGl6ZSBkZXZhcGMgc3RhdHVzIGFuZCBzdGFydCByZWNlaXZpbmcgaW50ZXJydXB0
DQo+ID4gPiA+ID4gPiArICogICAgICAgICAgICAgICB3aGlsZSBkZXZhcGMgdmlvbGF0aW9uIGlz
IHRyaWdnZXJlZC4NCj4gPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFtzbmlw
XQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArc3RydWN0IG10a19kZXZp
Y2VfaW5mbyB7DQo+ID4gPiA+ID4gPiArICAgICAgIGludCBzeXNfaW5kZXg7DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBVc2VsZXNzLCBzbyByZW1vdmUgaXQuDQo+ID4gPiA+DQo+ID4gPiA+IFdlIG5l
ZWQgdG8gcHJpbnQgaXQgYXMgb3VyIGRlYnVnIGluZm9ybWF0aW9uLg0KPiA+ID4gPiBCdXQgSSBk
aWQgbm90IGFwcGx5IGl0IG9uIHRoaXMgcGF0Y2gsIEknbGwgYWRkIGl0IG9uIG5leHQgcGF0Y2gu
DQo+ID4gPg0KPiA+ID4gSSB0aGluayB2aW8gYWRkcmVzcyBpcyBlbm91Z2ggdG8gZmluZCBvdXQg
dGhlIG11cmRlciwgc28gcmVtb3ZlIGl0IGluDQo+ID4gPiB0aGlzIHBhdGNoLiBJZiBpdCBwcm92
aWRlIGFub3RoZXIgaW5mb3JtYXRpb24sIGFkZCBpdCBpbiBhbm90aGVyIHBhdGNoDQo+ID4gPiBh
bmQgZGVzY3JpYmUgY2xlYXIgYWJvdXQgd2hhdCBpcyB0aGlzIGFuZCBob3cgdG8gdXNlIHRoaXMg
aW5mb3JtYXRpb24uDQo+ID4gPg0KPiA+DQo+ID4gT2theSwgaXQgbWFrZSBzZW5zZS4gSSdsbCBy
ZW1vdmUgaXQgaW4gbmV4dCBwYXRjaGVzLg0KPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ICsgICAgICAgaW50IGN0cmxfaW5kZXg7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBEaXR0
by4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFJlZ2FyZHMsDQo+ID4gPiA+ID4gQ2h1bi1LdWFuZy4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAgICAgICBpbnQgdmlvX2luZGV4Ow0KPiA+ID4gPiA+
ID4gK307DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+DQo+ID4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
