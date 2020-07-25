Return-Path: <SRS0=Q1uE=BE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AE6C433E3
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:51:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 321302070C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 03:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbXBNXmX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2KEh7Tp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 321302070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nb6j4xliLAwMrT12p2WjaNA1LZ8lchPf4iwaLkLdqLw=; b=CbXBNXmXL0w10z6aArcN/gOG9
	0ylZS2CDYxYD3flKKTC9ehhaEVW9v6imO4u9rZ2XZIzzzVAbeVhd+7hsQNfxCBePTsnms/yCRmYDQ
	uzt9uUHXi5qUYze6dKvxRPhATPEYbPBjfV5kPj89GPQ8GWtOED/jpJNuZwJDxFaqXr4glVO6nJjSG
	9TvTkAbqS7VsQnCoG4FA7bGbjUU98+qhT6M3owhz/xKLXklzNJ5d0jIagR4JHApRN+tRiER7q4dBd
	px2lfqZOH+Nzco9Eh6IR5jY9iCGcVQDrcGgGfyDhXhH2QRUqPWiAlBcbFgAS2JeWS+f2zdf4mIVgV
	KAKiWEyAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzBDI-000671-H8; Sat, 25 Jul 2020 03:51:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzBDE-000663-77; Sat, 25 Jul 2020 03:51:05 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5C7F20759;
 Sat, 25 Jul 2020 03:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595649063;
 bh=IB/6QMM3mNcLq0yp3daj3De1omfUDNO/kHLqyEhsa6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K2KEh7TpNnF0mxAAYCqLboKVGglNo3SHCYHfljAe0xUta6Iitan62CbCecjxUdHwG
 HXBphKcfLkHGOOtCm8zoVgCHNZ2F3SrYMMzB+yes4gHO1K41s2zWEp/P/TaiTzKW6+
 AvVEhpyF9jSOP3gHlxMV12o5Wbs1AflrT4CHiD8Q=
Received: by mail-ej1-f49.google.com with SMTP id dk23so9509ejb.11;
 Fri, 24 Jul 2020 20:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM5327Mau0x/1zUAU5h2dkvVXqNtcQ1wO0jmS8Bqh8YuUn2E9gfMmk
 LM7QUClJZDRQMw+mOQmKR/EkFv7dNgloxzhNwg==
X-Google-Smtp-Source: ABdhPJxcx4pKWckZ+ivOQWgliPqjd8Cxz0hiophWU1IPuWMgAOcngrm0sm/OsQ7JYpawO3hTDs8v8meuDWYVWGhBJ0k=
X-Received: by 2002:a17:906:7857:: with SMTP id
 p23mr10925441ejm.260.1595649061371; 
 Fri, 24 Jul 2020 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Jul 2020 11:50:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9jsunT=PH59yrJ=q_uPM83WVH1m4c379APCUOGL3ZjdQ@mail.gmail.com>
Message-ID: <CAAOTY_9jsunT=PH59yrJ=q_uPM83WVH1m4c379APCUOGL3ZjdQ@mail.gmail.com>
Subject: Re: [v7, PATCH 6/7] drm/mediatek: add fifo_size into rdma private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_235104_437866_290F67C4 
X-CRM114-Status: GOOD (  22.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIHByaW1hcnkgdGhpbmcgb2YgdGhpcyBwYXRjaCBpcyB0byBnZXQgZmlmbyBzaXplIGZyb20g
ZGV2aWNlIHRyZWUuClNvIHlvdSBtYXkgbW9kaWZ5IHRpdGxlIHRvIHNob3cgdGhlIHByaW1hcnkg
dGhpbmcuCgpZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g5pa8IDIw
MjDlubQ35pyIMjPml6Ug6YCx5ZubIOS4iuWNiDEwOjEy5a+r6YGT77yaCj4KPiB0aGUgZmlmbyBz
aXplIG9mIHJkbWEgaW4gbXQ4MTgzIGlzIGRpZmZlcmVudC4KPiByZG1hMCBmaWZvIHNpemUgaXMg
NWsKPiByZG1hMSBmaWZvIHNpemUgaXMgMmsKCkkgd291bGQgbGlrZSB0aGUgZGVzY3JpcHRpb24g
dG8gYmUgIkdldCB0aGUgZmlmbyBzaXplIGZyb20gZGV2aWNlIHRyZWUKYmVjYXVzZSBlYWNoIHJk
bWEgaW4gdGhlIHNhbWUgU29DIG1heSBoYXZlIGRpZmZlcmVudCBmaWZvIHNpemUuIgoKUmVnYXJk
cywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX3JkbWEuYyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYwo+IGluZGV4IGUwNDMxOWYuLjc5NGFjYzUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBAQCAtNjMsNiArNjMsNyBAQCBz
dHJ1Y3QgbXRrX2Rpc3BfcmRtYSB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAg
ICAgICAgIGRkcF9jb21wOwo+ICAgICAgICAgc3RydWN0IGRybV9jcnRjICAgICAgICAgICAgICAg
ICAqY3J0YzsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGEgKmRhdGE7
Cj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpZm9fc2l6ZTsKPiAg
fTsKPgo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZGlzcF9yZG1hICpjb21wX3RvX3JkbWEo
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiBAQCAtMTMxLDEyICsxMzIsMTggQEAgc3RhdGlj
IHZvaWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVk
IGludCB3aWR0aCwKPiAgICAgICAgIHVuc2lnbmVkIGludCB0aHJlc2hvbGQ7Cj4gICAgICAgICB1
bnNpZ25lZCBpbnQgcmVnOwo+ICAgICAgICAgc3RydWN0IG10a19kaXNwX3JkbWEgKnJkbWEgPSBj
b21wX3RvX3JkbWEoY29tcCk7Cj4gKyAgICAgICB1MzIgcmRtYV9maWZvX3NpemU7Cj4KPiAgICAg
ICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgd2lkdGgsIGNvbXAsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRElTUF9SRUdfUkRNQV9TSVpFX0NPTl8wLCAweGZmZik7Cj4gICAg
ICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIGhlaWdodCwgY29tcCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBESVNQX1JFR19SRE1BX1NJWkVfQ09OXzEsIDB4ZmZmZmYpOwo+
Cj4gKyAgICAgICBpZiAocmRtYS0+Zmlmb19zaXplKQo+ICsgICAgICAgICAgICAgICByZG1hX2Zp
Zm9fc2l6ZSA9IHJkbWEtPmZpZm9fc2l6ZTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAg
ICAgcmRtYV9maWZvX3NpemUgPSBSRE1BX0ZJRk9fU0laRShyZG1hKTsKPiArCj4gICAgICAgICAv
Kgo+ICAgICAgICAgICogRW5hYmxlIEZJRk8gdW5kZXJmbG93IHNpbmNlIERTSSBhbmQgRFBJIGNh
bid0IGJlIGJsb2NrZWQuCj4gICAgICAgICAgKiBLZWVwIHRoZSBGSUZPIHBzZXVkbyBzaXplIHJl
c2V0IGRlZmF1bHQgb2YgOCBLaUIuIFNldCB0aGUKPiBAQCAtMTQ1LDcgKzE1Miw3IEBAIHN0YXRp
YyB2b2lkIG10a19yZG1hX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25l
ZCBpbnQgd2lkdGgsCj4gICAgICAgICAgKi8KPiAgICAgICAgIHRocmVzaG9sZCA9IHdpZHRoICog
aGVpZ2h0ICogdnJlZnJlc2ggKiA0ICogNyAvIDEwMDAwMDA7Cj4gICAgICAgICByZWcgPSBSRE1B
X0ZJRk9fVU5ERVJGTE9XX0VOIHwKPiAtICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0la
RShSRE1BX0ZJRk9fU0laRShyZG1hKSkgfAo+ICsgICAgICAgICAgICAgUkRNQV9GSUZPX1BTRVVE
T19TSVpFKHJkbWFfZmlmb19zaXplKSB8Cj4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9WQUxJ
RF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOwo+ICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRx
X3BrdCwgcmVnLCBjb21wLCBESVNQX1JFR19SRE1BX0ZJRk9fQ09OKTsKPiAgfQo+IEBAIC0yOTEs
NiArMjk4LDE2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcmRtYV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gY29tcF9pZDsKPiAgICAg
ICAgIH0KPgo+ICsgICAgICAgaWYgKG9mX2ZpbmRfcHJvcGVydHkoZGV2LT5vZl9ub2RlLCAibWVk
aWF0ZWsscmRtYV9maWZvX3NpemUiLCAmcmV0KSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJtZWRpYXRlayxyZG1hX2ZpZm9fc2l6ZSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwcml2LT5maWZvX3NpemUpOwo+
ICsgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IHJkbWEgZmlmbyBzaXplXG4iKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9
Cj4gKwo+ICAgICAgICAgcmV0ID0gbXRrX2RkcF9jb21wX2luaXQoZGV2LCBkZXYtPm9mX25vZGUs
ICZwcml2LT5kZHBfY29tcCwgY29tcF9pZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZtdGtfZGlzcF9yZG1hX2Z1bmNzKTsKPiAgICAgICAgIGlmIChyZXQpIHsKPiAtLQo+IDEu
OC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
