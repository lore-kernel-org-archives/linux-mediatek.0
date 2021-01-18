Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E811C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 08:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB9D2255F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 08:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB9D2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RNQTH9hpo7ZleF39oew4+a34PTejWQg5a/xoCVmz1PM=; b=fqSBIPzqUHQu0QWjG1BsWuxnL
	YIS9tS5F7RZi0UHLVnAKjV0oLjGGP7//9Dr8TMppItK2NadDN9m8tPMQJ5ovM4mN3MencIF0rvJWM
	IVVDxejTko4W8diPpKFxAFJDgjgF/iU2Nbf0e7Y59mrSXpeK+bUTNFQIP/pQ1feIjxrNOBeknvA2U
	UHKAsg6WVvbe7qSyR8DNM4hPAOQGdbi3SS59ke7sRLrjKUyhodCIeD5ZoiJOPbNDqJrljNmI4J2xx
	6gy/N0NKAKh39Lyp6OMvwVLzR/cs90tfeBfyoatOGzSJJ00gXePvyvEZ0KVaJGGiOsT5PZfrrY5ic
	ERoM/ODDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1PzE-00016H-5H; Mon, 18 Jan 2021 08:34:08 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Pz9-000151-S6; Mon, 18 Jan 2021 08:34:04 +0000
Received: by mail-lj1-x22e.google.com with SMTP id m10so17325281lji.1;
 Mon, 18 Jan 2021 00:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NxbXFKF94p6kEsRAtmd8BKyy9JENwa9sivc+ZAodEKA=;
 b=A2RSX4y2LmMv6mR7pwlrf3u6T3rGFBse1drQ3xjZKsSLH2Wb5CBopN0Tdz9y8eXBQP
 kAFWmHreQYGoFj+NYj3SHu6ce3tYIQMekoexo1meFdbwptfhfM44+l3RDgA7JQVVFEbd
 8bm9FjCb8rzH8w6Ew8sijtTEYsfyzOoNBPxcVvAu7mrpZWtqwzqevN5S6qSYBg1m8vSL
 piLsmxcfauKP/oTrw8wu7xtJD0MddqhyzJ7iqkN/jZNRUm4Y6LM8YY3jEduWM49lnYIg
 /bsJ++4LJSwhCDav/DwNlIbCiYP3FuEBFqfOiYvEHZqXoJGeItOcb1YzywOHWuhz1nuI
 d4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NxbXFKF94p6kEsRAtmd8BKyy9JENwa9sivc+ZAodEKA=;
 b=GZArdJ3xQpGz1bFjtfLw8/FefaMaF2Wd7oc6+j2xDo7nz1HqZ4AdFFaXEOevfkn0ua
 Sad9xA/0a+/Qm2fq5VI1AZ+ieUFQN0qUbuvy+Tqix3z+4gzHeVdBR8i2N8ogMEW7e+zX
 PZWb+pVOkxT5hNrDJbK7nbyJqorlqqnY3LoKHRbT2GWnGt4JyeT/4vRSH4wAXWi7jTDw
 mTzs8z/9ELzmgcn1ypw5qjNe9v6KR0fWk9qC9S19Xxh8Bv1T/9ecFGbfjoNo3Db1HhMt
 YKnlbc4J63FOAc96t3m8Iuk2Nm2xPOjni9LSnFC/5gTGymvOYNDRszEElC7uz1MGgoOS
 rfXQ==
X-Gm-Message-State: AOAM530CT8DZMA35N/j7zq158Auq+GZ8jXi0uCszAOh7qC+FESHpwv70
 lpnPk6Nw8JLTYRz59w7ti/npwAgdUy6WkAZTbQQ=
X-Google-Smtp-Source: ABdhPJynqi6oTwFjkTNFUl1fP0igBITsisexmUdUKnImyJVj0NHltLH5ZKbkHMkITjIr3opjkpv5LEywTjJJTrhJ9R4=
X-Received: by 2002:a2e:8e64:: with SMTP id t4mr10154052ljk.141.1610958842168; 
 Mon, 18 Jan 2021 00:34:02 -0800 (PST)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <1610720001-15300-2-git-send-email-u0084500@gmail.com>
 <1610898357.197444.1730305.nullmailer@robh.at.kernel.org>
In-Reply-To: <1610898357.197444.1730305.nullmailer@robh.at.kernel.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 18 Jan 2021 16:33:50 +0800
Message-ID: <CADiBU3_pH3_=Dpi8auWTekBaev-ZF2WNPUZRzJEu8+pA0Lk18w@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb typec: tcpci: mt6360: Add vbus supply into
 dt-binding description
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_033403_939211_D1E48CCA 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: gene_chen@richtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMTfml6Ug6YCx5pel
IOS4i+WNiDExOjQ25a+r6YGT77yaCj4KPiBPbiBGcmksIDE1IEphbiAyMDIxIDIyOjEzOjIxICsw
ODAwLCBjeV9odWFuZyB3cm90ZToKPiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJp
Y2h0ZWsuY29tPgo+ID4KPiA+IEFkZCBleHRlcm5hbCB2YnVzIHNvdXJjZSBpbnRvIGR0LWJpbmRp
bmcgZGVzY3JpcHRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpWXVhbiBIdWFuZyA8Y3lf
aHVhbmdAcmljaHRlay5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwgfCA3ICsrKysrKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPgo+Cj4gTXkgYm90IGZvdW5kIGVycm9y
cyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4KPiB5YW1s
bGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+
IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1sOiBwcm9wZXJ0aWVzOnZi
dXMtc3VwcGx5OiAnbWF4SXRlbXMnIGlzIG5vdCBvbmUgb2YgWydkZXNjcmlwdGlvbicsICdkZXBy
ZWNhdGVkJ10KPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbDogaWdu
b3JpbmcsIGVycm9yIGluIHNjaGVtYTogcHJvcGVydGllczogdmJ1cy1zdXBwbHkKPiB3YXJuaW5n
OiBubyBzY2hlbWEgZm91bmQgaW4gZmlsZTogLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPgo+IFNlZSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzE0MjcwNzMKPgo+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYg
dGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZvciBhIHBhdGNoCj4gc2VyaWVz
IGlzIGdlbmVyYWxseSB0aGUgbW9zdCByZWNlbnQgcmMxLgo+Cj4gSWYgeW91IGFscmVhZHkgcmFu
ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQo+IGVycm9y
KHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1h
IGlzIHVwIHRvCj4gZGF0ZToKPgo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKPgo+
IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0Lgo+ClRoYW5rcywgYWZ0ZXIgSSByZS1pbnN0YWxs
ZWQgdGhlIHlhbWxpbnQsIHRoZSBlcnJvciBjYW4gYmUgc2Vlbi4KUmVmZXIgdG8gaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2V4YW1w
bGUtc2NoZW1hLnlhbWwKKi1zdXBwbHkgaXMgb25seSBhIHBoYW5kbGUKCkluIG5leHQgc2VyaWVz
IHBhdGNoLCBJJ2xsIHJlbW92ZSB0aGUgbWF4SXRlbXMgaW4gdmJ1cy1zdXBwbHkuCkkgYWxyZWFk
eSBjaGVja2VkIHRoZSBiZWxvdyBjaGFuZ2UuIG1ha2UgZHRfYmluZGluZ19jaGVjayBjYW4gYmUg
cGFzc2VkCgogICB2YnVzLXN1cHBseToKICAgICBkZXNjcmlwdGlvbjoKICAgICAgIFZidXMgc291
cmNlIHN1cHBseSByZWd1bGF0b3IuCi0gICAgbWF4SXRlbXM6IDEKCiAgIGNvbm5lY3RvcjoKICAg
ICB0eXBlOiBvYmplY3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
