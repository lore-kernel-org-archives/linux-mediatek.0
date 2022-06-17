Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD55C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VovW6srN6b9PTqCc3vMKAa1dbxyaxkn29ozXDoTz3k=; b=3m09/LfsdZoTi0FUaLgwbkN0qH
	vHeigLeRraPUd1MscgoN1PAfYXoJI+FJ8cRRuYG+yxhYOIsV8XIRY6ftmnaoLhjqSFwWYjDKbabX6
	dEZQHNXiz7D/nYqlR9YLjtr6KOu11o2ZB3b56Y+PJj9YpOHZETjTyKH42YPv2M7/cJ6+okeYUFuCM
	cGezeh3vMuD0NjiKX4kTHUrR5H38juQvBYiQaYBRFYFEPufiHQUPtNTt8r3jOaGmcJSPRcoiMxECo
	6H5qFpd6JoAOg0DYsgBjOkmwjs3pWqz6n2xUHFFR64PzfM7/fHiaVbd2lPZpQC6e2Vui9HgjgSguZ
	Nh41racQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26io-00665k-HS; Fri, 17 Jun 2022 07:48:50 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26UP-005zQ5-8r; Fri, 17 Jun 2022 07:33:58 +0000
X-UUID: 6899540c065840d78c002dc4738db91e-20220617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1VovW6srN6b9PTqCc3vMKAa1dbxyaxkn29ozXDoTz3k=;
	b=l4FqWWCGmc5KFJZf/xvY1o8cYFbpmcxu2BR9xwZxNwMsZ6HFh9W2IOaVblRChon5isdE1s4TMCXU5n8hAX9eotXbRfPyLpMjl3uYateMqjZ3XVbCFzPkowvml89MrZi//UPwt3D7evN/ObIp2jmxWqOqjw+YSUl96xRZhFTwI9c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:36431b1e-000b-42d0-82ea-aed528979327,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:f2249df6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6899540c065840d78c002dc4738db91e-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2091497515; Fri, 17 Jun 2022 00:33:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 00:27:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 17 Jun 2022 15:27:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 15:27:04 +0800
Message-ID: <c6ec34ff6b2a2ead4813a73b989ac21a863b2035.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix non subdev architecture
 open power fail
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Alexandre Courbot <acourbot@chromium.org>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
	George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
	Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 17 Jun 2022 15:27:04 +0800
In-Reply-To: <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
References: <20220617032113.18576-1-yunfei.dong@mediatek.com>
	 <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_003357_372515_DFD65A2F 
X-CRM114-Status: GOOD (  12.19  )
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

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQpPbiBGcmksIDIwMjIt
MDYtMTcgYXQgMTQ6NTYgKzA4MDAsIENoZW4tWXUgVHNhaSB3cm90ZToNCj4gT24gRnJpLCBKdW4g
MTcsIDIwMjIgYXQgMTE6MjEgQU0gWXVuZmVpIERvbmcgPA0KPiB5dW5mZWkuZG9uZ0BtZWRpYXRl
ay5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEFjY29yZGluZyB0byBzdWJkZXZfYml0bWFwIGJpdCB2
YWx1ZSB0byBvcGVuIGhhcmR3YXJlIHBvd2VyLCBuZWVkDQo+ID4gdG8NCj4gPiBzZXQgc3ViZGV2
X2JpdG1hcCB2YWx1ZSBmb3Igbm9uIHN1YmRldiBhcmNoaXRlY3R1cmUuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+
IEZpeGVzOiBjMDViYWRhMzVmMDEgKCJtZWRpYTogbXRrLXZjb2RlYzogQWRkIHRvIHN1cHBvcnQg
bXVsdGkNCj4gaGFyZHdhcmUgZGVjb2RlIikNCj4gDQo+ID8NCj4gDQo+IENoZW5ZdQ0KRml4IGl0
IGluIHBhdGNoIHYyLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0K


