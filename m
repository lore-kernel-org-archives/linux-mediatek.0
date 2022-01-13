Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F84C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCkq4DgARgD4D/2UuKFVU0tH6II0btQ+4jZxNMaU1kw=; b=nATbDBneMtktX1
	eJYAl9POg6UXDaawmCwdfvkgHZK/wM6MUi4FxWmdXOahbWPsRI1cU3+DYv4tb6iXfomkmAUvDIbSq
	8qdwMRv+0YmbQyOvz2I0fURST/N2qShw4KLLKDSM0wd6YovjgtchW5xVyxtU/O1IK4fh8Fvs5bBR1
	ehPB9+mOIybZx320I5nIZnszw5Pe2+FacsFYGgFcFlBG7kaM6ciHM5r9Z41BbhyU72OeNAOcLuQT8
	9umLddplryfVp5X29URxAnR7GuWzI3Cl8YkHbXpCDniR3lFi+pTJ9Q9qVFu7+yvTrK8Y6QOD5+RvV
	zKRMXfnZ+PeJdYNVnYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n89Uy-007HU4-QF; Thu, 13 Jan 2022 23:27:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n89Um-007HR0-A5
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 23:27:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id b14so6441535lff.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Jan 2022 15:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Br5WfYiTc37TH3IA3cWwwQvBdeV/BPdpfjqxoTbjUg8=;
 b=W5TpqtMMfX5D0g3MqtnYghqkOFySoHX8V7Y3CDIEk/QzE1qbCwAEJgPpiJrTJPckV+
 6N2Vqv9WJ3XylOrXOadOYeXgV1y464f5VNQVaG+8o2Glkx36tVcTGtTSSygXE9SjYxv1
 RnoyaBK5nCwB6EOFL7/mwCLnckkE1s60MGfxHeQCmCJhhJZOBIv+VRduC1HOrb6bkNsL
 FVwFtXFQXUD8Gx/cQQ5XhZOwds/VF/zUQ0OARSiZM0Xy9Ppb3w6T0wwLrYPxiySAyUbE
 20XLOCa+lmlXMZ8C2ul6MEW+k28ADcena2T1vx5h/MaIhRGddm0bLJivZ074kU2ydzvf
 0q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Br5WfYiTc37TH3IA3cWwwQvBdeV/BPdpfjqxoTbjUg8=;
 b=nka8UROv2DTUY8LdZ+nCJXxacSLSDDfwLTOWGc6mTtvIE1j5mEEtFj5GSOtIpvwNJX
 GtpgbRDReJ/fPiGo8xFSX/RUCuWh+dBeWlmTi0QPujbkkxmvM6E6WmbousAn6ZAwU5mf
 yjUAUOiXuI9Tvjv9qapm/J7Vg1tH3azpR6iLF7Q09g3M1jkvQHI3r+rARkMC4qnyv7Nf
 iRjew8lNLqGdo1bRywhgltXVt0qfkcRsvAWB20wfOnWEI484ZkmJGHC8zAyeFmTuZtgG
 4KO7+WDeyGPv4pOQ12ScNpceUPxveN2HEGWe7z216oLPy+Wm3eeZzAe1JGFikPxr9sRj
 QsKA==
X-Gm-Message-State: AOAM533XeVk1op+wPxjHIoSaKNbTDMg4jZ68ECSBnmwtY4Ker3cNP8Fs
 hRgzebK/EyS+jHvpU7wYrbQ1RN7/ABZEpCktxpVF4w==
X-Google-Smtp-Source: ABdhPJxQ6vukwqgYAso2HtDl4olPJlAPhHEDkugkY9sHGK03iZx+0X4RXJF67ZQjXjdGFfz53L/S+5nppyW0SRY2Ae4=
X-Received: by 2002:a2e:9346:: with SMTP id m6mr4880056ljh.130.1642116419137; 
 Thu, 13 Jan 2022 15:26:59 -0800 (PST)
MIME-Version: 1.0
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
 <e657f5257cbf4955817b0bbf037de9f9@intel.com>
 <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
In-Reply-To: <24157767-dc29-bbdd-5428-d89ecc6b9606@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 13 Jan 2022 15:26:47 -0800
Message-ID: <CALAqxLXRtYDNQ8y1efVGa4SwUH_oAaHviZFjsOVSNFmUHnCCeQ@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>, 
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>, 
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "lmark@codeaurora.org" <lmark@codeaurora.org>, 
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, 
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "labbott@redhat.com" <labbott@redhat.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>, 
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_152704_384542_EB975BC8 
X-CRM114-Status: GOOD (  19.39  )
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

T24gVGh1LCBKYW4gMTMsIDIwMjIgYXQgNTowNSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+IEFtIDEzLjAxLjIyIHVtIDE0OjAwIHNjaHJpZWIg
UnVobCwgTWljaGFlbCBKOgo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJv
bTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9u
IEJlaGFsZiBPZgo+ID4+IFJ1aGwsIE1pY2hhZWwgSgo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mCj4gPj4+IGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsu
Y29tCj4gPj4+ICsgICAvKgo+ID4+PiArICAgICogSW52YWxpZCBzaXplIGNoZWNrLiBUaGUgImxl
biIgc2hvdWxkIGJlIGxlc3MgdGhhbiB0b3RhbHJhbS4KPiA+Pj4gKyAgICAqCj4gPj4+ICsgICAg
KiBXaXRob3V0IHRoaXMgY2hlY2ssIG9uY2UgdGhlIGludmFsaWQgc2l6ZSBhbGxvY2F0aW9uIHJ1
bnMgb24gYSBwcm9jZXNzCj4gPj4+IHRoYXQKPiA+Pj4gKyAgICAqIGNhbid0IGJlIGtpbGxlZCBi
eSBPT00gZmxvdyhzdWNoIGFzICJncmFsbG9jIiBvbiBBbmRyb2lkIGRldmljZXMpLCBpdAo+ID4+
PiB3aWxsCj4gPj4+ICsgICAgKiBjYXVzZSBhIGtlcm5lbCBleGNlcHRpb24sIGFuZCB0byBtYWtl
IG1hdHRlcnMgd29yc2UsIHdlIGNhbid0IGZpbmQKPiA+Pj4gd2hvIGFyZSB1c2luZwo+ID4+PiAr
ICAgICogc28gbWFueSBtZW1vcnkgd2l0aCAiZG1hX2J1Zl9kZWJ1Z19zaG93IiBzaW5jZSB0aGUg
cmVsZXZhbnQKPiA+Pj4gZG1hLWJ1ZiBoYXNuJ3QgZXhwb3J0ZWQuCj4gPj4+ICsgICAgKi8KPiA+
Pj4gKyAgIGlmIChsZW4gPj4gUEFHRV9TSElGVCA+IHRvdGFscmFtX3BhZ2VzKCkpCj4gPj4gSWYg
eW91ciAiaGVhcCIgaXMgZnJvbSBjbWEsIGlzIHRoaXMgc3RpbGwgYSB2YWxpZCBjaGVjaz8KPiA+
IEFuZCB0aGlua2luZyBhIGJpdCBmdXJ0aGVyLCBpZiBJIGNyZWF0ZSBhIGhlYXAgZnJvbSBzb21l
dGhpbmcgZWxzZSAoc2F5IGRldmljZSBtZW1vcnkpLAo+ID4geW91IHdpbGwgbmVlZCB0byBiZSBh
YmxlIHRvIGZpZ3VyZSBvdXQgdGhlIG1heGltdW0gYWxsb3dhYmxlIGNoZWNrIGZvciB0aGUgc3Bl
Y2lmaWMKPiA+IGhlYXAuCj4gPgo+ID4gTWF5YmUgdGhlIGhlYXAgbmVlZHMgYSBjYWxsYmFjayBm
b3IgbWF4IHNpemU/Cj4KPiBXZWxsIHdlIGN1cnJlbnRseSBtYWludGFpbiBhIHNlcGFyYXRlIGFs
bG9jYXRvciBhbmQgZG9uJ3QgdXNlIGRtYS1oZWFwLAo+IGJ1dCB5ZXMgd2UgaGF2ZSBzeXN0ZW1z
IHdpdGggMTZHaUIgZGV2aWNlIGFuZCBvbmx5IDhHaUIgc3lzdGVtIG1lbW9yeSBzbwo+IHRoYXQg
Y2hlY2sgaGVyZSBpcyBjZXJ0YWlubHkgbm90IGNvcnJlY3QuCgpHb29kIHBvaW50LgoKPiBJbiBn
ZW5lcmFsIEkgd291bGQgcmF0aGVyIGxldCB0aGUgc3lzdGVtIHJ1biBpbnRvIC1FTk9NRU0gb3Ig
LUVJTlZBTAo+IGZyb20gdGhlIGFsbG9jYXRvciBpbnN0ZWFkLgoKUHJvYmFibHkgdGhlIHNpbXBs
ZXIgc29sdXRpb24gaXMgdG8gcHVzaCB0aGUgYWxsb2NhdGlvbiBjaGVjayB0byB0aGUKaGVhcCBk
cml2ZXIsIHJhdGhlciB0aGFuIGRvaW5nIGl0IGF0IHRoZSB0b3AgbGV2ZWwgaGVyZS4KCkZvciBD
TUEgb3Igb3RoZXIgY29udGlndW91cyBoZWFwcywgbGV0dGluZyB0aGUgYWxsb2NhdG9yIGZhaWwg
aXMgZmFzdAplbm91Z2guIEZvciBub25jb250aWd1b3VzIGJ1ZmZlcnMsIGxpa2UgdGhlIHN5c3Rl
bSBoZWFwLCB0aGUKYWxsb2NhdGlvbiBjYW4gYnVybiBhIGxvdCBvZiB0aW1lIGFuZCBjb25zdW1l
IGEgbG90IG9mIG1lbW9yeSAoY2F1c2luZwpvdGhlciB0cm91YmxlKSBiZWZvcmUgYSBsYXJnZSBh
bGxvY2F0aW9uIG1pZ2h0IG5hdHVyYWxseSBmYWlsLgoKdGhhbmtzCi1qb2huCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
