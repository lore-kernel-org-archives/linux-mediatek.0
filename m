Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA3CC4727F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 07:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176B121927
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 07:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qT0dMybA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176B121927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g44nlgHIPBl8vv6ZImRoy6D2vEU+bS+sk8/TiY92ZnU=; b=qT0dMybAhj0pRPB2NPBq6Dj0p
	EJ2gqDAr3c63E1JI73YixLuL5vr95gXNplArK+4lIx25CTmQSHKvF8/nGRNEXUmfuXaFqoVo17JqH
	yH14CE6rWwLU/b87boTlzV/FutwUWGssnTXgvak0h8EsfgL6GMoeY3MAvxaeUm9vG4ouhLYyjoSoS
	4Gs3OZGc4umya/9vrilW3QjZvp49j/M1t+4yCD9Hau4qXNG1wZWM5viX2FrLm53Mvg/rXef5nRwZi
	WfQoM5Mi1kJxyF6mpmF0er0cGFiENn/bQ7SNR+++7C5kyEjTHYUD4EQ26kuu2k2ep2rZewc/S/WNR
	sSHuEPBDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQQgb-0000Xk-KV; Thu, 08 Oct 2020 07:50:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQQgY-0000X2-5l; Thu, 08 Oct 2020 07:49:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 334FB28DBF3
Subject: Re: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-5-enric.balletbo@collabora.com>
 <CAAOTY__X8L2sK0s3rkq2LDaMNoQrZKfzn=aJ791fK=UwnJMAyQ@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <580ecdf4-a686-f14c-a230-7f87f0c8cde5@collabora.com>
Date: Thu, 8 Oct 2020 09:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__X8L2sK0s3rkq2LDaMNoQrZKfzn=aJ791fK=UwnJMAyQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_034958_307476_A5DCA4CD 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIDgvMTAvMjAgMjowMSwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBI
aSwgRW5yaWM6Cj4gCj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29s
bGFib3JhLmNvbT4g5pa8IDIwMjDlubQxMOaciDfml6Ug6YCx5LiJIOS4iuWNiDM6MzPlr6vpgZPv
vJoKPj4KPj4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPj4KPj4gQWN0dWFsbHks
IHNldHRpbmcgdGhlIHJlZ2lzdGVycyBmb3Igcm91dGluZywgdXNlIG11bHRpcGxlICdpZi1lbHNl
JyBmb3IgZGlmZmVyZW50Cj4+IHJvdXRlcywgYnV0IHRoaXMgY29kZSB3b3VsZCBiZSBtb3JlIGFu
ZCBtb3JlIGNvbXBsaWNhdGVkIHdoaWxlIHdlCj4+IHN1cHBvcnQgbW9yZSBhbmQgbW9yZSBTb0Nz
LiBDaGFuZ2UgdGhhdCBhbmQgdXNlIGEgdGFibGUgcGVyIFNvQyBzbyB0aGUKPj4gY29kZSB3aWxs
IGJlIG1vcmUgcG9ydGFibGUgYW5kIGNsZWFyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8
Y2suaHVAbWVkaWF0ZWsuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNl
cnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4KPj4gIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tbXN5cy5jIHwgMzkzICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9ucygrKSwgMTgzIGRlbGV0aW9u
cygtKQo+Pgo+IAo+IFtzbmlwXQo+IAo+Pgo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1z
eXNfZHJpdmVyX2RhdGEgbXQyNzAxX21tc3lzX2RyaXZlcl9kYXRhID0gewo+PiBAQCAtOTMsMTAg
KzExNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10Njc5
N19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPj4gICAgICAgICAuY2xrX2RyaXZlciA9ICJjbGstbXQ2
Nzk3LW1tIiwKPj4gIH07Cj4+Cj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbXN5c19kcml2
ZXJfZGF0YSBtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4+IC0gICAgICAgLmNsa19kcml2
ZXIgPSAiY2xrLW10ODE3My1tbSIsCj4+IC19Owo+PiAtCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxODNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4+ICAg
ICAgICAgLmNsa19kcml2ZXIgPSAiY2xrLW10ODE4My1tbSIsCj4+ICB9Owo+PiBAQCAtMTA2LDE4
MCArMTI0LDE5MiBAQCBzdHJ1Y3QgbXRrX21tc3lzIHsKPj4gICAgICAgICBjb25zdCBzdHJ1Y3Qg
bXRrX21tc3lzX2RyaXZlcl9kYXRhICpkYXRhOwo+PiAgfTsKPj4KPiAKPiBbc25pcF0KPiAKPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3M19tbXN5c19k
cml2ZXJfZGF0YSA9IHsKPj4gKyAgICAgICAuY2xrX2RyaXZlciA9ICJjbGstbXQ4MTczLW1tIiwK
Pj4gKyAgICAgICAucm91dGVzID0gbXQ4MTczX21tc3lzX3JvdXRpbmdfdGFibGUsCj4+ICsgICAg
ICAgLm51bV9yb3V0ZXMgPSBBUlJBWV9TSVpFKG10ODE3M19tbXN5c19yb3V0aW5nX3RhYmxlKSwK
Pj4gK307Cj4+Cj4gCj4gSSByZW1vdmUgbXkgUmV2aWV3ZWQtYnkgdGFnLiBZb3UgZG9lcyBub3Qg
c2V0IHJvdXRlcyBmb3IgbXQyNzAxIGFuZAo+IG10MjcxMiwgYnV0IHRoZXNlIHR3byBTb0MgbmVl
ZCB0aGF0LiBNYXliZSBub3cgdGhleSB1c2UgdGhlIHNhbWUgdGFibGUKPiBhcyBtdDgxNzMuCj4g
CgpJIGRpZCB0aGF0IG9uIHB1cnBvc2UgYXMgZXhwbGFpbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIs
IGFuZCBhc2tlZCBmb3Igc29tZW9uZQp3aXRoIHRoZSBoYXJkd2FyZSB0byBwcm92aWRlIG1lIGEg
d29ya2luZyByb3V0aW5nIHRhYmxlLiBCdXQsIGlmIHlvdSB0aGluayB0aGUKc2FtZSByb3V0aW5n
IHNob3VsZCB3b3JrIG9uIHRob3NlIGRldmljZXMgSSdtIGZpbmUgdG8gdXNlIHRoZSBzYW1lIGZv
ciBhbGwgdGhlCmN1cnJlbnQgZGV2aWNlcy4gSSBkb24ndCBoYXZlIHRoYXQgaGFyZHdhcmUsIHNv
IGFueXdheSwgd2lsbCBuZWVkIHRvIHRlc3QuCgpUaGFua3MsCiBFbnJpYwoKPiBSZWdhcmRzLAo+
IENodW4tS3VhbmcuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
