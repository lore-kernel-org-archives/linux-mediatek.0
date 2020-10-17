Return-Path: <SRS0=1jDH=DY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0955EC433E7
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 02:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FFD20756
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Oct 2020 02:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYF8uyfz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T534dyX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FFD20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qz2iAHQpZM7BZtqOTzC1oMYyw9rVN4Q4htTOPfrkhHc=; b=FYF8uyfzpcSQS5uxgBtz2RM4c
	3c6wobW6pd5PXr5TjgAUXvnCYqzssWJ68IHJWVSIShn2A4IMXZa2fy/w3YI6vGwfVBDEo1iQJD8+0
	4+pJ7WvK34QCxW8QatPpo2xzkxEQHCPNcLl7Nm0j21p5/W2RhgggZ8oHn/sBwNm10ghjlJk849nLF
	sS7fdF4K70fhmUrBlwiXiMg1aETXZL9IxcC1RVxthAtLCnFUBpWFErWaAb1r/v9KNRK4kwrC2AymT
	Cf5dnD3Uv2eGEIgZbYIuEubR2pugQrYCor3Cy/xV8i89b73BA08bavrVr4TUTINTQ9Tq2zcoPIfie
	4ciBAF4+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTcJS-00020j-WA; Sat, 17 Oct 2020 02:51:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTcJN-0001zX-Te; Sat, 17 Oct 2020 02:51:15 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA76D20756;
 Sat, 17 Oct 2020 02:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602903071;
 bh=Gr3nGfsG3c90q2Jwo99IVkvbuKxMDLVUT2x1M7u1RTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T534dyX6m9WKLTAbNTVOnQhq0+weumEhQjaOBlZkhrWmittJHHYXDdn8hyUQ04ziZ
 BGt460aru1rdqAmm46s6j5tkWcQaN5bg1ihZIklRR2nxxLB6SbrKxf1j6TU58n4hUK
 ilYxSyUdtGH4UTzFMV0+wkQzOazSvEScg0vs0SGM=
Received: by mail-ed1-f54.google.com with SMTP id cm24so4679700edb.0;
 Fri, 16 Oct 2020 19:51:10 -0700 (PDT)
X-Gm-Message-State: AOAM532ujGmIldMbZHuwHe0vDoTCb9yLWTguKASoc3cDd1DlgHuDRoL2
 cnK2EzyfY8UO+20fEptsDh2fDZwK4ziGNt9mIQ==
X-Google-Smtp-Source: ABdhPJzeeOBiHIseq3aPT99tDKtn0oB87/Hc2OKRlRnxhLG7z3kaKy7+YvcHp12bFQwqGIaU7F6JOvPhv/BF8Tg2oPo=
X-Received: by 2002:a05:6402:c12:: with SMTP id
 co18mr7225456edb.162.1602903069286; 
 Fri, 16 Oct 2020 19:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201013085512.12857-1-bernard@vivo.com>
In-Reply-To: <20201013085512.12857-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 17 Oct 2020 10:50:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__r-2aQLK+oy6uRFnu3xExngBYrSAQ7jCfhWx+Ti0UgFw@mail.gmail.com>
Message-ID: <CAAOTY__r-2aQLK+oy6uRFnu3xExngBYrSAQ7jCfhWx+Ti0UgFw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Optimize functions which do not need to
 return
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_225114_174106_F5E1CDC1 
X-CRM114-Status: GOOD (  17.73  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPiDmlrwgMjAyMOW5tDEw5pyIMTPml6Ug6YCx
5LqMIOS4i+WNiDQ6NTXlr6vpgZPvvJoKPgo+IEZ1bmN0aW9uIG10a19oZG1pX2F1ZF9zZXRfaW5w
dXQgYWx3YXlzIHJldHVybiAwLCBubyBuZWVkIHRvCj4ga2VlcCB0aGUgcmV0dXJuIHZhbHVlLiBG
dW5jdGlvbnMgbXRrX2hkbWlfYXVkX2VuYWJsZV9wYWNrZXQgJgo+IG10a19oZG1pX2F1ZF9vbl9v
ZmZfaHdfbmN0cyBhcmUgdGhlIHNhbWUsIHRoZXNlIHR3byBmdW5jdGlvbnMKPiBqdXN0IGNhbGwg
bmV4dCBmdW5jdGlvbnMuIE1heWJlIGl0YHMgYSBiaXQgYmV0dGVyIHRvIGp1c3QgY2FsbAo+IHRo
ZSBpbm5lciBmdW5jdGlvbi4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRA
dml2by5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwg
MjcgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiBpbmRleCBhOTc3MjU2ODBkNGUuLmYxZDk4N2RmMDU1MCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAgLTg3MCwxOSArODcwLDggQEAgc3RhdGljIHZvaWQgbXRr
X2hkbWlfdmlkZW9fc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gICAg
ICAgICBtdGtfaGRtaV9od19tc2ljX3NldHRpbmcoaGRtaSwgbW9kZSk7Cj4gIH0KPgo+IC1zdGF0
aWMgaW50IG10a19oZG1pX2F1ZF9lbmFibGVfcGFja2V0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwg
Ym9vbCBlbmFibGUpCj4gLXsKPiAtICAgICAgIG10a19oZG1pX2h3X3NlbmRfYXVkX3BhY2tldCho
ZG1pLCBlbmFibGUpOwo+IC0gICAgICAgcmV0dXJuIDA7Cj4gLX0KPgo+IC1zdGF0aWMgaW50IG10
a19oZG1pX2F1ZF9vbl9vZmZfaHdfbmN0cyhzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIGJvb2wgb24p
Cj4gLXsKPiAtICAgICAgIG10a19oZG1pX2h3X25jdHNfZW5hYmxlKGhkbWksIG9uKTsKPiAtICAg
ICAgIHJldHVybiAwOwo+IC19Cj4gLQo+IC1zdGF0aWMgaW50IG10a19oZG1pX2F1ZF9zZXRfaW5w
dXQoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ICtzdGF0aWMgdm9pZCBtdGtfaGRtaV9hdWRfc2V0
X2lucHV0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkKPiAgewo+ICAgICAgICAgZW51bSBoZG1pX2F1
ZF9jaGFubmVsX3R5cGUgY2hhbl90eXBlOwo+ICAgICAgICAgdTggY2hhbl9jb3VudDsKPiBAQCAt
OTEyLDggKzkwMSw2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkX3NldF9pbnB1dChzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWkpCj4gICAgICAgICBjaGFuX2NvdW50ID0gbXRrX2hkbWlfYXVkX2dldF9j
aG5sX2NvdW50KGNoYW5fdHlwZSk7Cj4gICAgICAgICBtdGtfaGRtaV9od19hdWRfc2V0X2kyc19j
aGFuX251bShoZG1pLCBjaGFuX3R5cGUsIGNoYW5fY291bnQpOwo+ICAgICAgICAgbXRrX2hkbWlf
aHdfYXVkX3NldF9pbnB1dF90eXBlKGhkbWksIGhkbWktPmF1ZF9wYXJhbS5hdWRfaW5wdXRfdHlw
ZSk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IG10a19oZG1p
X2F1ZF9zZXRfc3JjKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwKPiBAQCAtOTIxLDcgKzkwOCw3IEBA
IHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkX3NldF9zcmMoc3RydWN0IG10a19oZG1pICpoZG1pLAo+
ICB7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgc2FtcGxlX3JhdGUgPSBoZG1pLT5hdWRfcGFyYW0u
Y29kZWNfcGFyYW1zLnNhbXBsZV9yYXRlOwo+Cj4gLSAgICAgICBtdGtfaGRtaV9hdWRfb25fb2Zm
X2h3X25jdHMoaGRtaSwgZmFsc2UpOwo+ICsgICAgICAgbXRrX2hkbWlfaHdfbmN0c19lbmFibGUo
aGRtaSwgZmFsc2UpOwo+ICAgICAgICAgbXRrX2hkbWlfaHdfYXVkX3NyY19kaXNhYmxlKGhkbWkp
Owo+ICAgICAgICAgbXRrX2hkbWlfY2xlYXJfYml0cyhoZG1pLCBHUkxfQ0ZHMiwgQ0ZHMl9BQ0xL
X0lOVik7Cj4KPiBAQCAtOTU5LDcgKzk0Niw3IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkX291
dHB1dF9jb25maWcoc3RydWN0IG10a19oZG1pICpoZG1pLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRpc3BsYXlfbW9kZSkK
PiAgewo+ICAgICAgICAgbXRrX2hkbWlfaHdfYXVkX211dGUoaGRtaSk7Cj4gLSAgICAgICBtdGtf
aGRtaV9hdWRfZW5hYmxlX3BhY2tldChoZG1pLCBmYWxzZSk7Cj4gKyAgICAgICBtdGtfaGRtaV9o
d19zZW5kX2F1ZF9wYWNrZXQoaGRtaSwgZmFsc2UpOwo+Cj4gICAgICAgICBtdGtfaGRtaV9hdWRf
c2V0X2lucHV0KGhkbWkpOwo+ICAgICAgICAgbXRrX2hkbWlfYXVkX3NldF9zcmMoaGRtaSwgZGlz
cGxheV9tb2RlKTsKPiBAQCAtOTY4LDggKzk1NSw4IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVk
X291dHB1dF9jb25maWcoc3RydWN0IG10a19oZG1pICpoZG1pLAo+Cj4gICAgICAgICB1c2xlZXBf
cmFuZ2UoNTAsIDEwMCk7Cj4KPiAtICAgICAgIG10a19oZG1pX2F1ZF9vbl9vZmZfaHdfbmN0cyho
ZG1pLCB0cnVlKTsKPiAtICAgICAgIG10a19oZG1pX2F1ZF9lbmFibGVfcGFja2V0KGhkbWksIHRy
dWUpOwo+ICsgICAgICAgbXRrX2hkbWlfaHdfbmN0c19lbmFibGUoaGRtaSwgdHJ1ZSk7Cj4gKyAg
ICAgICBtdGtfaGRtaV9od19zZW5kX2F1ZF9wYWNrZXQoaGRtaSwgdHJ1ZSk7Cj4gICAgICAgICBt
dGtfaGRtaV9od19hdWRfdW5tdXRlKGhkbWkpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiBA
QCAtMTA5NywxMyArMTA4NCwxMyBAQCBzdGF0aWMgaW50IG10a19oZG1pX291dHB1dF9pbml0KHN0
cnVjdCBtdGtfaGRtaSAqaGRtaSkKPgo+ICBzdGF0aWMgdm9pZCBtdGtfaGRtaV9hdWRpb19lbmFi
bGUoc3RydWN0IG10a19oZG1pICpoZG1pKQo+ICB7Cj4gLSAgICAgICBtdGtfaGRtaV9hdWRfZW5h
YmxlX3BhY2tldChoZG1pLCB0cnVlKTsKPiArICAgICAgIG10a19oZG1pX2h3X3NlbmRfYXVkX3Bh
Y2tldChoZG1pLCB0cnVlKTsKPiAgICAgICAgIGhkbWktPmF1ZGlvX2VuYWJsZSA9IHRydWU7Cj4g
IH0KPgo+ICBzdGF0aWMgdm9pZCBtdGtfaGRtaV9hdWRpb19kaXNhYmxlKHN0cnVjdCBtdGtfaGRt
aSAqaGRtaSkKPiAgewo+IC0gICAgICAgbXRrX2hkbWlfYXVkX2VuYWJsZV9wYWNrZXQoaGRtaSwg
ZmFsc2UpOwo+ICsgICAgICAgbXRrX2hkbWlfaHdfc2VuZF9hdWRfcGFja2V0KGhkbWksIGZhbHNl
KTsKPiAgICAgICAgIGhkbWktPmF1ZGlvX2VuYWJsZSA9IGZhbHNlOwo+ICB9Cj4KPiAtLQo+IDIu
MjguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
