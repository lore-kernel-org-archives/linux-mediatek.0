Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85663C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 06:04:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559A420757
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 06:04:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IOXClp69";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iwH0JI7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559A420757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpdoO4UgdzMZJLzVC+/HY3tTMopyNAmbSZFluabIGb0=; b=IOXClp69BsaW/V
	qpWKrH0hgzk0D3xYDTkGC4sm1mHKK/jrQ5MVZx3oRtzILD0GDKaFXO2vzSFJ9BgsjDMCAswCvIX9G
	dLmYRMYjsr6QIEaHRoZl2nL0ykHMw4fh8NGxViKPpSNUA1M9PG6tyo1NNeDRO09demi95cZtEPkEL
	6hA+EM5uI5DPyibiHNPtnliXpYV/NQpCBKUJIR2WcYYqQ0nbkY90RYyGcgAKDq8CEapNGg4Amr4UA
	cCwyKoXlSQLDYEwygXJ9TNwzJRvv0LBp1p6CNxe3WlSmSeN/wbAdoLqH0vXYZxDBnnCe7CRiOYMhc
	CeHFDtrCcEOsE1Y1frUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMQIv-0004sz-Mr; Thu, 09 Apr 2020 06:04:45 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMQIn-0004jn-Kd
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 06:04:39 +0000
Received: by mail-il1-x141.google.com with SMTP id i14so4069372ilr.11
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Apr 2020 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U0k2Xztg7j9SvQNMVkx71cxXQ6AFkKJ2SAjXAl+0SNI=;
 b=iwH0JI7iD6GVpaav0sLt57UZsJUsWbjl8vAtI16qx9IfbT5hpfC9Q/m3Z58vYlN3H9
 bIrELcVGbZoqw9UdiwqsRYQGBHTLiFtAz0Y4o8n1zlUe/B12WZbb3W3VakafXfD3XyCB
 a1qVjM3f9Dm9vIgn6dhIpLoUO1u7oiYA+wquQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U0k2Xztg7j9SvQNMVkx71cxXQ6AFkKJ2SAjXAl+0SNI=;
 b=bD+OPe1/ftZ2whhf7rmZOjP3bfJSNyBsRiiUb1ZW0H6bQZiqe6M5UhJ7mhQkjsS52N
 l1440oN5qz9W5OHdSg1i/5QrokPPjQyTGRBJ/0D0+MQWZMd9ggfTLAnUps9+ZWD90C0M
 zZaLkhCNKwarXWpP+bRCw10BLpRSoWudFUVWdd1Bv6RotnUGmqczqHlMQ8tvY+mql2JQ
 AbcCX0VAobN1vv9RntPmXgTgzMll9AsClYzEKnrHJoiWYeIdWMTbbt+b+QyxaOk+sDPA
 Wsn7cZlD3Q2qH0dK5tomqS2mqhQIo4z8/VNdcmN3m+RBwwW40PKqDLN0wMuRhxATk1Ff
 S5OQ==
X-Gm-Message-State: AGi0Pub6XwRoXb5acNdo/602cShpimVLQ51MWTxfMBP5J2y5Pva+p6sw
 D65oo0rIy6l1OR2lHdoTDk7BIj5ruPxd74T1a9rFNg==
X-Google-Smtp-Source: APiQypKsq4Dq9SLFz7Ua4KMnDBywchOcH84tfaonrDZ/Ffl3NFOaaK4qj/XhAmQiYl67GiykhWkxoDEVzS/bOgUAZQY=
X-Received: by 2002:a05:6e02:6cd:: with SMTP id
 p13mr11240229ils.150.1586412275898; 
 Wed, 08 Apr 2020 23:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191118104252.228406-1-hsinyi@chromium.org>
 <CAFqH_528vidMhTFxNZ=b7SFD2K12UwtdX3uTUzW4YUgeDWkg5A@mail.gmail.com>
 <CAAOTY_8RMboOuKVKPANZ1QN+mt0jvOr13o84VhWKGY1QZqbPDg@mail.gmail.com>
 <e22e0400-56e0-2ff4-72d8-5231b7fa58fc@collabora.com>
In-Reply-To: <e22e0400-56e0-2ff4-72d8-5231b7fa58fc@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 9 Apr 2020 14:04:09 +0800
Message-ID: <CAJMQK-iQvkQDnhL-LqCz57+3_GqU3EM5m=S2vGsOZuyGeXM74w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Add gce setting in mmsys and display
 node
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_230437_677272_60696F80 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgOSwgMjAyMCBhdCAxMjo0NyBBTSBFbnJpYyBCYWxsZXRibyBpIFNlcnJhCjxl
bnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhpIENodW4tS3VhbmcKPgo+
IE1hbnkgdGhhbmtzIHRvIGxldCB1cyBrbm93IHRoaXMsIEkgY29tcGxldGVseSBtaXNzZWQuCj4K
PiBPbiA4LzQvMjAgMTg6MDksIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBIaSwgSHNpbi1ZaToK
PiA+Cj4gPiBFbnJpYyBCYWxsZXRibyBTZXJyYSA8ZWJhbGxldGJvQGdtYWlsLmNvbT4g5pa8IDIw
MjDlubQ05pyIOOaXpSDpgLHkuIkg5LiL5Y2IMTE6NDjlr6vpgZPvvJoKPiA+Pgo+ID4+IE1pc3Nh
dGdlIGRlIEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4gZGVsIGRpYSBkbC4sIDE4
IGRlIG5vdi4KPiA+PiAyMDE5IGEgbGVzIDExOjQzOgo+ID4+Pgo+ID4+PiBJbiBvcmRlciB0byB1
c2UgR0NFIGZ1bmN0aW9uLCB3ZSBuZWVkIGFkZCBzb21lIGluZm9ybWF0aW9ucwo+ID4+PiBpbnRv
IGRpc3BsYXkgbm9kZSAobWJveGVzLCBtZWRpYXRlayxnY2UtY2xpZW50LXJlZywgbWVkaWF0ZWss
Z2NlLWV2ZW50cykuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNp
bnlpQGNocm9taXVtLm9yZz4KPiA+Pgo+ID4+IFdpdGggdGhlIGZpeCBwcm92aWRlZCBieSBIc2lu
LVlpIFsxXSBhbmQgYWZ0ZXIgdGhlIG1tc3lzIHBhdGNoZXMKPiA+PiBsYW5kZWQgSSBnZXQgR0NF
IGZ1bmN0aW9uIHdvcmtpbmcgb24gbXQ4MTczLCBzbwo+ID4+Cj4gPj4gVGVzdGVkLWJ5OiBFbnJp
YyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4+Cj4g
Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA0MDYwNTExMzEuMjI1NzQ4
LTEtaHNpbnlpQGNocm9taXVtLm9yZy8KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiAgRW5yaWMKPiA+
Pgo+ID4+PiAtLS0KPiA+Pj4gLSBUaGlzIGlzIGJhc2VkIG9uIHNlcmllcyAic3VwcG9ydCBnY2Ug
b24gbXQ4MTgzIHBsYXRmb3JtIgo+ID4+PiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
Y292ZXIvMTEyMDgzMDkvCj4gPj4+IC0gZ2NlIHNldHRpbmcgaW4gODE4MzoKPiA+Pj4gICBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTI3MTA1Lwo+ID4+PiAtLS0KPiA+Pj4g
IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kgfCAxNiArKysrKysrKysr
KysrKysrCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4+Pgo+ID4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKPiA+Pj4gaW5kZXggMTVm
MTg0MmY2ZGYzLi5lODRlYzNmOTVkODEgMTAwNjQ0Cj4gPj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKPiA+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxNzMuZHRzaQo+ID4+PiBAQCAtOTExLDYgKzkxMSwxMSBAQCBtbXN5czog
Y2xvY2stY29udHJvbGxlckAxNDAwMDAwMCB7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IGFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NTV9TRUw+Owo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw0MDAwMDAwMDA+Owo+
ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIG1ib3hlcyA9IDwmZ2NlIDAgQ01EUV9USFJfUFJJT19ISUdI
RVNUIDE+LAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmdjZSAxIENN
RFFfVEhSX1BSSU9fSElHSEVTVCAxPjsKPiA+Cj4gPiBCZWNhdXNlIG9mIHBhdGNoIFsxXSwgYXRv
bWljX2V4ZWMgcGFyYW1ldGVyIHNob3VsZCBiZSByZW1vdmVkLgo+ID4KPiA+IFsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQu
Z2l0L2NvbW1pdC8/aD1uZXh0LTIwMjAwNDA4JmlkPTE5ZDhlMzM1ZDU4YTk2MWE3ZWQzNzdlNWUy
ZTYzNjY0YjkyYzBiOWMKPiA+Cj4KPiBNYW55IHRoYW5rcyB0byBwb2ludCB0aGlzLiBIc2luLVlp
LCBhcyB0aGUgbXQ4MTczIGRldmljZS10cmVlIHdpbGwgbm90IGxhbmQgaW4KPiBjdXJyZW50IG1l
cmdlIHdpbmRvdyAoTWF0dGhpYXMgY29ycmVjdCBtZSBpZiBJIGFtICB3cm9uZykgbWF5YmUgeW91
IGNvdWxkIHNlbmQgYQo+IG5ldyB2ZXJzaW9uIG9mIHRoZSBkZXZpY2UtdHJlZSBpbmNsdWRpbmcg
dGhlc2UgY2hhbmdlcz8KPgo+Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIG1lZGlhdGVr
LGdjZS1jbGllbnQtcmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhYIDAgMHgxMDAwPjsKPiA+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWV2ZW50cyA9IDxDTURRX0VWRU5U
X01VVEVYMF9TVFJFQU1fRU9GPiwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxDTURRX0VWRU5UX01VVEVYMV9TVFJFQU1fRU9GPjsKPiA+Cj4gPiBC
ZWNhdXNlIG9mIHBhdGNoIFsyXSwgdGhlc2UgZXZlbnRzIHNob3VsZCBiZSBtb3ZlZCB0byBtdXRl
eCBub2RlLgo+ID4KPiA+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPXY1LjYmaWQ9NjBmYThjMTNh
YjFhMzNiOGI5NThlZmIxNTEwZWMyZmQ4YTA2NGJjYwo+ID4KPgo+IEhzaW4tWWksIG5vdGUgdGhp
cyB3aWxsIGFsc28gaW1wYWN0IHlvdXIgZml4ZXMgcGF0Y2ggWzFdLgo+Cj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA0MDYwNTExMzEuMjI1NzQ4LTEtaHNpbnlpQGNocm9t
aXVtLm9yZy8KPgo+IFRoYW5rcywKPiAgRW5yaWMKPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3Vh
bmcuCj4gPgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgoKdjI6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMDA0MDkwNTUwMTIuMTk5MzIwLTEtaHNpbnlpQGNocm9taXVtLm9y
Zy8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
