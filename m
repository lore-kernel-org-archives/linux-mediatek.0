Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE43C47254
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 00:26:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4AB720721
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 00:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pf1YYpsA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZrZbD5+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4AB720721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JP+IPOjDAAGD24CBFStXGEGmRXr4Rq82hdYVtdcefNk=; b=pf1YYpsAPKbMks
	8l1+Sea3cMlGH1EYPNQZTmeBqzlE8h6x/8epS9yY90JVfv5ZZVq577f1J+jeYv/A9hlZF15EUSobC
	b1bniTLnfOFs3qQymsfk9uWxOMqErATCTMxSKQO9YM5XKHman5iCCuzVG0F2eNNkfN+pTDfn49XoU
	BkKQW3yuQbQmnPtMssfW2uJHCbWAX50P6ZRdEQe4m0gLJ7CcxP/pbipdtmoaKYsCrPV+nFow31FXF
	3DvGoeJ80w3tKwvLDuk7W3ArI0H3oIQnd/pL9b8zamn/N+ZCkJ/wg1DOJqg/cbuhPCyeq4rZ4fPTN
	Mf66NDuNMaFgqgJkOl5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW7sn-0007bo-QD; Wed, 06 May 2020 00:25:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW7sV-0007Kg-NG; Wed, 06 May 2020 00:25:37 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 353CA20721;
 Wed,  6 May 2020 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588724734;
 bh=tORyrd16/TrBcFAcvt++PIww61jrCTRTKoyNEMmWqg8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QZrZbD5+TiJ84mh5Tfs9AExzUQvVWmKfqXCAr1AHKEFtyVpJMDwCunFSsQOuF/v0y
 7EYhS4vEkA90GUykWHL0IBdveWs5kpchdA4oFVRb8OCIJvA5c/KOFvYwkmMe8RpSU5
 R2XK52qLs7kJQlbrJVX0c6YmpGpSal/eLZdqMWxE=
Received: by mail-ej1-f45.google.com with SMTP id e2so3298315eje.13;
 Tue, 05 May 2020 17:25:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuYuqT5s71lg1gbkswt/6WQs2MJByVX35IpxhYy6LYY84kDou93c
 gMQXqqbe0TFHzKW/A3+FO+WGW9si6QjGejj+sw==
X-Google-Smtp-Source: APiQypKp/oeTS/9+RxLaRA+6gt87+Uwim/SeYewoJTMOqc4ThsPCt9mPOYtbLOruUFSBdnzWiU9WTdpRVNurfELuWgE=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr5292368eje.324.1588724732602; 
 Tue, 05 May 2020 17:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
In-Reply-To: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 08:25:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
Message-ID: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_172535_801681_49D3842C 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Anand K. Mistry" <amistry@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEFuYW5kLAoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NOaciDI55pelIOmAseS4iSDkuIrljYgxMjozN+Wvq+mBk++8mgo+Cj4gSGksIEFuYW5k
LAo+Cj4gQW5hbmQgSy4gTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ0
5pyIMjjml6Ug6YCx5LqMIOS4iuWNiDk6NTTlr6vpgZPvvJoKPiA+Cj4gPiBPbiBTdW4sIDI2IEFw
ciAyMDIwIGF0IDE4OjA0LCBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLCBBbmFuZDoKPiA+ID4KPiA+ID4gQW5hbmQgSyBNaXN0cnkg
PGFtaXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2I
MjowOeWvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gSWYgZG1hX21hcF9zZygpIG1lcmdlcyBwYWdl
cyB3aGVuIGNyZWF0aW5nIHRoZSBtYXBwaW5nLCBvbmx5IHRoZSBmaXJzdAo+ID4gPiA+IGVudHJp
ZXMgd2lsbCBoYXZlIGEgdmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBm
b2xsb3dlZCBieQo+ID4gPiA+IGVudHJpZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPiA+ID4g
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5j
b20+CgpBdXRob3Igc2hvdWxkIHNpZ24gb2ZmIHRoaXMgcGF0Y2gsIHBsZWFzZSBnaXZlIGEgc2ln
biBvZmYgdGFnIGJ5IGF1dGhvci4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4gPiA+IC0tLQo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDMgKysrCj4g
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gaW5kZXggYjA0YTNjMmIx
MTFlMDkuLmY4ZmQ4Yjk4YzMwZTNkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+ID4gPiBAQCAtMjI0LDYgKzIyNCw5IEBAIHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqbXRrX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFfYWRk
cmVzcyhzZy0+c2dsKTsKPiA+ID4gPiAgICAgICAgIGZvcl9lYWNoX3NnKHNnLT5zZ2wsIHMsIHNn
LT5uZW50cywgaSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNnX2RtYV9sZW4ocykp
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+Cj4gPiA+IEkgdGhp
bmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+ID4KPiA+IHNjYXR0ZXJsaXN0LmggaGFzIHRo
ZSBjb21tZW50Ogo+ID4gLyoKPiA+ICAqIFRoZXNlIG1hY3JvcyBzaG91bGQgYmUgdXNlZCBhZnRl
ciBhIGRtYV9tYXBfc2cgY2FsbCBoYXMgYmVlbiBkb25lCj4gPiAgKiB0byBnZXQgYnVzIGFkZHJl
c3NlcyBvZiBlYWNoIG9mIHRoZSBTRyBlbnRyaWVzIGFuZCB0aGVpciBsZW5ndGhzLgo+ID4gICog
WW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0aGUgbnVtYmVyIG9mIHNnIGVudHJpZXMgZG1hX21h
cF9zZwo+ID4gICogcmV0dXJucywgb3IgYWx0ZXJuYXRpdmVseSBzdG9wIG9uIHRoZSBmaXJzdCBz
Z19kbWFfbGVuKHNnKSB3aGljaAo+ID4gICogaXMgMC4KPiA+ICAqLwo+ID4KPiA+IFNvIGJyZWFr
aW5nIG9uIHRoZSBmaXJzdCBzZ19kbWFfbGVuKHNnKSA9PSAwIGFwcGVhcnMgdG8gYmUgKG9uZSBv
ZikKPiA+IHRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgo+ID4KPgo+IE9rYXksIHlvdSdyZSByaWdo
dC4gU28KPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4KPgo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4g
PiA+ICsKPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNzKHMpICE9IGV4
cGVjdGVkKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJzZ190
YWJsZSBpcyBub3QgY29udGlndW91cyIpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IC1FSU5WQUw7Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjI2LjEuMzAxLmc1NWJjM2ViN2Ni
OS1nb29nCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
