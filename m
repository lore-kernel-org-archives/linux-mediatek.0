Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE86C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 17:17:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADAD32078E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 17:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vwZLpga+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UDrCpQnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADAD32078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uB5YjblgQzvZrSNorNqg2HnNsTbi8C+AaeyfM5NIMR4=; b=vwZLpga+kRm/oNGNO1LwX+z/p
	8I9lPzhY/uvXwEfr8LGKgiMTG6NEA427r81KduliVtiPabNEgms5KDl3YO7WKT07nEpuT1aQoNldw
	AMwF0IV1QS9sdTnvU5TpHwi71XaABJAIQrdXwE42/eDVy+gEqaLsmGRmTu3DyZ6sAJJanwgsjwgzC
	2Quq/w95Ui7WDXSCMd/s7uKdaquzh9MmvN7e3fjH/mhT7kwmO+8568WXd/JuvY865CpKvt60Ml29/
	aVl/ZC2tZjYzuKUAhWFfcQ9RSZWT4x1hfBHQ0Xwez2mQkQb/uVLEZ9oEPkIrvaBkuvokKKvK5Q+7u
	2S0diDdpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPU7L-0004ya-AH; Mon, 05 Oct 2020 17:17:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPU7I-0004wE-Sh; Mon, 05 Oct 2020 17:17:42 +0000
X-UUID: fd233371a10547e799299c7d9e1c5791-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VecbbSPzO8pFOpEeHf5BylriZHlXVPRwNmcW3hbUEHQ=; 
 b=UDrCpQnBHIMHt/K8P2JbIBXFU+4q8tg1pf2wnNPxgqRGDFl4DnYl44eY9ZB3dNyfc7AV2G0TRZs7OhBsNdlsPreWvQT4xi8a3/rliO1Tq710+65cPnUOXCECXNMTKJQXSm7VlJsvtXel0dO/++wNLI+nyLLtX0XkQv4Arg2R9gQ=;
X-UUID: fd233371a10547e799299c7d9e1c5791-20201005
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <phil.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 215432198; Mon, 05 Oct 2020 09:17:21 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 10:17:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Oct 2020 01:17:17 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Oct 2020 01:17:15 +0800
Message-ID: <1601918237.17256.3.camel@mtksdccf07>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of
 reserved regions
From: Phil Chang <phil.chang@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 6 Oct 2020 01:17:17 +0800
In-Reply-To: <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
References: <20201004055024.23542-1-phil.chang@mediatek.com>
 <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1971EF7FADA804FD4DEB0317AF4ED35E219F726F439E90C354A0E8A7BE6052DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_131741_048949_2CBCEA34 
X-CRM114-Status: GOOD (  23.45  )
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
Cc: DTML <devicetree@vger.kernel.org>, Alix Wu <alix.wu@mediatek.com>,
 YJ Chiang <yj.chiang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Liu <joe.liu@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZw0KDQpTb3JyeSBmb3IgdHlwby4gSW4gZmFjdCwgdGhlIGR0cyBvZiBuZXcg
U29DIGlzIG5vdCB1cHN0cmVhbSB5ZXQuIEknbSBzbw0Kc29ycnkgZm9yIGNvdWxkbid0IHNob3cg
dGhlIGRldGFpbCBub3cuDQoNCkhvdyBhYm91dCB0aGUgY29uZmlndXJhYmxlIE1BWF9SRVNFUlZF
RF9SRUdJT05TIHNpemUgbGlrZSB0aGlzIHBhdGNoPw0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDY5MjEwMS8NCg0KIA0KT24gU3VuLCAyMDIwLTEwLTA0IGF0IDIxOjA1ICsw
ODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgUGhpbDoNCj4gDQo+IFBoaWwgQ2hhbmcg
PHBoaWwuY2hhbmdAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDEw5pyINOaXpSDpgLHml6Ug5LiL
5Y2IMTo1MeWvq+mBk++8mg0KPiA+DQo+ID4gQ2VydGFpbiBTb0NzIG5lZWQgdG8gc3VwcG9ydCBs
YXJnZSBhbW91bnQgb2YgcmVzZXJ2ZWQgbWVtb3J5DQo+ID4gcmVnaW9ucywgZXNwZWNpYWxseSB0
byBmb2xsb3cgdGhlIEdLSSBydWxlcyBmcm9tIEdvb2dsZS4NCj4gPiBJbiBNVEsgbmV3IFNvQyBy
ZXF1aXJlcyBtb3JlIHRoYW4gNjggcmVnaW9ucyBvZiByZXNlcnZlZCBtZW1vcnkNCj4gPiBmb3Ig
ZWFjaCBJUCdzIHVzYWdlLCBzdWNoIGFzIGxvYWQgZmlybXdhcmUgdG8gc3BlY2lmaWMgc2FwY2Us
DQo+IA0KPiBzcGFjZQ0KPiANCj4gPiBzbyB0aGF0IG5lZWQgdG8gcmVzZXJ2ZSBtb3JlIHJlZ2lz
aW9ucw0KPiANCj4gcmVnaW9ucy4NCj4gDQo+IEkgZ3Vlc3MgdGhpcyByZXF1aXJlbWVudCBpcyBm
cm9tIE1lZGlhdGVrIFNvQywgYnV0IEkgZmluZCBiZWxvdyBkZXZpY2UNCj4gdHJlZSBhbmQganVz
dCBmaW5kIG9uZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9uLA0KPiANCj4gYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQ0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE3My5kdHNpDQo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4NTE2LmR0c2kN
Cj4gDQo+IENvdWxkIHlvdSBzaG93IG1lIHRoZSA2OCByZWdpb25zPw0KPiANCj4gUmVnYXJkcywN
Cj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgTGl1IDxqb2Uu
bGl1QG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZSiBDaGlhbmcgPHlqLmNoaWFu
Z0BtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxpeCBXdSA8YWxpeC53dUBtZWRp
YXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBDaGFuZyA8cGhpbC5jaGFuZ0BtZWRp
YXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgfCAy
ICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgYi9kcml2
ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jDQo+ID4gaW5kZXggNDZiOTM3MWM4YTMzLi41OTVmMDc0
MWRjZWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYw0KPiA+
ICsrKyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMNCj4gPiBAQCAtMjIsNyArMjIsNyBA
QA0KPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbWVt
YmxvY2suaD4NCj4gPg0KPiA+IC0jZGVmaW5lIE1BWF9SRVNFUlZFRF9SRUdJT05TICAgNjQNCj4g
PiArI2RlZmluZSBNQVhfUkVTRVJWRURfUkVHSU9OUyAgIDEyOA0KPiA+ICBzdGF0aWMgc3RydWN0
IHJlc2VydmVkX21lbSByZXNlcnZlZF9tZW1bTUFYX1JFU0VSVkVEX1JFR0lPTlNdOw0KPiA+ICBz
dGF0aWMgaW50IHJlc2VydmVkX21lbV9jb3VudDsNCj4gPg0KPiA+IC0tDQo+ID4gMi4xOC4wDQo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
