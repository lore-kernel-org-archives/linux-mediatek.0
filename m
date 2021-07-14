Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACC5C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:42:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85994613B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85994613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L+jdMC9TkeayoPpi6tHIu1xGlhQ7Nu70CBq4H56qRK0=; b=sv5P9eLR4TJSb9cf6cB1hRGvKc
	ARC11qMddM8c60B4dFh1OIVTjULgkmQFOy3ozCYhDIvUOkmmO5eTHRO7D/P+MouhTy3el+LvJaxE3
	YBbNECCfiAdMiZeWzlh3+OVMe9TOJfXDjiXNomGgFTSnXglnB2sg6r62+lUonUCwWZZR8HriCNkJ4
	eKv59KoonS3zRSLklRzvwfarmCjYeTkkp3N+vosLEbU48ERCKSLb4Ys94MyK995Ma3GtUkYFyb2pr
	beSSRKDgLVKuoSs0N1LZB2oiEbg/LiYcZHAIw9/5+RRmLSWVvhZdOGF5xJSy+qDD4YyLO0zp1nkGr
	iOQyzSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3aSx-00CkN7-4I; Wed, 14 Jul 2021 08:42:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aSW-00CkCQ-5K; Wed, 14 Jul 2021 08:41:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 9327A1F42ABD
Subject: Re: [PATCH 3/6] arm64: dts: mt8173: Add the mmsys reset bit to reset
 the dsi0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210630144646.868702-1-enric.balletbo@collabora.com>
 <20210630164623.3.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
 <CAAOTY_-VAvKCkBj1q4euWFcmbnNUJfXpG9rh9vua80yrok-y9w@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <406a96c6-8547-1908-0f52-fca783d05262@collabora.com>
Date: Wed, 14 Jul 2021 10:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-VAvKCkBj1q4euWFcmbnNUJfXpG9rh9vua80yrok-y9w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_014136_379704_49CFBFA7 
X-CRM114-Status: GOOD (  21.07  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIDEvNy8yMSAwOjQ4
LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhJLCBFbnJpYzoKPiAKPiBFbnJpYyBCYWxsZXRibyBp
IFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiDmlrwgMjAyMeW5tDbmnIgzMOaX
pSDpgLHkuIkg5LiL5Y2IMTA6NDflr6vpgZPvvJoKPj4KPj4gUmVzZXQgdGhlIERTSSBoYXJkd2Fy
ZSBpcyBuZWVkZWQgdG8gcHJldmVudCBkaWZmZXJlbnQgc2V0dGluZ3MgYmV0d2Vlbgo+PiB0aGUg
Ym9vdGxvYWRlciBhbmQgdGhlIGtlcm5lbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+Cj4+
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpICB8IDIgKysKPj4gIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTczLXJlc2V0cy5oIHwgMiArKwo+PiAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE3My5kdHNpCj4+IGluZGV4IGU1NTk2ZmUwMWExZC4uMzZjMzk5OGViN2YxIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpCj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKPj4gQEAgLTEwMzYs
NiArMTAzNiw3IEBAIG1tc3lzOiBzeXNjb25AMTQwMDAwMDAgewo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfTU1fU0VMPjsKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NDAwMDAwMDAw
PjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47Cj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIG1ib3hlcyA9IDwmZ2NlIDAgQ01EUV9USFJfUFJJT19ISUdIRVNUPiwKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZnY2UgMSBDTURRX1RIUl9QUklPX0hJR0hF
U1Q+Owo+PiAgICAgICAgICAgICAgICAgICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9
IDwmZ2NlIFNVQlNZU18xNDAwWFhYWCAwIDB4MTAwMD47Cj4+IEBAIC0xMjYyLDYgKzEyNjMsNyBA
QCBkc2kwOiBkc2lAMTQwMWIwMDAgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8Jm1tc3lzIENMS19NTV9EU0kwX0RJR0lUQUw+LAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8Jm1pcGlfdHgwPjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAiZW5naW5lIiwgImRpZ2l0YWwiLCAiaHMiOwo+PiArICAgICAgICAgICAgICAgICAg
ICAgICByZXNldHMgPSA8Jm1tc3lzIE1UODE3M19NTVNZU19TVzBfUlNUX0JfRElTUF9EU0kwPjsK
PiAKPiBBZGQgdGhpcyBpbiBiaW5kaW5nIGRvY3VtZW50LiBJdCB3b3VsZCBiZSBnb29kIGlmIHRo
ZSBiaW5kaW5nIGRvY3VtZW50Cj4gaXMgaW4geWFtbCBmb3JtYXQuCj4gCgpBY2ssIHdpbGwgYWRk
IHRoaXMgb3B0aW9uYWwgcHJvcGVydHkgaW4gdGhlIG1lZGlhdGVrLGRzaS50eHQgYmluZGluZy4K
CkkgY2FuIHRyeSB0byB0cmFuc2xhdGUgaXQgdG8geWFtbCBidXQgSU1PIHdvdWxkIGJlIGJldHRl
ciBpZiBzb21lb25lIHRoYXQgcmVhbGx5Cmtub3dzIHRoZSBoYXJkd2FyZSBhbmQgaGFzIGFjY2Vz
cyB0byB0aGUgZGF0YXNoZWV0IGNvdWxkIGRvIGl0LiBGcm9tIHRoZSBjdXJyZW50Ci50eHQgZmls
ZSBJIGNhbiBkZWR1Y2UgbW9zdCBvZiB0aGUgdGhpbmdzLCBidXQgc3RpbGwgSSBjYW4gbGFjayBz
b21lIGtpbmQgb2YKaW5mb3JtYXRpb24sIGkuZSBJIGtub3cgdGhhdCB0aGVyZSBhcmUgdGhyZWUg
Y2xvY2tzLCBidXQgZG9uJ3Qga25vdyBpZiBhbGwgdGhyZWUKYXJlIG5lZWRlZCAoZnJvbSAudHh0
IHllcywgYXJlIGFsbCBuZWVkZWQgYnV0IG5vdCBzdXJlKSwgYWxzbyBJIGtub3cgdGhhdCB0aGUK
bmFtZXMgb2YgdGhlIGNsb2NrcyBhcmUgImVuZ2luZSIsICJkaWdpdGFsIiwgYW5kICJocyIsIGJ1
dCBJIGRvbid0IGtub3cgdGhlCmRlc2NyaXB0aW9uIG9mIHRoZXNlIGNsb2Nrcy4KCklNSE8gd291
bGQgYmUgbmljZSBpZiBzb21lb25lIGZyb20gTWVkaWF0ZWsgY2FuIHRha2UgY2FyZSBvZiBhbGwg
dGhlIGJpbmRpbmcKbWlncmF0aW9uIHRvIHlhbWwuCgpDaGVlcnMsCiAgRW5yaWMKCj4gUmVnYXJk
cywKPiBDaHVuLUt1YW5nLgo+IAo+PiAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzID0gPCZt
aXBpX3R4MD47Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHBoeS1uYW1lcyA9ICJkcGh5IjsK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTczLXJlc2V0cy5oIGIvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxNzMtcmVzZXRzLmgKPj4gaW5kZXggYmE4NjM2ZWRhNWFl
Li42YTYwYzdjZWNjNGMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
bXQ4MTczLXJlc2V0cy5oCj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTcz
LXJlc2V0cy5oCj4+IEBAIC0yNyw2ICsyNyw4IEBACj4+ICAjZGVmaW5lIE1UODE3M19JTkZSQV9H
Q0VfRkFYSV9SU1QgICAgICAgNDAKPj4gICNkZWZpbmUgTVQ4MTczX0lORlJBX01NSU9NTVVSU1Qg
ICAgICAgICA0Nwo+Pgo+PiArLyogTU1TWVMgcmVzZXRzICovCj4+ICsjZGVmaW5lIE1UODE3M19N
TVNZU19TVzBfUlNUX0JfRElTUF9EU0kwICAgICAgIDI1Cj4+Cj4+ICAvKiAgUEVSSUNGRyByZXNl
dHMgKi8KPj4gICNkZWZpbmUgTVQ4MTczX1BFUklfVUFSVDBfU1dfUlNUICAgICAgICAwCj4+IC0t
Cj4+IDIuMzAuMgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
