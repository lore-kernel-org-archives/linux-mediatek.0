Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C039C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:23:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC7320738
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n+H66V+f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLLu9WjZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC7320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9iyfJz6WdNLvLYD09Kpa/C2hhEyVFsl9HRGJzlswXlw=; b=n+H66V+fEzDaDdIGFdP6Yt7H6
	M2o9Y7GBGJe6/P3c+os8rSNg9uJvCLw5kpPxKjcXrIE441XBKKZQSl/rG+BzfGIua8d3l+YNOXqgK
	fvHPHsmBPJ3Bpi4Swk5BMawi1855TuN5wjq8tTNkvw+A0LZAYmO+c0M8gCp7JGOHKYCWFUBGvx3WT
	494rJE3KVhc2jFcOx21Td6cxBMcu71mg+G1UW/p8vY5cQDssLIGNim7m0xXzmGnS6OS2en62uz6Y0
	lp9qwP8Meywn3cllefZQk0grZMehGIBXD5BHdz6zQ/De52oaZh1Ku7x+9J97ZNFV7SHx4OXJFkVDJ
	F61/k46Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8tuN-0002Je-6h; Thu, 20 Aug 2020 23:23:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8tuJ-0002IG-CF; Thu, 20 Aug 2020 23:23:44 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C78BD207DE;
 Thu, 20 Aug 2020 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597965822;
 bh=bdKBK2uOPKO413Z0iX2NJvBT7lzP8LgAKIxVU9ocXyw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KLLu9WjZQkSJfZ95kIb7q9gMoregri4wHkrkaYg6DER7LjANfLyLhwgW0SWwymYij
 CkNzyxCvpvzX025rioWD9TSShWnjGlBZhxQ4l0Fkt7k2FVXTDyLDNG28+PT10M1XuT
 LmwvziwbM4Jw2B/ZrqyrT2P4wviCvlpt4PenfN0c=
Received: by mail-ed1-f52.google.com with SMTP id cq28so2968944edb.10;
 Thu, 20 Aug 2020 16:23:41 -0700 (PDT)
X-Gm-Message-State: AOAM5320MOXmVYG6kkSNzHuuSO/t67hS8sDqrY82x+saawRRXBVm/AdO
 aIriV5ObkTtE6RiyyS7ZbX+06tBz0+2e+YcECQ==
X-Google-Smtp-Source: ABdhPJxdccf74kgFcrZ/UdWvxCfzmoCcixKQh8r0jcPn1sNOj1J2tB6qrHBNGNgYsoCMJ/EVSE/dUxdjnOVE9JgYNwQ=
X-Received: by 2002:a50:d9c6:: with SMTP id x6mr126778edj.271.1597965820452;
 Thu, 20 Aug 2020 16:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200819025829.57545-1-wanghai38@huawei.com>
In-Reply-To: <20200819025829.57545-1-wanghai38@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:23:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
Message-ID: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: remove duplicate include
To: Wang Hai <wanghai38@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_192343_480184_3DE7DAE9 
X-CRM114-Status: GOOD (  14.90  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFdhbmcgSGFpOgoKV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPiDmlrwgMjAyMOW5
tDjmnIgxOeaXpSDpgLHkuIkg5LiK5Y2IMTE6MDDlr6vpgZPvvJoKPgo+IFJlbW92ZSBtdGtfZHJt
X2RkcC5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlCj4KClJldmlld2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4gUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSGFpIDx3
YW5naGFpMzhAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggMDQwYThmMzkzZmUyLi5h
MzRmZDgwNWNlNmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+
IEBAIC0yNyw3ICsyNyw2IEBACj4KPiAgI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+ICAjaW5j
bHVkZSAibXRrX2RybV9kZHAuaCIKPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwLmgiCj4gICNpbmNs
dWRlICJtdGtfZHJtX2RkcF9jb21wLmgiCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIgo+ICAj
aW5jbHVkZSAibXRrX2RybV9nZW0uaCIKPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
