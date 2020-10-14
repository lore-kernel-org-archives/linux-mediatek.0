Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB59C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:47:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3E5214D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SxPkQgwZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ssyOmFkX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3E5214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g5XtrN6SScQrc/KwN7xIXOF5EnoEpDPtPrh3Gy/FlH4=; b=SxPkQgwZc7J7yYHaAcSLS9RR8
	1+PnMze7CpQfOGgpwtoX0IuPzRkqFr0WUVr3L0og8Cw0vL+N6A2wCV7bs1EOb569hw8SQ+4Va8aMP
	j9AttITJBaxAJ5qHKsu8OFo+F0dRvb37YYj1Fc8sCSl/2JHaRtmeeO8zK5Kpx3vOku4B6UA3yv9eX
	6jMixVQoR9wU5V/8VKWJq+ka4lXs9teRFrMabXfEPy+3LI7518Px7RqVbgOGEStMvO5d9pnoiCLv1
	eq6bWzyXXZe/BTAAVR+Ey76G/NHCrkoScoIu6bNHoFl7hnAgLme9z0m6d9gbleOYW+2YJXatd16Oo
	nPDT+odzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSjw9-0002bm-CZ; Wed, 14 Oct 2020 16:47:37 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSjw7-0002af-1u
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 16:47:36 +0000
Received: by mail-il1-x141.google.com with SMTP id j13so6071176ilc.4
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+iJ8voxUfch6P7wdEAm2+D41sOm6IW7HJo1t/j7JMv8=;
 b=ssyOmFkX4SKgdjYHndfa4OBDZjnWFp5tCczf6RLNExa7dhzGxFxhOWADqXVpauAMTv
 T/s2ry2iCyF2FuWHVXebCqmQsO5DBx49noshXeombaMyQz25iMN5RQtJ13tKZsWVcRle
 sEs/ZA/akUA/kkrCHd9dcmNoyDCXm5c968+ivVaofB80fHWWZj8lgNZvheMIjhEur2nt
 XaPDT5v+qA1qRPBh1fOoMJq7lpu8i1yPoBjZ33ZHg5CoAdtUfYJzf/m23wjl3suq5kSN
 lyoRNS+rPlSkO4tQzPxmHHleyhkktRh1Yok2ieH5OMVb4JAmSaxqTLCl1QrXJCPXpSjW
 SshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+iJ8voxUfch6P7wdEAm2+D41sOm6IW7HJo1t/j7JMv8=;
 b=gWt8g5CLBkv+kQ7Tn6tWrLe9rFYsjqoIaRwZVdNKnHYK24Ll8QBRYXsTp3fBy5fWTA
 NyFpymJCWzdItr+z+tIUJ5HMxbRSuk5uRq/MOZpJy3jCqOQSL8fQ1kZ7tvdb11yCjO/S
 iXy8rDluLLsoA1Zl65xlQYtOGm6j83AmvwENqwBWd4+GapotUfS8zC9bW1BZPYeFYQB1
 kd3Dry4MqbGuhi99NBdKuk5dVJjGA7Vg4+hwUH9bVkOk4XAeduvz63iLIfDFvh+4NqMb
 ZOhuy6UVs48zyMpERN3FfnJgoaMKLraZNKOqIlaEmXhj7IfJ/3QhfWHiFs8Tg2mnDlhK
 LNpw==
X-Gm-Message-State: AOAM532DYFSqvbqQpARHAFuVGR3kvXJjs37r2E1gcs0HYSnLtA9mJvPz
 w77lHpGNYd2yAsklCrDmp5ZLxUfOlVJwfiV19SlTGA==
X-Google-Smtp-Source: ABdhPJy9vgAGYpXdpv0uf2hp1SXdndgC51mZLSAjGXH1Gg6X3SROo0oXi4LSM/YqHR5iN6uSqOAlNay7qymDiLUx49c=
X-Received: by 2002:a92:c5af:: with SMTP id r15mr41169ilt.88.1602694053274;
 Wed, 14 Oct 2020 09:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
 <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
 <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
In-Reply-To: <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 14 Oct 2020 18:47:22 +0200
Message-ID: <CAOwMV_wpsh=c0r7U-FM6ffz_Sq3HD9PJKoDv+auyhV2ER8_pVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_124735_131647_995D72E7 
X-CRM114-Status: GOOD (  21.81  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDY6MjUgUE0gRmFiaWVuIFBh
cmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDM6MDAgUE0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpLCBGYWJpZW46Cj4gPgo+ID4gRmFiaWVu
IFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+IOaWvCAyMDIw5bm0MTDmnIgxNOaXpSDpgLHk
uIkg5LiK5Y2IMjoxOeWvq+mBk++8mgo+ID4gPgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgSERNSSBv
biBNVDgxNjcuIEhETUkgb24gTVQ4MTY3IGlzIHNpbWlsYXIgdG8KPiA+ID4gTVQ4MTczL01UMjcw
MSBleGVjcHQgZm9yIHRoZSB0d28gcmVnaXN0ZXJzOiBTWVNfQ0ZHMUMgYW5kIFNZU19DRkcyMAo+
ID4KPiA+IEkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8g
TWVkaWF0ZWsgSERNSQo+ID4gYmluZGluZyBkb2N1bWVudCBbMV0sIHRoZSBzZWNvbmQgcGFyYW1l
dGVyIG9mIG1lZGlhdGVrLHN5c2Nvbi1oZG1pIGlzCj4gPiB0aGUgcmVnaXN0ZXIgb2Zmc2V0LiBJ
IHRoaW5rIHlvdSBjb3VsZCBzZXQgcmVnaXN0ZXIgb2Zmc2V0IHRvIDB4ODAwCj4gPiBmb3IgbXQ4
MTY3Lgo+IE9rLCB0aGFuayB5b3UuIEkgd2lsbCB0cnkgaXQuCgpUaGFua3MsIGl0IHdvcmtzLiBE
cm9wcGluZyB0aGlzIHNlcmllcy4KCj4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssaGRt
aS50eHQ/aD12NS45Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4K
PiA+ID4gLS0tCj4gPiA+Cj4gPiA+IENoYW5nZWxvZzoKPiA+ID4gdjI6IGZpeCBuYW1lIG9mIHBk
YXRhIHN0cnVjdHVyZQo+ID4gPgo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgICAgICB8IDcgKysrKysrKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX3JlZ3MuaCB8IDIgKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiA+IGluZGV4
IDU3MzcwYzAzNjQ5Ny4uNDg0ZWE5Y2Q2NTRhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYwo+ID4gPiBAQCAtMTgzNSw5ICsxODM1LDE2IEBAIHN0YXRpYyBzdHJ1
Y3QgbXRrX2hkbWlfZGF0YSBtdDgxNzNfaGRtaV9kcml2ZXJfZGF0YSA9IHsKPiA+ID4gICAgICAg
ICAuc3lzX2NmZzIwID0gSERNSV9TWVNfQ0ZHMjAsCj4gPiA+ICB9Owo+ID4gPgo+ID4gPiArc3Rh
dGljIHN0cnVjdCBtdGtfaGRtaV9kYXRhIG10ODE2N19oZG1pX2RyaXZlcl9kYXRhID0gewo+ID4g
PiArICAgICAgIC5zeXNfY2ZnMWMgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMsCj4gPiA+ICsgICAg
ICAgLnN5c19jZmcyMCA9IE1UODE2N19IRE1JX1NZU19DRkcyMCwKPiA+ID4gK307Cj4gPiA+ICsK
PiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1faGRtaV9vZl9p
ZHNbXSA9IHsKPiA+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1o
ZG1pIiwKPiA+ID4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19oZG1pX2RyaXZlcl9kYXRhIH0s
Cj4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCj4g
PiA+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdfaGRtaV9kcml2ZXJfZGF0YSB9LAo+ID4gPiAg
ICAgICAgIHt9Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaV9yZWdzLmgKPiA+ID4gaW5kZXggMjA1MGJhNDViMjNhLi5hMGY5YzM2N2Q3YWEgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4g
PiBAQCAtMTk1LDYgKzE5NSw3IEBACj4gPiA+ICAjZGVmaW5lIEdFTl9SR0IgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICgwIDw8IDcpCj4gPiA+Cj4gPiA+ICAjZGVmaW5lIEhETUlfU1lT
X0NGRzFDICAgICAgICAgMHgwMDAKPiA+ID4gKyNkZWZpbmUgTVQ4MTY3X0hETUlfU1lTX0NGRzFD
ICAweDgwMAo+ID4gPiAgI2RlZmluZSBIRE1JX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMCkKPiA+ID4gICNkZWZpbmUgSERNSV9SU1QgICAgICAgICAgICAgICAgICAgICAg
IEJJVCgxKQo+ID4gPiAgI2RlZmluZSBBTkxHX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMikKPiA+ID4gQEAgLTIxMSw2ICsyMTIsNyBAQAo+ID4gPiAgI2RlZmluZSBIVFBM
R19QSU5fU0VMX09GRiAgICAgICAgICAgICAgQklUKDMwKQo+ID4gPiAgI2RlZmluZSBBRVNfRUZV
U0VfRU5BQkxFICAgICAgICAgICAgICAgQklUKDMxKQo+ID4gPiAgI2RlZmluZSBIRE1JX1NZU19D
RkcyMCAgICAgICAgIDB4MDA0Cj4gPiA+ICsjZGVmaW5lIE1UODE2N19IRE1JX1NZU19DRkcyMCAg
MHg4MDQKPiA+ID4gICNkZWZpbmUgREVFUF9DT0xPUl9NT0RFX01BU0sgICAgICAgICAgICgzIDw8
IDEpCj4gPiA+ICAjZGVmaW5lIENPTE9SXzhCSVRfTU9ERSAgICAgICAgICAgICAgICAgICAgICAg
ICgwIDw8IDEpCj4gPiA+ICAjZGVmaW5lIENPTE9SXzEwQklUX01PREUgICAgICAgICAgICAgICAo
MSA8PCAxKQo+ID4gPiAtLQo+ID4gPiAyLjI4LjAKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
