Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CA0C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:45:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B3561360
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B3561360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N6lcDIZl+r+NnhMPZvB4D+ndgNbCjNQ2mx3YzJqei+4=; b=UUoGLwNqmMfiPgu6LI8n+ZVif
	Rzw4jOfPMvhJTR2tDnSE54BEHtPeJFC8TGvMSEQnE35I7bodtI9X06gtZtRWqttGq/dUmdl5zENXM
	O6FncwtRKqg42aV+QqDir1m7E4nbE1UKOtG2By7pfhjUGqbwdk919h2yCM5aRJvMGk5pOk06g/7Hx
	D6g7QoAyKvnN+tiYjABEVCTuF5vsBT5ra9FS5/6c/sohjQi+WXpv2vi7mXm8ZuEe1udTexw9X48yC
	SAjmrVOj4j2M10o8pAC6IxbQe+Pxu1Hx+cmvR7VOHcS3h3/9cdD61MZVPdTmO01+oPwoCXZpjrXFH
	wzTP35h/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYgOD-00B0ly-1s; Tue, 20 Apr 2021 02:45:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgNz-00B0kK-Ew; Tue, 20 Apr 2021 02:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=6Kc1WbDSgXVF94sOsNH1trNDlACUDpdbFDZEbig89pA=; b=0Nz3LOdEuCtbapUDd+rcE68eKI
 8IBNNfcVdRWmKUbCMXi1rEUrV/BuGJRvOX9pdAsW71NCfwIqTm0QXId7RgOYDFgowByVdUHP2naL6
 sS+2p3Os3wlCRpsyc4T4yU1B0phrUWiC2LyX4K32iATrW30sVsZkP6jzzO087wOvMMYhc/fN7d83Y
 nYj4DvD+43CeuWovHjkwFAKUQSEQEkYq+7LhgMKFIADyqhN1Z4srk42+94v4ClFaY58P9Wix8lH63
 ZkVa2dTlfOdnDbLCfk4OoKGfN0M13btHwxSPlvT5PR3y+Qj3ALz2UnUdzvJdCGCn9TJVWbs6cPwuI
 1uu4QXdQ==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgNv-00BmA9-O5; Tue, 20 Apr 2021 02:45:10 +0000
Received: by mail-io1-xd2a.google.com with SMTP id h141so28611411iof.2;
 Mon, 19 Apr 2021 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Kc1WbDSgXVF94sOsNH1trNDlACUDpdbFDZEbig89pA=;
 b=kNAT3YzgNvaNZB0qOxA6Rl2nnRij+0GxT5xm9OyKbkef8xLre1BqFzCJnN65aR1rtM
 56wdPz7FSRNTu39vBtx+s9TD7gtmKAGkai5F4plMFXk+sdLz+nNW851qYZ/F3etBPk1U
 fXZ3lc1AatbD9+Aht2Pel0l+6tt5nWUFqxhGvaY8wErivLRkTWnzhrtxwi7ap+7/Vz46
 FSszDXHBqRhJ1PaIcs1x2OampQE65supyYZuVR659CqQpqrB5syZD7B3lgEpnKsyrDRb
 ifu03BHhiy54xNMvgGZ2B5OewxA6OIsNXt8l+BfLTzERvN82KqbvVKzw7K6I6paAiTLs
 V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Kc1WbDSgXVF94sOsNH1trNDlACUDpdbFDZEbig89pA=;
 b=eoi9AmnTkF+JnYbjCMOz/Obsab0DkMQU5FLNMyqyZTSZOd9of3xSHLO7ejCVvZAfJ2
 dcSljZi81gk+AuamDOwpk4ZbPeA8XLcdBbBvhq2MFwCMPX4wsqWlTQ3KL5FVNGXib1V9
 tI+TJvTiBUBecFEFwHJGZjT1eOV7w7G5XrJzeUg5trsuGrtA58AgRxtSofC9UhEA3IiQ
 Bx4ooKDRkBEoLWji3DqCZ+AGH8+5Y6E4AP15cmIQHCIVHrbT3vXtc95eL23WzAmHuFux
 x6yQHDpvN+E7aQKYaVulct4iE3zCfsQQ6i7bvQZNpGC5tBp7SoVg1glfcKMRcMzxv3Ow
 yMkA==
X-Gm-Message-State: AOAM530y2qF3UozOGZib30EuPMh96bUHOJ1HT72gw/KimrwvAhCSPpaY
 mVN9pYmPaImbBeiFEWGKSpnXMCfVNgNHLD9A3jU=
X-Google-Smtp-Source: ABdhPJyu3r8FHInxVHB6FMEsM++ZSS/SzxyQ0Ov3kKdZPFntmoTWDCdi5kG/Pu7kLZ/UX5r2ZH7m5Nb4ZfBgNrrPuaQ=
X-Received: by 2002:a02:a302:: with SMTP id q2mr11251853jai.104.1618886706664; 
 Mon, 19 Apr 2021 19:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
 <878s5e94hi.fsf@miraculix.mork.no>
In-Reply-To: <878s5e94hi.fsf@miraculix.mork.no>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Mon, 19 Apr 2021 19:44:55 -0700
Message-ID: <CALCv0x2CzL3PLw+r2f5rU_Uu04wn3kR3R-fn=kAfmksuAsjwLw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: mediatek: support MT7621 SoC
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Ungerer <gerg@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, netdev@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_194507_807349_C5FC9C16 
X-CRM114-Status: GOOD (  18.33  )
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

T24gU3VuLCBBcHIgMTgsIDIwMjEgYXQgMTE6MjQgUE0gQmrDuHJuIE1vcmsgPGJqb3JuQG1vcmsu
bm8+IHdyb3RlOgo+Cj4gSWx5YSBMaXBuaXRza2l5IDxpbHlhLmxpcG5pdHNraXlAZ21haWwuY29t
PiB3cml0ZXM6Cj4KPiA+IEFkZCBtaXNzaW5nIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgU29D
IHN1cHBvcnQgdGhhdCBoYXMgYmVlbiBpbiBwbGFjZQo+ID4gc2luY2UgdjUuMQo+ID4KPiA+IEZp
eGVzOiA4ODliY2JkZWVlNTcgKCJuZXQ6IGV0aGVybmV0OiBtZWRpYXRlazogc3VwcG9ydCBNVDc2
MjEgU29DIGV0aGVybmV0IGhhcmR3YXJlIikKPiA+IENjOiBCasO4cm4gTW9yayA8Ympvcm5AbW9y
ay5ubz4KPiA+IFNpZ25lZC1vZmYtYnk6IElseWEgTGlwbml0c2tpeSA8aWx5YS5saXBuaXRza2l5
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvbWVkaWF0ZWstbmV0LnR4dCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQKPiA+IGluZGV4IDcyZDAzZTA3Y2Y3Yy4uOTUwZWY2
YWYyMGIxIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9tZWRpYXRlay1uZXQudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQKPiA+IEBAIC0xMCw2ICsxMCw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6Cj4gPiAgLSBjb21wYXRpYmxlOiBTaG91bGQgYmUKPiA+ICAgICAgICAg
ICAgICAgIm1lZGlhdGVrLG10MjcwMS1ldGgiOiBmb3IgTVQyNzAxIFNvQwo+ID4gICAgICAgICAg
ICAgICAibWVkaWF0ZWssbXQ3NjIzLWV0aCIsICJtZWRpYXRlayxtdDI3MDEtZXRoIjogZm9yIE1U
NzYyMyBTb0MKPiA+ICsgICAgICAgICAgICAgIm1lZGlhdGVrLG10NzYyMS1ldGgiOiBmb3IgTVQ3
NjIxIFNvQwo+ID4gICAgICAgICAgICAgICAibWVkaWF0ZWssbXQ3NjIyLWV0aCI6IGZvciBNVDc2
MjIgU29DCj4gPiAgICAgICAgICAgICAgICJtZWRpYXRlayxtdDc2MjktZXRoIjogZm9yIE1UNzYy
OSBTb0MKPiA+ICAgICAgICAgICAgICAgInJhbGluayxydDUzNTAtZXRoIjogZm9yIFJhbGluayBS
dDUzNTBGIGFuZCBNVDc2MjgvODggU29DCj4KPgo+IFRoYW5rcyBmb3IgdGFraW5nIGNhcmUgb2Yg
dGhpcyEKPgo+IE5vdGUsIGhvd2V2ZXIsIHRoYXQgdGhpcyBjb21wYXRpYmxlIHZhbHVlIGlzIGRl
ZmluZWQgaW4KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JhbGluayxy
dDI4ODAtbmV0LnR4dAo+Cj4gSSBiZWxpZXZlIHRoYXQgZmlsZSBzaG91bGQgZ28gYXdheS4gVGhl
c2UgdHdvIGZpbGVzIGFyZSBib3RoIGRvY3VtZW50aW5nCj4gdGhlIHNhbWUgY29tcGF0aWJsZSBw
cm9wZXJ0eSBBRkFJQ1MuClJlbW92ZWQgYWxvbmcgd2l0aCB0d28gb3RoZXJzIGluCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA0MjAwMjQyMjIuMTAxNjE1LTEtaWx5YS5saXBuaXRz
a2l5QGdtYWlsLmNvbS9ULyN1CgpJbHlhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
