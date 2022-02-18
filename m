Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HInDO4ZxKwUzCUTyRxrG55COvjrul7fJYaqSFP7ZWN0=; b=pciQw2fcx+K9iw
	G2q4T4gi8tEkV+E8nOfBniWjquXrmmQclETxMQN36c3a1OD35rLC+6OjjUecfuRrAhBllIWA6WWkg
	DHeM+EWRVT0cZ/Dij9Ss0nhq7wGy9KCBojJWAp1rpOyMhydaiyzf9WMaj93qFi9CDlrdbw9j/sqiV
	8UV8LYdafHrTXsjsnyYaIxqt0txK8k5nL4iWjCaJx/SAx388XXbSz+gE1kAbyUprYJkwkYC919wLT
	vXGFBmLLsFhhwFUqkC4HWyqQxaC5ANF5NvCOAMkE04AFeZlIxGFLYeF0BxLlEUyKoCype8ZTwqT3A
	YhGTNFxGJ1gRRnpvuYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL2kE-00EK4O-Hj; Fri, 18 Feb 2022 12:52:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1qU-00E6If-4q
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 11:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645185281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU73Lo7l6hbSvjkFhO1EujONMpX8Sskgkmm1GL0ixLg=;
 b=UDlHwW55KWkEhNCOV8g/QQ6ozSbCIjz5SBeHVw8qZYLxnkHowGUvF8YWcVIJTvirsdqr+L
 LfehSL3djJPsSoBnwcUkXpHlR/1AQLaWlEUsg2irrIGvQD/hjqbSiYnKGQdnj1JZhgImT6
 p3U7fGNXGt3Pn4T7IF/X+bI6WZd6OI4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-yeguChehMhaXagjig8eldg-1; Fri, 18 Feb 2022 06:54:39 -0500
X-MC-Unique: yeguChehMhaXagjig8eldg-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa30-20020a170907869e00b006cee5e080easo2934055ejc.3
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 03:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZU73Lo7l6hbSvjkFhO1EujONMpX8Sskgkmm1GL0ixLg=;
 b=XIRJBnyUeFEzPq/dLo1rTNwiOKzMKxpU+RBZpRZYZBKY00W9gMAZSPIf/KyxvwuEGP
 +JC0iNxWRoh2pwSD3lhl+kJ6dU/RjgYdKiaTxEw8QE8J0XZwLaWr80lYE4WpxvYePJs0
 uIbso97YRsNjNlx6OIZPqAGhscfvBpQZDkleIdTnZKWkt1LY+Qww5nfyLpqryQUi4kHV
 YTMiCIPC6ucHMB9lJh/2osYh6KzdzPtu7IA6SJIwf+cQP8diJIZlPoroe6lTgQcpKf5x
 g5L2WAvlhLWfo55xK8Un6RILC9l09CHX1PUFSTnYTv4kapNiWC/yzhdqYNOdvToIEPZi
 sDMQ==
X-Gm-Message-State: AOAM533g8XVL+XWMrULpNrAeUZoL87aF6FRe6bzOFj9i1C/lX81QNML2
 mHw4Y8oj6OjTog4gMobJVIr0KDzEXLjrkeqcNZxRgGZQ1c7MG0+P8XM9uPTdi1OS84OTArRpguS
 fpmhcjiUdqDJmqqwkf8RQ3UGXOry1cApu
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr7904623ede.404.1645185278656; 
 Fri, 18 Feb 2022 03:54:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKC5xUwcjHlFIGoyRJN0JH+XVQBj7pZ69Bxv7eGGxHiHW08opExAMFa04qBDUF8/KvyA07hw==
X-Received: by 2002:a50:9d89:0:b0:410:ff04:5a98 with SMTP id
 w9-20020a509d89000000b00410ff045a98mr7904604ede.404.1645185278370; 
 Fri, 18 Feb 2022 03:54:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id s15sm2197882ejj.84.2022.02.18.03.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 03:54:37 -0800 (PST)
Message-ID: <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
Date: Fri, 18 Feb 2022 12:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
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
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
 <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_035442_318262_420BDFE2 
X-CRM114-Status: GOOD (  38.74  )
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

SGksCgpPbiAyLzE4LzIyIDEyOjM5LCBTaW1vbiBTZXIgd3JvdGU6Cj4gT24gRnJpZGF5LCBGZWJy
dWFyeSAxOHRoLCAyMDIyIGF0IDExOjM4LCBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPiB3cm90ZToKPiAKPj4gV2hhdCBJJ20gcmVhZGluZyBpbiB0aGUgYWJvdmUgaXMgdGhhdCBp
dCBpcyBiZWluZyBjb25zaWRlcmVkIHRvIGFsbG93Cj4+IGNoYW5naW5nIHRoZSBwYW5lbC1vcmll
bnRhdGlvbiB2YWx1ZSBhZnRlciB0aGUgY29ubmVjdG9yIGhhcyBiZWVuIG1hZGUKPj4gYXZhaWxh
YmxlIHRvIHVzZXJzcGFjZTsgYW5kIGxldCB1c2Vyc3BhY2Uga25vdyBhYm91dCB0aGlzIHRocm91
Z2ggYSB1ZXZlbnQuCj4+Cj4+IEkgYmVsaWV2ZSB0aGF0IHRoaXMgaXMgYSBiYWQgaWRlYSwgaXQg
aXMgaW1wb3J0YW50IHRvIGtlZXAgaW4gbWluZCBoZXJlCj4+IHdoYXQgdXNlcnNwYWNlIChlLmcu
IHBseW1vdXRoKSB1c2VzIHRoaXMgcHJvcnR5IGZvci4gVGhpcyBwcm9wZXJ0eSBpcwo+PiB1c2Vk
IHRvIHJvdGF0ZSB0aGUgaW1hZ2UgYmVpbmcgcmVuZGVyZWQgLyBzaG93biBvbiB0aGUgZnJhbWVi
dWZmZXIgdG8KPj4gYWRqdXN0IGZvciB0aGUgcGFuZWwgb3JpZW50YXRpb24uCj4+Cj4+IFNvIG5v
dyBsZXRzIGFzc3VtZSB3ZSBhcHBseSB0aGUgY29ycmVjdCB1cHNpZGUtZG93biBvcmllbnRhdGlv
biBsYXRlcgo+PiBvbiBhIGRldmljZSB3aXRoIGFuIHVwc2lkZS1kb3duIG1vdW50ZWQgTENEIHBh
bmVsLiBUaGVuIG9uIGJvb3QgdGhlCj4+IGZvbGxvd2luZyBjb3VsZCBoYXBwZW46Cj4+Cj4+IDEu
IGFtZGdwdSBleHBvcnRzIGEgY29ubmVjdG9yIGZvciB0aGUgTENEIHBhbmVsIHRvIHVzZXJzcGFj
ZSB3aXRob3V0Cj4+IHNldHRpbmcgcGFuZWwtb3JpZW50PXVwc2lkZS1kb3duCj4+IDIuIHBseW1v
dXRoIHNlZXMgdGhpcyBhbmQgcmVuZGVycyBpdHMgc3BsYXNoIG5vcm1hbGx5LCBidXQgc2luY2Ug
dGhlCj4+IHBhbmVsIGlzIHVwc2lkZS1kb3duIGl0IHdpbGwgbm93IGFjdHVhbGx5IHNob3cgdXBz
aWRlLWRvd24KPiAKPiBBdCB0aGlzIHBvaW50IGFtZGdwdSBoYXNuJ3QgcHJvYmVkIHRoZSBjb25u
ZWN0b3IgeWV0LiBTbyB0aGUgY29ubmVjdG9yCj4gd2lsbCBiZSBtYXJrZWQgYXMgZGlzY29ubmVj
dGVkLCBhbmQgcGx5bW91dGggc2hvdWxkbid0IHJlbmRlciBhbnl0aGluZy4KCklmIGJlZm9yZSB0
aGUgaW5pdGlhbCBwcm9iZSBvZiB0aGUgY29ubmVjdG9yIHRoZXJlIGlzIGEgL2Rldi9kcmkvY2Fy
ZDAgCndoaWNoIHBseW1vdXRoIGNhbiBhY2Nlc3MsIHRoZW4gcGx5bW91dGggbWF5IGF0IHRoaXMg
cG9pbnQgZGVjaWRlCnRvIGRpc2FibGUgYW55IHNlZW1pbmdseSB1bnVzZWQgY3J0Y3MsIHdoaWNo
IHdpbGwgbWFrZSB0aGUgc2NyZWVuIGdvIGJsYWNrLi4uCgpJJ20gbm90IHN1cmUgaWYgcGx5bW91
dGggd2lsbCBhY3R1YWxseSBkbyB0aGlzLCBidXQgQUZBSUNUIHRoaXMgd291bGQKbm90IGJlIGlu
dmFsaWQgYmVoYXZpb3IgZm9yIGEgdXNlcnNwYWNlIGttcyBjb25zdW1lciB0byBkbyBhbmQgSQpi
ZWxpZXZlIGl0IGlzIGxpa2VseSB0aGF0IG11dHRlciB3aWxsIGRpc2FibGUgdW51c2VkIGNydGNz
LgoKSU1ITyBpdCBpcyBqdXN0IGEgYmFkIGlkZWEgdG8gcmVnaXN0ZXIgL2Rldi9kcmkvY2FyZDAg
d2l0aCB1c2Vyc3BhY2UKYmVmb3JlIHRoZSBpbml0aWFsIGNvbm5lY3RvciBwcm9iZSBpcyBkb25l
LiBOb3RoaW5nIGdvb2QgY2FuIGNvbWUKb2YgdGhhdC4KCklmIGFsbCB0aGUgZXhwb3NlZCBjb25u
ZWN0b3JzIGluaXRpYWxseSBhcmUgZ29pbmcgdG8gc2hvdyB1cCBhcwpkaXNjb25uZWN0ZWQgYW55
d2F5cyB3aGF0IGlzIHRoZSB2YWx1ZSBpbiByZWdpc3RlcmluZyAvZGV2L2RyaS9jYXJkMAp3aXRo
IHVzZXJzcGFjZSBlYXJseSA/Cgo+PiAzLiBhbWRncHUgYWRqdXN0cyB0aGUgcGFuZWwtb3JpZW50
IHByb3AgdG8gdXBzaWRlLWRvd24sIHNlbmRzIG91dAo+PiB1ZXZlbnRzCj4gCj4gVGhhdCdzIHdo
ZW4gYW1kZ3B1IG1hcmtzIHRoZSBjb25uZWN0b3IgYXMgY29ubmVjdGVkLiBTbyBldmVyeXRoaW5n
Cj4gc2hvdWxkIGJlIGZpbmUgSSBiZWxpZXZlLCBubyBiYWQgZnJhbWUuCgpTZWUgYWJvdmUuCgo+
PiA0LiBMZXRzIGFzc3VtZSBwbHltb3V0aCBoYW5kbGVzIHRoaXMgd2VsbCAoaSkgYW5kIG5vdyBh
ZGp1c3QgaXRzCj4+IHJlbmRlcmluZyBhbmQgcmVuZGVycyB0aGUgbmV4dCBmcmFtZSBvZiB0aGUg
Ym9vdHNwbGFzaCAxODDCsCByb3RhdGVkCj4+IHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBwYW5lbCBi
ZWluZyB1cHNpZGUgZG93bi4gVGhlbiBmcm9tIG5vdyBvbgo+PiB0aGUgdXNlciB3aWxsIHNlZSB0
aGUgc3BsYXNoIG5vcm1hbGx5Cj4+Cj4+IFNvIHRoaXMgbWVhbnMgdGhhdCB0aGUgdXNlciB3aWxs
IGJyaWVmbHkgc2VlIHRoZSBib290c3BsYXNoIHJlbmRlcmVkCj4+IHVwc2lkZSBkb3duIHdoaWNo
IElNSE8gaXMgbm90IGFjY2VwdGFibGUgYmVoYXZpb3IuIEFsc28gc2VlIG15IGZvb3Rub3RlCj4+
IGFib3V0IGhvdyBJIHNlcmlvdXNseSBkb3VidCBwbHltb3V0aCB3aWxsIHNlZSB0aGUgcGFuZWwt
b3JpZW50IGNoYW5nZQo+PiBhdCBhbGwuCj4+Cj4+IEknbSBhbHNvIGEgYml0IHVuc3VyZSBhYm91
dDoKPj4KPj4gYSkgSG93IHlvdSBjYW4gcmVnaXN0ZXIgdGhlIHBhbmVsIGNvbm5lY3RvciB3aXRo
IHVzZXJzcGFjZSBiZWZvcmUKPj4gcmVhZGluZyB0aGUgZWRpZCwgZG9uJ3QgeW91IG5lZWQgdGhl
IGVkaWQgdG8gZ2l2ZSB0aGUgcGh5c2ljYWwgc2l6ZSArCj4+IG1vZGVsaW5lIHRvIHVzZXJzcGFj
ZSwgd2hpY2ggeW91IGNhbm5vdCBqdXN0IGxlYXZlIG91dCA/Cj4gCj4gWXVwLiBUaGUgS01TIEVE
SUQgcHJvcGVydHkgaXMgY3JlYXRlZCBiZWZvcmUgdGhlIEVESUQgaXMgcmVhZCwgYW5kIGlzIHNl
dAo+IHRvIHplcm8gKE5VTEwgYmxvYikuIFRoZSB3aWR0aC9oZWlnaHQgaW4gbW0gYW5kIG90aGVy
IGluZm8gYXJlIGFsc28gemVyby4KPiBZb3UgY2FuIHRyeSBpbnNwZWN0aW5nIHRoZSBzdGF0ZSBw
cmludGVkIGJ5IGRybV9pbmZvIG9uIGFueSBkaXNjb25uZWN0ZWQKPiBjb25uZWN0b3IgdG8gc2Vl
IGZvciB5b3Vyc2VsZi4KClJpZ2h0LCBJIG1pc3NlZCB0aGUgZGV0YWlsIGhhdCB0aGUgY29ubmVj
dG9yIGlzIGluaXRpYWxseSBtYXJrZWQgYXMKZGlzY29ubmVjdGVkLiBUaGF0IHNvbHZlcyB0aGUg
aXNzdWUgb2YgaW52YWxpZCBwYW5lbC1vcmllbnQgLyBtb2RlIC8KZHBpIGluZm8sIGJpdCBpdCBv
cGVucyB1cCBvdGhlciBwcm9ibGVtcy4KCj4+IEkgZ3Vlc3MgdGhlIGluaXRpYWwgbW9kZWxpbmUg
aXMgaW5oZXJpdGVkIGZyb20gdGhlIHZpZGVvLWJpb3MsIGJ1dAo+PiB3aGF0IGFib3V0IHRoZSBw
aHlzaWNhbCBzaXplPyBOb3RlIHRoYXQgeW91IGNhbm5vdCBqdXN0IGNoYW5nZSB0aGUKPj4gcGh5
c2ljYWwgc2l6ZSBsYXRlciBlaXRoZXIsIHRoYXQgZ2V0cyB1c2VkIHRvIGRldGVybWluZSB0aGUg
aGlkcGkKPj4gc2NhbGluZyBmYWN0b3IgaW4gdGhlIGJvb3RzcGxhc2gsIGFuZCBjaGFuZ2luZyB0
aGF0IGFmdGVyIHRoZSBpbml0aWFsCj4+IGJvb3RzcGxhc2ggZGlzbGF5IHdpbGwgYWxzbyBsb29r
IHVnbHkKPj4KPj4gYikgV2h5IHlvdSBuZWVkIHRoZSBlZGlkIGZvciB0aGUgcGFuZWwtb3JpZW50
YXRpb24gcHJvcGVydHkgYXQgYWxsLAo+PiB0eXBpY2FsbHkgdGhlIGVkaWQgcHJvbSBpcyBwYXJ0
IG9mIHRoZSBwYW5lbCBhbmQgdGhlIHBhbmVsIGRvZXMgbm90Cj4+IGtub3cgdGhhdCBpdCBpcyBt
b3VudGVkIGUuZy4gdXBzaWRlIGRvd24gYXQgYWxsLCB0aGF0IGlzIGEgcHJvcGVydHkKPj4gb2Yg
dGhlIHN5c3RlbSBhcyBhIHdob2xlIG5vdCBvZiB0aGUgcGFuZWwgYXMgYSBzdGFuZGFsb25lIHVu
aXQgc28KPj4gaW4gbXkgZXhwZXJpZW5jZSBnZXR0aW5nIHBhbmVsLW9yaWVudCBpbmZvIGlzIHNv
bWV0aGluZyB3aGljaCBjb21lcwo+PiBmcm9tIHRoZSBmaXJtd2FyZSAvdmlkZW8tYmlvcyBub3Qg
ZnJvbSBlZGlkID8KPiAKPiBUaGlzIGlzIGFuIGludGVybmFsIERSTSB0aGluZy4gVGhlIG9yaWVu
dGF0aW9uIHF1aXJrcyBsb2dpYyB1c2VzIHRoZQo+IG1vZGUgc2l6ZSBhZHZlcnRpc2VkIGJ5IHRo
ZSBFRElELgoKVGhlIERNSSBiYXNlZCBxdWlya2luZyBkb2VzLCB5ZXMuIEJ1dCBlLmcuIHRoZSBx
dWlyayBjb2RlIGRpcmVjdGx5CnJlYWRpbmcgdGhpcyBmcm9tIHRoZSBJbnRlbCBWQlQgZG9lcyBu
b3QgcmVseSBvbiB0aGUgbW9kZS4KCkJ1dCBpZiB5b3UgYXJlIHBsYW5uaW5nIG9uIHVzaW5nIGEg
RE1JIGJhc2VkIHF1aXJrIGZvciB0aGUgc3RlYW1kZWNrCnRoZW4geWVzIHRoYXQgbmVlZHMgdGhl
IG1vZGUuCgpUaGVlIG1vZGUgY2hlY2sgaXMgdGhlcmUgZm9yIDIgcmVhc29uczoKCjEuIFRvIGF2
b2lkIGFsc28gYXBwbHlpbmcgdGhlIHF1aXJrIHRvIGV4dGVybmFsIGRpc3BsYXlzLCBidXQKSSB0
aGluayB0aGF0IHRoYXQgaXMgYWxzbyBzb2x2ZWQgaW4gbW9zdCBkcml2ZXJzIGJ5IG9ubHkgY2hl
Y2tpbmcgZm9yCmEgcXVpcmsgYXQgYWxsIG9uIHRoZSBlRFAgY29ubmVjdG9yCgoyLiBTb21lIGxh
cHRvcCBtb2RlbHMgc2hpcCB3aXRoIGRpZmZlcmVudCBwYW5lbHMgaW4gZGlmZmVyZW50IGJhZGdl
cwpzb21lIG9mIHRoZXNlIGFyZSBwb3J0cmFpdCAoc28gbmVlZCBhIHBhbmVsLW9yaWVudCkgc2V0
dGluZyBhbmQgb3RoZXJzCmFyZSBsYW5kc2NhcGUuCgo+IEkgYWdyZWUgdGhhdCBhdCBsZWFzdCBp
biB0aGUgU3RlYW0KPiBEZWNrIGNhc2UgaXQgbWF5IG5vdCBtYWtlIGEgbG90IG9mIHNlbnNlIHRv
IHVzZSBhbnkgaW5mbyBmcm9tIHRoZQo+IEVESUQsIGJ1dCB0aGF0J3MgbmVlZGVkIGZvciB0aGUg
Y3VycmVudCBzdGF0dXMgcXVvLgoKV2UgY291bGQgZXh0ZW5kIHRoZSBETUkgcXVpcmsgbWVjaGFu
aXNtIHRvIGFsbG93IHF1aXJrcyB3aGljaCBkb24ndApkbyB0aGUgbW9kZSBjaGVjaywgZm9yIHVz
ZSBvbiBkZXZpY2VzIHdoZXJlIHdlIGNhbiBndWFyYW50ZWUgbmVpdGhlcgoxIG5vciAyIGhhcHBl
bnMsIHRoZW4gYW1kZ3B1IGNvdWxkIGNhbGwgdGhlIHF1aXJrIGNvZGUgZWFybHkgc2ltcGx5CnBh
c3NpbmcgMHgwIGFzIHJlc29sdXRpb24uCgo+IEFsc28gbm90ZSwgRGlzcGxheUlEIGhhcyBhIGJp
dCB0byBpbmRpY2F0ZSB0aGUgcGFuZWwgb3JpZW50YXRpb24gSUlSQy4KPiBXb3VsZCBiZSBuaWNl
IHRvIHN1cHBvcnQgcGFyc2luZyB0aGlzIGF0IHNvbWUgcG9pbnQuCgpBY2suCgpSZWdhcmRzLAoK
SGFucwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
