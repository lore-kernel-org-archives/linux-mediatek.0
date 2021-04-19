Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2558BC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:13:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D1561007
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D1561007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kglM77CcmbIsgYDFrEdrIRw5JKdoNYHjleXH2Va9530=; b=cpNoG/xZPYCRrXO81MOFZtK6C
	a1mOBP0kImIF/VsA3ZggQ6zBPeCYEbiPQpSrHfjqVAvb30KnAloiZlE32QpqC3s4NRLXh4FDEt4nV
	RUNsMy90qAlwNk/dPZFcb4CQjukI/I2m7YxLLjwsrIcSoDFC8ZKmCN4LxUNZtCpwf6dqE2ee2NNY2
	D11VZHvhYs4tOBQNOBWlgCNo8njJu4QYry3epb82ohDKyDo8CyJOT90Ycm3kP+A41IPeBtPte7xs1
	ILiIS812Z7+NSnFa0IHBYBbF1giugWbRsZI78QG/2GduqoIXw6nqG1z1+Gj9XSZ2ricTos5n43ktG
	3Dem5QkIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVZw-00AAHZ-Mx; Mon, 19 Apr 2021 15:12:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVZk-00AAGP-JR; Mon, 19 Apr 2021 15:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=enuxCBzOZSQQTThLvTHnDCBlihynTSHnXViR8rDBbQQ=; b=BMsOegdePebbuADoA7t7jdrhva
 pnHwJ4vNWa+1GK3gaRLm6CClDMHv2CXFenCRadWVMeLIh7W/lcgtCFd+bZNT8gmR9cNXyrzaTLBeJ
 ANCO50zAeg6loMcGyo/sA77XwPZqLyiJYJeYx30wb4879CdxK0+/ykWUYCvEZC6/dIxYvYMktOVo7
 XXPYq91/A92RSjuerzz4XzcTAxughNPdqK1dXPfE/jXpkGXR2yuqCYBOIvxAlqPrAcrMu0N1GknQi
 Pft4z38tZOThuDGVlSHMQmCzIl9HzQtXjG+sKrJAqNN59fyuNIqwWwLam1KW0DpmNozmKHnBxJ9UX
 QikCs9cA==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVZe-00BTfN-QF; Mon, 19 Apr 2021 15:12:35 +0000
Received: by mail-io1-xd2a.google.com with SMTP id s16so29944235iog.9;
 Mon, 19 Apr 2021 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=enuxCBzOZSQQTThLvTHnDCBlihynTSHnXViR8rDBbQQ=;
 b=Jg7U7ipVmPDaLTK17RAAkpjGW0FoPQs+7OlUy+j89+geITJnhZvHkWherjiRVDAt5T
 sjBI57LusNfXqTaaIuYrZKirU6Ij+Wy0aha0OiMDG10sogLWOsr70QsFrlY59DZEfZ2o
 E6dUvyk4OOjNVdz37XumfoopH3wnI8kASbul2Q60t52qwVgxrBHH3ZkV9snAjkuNiIBF
 0DElQfdZ78U8e0KH0jlkROoZl6fPARkFGtb1rIP8h+HLLLh5Tg9VfrR4si6xZfekwEFA
 2uaQrXmS7S9mocFWnmuTvPrqKQqKlcgBSIwBopBWFscgX0+GsDxpEhr5kP7A4rjQs2bp
 gX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=enuxCBzOZSQQTThLvTHnDCBlihynTSHnXViR8rDBbQQ=;
 b=TYS/ymg5Ci1xBjVpGEFjy0p/ICl7HGBMZ2/Wx3NWZYIfWzMHislDtZ7HOT6UEI1ema
 HIieKb1vL1e/xuDTKhQwYkZ8ypnOByOjIv+7RTJDZMAVbUkLD/ubr9phc3s+MjS1YM5R
 Fb31C/EqYXpR+T6lJvqzePxmuu5lYekSW/WPQ1ctfsAGjvW62ifjxPyRnJ4PIyAnPmQL
 F6PastY475jxLt5nDvP8IMWwMKm9+bEvQm6koGU1kR2ia5lCaepI3bkkbCx2UbH2Q5Bd
 hntnaqKRzzOvoiAobYEd9qJwQYjuB4vuWbLla+8YeuHAgkAiCoa/8BXxRo6A31AUH2bl
 3MrQ==
X-Gm-Message-State: AOAM533963n+7lqg1zvggEGFhIVXPmsDbljgOmdU/Zn1/e37Dr71509e
 +KTUGpK/n2fJleNln4eVkqeJjuH8HwD/KRA0Hvs=
X-Google-Smtp-Source: ABdhPJxoUl6YJfpW7AMeJwEOa5A6FXIH6OX8VLWw+H7/eB475YO1aN9eBJmUgllZaJjRPtUS8JmaST9N86i7Ln04Gig=
X-Received: by 2002:a6b:b542:: with SMTP id e63mr11488250iof.144.1618845149416; 
 Mon, 19 Apr 2021 08:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
 <878s5e94hi.fsf@miraculix.mork.no>
In-Reply-To: <878s5e94hi.fsf@miraculix.mork.no>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Mon, 19 Apr 2021 08:12:18 -0700
Message-ID: <CALCv0x1Z2rXJtRTh9WQfPMBfVkfosg00kqEmo1uB6RJeNLptJw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210419_081230_889699_6D7CC443 
X-CRM114-Status: GOOD (  18.31  )
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
dDI4ODAtbmV0LnR4dApHb29kIHBvaW50LiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgZHJpdmVy
IGluLXRyZWUgZm9yIHRoYXQgYmluZGluZy4KSXQgbG9va3MgbGlrZSBjb21taXQgNjYzMTQ4ZTQ4
YTY2ICgiRG9jdW1lbnRhdGlvbjogRFQ6IG5ldDogYWRkIGRvY3MKZm9yIHJhbGluay9tZWRpYXRl
ayBTb0MgZXRoZXJuZXQgYmluZGluZyIpIHNob3VsZCBqdXN0IGJlIHJldmVydGVkIGFuZAp0aGUg
dGhyZWUgZG9jdW1lbnRzIChtZWRpYXRlayxtdDc2MjAtZ3N3LnR4dDsgcmFsaW5rLHJ0Mjg4MC1u
ZXQudHh0OwpyYWxpbmsscnQzMDUwLWVzdy50eHQpIHJlbW92ZWQuIEFueSBvYmplY3Rpb25zPwoK
SWx5YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
