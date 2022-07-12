Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 01:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuNBvNqEGCK2Oy0aF2ze/PQgAzAdfjX9bUjOBbyfgoE=; b=k9DJxx7avtWMSimgt84vY6BR8L
	w6WQ9I7ngyAuPdHwTAqPJAi26Z3QdFEbvaB3IC4Smne9W3TjhA3mZ9RQo4GGg1mKFm3XlQ5rzrDqI
	RRrsCu+/WIQkIE32pd7GnDtL1GDeZKQFY7nXb2dF/cXmbMs0xHMAJfV+Y+JtLvHomRW/7/z8ebvxl
	KExV2tv3UwKYFHR4V6I9slgrcWkBKOw6ZIBt/6TFFPM8mMvsq4jcp/3Y7kAII35ATwMv7qau0sgR0
	sbgSrFabi8WP544xzptQkbmZ1ag7XTOwymtalRoZpFfAU2Cok7vploEWILMjQ5gwJ60L5b1H2uv5K
	w/Mep1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4bu-006QFA-VC; Tue, 12 Jul 2022 01:22:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4bt-006QDH-8Y; Tue, 12 Jul 2022 01:22:46 +0000
X-UUID: 6dd1c3b891b84beea919b72646afb1b6-20220711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tuNBvNqEGCK2Oy0aF2ze/PQgAzAdfjX9bUjOBbyfgoE=;
	b=J4DcWLJ16VG9XKK6RpWHL+o+YY8mQjLhPlI4RmARrzmfgMs3RZSwCdhwybjYINreSmP9yjRcL9bmYt+Xl6LR5wEUYYRLLZJDybGajkMshaHso1bErhvrVi1i7BkuAvyHHIiV7OkE1NZJsCD86Scbrn49aNDrc/Awk0zIax78BS0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:03de4ac3-1a31-45c9-8746-a3b6c18de832,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:a62d0264-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6dd1c3b891b84beea919b72646afb1b6-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 716099232; Mon, 11 Jul 2022 18:22:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Jul 2022 09:11:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 09:11:57 +0800
Message-ID: <af0f9000ba3850adc63585d4cce97532bd9d611d.camel@mediatek.com>
Subject: Re: [PATCH net v3] stmmac: dwmac-mediatek: fix clock issue
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: David Miller <davem@davemloft.net>, Matthias Brugger
	<matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>
Date: Tue, 12 Jul 2022 09:11:57 +0800
In-Reply-To: <20220711153125.74442bce@kernel.org>
References: <20220708083937.27334-1-biao.huang@mediatek.com>
	 <20220708083937.27334-2-biao.huang@mediatek.com>
	 <20220711153125.74442bce@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_182245_332004_99279166 
X-CRM114-Status: GOOD (  11.23  )
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

RGVhciBKYWt1YiwNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQpPbiBNb24sIDIwMjItMDct
MTEgYXQgMTU6MzEgLTA3MDAsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPiBPbiBGcmksIDggSnVs
IDIwMjIgMTY6Mzk6MzcgKzA4MDAgQmlhbyBIdWFuZyB3cm90ZToNCj4gPiBTaW5jZSBjbG9ja3Mg
YXJlIGhhbmRsZWQgaW4gbWVkaWF0ZWtfZHdtYWNfY2xrc19jb25maWcoKSwNCj4gPiByZW1vdmUg
dGhlIGNsb2NrcyBjb25maWd1cmF0aW9uIGluIGluaXQoKS9leGl0KCksIGFuZA0KPiA+IGludm9r
ZSBtZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyBpbnN0ZWFkLg0KPiA+IA0KPiA+IFRoaXMgaXNz
dWUgaXMgZm91bmQgaW4gc3VzcGVuZC9yZXN1bWUgdGVzdC4NCj4gDQo+IFBsZWFzZSBpbXByb3Zl
IHRoZSBjb21taXQgbWVzc2FnZSBzbyB0aGF0IGl0IGFuc3dlcnMgdGhlIHF1ZXN0aW9ucw0KPiBN
YXR0aGlhcyBoYWQgYW5kIHJlcG9zdC4NCk9LLCBJJ2xsIGltcHJvdmUgdGhlIGNvbW1pdCBtZXNz
YWdlIGluIG5leHQgc2VuZC4NCg0KQmVzdCBSZWdhcmRzIQ0KQmlhbw0K


