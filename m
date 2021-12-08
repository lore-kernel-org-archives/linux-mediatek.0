Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fD3cw9Zz26x8ZFMTZ+UEJKwHpUdcAgz2VQwXbTCLSMM=; b=QZkrYmZaEOimpR
	c4iKjhRxalJnbT1IX6gkqS3+BsKCG6sXH0ThGPnKfRHFvtdjgXmF1myb58YiEzXPoxhExlaB1mAMp
	0UcgqKCFdcaPShq8beFV80qx3ahq0oZUtZdVVsYxiOX99b00p4eXZX1hm4Tim1JIGyzEnw0T3ab0y
	BR1uoM68ERLSd10P859FlriUUsgedneZWkiC+8Tex1H8QNp+WrXYlqKBH4FmzdhJbP0CnqizUBOPI
	WsuF4W1IhzfbYsAKDf8Z2mF2XM0Kun88+lRka48X3JYuqRzU0NPk90HBZn+EXOftEfUCD9msuSh5u
	noHF6HhABwgYMPyHzVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muq83-00BQyO-Q4; Wed, 08 Dec 2021 06:08:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muq7q-00BQxJ-Gr; Wed, 08 Dec 2021 06:08:24 +0000
X-UUID: 33432402aad74794bca5a37890a20cba-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pqCwYChv0yytYF0qiL8fGakAkzz8u4OgIEccfX5OsP0=; 
 b=Nq09Mv5Uzce0mIaPy1fgapA8rLr6Rx3NvhmdWb6XHsD9LHcpqXEnfaeLQFrklF9Kshg/dn7rXWs12SL6EGUS9FryVN3Lxhqaa9hTdLCAMMhTlc8x23cwpyZDRLgyPEtlHwWbU6LZTKhvtgi6avSTMAd5oE1tEXp9I5BngCt890s=;
X-UUID: 33432402aad74794bca5a37890a20cba-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 105236405; Tue, 07 Dec 2021 23:08:21 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 22:08:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Dec 2021 14:08:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 14:08:01 +0800
Message-ID: <e891bf625b00078c476cc53c4b8770dfce71ddb0.camel@mediatek.com>
Subject: Re: [RESEND PATCH v2] PCI: mediatek: Delay 100ms to wait power and
 clock to become stable
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <kw@linux.com>, <bhelgaas@google.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chuanjia.liu@mediatek.com>, <pali@kernel.org>, <maz@kernel.org>,
 <alyssa@rosenzweig.io>, <luca@lucaceresoli.net>
Date: Wed, 8 Dec 2021 14:07:57 +0800
In-Reply-To: <20211208041228.GA103736@bhelgaas>
References: <20211208041228.GA103736@bhelgaas>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_220822_601042_317DE46D 
X-CRM114-Status: GOOD (  37.37  )
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

T24gVHVlLCAyMDIxLTEyLTA3IGF0IDIyOjEyIC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBPbiBUdWUsIERlYyAwNywgMjAyMSBhdCAxMDowMDo0M1BNICswMTAwLCBNYXJrIEtldHRlbmlz
IHdyb3RlOg0KPiA+ID4gRGF0ZTogVHVlLCA3IERlYyAyMDIxIDExOjU0OjE2IC0wNjAwDQo+ID4g
PiBGcm9tOiBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5vcmc+DQo+ID4gPiANCj4gPiA+
IFsrY2MgTWFyYywgQWx5c3NhLCBNYXJrLCBMdWNhIGZvciByZXNldCB0aW1pbmcgcXVlc3Rpb25z
XQ0KPiA+IA0KPiA+IEhpIEJqb3JuLA0KPiA+IA0KPiA+ID4gT24gVHVlLCBEZWMgMDcsIDIwMjEg
YXQgMDQ6NDE6NTNQTSArMDgwMCwgcWl6aG9uZyBjaGVuZyB3cm90ZToNCj4gPiA+ID4gRGVzY3Jp
YmVkIGluIFBDSWUgQ0VNIHNwZWNpZmljYXRpb24gc2VjdGlvbnMgMi4yIChQRVJTVCMNCj4gPiA+
ID4gU2lnbmFsKSBhbmQNCj4gPiA+ID4gMi4yLjEgKEluaXRpYWwgUG93ZXItVXAgKEczIHRvIFMw
KSkuIFRoZSBkZWFzc2VydGlvbiBvZiBQRVJTVCMNCj4gPiA+ID4gc2hvdWxkDQo+ID4gPiA+IGJl
IGRlbGF5ZWQgMTAwbXMgKFRQVlBFUkwpIGZvciB0aGUgcG93ZXIgYW5kIGNsb2NrIHRvIGJlY29t
ZQ0KPiA+ID4gPiBzdGFibGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBxaXpo
b25nIGNoZW5nIDxxaXpob25nLmNoZW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gQWNrZWQtYnk6
IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+ID4gPiAuLi4NCg0KMSkNCjIpDQpUaGFu
a3MgZm9yIHlvdXIgcmVtaW5kaW5nIGFuZCBzdWdnZXN0aW9uLg0KDQo+ID4gPiAzKSBNb3N0IGlt
cG9ydGFudGx5LCB0aGlzIG5lZWRzIHRvIGJlIHJlY29uY2lsZWQgd2l0aCB0aGUgc2ltaWxhcg0K
PiA+ID4gY2hhbmdlIHRvIHRoZSBhcHBsZSBkcml2ZXI6DQo+ID4gPiANCj4gPiA+ICAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTEyMzE4MDYzNi44MDU1OC0yLW1hekBrZXJuZWwub3Jn
DQo+ID4gPiANCj4gPiA+IEluIHRoZSBhcHBsZSBkcml2ZXIsIHdlJ3JlIGRvaW5nOg0KPiA+ID4g
DQo+ID4gPiAgIC0gQXNzZXJ0IFBFUlNUIw0KPiA+ID4gICAtIFNldCB1cCBSRUZDTEsNCj4gPiA+
ICAgLSBTbGVlcCAxMDB1cyAoVF9wZXJzdC1jbGssIENFTSByNSAyLjIsIDIuOS4yKQ0KPiA+ID4g
ICAtIERlYXNzZXJ0IFBFUlNUIw0KPiA+ID4gICAtIFNsZWVwIDEwMG1zIChub3Qgc3VyZSB0aGVy
ZSdzIGEgbmFtZT8gUENJZSByNSA2LjYuMSkNCj4gPiA+IA0KPiA+ID4gQnV0IGhlcmUgaW4gbWVk
aWF0ZWssIHdlJ3JlIGRvaW5nOg0KPiA+ID4gDQo+ID4gPiAgIC0gQXNzZXJ0IFBFUlNUIw0KPiA+
ID4gICAtIFNsZWVwIDEwMG1zIChUX3B2cGVybCwgQ0VNIHI1IDIuMiwgMi4yLjEsIDIuOS4yKQ0K
PiA+ID4gICAtIERlYXNzZXJ0IFBFUlNUIw0KPiA+ID4gDQo+ID4gPiBNeSBxdWVzdGlvbnM6DQo+
ID4gDQo+ID4gTXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgdGhlIEFwcGxlIFBDSWUgaGFyZHdhcmUg
aXMgc29tZXdoYXQgbGltaXRlZA0KPiA+IGJ1dDoNCj4gPiANCj4gPiA+ICAgLSBXaGVyZSBkb2Vz
IGFwcGxlIGVuZm9yY2UgVF9wdnBlcmw/ICBJIGNhbid0IHRlbGwgd2hlcmUgcG93ZXINCj4gPiA+
IHRvDQo+ID4gPiAgICAgdGhlIHNsb3QgaXMgdHVybmVkIG9uLg0KPiA+IA0KPiA+IFNvIGZhciBh
bGwgYXZhaWxhYmxlIG1hY2hpbmVzIG9ubHkgaGF2ZSBQQ0llIGRldmljZXMgdGhhdCBhcmUNCj4g
PiBzb2xkZXJlZA0KPiA+IG9udG8gdGhlIG1vdGhlcmJvYXJkLCBzbyB0aGVyZSBhcmUgbm8gInJl
YWwiIHNsb3RzLiAgQXMgZmFyIGFzIHdlDQo+ID4gY2FuDQo+ID4gdGVsbCB0aGUgUENJZSBwb3dl
ciBkb21haW4gaXMgYWxyZWFkeSBwb3dlcmVkIG9uIGF0IHRoZSBwb2ludCB3aGVyZQ0KPiA+IHRo
ZSBtMW4xIGJvb3Rsb2FkZXIgdGFrZXMgY29udHJvbC4gIFRoZXJlIGlzIGEgR1BJTyB0aGF0IGNv
bnRyb2xzDQo+ID4gcG93ZXIgdG8gc29tZSBkZXZpY2VzIChXaUZpLCBTREhDIG9uIHRoZSBNMSBQ
cm8vTWF4IGxhcHRvcHMpIGFuZA0KPiA+IHRob3NlDQo+ID4gZGV2aWNlcyBhcmUgaW5pdGlhbGx5
IHBvd2VyZWQgb2ZmLiAgVGhlIExpbnV4IGRyaXZlciBkb2Vzbid0DQo+ID4gY3VycmVudGx5DQo+
ID4gYXR0ZW1wdCB0byBwb3dlciB0aGVzZSBkZXZpY2VzIG9uLCBidXQgVS1Cb290IHdpbGwgcG93
ZXIgdGhlbSBvbiBpZg0KPiA+IHRoZSBhcHByb3ByaWF0ZSBHUElPIGlzIGRlZmluZWQgaW4gdGhl
IGRldmljZSB0cmVlLiAgVGhlIHdheSB0aGlzDQo+ID4gaXMNCj4gPiBzcGVjaWZpZWQgaW4gdGhl
IGRldmljZSB0cmVlIGlzIHN0aWxsIHVuZGVyIGRpc2N1c3Npb24uDQo+IA0KPiBEb2VzIHRoaXMg
bWVhbiB3ZSBiYXNpY2FsbHkgYXNzdW1lIHRoYXQgbTFuMSBhbmQgZWFybHkgTGludXggYm9vdA0K
PiB0YWtlcyBhdCBsZWFzdCB0aGUgMTAwbXMgVF9wdnBlcmwgcmVxdWlyZWQgYnkgQ0VNIHNlYyAy
LjIsIGJ1dCB3ZQ0KPiB0YWtlDQo+IHBhaW5zIHRvIGRlbGF5IHRoZSAxMDB1cyBUX3BlcnN0LWNs
az8gIFRoYXQgc2VlbXMgYSBsaXR0bGUgd2VpcmQsIGJ1dA0KPiBJIGd1ZXNzIGl0IGlzIGNsZWFy
IHRoYXQgUkVGQ0xLIGlzICpub3QqIGVuYWJsZWQgYmVmb3JlIHdlIGVuYWJsZSBpdCwNCj4gc28g
d2UgZG8gbmVlZCBhdCBsZWFzdCB0aGUgMTAwdXMgdGhlcmUuDQo+IA0KPiBJdCBhbHNvIG5pZ2ds
ZXMgYXQgbWUgYSBsaXR0bGUgdGhhdCB0aGUgc3BlYyBzYXlzIFRfcHZwZXJsIHN0YXJ0cw0KPiBm
cm9tDQo+ICpwb3dlciBzdGFibGUqIChub3QgZnJvbSBwb3dlciBlbmFibGUpIGFuZCBUX3BlcnN0
LWNsayBzdGFydHMgZnJvbQ0KPiAqUkVGQ0xLIHN0YWJsZSogKG5vdCBSRUZDTEsgZW5hYmxlKS4g
IFNpbmNlIHdlIGRvbid0IGtub3cgdGhlIHRpbWUNCj4gZnJvbSBlbmFibGUgdG8gc3RhYmxlLCBp
dCBzZWVtcyBsaWtlIG5hdGl2ZSBkcml2ZXJzIHNob3VsZCBhZGQgc29tZQ0KPiBjaXJjdWl0LXNw
ZWNpZmljIGNvbnN0YW50cyB0byB0aGUgc3BlYyB2YWx1ZXMuDQo+IA0KDQpSZXNldCBvZiBlbmRw
b2ludCBjYXJkIHZpYSBQRVJTVCMgc2lnbmFsIGlzIGRlZmluZWQgaW4gUENJZSBDRU0gcjUgMi4y
Og0KIk9uIHBvd2VyLXVwLCB0aGUgZGUtYXNzZXJ0aW9uIG9mIFBFUlNUIyBpcyBkZWxheWVkIDEw
MCBtcyAoVFBWUEVSTCkNCmZyb20gdGhlIHBvd2VyIHJhaWxzIGFjaGlldmluZyBzcGVjaWZpZWQg
b3BlcmF0aW5nIGxpbWl0cy4gQWxzbywgd2l0aGluDQp0aGlzIHRpbWUsIHRoZSByZWZlcmVuY2Ug
Y2xvY2tzIChSRUZDTEsrLCBSRUZDTEstKSBhbHNvIGJlY29tZSBzdGFibGUsDQphdCBsZWFzdCBU
UEVSU1QtQ0xLIGJlZm9yZSBQRVJTVCMgaXMgZGUtYXNzZXJ0ZWQuIg0KDQotIFRwdnBlcmwgLSBQ
RVJTVCMgbXVzdCByZW1haW4gYWN0aXZlIGF0IGxlYXN0IHRoaXMgbG9uZyBhZnRlciBwb3dlcg0K
YmVjb21lcyB2YWxpZA0KDQpJbml0aWFsaXplIHN0ZXBzIGFzIGZvbGxvd2luZyhwbGVhc2UgY29y
cmVjdCBtZSBpZiBJJ20gd3JvbmcpOg0KIDEpIEVuYWJsZSBtYWluIHBvd2VyDQogMikgQXNzZXJ0
IFBFUlNUIw0KIDMpIFNsZWVwIDEwMG1zIChUUFZQRVJMLCB3aXRoaW4gdGhpcyB0aW1lLCB0aGUg
UkVGQ0xLIGFuZCBwb3dlciBhbHNvDQpiZWNvbWUgc3RhYmxlKShDRU0gcjUgZmlndXJlIDg6IHBv
d2VyIHVwKQ0KIDQpIERlYXNzZXJ0IFBFUlNUIw0KIDUpIHdhaXQgdW50aWwgbGluayB0cmFpbmlu
ZyBjb21wbGV0ZXMgYnkgc29mdHdhcmUgcG9sbGluZyB0aGUgRGF0YQ0KTGluayBMYXllciBMaW5r
IEFjdGl2ZSBiaXQNCiA2KSBpZiBzcGVlZCBpcyBncmVhdGVyIHRoYW4gNUdUL3MsIHdhaXQgYW5v
dGhlciAxMDBtcw0KDQo+ID4gPiAgIC0gV2hlcmUgZG9lcyBtZWRpYXRlayBlbmZvcmNlIHRoZSBQ
Q0llIHNlYyA2LjYuMSBkZWxheSBhZnRlcg0KPiA+ID4gICAgIGRlYXNzZXJ0aW5nIFBFUlNUIyBh
bmQgYmVmb3JlIGNvbmZpZyByZXF1ZXN0cz8NCj4gPiA+IA0KU29mdHdhcmUgY2FuIGRldGVybWlu
ZSB3aGVuIExpbmsgdHJhaW5pbmcgY29tcGxldGVzIGJ5IHBvbGxpbmcgdGhlIERhdGENCkxpbmsg
TGF5ZXIgTGluayBBY3RpdmUgYml0IGZvciBtYXhpbXVtIDEwMG1zLg0KDQo+ID4gPiAgIC0gRG9l
cyBlaXRoZXIgYXBwbGUgb3IgbWVkaWF0ZWsgc3VwcG9ydCBzcGVlZHMgZ3JlYXRlciB0aGFuIDUN
Cj4gPiA+IEdUL3MsDQo+ID4gPiAgICAgYW5kIGlmIHNvLCBzaG91bGRuJ3Qgd2Ugc3RhcnQgdGhl
IHNlYyA2LjYuMSAxMDBtcyBkZWxheQ0KPiA+ID4gKmFmdGVyKg0KPiA+ID4gICAgIExpbmsgdHJh
aW5pbmcgY29tcGxldGVzPw0KPiA+IA0KPiA+IFRoZSBBcHBsZSBoYXJkd2FyZSBhZHZlcnRpc2Vz
IHN1cHBvcnQgZm9yIDggR1QvcywgYnV0IGFsbCB0aGUNCj4gPiBkZXZpY2VzDQo+ID4gaW50ZWdy
YXRlZCBvbiB0aGUgTWFjIG1pbmkgc3VwcG9ydCBvbmx5IDIuNSBHVC9zIG9yIDUgR1Qvcy4NCj4g
DQo+IFRoZSBzcGVjIGRvZXNuJ3Qgc2F5IGFueXRoaW5nIGFib3V0IHdoYXQgdGhlIGRvd25zdHJl
YW0gZGV2aWNlcw0KPiBzdXBwb3J0IChvYnZpb3VzbHkgaXQgY2FuJ3QgYmVjYXVzZSB3ZSBkb24n
dCAqa25vdyogd2hhdCB0aG9zZQ0KPiBkZXZpY2VzDQo+IGFyZSB1bnRpbCBhZnRlciB3ZSBlbnVt
ZXJhdGUgdGhlbSkuICBTbyB0byBiZSBwZWRhbnRpY2FsbHkgY29ycmVjdCwNCj4gSSdkIGFyZ3Vl
IHRoYXQgd2Ugc2hvdWxkIHBheSBhdHRlbnRpb24gdG8gd2hhdCB0aGUgUm9vdCBQb3J0DQo+IGFk
dmVydGlzZXMuICBPZiBjb3Vyc2UsIEkgZG9uJ3QgdGhpbmsgd2UgZG8gdGhpcyBjb3JyZWN0bHkg
KmFueXdoZXJlKg0KPiB0b2RheS4NCg0KVGhhbmtzDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
