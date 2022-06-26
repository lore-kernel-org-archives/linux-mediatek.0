Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E05EC43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 04:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYL/skkloJ/2okPns8AiI4hfFAXXmgGTYzMokyObL+k=; b=0a47yHNAAwxlzXNGEdr1XszcYv
	5TSbOOnR2b/izIbAJTPgZy3AyGrV+TRjLTGMyhofyYMfC9+JHwK1t5x5GAeojhxnalQReHDifgupQ
	Cq5wTo0xIfZolYW4m6HYAlrExj5tVagY0yFj6jbNNwxrq6lKmF9/7sbyHPX03Re7IdZuxli+yOV1z
	2x/Sj0jCWEVviqyirWiRKLNqKj8DbVHJzFHWoB3rFNjia8O9gfORToz31wLnK6s437fhL4BuKvd04
	wf3IwW1s8IxaxvhdN0QFFif2yNBf+iparF2hZLNRzw7+wcew8v+h1PxfVV4kwlkO+QbJ1tkcW1HPR
	HSMxltKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KGL-009dAw-PR; Sun, 26 Jun 2022 04:52:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KDt-009bb6-D2; Sun, 26 Jun 2022 04:50:16 +0000
X-UUID: 3a8cab83efa549e0ab3f18aec7a395da-20220625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qYL/skkloJ/2okPns8AiI4hfFAXXmgGTYzMokyObL+k=;
	b=QrNuaY4oYljxRDvSdjznX8YH4E/JyYmlEFJYQwyAuVIojKiR7X717XFHwj/kMnY13tXu7hLgolHtDYZViUIKIryYMv+ueCvR1EOgBwX3P8trwEqdi227mt/lW/fspAX3/hpZDIGNV6m2FkbcPaL1OeHYdO+JPXS2oEK9y4eGu4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:b73f8831-17d3-4a9f-9ac8-5ab1c8d27906,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:519c91d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 3a8cab83efa549e0ab3f18aec7a395da-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1328802740; Sat, 25 Jun 2022 21:50:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 21:45:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 26 Jun 2022 12:45:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 12:45:41 +0800
Message-ID: <59308e27c021de6bed80d6986bc2766f2a73a739.camel@mediatek.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: add generic driving setup
 property on mt8192
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sun, 26 Jun 2022 12:45:41 +0800
In-Reply-To: <20220624155224.lizeca5rnruhihdn@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
	 <20220624133700.15487-2-guodong.liu@mediatek.com>
	 <20220624155224.lizeca5rnruhihdn@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_215013_507151_07D96BA3 
X-CRM114-Status: GOOD (  14.50  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClRvOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVA
bWVkaWF0ZWsuY29tPg0KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4sIFJvYiBIZXJyaW5nIDwNCnJvYmgrZHRAa2VybmVsLm9yZz4sIE1hdHRoaWFzIEJydWdnZXIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+LCBTZWFuDQpXYW5nIDxzZWFuLndhbmdAa2VybmVsLm9y
Zz4sIFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4sDQpaaGl5b25nIFRhbyA8emhp
eW9uZy50YW9AbWVkaWF0ZWsuY29tPiwgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcsIA0KZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgDQpsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCANClByb2plY3RfR2xvYmFsX0Nocm9tZV9VcHN0cmVhbV9Hcm91cEBt
ZWRpYXRlay5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS81XSBwaW5jdHJsOiBtZWRpYXRl
azogYWRkIGdlbmVyaWMgZHJpdmluZw0Kc2V0dXAgcHJvcGVydHkgb24gbXQ4MTkyDQpEYXRlOiBG
cmksIDI0IEp1biAyMDIyIDExOjUyOjI0IC0wNDAwDQoNCkhpIEd1b2RvbmcsDQoNCnBsZWFzZSBz
ZWUgY29tbWVudHMgYmVsb3cuDQoNCk9uIEZyaSwgSnVuIDI0LCAyMDIyIGF0IDA5OjM2OjU2UE0g
KzA4MDAsIEd1b2RvbmcgTGl1IHdyb3RlOg0KPiAxLiBUaGUgZHQtYmluZGluZyBleHBlY3RzIHRo
YXQgZHJpdmUtc3RyZW5ndGggYXJndW1lbnRzIGJlIHBhc3NlZA0KPiBpbiBtQSwgYnV0IHRoZSBk
cml2ZXIgd2FzIGV4cGVjdGluZyByYXcgdmFsdWVzLiBBbmQgdGhhdCB0aGlzDQo+IGNvbW1pdCBj
aGFuZ2VzIHRoZSBkcml2ZXIgc28gdGhhdCBpdCBpcyBhbGlnbmVkIHdpdGggdGhlIGJpbmRpbmcu
DQo+IDIuIFRoaXMgY29tbWl0IHByb3ZpZGVzIGdlbmVyaWMgZHJpdmluZyBzZXR1cCwgd2hpY2gg
c3VwcG9ydA0KPiAyLzQvNi84LzEwLzEyLzE0LzE2bUEgZHJpdmluZywgb3JpZ2luYWwgZHJpdmVy
IGp1c3Qgc2V0IHJhdyBkYXRhDQo+IHNldHVwIHNldHRpbmcgd2hlbiB1c2UgZHJpdmUtc3RyZW5n
dGggcHJvcGVydHkuDQoNClRoaXMgY29tbWl0IG1lc3NhZ2UgaXMgYSBiaXQgY29uZnVzaW5nLCBJ
IHN1Z2dlc3QgdXNpbmcgdGhlIGZvbGxvd2luZw0KY29tbWl0DQptZXNzYWdlIGluc3RlYWQ6DQoN
ClRoZSBkdC1iaW5kaW5nIGV4cGVjdHMgdGhlIGRyaXZlLXN0cmVuZ3RoIGFyZ3VtZW50cyB0byBi
ZSBwYXNzZWQgaW4gbUEsDQpidXQgdGhlDQpkcml2ZXIgd2FzIHVzaW5nIGNhbGxiYWNrcyB0aGF0
IGV4cGVjdCByYXcgdmFsdWVzIGluc3RlYWQuIENoYW5nZSB0aGUNCmNhbGxiYWNrcw0KZm9yIHRo
ZSBvbmVzIHRoYXQgb3BlcmF0ZSBvbiBtQSB2YWx1ZXMsIHNvIHRoYXQgdGhlIGRyaXZlciBpcyBp
bg0KYWNjb3JkYW5jZSB0bw0KdGhlIGR0LWJpbmRpbmcuDQoNClRoZSBkcml2ZS1zdHJlbmd0aCBw
cm9wZXJ0eSByZXF1aXJpbmcgdmFsdWVzIGluIG1BIGlzIHRoZSBzdGFuZGFyZCBhbmQNCm90aGVy
DQpNZWRpYVRlayBTb0NzIG9mIHRoZSBzYW1lIGdlbmVyYXRpb24gYWxyZWFkeSBkbyB0aGUgc2Ft
ZSwgc28gdGhpcw0KY2hhbmdlIGF2b2lkcw0KbXQ4MTkyIGhhdmluZyBhIG5vbi1zdGFuZGFyZCBw
cm9wZXJ0eS4NCg0KVGhlcmUgYXJlIG5vIGN1cnJlbnQgdXBzdHJlYW0gdXNlcnMgb2YgdGhpcyBk
cml2ZXIsIHNvIHRoaXMgY2hhbmdlDQpkb2Vzbid0IGNhdXNlDQphbnkgcmVncmVzc2lvbi4NCg0K
Rml4ZWQgaW4gbmV4dCBwYXRjaCwgdGhhbmtzIQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHdW9k
b25nIExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsuY29tPg0KDQpSZXZpZXdlZC1ieTogTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KVGVzdGVkLWJ5OiBO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQoNClRoYW5r
cywNCk7DrWNvbGFzDQo=


