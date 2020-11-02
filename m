Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9095DC00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:05:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B772231B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="muXfmAnO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP6dVpM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B772231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2w1bmxXdjCkGbQ66v+nlys9S7ihpp0nvGGgIj9uH//Q=; b=muXfmAnO0wIIHYAEeWh3XOYM9
	liifNJV3WB7mqu95BKODdKeKRtkMLzh52FbTXLo4bwHUdQthhXXrV7yspoaTnbTcST0CFXeTqALzV
	gfDJAChIyBY2Y3Yj0mZ5WZpUYKh4E3faZC/RFYi6pIlLY+IS8+O7gI1fqOvcGTK4Yx5LZsSrUsgYe
	lw2oGKzQl+I0O/Kykt2omAcoy+fCJq+2edS/WKXb/4I/pPFcu0578hTl4/Uhiwdqdv3h9EsQCpXOo
	sDtgcR/rdl/+/XPewBh1N1DC4eGy0TQCSwIneaUdNG+Zhammg/7inSNHc3q8J7B5mTS8S+rW3vXqp
	GXafagFpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZTtw-0004tP-DV; Mon, 02 Nov 2020 07:05:12 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZTtr-0004sG-CU; Mon, 02 Nov 2020 07:05:08 +0000
Received: by mail-oo1-xc44.google.com with SMTP id f25so3132561oou.4;
 Sun, 01 Nov 2020 23:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YI54VZZszq4hxY1ZamHtFQZf9ma4Q4Sivjp7d7dM0Rw=;
 b=DP6dVpM7TNLfW3MkeyzGWoON8h54KpEahVTrjHHCs2qeFRfwpoNoUuVO0lvuEamGbT
 po4siHJpaj3SmjDXcANTP9KicXTnIWGS6vhBZona/zJo2vdmsXVPbQvnuY7vqq/G1xX/
 R9ReqECOgRjr8exucPrhn7D6DghsyJagPJ56jL4kj/7UViSPm0bicYX0bmh1BWHLIrN4
 BmJqYjHbTXNfXvdZGABXrNeuWcuD10axUJk4k73lSO7B2PtnpcMS3xsB7plfKetdvbfh
 7GlUHA/ryOGZhZKDeU5vGFszBOMzBUc6LIDF8KpZ4BUKiVitf54KcAXTP83uKt7QftAA
 BKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YI54VZZszq4hxY1ZamHtFQZf9ma4Q4Sivjp7d7dM0Rw=;
 b=Ypd3GfIEVMRci5/BSUScDs5gDzou4GSTfRJoFiVpbrF4yc0qRN+JOHUVKMRWjfDh9n
 P0xDHC6PZMiSR0+gRLxQ1Z1dY7uxhL7Az/AiOjkSO07vbCyjKpa52US1mbwXH1y3mFYk
 P6VoH8MRYuPqL2QuQVcBDT5vtv8KxWyUAEeGcXHgJzztbWS9IKNc3uSHXc+qyC9dbZBL
 1PLrGYUa1pv6uE0D7FGr74v32bAUFzyf4H2heRYCngAzHFmME2E6SX7sV/CxK/bOoMtF
 qkS89WGeeMHMLucgg5+4cBaYH5hsMMkOQ5SJUVEOD//ZDFtmK4Sd9pzUZQ/ZtLelVclF
 UjMw==
X-Gm-Message-State: AOAM533OkfFaPwRtgc7tweBKQrmUEQ6kQ5fP6vFzJNJk1H1i4Y3cCVPd
 pVNl11jACz4Gd7zH53RJPxLksLp/wQ/JSKNfEN0=
X-Google-Smtp-Source: ABdhPJxjHMlav4PDw19Q5gA4yIpyiRESfLoqVQqCF1hKlnNaBGGKm3VP2YihK7xAtdHujvZ1CchiyVuR+DL4sXVZIwQ=
X-Received: by 2002:a4a:d848:: with SMTP id g8mr11149900oov.35.1604300703108; 
 Sun, 01 Nov 2020 23:05:03 -0800 (PST)
MIME-Version: 1.0
References: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
 <20201101154019.39932a2e@archlinux>
In-Reply-To: <20201101154019.39932a2e@archlinux>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 2 Nov 2020 15:04:52 +0800
Message-ID: <CAE+NS34-ayHchKA5Unb=+wHvesox1r9kkyPy09JgBqrA0Gd0Vw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] iio: adc: mt6360: Add ADC driver for MT6360
To: Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_020507_531656_B7DEE1C6 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 lars@metafoo.de, linux-iio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sm9uYXRoYW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeaciDHml6Ug
6YCx5pelIOS4i+WNiDExOjQw5a+r6YGT77yaCj4KPiBPbiBUdWUsIDIwIE9jdCAyMDIwIDE2OjA3
OjQ0ICswODAwCj4gR2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gPiBJbi1SZXBseS1UbzoKPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgTVQ2MzYw
IEFEQyBzdXBwb3J0IGNvbnRhaW5zIGRyaXZlciwgdGVzdGluZyBkb2N1bWVudAo+ID4gYW5kIGJp
bmRpbmcgZG9jdW1lbnQKPiA+Cj4gSGkgR2VuZSwKPgo+IE90aGVyIHRoYW4gdGhhdCBzbWFsbCBl
ZGl0IG5lZWRlZCBpbiB0aGUgZHQgYmluZGluZyB0aGlzIGlzIHN0YWxsZWQgb24KPiB0aGUgbGFi
ZWwgY29kZSBnZXR0aW5nIHVwc3RyZWFtZWQgaW50byB0aGUgY29yZS4KPgo+IEkndmUgYXNrZWQg
Q3Jpc3RpYW4gdG8gcmVwb3N0IHRoYXQgc28gaG9wZWZ1bGx5IHdlIGNhbiByZXNvbHZlIHRoYXQg
ZGVwZW5kZW5jeQo+IGFuZCBnZXQgdGhpcyBtZXJnZWQgZmFpcmx5IHNvb24uCj4KPiBGb3IgdGhl
IGR0IHRoaW5nIEkgY2FuIGp1c3QgZHJvcCB0aGUgZGVzY3JpcHRpb24gZW50aXJlbHksIGJ1dCB3
b3VsZCBwcmVmZXIKPiBpZiB5b3Ugc2VudCBhIHY4IGZpeGluZyB0aGUgdGFncyBpc3N1ZSBSb2Ig
cG9pbnRlZCBvdXQgYW5kIGFsc28gZml4aW5nIHRoYXQKPiBkZXNjcmlwdGlvbi4KPgo+IFRoYW5r
cywKPgo+IEpvbmF0aGFuCj4KCj09PT09PT09PT09PT0KPiArZGVzY3JpcHRpb246IHwKPiArICBG
YW1pbHkgb2Ygc2ltcGxlIEFEQ3Mgd2l0aCBpMmMgaW50ZXJmYWNlIGFuZCBpbnRlcm5hbCByZWZl
cmVuY2VzLgpUaGF0IHNlZW1zIHVubGlrZWx5Li4uCj09PT09PT09PT09PT0KCkRvIHlvdSBtZWFu
cyBJIHNob3VsZCByZW1vdmUgdGhpcyBkZXNjcmlwdGlvbj8KSWYgeWVzLCBJIHdpbGwgYWxzbyB1
cGRhdGUgUEFUQ0ggdjggZm9yIGFkZCB0YWdzIGFuZCBmaXggZHQtYmluZGluZ3MuCgo+ID4gR2Vu
ZSBDaGVuICgyKQo+ID4gICBkdC1iaW5kaW5nczogaWlvOiBhZGM6IGFkZCBiaW5kaW5ncyBkb2Mg
Zm9yIE1UNjM2MCBBREMKPiA+ICAgRG9jdW1lbnRhdGlvbjogQUJJOiB0ZXN0aW5nOiBtdDYzNjA6
IEFkZCBBREMgc3lzZnMgZ3VpZGVsaW5lCj4gPiAgIGlpbzogYWRjOiBtdDYzNjA6IEFkZCBBREMg
ZHJpdmVyIGZvciBNVDYzNjAKPiA+Cj4gPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNm
cy1idXMtaWlvLWFkYy1tdDYzNjAgICAgICAgICAgICAgICAgIHwgICA3OCArKwo+ID4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL21lZGlhdGVrLG10NjM2MC1hZGMu
eWFtbCB8ICAgMzQKPiA+ICBkcml2ZXJzL2lpby9hZGMvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExCj4gPiAgZHJpdmVycy9paW8vYWRjL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMQo+
ID4gIGRyaXZlcnMvaWlvL2FkYy9tdDYzNjAtYWRjLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzNzIgKysrKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDk2
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjEgJiB2Mgo+ID4gIC0g
YWRjOiB1c2UgSUlPX0NIQU5fSU5GT19QUk9DRVNTRUQgb25seQo+ID4gIC0gYWRjOiB1c2UgZGV2
bV9paW9fdHJpZ2dlcmVkX2J1ZmZlcl9zZXR1cAo+ID4gIC0gYWRjOiB1c2UgdXNlIHM2NCB0byBy
ZWNvcmQgdGltZXN0YW1wCj4gPgo+ID4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYyICYgdjMKPiA+ICAt
IFJlYXJyYW5nZSBpbmNsdWRlIGZpbGUgb3JkZXIgYnkgYWxwaGFiZXQKPiA+ICAtIFNldCBsaW5l
IGxlbmd0aCBjb25zdHJhaW50IGJlbG93IDEwMAo+ID4gIC0gQWRkIERvY3VtZW50IGZvciB0ZXN0
aW5nIGFkYyBzeXNmcyBub2RlIGd1aWRlbGluZQo+ID4gIC0gU2V0IGNvbXBpbGVyIDY0IGJpdCBh
bGlnbmVkIHdoZW4gaGFuZGxlIGlpbyB0aW1lc3RhbXAKPiA+Cj4gPiBjaGFuZ2Vsb2dzIGJldHdl
ZW4gdjMgJiB2NAo+ID4gIC0gRml4IHN5c2ZzIGd1aWRlbGluZSBkZXNjcmlwdGlvbgo+ID4gIC0g
UmVwbGFjZSBpaW8gY2hhbm5lbCBwcm9jZXNzZWQgYnkgcmF3L3NjYWxlL29mZnNldAo+ID4gIC0g
QWRkIGNvbW1lbnQgb2YgcmVhZCBhZGMgZmxvdyBmb3Igc3BlY2lhbCBIVyBkZXNpZ24KPiA+Cj4g
PiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjQgJiB2NQo+ID4gIC0gUmVuYW1lIGR0LWJpbmRpbmdzIGFs
aWduZWQgdG8gZmlsZSBuYW1lCj4gPiAgLSBBbGlnbmVkIHN5c2ZzIG5vZGUgbmFtZSB3aXRoIGRy
aXZlciBhbmQgYWRkIFZCVVNESVZYIGRlc2NyaXB0aW9uCj4gPiAgLSBBZGQgQURDIGNoYW5uZWwg
c3lzZnMgbm9kZSAiKl9sYWJlbHMiCj4gPgo+ID4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY1ICYgdjYK
PiA+ICAtIE1lbXNldCBhbGlnbmVkIGFkYyBkYXRhCj4gPiAgLSBSZW1vdmUgc3Ryb25nIGNhc3Rp
bmcgdm9pZCBwb2ludGVyCj4gPgo+ID4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY2ICYgdjcKPiA+ICAt
IEF2b2lkIGFkYyBwb2xsaW5nIGluZmluaXRlIGxvb3AKPiA+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
