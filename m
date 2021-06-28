Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AA6C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 07:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE94619C4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 07:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE94619C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kf7NMFGWmz3UCFCZ/WOQANDaQAsNX6dNJ+jBDp7jcPw=; b=zH0b+83WAnzXSk
	fKirPLNq5ieskwmV1QfJ3AJ2QXwrkyVT+ON5Zek/eCAO2981tIgkOERhDIx31z+E6hzb5RF9WbxwO
	Sr3nPuNXt4DH3B2oYct0ZhHebrbaUjYem7aNXDbbZftTwMVheiKnT5Z4E1Ox/jnw/6mVOYHlBNAyD
	+IvP0EfYsd+xv7vvnRq5uPihgfKBpUEBAC6bhfIk9oQMCLCee5zkN0QZxJvRMWhf7QibYUzn+N9wM
	K1syIiR95EEzguHzSbJQgN6wEZk/bDTxCJdP+fpBcBr5kBkQsLXLIRO/Mqk38lJxEj9Tr/ccpCadk
	ClcHPKRjBD1gJyOTxSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxlvv-007Iso-S1; Mon, 28 Jun 2021 07:43:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxlvq-007IqD-Mo; Mon, 28 Jun 2021 07:43:54 +0000
X-UUID: 84cc70e846da47b083f3c71903158542-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/2rSXPzkUJNWGmSaaW93f04gCmOnZo1rHAt40OmpKTg=; 
 b=EtqOMSbzcv23Z/2Z6eGVb9848MtZRpfh6uqHaphkd3mNgvqPJ5NsneoCn9xZShYmCA4BaEUc0bP2XWFqzDdJwHQGY4s23RQcaSNDC5ftNGDWxZFSOrWfDbdeqGqkuO/q8meqF4ooIYHXb8cbJjZdGeSJrRZglVn1h7SyZbJmFPQ=;
X-UUID: 84cc70e846da47b083f3c71903158542-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2122769729; Mon, 28 Jun 2021 00:43:47 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 00:33:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 15:33:43 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Jun 2021 15:33:42 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 4/4] drivers: net: mediatek: initial implementation of
 ccmni
Date: Mon, 28 Jun 2021 15:18:30 +0800
Message-ID: <20210628071829.14925-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNS4GzYHpxMWIH+1@kroah.com>
References: <YNS4GzYHpxMWIH+1@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_004352_940131_24F0BF32 
X-CRM114-Status: GOOD (  26.57  )
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

T24gVGh1LCAyMDIxLTA2LTI0IGF0IDE4OjUxICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KT24gVGh1
LCBKdW4gMjQsIDIwMjEgYXQgMTE6NTU6MDJQTSArMDgwMCwgUm9jY28gWXVlIHdyb3RlOg0KPj4g
T24gVGh1LCAyMDIxLTA2LTI0IGF0IDE0OjIzICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPj4gT24g
VGh1LCBKdW4gMjQsIDIwMjEgYXQgMDc6NTM6NDlQTSArMDgwMCwgUm9jY28gWXVlIHdyb3RlOg0K
Pj4+IA0KPj4+IG5vdCBoYXZlIGV4cG9ydHMgdGhhdCBubyBvbmUgdXNlcy4gIFBsZWFzZSBhZGQg
dGhlIGRyaXZlciB0byB0aGlzIHBhdGNoDQo+Pj4gc2VyaWVzIHdoZW4geW91IHJlc2VuZCBpdC4N
Cj4+PiANCj4+IA0KPj4gSSd2ZSBqdXN0IHRvb2sgYSBsb29rIGF0IHdoYXQgdGhlIExpbnV4IHN0
YWdpbmcgdHJlZSBpcy4gSXQgbG9va3MgbGlrZQ0KPj4gYSBnb29kIGNob2ljZSBmb3IgdGhlIGN1
cnJlbnQgY2NtbmkgZHJpdmVyLg0KPj4gDQo+PiBob25zdGx5LCBJZiBJIHNpbXBseSB1cGxvYWQg
dGhlIHJlbGV2YW50IGRyaXZlciBjb2RlIEIgdGhhdCBjYWxscw0KPj4gQSAoZS5nLiBjY21uaV9y
eF9wdXNoKSwgdGhlcmUgaXMgc3RpbGwgYSBsYWNrIG9mIGNvZGUgdG8gY2FsbCBCLg0KPj4gVGhp
cyBzZWVtcyB0byBiZSBhIGNvbnRpbnV0eSBwcm9ibGVtLCB1bmxlc3MgYWxsIGRyaXZlcnMgY29k
ZXMgYXJlDQo+PiB1cGxvYWRlZCAoZS5nLiBwb3dlciBvbiBtb2RlbSwgZ2V0IGhhcmR3YXJlIHN0
YXR1cywgY29tcGxldGUgdHgvcnggZmxvdykuDQo+IA0KPiBHcmVhdCwgc2VuZCBpdCBhbGwhICBX
aHkgaXMgaXQgZGlmZmVyZW50IG1vZHVsZXMsIGl0J3Mgb25seSBmb3Igb25lDQo+IGNodW5rIG9m
IGhhcmR3YXJlLCBubyBuZWVkIHRvIHNwbGl0IGl0IHVwIGludG8gdGlueSBwaWVjZXMuICBUaGF0
IHdheQ0KPiBvbmx5IGNhdXNlcyBpdCB0byBiZSBtb3JlIGNvZGUgb3ZlcmFsbC4NCj4gDQo+PiAN
Cj4+IFRoYW5rc34NCj4+IA0KPj4gQ2FuIEkgcmVzZW5kIHBhdGNoIHNldCBhcyBmb2xsb3dzOg0K
Pj4gKDEpIHN1cHBsZW1lbnQgdGhlIGRldGFpbHMgb2YgcHVyZWlwIGZvciBwYXRjaCAxLzQ7DQo+
PiAoMikgdGhlIGRvY3VtZW50IG9mIGNjbW5pLnJzdCBzdGlsbCBsaXZlIGluIHRoZSBEb2N1bWVu
dGF0aW9uLy4uLg0KPj4gKDMpIG1vZGlmeSBjY21uaSBhbmQgbW92ZSBpdCBpbnRvIHRoZSBkcml2
ZXJzL3N0YWdpbmcvLi4uDQo+IA0KPiBmb3IgZHJpdmVycy9zdGFnaW5nLyB0aGUgY29kZSBuZWVk
cyB0byBiZSAic2VsZiBjb250YWluZWQiIGluIHRoYXQgaXQNCj4gZG9lcyBub3QgcmVxdWlyZSBh
ZGRpbmcgYW55dGhpbmcgb3V0c2lkZSBvZiB0aGUgZGlyZWN0b3J5IGZvciBpdC4NCj4gDQo+IElm
IHlvdSBzdGlsbCByZXF1aXJlIHRoaXMgY29yZSBuZXR3b3JraW5nIGNoYW5nZSwgdGhhdCBuZWVk
cyB0byBiZQ0KPiBhY2NlcHRlZCBmaXJzdCBieSB0aGUgbmV0d29ya2luZyBkZXZlbG9wZXJzIGFu
ZCBtYWludGFpbmVycy4NCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo+IA0KDQpIaSBH
cmVnLA0KDQpJIGFtIGdyYXRlZnVsIGZvciB5b3VyIGhlbHAuDQoNCkJvdGggY2NtbmkgY2hhbmdl
IGFuZCBuZXR3b3JraW5nIGNoYW5nZXMgYXJlIG5lZWRlZCwgYmVjYXVzZSBhcyBmYXINCmFzIEkg
a25vdywgdXN1YWxseSBhIGRldmljZSB0eXBlIHNob3VsZCBoYXZlIGF0IGxlYXN0IG9uZSBkZXZp
Y2UgdG8NCnVzZSBpdCwgYW5kIHB1cmVpcCBpcyB3aGF0IHRoZSBjY21uaSBkcml2ZXIgbmVlZHMs
IHNvIEkgdXBsb2FkZWQgdGhlDQpuZXR3b3JraW5nIGNoYW5nZSBhbmQgY2NtbmkgZHJpdmVyIHRv
Z2V0aGVyOw0KDQpTaW5jZSBNVEvigJlzIG1vZGVtIGRyaXZlciBoYXMgYSBsYXJnZSBhbW91bnQg
b2YgY29kZSBhbmQgc3Ryb25nIGNvZGUNCmNvdXBsaW5nLCBpdCB0YWtlcyBzb21lIHRpbWUgdG8g
Y2xlYW4gdXAgdGhlbS4gQXQgdGhpcyBzdGFnZSwgaXQgbWF5DQpiZSBkaWZmaWN1bHQgdG8gdXBz
dHJlYW0gYWxsIHRoZSBjb2RlcyB0b2dldGhlci4NCg0KRHVyaW5nIHRoaXMgcGVyaW9kLCBldmVu
IGlmIGNjbW5pIGlzIGluY29tcGxldGUsIGNhbiBJIHB1dCB0aGUgY2NtbmkNCmRyaXZlciBpbml0
aWFsIGNvZGUgaW4gdGhlIGRyaXZlci9zdGFnaW5nIGZpcnN0ID8gQWZ0ZXIgdGhhdCwgd2Ugd2ls
bA0KZ3JhZHVhbGx5IGltcGxlbWVudCBtb3JlIGZ1bmN0aW9ucyBvZiBjY21uaSBpbiB0aGUgc3Rh
Z2luZyB0cmVlLCBhbmQNCndlIGNhbiBhbHNvIGdyYWR1YWxseSBzb3J0IG91dCBhbmQgY2xlYW4g
dXAgbW9kZW0gZHJpdmVyIGluIHRoZSBzdGFnaW5nLg0KDQpJbiBhZGRpdGlvbiwgZHVlIHRvIHRo
ZSByZXF1aXJlbWVudHMgb2YgR0tJIDIuMCwgaWYgY2NtbmkgZGV2aWNlDQp1c2VzIFJBV0lQIG9y
IE5PTkUsIGl0IHdpbGwgaGl0IGlwdjYgaXNzdWU7IGFuZCBpZiBjY21uaSB1c2VzDQphIGRldmlj
ZSB0eXBlIG90aGVyIHRoYW4gUFVSRUlQL1JBV0lQL05PTkUsIHRoZXJlIHdpbGwgYmUgdGV0aGVy
aW5nDQplYnBmIG9mZmxvYWQgb3IgY2xhdCBlYnBmIG9mZmxvYWQgY2FuIG5vdCB3b3JrIHByb2Js
ZW1zLg0KDQpJIGhvcGUgUFVSRUlQIGFuZCBjY21uaSBjYW4gYmUgYWNjZXB0ZWQgYnkgdGhlIExp
bnV4IGNvbW11bml0eS4NCg0KVGhhbmtzLA0KUm9jY28NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
