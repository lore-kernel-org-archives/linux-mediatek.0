Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3626C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC396124D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FC396124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeXJmWa7zI3zwmtVYdryJ03gX13J46a6qH3SP2HzQn0=; b=fDef8WUwwfkcIw
	SaX4V7jCN+kb1jYX0kLhRTrRyVWbHu1g6YxRq3EBZWuJXtoSR1FT2RFwXXkzE3jCJC9e3DFmziXnj
	AIQ3FDWoAQl5gQkUbrbGV9P0W1B6lvGNlMfZL7kp1v8DkfGUrdoywmoNrB9jsLm2s8X+r9CnHq85e
	RBufsVWIhv6IvHmK9G+6e2y93lCbE5OqhuKnmaqwRgBDjKzE6M6rAJGI01HLUbkDo5FXRHe5TCmoe
	PkYGTJGHI6Iw+nezXSu/KZptyzozyW8/kHsvQbhXulCESYfGqEz/2CBmT9wk3N60HUB4AQ0ULrPPB
	202VHhdfT+SGTcLG8fgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlLHe-009AR1-Ez; Fri, 12 Nov 2021 01:23:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlLHR-009AOO-OC; Fri, 12 Nov 2021 01:23:03 +0000
X-UUID: 393ac5577a474c65bf6554dd8913c6fe-20211111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TtsxtXZ5jRLUQ4PRm4V/CvWh/SoHbjgXn3ntlYhdugA=; 
 b=QZUULZPMPnjJkhdhSfGfPNNnGzIFxsVOpmfm75ZzlDf6w4r5upmSGRDJb+3u/+8ez+1zvTVHnvUkxLocUZbK3UVlidN7BX7fcR8al9WjXk1dbB23EIzer0rpBI4HwhS/beNF89lTmk9s8dm4SSZXsfUN56S1Yf95LohSs4ukYh0=;
X-UUID: 393ac5577a474c65bf6554dd8913c6fe-20211111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473749446; Thu, 11 Nov 2021 18:22:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 17:22:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 09:22:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 09:22:47 +0800
Message-ID: <52eeec07d0b909f652716e24ab360de353480484.camel@mediatek.com>
Subject: Re: [PATCH v2 0/5] MediaTek Ethernet Patches on MT8195
From: Biao Huang <biao.huang@mediatek.com>
To: Denis Kirjanov <dkirjanov@suse.de>, <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>
Date: Fri, 12 Nov 2021 09:22:47 +0800
In-Reply-To: <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_172301_961134_0DEFB3CF 
X-CRM114-Status: GOOD (  15.92  )
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

RGVhciBEZW5pcywNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHN+DQoNCk9uIFRodSwgMjAyMS0x
MS0xMSBhdCAxNDozNSArMDMwMCwgRGVuaXMgS2lyamFub3Ygd3JvdGU6DQo+IA0KPiAxMS8xMS8y
MSAxMDoxMiBBTSwgQmlhbyBIdWFuZyDQv9C40YjQtdGCOg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+
ID4gMS4gZml4IGVycm9ycy93YXJuaW5ncyBpbiBtZWRpYXRlay1kd21hYy55YW1sIHdpdGggdXBn
cmFkZWQNCj4gPiBkdHNjaGVtYSB0b29scw0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGluY2x1ZGUg
NSBwYXRjaGVzOg0KPiA+IDEuIGFkZCBwbGF0Zm9ybSBsZXZlbCBjbG9ja3MgbWFuYWdlbWVudCBm
b3IgZHdtYWMtbWVkaWF0ZWsNCj4gPiAyLiByZXN1ZSBtb3JlIGNvbW1vbiBmZWF0dXJlcyBkZWZp
bmVkIGluIHN0bW1hY19wbGF0Zm9ybS5jDQo+ID4gMy4gYWRkIGV0aGVybmV0IGVudHJ5IGZvciBt
dDgxOTUNCj4gPiA0LiBjb252ZXJ0IG1lZGlhdGVrLWR3bWFjLnR4dCB0byBtZWRpYXRlay1kd21h
Yy55YW1sDQo+ID4gNS4gYWRkIGV0aGVybmV0IGRldmljZSBub2RlIGZvciBtdDgxOTUNCj4gDQo+
IGFsbCBuZXcgZmVhdHVyZSBzaG91bGQgYmUgc2VudCBwcmVmaXhlZCB3aXRoIG5ldC1uZXh0DQpP
SywgSSdsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+IA0KPiA+IEJpYW8gSHVhbmcgKDUp
Og0KPiA+ICAgIG5ldDogc3RtbWFjOiBkd21hYy1tZWRpYXRlazogYWRkIHBsYXRmb3JtIGxldmVs
IGNsb2Nrcw0KPiA+IG1hbmFnZW1lbnQNCj4gPiAgICBuZXQ6IHN0bW1hYzogZHdtYWMtbWVkaWF0
ZWs6IFJldXNlIG1vcmUgY29tbW9uIGZlYXR1cmVzDQo+ID4gICAgbmV0OiBzdG1tYWM6IGR3bWFj
LW1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgbXQ4MTk1DQo+ID4gICAgZHQtYmluZGluZ3M6IG5l
dDogZHdtYWM6IENvbnZlcnQgbWVkaWF0ZWstZHdtYWMgdG8gRFQgc2NoZW1hDQo+ID4gICAgYXJt
NjQ6IGR0czogbXQ4MTk1OiBhZGQgZXRoZXJuZXQgZGV2aWNlIG5vZGUNCj4gPiANCj4gPiAgIC4u
Li9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMudHh0ICAgICAgICAgICB8ICA5MSAtLS0tLQ0K
PiA+ICAgLi4uL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sICAgICAgICAgIHwgMjEx
ICsrKysrKysrKysrKw0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUt
ZXZiLmR0cyAgIHwgIDkyICsrKysrDQo+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5NS5kdHNpICAgICAgfCAgNzAgKysrKw0KPiA+ICAgLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwgMzEzDQo+ID4gKysrKysrKysrKysrKysrKy0tDQo+
ID4gICA1IGZpbGVzIGNoYW5nZWQsIDY2NCBpbnNlcnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0p
DQo+ID4gICBkZWxldGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21lZGlhdGVrLWR3bWFjLnR4dA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21h
Yy55YW1sDQo+ID4gDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCj4gPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
