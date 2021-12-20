Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZcXyfEj0RVtNrGWvFtcsx7PIJNrdEgpHjaXb9uZPhI=; b=oBWAadne1lKobi
	kKiAb6FEXBYgInhdm5L+aJyXShX57C/PrVBp5bswFcuRo9In5Rx7x1G52Ut97x780eeISKTK6NIUo
	4bM6mwAD8PQ/x6wTDkSsxdILIUQ0dCdIP0Xq/oJ+MCyURE9/i9q4xJuYj4U0ai2R1GPsN4IL8eSu8
	pg8XyJseK6kSOcqstVauhAcqLzKzWNSJUPOnp2Xl3LTtSDwmZbl41F7cM1GaT3u89MxXG4JVwUKS0
	7GUHxTEsOeq3u6Qf2klmb3UCP/bXqZTxtFPGMFO2P2zwsmwVrg9sm22B1MItYtHKWY6T02hVci7K+
	lJ0h6M8It/oBTHCSIsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzExQ-001OuZ-Ny; Mon, 20 Dec 2021 09:27:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzExE-001Ot6-E5; Mon, 20 Dec 2021 09:27:37 +0000
X-UUID: e004be6f889e4f20bc9f4cbc1c998833-20211220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W609izxjjYfJM7lhnXZvXsCtD5DhM18SQG53T3rh0DM=; 
 b=dgBpw/Gfbuzj769b5MZFGqcmQ+cuYWxDUGsbQLtF9VuGqmfdKy6ZK/0xPi8/dAohCTmK9iWQ6youzWExLWF+yim3+koGxCosavceuWE8H0Nop2fMwnE1nkVcHKZwJFANR2ZDQBtUTlViognE/3R17ptbV5uB2tK2vT9h3B9m3eU=;
X-UUID: e004be6f889e4f20bc9f4cbc1c998833-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 223458654; Mon, 20 Dec 2021 02:27:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 01:27:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 17:27:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Dec 2021 17:27:23 +0800
Message-ID: <6daef24e540661bbd992b255770d9a6511253fc5.camel@mediatek.com>
Subject: Re: [RESEND PATCH v2] PCI: mediatek: Delay 100ms to wait power and
 clock to become stable
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>
CC: Mark Kettenis <mark.kettenis@xs4all.nl>, <ryder.lee@mediatek.com>,
 <jianjun.wang@mediatek.com>, <lorenzo.pieralisi@arm.com>, <kw@linux.com>,
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <chuanjia.liu@mediatek.com>,
 <maz@kernel.org>, <alyssa@rosenzweig.io>, <luca@lucaceresoli.net>
Date: Mon, 20 Dec 2021 17:27:24 +0800
In-Reply-To: <20211209130034.z3d47hc4qzsrc3mt@pali>
References: <20211208041228.GA103736@bhelgaas>
 <e891bf625b00078c476cc53c4b8770dfce71ddb0.camel@mediatek.com>
 <20211208101836.pazwdloibn6d7iri@pali>
 <6e6fd0b50699616e7d943ec1c8bc4e71abd85f6f.camel@mediatek.com>
 <20211209130034.z3d47hc4qzsrc3mt@pali>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_012736_506115_37DF4AFA 
X-CRM114-Status: GOOD (  24.34  )
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

T24gVGh1LCAyMDIxLTEyLTA5IGF0IDE0OjAwICswMTAwLCBQYWxpIFJvaMOhciB3cm90ZToNCj4g
T24gVGh1cnNkYXkgMDkgRGVjZW1iZXIgMjAyMSAxOTo1MTowMyBxaXpob25nLmNoZW5nIHdyb3Rl
Og0KPiA+IE9uIFdlZCwgMjAyMS0xMi0wOCBhdCAxMToxOCArMDEwMCwgUGFsaSBSb2jDoXIgd3Jv
dGU6DQo+ID4gPiBPbiBXZWRuZXNkYXkgMDggRGVjZW1iZXIgMjAyMSAxNDowNzo1NyBxaXpob25n
LmNoZW5nIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDIwMjEtMTItMDcgYXQgMjI6MTIgLTA2MDAs
IEJqb3JuIEhlbGdhYXMgd3JvdGU6DQo+ID4gPiA+ID4gT24gVHVlLCBEZWMgMDcsIDIwMjEgYXQg
MTA6MDA6NDNQTSArMDEwMCwgTWFyayBLZXR0ZW5pDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
IE9uIFR1ZSwgRGVjIDA3LCAyMDIxIGF0IDA0OjQxOjUzUE0gKzA4MDAsIHFpemhvbmcgY2hlbmcN
Cj4gPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gRGVzY3JpYmVkIGluIFBDSWUg
Q0VNIHNwZWNpZmljYXRpb24gc2VjdGlvbnMgMi4yDQo+ID4gPiA+ID4gPiA+ID4gKFBFUlNUIw0K
PiA+ID4gPiA+ID4gPiA+IFNpZ25hbCkgYW5kDQo+ID4gPiA+ID4gPiA+ID4gMi4yLjEgKEluaXRp
YWwgUG93ZXItVXAgKEczIHRvIFMwKSkuIFRoZSBkZWFzc2VydGlvbiBvZg0KPiA+ID4gPiA+ID4g
PiA+IFBFUlNUIw0KPiA+ID4gPiA+ID4gPiA+IHNob3VsZA0KPiA+ID4gPiA+ID4gPiA+IGJlIGRl
bGF5ZWQgMTAwbXMgKFRQVlBFUkwpIGZvciB0aGUgcG93ZXIgYW5kIGNsb2NrIHRvDQo+ID4gPiA+
ID4gPiA+ID4gYmVjb21lDQo+ID4gPiA+ID4gPiA+ID4gc3RhYmxlLg0KPiA+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IHFpemhvbmcgY2hlbmcgPA0KPiA+ID4g
PiA+ID4gPiA+IHFpemhvbmcuY2hlbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gPiA+IEFj
a2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPg0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gLi4uDQo+ID4gPiA+IA0KDQo+ID4gPiBIZWxsbyEgQWJvdXQgbW9udGggYWdv
IEkgd2FzIGludmVzdGlnYXRpbmcgY29ycmVjdCBvcmRlciBvZiBzdGVwcw0KPiA+ID4gYW5kDQo+
ID4gPiBJDQo+ID4gPiB3cm90ZSBlbWFpbCBhYm91dCBpdCwgcGxlYXNlIGxvb2sgYXQgaXQ6DQo+
ID4gPiANCj4gPiANCj4gPiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDIx
MTAyMjE4MzgwOC5qZGVvN3ZudG5hZ3FrZzdnQHBhbGkvDQo+ID4gDQo+ID4gSGkgUGFsaSwNCj4g
PiANCj4gPiBUaGFua3MgZm9yIHlvdXIgaW52ZXN0aWdhdGluZy4NCj4gPiBNb2RpZnkgdGhlIGNv
ZGUgdG8gcmVmZXIgdG8geW91ciBzdGVwcyBhcyBmb2xsb3dpbmcocGxlYXNlIGNvcnJlY3QNCj4g
PiBtZQ0KPiA+IGlmIEknbSB3cm9uZyk6DQo+ID4gMSkgcGNpZV9hc3NlcnRfcmVzZXQoKTsNCj4g
PiAyKSBwY2llX3Bvd2VyX29uKCk7DQo+ID4gMykgcGNpZV9zZXR1cF9yZWZjbGsoKTsNCj4gPiA0
KSBtc2xlZXAoMTAwKTsNCj4gPiA1KSBwY2llX2RlYXNzZXJ0X3Jlc2V0KCk7DQo+ID4gNikgcG9s
bGluZ19saW5rX2FjdGl2ZV9iaXQoKTsNCj4gPiA3KSBtc2xlZXAoMTAwKTsNCj4gDQo+IElmIEkg
dW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkgdGhlbiBhYm92ZSBzdGVwcyBzaG91bGQgYmUgT0suDQo+
IC4uLg0KDQo+ID4gPiANCj4gPiA+ID4gPiA+ID4gICAtIERvZXMgZWl0aGVyIGFwcGxlIG9yIG1l
ZGlhdGVrIHN1cHBvcnQgc3BlZWRzIGdyZWF0ZXINCj4gPiA+ID4gPiA+ID4gdGhhbg0KPiA+ID4g
PiA+ID4gPiA1DQo+ID4gPiA+ID4gPiA+IEdUL3MsDQo+ID4gPiA+ID4gPiA+ICAgICBhbmQgaWYg
c28sIHNob3VsZG4ndCB3ZSBzdGFydCB0aGUgc2VjIDYuNi4xIDEwMG1zDQo+ID4gPiA+ID4gPiA+
IGRlbGF5DQo+ID4gPiA+ID4gPiA+ICphZnRlcioNCj4gPiA+ID4gPiA+ID4gICAgIExpbmsgdHJh
aW5pbmcgY29tcGxldGVzPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGUgQXBwbGUgaGFy
ZHdhcmUgYWR2ZXJ0aXNlcyBzdXBwb3J0IGZvciA4IEdUL3MsIGJ1dCBhbGwNCj4gPiA+ID4gPiA+
IHRoZQ0KPiA+ID4gPiA+ID4gZGV2aWNlcw0KPiA+ID4gPiA+ID4gaW50ZWdyYXRlZCBvbiB0aGUg
TWFjIG1pbmkgc3VwcG9ydCBvbmx5IDIuNSBHVC9zIG9yIDUgR1Qvcy4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiANCg0KSGkgQmpvcm4gYW5kIFBhbGksDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcu
DQoNClRoZSBoYXJkd2FyZSBSQyBkZXZpY2UgY29ycmVzcG9uZGluZyB0byB0aGlzIHZlcnNpb24g
b2YgZHJpdmVyIGlzIG9ubHkNCnN1cHBvcnRzIEdlbjEvR2VuMiwgYW5kIHRoZSBzcGVlZCBpcyBu
b3QgZ3JlYXRlciB0aGFuIDVHVC9zLiBBZGRpbmcNCiJkZWxheSAxMDBtcyIgYWZ0ZXIgbGluayB0
cmFpbmluZyBpcyByZWR1bmRhbnQgZm9yIHRoZSBlbnRpcmUgYm9vdA0KcHJvY2Vzcy4gU28sIHRo
ZSAiZGVsYXkgMTAwbXMiIGFmdGVyIGxpbmsgdHJhaW5pbmcgd2lsbCBub3QgYmUgYWRkZWQuDQoN
CkFsc28sIGJhc2VkIG9uIHRoZSBwcmV2aW91cyBzdWdnZXN0aW9uLCBJIHdpbGwgY2hhbmdlIHRo
ZSBzdWJqZWN0DQpjb250ZW50Lg0KDQpUaGFua3MNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
