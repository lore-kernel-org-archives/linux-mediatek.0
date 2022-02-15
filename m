Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDC0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 02:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAXH0re/q/Myw8AodmWeGOJIBuXRcD08YTe/ox/syPM=; b=gr69Ba66ER9dGk
	zuggxyFZx+5GdC+QXDVum2Gy5b+tbelTxSkNn6o/R45KCDgyHsp+IopBZTNDR9+ulg0KW/pFbr/dD
	f6/AQLqj40tH/p3OsiV6Y/GJvjyiBN8nFGVWScJOLqA/ZeAwA7DAJ1AATuVBBcpu5H6fCINAH1SYS
	KzHlerWx5BcqNpHYE0B6yBiH82oAYhQosPzLXw2O/4Gn9JJ/Y6DQPJ8JYmX7hbcv88OsntXtF1Q3r
	xBXTFH8nyFbeKY6/8svYeHX9WDzy4yLNzmssyqTVi8wsLIZMif4F6G8M/kI6K0abhpTyWSlIVsiDJ
	iBwwtbAZ27pOyNJeTPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJnYy-00HZ9O-Dt; Tue, 15 Feb 2022 02:27:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJnYm-00HZ80-SP; Tue, 15 Feb 2022 02:27:22 +0000
X-UUID: c0ebf09e419e4e49b0719895ee3d5fb7-20220214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zTrQMT35KsMJNeAwdc0PfV3yvN2k5tF/9EluD+ex3OY=; 
 b=Y/Iym//gRwjFbBGk8VFDXqDZnZ/k0PAD8apzKT6+vS9KNTLU3ciwtd74TW5iCxZ/hVh+SZFlPpfLb1RFWQCrZU5PJuhIYyLdR59yyK/GCpn3lgBr39m2HR60JED02Yu4yIM/Z73bKP9LTa7tqGXm620oAvPgf/xrO20qAqkQqQw=;
X-UUID: c0ebf09e419e4e49b0719895ee3d5fb7-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1642394527; Mon, 14 Feb 2022 19:27:19 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 18:17:17 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 10:17:09 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 10:17:08 +0800
Message-ID: <cac10ee2d03518a3b7a1373477bd16c5fbec9dee.camel@mediatek.com>
Subject: Re: [1/1] dt-bindings: pwm:Convert pwm-mtk-disp.txt format file to
 pwm-mtk-disp.yaml format file
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 15 Feb 2022 10:17:18 +0800
In-Reply-To: <af2405be-5af5-1e5b-66f2-93842eb8cde5@canonical.com>
References: <1644847276-27622-1-git-send-email-xinlei.lee@mediatek.com>
 <1644847276-27622-2-git-send-email-xinlei.lee@mediatek.com>
 <af2405be-5af5-1e5b-66f2-93842eb8cde5@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_182720_950002_46D3B326 
X-CRM114-Status: GOOD (  25.43  )
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

T24gTW9uLCAyMDIyLTAyLTE0IGF0IDIyOjMyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxNC8wMi8yMDIyIDE1OjAxLCB4aW5sZWkubGVlQG1lZGlhdGVrLmNvbSB3cm90
ZToNCj4gPiBGcm9tOiB4aW5sZWkgbGVlIDx4aW5sZWkubGVlQG1lZGlhdGVrLmNvbT4NCj4gDQo+
IENvbW1pdCBtc2cgaXMgbmVlZGVkLg0KPiANCj4gU3ViamVjdCAtIG1pc3Npbmcgc3BhY2UgYWZ0
ZXIgJzonIGFuZCBpdCBpcyB0b28gbG9uZy4gTm8gbmVlZCB0byBzYXkNCj4gImZvcm1hdCBmaWxl
IiB0d2ljZS4NCj4gDQo+IFlvdSBtaXNzICJQQVRDSCIgaW4gc3ViamVjdC4gVXNpbmcgYGdpdCBm
b3JtYXQtcGF0Y2hgIGlzIHRoZSBlYXNpZXN0DQo+IHdheQ0KPiB0byBjcmVhdGUgcHJvcGVyIHBh
dGNoZXMuDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IHhpbmxlaSBsZWUgPHhpbmxlaS5s
ZWVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9w
d20vcHdtLW10ay1kaXNwLnlhbWwgICAgICB8IDYwDQo+ID4gKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gSSBkbyBub3Qg
c2VlIHRoZSBjb252ZXJzaW9uIGhlcmUuLi4gWW91IG9ubHkgYWRkIG9uZSBmaWxlLiBXaGVyZSBp
cw0KPiB0aGUNCj4gcmVtb3ZhbD8NCj4gDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1tdGstDQo+ID4gZGlzcC55YW1sDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
d20vcHdtLW10ay0NCj4gPiBkaXNwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcHdtL3B3bS1tdGstZGlzcC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwLi4yZjExODNlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW10ay1kaXNwLnlhbWwNCj4g
DQo+IExldCdzIG5hbWUgdGhlIGZpbGUgYXMgd2l0aCBtb3N0IGJpbmRpbmdzLCBzbyB3aXRoIHZl
bmRvcjoNCj4gIm1lZGlhdGVrLHB3bS1kaXNwLnlhbWwiDQo+IA0KPiA+IEBAIC0wLDAgKzEsNjAg
QEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9wd20vcHdtLW10ay1kaXNwLnlhbWwjDQo+ID4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4g
PiArdGl0bGU6IG1lZGlhdGVrIFBXTSBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRpbmdzDQo+
ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+DQo+ID4gKyAgLSBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPiA+ICsgIC0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4NCj4gPiArICAtIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+DQo+ID4g
Kw0KPiANCj4gYWxsT2YgcmVmZXJlbmNpbmcgcHdtLnlhbWwNCj4gDQo+ID4gK3Byb3BlcnRpZXM6
DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gbWVkaWF0
ZWssbXQyNzAxLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ2NTk1LWRpc3AtcHdt
DQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTczLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0gbWVk
aWF0ZWssbXQ4MTgzLWRpc3AtcHdtDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg2LWRpc3At
cHdtDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+
ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9j
a3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogTWFpbiBDbG9j
aw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBNbSBDbG9jaw0KPiA+ICsNCj4gDQo+IA0KPiBU
aGlzIHNjaGVtYSB3YXMgbm90IHRlc3RlZC4gUGxlYXNlIHJ1biBpdCBhZ2FpbnN0IHlvdXIgRFRT
IGZpbGVzDQo+IChtYWtlDQo+IGR0YnNfY2hlY2spLiBZb3UgbmVlZCBwd20tY2VsbHMgYW5kIHBv
d2VyLWRvbWFpbnMuIE1heWJlIG1vcmUuLi4NCj4gDQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4g
KyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogbWFpbg0KPiA+ICsgICAgICAtIGNvbnN0
OiBtbQ0KPiANCj4gQmxhbmsgbGluZS4NCj4gDQo+ID4gK3JlcXVpcmVkOg0KPiANCj4gImNvbXBh
dGlibGUiIGlzIHJlcXVpcmVkLCBwdXQgaXQgZmlyc3QgaW4gdGhlIGxpc3QuDQo+IA0KPiA+ICsg
IC0gcmVnDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNs
b2NrLW5hbWVzPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4g
PiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL210ODE4Ni1jbGsuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4NCj4gDQo+IEJsYW5rIGxpbmUuDQo+IA0KPiA+
ICsgICAgZGlzcF9wd206IGRpc3BfcHdtMEAxMTAwZTAwMCB7DQo+IA0KPiBub2RlIG5hbWU6ICJw
d20iIChnZW5lcmljIGFzIHNjaGVtYSBhbmQgZGV2aWNldHJlZSBzcGVjaWZpY2F0aW9uIGFzaw0K
PiBmb3IpLg0KPiANCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
aXNwLXB3bSI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MTEwMGUwMDAgMHgxMDAwPjsNCj4gPiAr
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0K
PiA+ICsgICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9ESVNQX1BXTT4sDQo+ID4g
KyAgICAgICAgICAgICAgICAgPCZpbmZyYWNmZ19hbyBDTEtfSU5GUkFfQU9fRElTUF9QV00+Ow0K
PiA+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gIm1haW4iLCAibW0iOw0KPiA+ICsgICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCj4gDQo+IE5vIG5lZWQgZm9yIHN0YXR1cy4NCj4gDQo+ID4gKyAgICB9
Ow0KPiA+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiANCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQoNCkhpIEtyenlzenRvZjoNCg0KVGhhbmtzIGZvciB5b3VyIHZhbHVh
YmxlIGNvbW1lbnRzLCBJIHdpbGwgcGF5IG1vcmUgYXR0ZW50aW9uIHRvIHRoZQ0KcmVsZXZhbnQg
ZGV0YWlscyBsYXRlciwgYW5kIEkgd2lsbCByZXZpc2UgYWNjb3JkaW5nIHRvIHlvdXIgY29tbWVu
dHMNCmFuZCBzdWJtaXQgdGhlIG5leHQgdmVyc2lvbiBpbiB0aGUgbmVhciBmdXR1cmUuDQoNCkJl
c3QgUmVnYXJkcywNCnhpbmxlaQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
