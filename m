Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEDCC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xU7QE9xsJQx9Qz2iPrK6TRetQaJpLDQiwCYJOKUwq5c=; b=YtB+Jk2CZ3lJjZio+MZlOtY7qn
	HNrIBA7HQEljJCr44BtFoHvu6aQhiHO0a0NAulWgR+BJv13VgIfqWWccaoGF4GSt7QQCgacrLMC18
	bFdRxMJbPJQ+iAJQCwxKkyZoJiKEAEwVtoPVK0U9ciEM6LxHvi0HpMcSDGAY2pYz5SHmtvyjJHXkt
	0boEsQoZM5KidiNWlFb8rzNrHSZuklss1aUx1KEnccgW46AhtOErE01pNd9z0FHjshjrfUYIwdTow
	8ZTVHXqgBqrV9X6hnUF7tfbhBLAbUpaXzmgZxv05aYklSb4736nzVAHc+0U31DFy3FKeB/Ev4bMAU
	06c96htA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66WG-005EtP-B4; Tue, 28 Jun 2022 08:24:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66Ru-005CgP-DG; Tue, 28 Jun 2022 08:19:56 +0000
X-UUID: 95f692fe3d8a4da58203d4288d8d3e3f-20220628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xU7QE9xsJQx9Qz2iPrK6TRetQaJpLDQiwCYJOKUwq5c=;
	b=cnBARmfWbmAcvrdihDh1SxswtF3i4ggbXLvP6KkJy/pwjeu8d0p4qAcgmlR/rssmBiMV91p7NEeGBzoWnCFuFY6xXIChlQ6xsOcU39vtQTKRUPdVjGmShfIhIvuVnJNbFThT0kRXDaOUXgm0KO7AlGHKRZkMwglSYSvFt7iqPpA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:cbc1d79b-30ec-4b64-b5e3-692a7f675024,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:b712d762-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 95f692fe3d8a4da58203d4288d8d3e3f-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 790976983; Tue, 28 Jun 2022 01:19:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 28 Jun 2022 16:19:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 16:19:31 +0800
Message-ID: <4dbbdd1f5886f72d5603ea45fd24602087ac01fc.camel@mediatek.com>
Subject: Re: [PATCH v10 2/2] phy: mediatek: Add PCIe PHY driver
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
	<randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
	<chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<jian.yang@mediatek.com>
Date: Tue, 28 Jun 2022 16:19:31 +0800
In-Reply-To: <20220617070246.20142-3-jianjun.wang@mediatek.com>
References: <20220617070246.20142-1-jianjun.wang@mediatek.com>
	 <20220617070246.20142-3-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_011954_594972_15E2520F 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDE1OjAyICswODAwLCBKaWFuanVuIFdhbmcgd3JvdGU6DQo+
IEFkZCBQQ0llIEdFTjMgUEhZIGRyaXZlciBzdXBwb3J0IG9uIE1lZGlhVGVrIGNoaXBzZXRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmlhbmp1biBXYW5nIDxqaWFuanVuLndhbmdAbWVkaWF0ZWsu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcgICAgICAgIHwgIDEx
ICsrDQo+ICBkcml2ZXJzL3BoeS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICB8ICAgMSArDQo+ICBk
cml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLXBjaWUuYyB8IDI2Nw0KPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI3OSBpbnNlcnRpb25zKCspDQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1wY2llLmMN
Cj4gDQpSZXZpZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29t
Pg0KDQpUaGFua3MNCg==


