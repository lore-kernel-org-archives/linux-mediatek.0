Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B28CC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:40:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C862068D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szvKoa+b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5kaa6bD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C862068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qk6Mo8td4boU2Nl0+aCVoaJXwG8UcAQ4Bv0BPssuDnE=; b=szvKoa+bBzMOS3RWXjxb27Nrp
	8MIEHos1YnvF6kw2d7vBV2aeFOqUW60hdql8R6veJ4c1Ufpgi3t4gmlUIYSJt0RkadNu/kZKb6Ll7
	UzUMlRD5ixhsRcAOkEmqOOgq38zDZKeSY4dt+Pa4MNuGblol30KzltNxjvGIOcmin+mHGV9/eTgGp
	DEbCzfbGO8UQYYHf31bm+tVHJZK+s3vv8J/Oqk0mHxddTpw7QjxqJlL77xf+CMtbt6vePvS6cu8hS
	nYC0VFWpzjIshoQsHvvTW1R1gUTUVCUL/CA7KFQTLS02E1XD5Jdynk3cw8l82Kk3rRl8rgsvJGqlG
	GJrvrXfoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHy5W-0003Fb-53; Mon, 14 Sep 2020 23:40:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHy5Q-0003Dm-S2; Mon, 14 Sep 2020 23:40:41 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C47A321D95;
 Mon, 14 Sep 2020 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126840;
 bh=7YxhV2xZvx6nrVGCgI8yLCt9xE01+z6rpckv6HeDiOE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F5kaa6bDRZsnqgJGDMMmyNFrKwzGHueqBd6WRKMgYu9urtYGZwverk0IH0Rhg7VEB
 rH8RmZ+WayMCTXd+FI77zXckVabDIWc6xRMn4rIKVV+WOc6d1tKVajNp1PuCl+KMAU
 CQf0DVw7gP2BTeslaKe2/Fqfk4CW/GcaYQqM9fdY=
Received: by mail-ed1-f53.google.com with SMTP id i1so1275556edv.2;
 Mon, 14 Sep 2020 16:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM531X62WfK6a4BKjZYbDtNE1491Wyss6h4dnGMVV3m6bHI0GYPuN4
 728I2oabwBOiBVZq7UuYi0PhjHia+sxaNyV3ag==
X-Google-Smtp-Source: ABdhPJy5v5jvk9nSph1QBw9pjsPnW7VLL4rfeN5p0mGA8rEDQJvTN+DhAO3VLkzSupQ7VClzUOPWvQWNgPXdD9WbwZ0=
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr19619839edi.148.1600126838289; 
 Mon, 14 Sep 2020 16:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200911112119.3218073-1-yukuai3@huawei.com>
In-Reply-To: <20200911112119.3218073-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:40:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY__776k8oZRH-DEEO1JZx6Sf0vDMjPVDDXkFH=51nQvJBg@mail.gmail.com>
Message-ID: <CAAOTY__776k8oZRH-DEEO1JZx6Sf0vDMjPVDDXkFH=51nQvJBg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_drm_kms_init()
To: Yu Kuai <yukuai3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_194041_068287_DE923338 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 littlecvr@chromium.org, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDEx5pelIOmAseS6lCDkuIvljYg3OjIy5a+r6YGT77yaCj4KPiBpZiBvZl9maW5kX2RldmljZV9i
eV9ub2RlKCkgc3VjY2VlZCwgbXRrX2RybV9rbXNfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIGp1bXAgdGFyZ2V0IHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCgpS
ZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4g
Rml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1l
ZGlhdGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1
YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IHwgMTEgKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5k
ZXggMDQwYThmMzkzZmUyLi43YWNlYWNlOTRlYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIGludCBtdGtfZHJt
X2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4KPiAgICAgICAgIHJldCA9IGRybW1f
bW9kZV9jb25maWdfaW5pdChkcm0pOwo+ICAgICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfbXV0ZXhfZGV2Owo+Cj4g
ICAgICAgICBkcm0tPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDY0Owo+ICAgICAgICAgZHJtLT5t
b2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gNjQ7Cj4gQEAgLTE4Miw3ICsxODIsNyBAQCBzdGF0aWMg
aW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPgo+ICAgICAgICAg
cmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRybS0+ZGV2LCBkcm0pOwo+ICAgICAgICAgaWYgKHJl
dCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBw
dXRfbXV0ZXhfZGV2Owo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogV2UgY3VycmVudGx5IHN1
cHBvcnQgdHdvIGZpeGVkIGRhdGEgc3RyZWFtcywgZWFjaCBvcHRpb25hbCwKPiBAQCAtMjI5LDcg
KzIyOSw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtKQo+ICAgICAgICAgfQo+ICAgICAgICAgaWYgKCFkbWFfZGV2LT5kbWFfcGFybXMpIHsKPiAg
ICAgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJf
Y29tcG9uZW50X3VuYmluZDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZG1hX2RldjsKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gZG1hX3NldF9tYXhfc2VnX3NpemUoZG1hX2Rldiwg
KHVuc2lnbmVkIGludClETUFfQklUX01BU0soMzIpKTsKPiBAQCAtMjU2LDkgKzI1NiwxMiBAQCBz
dGF0aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgZXJy
X3Vuc2V0X2RtYV9wYXJtczoKPiAgICAgICAgIGlmIChwcml2YXRlLT5kbWFfcGFybXNfYWxsb2Nh
dGVkKQo+ICAgICAgICAgICAgICAgICBkbWFfZGV2LT5kbWFfcGFybXMgPSBOVUxMOwo+ICtwdXRf
ZG1hX2RldjoKPiArICAgICAgIHB1dF9kZXZpY2UocHJpdmF0ZS0+ZG1hX2Rldik7Cj4gIGVycl9j
b21wb25lbnRfdW5iaW5kOgo+ICAgICAgICAgY29tcG9uZW50X3VuYmluZF9hbGwoZHJtLT5kZXYs
IGRybSk7Cj4gLQo+ICtwdXRfbXV0ZXhfZGV2Ogo+ICsgICAgICAgcHV0X2RldmljZShwcml2YXRl
LT5tdXRleF9kZXYpOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gLS0KPiAyLjI1LjQK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
