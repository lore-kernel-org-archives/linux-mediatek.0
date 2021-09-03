Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E836CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 14:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA58F61058
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 14:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA58F61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0bUSTBPVONslw47ikYpGKG4w8ktsbhdGP2Tr4avmIIY=; b=qSqaiBDa0beGcIoIGZuYaxXyeA
	Ckkyd15QzgPBNfXGxeJwNfLaOVb+Az0FEvm6KMMHHuZ6LCHNAhovLjFGAKOh6TpD9DkS01AXo9GKP
	vbNNSxQCpDnO5nL5uP/WHHUoDbwa+iZxke6MU2cqAXE/EdvnqakB4R6pHutYEPMhzkGZkyQQUdhve
	Uiikk9HHIaynnzQdpsCnLk3SIld+R2Mrow0rzHsGxu1UgsRXP6qDn0WgVctbkvRvxczUKAmgDd//n
	rAB+G41OSxsqKm91JnnZvvbV30NbBLw8ry1ZpajzqgKRci/htuvn5pATLUf0bSWmXCdDwXOg1Acko
	pDzyOdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM9uB-00C8tZ-FU; Fri, 03 Sep 2021 14:10:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM9tr-00C8mk-Iq; Fri, 03 Sep 2021 14:10:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 70D2F1F44ED9
Subject: Re: [PATCH v3 6/7] soc: mediatek: mmsys: Add reset controller support
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "Nancy.Lin" <nancy.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Eizan Miyamoto <eizan@chromium.org>, Nicolas Boichat
 <drinkcat@chromium.org>, Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
 <ebbe37cb0188a7ea23608569ab083e65e0f95df6.camel@pengutronix.de>
 <CAAOTY__wg+dWi-4v4evyuWp1EVfj2bap3xtsHZdGET4Jf-MgEw@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <fbca20f5-9e16-c302-0111-1d57f2a496b9@collabora.com>
Date: Fri, 3 Sep 2021 16:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__wg+dWi-4v4evyuWp1EVfj2bap3xtsHZdGET4Jf-MgEw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_071035_798766_93239789 
X-CRM114-Status: GOOD (  12.81  )
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

SGkgTmFuY3ksCgooYWdhaW4gaW4gcGxhaW4gdGV4dCwgc29ycnkgZm9yIHRoZSBub2lzZSkKCk9u
IDI2LzgvMjEgMjozMywgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyMeW5tDjmnIgyNeaXpSDpgLHkuIkg5LiL5Y2INjo0
NuWvq+mBk++8mgo+Pgo+PiBPbiBXZWQsIDIwMjEtMDgtMjUgYXQgMTI6MjYgKzAyMDAsIEVucmlj
IEJhbGxldGJvIGkgU2VycmEgd3JvdGU6Cj4+PiBBbW9uZyBvdGhlciBmZWF0dXJlcyB0aGUgbW1z
eXMgZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQgYSByZXNldAo+Pj4gY29udHJvbGxlciB0byBiZSBh
YmxlIHRvIHJlc2V0IGRpZmZlcmVudCBiaXRzIGZyb20gdGhlaXIgc3BhY2UuCj4+Pgo+Pj4gQ2M6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPj4+IFN1Z2dlc3RlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBF
bnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+Pj4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4+PiAt
LS0KPj4+Cj4+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPj4+Cj4+PiAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmMgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgIDIgKwo+Pgo+PiBDYzogTmFu
Y3kgLSB0aGlzIHBhdGNoIGNsYXNoZXMgd2l0aCBbMV0sIHBsZWFzZSBjb29yZGluYXRlLgo+Pgo+
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIxMDgyNTEw
MDUzMS41NjUzLTExLW5hbmN5LmxpbkBtZWRpYXRlay5jb20vCj4gCj4gRW5yaWMncyBzZXJpZXMg
aXMgYWxsIHJldmlld2VkIG9yIGFja2VkLCBzbyBJIHRoaW5rIE5hbmN5J3Mgc2VyaWVzCj4gc2hv
dWxkIGJhc2Ugb24gRW5yaWMncyBzZXJpZXMuCj4gCgpJcyBpdCBmaW5lIHdpdGggeW91IHRvIGJh
c2UgeW91IHBhdGNoZXMgb24gdG9wIG9mIHRoaXMgcGF0Y2hzZXQ/CgpUaGFua3MsCiAgRW5yaWMK
Cgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPj4KPj4gcmVnYXJkcwo+PiBQaGlsaXBwCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
