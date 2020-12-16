Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9631C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:11:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D63D233EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D63D233EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kponf0puU8XILkHArXzbeULj3/af9soGed3JuLtlI+4=; b=oxpFsAtV6WimlHDWEcZSgf3XN
	/v53N+fSdxdVvBtx0yXsxP2Acb91eBwHD+P3rbDwQqUqKHBBOjlELDbH5yNlfyW0SaKwa9JHWepz9
	1NVOvO58hl1Ftc6f0wbPhFKzH0diDwSK1LNicuA3LmFeHglXU6/FaqKMNpjQAvr9e0pvSPJatY1EC
	vqupHeJtxZ7fdGkg2cgUS3tPnv8oduTTPhn1nOKqIiwF1S/CiDNOlzzo5WPdam6/RqF6Z/kGAr6Zl
	C5TZ0Nc7ynuUKy+TWb9XXy7CzzKUxf3OsWSw2kUM7Ti9eCe1OiJCgRYWsUYTbMiSw9qlJoDOwarh8
	3zn246sjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpYSR-00027u-Eb; Wed, 16 Dec 2020 15:11:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpYSN-00026a-Mz; Wed, 16 Dec 2020 15:11:12 +0000
X-Gm-Message-State: AOAM530vr0Cuh4sNWfgLv0bzZ75NeVkS9uvIT4l3OVIcyXMJTAlWMbQE
 5QpRAKneLfWIlMclp7EborPEbHAwieQiOimItg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608131469;
 bh=qJnz4jINEHnwylSMSs8ygzcSuobmntS82hFNu7/S1oQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lRAsTNDWesqlzQ3DfHEKOK3sUEih3R8sZvgqKu7FOxscR2Jx2o64DlAWsbq5aOfPs
 L/+MntDsLzLCCDpILOstBBLRMb061S5uGGRj1DM4HAXGtO2W8YYjN43oWvKR77qeSg
 MNsoGkyZOHXa+SJtpvYX2kJAqkdZh+G6x7z/V/PZaGr/U5pDDY/6s8Vzq52gVAv8Op
 NSiBaxK3AQKLvK5wc6xNwdNWW5tDbPLKIxvHwb1WwEvNUPv4Wm5bU609c4aYdqnJ5A
 6lYHM1a2YCCahcw8rHFeKVsYCj75XkJSHfpaJTy+R5RO+Z/sY/Rwc/1xIbUMzWQTOK
 O4UFAPVEjkZvg==
X-Google-Smtp-Source: ABdhPJwS/YraW4qyb0Dm3f675N42jAY1oC2Y8j8EzHOplVWPvcJ8f3cI6/ZgJvdjQ83rFs2emQdjBQ/MA4j9o6AQcBc=
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr3796965wmg.145.1608131467393; 
 Wed, 16 Dec 2020 07:11:07 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Dec 2020 23:10:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
Message-ID: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
Subject: Re: [PATCH v2, 10/17] drm/mediatek: fix aal size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_101111_921007_6B0893A8 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjIy5a+r6YGT77yaCj4KPiBm
aXggYWFsIHNpemUgY29uZmlnCj4KPiBGaXhlczogMDY2NGQxMzkyYzI2IChkcm0vbWVkaWF0ZWs6
IEFkZCBBQUwgZW5naW5lIGJhc2ljIGZ1bmN0aW9uKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMTEgKysrKysrKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IGJlNjFkMTEuLmU3ZDQ4
MWUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
Cj4gQEAgLTMzLDggKzMzLDEzIEBACj4gICNkZWZpbmUgRElTUF9SRUdfVUZPX1NUQVJUICAgICAg
ICAgICAgICAgICAgICAgMHgwMDAwCj4KPiAgI2RlZmluZSBESVNQX0FBTF9FTiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAwMDAKPiArI2RlZmluZSBESVNQX0FBTF9DRkcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDAwMjAKPiArI2RlZmluZSBBQUxfUkVMQVlfTU9ERSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICsjZGVmaW5lIEFBTF9FTkdJTkVfRU4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEpCj4gICNkZWZpbmUgRElTUF9B
QUxfU0laRSAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCj4KPiArI2RlZmluZSBESVNQ
X0FBTF9PVVRQVVRfU0laRSAgICAgICAgICAgICAgICAgICAweDA0ZDgKPiArCj4gICNkZWZpbmUg
RElTUF9DQ09SUl9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwCj4gICNkZWZpbmUg
Q0NPUlJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDApCj4gICNkZWZpbmUg
RElTUF9DQ09SUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gQEAgLTE4NCw3
ICsxODksMTEgQEAgc3RhdGljIHZvaWQgbXRrX2FhbF9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IHcsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2cmVmcmVzaCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+ICB7
Cj4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgY29tcCwgRElT
UF9BQUxfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwg
aCwgY29tcCwgRElTUF9BQUxfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0
LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9BQUxfT1VUUFVUX1NJWkUpOwo+ICsKPiArICAgICAg
IG10a19kZHBfd3JpdGVfbWFzayhOVUxMLCBBQUxfUkVMQVlfTU9ERSwgY29tcCwgRElTUF9BQUxf
Q0ZHLAoKY21kcV9wa3QKCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgQUFMX1JFTEFZX01P
REUgfCBBQUxfRU5HSU5FX0VOKTsKClRoaXMgcGF0Y2ggaXMgdG8gZml4IHNpemUgY29uZmlnLCBz
byBtb3ZlIHRoaXMgc3RhdGVtZW50IHRvIGFub3RoZXIgcGF0Y2guCgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19hYWxfc3RhcnQoc3RydWN0IG10a19kZHBf
Y29tcCAqY29tcCkKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
