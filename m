Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68416C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:51:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E925F224B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E925F224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7QmlHAW5tiFr7QMbz6JoOZ+Z5giQ6E4ZyNO2aVrOwIs=; b=Al7P9rw5xRZDPARRjhYdaLhrV
	5cJPn5799Qq1E3oolDi3BRK/OkIyrtoKdi8QsEFME9xJXfIOTA3OPI3hw31d/FwhPDSVXaQLHMZHk
	v0bfPVQkJsJlgIebTzP+peC0vNW3k6AgiaB4mevTkiV83Ho2Sks0/bLsPIFOxo8627Gr8NX+9iTNY
	3jrWSoKA0fo/4q0qB8nZVNlx00RNfhFt4tvQCKzUS7+b+9yAYq6ySYP2kHoaBipy9TqmEuBMht55f
	3hxBA00fAuJkZV1Y2P7Hqc8IEl5AxwIXmcjfBa9bCV1nawQunW1ILBUkXk56G6SX9EjKYY+14iGGG
	kju31QdaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22eQ-0000LK-CL; Wed, 20 Jan 2021 01:51:14 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22eL-0000Fr-Ps; Wed, 20 Jan 2021 01:51:10 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 3so4010094ljc.4;
 Tue, 19 Jan 2021 17:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EOmNpRX8SEbQAJ9InTqMSNS2j7g0suVcBgq97tfbIbQ=;
 b=I3qDBA9cDib9CkJzwuxF/g+0zMDc3JeLl4/2KThX16QQW/b9GqN6PeAwLvoWmhNgSr
 yonfe7+Hp0cDnEFp19D5zWRQKycOsHRhVqsxYcGMFmiOBiH/nDUG0eRK9gPwHSrUg8cu
 PPpxCmhNMLHm6IRN9FIr05AZpI8A1sDnubZp/fBN4qlEj3pOU4JOMUtkuHlv5krn4iqi
 yBk7zYG29xoVqd20crDKnauAKeJu0NrapS/9fkYWCggiMIgI1Bya++HwZC/Kp+4uG2Lz
 jfn5PVPSmwxUvAfLFj0nIL9dTU0/wmb6HsGGT8MM9I2o2k3Bl4nr191BGn3uYAV9LzX7
 vPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EOmNpRX8SEbQAJ9InTqMSNS2j7g0suVcBgq97tfbIbQ=;
 b=SI8HmjZN4AC+XQmaIrXVBokE6ZZANKPkfFN8+9IuTS5XU7XvoAeTgRD2wx6++sZmFU
 XaZxFUoZ36WaWDgGMbx36rWUM+RGz9MU4LxpG7dSJHuiz/ciO9Gpb/QXtt5jV757MXVy
 GYQejveDaTNgMvgI3rDzZbLjmprM3oqs4V5TokyPPorjxDWww2wm33h8iyon2z9o98K/
 JkVzxe2qy4WSayCx8pHO2KDTP2BJYXFWhxID0FdZlQjJPTA6aKXqpnlx+7Im5vpRgo2U
 gRDszEUfY5Krz+jRMgUmKUfo83zWSEQ28xpqKSiz7jCSxx/dHY7US6jq7jBJzceX2VWW
 13Hg==
X-Gm-Message-State: AOAM533ODn1IWgEJCY+MrV/R7HRA1LM5e209KOefDkjdPy788HTk/PNm
 HL2WeEKqSEQ5Ar9OJcvCXjO9UAA5gDLanli/T3E=
X-Google-Smtp-Source: ABdhPJygEfsArRDrh+JnpahiHFfQMmrfKhHFHuwAbP4alJJdACL3ihQ5Qh4sGJ6Cu8lTbQlN90Y6Ea5V6E77+v3Tbfc=
X-Received: by 2002:a2e:a36a:: with SMTP id i10mr3159325ljn.342.1611107466601; 
 Tue, 19 Jan 2021 17:51:06 -0800 (PST)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <1610720001-15300-2-git-send-email-u0084500@gmail.com>
 <20210119231058.GA2772032@robh.at.kernel.org>
In-Reply-To: <20210119231058.GA2772032@robh.at.kernel.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Wed, 20 Jan 2021 09:50:55 +0800
Message-ID: <CADiBU3_t5jozakQnD7Wuuj1pjumbXhW3P9kkWRqh5pG1pfi_Sw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb typec: tcpci: mt6360: Add vbus supply into
 dt-binding description
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_205109_854945_F4D236AD 
X-CRM114-Status: GOOD (  17.39  )
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMjDml6Ug6YCx5LiJ
IOS4iuWNiDc6MTHlr6vpgZPvvJoKPgo+IE9uIEZyaSwgSmFuIDE1LCAyMDIxIGF0IDEwOjEzOjIx
UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVh
bmdAcmljaHRlay5jb20+Cj4gPgo+ID4gQWRkIGV4dGVybmFsIHZidXMgc291cmNlIGludG8gZHQt
YmluZGluZyBkZXNjcmlwdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5n
IDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCB8IDcgKysrKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNw
Yy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxt
dDYzNjAtdGNwYy55YW1sCj4gPiBpbmRleCAxZThlMWMyLi5iOGQ4NDJiIDEwMDY0NAo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAt
dGNwYy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPiA+IEBAIC0yNiw2ICsyNiwxMSBAQCBwcm9wZXJ0
aWVzOgo+ID4gICAgICBpdGVtczoKPiA+ICAgICAgICAtIGNvbnN0OiBQRF9JUlFCCj4gPgo+ID4g
KyAgdmJ1cy1zdXBwbHk6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFZidXMgc291
cmNlIHN1cHBseSByZWd1bGF0b3IuCj4gPiArICAgIG1heEl0ZW1zOiAxCj4KPiB2YnVzLXN1cHBs
eSBpcyBhbHJlYWR5IGluIHRoZSAnY29ubmVjdG9yJyBub2RlLCB5b3UgZG9uJ3QgbmVlZCBpdCBo
ZXJlLgo+CklmIG5vdCBwdXQgaGVyZSwgJ3JlZ3VsYXRvcl9nZXQnIG9ubHkgY2FuIGZvbGxvdyB0
aGUgbGVnYWN5IHdheSB0byBnZXQKdmJ1cyByZWd1bGF0b3IuCkN1cnJlbnRseSwgdGhlcmUncyBu
byBvbmUgdG8gdXNlIHRoZSAndmJ1cy1zdXBwbHknIHByb3BlcnR5LgpGcm9tIG15IHVuZGVyc3Rh
bmRpbmcsIHRoZSAndmJ1cy1zdXBwbHknIGlzIHRoZSBjaGlwIGxldmVsIHByb3BlcnR5LApub3Qg
Y29ubmVjdG9yIHR5cGUgcHJvcGVydHkuCgo+ID4gKwo+ID4gICAgY29ubmVjdG9yOgo+ID4gICAg
ICB0eXBlOiBvYmplY3QKPiA+ICAgICAgJHJlZjogLi4vY29ubmVjdG9yL3VzYi1jb25uZWN0b3Iu
eWFtbCMKPiA+IEBAIC0zOCw2ICs0Myw3IEBAIHJlcXVpcmVkOgo+ID4gICAgLSBjb21wYXRpYmxl
Cj4gPiAgICAtIGludGVycnVwdHMKPiA+ICAgIC0gaW50ZXJydXB0LW5hbWVzCj4gPiArICAtIHZi
dXMtc3VwcGx5Cj4gPgo+ID4gIGV4YW1wbGVzOgo+ID4gICAgLSB8Cj4gPiBAQCAtNTQsNiArNjAs
NyBAQCBleGFtcGxlczoKPiA+ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYz
NjAtdGNwYyI7Cj4gPiAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW8yNiAz
IElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gPiAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJQ
RF9JUlFCIjsKPiA+ICsgICAgICAgICAgdmJ1cy1zdXBwbHkgPSA8Jm90Z192YnVzPjsKPiA+Cj4g
PiAgICAgICAgICAgIGNvbm5lY3RvciB7Cj4gPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1
c2ItYy1jb25uZWN0b3IiOwo+ID4gLS0KPiA+IDIuNy40Cj4gPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
