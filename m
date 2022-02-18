Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E95AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xd1J6AcoxjdYjCWrSp4wGNMgPkD3XmBwkCugJ99/3Y=; b=zG8tc0py5Eyjzf
	cWKsiand1Nwke4mH6SckNjH8thwL19MmmkO/UpxrEDXVDRqUf4eg/+FlK1RzztBtK1s67EyYhLIql
	UxZVPbyJ1rzYhnpGG8+6uplgWfQZjnKk8pDuu0xeeOvLwID7FUr1b3X195aIPDxPqgajIXS27yXlp
	DAGPNpUaSi9QbZktBpS1yQNnPukIFRK9/pIcd80EhYeUnE1ZN5U2goEke0M7yc1lq0JyRyNAnrMAK
	fN7tECMQHiexF3FcBDjmS8tRZyTLt/0ykhgJRLTQmhNHGtR4y4rdihIpZrIM7zpyHgUcOsIDJYhix
	E5MB2TYlmkpiGnb4Cr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL2Ne-00EDjE-JU; Fri, 18 Feb 2022 12:28:58 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1cH-00E307-TJ; Fri, 18 Feb 2022 11:40:05 +0000
Date: Fri, 18 Feb 2022 11:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1645184396;
 bh=SoHk44i+hSrhGCWSov+A62f5mQ4gQxdPxK6xjt+fVz8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=ChUDHjrsfiukE7xWvak5fl+9SyIK7pibGyeOyRknvdnWxOVzG99VSWcQsJSiPUt6f
 9grvADHYFpp6DuC3gpQxTA69WdKAKyR7Mo/nwEB5QUyrC/dx+/CtDZF2YWNhQPW2Tl
 6+PnGc7RYTUjB1yibcvsbposFqs/0AkGQWJQfO//UxykAiqHXBvIPFzDz0UEkfa/fp
 MPDl3GjdqU9eTZAdYmjZdoFqdVxzIO9C1MOXcv02MRUgupJ5WQim3ZWvjshZxNREVr
 Dea5zfYRhicyLTflwxZeX0A1AFnYhkSLuejA6v53Ic38Uw3A/A2lg1P0Tvxx56g9q5
 bAYyZ4KyBzgvQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
In-Reply-To: <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_034002_845011_93CBD237 
X-CRM114-Status: GOOD (  28.78  )
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpZGF5LCBGZWJydWFyeSAxOHRoLCAyMDIyIGF0IDExOjM4LCBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPiB3cm90ZToKCj4gV2hhdCBJJ20gcmVhZGluZyBpbiB0aGUgYWJv
dmUgaXMgdGhhdCBpdCBpcyBiZWluZyBjb25zaWRlcmVkIHRvIGFsbG93Cj4gY2hhbmdpbmcgdGhl
IHBhbmVsLW9yaWVudGF0aW9uIHZhbHVlIGFmdGVyIHRoZSBjb25uZWN0b3IgaGFzIGJlZW4gbWFk
ZQo+IGF2YWlsYWJsZSB0byB1c2Vyc3BhY2U7IGFuZCBsZXQgdXNlcnNwYWNlIGtub3cgYWJvdXQg
dGhpcyB0aHJvdWdoIGEgdWV2ZW50Lgo+Cj4gSSBiZWxpZXZlIHRoYXQgdGhpcyBpcyBhIGJhZCBp
ZGVhLCBpdCBpcyBpbXBvcnRhbnQgdG8ga2VlcCBpbiBtaW5kIGhlcmUKPiB3aGF0IHVzZXJzcGFj
ZSAoZS5nLiBwbHltb3V0aCkgdXNlcyB0aGlzIHByb3J0eSBmb3IuIFRoaXMgcHJvcGVydHkgaXMK
PiB1c2VkIHRvIHJvdGF0ZSB0aGUgaW1hZ2UgYmVpbmcgcmVuZGVyZWQgLyBzaG93biBvbiB0aGUg
ZnJhbWVidWZmZXIgdG8KPiBhZGp1c3QgZm9yIHRoZSBwYW5lbCBvcmllbnRhdGlvbi4KPgo+IFNv
IG5vdyBsZXRzIGFzc3VtZSB3ZSBhcHBseSB0aGUgY29ycmVjdCB1cHNpZGUtZG93biBvcmllbnRh
dGlvbiBsYXRlcgo+IG9uIGEgZGV2aWNlIHdpdGggYW4gdXBzaWRlLWRvd24gbW91bnRlZCBMQ0Qg
cGFuZWwuIFRoZW4gb24gYm9vdCB0aGUKPiBmb2xsb3dpbmcgY291bGQgaGFwcGVuOgo+Cj4gMS4g
YW1kZ3B1IGV4cG9ydHMgYSBjb25uZWN0b3IgZm9yIHRoZSBMQ0QgcGFuZWwgdG8gdXNlcnNwYWNl
IHdpdGhvdXQKPiBzZXR0aW5nIHBhbmVsLW9yaWVudD11cHNpZGUtZG93bgo+IDIuIHBseW1vdXRo
IHNlZXMgdGhpcyBhbmQgcmVuZGVycyBpdHMgc3BsYXNoIG5vcm1hbGx5LCBidXQgc2luY2UgdGhl
Cj4gcGFuZWwgaXMgdXBzaWRlLWRvd24gaXQgd2lsbCBub3cgYWN0dWFsbHkgc2hvdyB1cHNpZGUt
ZG93bgoKQXQgdGhpcyBwb2ludCBhbWRncHUgaGFzbid0IHByb2JlZCB0aGUgY29ubmVjdG9yIHll
dC4gU28gdGhlIGNvbm5lY3Rvcgp3aWxsIGJlIG1hcmtlZCBhcyBkaXNjb25uZWN0ZWQsIGFuZCBw
bHltb3V0aCBzaG91bGRuJ3QgcmVuZGVyIGFueXRoaW5nLgoKPiAzLiBhbWRncHUgYWRqdXN0cyB0
aGUgcGFuZWwtb3JpZW50IHByb3AgdG8gdXBzaWRlLWRvd24sIHNlbmRzIG91dAo+IHVldmVudHMK
ClRoYXQncyB3aGVuIGFtZGdwdSBtYXJrcyB0aGUgY29ubmVjdG9yIGFzIGNvbm5lY3RlZC4gU28g
ZXZlcnl0aGluZwpzaG91bGQgYmUgZmluZSBJIGJlbGlldmUsIG5vIGJhZCBmcmFtZS4KCj4gNC4g
TGV0cyBhc3N1bWUgcGx5bW91dGggaGFuZGxlcyB0aGlzIHdlbGwgKGkpIGFuZCBub3cgYWRqdXN0
IGl0cwo+IHJlbmRlcmluZyBhbmQgcmVuZGVycyB0aGUgbmV4dCBmcmFtZSBvZiB0aGUgYm9vdHNw
bGFzaCAxODDCsCByb3RhdGVkCj4gdG8gY29tcGVuc2F0ZSBmb3IgdGhlIHBhbmVsIGJlaW5nIHVw
c2lkZSBkb3duLiBUaGVuIGZyb20gbm93IG9uCj4gdGhlIHVzZXIgd2lsbCBzZWUgdGhlIHNwbGFz
aCBub3JtYWxseQo+Cj4gU28gdGhpcyBtZWFucyB0aGF0IHRoZSB1c2VyIHdpbGwgYnJpZWZseSBz
ZWUgdGhlIGJvb3RzcGxhc2ggcmVuZGVyZWQKPiB1cHNpZGUgZG93biB3aGljaCBJTUhPIGlzIG5v
dCBhY2NlcHRhYmxlIGJlaGF2aW9yLiBBbHNvIHNlZSBteSBmb290bm90ZQo+IGFib3V0IGhvdyBJ
IHNlcmlvdXNseSBkb3VidCBwbHltb3V0aCB3aWxsIHNlZSB0aGUgcGFuZWwtb3JpZW50IGNoYW5n
ZQo+IGF0IGFsbC4KPgo+IEknbSBhbHNvIGEgYml0IHVuc3VyZSBhYm91dDoKPgo+IGEpIEhvdyB5
b3UgY2FuIHJlZ2lzdGVyIHRoZSBwYW5lbCBjb25uZWN0b3Igd2l0aCB1c2Vyc3BhY2UgYmVmb3Jl
Cj4gcmVhZGluZyB0aGUgZWRpZCwgZG9uJ3QgeW91IG5lZWQgdGhlIGVkaWQgdG8gZ2l2ZSB0aGUg
cGh5c2ljYWwgc2l6ZSArCj4gbW9kZWxpbmUgdG8gdXNlcnNwYWNlLCB3aGljaCB5b3UgY2Fubm90
IGp1c3QgbGVhdmUgb3V0ID8KCll1cC4gVGhlIEtNUyBFRElEIHByb3BlcnR5IGlzIGNyZWF0ZWQg
YmVmb3JlIHRoZSBFRElEIGlzIHJlYWQsIGFuZCBpcyBzZXQKdG8gemVybyAoTlVMTCBibG9iKS4g
VGhlIHdpZHRoL2hlaWdodCBpbiBtbSBhbmQgb3RoZXIgaW5mbyBhcmUgYWxzbyB6ZXJvLgpZb3Ug
Y2FuIHRyeSBpbnNwZWN0aW5nIHRoZSBzdGF0ZSBwcmludGVkIGJ5IGRybV9pbmZvIG9uIGFueSBk
aXNjb25uZWN0ZWQKY29ubmVjdG9yIHRvIHNlZSBmb3IgeW91cnNlbGYuCgo+IEkgZ3Vlc3MgdGhl
IGluaXRpYWwgbW9kZWxpbmUgaXMgaW5oZXJpdGVkIGZyb20gdGhlIHZpZGVvLWJpb3MsIGJ1dAo+
IHdoYXQgYWJvdXQgdGhlIHBoeXNpY2FsIHNpemU/IE5vdGUgdGhhdCB5b3UgY2Fubm90IGp1c3Qg
Y2hhbmdlIHRoZQo+IHBoeXNpY2FsIHNpemUgbGF0ZXIgZWl0aGVyLCB0aGF0IGdldHMgdXNlZCB0
byBkZXRlcm1pbmUgdGhlIGhpZHBpCj4gc2NhbGluZyBmYWN0b3IgaW4gdGhlIGJvb3RzcGxhc2gs
IGFuZCBjaGFuZ2luZyB0aGF0IGFmdGVyIHRoZSBpbml0aWFsCj4gYm9vdHNwbGFzaCBkaXNsYXkg
d2lsbCBhbHNvIGxvb2sgdWdseQo+Cj4gYikgV2h5IHlvdSBuZWVkIHRoZSBlZGlkIGZvciB0aGUg
cGFuZWwtb3JpZW50YXRpb24gcHJvcGVydHkgYXQgYWxsLAo+IHR5cGljYWxseSB0aGUgZWRpZCBw
cm9tIGlzIHBhcnQgb2YgdGhlIHBhbmVsIGFuZCB0aGUgcGFuZWwgZG9lcyBub3QKPiBrbm93IHRo
YXQgaXQgaXMgbW91bnRlZCBlLmcuIHVwc2lkZSBkb3duIGF0IGFsbCwgdGhhdCBpcyBhIHByb3Bl
cnR5Cj4gb2YgdGhlIHN5c3RlbSBhcyBhIHdob2xlIG5vdCBvZiB0aGUgcGFuZWwgYXMgYSBzdGFu
ZGFsb25lIHVuaXQgc28KPiBpbiBteSBleHBlcmllbmNlIGdldHRpbmcgcGFuZWwtb3JpZW50IGlu
Zm8gaXMgc29tZXRoaW5nIHdoaWNoIGNvbWVzCj4gZnJvbSB0aGUgZmlybXdhcmUgL3ZpZGVvLWJp
b3Mgbm90IGZyb20gZWRpZCA/CgpUaGlzIGlzIGFuIGludGVybmFsIERSTSB0aGluZy4gVGhlIG9y
aWVudGF0aW9uIHF1aXJrcyBsb2dpYyB1c2VzIHRoZQptb2RlIHNpemUgYWR2ZXJ0aXNlZCBieSB0
aGUgRURJRC4gSSBhZ3JlZSB0aGF0IGF0IGxlYXN0IGluIHRoZSBTdGVhbQpEZWNrIGNhc2UgaXQg
bWF5IG5vdCBtYWtlIGEgbG90IG9mIHNlbnNlIHRvIHVzZSBhbnkgaW5mbyBmcm9tIHRoZQpFRElE
LCBidXQgdGhhdCdzIG5lZWRlZCBmb3IgdGhlIGN1cnJlbnQgc3RhdHVzIHF1by4KCkFsc28gbm90
ZSwgRGlzcGxheUlEIGhhcyBhIGJpdCB0byBpbmRpY2F0ZSB0aGUgcGFuZWwgb3JpZW50YXRpb24g
SUlSQy4KV291bGQgYmUgbmljZSB0byBzdXBwb3J0IHBhcnNpbmcgdGhpcyBhdCBzb21lIHBvaW50
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
