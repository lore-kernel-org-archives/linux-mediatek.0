Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38510C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 10:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005BE61545
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 10:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 005BE61545
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OovKqT2rnIcj3TkskG/aNBkI4/GaXOnmeugJf838Wj8=; b=BKHTvBpXCbO2jd
	479rwplnqO1T/QZ3rhrOUcj+GZX3qGBtC9p0utMNdbG3+Z7Mm1Vx6ErIT8p8BCaEgjtVY/blsXws3
	p2DerNeuQxtn8jQuEp/qHTildXmMS+KDY7xe310GFn60TT4V1NxwHq2qN2Zr7yK6D2cqBeeDpePZs
	vL9EmGFaNioTTj+0X3UWJ5VJbZXKF0ks6vrOCIA7IB8hDFFFE0qqkBYUFxy9HAX9C8Zb0XZOgOUXc
	9SpYtoot1FHnXLTCK2ST6pfZY4k3p8m81yXkm8T6u299jQVfU4xhGSZJHvUfD/lPTJqC0Xlqwri4m
	XAoix/+Ve5Ubscuj3W8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnIZ5-004VDG-A6; Wed, 17 Nov 2021 10:53:19 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnIYr-004V9Y-8O; Wed, 17 Nov 2021 10:53:06 +0000
Received: by mail-oi1-x22b.google.com with SMTP id bj13so5549771oib.4;
 Wed, 17 Nov 2021 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wIIT6/ePIyMUBZgvwPlMAbfK34sVLGh7GgquvsLE084=;
 b=cSytHkCzD13jEuMPLeN1fKQZoR/1NY3pe/zNd5KzepItAPyUCztHvPyI/Bhm0FwBBP
 MSj+jfDd2fxU0th/ADKVbG2l09WgyUc/8UosqhaB6PtljhAHtAnpPuGUfI0mpJTLVbrZ
 n2CDYNwNZihCC5BKwmiFdamPVvUkm/xceZwZ1JRTbA0dlRn/g6s81oVQxxYmg6yR/uow
 eX2SDlMwz5u2bDwFhEWFJlhzqTDfAK7c0CpCsUz58qtbX/exHHflmqVLFUxGLtwK6UmX
 701WHdKsG5+f5o9/RU07CiAolx/W39PgpdPoOfG4WbelnlOwe9DyioY3z+gI3Yo9ZqUi
 VJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wIIT6/ePIyMUBZgvwPlMAbfK34sVLGh7GgquvsLE084=;
 b=rOMUmtRJFIbjaNrM9dWAfYAmHXLea0VeVnvJtYSeduzSaHGmj3/NHbmyCSiBNqHLr5
 li2CSjQNG3Iim3uc+4jRZM6yGACDrj9SOjkZNEW6clmhzt+bSn+LHUM/kPkPRQfounEI
 quvMg5E1sESnRR6t7c/SmL7x1+Tkk/mmapYwVq17FC5XG3PvrGLIvOhceQ4fNac0KC5Y
 C7mOxEIrmkj5DYw8+Z2ajbsfsu6h0h/vfR6W5eOahgfr8MqGJHdLRPnflvVIabAa53vK
 NMf4XnU6LB4NSj2vzyJGFlcv+875NuZkgXrQL80x9sDYq7D03OeMefYC4aX4nQuecPSr
 iBJA==
X-Gm-Message-State: AOAM533hnFdJHrjdIlUxj9q+Cjg+XPpJjcYip+A+gy37zJVclr6LykUQ
 wqTRomoFoRuBATQmD96yC9eH+X/vnPLxY+8+nYl5Eoiv+mg=
X-Google-Smtp-Source: ABdhPJxlARpq3W7ryl+eHHGyYfKPeP0uoWKZGjdn3QYa+VuCU6DhRnPI/OTqygHbwGKYA4ZRJK0EPjK6nt7LBA+wRas=
X-Received: by 2002:aca:bb45:: with SMTP id l66mr13523131oif.51.1637146383235; 
 Wed, 17 Nov 2021 02:53:03 -0800 (PST)
MIME-Version: 1.0
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Wed, 17 Nov 2021 18:52:52 +0800
Message-ID: <CAE+NS37eLbnTZtv5pO59XWrWVKEJEA+J8DE=H1NwZr+u71WwfQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
To: cy_huang <u0084500@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 wilma.wu@mediatek.com, benjamin.chao@mediatek.com, 
 ChiYuan Huang <cy_huang@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_025305_312802_CCD70115 
X-CRM114-Status: GOOD (  17.12  )
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

Y3lfaHVhbmcgPHUwMDg0NTAwQGdtYWlsLmNvbT4g5pa8IDIwMjHlubQxMeaciDE35pelIOmAseS4
iSDkuIvljYgzOjIy5a+r6YGT77yaCj4KPiBGcm9tOiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0By
aWNodGVrLmNvbT4KPgo+IFJlcGxhY2UgbW9vbmxpZ2h0IHdpdGggaW5kaWNhdG9yIGluIG10NjM2
MCBleGFtcGxlIHRvIHByZXZlbnQgdGhlIGJlbG93Cj4gYnVpbGQgZXJyb3I6Cj4KPiBFcnJvcjog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAuZXhhbXBs
ZS5kdHM6MTE0LjI0LTI1Cj4gc3ludGF4IGVycm9yCj4gRkFUQUwgRVJST1I6IFVuYWJsZSB0byBw
YXJzZSBpbnB1dCB0cmVlCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmxpYjozODU6
Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAuZXhh
bXBsZS5kdC55YW1sXQo+IEVycm9yIDEKPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvQ0FMX0pzcUpSTVZFMTYzTGFIVGJ0RkFSYzRmX3FnMzNiZlF4K3NEM3VrY2VfeFFGK2dB
QG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5n
QHJpY2h0ZWsuY29tPgo+IC0tLQo+IEhpLCBHZW5lOgo+Cj4gSSBzYXcgeW91IGhhdmUgcmVtb3Zl
ZCBMRURfRlVOQ1RJT05fTU9PTkxJR0hUIGluIHYxNC4KPiBCdXQgeW91IG1heSBmb3JnZXQgdG8g
cmVtb3ZlIGl0IGZyb20gdGhlIGJpbmRpbmcgZXhhbXBsZS4KPgo+IFBsZWFzZSBoZWxwIHRvIHJl
dmlldyB0aGlzIGNoYW5nZS4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1tdDYzNjAueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwKPiBpbmRleCAyMzUzMTU1
Li5iMmZlNmViIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbGVkcy9sZWRzLW10NjM2MC55YW1sCj4gQEAgLTEzMyw3ICsxMzMsNyBAQCBleGFt
cGxlczoKPiAgICAgICB9Owo+ICAgICAgIGxlZEAzIHsKPiAgICAgICAgIHJlZyA9IDwzPjsKPiAt
ICAgICAgIGZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX01PT05MSUdIVDsKPiArICAgICAgIGZ1bmN0
aW9uID0gTEVEX0ZVTkNUSU9OX0lORElDQVRPUjsKPiAgICAgICAgIGNvbG9yID0gPExFRF9DT0xP
Ul9JRF9XSElURT47Cj4gICAgICAgICBsZWQtbWF4LW1pY3JvYW1wID0gPDE1MDAwMD47Cj4gICAg
ICAgfTsKPiAtLQo+IDIuNy40Cj4KClJldmlld2VkLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkBy
aWNodGVrLmNvbT4KVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
