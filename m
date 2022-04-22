Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7230C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHSoTjc0kspQhYVUz+K2YeRlTkRIYiCEGHuHy+R3vf4=; b=KvnA5yXXmq9mcQ
	YEV2k+lfLViaCXD5b9gHTKitTHxgmmLaeDh5g+EAkkHTN9L0tXqGGQObSPbBhFx/yxJ5IYSAwOT8X
	3i/OGVHm7jzPATsjPYzGN+H05VpuMyHdMPBGNjGuSyfV8uxEOXMY0M/PDq3ywqkbtdXGcoc4N/fNa
	ikiWjwes0pCRwgN1V8pdNfkwad0dodPeOQEa23JYai79WICRWEuORKf5MZsWFA7S2MLmU4Q4PsbIL
	0AOoZ42Phm7dcfcyataBLUBa+Dl9dFp88xCC8FpD33Z5PA7+SDKtVgcyajyGZ9yXDwnIdL9QItqkl
	eGroAZV/w8m35+eslPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhh3D-00FT6x-Im; Fri, 22 Apr 2022 00:21:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhh32-00FT50-2u; Fri, 22 Apr 2022 00:21:21 +0000
X-UUID: 88d22c6e23ff409f8143d2f7dbd53729-20220421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yJHbLAnHYIA8W55pB/f6zfspbi13PkCskBWXHu5Iv3k=; 
 b=BiL+vw4dPgTtZCOD3XGe0UlYRWUeJL+h+LhgCpcCMLmw+HYom7zQVwENAcy0iT5sAaLVeE+QyTepFJOH/bQO5tF7X6zUqcSXT1Qv0Evu6EPhfRKW53v++pKtIMF+VozROoEMEsbukjLF3GgdfXWHFvDxliL1VxcRZv07LhYThhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:062963c9-32d2-46f1-84e6-883835b9ad92, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:ef22b1ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 88d22c6e23ff409f8143d2f7dbd53729-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 261625622; Thu, 21 Apr 2022 17:21:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 17:21:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 08:21:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 08:21:10 +0800
Message-ID: <c8d6f77aac432e8df33372a95c6242fcdbb35090.camel@mediatek.com>
Subject: Re: [PATCH v2] i2c: mediatek: Optimize master_xfer() and avoid
 circular locking
From: Qii Wang <qii.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <wsa@kernel.org>, <nfraprado@collabora.com>,
 <kernel@collabora.com>
Date: Fri, 22 Apr 2022 08:21:09 +0800
In-Reply-To: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
References: <20220411132107.136369-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_172120_335229_558ED77F 
X-CRM114-Status: GOOD (  18.99  )
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

T24gTW9uLCAyMDIyLTA0LTExIGF0IDE1OjIxICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXNwZWNpYWxseSAoYnV0IG5vdCBvbmx5KSBkdXJpbmcgcHJvYmUsIGl0
IG1heSBoYXBwZW4gdGhhdCBtdWx0aXBsZQ0KPiBkZXZpY2VzIGFyZSBjb21tdW5pY2F0aW5nIHZp
YSBpMmMgKG9yIG11bHRpcGxlIGkyYyBidXNzZXMpIGFuZA0KPiBzb21ldGltZXMgd2hpbGUgb3Ro
ZXJzIGFyZSBwcm9iaW5nIGFzeW5jaHJvbm91c2x5Lg0KPiBGb3IgZXhhbXBsZSwgYSBDcjUwIFRQ
TSBtYXkgYmUgZmlsbGluZyBlbnRyb3B5IChvciB1c2Vyc3BhY2UgbWF5IGJlDQo+IHJlYWRpbmcg
cmFuZG9tIGRhdGEpIHdoaWxlIHRoZSBydDU2ODIgKGkyYykgY29kZWMgZHJpdmVyIHJlYWRzL3Nl
dHMNCj4gc29tZSByZWdpc3RlcnMsIGxpa2Ugd2hpbGUgZ2V0dGluZy9zZXR0aW5nIGEgY2xvY2sn
cyByYXRlLCB3aGljaA0KPiBoYXBwZW5zIGJvdGggZHVyaW5nIHByb2JlIGFuZCBkdXJpbmcgc3lz
dGVtIG9wZXJhdGlvbi4NCj4gDQo+IEluIHRoaXMgZHJpdmVyLCB0aGUgbXRrX2kyY190cmFuc2Zl
cigpIGZ1bmN0aW9uICh3aGljaCBpcyB0aGUgaTJjDQo+IC5tYXN0ZXJfeGZlcigpIGNhbGxiYWNr
KSB3YXMgZ3JhbnVsYXJseSBtYW5hZ2luZyB0aGUgY2xvY2tzIGJ5DQo+IHBlcmZvcm1pbmcgYSBj
bGtfYnVsa19wcmVwYXJlX2VuYWJsZSgpIHRvIHN0YXJ0IHRoZW0gYW5kIGl0cyBpbnZlcnNlLg0K
PiBUaGlzIGlzIG5vdCBvbmx5IGNyZWF0aW5nIHBvc3NpYmxlIGNpcmN1bGFyIGxvY2tpbmcgZGVw
ZW5kZW5jaWVzIGluDQo+IHRoZSBzb21lIGNhc2VzIChsaWtlIGZvcm1lciBleHBsYW5hdGlvbiks
IGJ1dCBpdCdzIGFsc28gc3Vib3B0aW1hbCwNCj4gYXMgY2xrX2NvcmUgcHJlcGFyZS91bnByZXBh
cmUgb3BlcmF0aW9ucyBhcmUgdXNpbmcgbXV0ZXggbG9ja2luZywNCj4gd2hpY2ggY3JlYXRlcyBh
IGJpdCBvZiB1bndhbnRlZCBvdmVyaGVhZCAoZm9yIGV4YW1wbGUsIGkyYyB0cmFja3BhZHMNCj4g
d2lsbCBjYWxsIG1hc3Rlcl94ZmVyKCkgZXZlcnkgZmV3IG1pbGxpc2Vjb25kcyEpLg0KPiANCj4g
V2l0aCB0aGlzIGNvbW1pdCwgd2UgYXZvaWQgYm90aCB0aGUgY2lyY3VsYXIgbG9ja2luZyBhbmQg
YWRkaXRpb25hbA0KPiBvdmVyaGVhZCBieSBjaGFuZ2luZyBob3cgd2UgaGFuZGxlIHRoZSBjbG9j
a3MgaW4gdGhpcyBkcml2ZXI6DQo+IC0gUHJlcGFyZSB0aGUgY2xvY2tzIGR1cmluZyBwcm9iZSAo
YW5kIFBNIHJlc3VtZSkNCj4gLSBFbmFibGUvZGlzYWJsZSBjbG9ja3MgaW4gbXRrX2kyY190cmFu
c2ZlcigpDQo+IC0gVW5wcmVwYXJlIHRoZSBjbG9ja3Mgb25seSBmb3IgZHJpdmVyIHJlbW92YWwg
KGFuZCBQTSBzdXNwZW5kKQ0KPiANCj4gRm9yIHRoZSBzYWtlIG9mIHByb3ZpZGluZyBhIGZ1bGwg
ZXhwbGFuYXRpb246IGR1cmluZyBwcm9iZSwgdGhlDQo+IGNsb2NrcyBhcmUgbm90IG9ubHkgcHJl
cGFyZWQgYnV0IGFsc28gZW5hYmxlZCwgYXMgdGhpcyBpcyBuZWVkZWQNCj4gZm9yIHNvbWUgaGFy
ZHdhcmUgaW5pdGlhbGl6YXRpb24gYnV0LCBhZnRlciB0aGF0LCB3ZSBhcmUgZGlzYWJsaW5nDQo+
IGJ1dCBub3QgdW5wcmVwYXJpbmcgdGhlbSwgbGVhdmluZyBhbiBleHBlY3RlZCBzdGF0ZSBmb3Ig
dGhlDQo+IGFmb3JlbWVudGlvbmVkIGNsb2NrIGhhbmRsaW5nIHN0cmF0ZWd5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KDQpSZXZpZXdlZC1ieTogUWlpIFdh
bmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCg0KPiAtLS0NCj4gDQo+IHYyOiBGaXhlZCB0eXBv
cyBpbiBjb21taXQgZGVzY3JpcHRpb24NCj4gDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10
NjV4eC5jIHwgMTEgKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
