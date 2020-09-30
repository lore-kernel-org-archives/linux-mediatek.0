Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0314C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BA402075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdZCM4g+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo38yM+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA402075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2zQcPe1ZL16eM2VmJvb9Dlapnu70lvMw2yP8VHzVIAo=; b=qdZCM4g+JpJO5N60oaMUy/ufz
	6tov2fNx8jkJ0N7RlYqAr0RZN0iTDhudbjM9BOI+OLr+BOOurdWE9HhOLooRrso0tMi0T0uILtU08
	OMhBDTpMJpN5peEqHQzBZo93F4K8FT9UTul9QeGuiI03pySiVHCQMF64swdKDs5cwZWh+A14M+1P8
	BMHGy7mHSG1sXtXH0F9xLSrb1gN2UmpS+ZpC+8RBrDAkpakMzJB2GFKObOSZxzQDFKrbfsxtv/F+Q
	KBQJMpl/qAOFWlikwoaJgbRLyvUgPBZp//32sWsO/qAqq5i2zyaXzRIo8O9Nxfjvb3zU84m4Fz2pm
	29z95DaZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWRp-0003u2-06; Wed, 30 Sep 2020 07:22:45 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWNM-00022S-98; Wed, 30 Sep 2020 07:18:14 +0000
Received: by mail-il1-x144.google.com with SMTP id j13so624188ilc.4;
 Wed, 30 Sep 2020 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=psbw7i3MjIvoS2hf9QWQDtYAJuKq8vzar3Jam1ZH0Hc=;
 b=Bo38yM+jEIXzcswNHY6Gromdckl+k/MJVOjA1MHzuDkQoT9nQBpD0amEjmmzjtnVre
 sXXyFzsFmjOmI4EF68WdzDlaxszOdtuW7OMWv9OdjvZKyeBiPaJQDI/cN51W+owyDrX/
 2DKOi8S1lRxu/wgUVjp8SxE5C0YR8QKPvUeIbPoMiQUlMK0if16AAB5e7S5o3kRitlbk
 Y0DeD1ppuhY9LyV4A3RcfHyM+OfCvE9ZeCtp708rRlBlRft6cCmnnpMMzrRTrD8iwApe
 V1gheB01BXK8/vXN1zqZWpOhKbIKT46gN5o3cEslAAyfzXcV5qh9fk8CRfWnVU9c26nc
 Wukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=psbw7i3MjIvoS2hf9QWQDtYAJuKq8vzar3Jam1ZH0Hc=;
 b=nHQeYinxOIRdYLfZPf05S48CD7p8w9ZCiojU5UXDznTpmeV+pdbte6BRQJGUYLawOE
 jb7Ag764liHGtXiEWIfBmSiMO/OCf8twyGiazX7x9p+12im6gBrLMr2Jv8+BZY2Xr0qO
 FQUWjmGo3KfuaRZ7Z3n8aQWzpagnNVqu8kOVsOyBcjo6Cj77MJ6ZeCgsacKbUheoRJEZ
 COnUihfz8kzORCHaZDQHU3sJxZTpk1YOWKv0CE5Zf872snphWUq9O8BUFT+eeHzclcar
 1edGOLVWfZHs6wKNqXxcOHfRD/+fQAehuQaNX1mdRMH5bBPoqBY4o7DSrJk+txjfUT5R
 Peqg==
X-Gm-Message-State: AOAM532or3BrDYRScWm89tE+mjuXkDH6icxn5M6gD/a8bdV9T/nhwGeZ
 fa/wnH5/cVjydCf83l78hA8ifqQLt8UpWMQbrNw=
X-Google-Smtp-Source: ABdhPJwqQ8KMmr3JDuN8zpHdfHPUqvbHvZzb65j8t8gjstpZRO17wytTnMH0Il3P/9PcrXkOUf0BUof0KeQ4RlVi+8I=
X-Received: by 2002:a92:1589:: with SMTP id 9mr960077ilv.292.1601450283511;
 Wed, 30 Sep 2020 00:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200928184423.GA3041988@bogus>
In-Reply-To: <20200928184423.GA3041988@bogus>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Wed, 30 Sep 2020 23:17:51 +0800
Message-ID: <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031808_900119_1A160CB8 
X-CRM114-Status: GOOD (  22.24  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ55pyIMjnml6Ug6YCx5LqM
IOS4iuWNiDI6NDTlr6vpgZPvvJoKPgo+IE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDA4OjUwOjUx
UE0gKzA4MDAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVu
QHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgTEVEIHN1cHBv
cnQgb24gTVQ2MzYwIFBNSUMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVf
Y2hlbkByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvbGVkcy1tdDYzNjAueWFtbCAgICAgIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1s
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2xlZHMtbXQ2MzYwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bGVkcy9sZWRzLW10NjM2MC55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMC4uYTM1NmExZgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbAo+ID4gQEAgLTAsMCAr
MSwxMDcgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCMKPiA+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+
ICt0aXRsZTogTEVEIGRyaXZlciBmb3IgTVQ2MzYwIFBNSUMgZnJvbSBNZWRpYVRlayBJbnRlZ3Jh
dGVkLgo+Cj4gV2hlcmUncyB0aGUgUE1JQyBzY2hlbWE/IFRoaXMgZmlsZSBuZWVkcyB0byBiZSBy
ZWZlcmVuY2VkIGZyb20gaXQgYW5kCj4gdGhhdCBtZWFucyBpdCBhbGwgbmVlZHMgdG8gYmUgb25l
IHNlcmllcy4KPgoKRG8geW91IG1lYW5zIGFzIHJlZ3VsYXRvci9tYXg3NzY1MC1yZWd1bGF0b3Iu
eWFtbD8KCmRlc2NyaXB0aW9uOiB8CiAgVGhpcyBtb2R1bGUgaXMgcGFydCBvZiB0aGUgTUFYNzc2
NTAgTUZEIGRldmljZS4gRm9yIG1vcmUgZGV0YWlscwogICJzZWUgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9tYXg3NzY1MC55YW1sIgoKPiA+ICsKPiA+ICttYWludGFpbmVy
czoKPiA+ICsgIC0gR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiArCj4gPiAr
ZGVzY3JpcHRpb246IHwKPiA+ICsgIFRoaXMgbW9kdWxlIGlzIHBhcnQgb2YgdGhlIE1UNjM2MCBN
RkQgZGV2aWNlLgo+ID4gKyAgQWRkIE1UNjM2MCBMRUQgZHJpdmVyIGluY2x1ZGUgMi1jaGFubmVs
IEZsYXNoIExFRCB3aXRoIHRvcmNoL3N0cm9iZSBtb2RlLAo+ID4gKyAgYW5kIDQtY2hhbm5lbCBS
R0IgTEVEIHN1cHBvcnQgUmVnaXN0ZXIvRmxhc2gvQnJlYXRoIE1vZGUKPiA+ICsKPiA+ICtwcm9w
ZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgY29uc3Q6IG1lZGlhdGVrLG10NjM2
MC1sZWQKPiA+ICsKPiA+ICsgICIjYWRkcmVzcy1jZWxscyI6Cj4gPiArICAgIGNvbnN0OiAxCj4g
PiArCj4gPiArICAiI3NpemUtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMAo+ID4gKwo+ID4gK3Bh
dHRlcm5Qcm9wZXJ0aWVzOgo+ID4gKyAgIl5sZWRAWzAtNV0kIjoKPiA+ICsgICAgdHlwZTogb2Jq
ZWN0Cj4gPiArICAgICRyZWY6IGNvbW1vbi55YW1sIwo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+
ICsgICAgICBQcm9wZXJ0aWVzIGZvciBhIHNpbmdsZSBMRUQuCj4gPiArCj4gPiArICAgIHByb3Bl
cnRpZXM6Cj4gPiArICAgICAgcmVnOgo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IEluZGV4IG9m
IHRoZSBMRUQuCj4gPiArICAgICAgICBlbnVtOgo+ID4gKyAgICAgICAgICAtIDAgIyBMRUQgb3V0
cHV0IElORElDQVRPUjEKPiA+ICsgICAgICAgICAgLSAxICMgTEVEIG91dHB1dCBJTkRJQ0FUT1Iy
Cj4gPiArICAgICAgICAgIC0gMiAjIExFRCBvdXRwdXQgSU5ESUNBVE9SMwo+ID4gKyAgICAgICAg
ICAtIDMgIyBMRUQgb3V0cHV0IElORElDQVRPUjQKPiA+ICsgICAgICAgICAgLSA0ICMgTEVEIG91
dHB1dCBGTEVEMQo+ID4gKyAgICAgICAgICAtIDUgIyBMRUQgb3V0cHV0IEZMRUQyCj4gPiArCj4g
PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4g
KyAgLSBjb21wYXRpYmxlCj4gPiArICAtICIjYWRkcmVzcy1jZWxscyIKPiA+ICsgIC0gIiNzaXpl
LWNlbGxzIgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4g
K2V4YW1wbGVzOgo+ID4gKyAtIHwKPiA+ICsgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9j
b21tb24uaD4KPiA+ICsgICBsZWQtY29udHJvbGxlciB7Cj4gPiArICAgICBjb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10NjM2MC1sZWQiOwo+ID4gKyAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
PiArICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgIGxlZEAwIHsKPiA+ICsg
ICAgICAgcmVnID0gPDA+Owo+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJ
Q0FUT1I7Cj4gPiArICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9SRUQ+Owo+ID4gKyAgICAg
ICBkZWZhdWx0LXN0YXRlID0gIm9mZiI7Cj4gPiArICAgICB9Owo+ID4gKyAgICAgbGVkQDEgewo+
ID4gKyAgICAgICByZWcgPSA8MT47Cj4gPiArICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9O
X0lORElDQVRPUjsKPiA+ICsgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVOPjsKPiA+
ICsgICAgICAgZGVmYXVsdC1zdGF0ZSA9ICJvZmYiOwo+ID4gKyAgICAgfTsKPiA+ICsgICAgIGxl
ZEAyIHsKPiA+ICsgICAgICAgcmVnID0gPDI+Owo+ID4gKyAgICAgICBmdW5jdGlvbiA9IExFRF9G
VU5DVElPTl9JTkRJQ0FUT1I7Cj4gPiArICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9CTFVF
PjsKPiA+ICsgICAgICAgZGVmYXVsdC1zdGF0ZSA9ICJvZmYiOwo+ID4gKyAgICAgfTsKPiA+ICsg
ICAgIGxlZEAzIHsKPiA+ICsgICAgICAgcmVnID0gPDM+Owo+ID4gKyAgICAgICBmdW5jdGlvbiA9
IExFRF9GVU5DVElPTl9JTkRJQ0FUT1I7Cj4gPiArICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9J
RF9BTUJFUj47Cj4gPiArICAgICAgIGRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKPiA+ICsgICAgIH07
Cj4gPiArICAgICBsZWRANCB7Cj4gPiArICAgICAgIHJlZyA9IDw0PjsKPiA+ICsgICAgICAgZnVu
Y3Rpb24gPSBMRURfRlVOQ1RJT05fRkxBU0g7Cj4gPiArICAgICAgIGNvbG9yID0gPExFRF9DT0xP
Ul9JRF9XSElURT47Cj4gPiArICAgICAgIGZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8MT47Cj4gPiAr
ICAgICAgIGRlZmF1bHQtc3RhdGUgPSAib2ZmIjsKPiA+ICsgICAgICAgbGVkLW1heC1taWNyb2Ft
cCA9IDwyMDAwMDA+Owo+ID4gKyAgICAgICBmbGFzaC1tYXgtbWljcm9hbXAgPSA8NTAwMDAwPjsK
PiA+ICsgICAgICAgZmxhc2gtbWF4LXRpbWVvdXQtdXMgPSA8MTAyNDAwMD47Cj4gPiArICAgICB9
Owo+ID4gKyAgICAgbGVkQDUgewo+ID4gKyAgICAgICByZWcgPSA8NT47Cj4gPiArICAgICAgIGZ1
bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0ZMQVNIOwo+ID4gKyAgICAgICBjb2xvciA9IDxMRURfQ09M
T1JfSURfV0hJVEU+Owo+ID4gKyAgICAgICBmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDI+Owo+ID4g
KyAgICAgICBkZWZhdWx0LXN0YXRlID0gIm9mZiI7Cj4gPiArICAgICAgIGxlZC1tYXgtbWljcm9h
bXAgPSA8MjAwMDAwPjsKPiA+ICsgICAgICAgZmxhc2gtbWF4LW1pY3JvYW1wID0gPDUwMDAwMD47
Cj4gPiArICAgICAgIGZsYXNoLW1heC10aW1lb3V0LXVzID0gPDEwMjQwMDA+Owo+ID4gKyAgICAg
fTsKPiA+ICsgICB9Owo+ID4gKy4uLgo+ID4gLS0KPiA+IDIuNy40Cj4gPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
