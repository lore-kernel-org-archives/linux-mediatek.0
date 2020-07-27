Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A372C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 02:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0700B20825
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 02:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c48mZWIi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iq4q/uAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0700B20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DS09T21fEmoPRfXsk/JA3Dj7Se7ASm22spn0Uz8qBUk=; b=c48mZWIihBuOJrjYZyQ5VOCuK
	5TVR+wsuO5GPWhPaB22IDNvqiUP5MVdKO6Ap41uKkO4Gt4Qql8sDkJXNEuZNXTYTnnq7/8wb0BgSd
	Ng/CnnEjwQV9ZZ7mxNQ7xWI/fXPe1ySjoFeiEjoY5efg8sVmLycOhM67/zM8ta4jEMvGR4uNP+6Ur
	TG5rHYr3AsPMwhZkTYuMXtaZpxJv9DVHtjTR+wEPyVIofIV6q5fDaC2RkH8GYag6gJ10dBcpNDCOV
	XJGcBj+cCvbv35LWX1OpP5d2tBE5gC5H/ac3md2WjbtKS3YY3D1K/D6T5Xo7JNoYNVdv5Rbr2cGmD
	pShpKTGsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0FMK-0000Yk-Be; Tue, 28 Jul 2020 02:28:52 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0FMG-0000XR-Bh; Tue, 28 Jul 2020 02:28:49 +0000
Received: by mail-il1-x144.google.com with SMTP id r13so7829365ilt.6;
 Mon, 27 Jul 2020 19:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X81wKNuIN/ZBgNP01q1lrp0XDb3zK0TgXb0/3enbG4E=;
 b=Iq4q/uAaaDFkDFJLGD5NrMQMX3PCt6qe6l9b/3p4udFexbBIOpyOdQGnKowNmd9NGe
 JYOD9gV20hNjhE3+pvKP8ttNKhKZbDhE/IRlUbPz45F2qT8JflGxdO4vAnTjTxj2R+ra
 wAu8h7vIehJPG17+zKn2uj2ajEa75hYZv1A4+RvYYzDys/+NZz4BSp5mGbMnDvhhfoQe
 1ki1EQcbyal983V0gHpZVTWSGiCPfUXCWqRqbfvoIobWiRv44kSw33psx/RAnukmTa7N
 Qysm6luz3Vb9xSjjP1NmqtoxjazUrUu/sc5h5tS0+77Io/q8RmCnSC1cujDVc9ZECnUl
 cmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X81wKNuIN/ZBgNP01q1lrp0XDb3zK0TgXb0/3enbG4E=;
 b=npuhhCl1+sZWh+tiKqSVC11YjrmMU3ZGMWLKJYwM0ZSkih35c9z0BE1AhiVv831fmS
 crIeDdwTL40dN+NKF5Ly70QXHA/AEWvTroSBnedZaXjStfJV2Kq+KZOAqCnIQQDllbtO
 2PQZ5e1UlbXMDbSP2ut2zhtfPclrDZKH76sWI2tPbURWCgwMbW3wI/1GQbKO1jOIlGu3
 vJzQcl2AmbDcH38AiadHE6+gauuSCHCptKvPLjDN2/uLAntS7Lljitmoq/FyGFZEBfLk
 f0vChd6obGMjlMYf7ox91nNP4h37fFI38yEJTVP5tcp+E6eShqdlGq62DikfbtiQyyve
 GKgA==
X-Gm-Message-State: AOAM530FRQ78RCjIHGAlwRXuabU0DZG40sIyLqWYt+S/FJnYfAaNKCq9
 WCZq4TXfYF7/rRimkhCu7Ukk5ESg670I2ejQgoA=
X-Google-Smtp-Source: ABdhPJzyKdyXWVAX9P7Mf/nv1KVhHyZI+2eMBipAvoOzXxrE76PZ1ClBhDf1EO76moVzQz4JrEMxm7qkX2iNE66y7cg=
X-Received: by 2002:a92:9f96:: with SMTP id z22mr27519152ilk.266.1595903326578; 
 Mon, 27 Jul 2020 19:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
 <20200727112921.GK1850026@dell>
In-Reply-To: <20200727112921.GK1850026@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 28 Jul 2020 02:28:32 +0800
Message-ID: <CAE+NS36cxY9KqxxcmuctK_W_3ZmZnC_xK8VVVaTZqC3vSoqbUw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces into
 mt6360 regulator resources
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_222848_453383_D4F31FFD 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMjfml6Ug6YCx
5LiAIOS4i+WNiDc6Mjnlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMTcgSnVsIDIwMjAsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4g
Pgo+ID4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVzb3VjZXMgaW50byBtdDYzNjAgcmVndWxh
dG9yIHJlc291cmNlcwo+ID4gdG8gc2ltcGxpZnkgdGhlIHNpbWlsYXIgcmVzb3VyY2VzIG9iamVj
dC4KPgo+IERvIHRoZSBzdWItZGV2aWNlcyBhY3R1YWxseSBzaGFyZSB0aGVzZSByZXNvdXJjZXMs
IG9yIGFyZSB5b3UgZG9pbmcKPiB0aGlzIGp1c3QgdG8gbWFrZSB0aGUgY29kZSBzaW1wbGVyPwo+
CgpUaGV5IGFyZSBkaWZmZXJlbnQgcmVzb3VyY2VzIHVzZWQgYnkgZGlmZmVyZW50IGJ1Y2tzIGFu
ZCBsZG9zIHdpdGhvdXQKc2hhcmluZyByZWxhdGlvbnMuCkkganVzdCB0byBtYWtlIHRoZSBjb2Rl
IHNpbXBsZXIuCgo+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRl
ay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMTEgKysrLS0t
LS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gaW5kZXggN2NjMWI1OS4uNjY1ZTI2ZiAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWZkL210
NjM2MC1jb3JlLmMKPiA+IEBAIC0yNjUsNyArMjY1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBy
ZXNvdXJjZSBtdDYzNjBfbGVkX3Jlc291cmNlc1tdID0gewo+ID4gICAgICAgREVGSU5FX1JFU19J
UlFfTkFNRUQoTVQ2MzYwX0ZMRUQxX1NUUkJfVE9fRVZULCAiZmxlZDFfc3RyYl90b19ldnQiKSwK
PiA+ICB9Owo+ID4KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9wbWlj
X3Jlc291cmNlc1tdID0gewo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYw
X3JlZ3VsYXRvcl9yZXNvdXJjZXNbXSA9IHsKPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVE
KE1UNjM2MF9CVUNLMV9QR0JfRVZULCAiYnVjazFfcGdiX2V2dCIpLAo+ID4gICAgICAgREVGSU5F
X1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09DX0VWVCwgImJ1Y2sxX29jX2V2dCIpLAo+ID4g
ICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VWVCwgImJ1Y2sxX292
X2V2dCIpLAo+ID4gQEAgLTI3OCw5ICsyNzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291
cmNlIG10NjM2MF9wbWljX3Jlc291cmNlc1tdID0gewo+ID4gICAgICAgREVGSU5FX1JFU19JUlFf
TkFNRUQoTVQ2MzYwX0xETzdfT0NfRVZULCAibGRvN19vY19ldnQiKSwKPiA+ICAgICAgIERFRklO
RV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE82X1BHQl9FVlQsICJsZG82X3BnYl9ldnQiKSwKPiA+
ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X1BHQl9FVlQsICJsZG83X3Bn
Yl9ldnQiKSwKPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2Ug
bXQ2MzYwX2xkb19yZXNvdXJjZXNbXSA9IHsKPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVE
KE1UNjM2MF9MRE8xX09DX0VWVCwgImxkbzFfb2NfZXZ0IiksCj4gPiAgICAgICBERUZJTkVfUkVT
X0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19FVlQsICJsZG8yX29jX2V2dCIpLAo+ID4gICAgICAg
REVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzNfT0NfRVZULCAibGRvM19vY19ldnQiKSwK
PiA+IEBAIC0yOTgsMTAgKzI5NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgbXQ2
MzYwX2RldnNbXSA9IHsKPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRl
ayxtdDYzNjAtY2hnIiksCj4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLWxlZCIsIG10NjM2
MF9sZWRfcmVzb3VyY2VzLAo+ID4gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlh
dGVrLG10NjM2MC1sZWQiKSwKPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcG1pYyIsIG10
NjM2MF9wbWljX3Jlc291cmNlcywKPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjAtcG1pYyIpLAo+ID4gLSAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC1sZG8i
LCBtdDYzNjBfbGRvX3Jlc291cmNlcywKPiA+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAs
ICJtZWRpYXRlayxtdDYzNjAtbGRvIiksCj4gPiArICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXJl
Z3VsYXRvciIsIG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzLAo+ID4gKyAgICAgICAgICAgICAg
ICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiKSwKPiA+ICAgICAgIE9G
X01GRF9DRUxMKCJtdDYzNjAtdGNwYyIsIE5VTEwsCj4gPiAgICAgICAgICAgICAgICAgICBOVUxM
LCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRjcGMiKSwKPiA+ICB9Owo+Cj4gLS0KPiBMZWUgSm9u
ZXMgW+adjueQvOaWr10KPiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vydmlj
ZXMKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBG
b2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
