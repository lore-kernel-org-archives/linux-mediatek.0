Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2651C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 07:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C572072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 07:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPX0jdjS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4zuqFUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C572072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuknzDHqH5P40v45P0y8Rby6+hkTytKNXcUrXtFfiXI=; b=NPX0jdjSBDHwxt
	+ODapgt2RsaOxuoB5CIYFJFG8Q49p4bqaU8BQMtO2flgidzkZG2Yg4L4f6t67JZnQwFicmYp9tqYC
	0jbsGF/y+0CjdgumeTVQRnpNRjngE1edpw5ERRSDRCERAm1xbwlfpiwbdrHLnjdcTPTkUOQ1zlQOV
	P216qSot9CQHThQsXOoYa7Phj0WRadVA933MSCR4rVIJQTbaPVqRO8vAnSHajch7+yYeDF6mZjNu+
	wlJsj3EJwG5pCYFBmzHekeggiVylkOqasYkMVvs5ckFP1ABcPX6eM/Xb2aVRF4aZk5pJZJLO3L0EP
	sFvRJKcDmutylQ0ZB/Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCedq-0005Kl-MW; Fri, 13 Mar 2020 07:21:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCedh-0005CO-My
 for linux-mediatek@lists.infradead.org; Fri, 13 Mar 2020 07:21:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id 6so10715570wre.4
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2020 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sQxXi9CRhC6J1JA72O4VCpde45a5cXX2Zji3I69uQo4=;
 b=j4zuqFUo45Vugz82Ecfgizma7gF6A9D6+QHJCcpEJLOtWyy782IHdt5nRr2S0vYWrl
 tCd5QlOFhGEqUCOORfc5U40kPbWKiSMoQxTpqONDLpqIHBiQFBGoAmm9Yy+Yr9YgizWJ
 fsMC4KUgBQqdxCLj4Z7VtqLTVroMe1Q7nKS2ecVcjc0feUY8R8u2yFzWkVY2/uDRJPYG
 tIyb/7nj1iiVKEq7DzZgN/Z41e/T+oMiwjQ/f+M1WoZ1GeZUZN987rLGKqyhgNeL8GHU
 9OjOEVZaJ/ulyf98yV3CxVR6qr0lnKhuMOTWpuZKnFxIwNmDDyH5V+SjdJcur7pxXaOf
 UjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sQxXi9CRhC6J1JA72O4VCpde45a5cXX2Zji3I69uQo4=;
 b=djXaTZPW2HjdOJEinDCgiaIyiSw6xy8u0tX6l8nkedbSNvnQ0BCHFY/flY5gwe/5lA
 MW9ZYJaED4m9Bm6S3PqPepavmh9UBNGHjfLkom3LubIncXtx3JmRCQKQKe9CRV6jvapJ
 w/8tVttJe24Z9qf3VCtliUkWquJUf9DUGzBVCxmNWPsdKYdB+V49WN+0RB0RPC3T9kY1
 VJ8HmpQhsyiq5WfJ2nakG0PV5QKP0xkEh89JkV002qE/QxKb4mW5BFfJ2UUqs2GPUGfy
 G9Mk4CDoyhYGIkR326PTFllDfdbxl0Oak81t7ZpDsnhEhTWkAKNjXIDDYGD3+P1dgK6q
 mVwg==
X-Gm-Message-State: ANhLgQ3PZWBdB/cumap9OHLpjkFs9lSes5B7WLD8jPaLOkxMdoiCUHUx
 wTTRBZzklAxzVE1k6SNJU9vXoQ==
X-Google-Smtp-Source: ADFU+vuPgfTs8juRvDQP7ie5Jjw78q3AucIP1CU5GMcpnF/BXVNtLxngkCxpmiEz6jntkh7XZvkSTw==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr16016232wrt.300.1584084108142; 
 Fri, 13 Mar 2020 00:21:48 -0700 (PDT)
Received: from dell ([2.27.167.19])
 by smtp.gmail.com with ESMTPSA id x8sm68094533wro.55.2020.03.13.00.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 00:21:47 -0700 (PDT)
Date: Fri, 13 Mar 2020 07:22:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH v10 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200313072230.GC3142@dell>
References: <1583918223-22506-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1583918223-22506-5-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200312074407.GA3142@dell> <1584003477.6269.8.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584003477.6269.8.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_002149_753640_25339CCC 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>,
 Josef Friedl <josef.friedl@speed.at>, linux-pm@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxMiBNYXIgMjAyMCwgUmFuIEJpIHdyb3RlOgoKPiBPbiBUaHUsIDIwMjAtMDMtMTIg
YXQgMDc6NDQgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFdlZCwgMTEgTWFyIDIwMjAs
IEhzaW4tSHNpdW5nIFdhbmcgd3JvdGU6Cj4gPiAKPiA+ID4gRnJvbTogUmFuIEJpIDxyYW4uYmlA
bWVkaWF0ZWsuY29tPgo+ID4gPiAKPiA+ID4gVGhpcyBhZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlh
VGVrIE1UNjM1OCBSVEMuIERyaXZlciB1c2luZwo+ID4gPiBjb21wYXRpYmxlIGRhdGEgdG8gc3Rv
cmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4KPiA+ID4gVGhpcyByZXBsYWNl
IFJUQ19XUlRHUiB0byBSVENfV1JUR1JfTVQ2MzIzIGluIG10NjMyMy1wb3dlcm9mZgo+ID4gPiBk
cml2ZXIgd2hpY2ggb25seSBuZWVkZWQgYnkgYXJtdjcgQ1BVIHdpdGhvdXQgQVRGLgo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVr
LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3Bvd2VyL3Jlc2V0L210NjMyMy1wb3dlcm9m
Zi5jIHwgIDIgKy0KPiA+ID4gIGRyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyAgICAgICAgICAgICAg
fCAzMiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiAgaW5jbHVkZS9saW51
eC9tZmQvbXQ2Mzk3L3J0Yy5oICAgICAgICB8ICA5ICsrKysrKysrLQo+ID4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+ID4gCj4gCj4gPC4u
Lj4KPiAKPiA+ID4gIAo+ID4gPiAgI2RlZmluZSBSVENfSVJRX1NUQSAgICAgICAgICAgIDB4MDAw
Mgo+ID4gPiAgI2RlZmluZSBSVENfSVJRX1NUQV9BTCAgICAgICAgIEJJVCgwKQo+ID4gPiBAQCAt
NjUsNiArNjcsMTAgQEAKPiA+ID4gICNkZWZpbmUgTVRLX1JUQ19QT0xMX0RFTEFZX1VTICAxMAo+
ID4gPiAgI2RlZmluZSBNVEtfUlRDX1BPTExfVElNRU9VVCAgIChqaWZmaWVzX3RvX3VzZWNzKEha
KSkKPiA+ID4gIAo+ID4gPiArc3RydWN0IG10a19ydGNfZGF0YSB7Cj4gPiA+ICsJdTMyCQkJd3J0
Z3I7Cj4gPiA+ICt9Owo+ID4gCj4gPiBEbyB5b3UgZXhwZWN0IHRvIGFkZCBtb3JlIHByb3BlcnRp
ZXMgdG8gdGhpcyBzdHJ1Y3Q/Cj4gPiAKPiA+IElmIG5vdCwgaXQgc2VlbXMgYSBiaXQgb3Zlcmtp
bGwuCj4gPiAKPiAKPiBZZXMsIHdlIHdvdWxkIGFkZCBtb3JlIHByb3BlcnRpZXMgaGVyZSBpbiBm
dXR1cmUgcGF0Y2hlcy4KPiAKPiA+ID4gIHN0cnVjdCBtdDYzOTdfcnRjIHsKPiA+ID4gIAlzdHJ1
Y3QgZGV2aWNlICAgICAgICAgICAqZGV2Owo+ID4gPiAgCXN0cnVjdCBydGNfZGV2aWNlICAgICAg
ICpydGNfZGV2Owo+ID4gPiBAQCAtNzQsNiArODAsNyBAQCBzdHJ1Y3QgbXQ2Mzk3X3J0YyB7Cj4g
PiA+ICAJc3RydWN0IHJlZ21hcCAgICAgICAgICAgKnJlZ21hcDsKPiA+ID4gIAlpbnQgICAgICAg
ICAgICAgICAgICAgICBpcnE7Cj4gPiA+ICAJdTMyICAgICAgICAgICAgICAgICAgICAgYWRkcl9i
YXNlOwo+ID4gPiArCWNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgKmRhdGE7Cj4gPiAKPiA+ICdk
YXRhJyBpcyBhIHRlcnJpYmxlIHZhcmlhYmxlIG5hbWUuCj4gPiAKPiA+IFdoeSBkbyB5b3UgbmVl
ZCB0byBzdG9yZSB0aGlzPwo+ID4gCj4gPiBJdCdzIG9uZSB2YXJpYWJsZSB3aGljaCBpcyB1c2Vk
IG9uY2UgQUZBSUNULgo+IAo+IEkgd291bGQgcmVuYW1lICdkYXRhJyB0byAnY29uZmlnJy4KPiAK
PiBUaGlzIHN0cnVjdCB3aWxsIGJlIGV4dGVuZGVkIGluIGZ1dHVyZSBwYXRjaGVzIHRvIGFjaGll
dmUgbW9yZSBQTUlDIGNoaXAKPiBjb21wYXRpYmlsaXR5LgoKT24gY2xvc2VyIGluc3BlY3Rpb24s
IGl0IGxvb2tzIGxpa2Ugd3J0Z3IgKGFsc28gbm90IGEgZ3JlYXQgbmFtZSBmb3IgYQp2YXJpYWJs
ZSBieSB0aGUgd2F5KSBpcyBhIHJlZ2lzdGVyIGFkZHJlc3MuICBJcyB0aGF0IGNvcnJlY3Q/Cklu
aXRpYWxseSBJIHRob3VnaHQgaXQgd2FzIGEgbW9kZWwgbnVtYmVyLCB3aGljaCB3b3VsZCBoYXZl
IGJlZW4gYQpzdWl0YWJsZSBjYW5kaWRhdGUgZm9yIGVudHJ5IGludG8gT0YgLmRhdGEuCgpIb3dl
dmVyLCBkZXNjcmliaW5nIHJlZ2lzdGVyIGFkZHJlc3NlcyBpbiBPRiAuZGF0YSBkb2VzIG5vdCBz
b3VuZCBsaWtlCmdvb2QgcHJhY3RpY2UuICBJdCBpcyB1c3VhbGx5IHVzZWQgdG8gaWRlbnRpZnkg
YSBwbGF0Zm9ybSBpbiB0aGUgY2FzZXMKd2hlcmUgcGxhdGZvcm1zIGNhbm5vdCBiZSBvdGhlcndp
c2UgZHluYW1pY2FsbHkgaW50ZXJyb2dhdGVkIGZvciBtb2RlbApudW1iZXIgdmlhIGEgcmVnaXN0
ZXIgcmVhZC4KCkRlc2NyaWJpbmcgcmVnaXN0ZXIgbWFwcyB2aWEgJ2NvbmZpZycgZGF0YSBpcyBh
IHNsaXBwZXJ5IHNsb3BlLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vydmlj
ZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
