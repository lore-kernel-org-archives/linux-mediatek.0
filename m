Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfrPL7rQOLW7u0auazS26O5w2kRNrBqobmjZyH8pges=; b=j6rUFE5ZkstKPj
	CN600ZHFBZ3ARS0dtsry34LeC/JCFkIC2+6UQeZsTrU7SZjf1fyhwGkBAdWL3b6gYywVzPtmzDZAN
	mqFAxynpf28FRXLn1lAJttgFA3T+DX81u/Oka1EqE1BGby6yUgv5JFjieDmangTmwil+W4Pp2PpOg
	+fBKEREjVOAE8qtsU/sHUZYfDVbA4nYDJLBknlb8PFzxFo+HeicFTCDEwUOpkbOytnM+jJtWE3bR4
	Zu7YtK0kSIXUko/id55JJ98DOMEZAqZM1CuX0vi+r1hAjZGjWidkY9sRjTiG5OOpy40O961HYW3e2
	uDFITOGTSwKYjmhDsetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7xhB-005WwL-13; Thu, 13 Jan 2022 10:51:05 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7xgx-005Wrg-Hh
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 10:50:54 +0000
Received: by mail-lf1-x132.google.com with SMTP id o15so17929495lfo.11
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Jan 2022 02:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NYdzsGyEzIJrHP8JYJwpG+jE5+s3oneWhUEBd32KPfc=;
 b=DhhsZ4FcY1ymdPypyg+ee+pcqdiHSzGlYLuwyZma/jDW9t3eFFml3cIDRE+Xfvh99+
 +4oBLTJzqus8vayylwYSGzQKdoQjicyTib8TNKHtenL7vge/5KER7iSIJlAE22OHhGJe
 x26kaaSxBgB6/8hltdzilL4tnDFYGvTapV+X0GXSpKGaE1H9QCc424YeLyw+l6/UYVla
 wQtNgHr259qGkouEiYzjKPAtE/9phQmnDoID2v36ht4co+cvmhsonWjWDetrDg23Ae8Y
 oYC9lNdWL0QXBuHtQ0w3FPum0JejOV6lgCawUm6ESNZY8+czHxksEfkBGAloMBHoU6PX
 K0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NYdzsGyEzIJrHP8JYJwpG+jE5+s3oneWhUEBd32KPfc=;
 b=OcrUJlgqYXaISps+i/LOH33UuZPJQ4QVMMg3H4mPSOkk7tqaOTuh5oLHA9HIFy2srQ
 opazkWvbVCzNjdC2/ImREyhG9JQ7OiPSfqCTNcWtbgScCXJDkFSpfmORRvYyoh3GWApL
 N3Agkrn92abMu+5eeA2vCUjq0zpItZXhva9dDVRq4hAMIbNF2m604nGJ0GuyBCXtazJk
 Oys2FibeD5fuz7ygeDbj0AjUXYBt2L48u/kn1BeASo5mVnnmMBxa8pj/baego4wk8IpJ
 YmfyY4V7oWFdcErysvp3gS9gnurZdBcBSxgoaZ6guEsrbzf+F8YNVs4NbvsYSh7sylOu
 GQ7A==
X-Gm-Message-State: AOAM532YzWNnR/q2ZkfpMuzz4cMmSTliiw6l16WQR1HzU34DJyFPv6sK
 WfUaSbhU33iHqjB9jVWA/mrEQvhYcmaLYSx6ETpDOA==
X-Google-Smtp-Source: ABdhPJyhIUaFCImjQEUT36hwyszgx3JmEnCBpsaSjbzQZGA3S2YuSL/rPG5RGeiNf1e3gQIc9S9mjOGoHwjjuLtLZ6g=
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr2544065ljk.122.1642071048268; 
 Thu, 13 Jan 2022 02:50:48 -0800 (PST)
MIME-Version: 1.0
References: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
 <20220105063643.119874-1-guangming.cao@mediatek.com>
In-Reply-To: <20220105063643.119874-1-guangming.cao@mediatek.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 13 Jan 2022 16:20:36 +0530
Message-ID: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
To: guangming.cao@mediatek.com
Cc: christian.koenig@amd.com, brian.starkey@arm.com, 
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, 
 dri-devel@lists.freedesktop.org, jianjiao.zeng@mediatek.com, 
 john.stultz@linaro.org, labbott@redhat.com, libo.kang@mediatek.com, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, 
 matthias.bgg@gmail.com, mingyuan.ma@mediatek.com, wsd_upstream@mediatek.com, 
 yf.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_025051_625005_9EDD8EA8 
X-CRM114-Status: GOOD (  40.64  )
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

SGVsbG8gR3VhbmdtaW5nLAoKT24gV2VkLCA1IEphbiAyMDIyIGF0IDEyOjA1LCA8Z3VhbmdtaW5n
LmNhb0BtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gRnJvbTogR3VhbmdtaW5nLkNhbyA8Z3Vhbmdt
aW5nLmNhb0BtZWRpYXRlay5jb20+Cj4KPiBPbiBUdWUsIDIwMjItMDEtMDQgYXQgMDg6NDcgKzAx
MDAsIENocmlzdGlhbiBL6bCKaWcgd3JvdGU6Cj4gPiBBbSAwMy4wMS4yMiB1bSAxOTo1NyBzY2hy
aWViIEpvaG4gU3R1bHR6Ogo+ID4gPiBPbiBNb24sIERlYyAyNywgMjAyMSBhdCAxOjUyIEFNIDxn
dWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3VhbmdtaW5n
IDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+ID4gPgo+ID4gPgo+ID4gPiBUaGFua3Mg
Zm9yIHN1Ym1pdHRpbmcgdGhpcyEKPiA+ID4KPiA+ID4gPiBBZGQgYSBzaXplIGNoZWNrIGZvciBh
bGxjYXRpb24gc2luY2UgdGhlIGFsbG9jYXRpb24gc2l6ZSBpcwo+ID4gPgo+ID4gPiBuaXQ6ICJh
bGxvY2F0aW9uIiBhYm92ZS4KPiA+ID4KPiA+ID4gPiBhbHdheXMgbGVzcyB0aGFuIHRoZSB0b3Rh
bCBEUkFNIHNpemUuCj4gPiA+Cj4gPiA+IEluIGdlbmVyYWwsIGl0IG1pZ2h0IGJlIGdvb2QgdG8g
YWRkIG1vcmUgY29udGV4dCB0byB0aGUgY29tbWl0Cj4gPiA+IG1lc3NhZ2UKPiA+ID4gdG8gYmV0
dGVyIGFuc3dlciAqd2h5KiB0aGlzIGNoYW5nZSBpcyBuZWVkZWQgcmF0aGVyIHRoYW4gd2hhdCB0
aGUKPiA+ID4gY2hhbmdlIGlzIGRvaW5nLiAgaWU6IFdoYXQgbmVnYXRpdmUgdGhpbmcgaGFwcGVu
cyB3aXRob3V0IHRoaXMKPiA+ID4gY2hhbmdlPwo+ID4gPiBBbmQgc28gaG93IGRvZXMgdGhpcyBj
aGFuZ2UgYXZvaWQgb3IgaW1wcm92ZSB0aGluZ3M/Cj4gPgo+ID4gQ29tcGxldGVseSBhZ3JlZSwg
anVzdCBvbmUgbGl0dGxlIGFkZGl0aW9uOiBDb3VsZCB5b3UgYWxzbyBhZGQgdGhpcwo+ID4gd2h5
Cj4gPiBhcyBjb21tZW50IHRvIHRoZSBjb2RlPwo+ID4KPiA+IFdoZW4gd2Ugc3R1bWJsZSBvdmVy
IHRoaXMgZml2ZSB5ZWFycyBmcm9tIG5vdyBpdCBpcyBhYnNvbHV0ZWx5IG5vdAo+ID4gb2J2aW91
cyB3aHkgd2UgZG8gdGhpcy4KPiA+Cj4gPiBUaGFua3MsCj4gPiBDaHJpc3RpYW4uCj4gPgo+IFRo
YW5rcyBmb3IgeW91ciByZXBseSEKPiBJIHdpbGwgdXBkYXRlIHRoZSByZWxhdGVkIHJlYXNvbiBp
biB0aGUgcGF0Y2ggbGF0ZXIuCj4KPiBUaGUgcmVhc29uIGZvciBhZGRpbmcgdGhpcyBjaGVjayBp
cyB0aGF0IHdlIG1ldCBhIGNhc2UgdGhhdCB0aGUgdXNlcgo+IHNlbnQgYW4gaW52YWxpZCBzaXpl
KEl0IHNlZW1zIGl0J3MgYSBuZWdhdGl2ZSB2YWx1ZSwgTVNCIGlzIDB4ZmYsIGl0J3MKPiBsYXJn
ZXIgdGhhbiBEUkFNIHNpemUgYWZ0ZXIgY29udmVydCBpdCB0byBzaXplX3QpIHRvIGRtYS1oZWFw
IHRvIGFsbG9jCj4gbWVtb3J5LCBhbmQgdGhpcyBhbGxvY2F0aW9uIHdhcyBydW5uaW5nIG9uIGEg
cHJvY2VzcyhzdWNoIGFzICJncmFsbG9jIgo+IG9uIEFuZHJvaWQgZGV2aWNlKSBjYW4ndCBiZSBr
aWxsZWQgYnkgT09NIGZsb3csIGFuZCB3ZSBhbHNvIGNvdWxkbid0Cj4gZmluZCB0aGUgcmVsYXRl
ZCBkbWFidWYgaW4gImRtYV9idWZfZGVidWdfc2hvdyIgYmVjYXVzZSB0aGUgcmVsYXRlZAo+IGRt
YWJ1ZiB3YXMgbm90IGV4cG9ydGVkIHlldCBzaW5jZSB0aGUgYWxsb2NhdGlvbiBpcyBzdGlsbCBv
biBnb2luZy4KPgo+IFNpbmNlIHRoaXMgaW52YWxpZCBhcmd1bWVudCBjYXNlIGNhbiBiZSBwcmV2
ZW50ZWQgYXQgZG1hLWhlYXAgc2lkZSwgc28sCj4gSSBhZGRlZCB0aGlzIHNpemUgY2hlY2ssIGFu
ZCBtb3Jlb3ZlciwgdG8gbGV0IGRlYnVnIGl0IGVhc2lseSwgSSBhbHNvCj4gYWRkZWQgbG9ncyB3
aGVuIHNpemUgaXMgYmlnZ2VyIHRoYW4gYSB0aHJlc2hvbGQgd2Ugc2V0IGluIG10ayBzeXN0ZW0K
PiBoZWFwLgo+IElmIHlvdSB0aGluayB0aGF0IHByaW50IGxvZ3MgaW4gZG1hLWhlYXAgZnJhbWV3
b3JrIGlzIGJldHRlciwgSSB3aWxsCj4gdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4KPgo+IElm
IHlvdSBoYXZlIGJldHRlciBzb2x1dGlvbihzdWNoIGFzIGR1bXAgdGhlIHNpemUgdW5kZXIgYWxs
b2NhdGluZwo+IGluICJkbWFfYnVmX2RlYnVnX3Nob3ciLCB3aGljaCBtYXliZSBuZWVkIGFkZCBn
bG9iYWwgdmFyaWFibGUgdG8gcmVjb3JkCj4gaXQpLCBwbGVhc2Uga2luZGx5IGxldCBtZSBrbm93
LgoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghCgpJIHRoaW5rIGp1c3QgYWRkaW5nIHRoZSByZWFz
b25pbmcgYWJvdmUgYXMgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBhCmNvbW1lbnQgaW4gdGhlIGNv
ZGUgc2hvdWxkIGJlIGVub3VnaCBmb3Igbm93OyB0aGUgZGVidWcgcGFydHMgbWF5IGJlCmVhc3kg
dG8gYWRkIGluIGNhc2Ugc29tZW9uZSBydW5zIGludG8gaXNzdWVzLgoKPiBUaGFua3MgOikKPiBH
dWFuZ21pbmcKCkJlc3QsClN1bWl0LgoKPgo+ID4gPgo+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1YW5nbWluZyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogamlhbmppYW8gemVuZyA8amlhbmppYW8uemVuZ0BtZWRpYXRlay5jb20+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gdjI6IDEuIHVwZGF0ZSBzaXplIGxpbWl0YXRpb24gYXMgdG90YWxfZHJh
bSBwYWdlIHNpemUuCj4gPiA+ID4gICAgICAyLiB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKPiA+ID4g
PiAtLS0KPiA+ID4gPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jIHwgMiArKwo+ID4gPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS0K
PiA+ID4gPiBoZWFwLmMKPiA+ID4gPiBpbmRleCA1NmJmNWFkMDFhZDUuLmUzOWQyYmU5OGQ2OSAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jCj4gPiA+ID4gQEAgLTU1LDYgKzU1LDggQEAg
c3RhdGljIGludCBkbWFfaGVhcF9idWZmZXJfYWxsb2Moc3RydWN0Cj4gPiA+ID4gZG1hX2hlYXAg
KmhlYXAsIHNpemVfdCBsZW4sCj4gPiA+ID4gICAgICAgICAgc3RydWN0IGRtYV9idWYgKmRtYWJ1
ZjsKPiA+ID4gPiAgICAgICAgICBpbnQgZmQ7Cj4gPiA+ID4KPiA+ID4gPiArICAgICAgIGlmIChs
ZW4gLyBQQUdFX1NJWkUgPiB0b3RhbHJhbV9wYWdlcygpKQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+ID4KPiA+ID4gVGhpcyBzZWVtcyBzYW5lLiBJIGtub3cgSU9O
IHVzZWQgdG8gaGF2ZSBzb21lIDEvMiBvZiBtZW1vcnkgY2FwIHRvCj4gPiA+IGF2b2lkIHVubmVj
ZXNzYXJ5IG1lbW9yeSBwcmVzc3VyZSBvbiBjcmF6eSBhbGxvY2F0aW9ucy4KPiA+ID4KPiA+ID4g
Q291bGQgeW91IHNlbmQgYWdhaW4gd2l0aCBhbiBpbXByb3ZlZCBjb21taXQgbWVzc2FnZT8KPiA+
ID4KPiA+ID4gdGhhbmtzCj4gPiA+IC1qb2huCj4gPgo+ID4KCgoKLS0KVGhhbmtzIGFuZCByZWdh
cmRzLAoKU3VtaXQgU2Vtd2FsIChoZSAvIGhpbSkKVGVjaCBMZWFkIC0gTENHLCBWZXJ0aWNhbCBU
ZWNobm9sb2dpZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
