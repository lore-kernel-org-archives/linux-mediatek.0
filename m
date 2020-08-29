Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD59C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 00:34:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631F720838
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 00:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmwnUxDI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5IDxqlI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631F720838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h/g/9E3SwnXkuFrpqyC9bpePjjzUNApkUgDAQWTJXyc=; b=jmwnUxDIqJ4Ht7LvGqTTwnmhn
	Uchpj9DhKsElwEVYhe49DKNOCZpUnGFvHUl5bJXXVKEXmuGqb3wRnEK4el8cyS38JLvJ/vjzEoboT
	rxcM5ppHrt5m5jGo7dF1/A69Hmn7CjtHs9rB4xyDpIadukI8r6GZU+tZhPqKZDqzCBZ2a8Jj0AI+f
	d11N5PK7JShY8fXK8eqygWVv5BwpoHM5J91NYNZhfE883hujloko5o/y6+NvkE5WzsFE3PlaMpfZn
	DIadBVnp/4FKreTuNXjzxUYALd+boda8njItQ9OWyhVigt4JHh92hUIFU51Wib5VmZU9xFDLbO+81
	cYPfDzrAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBooo-0002sH-Hv; Sat, 29 Aug 2020 00:34:06 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBooh-0002n1-Qr; Sat, 29 Aug 2020 00:34:00 +0000
Received: by mail-lf1-x144.google.com with SMTP id u25so554221lfm.10;
 Fri, 28 Aug 2020 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=udOnF2aAB4tWGY1xoa/IQjnlzFaq9wx8Ye/AaoZl7Gk=;
 b=P5IDxqlIQPCjO6klyBH8ZF/1pfnkpw7C6ZDqo9nVBW9J9t8obK0rJhr05o0dutqmtJ
 OQDLh2ReLHEuKZ1iRX4lAuCjYU2ysoRc5UT6FXkON3zcXMKgt+yZFPk/ty/fapMlHc5Q
 URXWkcx6a3FSSDiLbkVSZuBNfTFOBBp/6e5iVUZAOfl7UIjqAUKNt6fwIxbpMj202/3q
 ywqHm6QJcJ1VTGRMesJPECse3zBsGOLV8zwjtvm7YbxH1Y2skqQWA5BnaEnxf1wf9AD+
 g1+59AjQgOsL8GBD6ULPuUNHA33amlT9G8xW/0bH3+4je7Q/C6Kp1yQsJk+rjRJ33dcl
 BHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=udOnF2aAB4tWGY1xoa/IQjnlzFaq9wx8Ye/AaoZl7Gk=;
 b=czZxl/q+CDx/4XtKQnsHSWyk38aAcTiWWF+0ADCPBdp2rh+Y94uJlaweyGPGrqgnjv
 5pgq8CAQAChfNQk2DC2e6UtjaHMaeTKkTSVrmEVoQ53Uw+s3UuMMavG3guO8Xk/ij1oK
 vQ9DQgnV9FDNum0Nd5ya6rXjw9/N7mu1vvw3QCP6Qj4BLQq3Jin3cWaluVgYuMKCcaCf
 kIAVpR44k1/gTuY6qGm50WXVUQokIPtezgPMq0xTBA/VWrUO19R8+/XAV/+3+qlIdNsm
 XVn1OBjERcDC+6K9bkuBGXoqvdBOG9ZTR2oMfLABBf6Fjfhu0/exLOJB5N3zaHOi2nL5
 8wIg==
X-Gm-Message-State: AOAM533sEhmI93newZ7dHok1lkEDLNQHz3qgn1OZGjpZOrlZhVr7Dksr
 Zkfdvzpoe8Q4JuYrUMN0gCanv7YFAwcHvXmLVb1rkixbQMg=
X-Google-Smtp-Source: ABdhPJy8NGfOfaHbEPkrHphhi9v8ADB1PgqoTUVgMDx4fmbTHt/3P7dSr9oJM+He5dCb3NjIB0ZYKiWMWUqgVXhAuas=
X-Received: by 2002:ac2:4911:: with SMTP id n17mr465136lfi.185.1598661238298; 
 Fri, 28 Aug 2020 17:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
 <20200828220630.GB3482472@bogus>
In-Reply-To: <20200828220630.GB3482472@bogus>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Sat, 29 Aug 2020 08:33:46 +0800
Message-ID: <CADiBU3-k91Rmoxzbzf44kFg7sEq42n5kc3ZhQUwVyEjkFpbshA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_203359_913749_4CB64165 
X-CRM114-Status: GOOD (  20.58  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ45pyIMjnml6Ug6YCx5YWt
IOS4iuWNiDY6MDblr6vpgZPvvJoKPgo+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA2OjMwOjM2
UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVh
bmdAcmljaHRlay5jb20+Cj4gPgo+ID4gQWRkIGEgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50
YXRpb24gZm9yIHRoZSBNVDYzNjAgVHlwZS1DIGRyaXZlci4KPiA+Cj4gPiB1c2IgdHlwZWM6IG10
NjM2MDogUmVuYW1lIERUIGJpbmRpbmcgZG91bWVudCBmcm9tIG10NjM2MCB0byBtdDYzNngKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4K
PiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAg
ICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3
MyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbAo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVr
LG10NjM2MC10Y3BjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMC4uOWU4YWIwZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1s
Cj4gPiBAQCAtMCwwICsxLDczIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiAr
JGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL21lZGlhdGVrLG10NjM2MC10
Y3BjLnlhbWwjIgo+ID4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMiCj4gPiArCj4gPiArdGl0bGU6IE1lZGlhdGVrIE1UNjM2MCBUeXBlLUMg
UG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIgRFQgYmluZGluZ3MKPiA+
ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmlj
aHRlay5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsgIE1lZGlhdGVrIE1UNjM2
MCBpcyBhIG11bHRpLWZ1bmN0aW9uYWwgZGV2aWNlLiBJdCBpbnRlZ3JhdGVzIGNoYXJnZXIsIEFE
QywgZmxhc2gsIFJHQiBpbmRpY2F0b3JzLAo+ID4gKyAgcmVndWxhdG9ycyAoQlVDS3MvTERPcyks
IGFuZCBUeXBlQyBQb3J0IFN3aXRjaCB3aXRoIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4g
PiArICBUaGlzIGRvY3VtZW50IG9ubHkgZGVzY3JpYmVzIE1UNjM2MCBUeXBlLUMgUG9ydCBTd2l0
Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4gPiArCj4gPiArcHJvcGVydGllczoK
PiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGVudW06Cj4gPiArICAgICAgLSBtZWRpYXRlayxt
dDYzNjAtdGNwYwo+ID4gKwo+ID4gKyAgaW50ZXJydXB0cy1leHRlbmRlZDoKPiA+ICsgICAgbWF4
SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGludGVycnVwdC1uYW1lczoKPiA+ICsgICAgaXRlbXM6Cj4g
PiArICAgICAgLSBjb25zdDogUERfSVJRQgo+ID4gKwo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+
ID4gKyAgImNvbm5lY3RvciI6Cj4KPiBBbHNvLCB0aGlzIGlzIG5vdCBhIHBhdHRlcm4sIHNvIHNo
b3VsZCBiZSB1bmRlciAncHJvcGVydGllcycsIGFuZCBpdAo+IGRvZXNuJ3QgbmVlZCBxdW90ZXMu
CldpbGwgYmUgZml4ZWQgaW4gbmV4dCBwYXRjaC4KPgo+ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+
ICsgICAgJHJlZjogLi4vY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCMKPiA+ICsgICAgZGVz
Y3JpcHRpb246Cj4gPiArICAgICAgUHJvcGVydGllcyBmb3IgdXNiIGMgY29ubmVjdG9yLgo+ID4g
Kwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+
ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIGludGVycnVwdHMtZXh0ZW5kZWQKPiA+ICsgIC0g
aW50ZXJydXB0LW5hbWVzCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdXNiL3BkLmg+Cj4gPiArICAgIGkyYzAgewo+ID4gKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKPiA+ICsKPiA+ICsgICAgICAgIG10NjM2MEAzNCB7Cj4gPiArICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDYzNjAiOwo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDM0PjsK
PiA+ICsKPiA+ICsgICAgICAgICAgICB0Y3BjIHsKPiA+ICsgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDYzNjAtdGNwYyI7Cj4gPiArICAgICAgICAgICAgICAgIGludGVy
cnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW8yNiAzIElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gPiArICAg
ICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJQRF9JUlFCIjsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgICAgY29ubmVjdG9yIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInVzYi1jLWNvbm5lY3RvciI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
bGFiZWwgPSAiVVNCLUMiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtcm9sZSA9
ICJkdWFsIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1yb2xlID0gImR1YWwi
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRyeS1wb3dlci1yb2xlID0gInNpbmsiOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHNvdXJjZS1wZG9zID0gPFBET19GSVhFRCg1MDAw
LCAxMDAwLCBQRE9fRklYRURfRFVBTF9ST0xFIHwgUERPX0ZJWEVEX0RBVEFfU1dBUCk+Owo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHNpbmstcGRvcyA9IDxQRE9fRklYRUQoNTAwMCwgMjAw
MCwgUERPX0ZJWEVEX0RVQUxfUk9MRSB8IFBET19GSVhFRF9EQVRBX1NXQVApPjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBvcC1zaW5rLW1pY3Jvd2F0dCA9IDwxMDAwMDAwMD47Cj4gPiAr
ICAgICAgICAgICAgICAgIH07Cj4gPiArICAgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4g
PiArICAgIH07Cj4gPiArLi4uCj4gPiAtLQo+ID4gMi43LjQKPiA+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
