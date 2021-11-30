Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g97kcC6HyJ/pjnmS046VsMUoyCDHFJVXUd34Bt8EkUc=; b=mL0f/6vccC/f/d
	iwv2l4gNfpiF/nQz/oSuwzYONV4szXAVN4mc2/ft+w9FVcSLOYGD9XUfdp4rzNd5UTY0ibNM40833
	ppxdS8xJdeBtaNhVIAe3/Vbj9YKVn+AWj/Z4RcZnOCrMEWDLLqXjOKeSn6mj1yoGIiRbgMePwkfxC
	omYNRmsE9uyZbhp7x9rORkzUVLMrqT+iepkrbvSzrxqzBw67L5KeO3FMXZc6pR2H4SSKLB2EesbRM
	79C/cKZx1KdaZFDG5LZDF9yZdRBDl68Nk1vf2D2CALQ4EQT/GkZ6SazYYIJhJS2bG9zJzCiD0t57w
	B67//ujVIc/Vii/lI6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms2qO-005Fhg-Ki; Tue, 30 Nov 2021 13:06:48 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms2lW-005DN6-HG
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 13:01:47 +0000
Received: by mail-il1-x131.google.com with SMTP id i9so21113992ilu.1
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q0ARfKBEOm7i21XmqAN04osRqCtWpdUCjMKp9eeDZEg=;
 b=A1CdzlYna8Dhhi0GZjKOwM6MA4c4kMlHtkJ5lXaGgXvMMVz8p1vS/x1EB79jFrZ9Zp
 WBjAy0EAyVF4+y9x9Mvsl/kBxY+gRGDRiKXMXjNvjXWm0D565VCyvqLjz7tg7CfidnTu
 YISGuxVwHfPus7qIY89HfPC48bKyIYz72Ss3EEsjRFwimwOaJQsglVT9ByXDppi8wRbb
 SKwXiMc5EHeygp3H/6Dktl3Jlbtlcf60AIz1qc2ufcMslZpudolNunwKeKIFzKjqF5nI
 rjWs+0wyuoa4yvfONtY+BmTdyjKv8wOuR1FsCFbIK34JoJ7G0Vf7AJs2GtvicqneyhNC
 S0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q0ARfKBEOm7i21XmqAN04osRqCtWpdUCjMKp9eeDZEg=;
 b=v3QcOplLyPMrw+x6CVlMNnvHd3NGcLejyY4YM+S5EChClQj0ABqYr9MrVXAdnqsJk1
 P1nEzIHzGHvumyai76wSEtC+3zHPpJvF33G4vWnjss57nDSgRbh+iow9BF6f/9yDhdKk
 IugPFa/1kj21RFb6X1Y5C8RhZI80sAjRYUqBfjVWRKHobbKNvVKDR2L6vQNDpSAyWdIk
 xJX2tfrQWZqSNjXrhEm4rqGqIK4bUeud3nhbr48hmwP5925vKfQiZcUJQagrNBMJ0Nw2
 802bvBuUHjSzK597FCtLnnDdIIThvXiS6uj23+atEQ+auKAEdii2VGb4tI5SuvOdB7DW
 Qvmw==
X-Gm-Message-State: AOAM533tzvIH8NhznYEd42wkrA/kNU5NEyWC2ddhE+o2IDzVx8i3miub
 vwHhCNwfz5VZ0bZl1XITEvwM9jSMNaOCvn9n/nYg
X-Google-Smtp-Source: ABdhPJw8hYnMtsqCa9EaLjA9wF43p8CVx3ugxwK5rG1qSEyk6jZivUcI3Q9vCPA65eEYOjeMaZ6VW7YNkNSEGrft9f4=
X-Received: by 2002:a92:caca:: with SMTP id m10mr49909658ilq.115.1638277304175; 
 Tue, 30 Nov 2021 05:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20211126221034.21331-1-lukasz.bartosik@semihalf.com--annotate>
 <1638223308-32622-1-git-send-email-sean.wang@mediatek.com>
In-Reply-To: <1638223308-32622-1-git-send-email-sean.wang@mediatek.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date: Tue, 30 Nov 2021 13:01:32 +0000
Message-ID: <CAK8ByeKQeresPwe1_1-g249BADcR3z8m7ZYO9OFmT_QSvkpu-w@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btmtksdio: enable msft opcode
To: Sean Wang <sean.wang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, upstream@semihalf.com, 
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_050146_606087_3A44ECFC 
X-CRM114-Status: GOOD (  11.72  )
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

cG9uLiwgMjkgbGlzIDIwMjEgbyAyMjowMSA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4gbmFwaXNh
xYIoYSk6Cj4KPiBGcm9tOiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4KPiA+
RW5hYmxlIG1zZnQgb3Bjb2RlIGZvciBidG10a3NkaW8gZHJpdmVyLgo+ID4KPiA+U2lnbmVkLW9m
Zi1ieTogxYF1a2FzeiBCYXJ0b3NpayA8bGJAc2VtaWhhbGYuY29tPgo+ID4tLS0KPiA+IGRyaXZl
cnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jIHwgMSArCj4gPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Cj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8u
YyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jIGluZGV4IGQ5Y2YwYzQ5MmUyOS4uMmE3
YTYxNTY2M2I5IDEwMDY0NAo+ID4tLS0gYS9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+
ID4rKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+ID5AQCAtODg3LDYgKzg4Nyw3
IEBAIHN0YXRpYyBpbnQgYnRtdGtzZGlvX3NldHVwKHN0cnVjdCBoY2lfZGV2ICpoZGV2KQo+ID4g
ICAgICAgaWYgKGVuYWJsZV9hdXRvc3VzcGVuZCkKPiA+ICAgICAgICAgICAgICAgcG1fcnVudGlt
ZV9hbGxvdyhiZGV2LT5kZXYpOwo+ID4KPiA+KyAgICAgIGhjaV9zZXRfbXNmdF9vcGNvZGUoaGRl
diwgMHhGRDMwKTsKPgo+IEhpIMWBdWthc3osCj4KPiBtc2Z0IGZlYXR1cmUgaXMgc3VwcG9zZWQg
b25seSBzdXBwb3J0ZWQgb24gbXQ3OTIxLiBDb3VsZCB5b3UgaGVscCByZXdvcmsgdGhlIHBhdGNo
IHRvIGVuYWxiZSBtc2Z0IG9wb2NkZSBvbmx5IGZvciBtdDc5MjE/Cj4KPiAgICAgICAgIFNlYW4K
PgoKSGkgU2VhbiwKClRoYW5rcyBmb3IgdGhlIGlucHV0LiBJIHdpbGwgdXBkYXRlIHRoZSBwYXRj
aCBzbyB0aGF0IG1zZnQgb3Bjb2RlIGlzCmVuYWJsZWQgb25seSBmb3IgbXQ3OTIxLgoKUmVnYXJk
cywKTHVrYXN6Cgo+ID4gICAgICAgYnRfZGV2X2luZm8oaGRldiwgIkRldmljZSBzZXR1cCBpbiAl
bGx1IHVzZWNzIiwgZHVyYXRpb24pOwo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
