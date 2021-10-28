Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D59C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 01:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4666112F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 01:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC4666112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoTLZadVpLZZCE+EU/XwtOc/76BViDuz6XTYDZfzjVg=; b=jcPIe+ecQu3ZzC
	FT3jRr9hvzzwB04YiIJ/Ccx0tJG2ipsS+2XrzwR45hYe3kmGUOKmxp5651VKcWUyijjEyWSLzBtsp
	dvacANQivP7ZXIDKZK6bxXE+ATNwyqOl8BY/MOLhlTDcdhBYZDtpzoHLRHhwlydDsoYhk6YV40Fl4
	n2htw8FSSX0EKhu/qZxTUAkBwIHRBpk5sqIOC9V+TLb9soeqM6IZOAJAY11AcHXKN6i9mWwEEzCoM
	AdJmTG60SXOPgNJTEwrKuRw4t3ezaEOzLo/nRUIQIsQI+Hau5rY+7MulRgOGv/KCJ4mrIIwJyg81P
	wKjPINOetXtBOCmyB4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfuUA-006f5t-Ri; Thu, 28 Oct 2021 01:45:42 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfuTy-006f4d-Js; Thu, 28 Oct 2021 01:45:31 +0000
Received: by mail-oi1-x235.google.com with SMTP id q124so6141827oig.3;
 Wed, 27 Oct 2021 18:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GvIDzwndi4kOaXgwdqTw9zkmY4QEl0D1mqqX44XzZOs=;
 b=PnLhLYRXlzg2rWP0WMtl2acm00UXMnFhALl3OMVuiEYwMHQjWOI0XIy2phw+4B5+Xb
 I1TrNVmTqU29jEL9JHpUUN+syXUsKinkcjT13Lrvl0zl4q2M7liAS5BS9IfoEX7xVOds
 qbtt1r4StBzMZ5wUnXAvwUJ5L3E0CKdshQyueYNIWX7HE3JlyAUZyIGoPqILLo5ms1wA
 ovMjZ+ouNLN3YSMxAeWUewUW7Egpddlb489m8JlgNuIsEzeo2a6WcquMQ6py0Ul93x5X
 vFYpTdHSc6UezG5puSY4sNOJFqHSjsCBln2IC49j6NsdukzZgQ0gEl9Xc2LFh2z9S1no
 4hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GvIDzwndi4kOaXgwdqTw9zkmY4QEl0D1mqqX44XzZOs=;
 b=7lNDG/sUcSLT1lesZKp5MU2tsMBZU7HU/D+lOB9HcVbxzDBd2O4OrHjlDmYaOdQgVU
 1MkXsfZzirTS6LXmAsV9rI65k1Md0AlHDXigck63FXOMGkagbawYewC6qwfB3LxSWg8i
 5UaHWHf+7jBS5/T2hr6mr05CLOXQh0hNCRiBqHLGnMQFiaTWF4lr+dg6e4cfLCB2PPTh
 NRKxBctec8UxDEmPWTV3zFIZzR9kHoTFuZpv4FRSD9IeYDGMh+JHlHG99q3v8XYQu6mh
 8BuiUjMFss7eZOrX7hv/m4SJUATvrEv1F7gT96Hsa55MTcvr0Y0gwlJ4LM8JY9yv+1sa
 G4Bw==
X-Gm-Message-State: AOAM532COB1PjPc2k93jeVzUDFK0wdmX7I5nvX2xNayQG/+BqqsTrXHS
 qjy3wK8dyOz0WyQtKh69E7fp9zUfIKer8vr3PnY=
X-Google-Smtp-Source: ABdhPJy7NnH/7A0gckbkUdoounQCLUKhPDDBZRlb+HQP1s9JbW5pMDT6xTwrbcA+Lr7C6SfsBtlbl0PBenhJv8tmoEw=
X-Received: by 2002:aca:b809:: with SMTP id i9mr829009oif.103.1635385529677;
 Wed, 27 Oct 2021 18:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635333327.git.siyanteng@loongson.cn>
 <50f5f509c15251fb10b0c87304d272e2c89841f0.1635333327.git.siyanteng@loongson.cn>
 <CAMhs-H9MANfLThCC-m9Q5whAgRAbnzXjUpipQdnwRf0iqPwJuw@mail.gmail.com>
In-Reply-To: <CAMhs-H9MANfLThCC-m9Q5whAgRAbnzXjUpipQdnwRf0iqPwJuw@mail.gmail.com>
From: yanteng si <siyanteng01@gmail.com>
Date: Thu, 28 Oct 2021 09:45:17 +0800
Message-ID: <CAEensMxOn2Uz7d051C=N6xCLFM8JHr1PCpDETM6z2xkC46XV7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: mt7621: Add MODULE_* macros to MT7621 PCIe host
 controller driver
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Yanteng Si <siyanteng@loongson.cn>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, sterling <sterlingteng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_184530_673855_236432DD 
X-CRM114-Status: GOOD (  17.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

U2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPiDkuo4yMDIx
5bm0MTDmnIgyN+aXpeWRqOS4iSDkuIvljYg4OjAw5YaZ6YGT77yaCj4KPiBIaSwKPgo+IE9uIFdl
ZCwgT2N0IDI3LCAyMDIxIGF0IDE6MzIgUE0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBTaW5jZSBjb21taXQgMmJkZDUyMzhlNzU2ICgiUENJOiBtdDc2
MjE6IEFkZCBNZWRpYVRlayBNVDc2MjEgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIikKPiA+
IHRoZSBNVDc2MjEgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIGlzIGJ1aWx0IGFzIGEgbW9k
dWxlIGJ1dCBubyBNT0RVTEVfKigpIGF0dHJpYnV0ZXMKPiA+IHdlcmUgc3BlY2lmaWVkLCBjYXVz
aW5nIGEgYnVpbGQgZXJyb3IgZHVlIHRvIG1pc3NpbmcgbGljZW5zZSBpbmZvcm1hdGlvbi4KPiA+
Cj4gPiBFUlJPUjogbW9kcG9zdDogbWlzc2luZyBNT0RVTEVfTElDRU5TRSgpIGluIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEubwo+ID4KPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyBN
T0RVTEUgYXR0cmlidXRlcyB0byB0aGUgZHJpdmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1tdDc2MjEuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEuYwo+ID4g
aW5kZXggYjYwZGZiNDVlZjdiLi42NjhiNzM3Zjg2ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtbXQ3NjIxLmMKPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1tdDc2MjEuYwo+ID4gQEAgLTU5OCwzICs1OTgsNSBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBtdDc2MjFfcGNpX2RyaXZlciA9IHsKPiA+ICAgICAgICAgfSwKPiA+
ICB9Owo+ID4gIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKG10NzYyMV9wY2lfZHJpdmVyKTsKPiA+
ICsKPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4KPiBJIGd1ZXNzIHRoaXMgaXMgbmVl
ZGVkIGZvciBDT01QSUxFX1RFU1Qgc2NlbmFyaW9zPwp5ZWFoIQo+Cj4gQWNrZWQtYnk6IFNlcmdp
byBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KClRoYW5rIHlvdSB2
ZXJ5IG11Y2ghCgpUaGFua3MsCnlhbnRlbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
