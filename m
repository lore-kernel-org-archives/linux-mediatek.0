Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFC7C83002
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 01:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3258206D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 01:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3XSGfY4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DIysdPaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3258206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAoYki78DC6EilPJOLoEwDsoRDwWm3LrU6sZLHEw5kg=; b=W3XSGfY4jLjFcI
	yTIR4KF+eb/y/mSQxBisOi+MuKUU4SMyamApFL0aeLL8GhFVfL8exh7dWuh0cwk5pN4D3MhvZoMAt
	aN+bhCaj2svkdqI5xojKZgYsdJ674SQetZo7CMwI47WOYklwQfjDdrXnGpczQrkpOlHdIZHEfsWQS
	Kmw5uYQ6QeO+mmajtdE5G+Dm3DYcW46w93auz4b72G+hpgoKwU1LfHJmWsZ1yWJREn2auxXmWofWS
	bBW5CdZf3ZgmRGpqq5CIyluWgpRdopEmhYU3G2vQZ8vVklXRcOSzkrPhBcIEYoEyv6utAfxLaItiJ
	g7ADoEjQdcwCifo25jJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTFSW-0004oc-LP; Tue, 28 Apr 2020 01:54:52 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTFSN-0004gD-3s
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 01:54:44 +0000
Received: by mail-io1-xd44.google.com with SMTP id o127so21173819iof.0
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2020 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dn5FsFHXDoP63PfOK+hSyyadWEoDt1vFl68jXDW6Zcs=;
 b=DIysdPazFDSPjWrk9J98X+PHbjtukRlthArlsiKuuAdwBzWfCicMgBuJ0xfyvX7NQA
 OWgWZ8KUgpqJQgeK8x61TqtaPo+WcfYOyCM+yzAW3UUIRconylO19z25qm6WYlx0mmM1
 sbTETGjjaQ0hsRQFPAGzSo/6+tDT7W0hc+/uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dn5FsFHXDoP63PfOK+hSyyadWEoDt1vFl68jXDW6Zcs=;
 b=uiJKalpzhl6v0zWbbT4RLWd59yfqjjhLw1aOOzZkKg76W9HkCFphTi3zAiMmdj9LZy
 kwjsXRstmalaj6CfwqfFzT9DHDrpCeUulcQWkcLxTp8krjar8IQ2skUO9QDET8C7MNqG
 lBGmPuNen/95BPEy/BywbIQLUSekg3mQcAIo3f/wkm9HWnUy0h70k7DdRxFv4vI/n8aL
 7rGQ9clf08Q8PEn3OYA0F9kn65xXv93BzeJuOpZcnSviy2JylUg/xHMpcL/c6cE8HWni
 23h8u6rz8GNsa75ryjdrMAs4CqICOuKioAHwDO7UtT1+LLU5BT9JQ7OGtWhfLxGvOPga
 jrFw==
X-Gm-Message-State: AGi0PuZYUpK/+ty592t7QxOQtj0sb8ZR25uUUz9fX7EvbmebMMwEZBZy
 NJrickxJdQ3pRESGJ6aORReHwOzJwjxOXmRT
X-Google-Smtp-Source: APiQypLazeic9x3nnsNMwnBmSeKy+Bc0gAu4hefabDwWbksxdx6unMvib0EnY8TJzPefwkQt+lGhsg==
X-Received: by 2002:a02:9445:: with SMTP id a63mr12512782jai.10.1588038880637; 
 Mon, 27 Apr 2020 18:54:40 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id x29sm6109687ilk.74.2020.04.27.18.54.39
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id o127so21173770iof.0
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
X-Received: by 2002:a6b:9088:: with SMTP id
 s130mr23613954iod.122.1588038879127; 
 Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
In-Reply-To: <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
From: "Anand K. Mistry" <amistry@chromium.org>
Date: Tue, 28 Apr 2020 11:54:28 +1000
X-Gmail-Original-Message-ID: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
Message-ID: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_185443_160506_540874B9 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyNiBBcHIgMjAyMCBhdCAxODowNCwgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEFuYW5kOgo+Cj4gQW5hbmQgSyBNaXN0cnkgPGFt
aXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2IMjow
OeWvq+mBk++8mgo+ID4KPiA+IElmIGRtYV9tYXBfc2coKSBtZXJnZXMgcGFnZXMgd2hlbiBjcmVh
dGluZyB0aGUgbWFwcGluZywgb25seSB0aGUgZmlyc3QKPiA+IGVudHJpZXMgd2lsbCBoYXZlIGEg
dmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBmb2xsb3dlZCBieQo+ID4g
ZW50cmllcyB3aXRoIHNnX2RtYV9sZW4oKSA9PSAwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
YW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jCj4gPiBpbmRleCBiMDRhM2MyYjExMWUwOS4uZjhmZDhiOThjMzBlM2QgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+IEBAIC0yMjQsNiArMjI0LDkg
QEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4KPiA+ICAgICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFf
YWRkcmVzcyhzZy0+c2dsKTsKPiA+ICAgICAgICAgZm9yX2VhY2hfc2coc2ctPnNnbCwgcywgc2ct
Pm5lbnRzLCBpKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFzZ19kbWFfbGVuKHMpKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJl
ICdjb250aW51ZScKCnNjYXR0ZXJsaXN0LmggaGFzIHRoZSBjb21tZW50OgovKgogKiBUaGVzZSBt
YWNyb3Mgc2hvdWxkIGJlIHVzZWQgYWZ0ZXIgYSBkbWFfbWFwX3NnIGNhbGwgaGFzIGJlZW4gZG9u
ZQogKiB0byBnZXQgYnVzIGFkZHJlc3NlcyBvZiBlYWNoIG9mIHRoZSBTRyBlbnRyaWVzIGFuZCB0
aGVpciBsZW5ndGhzLgogKiBZb3Ugc2hvdWxkIG9ubHkgd29yayB3aXRoIHRoZSBudW1iZXIgb2Yg
c2cgZW50cmllcyBkbWFfbWFwX3NnCiAqIHJldHVybnMsIG9yIGFsdGVybmF0aXZlbHkgc3RvcCBv
biB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgd2hpY2gKICogaXMgMC4KICovCgpTbyBicmVha2lu
ZyBvbiB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgPT0gMCBhcHBlYXJzIHRvIGJlIChvbmUgb2Yp
CnRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgoKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+
ID4gKwo+ID4gICAgICAgICAgICAgICAgIGlmIChzZ19kbWFfYWRkcmVzcyhzKSAhPSBleHBlY3Rl
ZCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJzZ190YWJsZSBpcyBu
b3QgY29udGlndW91cyIpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZB
TDsKPiA+IC0tCj4gPiAyLjI2LjEuMzAxLmc1NWJjM2ViN2NiOS1nb29nCj4gPgo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
