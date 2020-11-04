Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C180C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 05:07:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E71621556
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 05:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NcbYNeb+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FH46GHWx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsbawDsG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E71621556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6sets1ujtMm134appvjVZzVexVcNUCvaPbnrngTmDBY=; b=NcbYNeb+OWiQ1D7MADu7WfV0E
	cIrlGkaNoiUcz7Ut+7cJWQ8NNBMReCgzEcZAvTdmwNtVUL1ErWWsYhmQTSRxia/E68wisZxWwL1az
	wIvAkMnyqiuD9yBCib7DfSHg+FoZF4foAFYfIY3tbvDKWCDvMK/GpJmHQl7hnQs12devomAPth3BQ
	leXTFLnJss4nZdQk2ZfyQ5G1yIBjMt8VlA8b64yVFfMhstijLwRwCevUfhFatoopo0Nk2I5snyr7X
	LdBwjNesMQgoLutfmDf7W5PX2P8nSWDExKHFaEGvrdWpJvOEJo67k6VOeT3ZKBMvMeqOnck2HtV24
	yNpNfUWwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXUa-0005lV-Sb; Thu, 05 Nov 2020 05:07:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW4D-000145-K0; Thu, 05 Nov 2020 03:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=e91Mn+tIfjTQCCBf3TfjxwQ/KJopJcc0RlLHy8ayUJ8=; b=FH46GHWxkALGftb/Zr+Q9xXA5d
 34P/Z5WUCUZ5lG+JqOl1KhFC81P9tJmHiY9MYKeCsXzGb+d44jq47L0UnsSsa3RvJmuYCbrOP7PKN
 E2s/q+W49zK8MHLurXoOhXk8hSPj2SUdUXsRFeqL0ajaHCjSDnr169jiaK3ECuICn1sQlcEGV/BrH
 fbYJgkVI18e2MZ/UJR1N4zgRawBphoGW+XXkQa/r96vtLvRTvaP1DDQACSpwQRPKRuZLrIfitZegT
 BaCcNPERjYEHb1ia2tpbcET5g4mK+PjriyfypZZgGWBiwzPvjFsygdS3C7QvaA+ZMd028n2soJfi9
 28jv3Hzg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSYI-0007QJ-Qz; Wed, 04 Nov 2020 23:50:57 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDE8122206;
 Wed,  4 Nov 2020 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604533844;
 bh=rZVugjYB/4k+eXAwY+hWif6/XHITjDjkK7t3jd5Csy4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EsbawDsGEKH+HSWm5ZqrktZxUyNrCzYQca0ZDpvEtrcVpRXlKY6HNjfKKJ+3WlkQh
 BUK08Kd8M9xHJnWndv2aR9KWEJu5dOWzc5R/c7qA0Y37gn0u3HfLFO48b/npedoL1B
 j23Ym4si1TZbG6lj5jRJmyUiNKEgChO4xSbi2meE=
Received: by mail-ed1-f53.google.com with SMTP id k9so56311edo.5;
 Wed, 04 Nov 2020 15:50:43 -0800 (PST)
X-Gm-Message-State: AOAM533dskXtAT/mRUdzdeyo7WY0sBQEitAPwE2m5Ihx61PiXODwouJ0
 lKyKP6O4FU8X99TQpmAr6dmZrVzPjiSir6u0yQ==
X-Google-Smtp-Source: ABdhPJw2MFzA4i3gboFt85gvfEIsJhYi9NkO2Z8ek0sVWS6OAHSRmjU7y5MiPocAd0n+Veh84MiPymNv3gkFS0LgVtE=
X-Received: by 2002:a50:d587:: with SMTP id v7mr306527edi.38.1604533842193;
 Wed, 04 Nov 2020 15:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20201005162241.172912-1-enric.balletbo@collabora.com>
 <9752ce85-a3e3-1e2f-c9d8-eae729364fee@collabora.com>
In-Reply-To: <9752ce85-a3e3-1e2f-c9d8-eae729364fee@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 5 Nov 2020 07:50:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__yPAph065cbgL8St5U4auW9H8mfWJrT67q5HVNiAmsBA@mail.gmail.com>
Message-ID: <CAAOTY__yPAph065cbgL8St5U4auW9H8mfWJrT67q5HVNiAmsBA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Fix unused variable
 'mtk_dpi_encoder_funcs'
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_235055_339932_98250837 
X-CRM114-Status: GOOD (  18.53  )
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
 Nicolas Boichat <drinkcat@chromium.org>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQxMeaciDTml6Ug6YCx5LiJIOS4i+WNiDY6NDDlr6vpgZPvvJoK
Pgo+IEhpCj4KPiBPbiA1LzEwLzIwIDE4OjIyLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3Rl
Ogo+ID4gQ29tbWl0IGY4OWM2OTZlN2Y2MyAoImRybS9tZWRpYXRlazogbXRrX2RwaTogQ29udmVy
dCB0byBicmlkZ2UgZHJpdmVyIikKPiA+IGludHJvZHVjZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3
YXJuaW5nIHdpdGggVz0xCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmM6NTMwOjM5OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ210a19kcGlfZW5jb2Rlcl9mdW5j
cycgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlXQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2VuY29kZXJfZnVuY3MgbXRrX2RwaV9lbmNvZGVyX2Z1bmNzID0gewo+ID4KPiA+IFRoaXMgc3Ry
dWN0IGlzIGFuZCB0aGUgJ210a19kcGlfZW5jb2Rlcl9kZXN0cm95KCknIGFyZSBub3QgbmVlZGVk
Cj4gPiBhbnltb3JlLCBzbyByZW1vdmUgdGhlbS4KPiA+Cj4gPiBGaXhlczogZjg5YzY5NmU3ZjYz
ICgiZHJtL21lZGlhdGVrOiBtdGtfZHBpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIiKQo+ID4g
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3Jh
LmNvbT4KPiA+IC0tLQo+Cj4gQSBnZW50bGUgcGluZyBvbiB0aGlzIHNtYWxsIGZpeC4gVGhhbmtz
LAoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tZml4ZXMgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xp
bnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLWZpeGVzCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
Pgo+ICAgRW5yaWMKPgo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5j
IHwgOSAtLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IDU4OWVmMzNhMTc4MC4uMjYw
OWQ5MTdlM2Y5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gQEAg
LTUyMiwxNSArNTIyLDYgQEAgc3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3Ry
dWN0IG10a19kcGkgKmRwaSwKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtc3Rh
dGljIHZvaWQgbXRrX2RwaV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyKQo+ID4gLXsKPiA+IC0gICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7Cj4gPiAt
fQo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgbXRrX2Rw
aV9lbmNvZGVyX2Z1bmNzID0gewo+ID4gLSAgICAgLmRlc3Ryb3kgPSBtdGtfZHBpX2VuY29kZXJf
ZGVzdHJveSwKPiA+IC19Owo+ID4gLQo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9icmlkZ2VfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKPiA+ICB7Cj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
