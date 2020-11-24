Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9A8C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 06:08:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3922076C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 06:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOCgg7mF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU4lpBhv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3922076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jUBuTTV/7WAeByUnAp15L18ZJR7uoN3wztIEaSbymTc=; b=JOCgg7mFbZrg9q7nwIe2rj21o
	qajVg+qBwTfcVOl71MzwiYCatQ1efRzd+ej8ZwO5q7WQKlhjoc8S2FVOmroQ9t9Q9i0xeMBDA9guW
	wpDjARnLufxsaWn9TZnA7tlXNcUlCLORrLPEgajKhcwWu7DdRHAw+C3jytfqCvXHVwgE14GqsnUfu
	3T9Ih2Tj50GrU9BklGkVdDC4XnJOhlqxN7mFJzgHA9mPwj7+76BBgcXG8x9Vc6XFxlPBSEaxbMIHQ
	6vxYFMOzTzjke9Yi/uIuLYKtpDygxgX26DPKqEJwzJjVqwQ+CFKk6YG+IZ1kAe8yeSgce7pjKRwzq
	0T9Zoa+8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khRVF-0006Oj-IU; Tue, 24 Nov 2020 06:08:37 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khRVB-0006O5-TP; Tue, 24 Nov 2020 06:08:34 +0000
Received: by mail-ot1-x342.google.com with SMTP id 92so15256337otd.5;
 Mon, 23 Nov 2020 22:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZoZU9eeGMyzNoZxXOK3ZAEdDwa+QPOxbaHh7UFCT0wc=;
 b=XU4lpBhv0aFJugQfK3M7VhAgUUnP7WAOSflhvzSNStfOtxkfRXCc33wrAtApXdxuZQ
 0+wviGLOV8JIq5EIbaOxmNue5mn9sLh+kZfbO8g3f0TCCgr2jKigT0nuuc45hcrtFTxu
 KZ+DM9mJxiyKuCSOOWccDSvGb8QlBXakSqTplL7bKxboHoQo8lI+LPpwgYZLCXS3anlJ
 BBsLrHs8tdWFbz6tPEvWlCBXYCdU/kujokGhWELriRgsaKcf/OT/aFgkZoX+N9y4Hz+t
 vitCLLvUCycIjOxCJx6Hj5G6AdT0achcPDXvBthueRW5QnPiMX2niAzlk/fWoHQISdkc
 4H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZoZU9eeGMyzNoZxXOK3ZAEdDwa+QPOxbaHh7UFCT0wc=;
 b=hTnnrkhK5uyyADMe48JJXUjFYotaj5KpVop72h5HtSUSOaWjX1J3vNkTAYsfzPQiNI
 Q7qNRi/X6o5LVdeS9jOk5BK+WRQ1xgJlJekdlyeMdsmGh+pZd/ERUAZcoZ1ka3X98yFm
 A/rv4Q5fYG3/5xgEU+arpCelQP8ylmSo32diEcGRnk5ZJUBx7IIrFQF05jjWlaVQyUIo
 6LuN2IGNpx/BZAVEo3ybfe5WDukzCWiypo81qkaBKLZQsbn6ZR8MTV/81v4/6MIA9t99
 ZaqaUC3RxZ3ziYQ6c/7WllnlJNhA5VT4V70AWEvp300V12ytBFLQ0VVxLIqovF/YWKTy
 ds4w==
X-Gm-Message-State: AOAM5306wNpjsu4ztsEUEyzLjaLTY2qEi9OLX30SnFkVb71VJXCviAft
 UoJZcNZA0hC/6ksNnt/rsNnN/9KBxvM5DwNoshw=
X-Google-Smtp-Source: ABdhPJxqWi0nnt7tIixUs46SG2tN319LJI4mJNVEAoecxwy6G+vIYHSn4lvL5dTmY6x9slv4vBfl76GjJMdINAew5y8=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr2342006otr.327.1606198110129; 
 Mon, 23 Nov 2020 22:08:30 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
 <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
 <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
In-Reply-To: <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 24 Nov 2020 14:08:19 +0800
Message-ID: <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_010833_981696_07FE81A3 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTHmnIgyNOaXpSDpgLHkuowg5LiK5Y2INTowN+Wvq+mBk++8mgo+Cj4gT24gMTEvMjMvMjAgNDoy
MCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pl
d3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0MTHmnIgyMOaXpSDpgLHkupQg5LiK5Y2INjoyOeWv
q+mBk++8mgo+ID4+Cj4gPj4gSGkgR2VuZSwKPiA+Pgo+ID4+IE9uIDExLzE4LzIwIDExOjQ3IEFN
LCBHZW5lIENoZW4gd3JvdGU6Cj4gPj4+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0
ZWsuY29tPgo+ID4+Pgo+ID4+PiBBZGQgZmxhc2ggcmVnaXN0cmF0aW9uIHdpdGggdW5kZWZpbmVk
IENPTkZJR19MRURTX0NMQVNTX0ZMQVNICj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEdlbmUg
Q2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgaW5jbHVkZS9s
aW51eC9sZWQtY2xhc3MtZmxhc2guaCB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+ID4+Pgo+
ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaCBiL2luY2x1
ZGUvbGludXgvbGVkLWNsYXNzLWZsYXNoLmgKPiA+Pj4gaW5kZXggMjFhMzM1OC4uNGY1NmMyOCAx
MDA2NDQKPiA+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaAo+ID4+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L2xlZC1jbGFzcy1mbGFzaC5oCj4gPj4+IEBAIC04NSw2ICs4NSw3
IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGxlZF9jbGFzc2Rldl9mbGFzaCAqbGNkZXZfdG9fZmxj
ZGV2KAo+ID4+PiAgICAgICAgcmV0dXJuIGNvbnRhaW5lcl9vZihsY2Rldiwgc3RydWN0IGxlZF9j
bGFzc2Rldl9mbGFzaCwgbGVkX2NkZXYpOwo+ID4+PiAgICB9Cj4gPj4+Cj4gPj4+ICsjaWYgSVNf
RU5BQkxFRChDT05GSUdfTEVEU19DTEFTU19GTEFTSCkKPiA+Pj4gICAgLyoqCj4gPj4+ICAgICAq
IGxlZF9jbGFzc2Rldl9mbGFzaF9yZWdpc3Rlcl9leHQgLSByZWdpc3RlciBhIG5ldyBvYmplY3Qg
b2YgTEVEIGNsYXNzIHdpdGgKPiA+Pj4gICAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW5pdCBkYXRhIGFuZCB3aXRoIHN1cHBvcnQgZm9yIGZsYXNoIExFRHMKPiA+Pj4gQEAgLTEy
Nyw2ICsxMjgsNDEgQEAgc3RhdGljIGlubGluZSBpbnQgZGV2bV9sZWRfY2xhc3NkZXZfZmxhc2hf
cmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAo+ID4+PiAgICB2b2lkIGRldm1fbGVkX2Ns
YXNzZGV2X2ZsYXNoX3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2X2Zs
YXNoICpmbGVkX2NkZXYpOwo+ID4+Pgo+ID4+PiArI2Vsc2UKPiA+Pj4gKwo+ID4+PiArc3RhdGlj
IGlubGluZSBpbnQgbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChzdHJ1Y3QgZGV2aWNl
ICpwYXJlbnQsCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
bGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYsCj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbGVkX2luaXRfZGF0YSAqaW5pdF9kYXRhKQo+ID4+PiArewo+
ID4+PiArICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Pgo+ID4+IHMvLUVJTlZBTC8wLwo+ID4+Cj4g
Pj4gVGhlIGdvYWwgaGVyZSBpcyB0byBhc3N1cmUgdGhhdCBjbGllbnQgd2lsbCBub3QgZmFpbCB3
aGVuIHVzaW5nIG5vLW9wLgo+ID4+Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4gK3N0YXRpYyBpbmxp
bmUgaW50IGxlZF9jbGFzc2Rldl9mbGFzaF9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpwYXJlbnQs
Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxl
ZF9jbGFzc2Rldl9mbGFzaCAqZmxlZF9jZGV2KQo+ID4+PiArewo+ID4+PiArICAgICByZXR1cm4g
bGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChwYXJlbnQsIGZsZWRfY2RldiwgTlVMTCk7
Cj4gPj4+ICt9Cj4gPj4KPiA+PiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBwbGFjZWQgYWZ0ZXIg
I2lmZGVmIGJsb2NrIGJlY2F1c2UgaXRzCj4gPj4gc2hhcGUgaXMgdGhlIHNhbWUgZm9yIGJvdGgg
Y2FzZXMuCj4gPj4KPiA+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsZWRfY2xhc3NkZXZfZmxhc2hf
dW5yZWdpc3RlcihzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYpIHt9Owo+ID4+
PiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9sZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0ZXJfZXh0
KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYsCj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxlZF9pbml0X2RhdGEgKmluaXRf
ZGF0YSkKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4KPiA+PiAvLUVJ
TlZBTC8wLwo+ID4+Cj4gPj4gUGxlYXNlIGRvIHRoZSBzYW1lIGZpeCBpbiBhbGwgbm8tb3BzIGlu
IHRoZSBsZWQtY2xhc3MtbXVsdGljb2xvci5oLAo+ID4+IGFzIHdlJ3ZlIGRpc2N1c3NlZC4KPiA+
Pgo+ID4KPiA+IEkgdGhpbmsgcmV0dXJuIC1FSU5WQUwgaXMgY29ycmVjdCwgYmVjYXVzZSBJIHNo
b3VsZCByZWdpc3RlciBmbGFzaAo+ID4gbGlnaHQgZGV2aWNlIGlmIEkgZGVmaW5lIEZMRUQgaW4g
RFRTIG5vZGUuCj4KPiBJIGRvbid0IHF1aXRlIGZvbGxvdyB5b3VyIGxvZ2ljIGhlcmUuCj4KPiBO
by1vcCBmdW5jdGlvbidzIHB1cnBvc2UgaXMgdG8gc2ltcGxpZnkgdGhlIGNvZGUgb24gdGhlIGNh
bGxlcidzIHNpZGUuCj4gVGhlcmVmb3JlIGl0IHNob3VsZCByZXBvcnQgc3VjY2Vzcy4KPgo+IFBs
ZWFzZSByZXR1cm4gMCBmcm9tIGl0Lgo+CgpKdXN0IGxpa2UgdGhvc2UgZnVuY3Rpb25zIGluIGxl
ZC1jbGFzcy1tdWx0aWNvbG9yLmgsIGNhbGxlciBtYXkgdXNlCnJldHVybiB2YWx1ZSB0byBjaGVj
ayB3aGV0aGVyIEZMRUQgaXMgcmVnaXN0ZXJlZCBzdWNjZXNzZnVsbHkgb3Igbm90LgpGb3IgdGhp
cyBjYXNlLCBpcyByZXR1cm5pbmcgMCBhIGxpdHRsZSBiaXQgbWlzbGVhZGluZz8KCj4gLS0KPiBC
ZXN0IHJlZ2FyZHMsCj4gSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
