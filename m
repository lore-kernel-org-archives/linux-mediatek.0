Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A41DC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136F22067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YK9w/gW1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9PsfJra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136F22067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QwonzDp0oKJvLVHhnesqkiRLATu2Zl9lPCCL9pW9Uqs=; b=YK9w/gW1AIQlm6kiSue4XmQeK
	atwQPRzfm9fzmE1GLbX2xkMR4bSut9iyrtXQT/ZXaco3FOZlpBQybBgNcYSyRRx/XLzNM95xxrC9a
	VohO6U9YK3X+3mfb1rSWNXqVVOA4/p5ht0zkcPEDzKGl6fHHi1BjH9LkXFfH8MnWLn+bovJCZVGER
	3PYbWVywZzHVNN4wmadnlcQawBpoUkvoq2/1Zy9pRQxDz9x5cbf+15PdMQTtcLJ2Fq+CEiH1tk7Fw
	UMtJrnkGfKvvZqbeT1AYrJwzRRT7pFkXO+7VjikatulLTJUjcrmtExTmigaNhd7RGkZWGuFmyBoD3
	HyAR72lfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAV1l-0004RL-JY; Tue, 25 Aug 2020 09:14:01 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAV1i-0004QG-0p; Tue, 25 Aug 2020 09:13:58 +0000
Received: by mail-il1-x142.google.com with SMTP id e11so9789171ils.10;
 Tue, 25 Aug 2020 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e5ThzYEzbweOX9AK40FRPwqF+0B+9KjoG4gy6j07O+s=;
 b=D9PsfJraNVZZzczEmo/ImHzAeNSbSBg1Vx9KnI2s0VqFH1ieYZjtEMg5NEKTW2iTg4
 lzLstK3DIPmSgykX1sOF0Mnz92NSHb8xnoHxnsnNywoN4bpAF7HLqzjPR9HHDMuZjfD4
 UMpryXfkdTuMiqCBJkdsqjX95CwLFCswo86UaJWMDyGDBlX76ASIFti4yOsGnYX6c2PD
 poy0zZ/dZ05EftN0S0znrJGKEzgPmd7Uajaap7r1we9xk6YOL2ZAXN+fvvufZfGfhI6Q
 kVtFj6Ottl5408EvM+tAUv2IEIMYfBOJ7N0WIJIFMVHvjhkTVaOUGZfsQk2w1pZDDil6
 C9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e5ThzYEzbweOX9AK40FRPwqF+0B+9KjoG4gy6j07O+s=;
 b=nb38w7IASk25j9l4BsWjNdV9bPE5rur2S3Hys4SqcqZHvKFBiW/65qa17jWDROKR1S
 mZE1XbObS7ELeVCCzpDurw/n0AUuk/bZiXDaWjy5srKTEdJpQTZfvwC+uIXwZoN+tXHr
 6f2U5k6b5/aDFzRKZXAPKML+OC6L5SQmzn7iKNrBv5rWzjI6daT6caRNAfmrf4AEFC7A
 cGQOkxUtbGyMeNAnohvM+MBdV7uQ5KGCnQdBRIyyCkMbrz4tAB4vnOnBYhLljhDC0Nie
 HKfxH8vETpMhlAY0iqqAJ3COU/neg/bw01yqpSPdAOaul4Hs2AcsRDEf0oGD9VxuOlMi
 ahLA==
X-Gm-Message-State: AOAM533kzX16yNifpG8TFse4d5UPm4BfskKd8K6yNbOVpzsDdbFRsTzy
 eVHcvt6lo0d2ou9mymE3Hn1mi13nVqIWzE8fJrE=
X-Google-Smtp-Source: ABdhPJxkGE/Ak8QiOBhgh/v/E2MCch1eEax9ocriOCg/LnbS6Ir9UtiHnywVsetJ+GNbQXQDybROB7SgftwxChw5bXw=
X-Received: by 2002:a92:d386:: with SMTP id o6mr8500809ilo.292.1598346834380; 
 Tue, 25 Aug 2020 02:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200820114524.GC5854@sirena.org.uk>
 <CAE+NS34WuWnT7zvsHhaciWVLT2y0wpwt0wXAp3UmjEuJ2its6A@mail.gmail.com>
 <20200824110458.GB4676@sirena.org.uk>
In-Reply-To: <20200824110458.GB4676@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 25 Aug 2020 17:13:43 +0800
Message-ID: <CAE+NS36ZK2pq8CAcmiqiUf6Ph5RET5aO4nUPFUd-EDHVEuharA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] regulator: mt6360: Add support for MT6360 regulator
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_051358_074809_63B7A74D 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyNOaXpSDpgLHk
uIAg5LiL5Y2INzowNeWvq+mBk++8mgoKCgo+Cj4gT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDY6
MjM6MTlQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2INzo0NeWvq+mBk++8
mgo+Cj4gPiA+IFRoaXMgZGV2aWNlIG9ubHkgZXhpc3RzIGluIHRoZSBjb250ZXh0IG9mIGEgc2lu
Z2xlIHBhcmVudCBkZXZpY2UsIHRoZXJlCj4gPiA+IHNob3VsZCBiZSBubyBuZWVkIGZvciBhIGNv
bXBhdGlibGUgc3RyaW5nIGhlcmUgLSB0aGlzIGlzIGp1c3QgYSBkZXRhaWwKPiA+ID4gb2YgaG93
IExpbnV4IGRvZXMgdGhpbmdzLiAgVGhlIE1GRCBzaG91bGQganVzdCBpbnN0bnRpYXRlIHRoZSBw
bGF0Zm9ybQo+ID4gPiBkZXZpY2UuCj4KPiA+IFRyeWluZyB0byBhdXRvbG9hZCBtb2R1bGUgd2l0
aG91dCBvZl9pZF90YWJsZSB3aWxsIGNhdXNlIHJ1bi10aW1lIGVycm9yOgo+ID4gdWV2ZW50ZDog
TG9hZFdpdGhBbGlhc2VzIHdhcyB1bmFibGUgdG8gbG9hZAo+ID4gb2Y6TnJlZ3VsYXRvclQobnVs
bClDbWVkaWF0ZWssbXQ2MzYwLXJlZ3VsYXRvcgo+Cj4gWW91IHNob3VsZG4ndCBoYXZlIHRoaXMg
ZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UgdHJlZSBhdCBhbGwsIGxpa2UgSSBzYXkKPiB0aGUgTUZE
IHNob3VsZCBqdXN0IGluc3RhbnRpYXRlIHRoZSBwbGF0Zm9ybSBkZXZpY2UuCgpBZnRlciBJIHJl
cGxhY2Ugb2ZfZGV2aWNlX2lkIGJ5IHBsYXRmb3JtX2RldmljZV9pZCBhcyBiZWxvdywgSSBjYW4K
YXV0b2xvYWQgbW9kdWxlLgpCdXQgSSBjYW4ndCBnZXQgb2Zfbm9kZSB0byBwYXJzZSBpbml0X2Rh
dGEuClNob3VsZCBJIHVzZSBkZXYtPnBhcmVudC0+b2Zfbm9kZSBhbmQgc2V0CnJlZ3VsYXRvcl9k
ZXNjLnJlZ3VsYXRvcl9ub2RlIHRvIHBhcnNlIGVhY2ggcmVndWxhdG9yIGRlZmluaXRpb24gaW4K
ZGV2aWNlIHRyZWU/CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2Ry
aXZlcnMvbWZkL210NjM2MC1jb3JlLmMKaW5kZXggZTk5NTIyMC4uNDQ0ZGM4ZSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYworKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29y
ZS5jCkBAIC0zMjgsNyArMzI4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZmRfY2VsbCBtdDYz
NjBfZGV2c1tdID0gewogICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGVkIiwgbXQ2MzYwX2xl
ZF9yZXNvdXJjZXMsCiAgICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10
NjM2MC1sZWQiKSwKICAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXJlZ3VsYXRvciIsIG10NjM2
MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAotICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjAtcmVndWxhdG9yIiksCisgICAgICAgICAgICAgICAgICAgTlVMTCwgMCwg
MCwgTlVMTCksCiAgICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC10Y3BjIiwgTlVMTCwKICAgICAg
ICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRjcGMiKSwKIH07CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9tdDYzNjAtcmVndWxhdG9yLmMKYi9kcml2ZXJz
L3JlZ3VsYXRvci9tdDYzNjAtcmVndWxhdG9yLmMKaW5kZXggOTdjMTZhMi4uZDUyNWJmMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvbXQ2MzYwLXJlZ3VsYXRvci5jCisrKyBiL2RyaXZl
cnMvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IuYwpAQCAtNDM4LDExICs0MzgsMTggQEAgc3Rh
dGljIGludCBtdDYzNjBfcmVndWxhdG9yX3Byb2JlKHN0cnVjdApwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAgICAgICAgcmV0dXJuIDA7CiB9Cgorc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2VfaWQgbXQ2MzYwX3JlZ3VsYXRvcl9pZFtdID0geworICAgICAgIHsgIm10NjM2MC1yZWd1
bGF0b3IiLCB9LAorICAgICAgIHsgfSwKK307CitNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3Jt
LCBtdDYzNjBfcmVndWxhdG9yX2lkKTsKKwogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
bXQ2MzYwX3JlZ3VsYXRvcl9kcml2ZXIgPSB7CiAgICAgICAgLmRyaXZlciA9IHsKICAgICAgICAg
ICAgICAgIC5uYW1lID0gIm10NjM2MC1yZWd1bGF0b3IiLAogICAgICAgIH0sCiAgICAgICAgLnBy
b2JlID0gbXQ2MzYwX3JlZ3VsYXRvcl9wcm9iZSwKKyAgICAgICAuaWRfdGFibGUgPSBtdDYzNjBf
cmVndWxhdG9yX2lkLAogfTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
