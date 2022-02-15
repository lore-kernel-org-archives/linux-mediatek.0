Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC4Fc9MhZfI2wcXpFTLEYjQgAG819MuvFN3vhnjmTJQ=; b=3+URkvMJ+kgSRZ
	UJpCuD9CrDPyecB6We0mOX5OugI/2UcpnZKrBODgNFP283Ik6SxCJxlTXeabjdz0IQj+JL2duRV3S
	G3CDBbB2hnxFbSn0jV0Hj1pr2Qw2nnb4Rdmsxb6xRefxDARUK99BSS9pEV/ox0ES5jdTeKWNJatOB
	mA/+oksm6FYygmACU1pibTgi9MhQximfwu328Uo+R9x379kkMpmvIfWLZEuz/QAqetPifvKoYU1O3
	IMrP3INOqwQ6/rpYlNVtTKbpG1/RRqruDdZ0zd3+DS9LKJHkha8cd7SS/YOv2CMRoaY+TmsUbs9bp
	kYCc6qckWxKo+v2JvnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJnSK-00HYWQ-6o; Tue, 15 Feb 2022 02:20:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJnS6-00HYUV-9i; Tue, 15 Feb 2022 02:20:29 +0000
X-UUID: e8d8bfc3b25548e0b11b95a93d7cc523-20220214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qJYPrGuAn4aoJyCzsfptzPuL4AnzcGIPGQaBGoQlE/o=; 
 b=mQJ4LdzPv8S9h2LYTveA+0XPcJC04NVYo4/1wWKTwqmxQtuZElqKdW6+mfjxQBv7Kjf5fa5pbbUY9SGpzK1kX2tQgScddqCrNaElcNcyEEq02hQOXWdCY/sAHN0L9n8zSYZyTSMKAjJrhmtf0WCTQCzfWYI6bi4KgtowDRAN/uY=;
X-UUID: e8d8bfc3b25548e0b11b95a93d7cc523-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2082786227; Mon, 14 Feb 2022 19:20:24 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 18:20:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 10:20:10 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 10:20:09 +0800
Message-ID: <c041c844f6d3031b66c9b2fd62d4c551df42c675.camel@mediatek.com>
Subject: Re: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: <thierry.reding@gmail.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>, 
 <matthias.bgg@gmail.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Feb 2022 10:20:19 +0800
In-Reply-To: <20220214141103.74fdqqfixq3jnoyc@pengutronix.de>
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
 <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
 <20220214141103.74fdqqfixq3jnoyc@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_182027_758391_95D750F7 
X-CRM114-Status: GOOD (  21.18  )
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

T24gTW9uLCAyMDIyLTAyLTE0IGF0IDE1OjExICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAxMDowMToxNlBNICsw
ODAwLCB4aW5sZWkubGVlQG1lZGlhdGVrLmNvbQ0KPiB3cm90ZToNCj4gPiBGcm9tOiB4aW5sZWkg
bGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiB4
aW5sZWkgbGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1tdGstZGlzcC55YW1sICAgICAgfCA2MA0KPiA+ICsr
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMo
KykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wd20vcHdtLW10ay0NCj4gPiBkaXNwLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tbXRrLQ0KPiA+IGRpc3Au
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW10ay1kaXNw
LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjJmMTE4
M2UNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3B3bS9wd20tbXRrLWRpc3AueWFtbA0KPiA+IEBAIC0wLDAgKzEsNjAgQEANCj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9wd20vcHdtLW10ay1kaXNwLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0
bGU6IG1lZGlhdGVrIFBXTSBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRpbmdzDQo+ID4gKw0K
PiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGlu
Z0BnbWFpbC5jb20+DQo+ID4gKyAgLSBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPg0KPiA+ICsgIC0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4NCj4gPiArICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+IA0KPiBJIHdv
dWxkIGhhdmUgZXhwZWN0ZWQgc29tZSBtZWRpYXRlayBwZW9wbGUgaGVyZSBpbnN0ZWFkIG9mIHRo
ZSBQV00NCj4gYW5kDQo+IGR0IG1haW50YWluZXJzLg0KPiANCj4gPiArDQo+ID4gK3Byb3BlcnRp
ZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gbWVk
aWF0ZWssbXQyNzAxLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ2NTk1LWRpc3At
cHdtDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0g
bWVkaWF0ZWssbXQ4MTgzLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg2LWRp
c3AtcHdtDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBj
bG9ja3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogTWFpbiBD
bG9jaw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBNbSBDbG9jaw0KPiA+ICsNCj4gPiArICBj
bG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBtYWluDQo+
ID4gKyAgICAgIC0gY29uc3Q6IG1tDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gcmVnDQo+ID4g
KyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5hbWVzDQo+
ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9j
bG9jay9tdDgxODYtY2xrLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKyAgICBkaXNwX3B3bTogZGlzcF9wd20wQDExMDBl
MDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLXB3
bSI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MTEwMGUwMDAgMHgxMDAwPjsNCj4gPiArICAgICAg
ICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsg
ICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9ESVNQX1BXTT4sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9fRElTUF9QV00+Ow0KPiA+ICsg
ICAgICAgIGNsb2NrLW5hbWVzID0gIm1haW4iLCAibW0iOw0KPiA+ICsgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCj4gPiArICAgIH07DQo+ID4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+
IA0KPiBQbGVhc2UgYWRkIHRoaXMgbmV3bGluZSBhdCBFT0YuDQo+IA0KPiBCZXN0IHJlZ2FyZHMN
Cj4gVXdlDQo+IA0KDQpIaSBVd2U6DQoNClRoYW5rcyBmb3IgeW91ciB2YWx1YWJsZSBjb21tZW50
cywgSSB3aWxsIHBheSBtb3JlIGF0dGVudGlvbiB0byB0aGUNCnJlbGV2YW50IGRldGFpbHMgbGF0
ZXIsIGFuZCBJIHdpbGwgcmV2aXNlIGFjY29yZGluZyB0byB5b3VyIGNvbW1lbnRzDQphbmQgc3Vi
bWl0IHRoZSBuZXh0IHZlcnNpb24gaW4gdGhlIG5lYXIgZnV0dXJlLg0KDQpCZXN0IFJlZ2FyZHMs
DQp4aW5sZWkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
