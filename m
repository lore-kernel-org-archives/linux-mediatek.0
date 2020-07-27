Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34325C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:26:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41E320672
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUwlLpAL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ufvCrz6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41E320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2LCyMVvLf8GPGRVah85xPTEUgcqJogAdzjuz/N+nR2Q=; b=MUwlLpALsavkiiEViTvE+H/Q8
	SVnGFKsXXEaiSxnvlJXax65k2t2Wbym0xQ/GBujKMI8KzGneImWS4hBHhp9ba3RWHaRSjqd8o3FVQ
	F3u3x21jcAwP0CX5QJpbz/Y64KqZ7bdQXEBHS8YA9NIzJ4m9buwq0AIvzMgQfwvbiIgDrEqHi48FD
	pvZDw28BFTDiQnmIhnEYz9J2dBjozcVASpLBl825zqwc2nNzxSJ2lTb8ZcnzbJ3zdjl465AyPMCXW
	lZcjX7qITROHLbEwvEOXG4aAdeviVEFT8MFqm0Vce+BNpCTe8bqM54L/JT8zEg4QvNhepP6QtmLx2
	yC8wwZoIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02Cq-0005Rb-KZ; Mon, 27 Jul 2020 12:26:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02Co-0005Qi-88
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 12:26:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id o8so13974076wmh.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6rri9mhUlxebznKAimXAy/9Cm8FbvWLt4+hoq73h+fg=;
 b=ufvCrz6ZcjseH/gYg4ZTe6zEzxxBdDu/FZzW+/moozUD7jvBaNfqZjv5A34h1JVTTs
 1xUt+sX775nu+Yzz4gUmHcEUURBPs8CEXsKysjYQa3Jsp/Slud4vARhsOSDOw9frRPSL
 oWDSF2sO2uCcLCHI1HE4FMsLLnvI0/JbptlThAhgwh3XZnV36rbo77kCysTpTKvl71AY
 19eYrNtuElNUaUVL1ockn7C2N7XlkPEmKnXxUizQp/NjgFHkdR58DfsHP8TtcZ3DBqkO
 hyNR6OVv0YaBW1U3E4gv93FjcTVb38WOk7tfeX1re5BF3t/j120PMfmQ1AZi7wqTcv0b
 Fi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6rri9mhUlxebznKAimXAy/9Cm8FbvWLt4+hoq73h+fg=;
 b=dxf81T12jriO4NmKZXmtt8XXkB2xNDv0p0xUgJCojUB77bRgwKiMToPjQ4CJvYQq+w
 TYxsL39qPWEODi7HF6bBpnnxUBmKsIlNKUDScgm06fpkNXA2bwhi6vAB7de7+C8JfYeO
 aOrpP33xhzLTwUd7f6HvssEA4LGmLlRf53PGlWIVJ4uD5HoyjfVXIeKyNJEKVuulZ1ha
 6fvs/XEVj8JUk8YPrO9ha5JRcORsu+reNrATKQQ/Q1EQrez84kVrmp0mVd7JDEPykez9
 l3fCA5+LkibQrdbxQToWS+Nk/HL4OcnWTOtSKfQpVBNTCxvRaZA1nr+M2VNduQTWunbG
 ySHw==
X-Gm-Message-State: AOAM530dIi7Gybp0SMCQPb1EyaAwyzgVGP++391cOySumG/w0RdbYet2
 kopDgUf0PWWITxfYfmo2ayJS+g==
X-Google-Smtp-Source: ABdhPJxWRBzQIb/NGY4w/mLgO/880v6aJtaTUgabR7iHW48GPvS3Zr/z4csjZpZBpu9zq+g/LhATtQ==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr21108863wmk.41.1595852769343; 
 Mon, 27 Jul 2020 05:26:09 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id n189sm7842688wmn.40.2020.07.27.05.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:26:08 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:26:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 8/9] mfd: mt6360: Fix flow which is used to check ic
 exist
Message-ID: <20200727122557.GO1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-9-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-9-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_082610_328280_9FBE0D2D 
X-CRM114-Status: GOOD (  20.33  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBGaXggZmxvdyB3aGljaCBpcyB1c2VkIHRvIGNo
ZWNrIGljIGV4aXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJp
Y2h0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMjggKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiBpbmRleCA1YTY4MjI4Li4zMTg2YTdj
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiArKysgYi9kcml2ZXJz
L21mZC9tdDYzNjAtY29yZS5jCj4gQEAgLTI5Myw2ICsyOTMsMjMgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtZmRfY2VsbCBtdDYzNjBfZGV2c1tdID0gewo+ICAJCSAgICBOVUxMLCAwLCAwLCAibWVk
aWF0ZWssbXQ2MzYwLXRjcGMiKSwKPiAgfTsKPiAgCj4gK3N0YXRpYyBpbnQgbXQ2MzYwX2NoZWNr
X3ZlbmRvcl9pbmZvKHN0cnVjdCBtdDYzNjBfZGF0YSAqZGF0YSkKPiArewo+ICsJdTMyIGluZm87
Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IHJlZ21hcF9yZWFkKGRhdGEtPnJlZ21hcCwgTVQ2
MzYwX1BNVV9ERVZfSU5GTywgJmluZm8pOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJl
dDsKPiArCj4gKwlpZiAoKGluZm8gJiBDSElQX1ZFTl9NQVNLKSAhPSBDSElQX1ZFTl9NVDYzNjAp
Cj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICsJZGF0YS0+Y2hpcF9yZXYgPSBpbmZvICYgQ0hJ
UF9SRVZfTUFTSzsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHVu
c2lnbmVkIHNob3J0IG10NjM2MF9zbGF2ZV9hZGRyW01UNjM2MF9TTEFWRV9NQVhdID0gewo+ICAJ
TVQ2MzYwX1BNVV9TTEFWRUlELAo+ICAJTVQ2MzYwX1BNSUNfU0xBVkVJRCwKPiBAQCAtMzAzLDcg
KzMyMCw2IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBzaG9ydCBtdDYzNjBfc2xhdmVfYWRkcltN
VDYzNjBfU0xBVkVfTUFYXSA9IHsKPiAgc3RhdGljIGludCBtdDYzNjBfcHJvYmUoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCkKPiAgewo+ICAJc3RydWN0IG10NjM2MF9kYXRhICpkYXRhOwo+IC0J
dW5zaWduZWQgaW50IHJlZ19kYXRhOwo+ICAJaW50IGksIHJldDsKPiAgCj4gIAlkYXRhID0gZGV2
bV9remFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gQEAg
LTMxOSwxNiArMzM1LDEwIEBAIHN0YXRpYyBpbnQgbXQ2MzYwX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpCj4gIAkJcmV0dXJuIFBUUl9FUlIoZGF0YS0+cmVnbWFwKTsKPiAgCX0KPiAg
Cj4gLQlyZXQgPSByZWdtYXBfcmVhZChkYXRhLT5yZWdtYXAsIE1UNjM2MF9QTVVfREVWX0lORk8s
ICZyZWdfZGF0YSk7Cj4gKwlyZXQgPSBtdDYzNjBfY2hlY2tfdmVuZG9yX2luZm8oZGF0YSk7Cj4g
IAlpZiAocmV0KSB7Cj4gLQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJEZXZpY2Ugbm90IGZvdW5k
XG4iKTsKPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+IC0KPiAtCWRhdGEtPmNoaXBfcmV2ID0gcmVn
X2RhdGEgJiBDSElQX1JFVl9NQVNLOwo+IC0JaWYgKGRhdGEtPmNoaXBfcmV2ICE9IENISVBfVkVO
X01UNjM2MCkgewo+ICAJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRGV2aWNlIG5vdCBzdXBwb3J0
ZWRcbiIpOwoKQ2FuIHlvdSBtb3ZlIHRoaXMgaW50byBtdDYzNjBfY2hlY2tfdmVuZG9yX2luZm8o
KSB0b28gcGxlYXNlPwoKPiAtCQlyZXR1cm4gLUVOT0RFVjsKPiArCQlyZXR1cm4gcmV0Owo+ICAJ
fQo+ICAKPiAgCXJldCA9IGRldm1fcmVnbWFwX2FkZF9pcnFfY2hpcCgmY2xpZW50LT5kZXYsIGRh
dGEtPnJlZ21hcCwgY2xpZW50LT5pcnEsCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
