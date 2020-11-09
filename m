Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FC4C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C247F206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xUw65H6E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OHfrmqQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C247F206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Af6gAJ1tVCh1at+Q2gC9hNVdft3q7sPTSmMmOx8xF8c=; b=xUw65H6EA6HWooOgF7d6Cz3bP
	DVlUsVcAGfE06Eb9SITu1nn0bgVyN755f8fGLMwYT+AZkWTnRKG1Z3Ks3N2OeIq3Z9B27HQH3Lwlw
	2RXK/o6obc1ANDuUjhIwdTrJvywvUhimEsv84DLXskxYXlYIVOYmD+UYqzxKfa4VCCDHkvmmdtObZ
	R79zFsL5TWaErqJ8QZ4P85pA0FeECni+kh7NE/ZrgRCoEODPiUlIVvEZSMu3ZBQDnsD12o/cpajXy
	HjDGHn5FxmVyuB1kxPfkCrPGrNkBEdzY/bRhNQXv7BBms7H2LFZmPgyz5k8NWPI2TvjCHT1rO0Bb1
	SZZ52lEqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbxKe-0006lK-59; Mon, 09 Nov 2020 02:55:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbxKb-0006ji-35; Mon, 09 Nov 2020 02:54:58 +0000
X-UUID: 8c27574a1cf947239f690ff8b4716be3-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DQFgYUK++/RRLNHyCwW54CGobbl9tysXmdV/Obiqr7E=; 
 b=OHfrmqQ407SVFAcWEU5Dhwzr6wYOkUCBjMbRZDlrKyHwuk6qxvVLQNLoqZoCn6f+Aoq5mS4qMuS6vrvdAZEhf1L/2Fde0cI1NiYDXsVZsCOtfiTlEtx4FCCIlKk6R4J/locxjwCOdqp8xmIvPPiXl8/eh72h1v/QvLnB/rqLifo=;
X-UUID: 8c27574a1cf947239f690ff8b4716be3-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1530628466; Sun, 08 Nov 2020 18:54:51 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:54:49 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 10:54:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:54:46 +0800
Message-ID: <1604890486.8050.7.camel@mhfsdcap03>
Subject: Re: [PATCH v7 4/4] ARM: dts: mediatek: Modified MT7629 PCIe node
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Mon, 9 Nov 2020 10:54:46 +0800
In-Reply-To: <20201103225147.GA272037@bjorn-Precision-5520>
References: <20201103225147.GA272037@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B8BBFD63134A1EB2BFE5FCA426352709C941954D3CCC7C2E4A7CA939853D0DE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_215457_358150_C80C2462 
X-CRM114-Status: GOOD (  22.61  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTExLTAzIGF0IDE2OjUxIC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBUaGlzIHN1YmplY3QgbGluZSBpcyBwb2ludGxlc3MuDQo+IA0KPiBFdmVyeSBwYXRjaCBtb2Rp
ZmllcyBzb21ldGhpbmcuICBHaXZlIHVzIGEgaGludCBhYm91dCB3aGF0IHlvdQ0KPiBtb2RpZmll
ZCBhbmQgd2h5Lg0KPiANCj4gQW5kIHVzZSB0aGUgcHJlc2VudCB0ZW5zZSB2ZXJiLCBpLmUuLCAi
TW9kaWZ5IC4uLiIsIG5vdCAiTW9kaWZpZWQiLg0KPiBQcm9iYWJseSAiQWRkIiB3b3VsZCBiZSBi
ZXR0ZXIgdGhhbiAiTW9kaWZ5Ii4gIE9yICJVcGRhdGUiIHdpdGggc29tZQ0KPiBtZWFuaW5nZnVs
IGRlc2NyaXB0aW9uIG9mIHRoZSB1cGRhdGUuDQo+IA0KPiBPbiBUaHUsIE9jdCAyOSwgMjAyMCBh
dCAwNDoxNToxM1BNICswODAwLCBDaHVhbmppYSBMaXUgd3JvdGU6DQo+ID4gUmVtb3ZlIHVudXNl
ZCBwcm9wZXJ0eSBhbmQgYWRkIHBjaWVjZmcgbm9kZS4NCj4gDQo+IEFwcGFyZW50bHkgdGhpcyBh
bHNvIHJlbW92ZXMgInN1YnN5cyIgZnJvbSB0aGUgInJlZyIgcHJvcGVydHkuDQo+IEFuZCByZW1v
dmVzIGFuIGludGVycnVwdC4gIEFuZCBhZGRzICJwY2llX2lycSIuDQoNClRoYW5rcyBmb3IgeW91
IHJldmlld++8jEkgd2lsbCB1cGRhdGUgbXkgc3ViamVjdCBhbmQgY29tbWl0IG1lc3NhZ2UuDQoN
CkFSTTogZHRzOiBtZWRpYXRlazogVXBkYXRlIE1UNzYyOSBQQ0llIG5vZGUNCg0KVG8gbWF0Y2gg
dGhlIG5ldyBEVFMgQmluZGluZywgUmVtb3ZlICJzdWJzeXMiIGFuZCB1bnVzZWQgaW50ZXJydXB0
LkFkZA0KInBjaWVfaXJxIiBwcm9wZXJ0eSBhbmQgcGNpZWNmZyBub2RlLg0KDQpJcyB0aGF0IG9r
Pw0KDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1YW5qaWEgTGl1IDxjaHVhbmppYS5saXVAbWVkaWF0
ZWsuY29tPg0KPiA+IEFja2VkLWJ5OiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyOS1yZmIuZHRzIHwgIDMgKyst
DQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyOS5kdHNpICAgIHwgMjIgKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDc2
MjktcmZiLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyOS1yZmIuZHRzDQo+ID4gaW5kZXgg
OTk4MGMxMGM2ZTI5Li5lYjUzNmNiZWJkOWIgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvbXQ3NjI5LXJmYi5kdHMNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDc2Mjkt
cmZiLmR0cw0KPiA+IEBAIC0xNDAsOSArMTQwLDEwIEBADQo+ID4gIAl9Ow0KPiA+ICB9Ow0KPiA+
ICANCj4gPiAtJnBjaWUgew0KPiA+ICsmcGNpZTEgew0KPiA+ICAJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsNCj4gPiAgCXBpbmN0cmwtMCA9IDwmcGNpZV9waW5zPjsNCj4gPiArCXN0YXR1cyA9
ICJva2F5IjsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gICZwY2llcGh5MSB7DQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyOS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3
NjI5LmR0c2kNCj4gPiBpbmRleCA1Y2JiM2QyNDRjNzUuLjZkNjM5N2YwYzJmYyAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9tdDc2MjkuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL210NzYyOS5kdHNpDQo+ID4gQEAgLTM2MCwxNiArMzYwLDIwIEBADQo+ID4gIAkJ
CSNyZXNldC1jZWxscyA9IDwxPjsNCj4gPiAgCQl9Ow0KPiA+ICANCj4gPiAtCQlwY2llOiBwY2ll
QDFhMTQwMDAwIHsNCj4gPiArCQlwY2llY2ZnOiBwY2llY2ZnQDFhMTQwMDAwIHsNCj4gPiArCQkJ
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxnZW5lcmljLXBjaWVjZmciLCAic3lzY29uIjsNCj4gPiAr
CQkJcmVnID0gPDB4MWExNDAwMDAgMHgxMDAwPjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlw
Y2llMTogcGNpZUAxYTE0NTAwMCB7DQo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3
NjI5LXBjaWUiOw0KPiA+ICAJCQlkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+IC0JCQlyZWcgPSA8
MHgxYTE0MDAwMCAweDEwMDA+LA0KPiA+IC0JCQkgICAgICA8MHgxYTE0NTAwMCAweDEwMDA+Ow0K
PiA+IC0JCQlyZWctbmFtZXMgPSAic3Vic3lzIiwicG9ydDEiOw0KPiA+ICsJCQlyZWcgPSA8MHgx
YTE0NTAwMCAweDEwMDA+Ow0KPiA+ICsJCQlyZWctbmFtZXMgPSAicG9ydDEiOw0KPiA+ICAJCQkj
YWRkcmVzcy1jZWxscyA9IDwzPjsNCj4gPiAgCQkJI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gLQkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSAxNzYgSVJRX1RZUEVfTEVWRUxfTE9XPiwNCj4gPiAtCQkJ
CSAgICAgPEdJQ19TUEkgMjI5IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gKwkJCWludGVycnVw
dHMgPSA8R0lDX1NQSSAyMjkgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiArCQkJaW50ZXJydXB0
LW5hbWVzID0gInBjaWVfaXJxIjsNCj4gPiAgCQkJY2xvY2tzID0gPCZwY2llc3lzIENMS19QQ0lF
X1AxX01BQ19FTj4sDQo+ID4gIAkJCQkgPCZwY2llc3lzIENMS19QQ0lFX1AwX0FIQl9FTj4sDQo+
ID4gIAkJCQkgPCZwY2llc3lzIENMS19QQ0lFX1AxX0FVWF9FTj4sDQo+ID4gQEAgLTM5MCwyMSAr
Mzk0LDE5IEBADQo+ID4gIAkJCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDc2MjJfUE9XRVJf
RE9NQUlOX0hJRjA+Ow0KPiA+ICAJCQlidXMtcmFuZ2UgPSA8MHgwMCAweGZmPjsNCj4gPiAgCQkJ
cmFuZ2VzID0gPDB4ODIwMDAwMDAgMCAweDIwMDAwMDAwIDB4MjAwMDAwMDAgMCAweDEwMDAwMDAw
PjsNCj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgDQo+ID4gLQkJCXBjaWUxOiBw
Y2llQDEsMCB7DQo+ID4gLQkJCQlkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+ICsJCQlzbG90MTog
cGNpZUAxLDAgew0KPiA+ICAJCQkJcmVnID0gPDB4MDgwMCAwIDAgMCAwPjsNCj4gPiAgCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDM+Ow0KPiA+ICAJCQkJI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gIAkJ
CQkjaW50ZXJydXB0LWNlbGxzID0gPDE+Ow0KPiA+ICAJCQkJcmFuZ2VzOw0KPiA+IC0JCQkJbnVt
LWxhbmVzID0gPDE+Ow0KPiA+ICAJCQkJaW50ZXJydXB0LW1hcC1tYXNrID0gPDAgMCAwIDc+Ow0K
PiA+ICAJCQkJaW50ZXJydXB0LW1hcCA9IDwwIDAgMCAxICZwY2llX2ludGMxIDA+LA0KPiA+ICAJ
CQkJCQk8MCAwIDAgMiAmcGNpZV9pbnRjMSAxPiwNCj4gPiAgCQkJCQkJPDAgMCAwIDMgJnBjaWVf
aW50YzEgMj4sDQo+ID4gIAkJCQkJCTwwIDAgMCA0ICZwY2llX2ludGMxIDM+Ow0KPiA+IC0NCj4g
PiAgCQkJCXBjaWVfaW50YzE6IGludGVycnVwdC1jb250cm9sbGVyIHsNCj4gPiAgCQkJCQlpbnRl
cnJ1cHQtY29udHJvbGxlcjsNCj4gPiAgCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwwPjsNCj4gPiAt
LSANCj4gPiAyLjE4LjANCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiA+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+ID4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
