Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFABC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:48:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B953C64EF4
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B953C64EF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uUIhRi09RhmtWtnJeRGV9HBKTGj2Q/nlhRqWNnUmmh4=; b=jd5rFi0W+1SoVp1VVqfopo4Fc
	vaoOoXQmfG9OYHcv4M5QS0Hu57kozr89l6kpp/Dzf9X6wVtGBBpVqTzpXKTQWPdMkYaDYf2EgIJFD
	UDFf5VQ9vKPmr7a55f6qUPo4X0z7cuyC5Dah7eCCYPqcNlounxGIAcEGRJQQ2aTWwwO8AsE1qU/sk
	SMzwWpz20f6bUOO4vuXIBKbF9UAJWDvBzh+0ZJQgYyQUnLBR6BhubQXqWfwX51yEwQ/tgzAk/Wo4i
	Aw4aY/awxqojOP8OMn6kjk5jeRHnijbNVF+v1Ixmu0A5I1gSFTOU9wowvMND3fehFD2aKzia/wCn0
	227Lg/O0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYPv-006TnD-D4; Wed, 03 Mar 2021 20:48:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT6v-005JEZ-D5
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ul5d5eo5jjguw4uCkJHVtdEjPOboupeNtSzAVz4Rmio=; b=agBmNMxAnq7McmdEEphzNtboh1
 tsQT1vqnd2/hj25flnIaPzjqARAT0Sy7d1l0ztfrnNlNVmDK0ovXlr51INA83Q/sZnKASpBPumqzD
 wsnQQk3/j7ndGlC+vyCXN8B/I0LL+/J4S7hxuawZ1eaTkUBCon/aORJhrdNqV/aGicbUy5M+eowMy
 zgPa40m96IczijM2yroDuGVHB1kEt2yC0FLyaJRDlKOUaHiNzVCmUHtcyT4li/GJKQmpWUwDbc5I3
 OXkEyHqzqKf6yRstpFwWk1PfAXCYIYba3tyAvsVOryvq1cSROc9bnvhEqNYohOtMjOA9znTEoI5Kq
 CEHgrsnw==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOmf-002BRQ-6w
 for linux-mediatek@lists.infradead.org; Wed, 03 Mar 2021 10:31:13 +0000
Received: by mail-lj1-x22e.google.com with SMTP id u18so14317568ljd.3
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Mar 2021 02:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ul5d5eo5jjguw4uCkJHVtdEjPOboupeNtSzAVz4Rmio=;
 b=ThpGElSJaCEbZZncSCI7UVnPIpXqQjO7Q4JJCYgYQ5obCM9YSBam90bydANSj3gDJj
 goYyHSbLByqsIFWn/0d9nyPpQrSNEwpWzB1GvB89Pmnx90aZRKA/uvkwcHmfaj47ChC/
 g4MbCiU8TMHgSsfVHS1LWSrMaKVvq+02Hdhak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ul5d5eo5jjguw4uCkJHVtdEjPOboupeNtSzAVz4Rmio=;
 b=plJDqK+1v9zO1d4dgKX9+rKM7V5+cTNjY2V16MzKLptwAYkerFcIXku4PXdedIpQ0+
 aFgjZ/4PI9K1FnS8Rs9RSKskCe/rRq1uf6lwAjaE1r+D5YgmQgZIbGXu9zZr+OC73kFS
 JDdLoQ3yVJgOYMr5Q76XQs8u0fLjPgApjNFHYbemj34V7FqrLRG0QKUKVrwajugB1eVs
 h1QkBRiTYwRPpysOfkyBMvOxBM2Lkdon5xcsuqNlMA6uDzj3xFZCkNQW33hDlpoaH8H+
 GvvT+h3JBRKJ0UgV/vqv74cwYjJjehoX9lEtsFRlFZJIn3YRCuOUqxuSIIl5oLDZl0dA
 xjOQ==
X-Gm-Message-State: AOAM533XLY0CerB1dmZywbO0AMs/+u5Z2Z3stwA2dazK3s70jUOZciaG
 PSMVcC+cMzvqraC8tD+8+aHCi9lBLL5EQA==
X-Google-Smtp-Source: ABdhPJxEl/htd71M9QwuMTJ9p2g2LETuiN+wbEuGxVd0O+7mhKwV8Mh63GtsWTWSg8ybE0VYXRhS2A==
X-Received: by 2002:a2e:5cc7:: with SMTP id q190mr13601608ljb.37.1614767409856; 
 Wed, 03 Mar 2021 02:30:09 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id o26sm1292541ljc.138.2021.03.03.02.30.07
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:30:07 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id z11so36218406lfb.9
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Mar 2021 02:30:07 -0800 (PST)
X-Received: by 2002:a19:712:: with SMTP id 18mr14809919lfh.591.1614767406688; 
 Wed, 03 Mar 2021 02:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20210225101612.2832444-1-acourbot@chromium.org>
 <20210225101612.2832444-4-acourbot@chromium.org>
 <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
In-Reply-To: <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 3 Mar 2021 19:29:55 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUUDSwRNEiuDy8s-CMwosraS25P2o109XyJCms9RTRBsQ@mail.gmail.com>
Message-ID: <CAPBb6MUUDSwRNEiuDy8s-CMwosraS25P2o109XyJCms9RTRBsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: add Mediatek's MM21 format
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_103113_500280_C2ED4E34 
X-CRM114-Status: GOOD (  25.64  )
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

SGkgTmljb2xhcywKCk9uIFdlZCwgTWFyIDMsIDIwMjEgYXQgMjozOCBBTSBOaWNvbGFzIER1ZnJl
c25lIDxuaWNvbGFzQG5kdWZyZXNuZS5jYT4gd3JvdGU6Cj4KPiBMZSBqZXVkaSAyNSBmw6l2cmll
ciAyMDIxIMOgIDE5OjE2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCBhIMOpY3JpdCA6Cj4gPiBB
ZGQgTWVkaWF0ZWsncyBub24tY29tcHJlc3NlZCA4IGJpdCBibG9jayB2aWRlbyBtb2RlLiBUaGlz
IGZvcm1hdCBpcwo+ID4gcHJvZHVjZWQgYnkgdGhlIE1UODE4MyBjb2RlYyBhbmQgY2FuIGJlIGNv
bnZlcnRlZCB0byBhIG5vbi1wcm9wcmlldGFyeQo+ID4gZm9ybWF0IGJ5IHRoZSBNRFAzIGNvbXBv
bmVudC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RA
Y2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21l
ZGlhL3Y0bC9waXhmbXQtcmVzZXJ2ZWQucnN0IHwgNyArKysrKysrCj4gPiAgZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAg
aW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9waXhmbXQtcmVz
ZXJ2ZWQucnN0Cj4gPiBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4
Zm10LXJlc2VydmVkLnJzdAo+ID4gaW5kZXggYzkyMzFlMTg4NTliLi4xODdlYTg5ZjdhMjUgMTAw
NjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3BpeGZt
dC1yZXNlcnZlZC5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRp
YS92NGwvcGl4Zm10LXJlc2VydmVkLnJzdAo+ID4gQEAgLTI0Miw2ICsyNDIsMTMgQEAgcGxlYXNl
IG1ha2UgYSBwcm9wb3NhbCBvbiB0aGUgbGludXgtbWVkaWEgbWFpbGluZyBsaXN0Lgo+ID4gICAg
ICAgICBJdCBpcyBhbiBvcGFxdWUgaW50ZXJtZWRpYXRlIGZvcm1hdCBhbmQgdGhlIE1EUCBoYXJk
d2FyZSBtdXN0IGJlCj4gPiAgICAgICAgIHVzZWQgdG8gY29udmVydCBgYFY0TDJfUElYX0ZNVF9N
VDIxQ2BgIHRvIGBgVjRMMl9QSVhfRk1UX05WMTJNYGAsCj4gPiAgICAgICAgIGBgVjRMMl9QSVhf
Rk1UX1lVVjQyME1gYCBvciBgYFY0TDJfUElYX0ZNVF9ZVlU0MjBgYC4KPiA+ICsgICAgKiAuLiBf
VjRMMi1QSVgtRk1ULU1NMjE6Cj4gPiArCj4gPiArICAgICAgLSBgYFY0TDJfUElYX0ZNVF9NTTIx
YGAKPiA+ICsgICAgICAtICdNTTIxJwo+ID4gKyAgICAgIC0gTm9uLWNvbXByZXNzZWQsIHRpbGVk
IHR3by1wbGFuYXIgZm9ybWF0IHVzZWQgYnkgTWVkaWF0ZWsgTVQ4MTgzLgo+ID4gKyAgICAgICBU
aGlzIGlzIGFuIG9wYXF1ZSBpbnRlcm1lZGlhdGUgZm9ybWF0IGFuZCB0aGUgTURQMyBoYXJkd2Fy
ZSBjYW4gYmUKPiA+ICsgICAgICAgdXNlZCB0byBjb252ZXJ0IGl0IHRvIG90aGVyIGZvcm1hdHMu
Cj4gPiAgICAgICogLi4gX1Y0TDItUElYLUZNVC1TVU5YSS1USUxFRC1OVjEyOgo+Cj4gVGhlIFNV
TlhJIG9uZSB3YXMgYSBtaXN0YWtlLCAgaXQncyBsaW5lYXIgbGF5b3V0IDMyeDMyIHRpbGVzLiBU
aGUgcHJvYmxlbSB3aXRoCj4gY2FsbGluZyB0aGlzIGEgdmVuZG9yIGZvcm1hdCwgaXMgdGhhdCBv
dGhlciB2ZW5kb3IgbWlnaHQgYmUgdXNpbmcgaXQgdG9vLiBCdXQKPiB0aGV5IHdvbid0IGtub3cg
YW5kIHRoZSBmb3JtYXQgbWlnaHQgZW5kdXAgZHVwbGljYXRlZCwgZXZlbiBpZiBpdCdzIHRoZSBz
YW1lCj4gb25lLgo+Cj4gU28gaGVyZSdzIG15IHJlcXVlc3QsIGhhdmUgeW91IHRyaWVkIHRvIHVu
ZGVyc3RhbmQgYSBiaXQgbW9yZSB3aGF0IHRoZSB0aWxpbmcKPiBsYXlvdXQgaXMgPyBDb3VsZCBi
ZSB0aWxlZCArIFNBTkQsIGNvdWxkIHVzZSB6aWd6YWcgbGF5b3V0IGxpa2UgU2Ftc3VuZyBkby4g
SQo+IHRoaW5rIGlmIHdlIGNhbiBhdm9pZCB2ZW5kb3IgZm9ybWF0cywgd2UgY2FuIHByZXNlcnZl
IHRoZSBwaXhlbCBmb3JtYXQgbGlzdAo+IHNhbml0eSBoZXJlLiBNb3N0IG9mIHRoZSBIVyBJJ3Zl
IGVuY291dGVyZWQgd2FzIHZlcnkgZWFzeSB0byByZXZlcnNlLCBldmVuIGlmCj4gdW5kb2N1bWVu
dGVkIChleGNlcHQgdGhlIGNvbXByZXNzZWQgb25lKS4KClVuZm9ydHVuYXRlbHkgSSBkb24ndCB0
aGluayBJIGNhbiBsb29rIHRvbyBjbG9zZWx5IGludG8gdGhhdCwgZm9yCm5vbi10ZWNobmljYWwg
cmVhc29ucy4gQnV0IGlmIE1USyBjb3VsZCBjb21lIGZvcndhcmQgYW5kIGRvY3VtZW50CnRoZWly
IGZvcm1hdCwgdGhhdCB3b3VsZCBiZSBpbmRlZWQgaWRlYWwuCgo+Cj4gSWYgbm90IHBvc3NpYmxl
LCBJIHdvdWxkIGxpa2UgdG8gc3VnZ2VzdDoKPgo+ICAgVjRMMl9QSVhfRk1UX01US19OVjIxCj4K
PiBUaGUgaW1wb3J0YW50IHBhcnQgaXMgdG8gYWRkIGEgY2xlYXIgc2VwZXJhdGlvbiBmb3IgdGhl
IHZlbmRvciBuYW1lLCBpdCBlYXN5IHRvCj4gcmVjb2duaXplIHRoZW4uCgpUaGUgTVRLIHByZWZp
eCBtYWtlcyBzZW5zZSwgYnV0IEkgZG8gbm90IGtub3cgaWYgTlYyMSBpcyBhIGNvcnJlY3QKZGVu
b21pbmF0aW9uIGZvciB0aGF0IGZvcm1hdC4gTm90ZSB0aGF0IHdlIGhhdmUgYW5vdGhlciBNVEst
b25seQpmb3JtYXQgY3VycmVudGx5IG5hbWVkIFY0TDJfUElYX0ZNVF9NVDIxQywgd2hpY2ggaXMg
YWxyZWFkeSBwdWJsaWMuIEl0CndvdWxkIGJlIG5pY2UgdG8gcmVuYW1lIGl0IGFzIHdlbGwsIGJ1
dCBzaW5jZSBpdCBpcyBwYXJ0IG9mIHRoZSBwdWJsaWMKQVBJIEknbSBhZnJhaWQgdGhlIGNhdCBp
cyBhbHJlYWR5IG91dCBvZiB0aGUgYmFnIGZvciB0aGF0IG9uZS4uLgoKPgo+ID4KPiA+ICAgICAg
ICAtIGBgVjRMMl9QSVhfRk1UX1NVTlhJX1RJTEVEX05WMTJgYAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi0K
PiA+IGNvcmUvdjRsMi1pb2N0bC5jCj4gPiBpbmRleCAzMWQxMzQyZTYxZTguLjBiODViMmJiYzYy
OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYwo+
ID4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jCj4gPiBAQCAtMTM4
NCw2ICsxMzg0LDcgQEAgc3RhdGljIHZvaWQgdjRsX2ZpbGxfZm10ZGVzYyhzdHJ1Y3QgdjRsMl9m
bXRkZXNjICpmbXQpCj4gPiAgICAgICAgIGNhc2UgVjRMMl9QSVhfRk1UX1RNNjAwMDogICAgICAg
ZGVzY3IgPSAiQS9WICsgVkJJIE11eCBQYWNrZXQiOyBicmVhazsKPiA+ICAgICAgICAgY2FzZSBW
NEwyX1BJWF9GTVRfQ0lUX1lZVllVWTogICBkZXNjciA9ICJHU1BDQSBDSVQgWVlWWVVZIjsgYnJl
YWs7Cj4gPiAgICAgICAgIGNhc2UgVjRMMl9QSVhfRk1UX0tPTklDQTQyMDogICAgZGVzY3IgPSAi
R1NQQ0EgS09OSUNBNDIwIjsgYnJlYWs7Cj4gPiArICAgICAgIGNhc2UgVjRMMl9QSVhfRk1UX01N
MjE6ICAgICAgICAgZGVzY3IgPSAiTWVkaWF0ZWsgOC1iaXQgYmxvY2sgZm9ybWF0IjsKPiA+IGJy
ZWFrOwo+ID4gICAgICAgICBjYXNlIFY0TDJfUElYX0ZNVF9IU1YyNDogICAgICAgIGRlc2NyID0g
IjI0LWJpdCBIU1YgOC04LTgiOyBicmVhazsKPiA+ICAgICAgICAgY2FzZSBWNEwyX1BJWF9GTVRf
SFNWMzI6ICAgICAgICBkZXNjciA9ICIzMi1iaXQgWEhTViA4LTgtOC04IjsgYnJlYWs7Cj4gPiAg
ICAgICAgIGNhc2UgVjRMMl9TRFJfRk1UX0NVODogICAgICAgICAgZGVzY3IgPSAiQ29tcGxleCBV
OCI7IGJyZWFrOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIu
aCBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaAo+ID4gaW5kZXggNzlkYmRlM2JjZjhk
Li5lNjg5MGRhZTc2ZWMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9k
ZXYyLmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaAo+ID4gQEAgLTcz
MSw2ICs3MzEsNyBAQCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IHsKPiA+ICAjZGVmaW5lIFY0TDJf
UElYX0ZNVF9ZMTJJICAgICB2NGwyX2ZvdXJjYygnWScsICcxJywgJzInLCAnSScpIC8qIEdyZXlz
Y2FsZQo+ID4gMTItYml0IEwvUiBpbnRlcmxlYXZlZCAqLwo+ID4gICNkZWZpbmUgVjRMMl9QSVhf
Rk1UX1oxNiAgICAgIHY0bDJfZm91cmNjKCdaJywgJzEnLCAnNicsICcgJykgLyogRGVwdGggZGF0
YQo+ID4gMTYtYml0ICovCj4gPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfTVQyMUMgICAgdjRsMl9m
b3VyY2MoJ00nLCAnVCcsICcyJywgJzEnKSAvKiBNZWRpYXRlawo+ID4gY29tcHJlc3NlZCBibG9j
ayBtb2RlICAqLwo+ID4gKyNkZWZpbmUgVjRMMl9QSVhfRk1UX01NMjEgICAgIHY0bDJfZm91cmNj
KCdNJywgJ00nLCAnMicsICcxJykgLyogTWVkaWF0ZWsgOC0KPiA+IGJpdCBibG9jayBtb2RlLCB0
d28gbm9uLWNvbnRpZ3VvdXMgcGxhbmVzICovCj4gPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfSU5a
SSAgICAgdjRsMl9mb3VyY2MoJ0knLCAnTicsICdaJywgJ0knKSAvKiBJbnRlbCBQbGFuYXIKPiA+
IEdyZXlzY2FsZSAxMC1iaXQgYW5kIERlcHRoIDE2LWJpdCAqLwo+ID4gICNkZWZpbmUgVjRMMl9Q
SVhfRk1UX1NVTlhJX1RJTEVEX05WMTIgdjRsMl9mb3VyY2MoJ1MnLCAnVCcsICcxJywgJzInKSAv
Kgo+ID4gU3VueGkgVGlsZWQgTlYxMiBGb3JtYXQgKi8KPiA+ICAjZGVmaW5lIFY0TDJfUElYX0ZN
VF9DTkY0ICAgICB2NGwyX2ZvdXJjYygnQycsICdOJywgJ0YnLCAnNCcpIC8qIEludGVsIDQtYml0
Cj4gPiBwYWNrZWQgZGVwdGggY29uZmlkZW5jZSBpbmZvcm1hdGlvbiAqLwo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
