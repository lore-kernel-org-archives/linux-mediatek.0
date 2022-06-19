Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC38C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEUKlUt4C2lo2QOT0T9F3ViRJsVq2/vwZSrtGmYMHwU=; b=sQozKF43DWb0xgzMmLlwFahn1a
	1zTAwJ5QD9gzSzY3jzI/H50npEDcVAnWuRgYHeEC/bc9DAUp0eEXM+mjyVqiEUE50LHrkJviDUhmB
	q8O/tE3UN16z98x/zsnJMajK2oqHt2LXI58zYZmIj7NwDfCBVwsM29FZwv/Qq7twVLJw9SZ1CUCJs
	rkAwTQ2B1TWsrPCooDPPbXaHhv6T8p56KkwQ+Z9KAKAv8ew8Ivi4YziCugJG6GLYNJzMJPd/M6mnn
	X0ejlcOO7JkDSAgF+NZqOBP6wIisNpH1qiwFGEeG0BAZQKWVS2LtB0Yp1KZRqJ+tem99/c9oXXHeh
	wF9A92JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2poX-00DWsB-VF; Sun, 19 Jun 2022 07:57:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2poN-00DWrY-La; Sun, 19 Jun 2022 07:57:37 +0000
X-UUID: e4a80da01ebb4640a014bebda81bc564-20220619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=HEUKlUt4C2lo2QOT0T9F3ViRJsVq2/vwZSrtGmYMHwU=;
	b=O6x6KWBVXParv1Ym6IqhXYjVFiJTBW+gBRtXQl3ahvrjDKsffEK6m9DIcol9XFQ4xO5avVNRhDPTTJHsDEczodFMLuYgHQNyXbInk71PVsXh2F+J+vRXGQ348Iuq2nJe8QsmEy15k3MwGFjV5Cj7DCRB6+YSJgnSCsw0OUPnA8o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2a88a6c7-a2f6-462f-9da3-26ddcf06e436,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:25fdcaf6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e4a80da01ebb4640a014bebda81bc564-20220619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 715948596; Sun, 19 Jun 2022 00:57:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 19 Jun 2022 00:47:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 19 Jun 2022 15:47:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 19 Jun 2022 15:47:25 +0800
Message-ID: <77a81d8ac29263da965950c9f43240836291f5a4.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: Allow wakeup
 interrupt-names to be optional
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Sun, 19 Jun 2022 15:47:25 +0800
In-Reply-To: <20220617222916.2435618-2-nfraprado@collabora.com>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-2-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_005735_755067_F6B10C5E 
X-CRM114-Status: GOOD (  12.33  )
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

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDE4OjI5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gQWRkIG1pc3NpbmcgIm1pbkl0ZW1zOiAxIiB0byB0aGUgaW50ZXJydXB0LW5h
bWVzIHByb3BlcnR5IHRvIGFsbG93DQo+IHRoZQ0KPiBzZWNvbmQgaW50ZXJydXB0LW5hbWVzLCAi
d2FrZXVwIiwgdG8gYmUgb3B0aW9uYWwuDQo+IA0KPiBGaXhlczogZmU4ZTQ4ODA1OGM0ICgiZHQt
YmluZGluZ3M6IHVzYjogbXRrLXhoY2k6IGFkZCB3YWtldXANCj4gaW50ZXJydXB0IikNCj4gU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPg0KPiANCj4gLS0tDQo+IA0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4geGhjaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+IHhoY2kueWFtbA0KPiBpbmRl
eCA4OTI3MTg0NTlkMjUuLjYzY2JjMmI2MmQxOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sDQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLXhoY2ku
eWFtbA0KPiBAQCAtNTcsNiArNTcsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgLSBkZXNjcmlw
dGlvbjogb3B0aW9uYWwsIHdha2V1cCBpbnRlcnJ1cHQgdXNlZCB0byBzdXBwb3J0DQo+IHJ1bnRp
bWUgUE0NCj4gIA0KPiAgICBpbnRlcnJ1cHQtbmFtZXM6DQo+ICsgICAgbWluSXRlbXM6IDENCj4g
ICAgICBpdGVtczoNCj4gICAgICAgIC0gY29uc3Q6IGhvc3QNCj4gICAgICAgIC0gY29uc3Q6IHdh
a2V1cA0KQWNrZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4N
Cg0KVGhhbmtzDQo=


