Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A2BC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 11:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A3AA2068E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 11:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3yi1j/j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bWfkT4qj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A3AA2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKy+iUkF3NV3NoQrCrtXSPCOm6Zn4JAXJJURZYikj58=; b=Q3yi1j/j13aTUJ
	LA4tFsLgbEDK/ToNmAh4ljk3mCrMag8ATeHftrVjUblIi8AZ4g/TtxcItL7p3fH/FNyesKfQugLp1
	dJCkXVvn3stnuz3pQHno1BO7y5JofKgBLRWpn0/nU0fLSXHpSmTBFEImBfc1x7wdgkN7X/iNdSaav
	jzr1cQaWePgI+HH7a8K7+k4BAOVxN7MoJOZf7vQUeF1zXzz4OXkjbyqw2DelciCT/9CNzvrAcHN+w
	pXSZ4m4fESmuya2JuW+uruLV268OdXDtHiHNCBHONxtUY7bqJ5fTSmgu13r2fPj5YAu7QG2BakXrQ
	lDgwEC8mjHmNZxtGTjSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWHqL-0002PL-41; Wed, 06 May 2020 11:04:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWHqA-0002GH-G5
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 11:03:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id y4so1651262wrm.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rtEuo5nw1S4kpIcS9rhXRJzeE3BjOFfaGFCUT/CfmF4=;
 b=bWfkT4qj3YVYiyTtnBDKzxtH9al8EGIDGEVKQrpkztLlbkCNThDFEuVDTozdfgIzLY
 N4yivpD0Oc9GWBeufPce8cOQgY2lkiqdBkgWTYq4TICJSiiEqMDBnABEBibaWujH6AxN
 v+CfVF7IFDnhjFiERJNR4nbL0mGShNasZXkJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rtEuo5nw1S4kpIcS9rhXRJzeE3BjOFfaGFCUT/CfmF4=;
 b=R6jW+hRIr+092BZQddLW8j52dQtZcmvxrCyuGt8GUOWVudTyq/t3zVdspvma2+5Awd
 KRlShD06K2p5StgxdNWiY5kmaAGyYcYv/0GfErLe7IbkOgN3n4h42oH5+ay6VWTbahqp
 8cJwdLPeAEy+VjSUyApUxCG99mSWnhslXo32kCRpt5RReS4+gMq9K10PLjM5Bis3M5aD
 ZE2HAGYaSpPRGeQUz0XdXLEps+wmbShwKwptWF7kVNX6uE+YXyjrl8rAFURbPyriOx+E
 dE890nz316Dulx7xLgsmJbmc2on6ZPR6etdpdUUXW7SeN5X3IRVfWKtcN4oEx3ckNZaD
 h9/A==
X-Gm-Message-State: AGi0PuYar0A/Ut6CZfJdaZ38Bdu47Tmr+ahHamIE808iggpGXkAStQsz
 7u8Yvv6OeHOYL6BwNamR3jr0PLxpeaNPPUmBohGhaw==
X-Google-Smtp-Source: APiQypIGj98l9hllH+9ph6fwT8VKRh/Pv4h2UW1ktSL1V2RKXFelTBD7bNCFAlCYli6PKV2AO+prMw92x7qUiOe3LRk=
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8407525wrp.427.1588763027630; 
 Wed, 06 May 2020 04:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
 <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
In-Reply-To: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
From: Anand Mistry <amistry@chromium.org>
Date: Wed, 6 May 2020 21:03:36 +1000
Message-ID: <CAECpkiM5ez8=iEe=fYKiDf5Pb6AHrTyt5uXqJQtQpQJHotupWA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_040352_881975_40DF4C51 
X-CRM114-Status: GOOD (  22.46  )
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
Cc: Anand K Mistry <amistry@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMDoyNSBBTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgQW5hbmQsCj4KPiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ05pyIMjnml6Ug6YCx5LiJIOS4iuWN
iDEyOjM35a+r6YGT77yaCj4gPgo+ID4gSGksIEFuYW5kLAo+ID4KPiA+IEFuYW5kIEsuIE1pc3Ry
eSA8YW1pc3RyeUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw5bm0NOaciDI45pelIOmAseS6jCDkuIrl
jYg5OjU05a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIFN1biwgMjYgQXByIDIwMjAgYXQgMTg6MDQs
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IEhpLCBBbmFuZDoKPiA+ID4gPgo+ID4gPiA+IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5
QGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ05pyIMjDml6Ug6YCx5LiAIOS4i+WNiDI6MDnlr6vp
gZPvvJoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJZiBkbWFfbWFwX3NnKCkgbWVyZ2VzIHBhZ2VzIHdo
ZW4gY3JlYXRpbmcgdGhlIG1hcHBpbmcsIG9ubHkgdGhlIGZpcnN0Cj4gPiA+ID4gPiBlbnRyaWVz
IHdpbGwgaGF2ZSBhIHZhbGlkIHNnX2RtYV9hZGRyZXNzKCkgYW5kIHNnX2RtYV9sZW4oKSwgZm9s
bG93ZWQgYnkKPiA+ID4gPiA+IGVudHJpZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBLIE1pc3RyeSA8YW1pc3RyeUBnb29n
bGUuY29tPgo+Cj4gQXV0aG9yIHNob3VsZCBzaWduIG9mZiB0aGlzIHBhdGNoLCBwbGVhc2UgZ2l2
ZSBhIHNpZ24gb2ZmIHRhZyBieSBhdXRob3IuCgpTb3JyeSwgZW1haWwgaXNzdWVzIG1lYW50IGkg
c2VudCB0aGUgcGF0Y2ggZnJvbSBhIGRpZmZlcmVudCBhY2NvdW50LgpTaG91bGQgSSByZS1zZW5k
IHRoZQpwYXRjaCBmcm9tIHRoZSBzYW1lIGFjY291bnQgYXMgdGhlIHNpZ24tb2ZmIGxpbmU/IEkn
bSBzdGlsbCB3b3JraW5nIG15CndheSB0aHJvdWdoIHRoZSBrZXJuZWwgcGF0Y2ggcHJvY2Vzcy4K
Cj4KPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgMyArKysKPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+ID4gPiA+IGluZGV4IGIwNGEzYzJiMTEx
ZTA5Li5mOGZkOGI5OGMzMGUzZCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiA+ID4gQEAgLTIyNCw2ICsyMjQsOSBAQCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBleHBlY3RlZCA9IHNn
X2RtYV9hZGRyZXNzKHNnLT5zZ2wpOwo+ID4gPiA+ID4gICAgICAgICBmb3JfZWFjaF9zZyhzZy0+
c2dsLCBzLCBzZy0+bmVudHMsIGkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNn
X2RtYV9sZW4ocykpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+ID4gPgo+ID4g
PiBzY2F0dGVybGlzdC5oIGhhcyB0aGUgY29tbWVudDoKPiA+ID4gLyoKPiA+ID4gICogVGhlc2Ug
bWFjcm9zIHNob3VsZCBiZSB1c2VkIGFmdGVyIGEgZG1hX21hcF9zZyBjYWxsIGhhcyBiZWVuIGRv
bmUKPiA+ID4gICogdG8gZ2V0IGJ1cyBhZGRyZXNzZXMgb2YgZWFjaCBvZiB0aGUgU0cgZW50cmll
cyBhbmQgdGhlaXIgbGVuZ3Rocy4KPiA+ID4gICogWW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0
aGUgbnVtYmVyIG9mIHNnIGVudHJpZXMgZG1hX21hcF9zZwo+ID4gPiAgKiByZXR1cm5zLCBvciBh
bHRlcm5hdGl2ZWx5IHN0b3Agb24gdGhlIGZpcnN0IHNnX2RtYV9sZW4oc2cpIHdoaWNoCj4gPiA+
ICAqIGlzIDAuCj4gPiA+ICAqLwo+ID4gPgo+ID4gPiBTbyBicmVha2luZyBvbiB0aGUgZmlyc3Qg
c2dfZG1hX2xlbihzZykgPT0gMCBhcHBlYXJzIHRvIGJlIChvbmUgb2YpCj4gPiA+IHRoZSBkb2N1
bWVudGVkIGFwcHJvYWNoLgo+ID4gPgo+ID4KPiA+IE9rYXksIHlvdSdyZSByaWdodC4gU28KPiA+
Cj4gPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPiA+
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNz
KHMpICE9IGV4cGVjdGVkKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
RVJST1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMjYu
MS4zMDEuZzU1YmMzZWI3Y2I5LWdvb2cKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+IExp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
