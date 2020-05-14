Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCBBC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 20:36:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9FB2065C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 20:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3kO3rGW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="laR00/Il"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D9FB2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LoGKc5ZVzBS48f+qT26jEJ6f67lOyDHDU1TH5HWUjs=; b=N3kO3rGWPnqTqm
	gNxhpLMnq8q3HNZLHX4JwzK/fjEZUb53A1iTHF52bddkBI88vWJ/SwJn7iU3ufEpMHfNPGcHk7UeH
	6xjEx2DnrTxYSP0FtIqpql0ikPqmrWXbbqPKE6IhgbTPxEleAB7CupfR7PDjKvQ/YBn3QyKtpa0iu
	kVLNcZBif2ZtkkEeiauzQz8Oui24EdlKy76OqIaopZ4VGHgU0V04QXquH3UJlJpw3AL59ABDZC9VV
	0elybl5TIAntak5pULPdf7U3l8AObUMdHDsUk6o38ZVt+WI565oEPdn6FvXIGh940RHNjl9W+gO0X
	9PtEgJrFE0EJF/Nsc9Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZKat-000308-Dt; Thu, 14 May 2020 20:36:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZKan-0002zO-RU
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 20:36:37 +0000
X-UUID: f7da722898b94f4c9daf36ecc40731ba-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fgYohCKX0RVzkuQRIJF3wZe3P7I46z96cUz69pkjwDg=; 
 b=laR00/Il3dXwN+gzpijyrawluwoT8f22BcBDgyQxtUcqeOU6v9gJbZnHq7veOra496Dhr14kYCzmGCPcaKh8kD87Ly69UGLMchElqyaly9k25LHiediwGPpVl3XVvPNKx93VwvWSOPlo+EM38rhhZgj2A/WX0ZRiXshjYeYyZPU=;
X-UUID: f7da722898b94f4c9daf36ecc40731ba-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1283889603; Thu, 14 May 2020 12:36:27 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 13:36:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 04:36:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 04:36:23 +0800
Message-ID: <1589488584.23507.1.camel@mtkswgap22>
Subject: Re: [SPAM]Re: [PATCH] mt76: fix different licenses in same driver
From: Ryder Lee <ryder.lee@mediatek.com>
To: Jakub Kicinski <kubakici@wp.pl>
Date: Fri, 15 May 2020 04:36:24 +0800
In-Reply-To: <20200514093326.49b995ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <3a5cb822eb4cd81d32b5480f1235c992ea4fbe06.1587193872.git.ryder.lee@mediatek.com>
 <d32134a6-9673-521f-22ee-871aa2284af0@nbd.name>
 <20200507100246.1e902bc8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87pnb7go2m.fsf@tynnyri.adurom.net>
 <20200514093326.49b995ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_133634_055810_A861BEC3 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Lorenzo
 Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Kalle Valo <kvalo@codeaurora.org>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTA1LTE0IGF0IDA5OjMzIC0wNzAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToN
Cj4gT24gVGh1LCAxNCBNYXkgMjAyMCAwNzowMzo0NSArMDMwMCBLYWxsZSBWYWxvIHdyb3RlOg0K
PiA+IEpha3ViIEtpY2luc2tpIDxrdWJha2ljaUB3cC5wbD4gd3JpdGVzOg0KPiA+ID4gT24gVGh1
LCA3IE1heSAyMDIwIDE1OjMwOjI0ICswMjAwIEZlbGl4IEZpZXRrYXUgd3JvdGU6ICANCj4gPiA+
PiBIaSBSeWRlciwNCj4gPiA+PiANCj4gPiA+PiBJIHRoaW5rIGZvciB0aGlzIHBhdGNoIHdlIG5l
ZWQgYW4gZXhwbGljaXQgQUNLIGZyb20gU3RhbmlzbGF3IEdydXN6a2ENCj4gPiA+PiBhbmQgSmFr
dWIgS2ljaW5za2kgKGJvdGggQ2MnZCksIGJlY2F1c2UgbXQ3NngwIHdhcyBsaWNlbnNlZCB1bmRl
ciBHUEwuICANCj4gPiA+DQo+ID4gPiBUaGFua3MsIHllcywgeW91IGRlZmluaXRlbHkgbmVlZCBh
biBhY2ssIGVzcGVjaWFsbHkgZnJvbSBmb2xrcyB3aG8gaGF2ZQ0KPiA+ID4gdGhlaXIgY29weXJp
Z2h0IG9uIHRoZSBmaWxlcyA6Lw0KPiA+ID4NCj4gPiA+IE15IHBlcnNvbmFsIHByZWZlcmVuY2Ug
Zm9yIHRoZSBsaWNlbnNlIHdhcyBleHByZXNzZWQgY2xlYXJseSB3aGVuIHRoZQ0KPiA+ID4gY29k
ZSB3YXMgd3JpdHRlbiBhbmQgaXQgaXMgR1BMLW9ubHkuIEZlbGl4LCBpZiB5b3UgcHJlZmVyIHRo
ZSBjbGVhbiB1cA0KPiA+ID4gSSdtIGhhcHB5IHRvIGFjaywgYnV0IEkgc2VlIG5vIHJlYXNvbiB0
byBkb3duZ3JhZGUgdGhlIGxpY2Vuc2UgYXQNCj4gPiA+IHZlbmRvcidzIHJlcXVlc3QuICANCj4g
PiANCj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIHVuZm9ydHVuYXRlIHRvIGhhdmUgZGlmZmVyZW50
IGxpY2Vuc2VzIGluIHRoZSBzYW1lDQo+ID4gZHJpdmVyLiBGb3IgZXhhbXBsZSB0aGluayBvZiBj
b3B5aW5nIGEgZnVuY3Rpb24gZnJvbSBvbmUgZmlsZSB0bw0KPiA+IGFub3RoZXIsIGhvdyB3b3Vs
ZCB3ZSBoYW5kbGUgdGhhdD8gU28gbXkgc3Ryb25nIHJlY29tbWVuZGF0aW9uIGlzIHRvIHVzZQ0K
PiA+IHRoZSBzYW1lIGxpY2Vuc2UgdGhyb3VnaG91dCB0aGUgZHJpdmVyLiBBbmQgaW4gdGhpcyBj
YXNlIEkgY29uc2lkZXIgbXQ3Ng0KPiA+IGRpcmVjdG9yeSBhbmQgaXQncyBzdWJkaXJlY3Rvcmll
cyBhcyBiZWluZyBvbmUgZHJpdmVyLCBwbGVhc2UgY29ycmVjdCBtZQ0KPiA+IGlmIHRoYXQncyBu
b3QgdGhlIGNhc2UuDQo+IA0KPiBBRkFJVSBzb21lIHBhcnRzIG9mIHRoZSBjb2RlIHdlcmUgYnJv
dWdodCBpbiBmcm9tIG10NzYwMXUgd2hpY2ggaGFzIA0KPiBhIGRpZmZlcmVudCBsaWNlbnNlLiBB
cyBJIHNhaWQgSSdtIGhhcHB5IHdpdGggaXQgaWYgRmVsaXggZmVlbHMgbGlrZQ0KPiBpdCdzIG5l
ZWRlZC4gSnVzdCBub3QgYSBmYW4gb2YgdmVuZG9ycyB3aG8gYmFyZWx5IGNvbnRyaWJ1dGUgbWFr
aW5nDQo+IGxpY2Vuc2UgY2hhbmdlcy4NCg0KDQpZb3UncmUgcmlnaHQuICBXZSBkaWRuJ3QgZ2V0
IG91cnNlbHZlcyBpbnZvbHZlZCBpbiBlYXJsaWVyIGNoaXBzZXQncw0KZHJpdmVyIGRldmVsb3Bt
ZW50LCBidXQgd2UgYWN0dWFsbHkgcGF5IGF0dGVudGlvbiBvbiBpdCBmb3IgeWVhcnMgYW5kDQph
Y3RpdmVseSBqb2luIHRoZSBwYXJ0eS4gV2Uga25vdyBvcGVuIHNvdXJjZSBhbmQgY29tbXVuaXR5
LWRyaXZlbg0Kc29mdHdhcmUgZGV2ZWxvcG1lbnQgaXMgYmVjb21pbmcgaW5jcmVhc2luZ2x5IGlt
cG9ydGFudCB0byB0aGUgd2lyZWxlc3MNCmluZHVzdHJ5LiBTbyBnaXZlIHVzIG1vcmUgdGltZXMg
d2Ugd2lsbCBoYXZlIG1vcmUgZGVkaWNhdGVkIGdyb3VwIG9mDQplbmdpbmVlcnMgZm9jdXNlZCBv
biB0aGlzIGFyZWEgb2YgZ3Jvd2luZyBpbm5vdmF0aW9uLiAod2XigJl2ZSBjb250cmlidXRlcw0K
c29tZSBwYXRjaGVzIGludG8gTVQ3NjE1LCBNVDc2MjIsIE1UNzY2MyBhbmQgb25nb2luZyAxMWF4
IGRldmljZXMpLiBXZQ0KcmVhbGx5IGFwcHJlY2lhdGUgYWxsIHRoZSBlZmZvcnQgeW91IGd1eXMg
bWFkZSBmb3IgbXQ3Ni4gDQoNCkFueXdheSwgSSdtIG9rYXkgdG8gZHJvcCB0aGlzIG9uZSBvciBz
d2l0Y2ggdG8gSVNDIDopDQoNClJ5ZGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
