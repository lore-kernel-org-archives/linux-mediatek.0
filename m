Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50114C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfqFMTkx6bohUU6abSNwK4TKDHeBde7ny2cyvuYaPZE=; b=dbLrKWWzebulQA
	67z4XfVHqzw/RY9wnSq7JCl/b90iLQGTSG6cl+YMUwGCicsHgNyYQfi0/mEfuuNzJbq1YIomKsWrP
	Um1MpOnp4e4lsUj/YYKKXOdUGgjSDRUAOwdlp/mQDHE4qTi+C5gnz/wzmdl3+qycu/gI0jZUTFG1V
	LLHqaw/1O6Pg65beFwqWiOfqq4KAjNtI1RUkJSTg6mVHxN8ZnlzWQhylOoN9XSGcE30V22b6brjcQ
	Yh3cCS7lDOpNMga+JfGhHcj1aQsox3RQ/pwU/Rl67QLNYeRNOECEmeEYXanuuA74PWDR3hOXMI2R2
	5ds+8UrBMptjgXvAyUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0fA-00DsVS-Vh; Fri, 18 Feb 2022 10:38:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0f8-00DsUT-54
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 10:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645180733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BB3RvaNyELHc5+cbc7+hBFpImVt+dcbvRUKC71NhhxA=;
 b=BiBPBpC1LdrvrU40yV+x27m/BaCjsASDV9+aN3T0+E13yCuLFbv7bqApqxIkLNN4oak8LZ
 lCedg2OmULD9FYOBxJaOXKVCEBn+x1Yqzw3abwjjre3FNU1kEpKmIo4aZroiwZwqzvdTuu
 oVT+pkZdiWG9Q6Dmy4NXNWMmA/+iwQM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-ge9WOsDMOPir1kJgmhl2Dg-1; Fri, 18 Feb 2022 05:38:50 -0500
X-MC-Unique: ge9WOsDMOPir1kJgmhl2Dg-1
Received: by mail-ej1-f69.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso2850460ejk.17
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 02:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BB3RvaNyELHc5+cbc7+hBFpImVt+dcbvRUKC71NhhxA=;
 b=a/AXJR1A/y8c5T+tBcFZ8SyCTtBpw/90Y8FeBkNSHKL7Sgs+2W/+L9shRKzOliBmvv
 2OjKNCix4PYm2d8V7xVjp6uyfgVIpcZoU2kYAcAZ4d+jD0IDJOpQB8d3S/I8dnJCAqbZ
 NwzNxNpEDLD6BRfr9Tt7o/jFlisQ3nNsSaO2+uuNpGi90iSlw/kdh2qSOnbXD0/g4H84
 JmTT4CyCfxS4Tm/zz/KA5KtJvo69PmjZrgw+p4wfe12zXa3AX81wRUts19fmH8hLLuqw
 RWqVijvazDxA75F7iAWta288J2Wd01lYY6yq2vuL9BAKHD7PvM9lw2PQ3jAtF23FjhEH
 DWzQ==
X-Gm-Message-State: AOAM533hCoLa9sgxuJnbMivZwuVIKUSB377tUeH6PJDqSVLJqxRQp78K
 zpo4si6y+xeY6Ap3TmO3C0a889RWeY0tWPddpaN3izoHSxI/CSW1JOleGmei5Lrql8ICXohR0gx
 lL/7UL3xBddBb557gMtJKf0o0ep2X7rvo
X-Received: by 2002:aa7:c7c4:0:b0:407:52cc:3b32 with SMTP id
 o4-20020aa7c7c4000000b0040752cc3b32mr7361697eds.397.1645180728951; 
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykfGhd50F9wQIvpfwSV02IuVtosrF0JYSvVlOA9FaeEpZTbChuHWqvZILt6ivHs5QKeNBX5w==
X-Received: by 2002:aa7:c7c4:0:b0:407:52cc:3b32 with SMTP id
 o4-20020aa7c7c4000000b0040752cc3b32mr7361656eds.397.1645180728579; 
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id t4sm4835504edd.7.2022.02.18.02.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
Message-ID: <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
Date: Fri, 18 Feb 2022 11:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Emil Velikov <emil.l.velikov@gmail.com>, Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher
 <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_023854_277508_098A65F6 
X-CRM114-Status: GOOD (  33.60  )
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

SGksCgpTb3JyeSBmb3IganVtcGluZyBpbiBpbiB0aGUgbWlkZGxlIG9mIHRoZSB0aHJlYWQgSSBk
aWQKbm90IG5vdGljZSB0aGlzIHRocmVhZCBiZWZvcmUuCgpPbiAyLzE2LzIyIDEzOjAwLCBFbWls
IFZlbGlrb3Ygd3JvdGU6Cj4gT24gVHVlLCAxNSBGZWIgMjAyMiBhdCAxNjozNywgU2ltb24gU2Vy
IDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90ZToKPj4KPj4gT24gVHVlc2RheSwgRmVicnVhcnkg
MTV0aCwgMjAyMiBhdCAxNTozOCwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+Pj4gT24gVHVlLCAxNSBGZWIgMjAyMiBhdCAxMzo1NSwgU2ltb24gU2Vy
IDxjb250YWN0QGVtZXJzaW9uLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIFR1ZXNkYXksIEZlYnJ1
YXJ5IDE1dGgsIDIwMjIgYXQgMTM6MDQsIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21h
aWwuY29tPiB3cm90ZToKPj4+Pgo+Pj4+PiBHcmVldGluZ3MgZXZlcnlvbmUsCj4+Pj4+Cj4+Pj4+
IFBhZHJvbiBmb3Igam9pbmluZyBpbiBzbyBsYXRlIG8vCj4+Pj4+Cj4+Pj4+IE9uIFR1ZSwgOCBG
ZWIgMjAyMiBhdCAwODo0MiwgSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPiB3cm90
ZToKPj4+Pj4+Cj4+Pj4+PiBkcm1fZGV2X3JlZ2lzdGVyKCkgc2V0cyBjb25uZWN0b3ItPnJlZ2lz
dHJhdGlvbl9zdGF0ZSB0bwo+Pj4+Pj4gRFJNX0NPTk5FQ1RPUl9SRUdJU1RFUkVEIGFuZCBkZXYt
PnJlZ2lzdGVyZWQgdG8gdHJ1ZS4gSWYKPj4+Pj4+IGRybV9jb25uZWN0b3Jfc2V0X3BhbmVsX29y
aWVudGF0aW9uKCkgaXMgZmlyc3QgY2FsbGVkIGFmdGVyCj4+Pj4+PiBkcm1fZGV2X3JlZ2lzdGVy
KCksIGl0IHdpbGwgZmFpbCBzZXZlcmFsIGNoZWNrcyBhbmQgcmVzdWx0cyBpbiBmb2xsb3dpbmcK
Pj4+Pj4+IHdhcm5pbmcuCj4+Pj4+Pgo+Pj4+Pj4gQWRkIGEgZnVuY3Rpb24gdG8gY3JlYXRlIHBh
bmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IGFuZCBzZXQgZGVmYXVsdCB2YWx1ZQo+Pj4+Pj4gdG8g
VU5LTk9XTiwgc28gZHJpdmVycyBjYW4gY2FsbCB0aGlzIGZ1bmN0aW9uIHRvIGluaXQgdGhlIHBy
b3BlcnR5IGVhcmxpZXIKPj4+Pj4+ICwgYW5kIGxldCB0aGUgcGFuZWwgc2V0IHRoZSByZWFsIHZh
bHVlIGxhdGVyLgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gVGhlIHdhcm5pbmcgaWxsdXN0cmF0ZXMgYSBn
ZW51aW5lIHJhY2UgY29uZGl0aW9uLCB3aGVyZSB1c2Vyc3BhY2Ugd2lsbAo+Pj4+PiByZWFkIHRo
ZSBvbGQvaW52YWxpZCBwcm9wZXJ0eSB2YWx1ZS9zdGF0ZS4gU28gdGhpcyBwYXRjaCBtYXNrcyBh
d2F5Cj4+Pj4+IHRoZSBXQVJOSU5HIHdpdGhvdXQgYWRkcmVzc2luZyB0aGUgYWN0dWFsIGlzc3Vl
Lgo+Pj4+PiBJbnN0ZWFkIGNhbiB3ZSBmaXggdGhlIHJlc3BlY3RpdmUgZHJpdmVycywgc28gdGhh
dCBubyBwcm9wZXJ0aWVzIGFyZQo+Pj4+PiBjcmVhdGVkIGFmdGVyIGRybV9kZXZfcmVnaXN0ZXIo
KT8KPj4+Pj4KPj4+Pj4gTG9uZ2VyIHZlcnNpb246Cj4+Pj4+IEFzIHdlIGxvb2sgaW50byBkcm1f
ZGV2X3JlZ2lzdGVyKCkgaXQncyBpbiBjaGFyZ2Ugb2YgY3JlYXRpbmcgdGhlCj4+Pj4+IGRldi9z
eXNmcyBub2RlcyAoZXQgYWwpLiBOb3RlIHRoYXQgY29ubmVjdG9ycyBjYW5ub3QgZGlzYXBwZWFy
IGF0Cj4+Pj4+IHJ1bnRpbWUuCj4+Pj4+IEZvciBwYW5lbCBvcmllbnRhdGlvbiwgd2UgYXJlIGNy
ZWF0aW5nIGFuIGltbXV0YWJsZSBjb25uZWN0b3IKPj4+Pj4gcHJvcGVybHksIG1lYW5pbmcgdGhh
dCBhcyBzb29uIGFzIGRybV9kZXZfcmVnaXN0ZXIoKSBpcyBjYWxsZWQgd2UgbXVzdAo+Pj4+PiBl
bnN1cmUgdGhhdCB0aGUgcHJvcGVydHkgaXMgYXZhaWxhYmxlIChpZiBhcHBsaWNhYmxlKSBhbmQg
c2V0IHRvIHRoZQo+Pj4+PiBjb3JyZWN0IHZhbHVlLgo+Pj4+Cj4+Pj4gVW5mb3J0dW5hdGVseSB3
ZSBjYW4ndCBxdWl0ZSBkbyB0aGlzLiBUbyBhcHBseSB0aGUgcGFuZWwgb3JpZW50YXRpb24gcXVp
cmtzIHdlCj4+Pj4gbmVlZCB0byBncmFiIHRoZSBFRElEIG9mIHRoZSBlRFAgY29ubmVjdG9yLCBh
bmQgdGhpcyBoYXBwZW5lZCB0b28gbGF0ZSBpbiBteQo+Pj4+IHRlc3RpbmcuCj4+Pj4KPj4+PiBX
aGF0IHdlIGNhbiBkbyBpcyBjcmVhdGUgdGhlIHByb3AgZWFybHkgZHVyaW5nIG1vZHVsZSBsb2Fk
LCBhbmQgdXBkYXRlIGl0IHdoZW4KPj4+PiB3ZSByZWFkIHRoZSBFRElEIChhdCB0aGUgcGxhY2Ug
d2hlcmUgd2UgY3JlYXRlIGl0IHJpZ2h0IG5vdykuIFVzZXItc3BhY2Ugd2lsbAo+Pj4+IHJlY2Vp
dmUgYSBob3RwbHVnIGV2ZW50IGFmdGVyIHRoZSBFRElEIGlzIHJlYWQsIHNvIHdpbGwgYmUgYWJs
ZSB0byBwaWNrIHVwIHRoZQo+Pj4+IG5ldyB2YWx1ZSBpZiBhbnkuCj4+Pgo+Pj4gRGlkbid0IHF1
aXRlIGdldCB0aGF0LCBhcmUgeW91IHNheWluZyB0aGF0IGEgR0VUUFJPUEVSVFkgZm9yIHRoZSBF
RElELAo+Pj4gdGhlIGlvY3RsIGJsb2NrcyBvciB0aGF0IHdlIGdldCBhbiBlbXB0eSBFRElEPwo+
Pgo+PiBJJ20gbm90IHJlZmVycmluZyB0byBHRVRQUk9QRVJUWSwgSSdtIHJlZmVycmluZyB0byB0
aGUgZHJpdmVyIGdldHRpbmcgdGhlIEVESUQKPj4gZnJvbSB0aGUgc2luayAoaGVyZSwgdGhlIGVE
UCBwYW5lbCkuIEluIG15IGV4cGVyaW1lbnRhdGlvbnMgd2l0aCBhbWRncHUgSQo+PiBub3RpY2Vk
IHRoYXQgdGhlIGRyaXZlciBtb2R1bGUgbG9hZCBmaW5pc2hlZCBiZWZvcmUgdGhlIEVESUQgd2Fz
IGF2YWlsYWJsZSB0bwo+PiB0aGUgZHJpdmVyLiBNYXliZSBvdGhlciBkcml2ZXJzIGJlaGF2ZSBk
aWZmZXJlbnRseSBhbmQgcHJvYmUgY29ubmVjdG9ycyB3aGVuCj4+IGxvYWRlZCwgbm90IHN1cmUu
Cj4+Cj4gSSBzZWUgdGhhbmtzLgo+IAo+Pj4gVGhlIEVESUQgaG90cGx1ZyBldmVuIHRoaW5nIGlz
IG5lYXQgLSBzb3VuZHMgbGlrZSBpdCBhbHNvIHNpZ25hbHMgb24KPj4+IHBhbmVsIG9yaWVudGF0
aW9uLCBjb3JyZWN0Pwo+Pj4gT24gc3VjaCBhbiBldmVudCwgd2hpY2ggcHJvcGVydGllcyB1c2Vy
c3BhY2Ugc2hvdWxkIGJlIHJlLWZldGNoaW5nIC0KPj4+IGV2ZXJ5dGhpbmcgb3IgZ3Vlc3MgcmFu
ZG9tbHk/Cj4+Pgo+Pj4gTG9va2luZyB0aHJvdWdoIHRoZSBkb2N1bWVudGF0aW9uLCBJIGNhbm5v
dCBzZWUgYSBjbGVhciBhbnN3ZXIgOi1cCj4+Cj4+IFVzZXItc3BhY2Ugc2hvdWxkIHJlLWZldGNo
ICphbGwqIHByb3BlcnRpZXMuIEluIHByYWN0aWNlIHNvbWUgdXNlci1zcGFjZSBtYXkKPj4gb25s
eSBiZSBmZXRjaGluZyBzb21lIHByb3BlcnRpZXMsIGJ1dCB0aGF0IHNob3VsZCBnZXQgZml4ZWQg
aW4gdXNlci1zcGFjZS4KPj4KPj4gQWxzbyB0aGUga2VybmVsIGNhbiBpbmRpY2F0ZSB0aGF0IG9u
bHkgYSBzaW5nbGUgY29ubmVjdG9yIGNoYW5nZWQgdmlhIHRoZQo+PiAiQ09OTkVDVE9SIiB1ZXZl
bnQgcHJvcCwgb3IgZXZlbiBhIHNpbmdsZSBjb25uZWN0b3IgcHJvcGVydHkgdmlhICJQUk9QRVJU
WSIuCj4+IFNlZSBbMV0gZm9yIGEgdXNlci1zcGFjZSBpbXBsZW1lbnRhdGlvbi4gQnV0IGFsbCBv
ZiB0aGlzIGlzIHB1cmVseSBhbiBvcHRpb25hbAo+PiBvcHRpbWl6YXRpb24uIFJlLWZldGNoaW5n
IGFsbCBwcm9wZXJ0aWVzIGlzIGEgYml0IHNsb3dlciAoZXNwZWNpYWxseSBpZiBzb21lCj4+IGRy
bU1vZGVHZXRDb25uZWN0b3IgY2FsbHMgZm9yY2UtcHJvYmUgY29ubmVjdG9ycykgYnV0IHdvcmtz
IHBlcmZlY3RseSBmaW5lCgpXaGF0IEknbSByZWFkaW5nIGluIHRoZSBhYm92ZSBpcyB0aGF0IGl0
IGlzIGJlaW5nIGNvbnNpZGVyZWQgdG8gYWxsb3cKY2hhbmdpbmcgdGhlIHBhbmVsLW9yaWVudGF0
aW9uIHZhbHVlIGFmdGVyIHRoZSBjb25uZWN0b3IgaGFzIGJlZW4gbWFkZQphdmFpbGFibGUgdG8g
dXNlcnNwYWNlOyBhbmQgbGV0IHVzZXJzcGFjZSBrbm93IGFib3V0IHRoaXMgdGhyb3VnaCBhIHVl
dmVudC4KCkkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgYSBiYWQgaWRlYSwgaXQgaXMgaW1wb3J0YW50
IHRvIGtlZXAgaW4gbWluZCBoZXJlCndoYXQgdXNlcnNwYWNlIChlLmcuIHBseW1vdXRoKSB1c2Vz
IHRoaXMgcHJvcnR5IGZvci4gVGhpcyBwcm9wZXJ0eSBpcwp1c2VkIHRvIHJvdGF0ZSB0aGUgaW1h
Z2UgYmVpbmcgcmVuZGVyZWQgLyBzaG93biBvbiB0aGUgZnJhbWVidWZmZXIgdG8KYWRqdXN0IGZv
ciB0aGUgcGFuZWwgb3JpZW50YXRpb24uCgpTbyBub3cgbGV0cyBhc3N1bWUgd2UgYXBwbHkgdGhl
IGNvcnJlY3QgdXBzaWRlLWRvd24gb3JpZW50YXRpb24gbGF0ZXIKb24gYSBkZXZpY2Ugd2l0aCBh
biB1cHNpZGUtZG93biBtb3VudGVkIExDRCBwYW5lbC4gVGhlbiBvbiBib290IHRoZQpmb2xsb3dp
bmcgY291bGQgaGFwcGVuOgoKMS4gYW1kZ3B1IGV4cG9ydHMgYSBjb25uZWN0b3IgZm9yIHRoZSBM
Q0QgcGFuZWwgdG8gdXNlcnNwYWNlIHdpdGhvdXQKc2V0dGluZyBwYW5lbC1vcmllbnQ9dXBzaWRl
LWRvd24KMi4gcGx5bW91dGggc2VlcyB0aGlzIGFuZCByZW5kZXJzIGl0cyBzcGxhc2ggbm9ybWFs
bHksIGJ1dCBzaW5jZSB0aGUKcGFuZWwgaXMgdXBzaWRlLWRvd24gaXQgd2lsbCBub3cgYWN0dWFs
bHkgc2hvdyB1cHNpZGUtZG93bgozLiBhbWRncHUgYWRqdXN0cyB0aGUgcGFuZWwtb3JpZW50IHBy
b3AgdG8gdXBzaWRlLWRvd24sIHNlbmRzIG91dAp1ZXZlbnRzCjQuIExldHMgYXNzdW1lIHBseW1v
dXRoIGhhbmRsZXMgdGhpcyB3ZWxsIChpKSBhbmQgbm93IGFkanVzdCBpdHMKcmVuZGVyaW5nIGFu
ZCByZW5kZXJzIHRoZSBuZXh0IGZyYW1lIG9mIHRoZSBib290c3BsYXNoIDE4MMKwIHJvdGF0ZWQK
dG8gY29tcGVuc2F0ZSBmb3IgdGhlIHBhbmVsIGJlaW5nIHVwc2lkZSBkb3duLiBUaGVuIGZyb20g
bm93IG9uCnRoZSB1c2VyIHdpbGwgc2VlIHRoZSBzcGxhc2ggbm9ybWFsbHkKClNvIHRoaXMgbWVh
bnMgdGhhdCB0aGUgdXNlciB3aWxsIGJyaWVmbHkgc2VlIHRoZSBib290c3BsYXNoIHJlbmRlcmVk
CnVwc2lkZSBkb3duIHdoaWNoIElNSE8gaXMgbm90IGFjY2VwdGFibGUgYmVoYXZpb3IuIEFsc28g
c2VlIG15IGZvb3Rub3RlCmFib3V0IGhvdyBJIHNlcmlvdXNseSBkb3VidCBwbHltb3V0aCB3aWxs
IHNlZSB0aGUgcGFuZWwtb3JpZW50IGNoYW5nZQphdCBhbGwuCgpJJ20gYWxzbyBhIGJpdCB1bnN1
cmUgYWJvdXQ6CgphKSBIb3cgeW91IGNhbiByZWdpc3RlciB0aGUgcGFuZWwgY29ubmVjdG9yIHdp
dGggdXNlcnNwYWNlIGJlZm9yZQpyZWFkaW5nIHRoZSBlZGlkLCBkb24ndCB5b3UgbmVlZCB0aGUg
ZWRpZCB0byBnaXZlIHRoZSBwaHlzaWNhbCBzaXplICsKbW9kZWxpbmUgdG8gdXNlcnNwYWNlLCB3
aGljaCB5b3UgY2Fubm90IGp1c3QgbGVhdmUgb3V0ID8KCkkgZ3Vlc3MgdGhlIGluaXRpYWwgbW9k
ZWxpbmUgaXMgaW5oZXJpdGVkIGZyb20gdGhlIHZpZGVvLWJpb3MsIGJ1dAp3aGF0IGFib3V0IHRo
ZSBwaHlzaWNhbCBzaXplPyBOb3RlIHRoYXQgeW91IGNhbm5vdCBqdXN0IGNoYW5nZSB0aGUKcGh5
c2ljYWwgc2l6ZSBsYXRlciBlaXRoZXIsIHRoYXQgZ2V0cyB1c2VkIHRvIGRldGVybWluZSB0aGUg
aGlkcGkKc2NhbGluZyBmYWN0b3IgaW4gdGhlIGJvb3RzcGxhc2gsIGFuZCBjaGFuZ2luZyB0aGF0
IGFmdGVyIHRoZSBpbml0aWFsCmJvb3RzcGxhc2ggZGlzbGF5IHdpbGwgYWxzbyBsb29rIHVnbHkK
CmIpIFdoeSB5b3UgbmVlZCB0aGUgZWRpZCBmb3IgdGhlIHBhbmVsLW9yaWVudGF0aW9uIHByb3Bl
cnR5IGF0IGFsbCwKdHlwaWNhbGx5IHRoZSBlZGlkIHByb20gaXMgcGFydCBvZiB0aGUgcGFuZWwg
YW5kIHRoZSBwYW5lbCBkb2VzIG5vdAprbm93IHRoYXQgaXQgaXMgbW91bnRlZCBlLmcuIHVwc2lk
ZSBkb3duIGF0IGFsbCwgdGhhdCBpcyBhIHByb3BlcnR5Cm9mIHRoZSBzeXN0ZW0gYXMgYSB3aG9s
ZSBub3Qgb2YgdGhlIHBhbmVsIGFzIGEgc3RhbmRhbG9uZSB1bml0IHNvCmluIG15IGV4cGVyaWVu
Y2UgZ2V0dGluZyBwYW5lbC1vcmllbnQgaW5mbyBpcyBzb21ldGhpbmcgd2hpY2ggY29tZXMKZnJv
bSB0aGUgZmlybXdhcmUgL3ZpZGVvLWJpb3Mgbm90IGZyb20gZWRpZCA/CgpSZWdhcmRzLAoKSGFu
cwoKCgppKSBJIGRvbid0IHRoaW5rIHBseW1vdXRoIHdpbGwgaGFuZGxlIHRoaXMgd2VsbCB0aG91
Z2gsIHNpbmNlIGl0IHRyaWVzIHRvCnNraXAgdW5jaGFuZ2VkIGNvbm5lY3RvcnMgYW5kIEkgYmVs
aWV2ZSBpdCBvbmx5IGNoZWNrcyB0aGUgY3J0YyByb3V0aW5nICsKcHJlZmVycmVkIG1vZGVsaW5l
IHRvIGRldGVybWluZSAidW5jaGFuZ2VkIi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
