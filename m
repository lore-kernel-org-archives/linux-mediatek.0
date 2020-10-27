Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F78C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 17:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3527A20657
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 17:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6KfjeDo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRONzpWb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3527A20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JyS2jnAWGmBeFKKItB7aP2SYO8V8zspJRqJEvc6+eRs=; b=o6KfjeDoXddChQ4fh97l2MZqm
	nmTNa8A44DSxNY4WnBDw4gyRZvUcuPzo/Fufi6TvqoddW0WUCeEkYBBg4pHNabtB8xX9NFJK4vrjC
	UK7qaWxrJ7QZw0Rl1XyBQ89EH8mILk6vZyQjw5eRE8AK/ZuOvrw/zs5SIuXdG19ZSHPYH8klRecHk
	30b4zvlECOGvDWHs/TdOxbKruzCISeqQkGgd/rjzpksbfy3o6aKFIb2Cpxewbwn96Aq67UIfy7lxy
	im9WEJUtTLEGhBOtIVtlkzRQliSoEJFErksSljirXqgqGwdGPfeZXmcEOPdOdBFTvq4CSYoiGcltQ
	TUwy+aQXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXSna-0006ZL-U0; Tue, 27 Oct 2020 17:30:19 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXSlf-0005Vo-Rl; Tue, 27 Oct 2020 17:28:21 +0000
Received: by mail-wm1-x344.google.com with SMTP id v5so2147328wmh.1;
 Tue, 27 Oct 2020 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jHNrAaSQ3QPMQMLs/NiD36NA12e7sFRL6CjasTy60tY=;
 b=sRONzpWbOTrTbXWLhwnjJ4pSlr9TlSsb0qJD+a4NOoGC3sHh2dK/CgSLDY+Kir7phZ
 LVHY3joN3uGKNM5fpcFjslSJzqk5jTDD31JLy7gwx+As8wd64ZNSKCMcAqUzIGHY2m4n
 7pQdkvmexEfaBbVPGIwKGfjs3umIdU6H1cPr8mDWxsKXoutN8Y7kRGsPcKNCf2R47eEp
 IOuiMrDoVtRiBzbtwHatEJoGJVcMtMAzRCT3/MxLaPppSf4KsQal1vqEOEBfOJ8kUD6C
 2zgyYj16PENWBrtRdxTF6HHFDPd94vRxJhwmL5VFZCX1u7aG2kr32e9p3ba2arBedtU0
 RvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jHNrAaSQ3QPMQMLs/NiD36NA12e7sFRL6CjasTy60tY=;
 b=BgWkaygzQOF+UJtmfLL6YP/RRc3lhnyY2ezkwNukUiSykdEgdhdHsDXDo3VB8mCJMf
 97CLwbT5SwaZug1vW2hTrIx7UeVeLOmOCmG+iNGuAvZiXemecjgCI2qDVtX52IN9B1tR
 nuuQzx0Vak99RGLj4AA7BOl2RVBMJcq2VFh5oyMhYuX0i1P7NIA0OIWKO9gAzDX4sLV9
 efN3MIrkzwvLMwAonKizYmxgaLx8FXtymCEoVH5a0P5KsoIcsdFPDbWPJM0LssLZXtII
 1erSqg1HQug8OW3nn+gNXyof/foh7Kn1dKKjFq2ocWZEpDaQTS2l0spcag3E2NUGo1YJ
 Hxpw==
X-Gm-Message-State: AOAM531wJaiaD6gflnPaU4o7LjyyvKAWp161HbJ7wjcB+yJxFnnB18Tt
 9RVFQ6TK+F2kz9OSQeoifkc=
X-Google-Smtp-Source: ABdhPJwOyy0uznYALf7m26/ANTk1qCm2a4G5ZZqF1+WWAI9V86Ho3xQ3yfOEOJmZZdLM1DktsR8VWQ==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr3977468wma.100.1603819696811; 
 Tue, 27 Oct 2020 10:28:16 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:659b:3847:24e3:b881?
 ([2a01:110f:b59:fd00:659b:3847:24e3:b881])
 by smtp.gmail.com with ESMTPSA id b5sm2807131wrs.97.2020.10.27.10.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 10:28:16 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
 <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
Date: Tue, 27 Oct 2020 18:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_132819_987745_3F89B72C 
X-CRM114-Status: GOOD (  22.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTAvMjcvMjAgMTA6MjggQU0sIEdlbmUgQ2hlbiB3cm90ZToKPiBKYWNlayBBbmFzemV3c2tp
IDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT4g5pa8IDIwMjDlubQxMOaciDIx5pelIOmAseS4
iSDkuIrljYg1OjQ35a+r6YGT77yaCj4+Cj4+IE9uIDEwLzIwLzIwIDg6NDQgQU0sIEdlbmUgQ2hl
biB3cm90ZToKPj4+IEphY2VrIEFuYXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29t
PiDmlrwgMjAyMOW5tDEw5pyIOeaXpSDpgLHkupQg5LiK5Y2INTo1MeWvq+mBk++8mgo+Pj4+Cj4+
Pj4gSGkgR2VuZSwKPj4+Pgo+Pj4+IE9uIDEwLzcvMjAgMzo0MiBBTSwgR2VuZSBDaGVuIHdyb3Rl
Ogo+Pj4+PiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPj4+Pj4KPj4+
Pj4gQWRkIE1UNjM2MCBMRUQgZHJpdmVyIGluY2x1ZGUgMi1jaGFubmVsIEZsYXNoIExFRCB3aXRo
IHRvcmNoL3N0cm9iZSBtb2RlLAo+Pj4+PiAzLWNoYW5uZWwgUkdCIExFRCBzdXBwb3J0IFJlZ2lz
dGVyL0ZsYXNoL0JyZWF0aCBNb2RlLCBhbmQgMS1jaGFubmVsIGZvcgo+Pj4+PiBtb29ubGlnaHQg
TEVELgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNo
dGVrLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBkcml2ZXJzL2xlZHMvS2NvbmZpZyAgICAgICB8
ICAxMiArCj4+Pj4+ICAgICBkcml2ZXJzL2xlZHMvTWFrZWZpbGUgICAgICB8ICAgMSArCj4+Pj4+
ICAgICBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYyB8IDc4MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwgNzk2
IGluc2VydGlvbnMoKykKPj4+Pj4gICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2xlZHMv
bGVkcy1tdDYzNjAuYwo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL0tjb25m
aWcgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+Pj4+PiBpbmRleCAxYzE4MWRmLi5jNzE5MmRkIDEw
MDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+Pj4+PiArKysgYi9kcml2ZXJz
L2xlZHMvS2NvbmZpZwo+Pj4+PiBAQCAtMjcxLDYgKzI3MSwxOCBAQCBjb25maWcgTEVEU19NVDYz
MjMKPj4+Pj4gICAgICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3Igb24tY2hp
cCBMRUQgZHJpdmVycyBmb3VuZCBvbgo+Pj4+PiAgICAgICAgICAgTWVkaWF0ZWsgTVQ2MzIzIFBN
SUMuCj4+Pj4+Cj4+Pj4+ICtjb25maWcgTEVEU19NVDYzNjAKPj4+Pj4gKyAgICAgdHJpc3RhdGUg
IkxFRCBTdXBwb3J0IGZvciBNZWRpYXRlayBNVDYzNjAgUE1JQyIKPj4+Pj4gKyAgICAgZGVwZW5k
cyBvbiBMRURTX0NMQVNTX0ZMQVNIICYmIE9GCj4+Pj4+ICsgICAgIGRlcGVuZHMgb24gTEVEU19D
TEFTU19NVUxUSUNPTE9SCj4+Pj4KPj4+PiBTaW5jZSBDT05GSUdfTEVEX0NMQVNTX01VTFRJQ09M
T1IgY2FuIGJlIHR1cm5lZCBvZmYgeW91IG5lZWQgdG8gaGF2ZQo+Pj4+IGJlbG93IGluc3RlYWQ6
Cj4+Pj4KPj4+PiBkZXBlbmRzIG9uIExFRFNfQ0xBU1NfTVVMVElDT0xPUiB8fCAhIUxFRFNfQ0xB
U1NfTVVMVElDT0xPUgoKTXkgdHlwbyBoZXJlLCBzaG91bGQgYmUgb25lICIhIjoKCmRlcGVuZHMg
b24gTEVEU19DTEFTU19NVUxUSUNPTE9SIHx8ICFMRURTX0NMQVNTX01VTFRJQ09MT1IKCkFuZCB5
b3Ugc2hvdWxkIGFsc28gaGF2ZQoKZGVwZW5kcyBvbiBMRURTX0NMQVNTX0ZMQVNIIHx8ICFMRURT
X0NMQVNTX0ZMQVNICgpCdXQgdG8gbWFrZSBpdCB3b3JrIGNvcnJlY3RseSB5b3Ugd291bGQgaGF2
ZSB0byBhZGQgcmVnaXN0cmF0aW9uCnN0dWJzIHRvIGluY2x1ZGUvbGludXgvbGVkLWNsYXNzLWZs
YXNoLmggc2ltaWxhcmx5IHRvIExFRCBtYyBzdHVicwppbiBpbmNsdWRlL2xpbnV4L2xlZC1jbGFz
cy1tdWx0aWNvbG9yLmguCgo+Pj4+Cj4+Pj4gVW5sZXNzIHlvdSB3YW50IHRvIHByZXZlbnQgZW5h
YmxpbmcgdGhlIGRyaXZlciB3aXRob3V0IFJHQiBMRUQsCj4+Pj4gYnV0IHRoYXQgZG9lcyBub3Qg
c2VlbSB0byBiZSByZWFzb25hYmxlIGF0IGZpcnN0IGdsYW5jZS4KPj4+Pgo+Pj4KPj4+IE1heSBJ
IGNoYW5nZSB0byAic2VsZWN0IExFRFNfQ0xBU1NfTVVMVElDT0xPUiI/Cj4+PiBJIHN1cHBvc2Ug
UkdCIGFsd2F5cyB1c2UgbXVsdGljb2xvciBtb2RlLgo+Pgo+PiBZb3Ugd2lsbCBhbHNvIGhhdmUg
bW9vbmxpZ2h0IExFRCB0aGF0IHdpbGwgbm90IG5lZWQgbXVsdGljb2xvcgo+PiBmcmFtZXdvcmsu
IElzIGl0IHNvbWVob3cgdHJvdWJsZXNvbWUgdG8ga2VlcCAiZGVwZW5kcyBvbiI/Cj4+Cj4gCj4g
SWYgb25seSB1c2UgTUwgTEVEIGFuZCBGTEVELCAgRFRTSSB3aWxsIG9ubHkgZGVmaW5lIE1MIExF
RCBhbmQgRkxFRC4KPiBUaGVyZWZvcmUsIHRoZSBkcml2ZXJzIHByb2JlIHdpbGwgbm90IHJlZ2lz
dGVyIHJnYiBtdWx0aWNvbG9yIGRldmljZS4KClBsZWFzZSB0ZXN0IHlvdXIgdXNlIGNhc2UgYWdh
aW4gd2l0aCBteSBmaXhlZCAiZGVwZW5kcyBvbiIuCgpJbiBjYXNlIHdoZW4gdGhlcmUgaXMgb25s
eSBNTCBMRUQgYW5kIEZMRUQgaW4gdGhlIERUIGl0IHNob3VsZApyZWdpc3RlciBib3RoIGRldmlj
ZXMgaWYgTEVEU19DTEFTU19GTEFTSCBpcyB0dXJuZWQgb24uCk11bHRpY29sb3IgZnJhbWV3b3Jr
IGhhcyBub3RoaW5nIHRvIGRvIGluIHRoaXMgY2FzZS4KCkJ1dCBpZiB5b3UgYWRkaXRpb25hbGx5
IGhhZCBNQyBMRUQgbm9kZSwgdGhlbiBpdCBzaG91bGQKYmUgcmVnaXN0ZXJlZCBvbmx5IGlmIExF
RFNfQ0xBU1NfTVVMVElDT0xPUiBpcyBlbmFibGVkLgoKU2ltaWxhcmx5LCB3aGVuIEZMRUQgbm9k
ZSBpcyBwcmVzZW50LCBidXQgTEVEU19DTEFTU19GTEFTSAppcyBvZmYsIGFuZCBMRURTX0NMQVNT
X01VTFRJQ09MT1IgaXMgb24sIHRoZSBkcml2ZXIgc2hvdWxkIHN0aWxsCmNvbXBpbGUsIGJ1dCBy
ZWdpc3RlciBvbmx5IExFRCBNQyBkZXZpY2UgKGlmIGl0cyBub2RlIGlzIHByZXNlbnQpLgoKUG9z
c2libGUgc2hvdWxkIGJlIGFsc28gdGhlIGNhc2Ugd2hlbiBib3RoIExFRFNfQ0xBU1NfRkxBU0gK
YW5kIExFRFNfQ0xBU1NfTVVMVElDT0xPUiBhcmUgb2ZmLiBUaGVuIG9ubHkgTEVEIGNsYXNzIGRl
dmljZQpmb3IgTUwgTEVEIHdpbGwgYmUgcmVnaXN0ZXJlZCAocHJvdmlkZWQgdGhlcmUgaXMgTUwg
RFQgbm9kZSkuCkJ1dCB0byBtYWtlIGl0IHBvc3NpYmxlIHlvdSBzaG91bGQgaGF2ZSBhbHNvICJk
ZXBlbmRzIG9uIExFRFNfQ0xBU1MiCmluIHRoZSBLY29uZmlnIGVudHJ5LgoKPiBJIHdpbGwgcmVt
b3ZlICJkZXBlbmRzIiwgdXNlICJzZWxlY3QiIGluc3RlYWQuCgotLSAKQmVzdCByZWdhcmRzLApK
YWNlayBBbmFzemV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
