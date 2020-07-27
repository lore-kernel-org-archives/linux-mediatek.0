Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF4C433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C37620786
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 12:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChqEAZbX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l78o4thx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C37620786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4rVmRsPZds150mjfVIckGYzDcreYtfQ7UQ+wlQ1/uLw=; b=ChqEAZbX6L3JLQK77CvTTi036
	2cKPI7hzaxbmIe9gYRCTrHSsScgVL58gLqi7lF0TQNgACVBSGX7YgZXPSu0vYMULXxk2QgZ7juIEb
	KJJebFMqwEGIuoVsg45UjCb+1YAhDDbGcL3Tx+i3N7KVOQQVq+bf5gFYTDIxa+KK10OFiyztZxKmF
	SNub/yTYFRbIaElkNMbjTxoq7tgpm6eAuuQsHGvBagEjsT31HF6NGyUg7XLFqGdq3i6527ZBlM5RS
	8JiBWOQd5alzLCDQSl8xalbX8iscob6fFUvdoEeEBMWLigXJpOwVe4p7ysPF1HthtIkq1A4Q7068B
	vOvFN3izA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k01u4-0002hR-N7; Mon, 27 Jul 2020 12:06:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k01u0-0002gA-He
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 12:06:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id t142so8138016wmt.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 05:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5UvigPasIrEc+VPwUEGBhdkiXGZn95eI7wd8yU/NXHk=;
 b=l78o4thxdBd3295c7pq1uvaxXqQTXHoIQBDLzkseo8M7LFVeKFainbABNhEmZapKRT
 P5oJ4Vup4dtsW/3gtAbTrXJDdAlShl6zK2tUyzN4TfvHhxQ3Y8ZGBRjs6AZFYJJGdAfm
 dwiY3NQxeS41hV5vvXoSrW6GPkCDFlVn4D4kODRAQ3qCN0cfix/c/oOLgYtyBDc3NpM5
 BZR2gyEtU8S5oFQbmcwpHagAGPNAyCjf2Df7FoOj1rkV+7XyHn6aUY3StpbafKoaM0el
 i5ke21itLgICKDUfYFWS9C2nWnpHfoKub8TU5N+gFSHLKtawF4HM1QcXrYDdVlQutv0M
 8Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5UvigPasIrEc+VPwUEGBhdkiXGZn95eI7wd8yU/NXHk=;
 b=Xwo+8DpZH8CJxKgApQE5g2W/PIfdlO0HiaRU3SsNus9gyx1+0lLDLbGGjMeldGgqDp
 nC6+Xgapn+ysyGuOmmgsFZYr9gKtGfDXcLL7tWI8KKpB1lqp2MuHydYbcIHV+/Fke0D4
 dc8M9CVasXfvI07TEIpNqr/AbI+g1eJYJ7zxL61Kr6yirPdzTX90wmR2cXrzf5RqCgyv
 8hVlcBgEqKasXtFuUuMhmunUeuAElguM+fDwQsZIH4plpfpmceK+5oQRdTGRz7ZyMu8G
 aRt52P1iOrriXcmmKXL/66PxCBYdjapJTHhz2fJoVTjhmv4jMrSdzMl/cU8HliitCXZV
 mliQ==
X-Gm-Message-State: AOAM533jPrRk4PzY+qqhcwHBdMbTUD4nW1+E4RCk7YdGOybIsyIA48aY
 aRli6eBORzZjcODpouhR/aFJXw==
X-Google-Smtp-Source: ABdhPJyuQ01S7wwBQxUL+QMuwikPrDGYc6VGrJ4m7+PH/d8swh6Q30/Gg3VIPA0xLk3rSz+BtA3rQg==
X-Received: by 2002:a1c:98c1:: with SMTP id
 a184mr20475238wme.116.1595851603333; 
 Mon, 27 Jul 2020 05:06:43 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id k4sm13177909wrd.72.2020.07.27.05.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:06:42 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:06:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 5/9] mfd: mt6360: Rename mt6360_pmu_data by mt6360_data
Message-ID: <20200727120641.GL1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-6-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-6-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_080644_743037_A79A2E17 
X-CRM114-Status: GOOD (  15.00  )
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
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZW5hbWUgbXQ2MzYwX3BtdV9kYXRhIGJ5IG10
NjM2MF9kYXRhIGJlY2F1c2Ugb2YgaW5jbHVkaW5nCj4gbm90IG9ubHkgUE1VIHBhcnQsIGJ1dCBh
bHNvIGVudGlyZSBNVDYzNjAgSUMuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5l
X2NoZW5AcmljaHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgIHwg
NDQgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVk
ZS9saW51eC9tZmQvbXQ2MzYwLmggfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9t
dDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+IGluZGV4IDY2NWUyNmYu
LjYyYmFlMWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiBAQCAtMjEwLDkgKzIxMCw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVnbWFwX2lycSBtdDYzNjBfcG11X2lycXNbXSA9ICB7Cj4gIAo+ICBzdGF0
aWMgaW50IG10NjM2MF9wbXVfaGFuZGxlX3Bvc3RfaXJxKHZvaWQgKmlycV9kcnZfZGF0YSkKPiAg
ewo+IC0Jc3RydWN0IG10NjM2MF9wbXVfZGF0YSAqbXBkID0gaXJxX2Rydl9kYXRhOwo+ICsJc3Ry
dWN0IG10NjM2MF9kYXRhICpkYXRhID0gaXJxX2Rydl9kYXRhOwoKJ2RhdGEnIGlzIGEgdGVycmli
bGUgdmFyaWFibGUgbmFtZS4KCkNvdWxkIHlvdSByZW5hbWUgdGhpcyAnZGRhdGEnIHBsZWFzZT8K
ClsuLi5dCgo+IC1zdHJ1Y3QgbXQ2MzYwX3BtdV9kYXRhIHsKPiArc3RydWN0IG10NjM2MF9kYXRh
IHsKClNhbWUgaGVyZSwgJ210NjM2MF9kZGF0YScuCgpPbmNlIHlvdSBtYWtlIHRoZXNlIGNoYW5n
ZXMsIHlvdSBjYW4gYWRkIG15OgoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMt
aXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
