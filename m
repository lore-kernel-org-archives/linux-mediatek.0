Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077DEC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:42:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D283820714
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 07:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gN6da1yc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OwS5hCNA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D283820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UB4mNVxPlvU8s5NWE7zfvj4X8knaOuuDj4a0rqGpKY=; b=gN6da1ycRVjtBi
	YatVgaNwGq+8Fb4GBdtWofeDpvIW7jYCDzuz3L56UHmajHkLwGySC1exET09exDwlyA0kLFChmBej
	/LmeLzmxoCGrchGu04fV2H51FWXbHDyadzrXqJkiWTltb246h9BAIk5XMTHSYdGBVSz5wLKd1pS8J
	ShvCWpxFrbTVNdubX5P2OBO770OP9dHJNX3zpM6Ba8N3yuLCc9DJsWnr8pmgg/jFT14kOXPpWqZWe
	hc9VyfTY2UlfvquxyszkTJEnoJVt8AEFtEp0RXU7jrwjYdgS7v0zy4noBjEsY9ZmnaEw4l2D6um3s
	CFgjJcPbGuN5M7mmkzuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWEhG-0007qc-EG; Wed, 06 May 2020 07:42:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWEhD-0007pC-8G; Wed, 06 May 2020 07:42:25 +0000
X-UUID: 242e36d0570248a8b81ecab846d7169b-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FaBRJbgunUSLYA6bpXb5NIM3pGuFy/IoMvfDMNunx5E=; 
 b=OwS5hCNARjkhAoapk16pLl38lYEmAd4RQJw9xAM+5bRtnO+h2BapUafgAptsjgphAMilDO5f2J962BNYi4Ok+zezVSDHY2hTOyVoRrfwkWIT0Q9MSKQxlaqZP0KFYdIRJ4YGovvDcp5ll36n4ItAe3RJsxUNB8jJuHvK/wGyzfo=;
X-UUID: 242e36d0570248a8b81ecab846d7169b-20200505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 159987163; Tue, 05 May 2020 23:42:11 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 00:42:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 15:41:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 May 2020 15:41:55 +0800
Message-ID: <1588750920.3262.24.camel@mtksdaap41>
Subject: Re: [PATCH v13 02/11] dt-bindings: soc: Add MT8183 power dt-bindings
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 6 May 2020 15:42:00 +0800
In-Reply-To: <CAFqH_523KpaCwhhHDKVCKaJgJUPc+7r03f6U=1XiNNQ1PaNN5w@mail.gmail.com>
References: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
 <1584689540-5227-3-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_523KpaCwhhHDKVCKaJgJUPc+7r03f6U=1XiNNQ1PaNN5w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_004223_300134_54C2A6B6 
X-CRM114-Status: GOOD (  20.91  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 JamesJJ Liao =?UTF-8?Q?=28=E5=BB=96=E5=BB=BA=E6=99=BA=29?=
 <jamesjj.liao@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sascha
 Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DQpPbiBGcmksIDIwMjAtMDQtMjQgYXQgMDI6MjAgKzA4MDAsIEVucmljIEJhbGxldGJvIFNlcnJh
IHdyb3RlOg0KPiBIaSBXZWl5aSBMdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLiBK
dXN0IGEgdHJpdmlhbCBjb21tZW50IGJlbG93Lg0KPiANCj4gTWlzc2F0Z2UgZGUgV2VpeWkgTHUg
PHdlaXlpLmx1QG1lZGlhdGVrLmNvbT4gZGVsIGRpYSBkdi4sIDIwIGRlIG1hcsOnDQo+IDIwMjAg
YSBsZXMgODozMzoNCj4gPg0KPiA+IEFkZCBwb3dlciBkdC1iaW5kaW5ncyBvZiBNVDgxODMgYW5k
IGludHJvZHVjZXMgIkJBU0lDIiBhbmQNCj4gPiAiU1VCU1lTIiBjbG9jayB0eXBlcyBpbiBiaW5k
aW5nIGRvY3VtZW50Lg0KPiA+IFRoZSAiQkFTSUMiIHR5cGUgaXMgY29tcGF0aWJsZSB0byB0aGUg
b3JpZ2luYWwgcG93ZXIgY29udHJvbCB3aXRoDQo+ID4gY2xvY2sgbmFtZSBbYS16XStbMC05XSos
IGUuZy4gbW0sIHZwdTEuDQo+ID4gVGhlICJTVUJTWVMiIHR5cGUgaXMgdXNlZCBmb3IgYnVzIHBy
b3RlY3Rpb24gY29udHJvbCB3aXRoIGNsb2NrDQo+ID4gbmFtZSBbYS16XSstWzAtOV0rLCBlLmcu
IGlzcC0wLCBjYW0tMS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaXlpIEx1IDx3ZWl5aS5s
dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
Yy9tZWRpYXRlay9zY3BzeXMudHh0ICAgIHwgMjAgKysrKysrKysrKysrKystLS0NCj4gPiAgaW5j
bHVkZS9kdC1iaW5kaW5ncy9wb3dlci9tdDgxODMtcG93ZXIuaCAgICAgICAgICAgfCAyNiArKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmlu
ZGluZ3MvcG93ZXIvbXQ4MTgzLXBvd2VyLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21lZGlhdGVrL3NjcHN5cy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21lZGlhdGVrL3NjcHN5cy50eHQNCj4g
PiBpbmRleCAyYmMzNjc3Li4xYmFhYTZmIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvc2Nwc3lzLnR4dA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvc2Nwc3lzLnR4dA0K
PiA+IEBAIC0xNSw2ICsxNSw3IEBAIHBvd2VyL3Bvd2VyLWRvbWFpbi55YW1sLiBJdCBwcm92aWRl
cyB0aGUgcG93ZXIgZG9tYWlucyBkZWZpbmVkIGluDQo+ID4gIC0gaW5jbHVkZS9kdC1iaW5kaW5n
cy9wb3dlci9tdDI3MDEtcG93ZXIuaA0KPiA+ICAtIGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIv
bXQyNzEyLXBvd2VyLmgNCj4gPiAgLSBpbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL210NzYyMi1w
b3dlci5oDQo+ID4gKy0gaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9tdDgxODMtcG93ZXIuaA0K
PiA+DQo+ID4gIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gIC0gY29tcGF0aWJsZTogU2hvdWxk
IGJlIG9uZSBvZjoNCj4gPiBAQCAtMjcsMTIgKzI4LDE2IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6
DQo+ID4gICAgICAgICAtICJtZWRpYXRlayxtdDc2MjNhLXNjcHN5cyI6IEZvciBNVDc2MjNBIFNv
Qw0KPiA+ICAgICAgICAgLSAibWVkaWF0ZWssbXQ3NjI5LXNjcHN5cyIsICJtZWRpYXRlayxtdDc2
MjItc2Nwc3lzIjogRm9yIE1UNzYyOSBTb0MNCj4gPiAgICAgICAgIC0gIm1lZGlhdGVrLG10ODE3
My1zY3BzeXMiDQo+ID4gKyAgICAgICAtICJtZWRpYXRlayxtdDgxODMtc2Nwc3lzIg0KPiA+ICAt
ICNwb3dlci1kb21haW4tY2VsbHM6IE11c3QgYmUgMQ0KPiA+ICAtIHJlZzogQWRkcmVzcyByYW5n
ZSBvZiB0aGUgU0NQU1lTIHVuaXQNCj4gPiAgLSBpbmZyYWNmZzogbXVzdCBjb250YWluIGEgcGhh
bmRsZSB0byB0aGUgaW5mcmFjZmcgY29udHJvbGxlcg0KPiA+IC0tIGNsb2NrLCBjbG9jay1uYW1l
czogY2xvY2tzIGFjY29yZGluZyB0byB0aGUgY29tbW9uIGNsb2NrIGJpbmRpbmcuDQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICBUaGVzZSBhcmUgY2xvY2tzIHdoaWNoIGhhcmR3YXJlIG5lZWRz
IHRvIGJlDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICBlbmFibGVkIGJlZm9yZSBlbmFibGlu
ZyBjZXJ0YWluIHBvd2VyIGRvbWFpbnMuDQo+ID4gKy0gY2xvY2ssIGNsb2NrLW5hbWVzOiBDbG9j
a3MgYWNjb3JkaW5nIHRvIHRoZSBjb21tb24gY2xvY2sgYmluZGluZy4NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgIFNvbWUgU29DcyBoYXZlIHRvIGdyb3VwcyBvZiBjbG9ja3MuDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICBCQVNJQyBjbG9ja3MgbmVlZCB0byBiZSBlbmFibGVkIGJlZm9y
ZSBlbmFibGluZyB0aGUNCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGNvcnJlc3BvbmRpbmcg
cG93ZXIgZG9tYWluLg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgU1VCU1lTIGNsb2NrcyBu
ZWVkIHRvIGJlIGVuYWJsZWQgYmVmb3JlIHJlbGVhc2luZyB0aGUNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgIGJ1cyBwcm90ZWN0aW9uLg0KPiA+ICAgICAgICAgUmVxdWlyZWQgY2xvY2tzIGZv
ciBNVDI3MDEgb3IgTVQ3NjIzOiAibW0iLCAibWZnIiwgImV0aGlmIg0KPiA+ICAgICAgICAgUmVx
dWlyZWQgY2xvY2tzIGZvciBNVDI3MTI6ICJtbSIsICJtZmciLCAidmVuYyIsICJqcGdkZWMiLCAi
YXVkaW8iLCAidmRlYyINCj4gPiAgICAgICAgIFJlcXVpcmVkIGNsb2NrcyBmb3IgTVQ2NzY1OiBN
VVg6ICJtbSIsICJtZmciDQo+ID4gQEAgLTQzLDYgKzQ4LDE1IEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6DQo+ID4gICAgICAgICBSZXF1aXJlZCBjbG9ja3MgZm9yIE1UNzYyMiBvciBNVDc2Mjk6ICJo
aWZfc2VsIg0KPiA+ICAgICAgICAgUmVxdWlyZWQgY2xvY2tzIGZvciBNVDc2MjNBOiAiZXRoaWYi
DQo+ID4gICAgICAgICBSZXF1aXJlZCBjbG9ja3MgZm9yIE1UODE3MzogIm1tIiwgIm1mZyIsICJ2
ZW5jIiwgInZlbmNfbHQiDQo+ID4gKyAgICAgICBSZXF1aXJlZCBjbG9ja3MgZm9yIE1UODE4Mzog
QkFTSUM6ICJhdWRpbyIsICJtZmciLCAibW0iLCAiY2FtIiwgImlzcCIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2cHUiLCAidnB1MSIsICJ2cHUyIiwg
InZwdTMiDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1VCU1lTOiAi
bW0tMCIsICJtbS0xIiwgIm1tLTIiLCAibW0tMyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAibW0tNCIsICJtbS01IiwgIm1tLTYiLCAibW0tNyIsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibW0tOCIsICJt
bS05IiwgImlzcC0wIiwgImlzcC0xIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJjYW0tMCIsICJjYW0tMSIsICJjYW0tMiIsICJjYW0tMyIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY2FtLTQiLCAiY2Ft
LTUiLCAiY2FtLTYiLCAidnB1LTAiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInZwdS0xIiwgInZwdS0yIiwgInZwdS0zIiwgInZwdS00IiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2cHUtNSINCj4gPg0K
PiA+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICAtIHZkZWMtc3VwcGx5OiBQb3dlciBzdXBw
bHkgZm9yIHRoZSB2ZGVjIHBvd2VyIGRvbWFpbg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Bvd2VyL210ODE4My1wb3dlci5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dl
ci9tdDgxODMtcG93ZXIuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMC4uNWMwYzhjNw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJp
bmRpbmdzL3Bvd2VyL210ODE4My1wb3dlci5oDQo+ID4gQEAgLTAsMCArMSwyNiBAQA0KPiA+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiANCj4gVGhpcyBsaW5lIHNob3Vs
ZCBlbmQgd2l0aCBhICcqLycNCj4gDQo+ID4gKyAqDQo+IA0KPiBBbmQgdGhpcyBsaW5lIHN0YXJ0
IHdpdGggYSAnLycNCj4gDQoNClRoYW5rcywgSSdsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0K
DQo+IA0KPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTggTWVkaWFUZWsgSW5jLg0KPiA+ICsgKiBB
dXRob3I6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+DQo+ID4gKyAqLw0KPiA+ICsN
Cj4gPiArI2lmbmRlZiBfRFRfQklORElOR1NfUE9XRVJfTVQ4MTgzX1BPV0VSX0gNCj4gPiArI2Rl
ZmluZSBfRFRfQklORElOR1NfUE9XRVJfTVQ4MTgzX1BPV0VSX0gNCj4gPiArDQo+ID4gKyNkZWZp
bmUgTVQ4MTgzX1BPV0VSX0RPTUFJTl9BVURJTyAgICAgIDANCj4gPiArI2RlZmluZSBNVDgxODNf
UE9XRVJfRE9NQUlOX0NPTk4gICAgICAgMQ0KPiA+ICsjZGVmaW5lIE1UODE4M19QT1dFUl9ET01B
SU5fTUZHX0FTWU5DICAyDQo+ID4gKyNkZWZpbmUgTVQ4MTgzX1BPV0VSX0RPTUFJTl9NRkcgICAg
ICAgICAgICAgICAgMw0KPiA+ICsjZGVmaW5lIE1UODE4M19QT1dFUl9ET01BSU5fTUZHX0NPUkUw
ICA0DQo+ID4gKyNkZWZpbmUgTVQ4MTgzX1BPV0VSX0RPTUFJTl9NRkdfQ09SRTEgIDUNCj4gPiAr
I2RlZmluZSBNVDgxODNfUE9XRVJfRE9NQUlOX01GR18yRCAgICAgNg0KPiA+ICsjZGVmaW5lIE1U
ODE4M19QT1dFUl9ET01BSU5fRElTUCAgICAgICA3DQo+ID4gKyNkZWZpbmUgTVQ4MTgzX1BPV0VS
X0RPTUFJTl9DQU0gICAgICAgICAgICAgICAgOA0KPiA+ICsjZGVmaW5lIE1UODE4M19QT1dFUl9E
T01BSU5fSVNQICAgICAgICAgICAgICAgIDkNCj4gPiArI2RlZmluZSBNVDgxODNfUE9XRVJfRE9N
QUlOX1ZERUMgICAgICAgMTANCj4gPiArI2RlZmluZSBNVDgxODNfUE9XRVJfRE9NQUlOX1ZFTkMg
ICAgICAgMTENCj4gPiArI2RlZmluZSBNVDgxODNfUE9XRVJfRE9NQUlOX1ZQVV9UT1AgICAgMTIN
Cj4gPiArI2RlZmluZSBNVDgxODNfUE9XRVJfRE9NQUlOX1ZQVV9DT1JFMCAgMTMNCj4gPiArI2Rl
ZmluZSBNVDgxODNfUE9XRVJfRE9NQUlOX1ZQVV9DT1JFMSAgMTQNCj4gPiArDQo+ID4gKyNlbmRp
ZiAvKiBfRFRfQklORElOR1NfUE9XRVJfTVQ4MTgzX1BPV0VSX0ggKi8NCj4gPiAtLQ0KPiA+IDEu
OC4xLjEuZGlydHkNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQo+IA0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QNCj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
