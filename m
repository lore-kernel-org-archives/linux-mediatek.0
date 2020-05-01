Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1427BC47253
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 13:25:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2B32495F
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 13:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/alO4Gk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRiwD0Q+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2B32495F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4RDKqGZa6gqrMW1GXd4CTQLRx/BWMQIa/l1LicWw/0=; b=C/alO4GkTj3axg
	8hlCzy+8m3QGwY1KyX6ITHAkbLqyDLEI5YslUnRX+oQJmmzvjWGJWs/c8k/mZ6OXq1w17cMmjSYxK
	w9AptgTdWXmRq/57jO0NkJ3qwCYX0SR83GLSZcy26s3QXmuWDehjNwGa13FY9ah5Gfbs61SvOyJtG
	3WnYFAicdv1/sruzUuAYEdoswb3zl+7lEsFnPt1JguQcr3saY0MQs4QysdY0nuo++zW+YgJuq2E+k
	wgnsfOjPf8Lg3Zsg7Mvm0gtA9G7vKHvsYs8aPvpavOc4m4dkU5lT/qqTmsFaZZMugZ+Z+ZaWgUBJ7
	R2XdtZurvnXeNULKCShg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUVez-0001py-Du; Fri, 01 May 2020 13:24:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUVes-0001hm-6v; Fri, 01 May 2020 13:24:51 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 965C424965;
 Fri,  1 May 2020 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588339489;
 bh=d8OPxjX6yuJbdOTlfUXM7Zvc614YcSXkktA7q5/FxRY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oRiwD0Q+jvvpP6sMUM7uXKK++I/eOZnt6Ikrp6rtJBAPD/6vZl/OFq4Uxzqg573dr
 HXTT0bMxoz2GibxZPq00kqvlqfP1GYpMyc+LbA3Tf2Ofs9mJFJf4NsfNvEueN0i/ZY
 ldEXuawf8h0p2ODo+BCBInJ2O4GxSh/bcIMpNLxQ=
Received: by mail-ed1-f42.google.com with SMTP id r16so7260199edw.5;
 Fri, 01 May 2020 06:24:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuZmGCjzNBUt3je6jE9B/RgkhwGG2LBhlt4fju8snioIfut9nAw5
 SecMW5orTyxVs5j76fJN1hreKMaAIg4ISoiFzA==
X-Google-Smtp-Source: APiQypKel2U1e5MRHXKLL7Rnuz1U41FBCv2Ii6mcl2FuZrvIApbgp6jSgjZ93cS0z2rzE3pcCu/kvy2F5YvYBuZXTp0=
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr3461314edv.148.1588339487975; 
 Fri, 01 May 2020 06:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200417150614.2631786-1-enric.balletbo@collabora.com>
 <20200417150614.2631786-6-enric.balletbo@collabora.com>
In-Reply-To: <20200417150614.2631786-6-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 1 May 2020 21:24:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Gc9uCtfcp+qo=KnVOYfyjw4rDpe15A1q6G2A-iXpSow@mail.gmail.com>
Message-ID: <CAAOTY_9Gc9uCtfcp+qo=KnVOYfyjw4rDpe15A1q6G2A-iXpSow@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/mediatek: mtk_dsi: Use simple encoder
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_062450_289834_452BFCDA 
X-CRM114-Status: GOOD (  16.22  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQ05pyIMTfml6Ug6YCx5LqUIOS4i+WNiDExOjA25a+r6YGT77ya
Cj4KPiBUaGUgbXRrX2RzaSBkcml2ZXIgdXNlcyBhbiBlbXB0eSBpbXBsZW1lbnRhdGlvbiBmb3Ig
aXRzIGVuY29kZXIuIFJlcGxhY2UKPiB0aGUgY29kZSB3aXRoIHRoZSBnZW5lcmljIHNpbXBsZSBl
bmNvZGVyLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwu
b3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJh
bGxldGJvQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjM6
IE5vbmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyB8IDE0ICsrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gaW5kZXggODY5YWUwYTJlOWY4Li5kNjg2OTRmZjAwZGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKPiBAQCAtMjIsNiArMjIsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9w
YW5lbC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcm9iZV9oZWxwZXIuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aD4KPgo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIgo+Cj4gQEAgLTc4OCwxNSArNzg5
LDYgQEAgc3RhdGljIHZvaWQgbXRrX291dHB1dF9kc2lfZGlzYWJsZShzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQo+ICAgICAgICAgZHNpLT5lbmFibGVkID0gZmFsc2U7Cj4gIH0KPgo+IC1zdGF0aWMgdm9p
ZCBtdGtfZHNpX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4g
LXsKPiAtICAgICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7Cj4gLX0KPiAtCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgbXRrX2RzaV9lbmNvZGVyX2Z1bmNz
ID0gewo+IC0gICAgICAgLmRlc3Ryb3kgPSBtdGtfZHNpX2VuY29kZXJfZGVzdHJveSwKPiAtfTsK
PiAtCj4gIHN0YXRpYyBpbnQgbXRrX2RzaV9jcmVhdGVfY29ubl9lbmMoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwgc3RydWN0IG10a19kc2kgKmRzaSk7Cj4gIHN0YXRpYyB2b2lkIG10a19kc2lfZGVz
dHJveV9jb25uX2VuYyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKTsKPgo+IEBAIC0xMTQwLDggKzExMzIs
OCBAQCBzdGF0aWMgaW50IG10a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gIHsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAg
ICAgIHJldCA9IGRybV9lbmNvZGVyX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVyLCAmbXRrX2RzaV9l
bmNvZGVyX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9F
TkNPREVSX0RTSSwgTlVMTCk7Cj4gKyAgICAgICByZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5p
dChkcm0sICZkc2ktPmVuY29kZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUk1fTU9ERV9FTkNPREVSX0RTSSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gICAgICAg
ICAgICAgICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIGVuY29kZXIgaW5pdCB0byBkcm1cbiIpOwo+
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
