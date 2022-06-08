Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22064C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1QZyjXizsFv+KIkIKdLLGUPQ6bhSEBoimuc6lA0nYA=; b=r/RraHoQLXy9pb
	PvniPaeC0wDqgH81We/ug+6Rw1eWrXLKqExSz8fxpxK9aRs2Su6rBuEi9gJiI02tFTVyHQ2mRNWNu
	pqDb+rV1t5KY3tA4ugVXk0B6+Q0W1Usc6i2E/ZB+frRcJCpTVqv0AzZzLuCIWl8KmzUTKzlwFWoH5
	OG0AMmWbEgGl+EPpwnH4seH3fhentCGQYYWb5QhEXvDQ8LIbgMQ/RG4dYkjAzhTfShZ07Ep42NxjT
	xuzE3wufbk3f3PnOB47MmWDjPUmJ/pNCgOLl51epe5heIQYrBrOdb3eFXpmj/EAQUjAZeaYeGAWq3
	YiPTks7mZuEhigTn5dKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqu2-00Btcp-AH; Wed, 08 Jun 2022 08:18:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqtV-00BtI4-AH; Wed, 08 Jun 2022 08:18:27 +0000
X-UUID: 703ebebde10e4de4a4fba99ede022f80-20220608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Sbzo1Gi95FKebvAN/Z5YrZtaMlZdL6qzv3x/X6y+SYo=;
	b=jYlLbykBvGPEHUzr+CS7ujCZYZLi91inEWTWhzUQy02zOkmR43d0bTWsh3jGgszg0MXCJU0KyYIz25JX2l7aew47CEalzUo0qYCwpD3EdAtCtGq8hn/ms6S6SyHHq4S8npNLS4SUnm/4pDvvW6Uc1Ozv85esvtdj7L1aHF/h2BY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d90b920c-66db-4904-8521-6ce111681d63,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:0b879e7e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:0,BEC:nil
X-UUID: 703ebebde10e4de4a4fba99ede022f80-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1860654104; Wed, 08 Jun 2022 01:18:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:08:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 16:08:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jun 2022 16:08:13 +0800
Message-ID: <1332454e2733d48fdf2396bcaed37bc3e33616b5.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8192: Switch
 drive-strength-adv for -microamp
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 8 Jun 2022 16:08:13 +0800
In-Reply-To: <20220531221954.160036-2-nfraprado@collabora.com>
References: <20220531221954.160036-1-nfraprado@collabora.com>
	 <20220531221954.160036-2-nfraprado@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_011825_433610_8B7B4D2E 
X-CRM114-Status: GOOD (  15.45  )
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClRvOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+DQpDYzogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbQ0KPiwga2VybmVsQGNvbGxhYm9yYS5jb20s
IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDwNCm5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiwgS3J6
eXN6dG9mIEtvemxvd3NraSA8DQprcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+LCBN
YXR0aGlhcyBCcnVnZ2VyIDwNCm1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+LCBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPiwgU2VhbiBXYW5nIDwNCnNlYW4ud2FuZ0BtZWRpYXRlay5jb20+
LCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgDQpsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcsIGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnLCANCmxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNClN1Ympl
Y3Q6IFtQQVRDSCB2MiAxLzJdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IFN3aXRjaCBk
cml2ZS0NCnN0cmVuZ3RoLWFkdiBmb3IgLW1pY3JvYW1wDQpEYXRlOiBUdWUsIDMxIE1heSAyMDIy
IDE4OjE5OjUzIC0wNDAwDQoNCkNvbW1pdCBlNWZhYmJlNDNmM2YgKCJwaW5jdHJsOiBtZWRpYXRl
azogcGFyaXM6IFN1cHBvcnQgZ2VuZXJpYw0KUElOX0NPTkZJR19EUklWRV9TVFJFTkdUSF9VQSIp
IGFkZGVkIHN1cHBvcnQgZm9yIHVzaW5nDQpkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCBpbnN0ZWFk
IG9mIG1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdi4NCg0KU2luY2UgdGhlcmUgYXJlbid0IGFu
eSB1c2VycyBvZiBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgb24gbXQ4MTkyDQp5ZXQsIHJl
bW92ZSB0aGlzIHByb3BlcnR5IGFuZCBhZGQgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgaW4gaXRz
IHBsYWNlLA0Kd2hpY2ggaGFzIGEgY2xlYXJlciBtZWFuaW5nLg0KDQpXaGlsZSBhdCBpdCwgYWRk
IGEgbmV3ICdpZicgYmxvY2sgdG8gdmFsaWRhdGUgdGhhdCBkcml2ZS1zdHJlbmd0aCBhbmQNCmRy
aXZlLXN0cmVuZ3RoLW1pY3JvYW1wIGFyZW4ndCB1c2VkIHRvZ2V0aGVyLCBzaW5jZSB0aGV5J3Jl
IG11dHVhbGx5DQpleGNsdXNpdmUuDQoNClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDwNCmFuZ2Vsb2dpb2NjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KLS0tDQoNCkNo
YW5nZXMgaW4gdjI6DQotIEFkZGVkICdpZicgYmxvY2sgdG8gbWFrZSBkcml2ZS1zdHJlbmd0aCBh
bmQgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXANCiAgbXV0dWFsbHkgZXhjbHVzaXZlDQotIENoYW5n
ZWQgY29tbWl0IHRpdGxlIHRvIGJlIG1vcmUgcHJlY2lzZQ0KLSBEcm9wcGVkIEZpeGVzIHRhZw0K
DQogLi4uL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbCAgICAgIHwgMzUgKysr
KysrLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyNSBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL3BpbmN0cmwtDQptdDgxOTIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtDQptdDgxOTIueWFtbA0KaW5kZXggYzkwYTEz
MmZiYzc5Li5jODA5MmIyMThmMmYgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sDQorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sDQpAQCAt
ODAsMzEgKzgwLDggQEAgcGF0dGVyblByb3BlcnRpZXM6DQogICAgICAgICAgICAgICBkdC1iaW5k
aW5ncy9waW5jdHJsL210NjV4eC5oLiBJdCBjYW4gb25seSBzdXBwb3J0DQoyLzQvNi84LzEwLzEy
LzE0LzE2bUEgaW4gbXQ4MTkyLg0KICAgICAgICAgICAgIGVudW06IFsyLCA0LCA2LCA4LCAxMCwg
MTIsIDE0LCAxNl0NCiANCi0gICAgICAgICAgbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2Og0K
LSAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQotICAgICAgICAgICAgICBEZXNjcmliZSB0aGUg
c3BlY2lmaWMgZHJpdmluZyBzZXR1cCBwcm9wZXJ0eS4NCi0gICAgICAgICAgICAgIEZvciBJMkMg
cGlucywgdGhlIGV4aXN0aW5nIGdlbmVyaWMgZHJpdmluZyBzZXR1cCBjYW4NCm9ubHkgc3VwcG9y
dA0KLSAgICAgICAgICAgICAgMi80LzYvOC8xMC8xMi8xNC8xNm1BIGRyaXZpbmcuIEJ1dCBpbiBz
cGVjaWZpYyBkcml2aW5nDQpzZXR1cCwgdGhleQ0KLSAgICAgICAgICAgICAgY2FuIHN1cHBvcnQg
MC4xMjUvMC4yNS8wLjUvMW1BIGFkanVzdG1lbnQuIElmIHdlIGVuYWJsZQ0Kc3BlY2lmaWMNCi0g
ICAgICAgICAgICAgIGRyaXZpbmcgc2V0dXAsIHRoZSBleGlzdGluZyBnZW5lcmljIHNldHVwIHdp
bGwgYmUNCmRpc2FibGVkLg0KLSAgICAgICAgICAgICAgVGhlIHNwZWNpZmljIGRyaXZpbmcgc2V0
dXAgaXMgY29udHJvbGxlZCBieSBFMUUwRU4uDQotICAgICAgICAgICAgICBXaGVuIEUxPTAvRTA9
MCwgdGhlIHN0cmVuZ3RoIGlzIDAuMTI1bUEuDQotICAgICAgICAgICAgICBXaGVuIEUxPTAvRTA9
MSwgdGhlIHN0cmVuZ3RoIGlzIDAuMjVtQS4NCi0gICAgICAgICAgICAgIFdoZW4gRTE9MS9FMD0w
LCB0aGUgc3RyZW5ndGggaXMgMC41bUEuDQotICAgICAgICAgICAgICBXaGVuIEUxPTEvRTA9MSwg
dGhlIHN0cmVuZ3RoIGlzIDFtQS4NCi0gICAgICAgICAgICAgIEVOIGlzIHVzZWQgdG8gZW5hYmxl
IG9yIGRpc2FibGUgdGhlIHNwZWNpZmljIGRyaXZpbmcNCnNldHVwLg0KLSAgICAgICAgICAgICAg
VmFsaWQgYXJndW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6DQotICAgICAgICAgICAgICAw
OiAoRTEsIEUwLCBFTikgPSAoMCwgMCwgMCkNCi0gICAgICAgICAgICAgIDE6IChFMSwgRTAsIEVO
KSA9ICgwLCAwLCAxKQ0KLSAgICAgICAgICAgICAgMjogKEUxLCBFMCwgRU4pID0gKDAsIDEsIDAp
DQotICAgICAgICAgICAgICAzOiAoRTEsIEUwLCBFTikgPSAoMCwgMSwgMSkNCi0gICAgICAgICAg
ICAgIDQ6IChFMSwgRTAsIEVOKSA9ICgxLCAwLCAwKQ0KLSAgICAgICAgICAgICAgNTogKEUxLCBF
MCwgRU4pID0gKDEsIDAsIDEpDQotICAgICAgICAgICAgICA2OiAoRTEsIEUwLCBFTikgPSAoMSwg
MSwgMCkNCi0gICAgICAgICAgICAgIDc6IChFMSwgRTAsIEVOKSA9ICgxLCAxLCAxKQ0KLSAgICAg
ICAgICAgICAgU28gdGhlIHZhbGlkIGFyZ3VtZW50cyBhcmUgZnJvbSAwIHRvIDcuDQotICAgICAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQotICAg
ICAgICAgICAgZW51bTogWzAsIDEsIDIsIDMsIDQsIDUsIDYsIDddDQoNCkNhbid0IHJlbW92ZSBt
ZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgcHJvcGVydHksIEkyQyBwaW5zIHdpbGwgb2Z0ZXIN
CnVzZSB0aGlzIHByb3BlcnR5DQoNCisgICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6
DQorICAgICAgICAgICAgZW51bTogWzEyNSwgMjUwLCA1MDAsIDEwMDBdDQogDQogICAgICAgICAg
IG1lZGlhdGVrLHB1bGwtdXAtYWR2Og0KICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQpAQCAt
MTM4LDYgKzExNSwxNCBAQCBwYXR0ZXJuUHJvcGVydGllczoNCiAgICAgICAgIHJlcXVpcmVkOg0K
ICAgICAgICAgICAtIHBpbm11eA0KIA0KKyAgICAgICAgYWxsT2Y6DQorICAgICAgICAgIC0gaWY6
DQorICAgICAgICAgICAgICByZXF1aXJlZDoNCisgICAgICAgICAgICAgICAgLSBkcml2ZS1zdHJl
bmd0aC1taWNyb2FtcA0KKyAgICAgICAgICAgIHRoZW46DQorICAgICAgICAgICAgICBwcm9wZXJ0
aWVzOg0KKyAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aDogZmFsc2UNCisNCiAgICAgICAg
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KIA0KUHJvcGVydHkgZHJpdmUtc3RyZW5ndGgt
bWljcm9hbXAgYW5kIGRyaXZlLXN0cmVuZ3RoIGFyZW4ndCBleGNsdXNpdmUsDQpqdXN0IGkyYyBw
aW5zIHN1cHBvcnQgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgcHJvcGVydHkgLg0KDQogYWxsT2Y6
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
