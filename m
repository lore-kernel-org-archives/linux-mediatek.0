Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381DDC10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 15:55:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0110B21D56
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 15:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFW7BFHS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbYgGqz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0110B21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COIw2gYohHal+0itNaumeD0tAeKs5Cys/DyJPhlqUe8=; b=lFW7BFHSWIV86m
	M9HHM2wv2N3K1zt15vY26ltCM8Di4b64lls3twajccyYuKhn/PCXko65aLtrzAo6FWMzzZlY67o2c
	814wv3ul5VZgdK2xeK/gMXiGhZ+RH/EzL2R/6IEI5WTKX/IG+UT0w9QXedUMsPpO6GkbvcTAYPxm4
	dsTaCL0o27yFTgJ1dnHk08p0o/7WYEDJBdEp8uXDmfpjSJriZjryAZ7Ye4qHDL0zdHbse1i8Oy+dV
	0DqYfn/0DZJGCV+BUZY94mri8SLixa4iq8yvJ9y+ITlYAeYbhc0ObL1iGqqnWjPt5gycqAVKtxnn7
	VyClU+clOAgaRFpx7azA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBhEK-0003Ho-EN; Tue, 10 Mar 2020 15:55:40 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBhEC-00039z-BJ
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 15:55:34 +0000
Received: by mail-ot1-x341.google.com with SMTP id k26so6367895otr.2
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2020 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TgqmscoWWwUwE2N+wjkp7klbD8Llg5aD9QxcbbWM91M=;
 b=SbYgGqz6Iv/cF2Xk6HbsmaZYROCsChtMTCZqVrowfSBNRknWfl4l1M2KOEsbDuDViG
 gz35NNiTeGIUs6AKuQ85hd+LpOAnbrCsiqXjdX8KQqXe7sYPAN3+qsNvVCKZfIlRisfw
 d8FdhZRhYobG0/brLgrhPttDTXvZDKY2co3aN4RN+AwRGvicLAZZiSbWUv4cmlcMSEYV
 y3pCA+lmAWxqQ1Zt2ktlka8bQcuydF8d6bzmMRc/6QhsiRaYsUAFs5SzkAyLyKI8wrmc
 s1TDcwRI8TNmjAenvUK7oftIL/kYKvWncS50htb8hL0Me+hB5c2JE7d9rw/gD2+mtj4P
 5H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TgqmscoWWwUwE2N+wjkp7klbD8Llg5aD9QxcbbWM91M=;
 b=ImUGrFbK5qwieka7Zb2UGbxMZb2NlEVBCw4PrRYcFHY4ck8vxskMKN0igdq8vakAJg
 0X0hIux7edcNVPkK2S6B4revvslknAC+KK+subPdEr5nWD5/1eCvn2XsGh7s9fZg4Sl0
 icZ2+JUYdiGPCLhdzTTb2vcdN7qdxJVnpEEanmMMqsO6yY6GKhgFkqMcChAyMZLZoReJ
 M2OEgWrvXfDY2HZtg6dirblwHG5DcLBnxoMEqg3qXsalR4ZfcEVmODlSHE6xaoODQZOW
 zMPU4ny1/ETmCLCTmmQ/hhQcYBdyfIRIq5iDNqI8eAosqPsP9LdL6T/vQ9xGDGm/R7cW
 wu/A==
X-Gm-Message-State: ANhLgQ0cIPPJcrIfTHqdAtSHucfOU/7FWAewdnJbCylsfqfyaj/9s2fR
 3DxKj7rHaPCJqW5JelUUaFEsHMKF5qTwuFyH9vov8Q==
X-Google-Smtp-Source: ADFU+vva3WOrofQsiULBwLdHFTnTgcGCFkvcJUnV+SV2B4eVtEQKOTmFmG4oUCa5cat2xXUgVCBlj6+tobSNOz5bcMI=
X-Received: by 2002:a9d:19e9:: with SMTP id k96mr17670341otk.68.1583855731083; 
 Tue, 10 Mar 2020 08:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org>
 <20200310142652.GK1922688@smile.fi.intel.com>
In-Reply-To: <20200310142652.GK1922688@smile.fi.intel.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 10 Mar 2020 16:55:20 +0100
Message-ID: <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_085532_396847_60928E86 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, ben.kao@intel.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jonathan.Cameron@huawei.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCk9uIFR1ZSwgMTAgTWFyIDIwMjAgYXQgMTU6MjYsIEFuZHkgU2hldmNoZW5rbwo8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFy
IDEwLCAyMDIwIGF0IDAyOjQ2OjAyUE0gKzAxMDAsIFJvYmVydCBGb3NzIHdyb3RlOgo+ID4gQWRk
IGRldmljZXRyZWUgbWF0Y2ggdGFibGUsIGFuZCBlbmFibGUgb3Y4ODU2X3Byb2JlKCkKPiA+IHRv
IGluaXRpYWxpemUgcG93ZXIsIGNsb2NrcyBhbmQgcmVzZXQgcGlucy4KPgo+IC4uLgo+Cj4gPiAr
I2RlZmluZSBPVjg4NTZfTlVNX1NVUFBMSUVTIEFSUkFZX1NJWkUob3Y4ODU2X3N1cHBseV9uYW1l
cykKPgo+IFVzZSBBUlJBWV9TSVpFKCkgZGlyZWN0bHkuCgpBY2suCgo+Cj4gSGF2ZSB5b3Ugc2Vl
biBTYWthcmkncyBjb21tZW50cz8KPiBTYWthcmksIGRvIEkgaGF2ZSBkw6lqxIUgdnUgb3IgeW91
IGluZGVlZCBjb21tZW50ZWQgdGhpcyBkcml2ZXI/CgpZZXMsIEkgbWF5IGhhdmUgbWlzc2VkIHNv
bWUgcGFydCBvZiBpdCwgc28gcGxlYXNlIHRlbGwgbWUgaWYgSSBoYXZlLgoKVGhlcmUgaXMgYSBw
YXRjaHNldCBmbG9hdGluZyBhcm91bmQgdGhhdCBpbXBsZW1lbnRzIGEgbGFyZ2VyIGNodW5rIG9m
CmZ1bmN0aW9uYWxpdHksCmluY2x1ZGluZyBhIGNvdXBsZSBvZiBuZXcgbW9kZXMuIFRoaXMgaXMg
YmFzZWQgb24gdGhhdCBzZXJpZXMuCgo+Cj4gLi4uCj4KPiA+ICsgICAgIGdwaW9kX3NldF92YWx1
ZV9jYW5zbGVlcChvdjg4NTYtPm5fc2h1dGRuX2dwaW8sIEdQSU9EX09VVF9MT1cpOwo+Cj4gPiAr
ICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAob3Y4ODU2LT5uX3NodXRkbl9ncGlvLCBHUElP
RF9PVVRfSElHSCk7Cj4KPiBZZXMsIHNlZW1zIHRoaXMgb25lIGlzIGludmVydGVkLgo+Cj4gLi4u
Cj4KPiA+ICt7Cj4gPiArICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAob3Y4ODU2LT5uX3No
dXRkbl9ncGlvLCBHUElPRF9PVVRfTE9XKTsKPiA+ICsgICAgIHJlZ3VsYXRvcl9idWxrX2Rpc2Fi
bGUoT1Y4ODU2X05VTV9TVVBQTElFUywgb3Y4ODU2LT5zdXBwbGllcyk7Cj4gPiArICAgICBjbGtf
ZGlzYWJsZV91bnByZXBhcmUob3Y4ODU2LT54dmNsayk7Cj4gPiArfQo+ID4gKwo+ID4gKwo+Cj4g
T25lIGJsYW5rIGxpbmUgaXMgZW5vdWdoLgo+Cj4gLi4uCj4KPiA+ICsgICAgIG92ODg1Ni0+eHZj
bGsgPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAieHZjbGsiKTsKPiA+ICsgICAgIGlmIChJ
U19FUlIob3Y4ODU2LT54dmNsaykpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2VycigmY2xpZW50
LT5kZXYsICJmYWlsZWQgdG8gZ2V0IHh2Y2xrXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiArICAgICB9Cj4KPiBQcmV2aW91c2x5IGl0IHdvcmtlZCB3aXRob3V0IGNs
b2NrIHByb3ZpZGVyLCBub3cgeW91IG1ha2UgYSBkZXBlbmRlbmN5Lgo+Cj4gVGhpcyB3b24ndCB3
b3JrLgoKU28gdGhlIGlkZWFsIGJlaGF2aW9yIHdvdWxkIGJlIHRvIG9ubHkgdXNlIHRoZSB4Y2xr
IGlmIGl0IGlzIHByb3ZpZGVkPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
