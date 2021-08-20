Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD06C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 23:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547D761186
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 23:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 547D761186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kl38KWt88y90rrhb8iZOmTmASPuPaWxJ0pgdsi9/xzI=; b=LONgbd7bOD09tl
	wsYnCG4EbDNxl4Qw23GEbb8hzdbWxVBqOAusIf96BTJjvHPcUVLNbhcC0GJDa08tcxDPDbzsJRer/
	81fpcvaiAt0wqNLGrDXmIp4UWVDTXNnmpzJmB+QzAvg1i+mycXF6H/fbYQEF8RnZ9agTGXbMQ0ODz
	ZCBC64/bJFej4IelQIDWCrJOiVOz+BhrU8oZIViQhYxnRPaUGRi5SkZVNwls8BXzt2v8aUBKPwDB0
	d2+921tL88ZxtgdO2Y4LhpnQ7UmM7OSBkHugIDUTrqUOeayKW2k8NANR5sBWbCwm5gm0cN7h8MFEr
	uFxvmoQPXSfL8h+Vypbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHE5K-00CI78-35; Fri, 20 Aug 2021 23:38:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHE57-00CI5F-Bw; Fri, 20 Aug 2021 23:37:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F381D611BD;
 Fri, 20 Aug 2021 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629502669;
 bh=OxoHRSxJUs/DBlJkRYNoMKiQU91unoLQ5Gw7U19zjro=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iutSkFHMi5IM7UGKgwlUCO6Rvp8RsehZouuXbR0LnvuWxu7EGGjB3JznVkOLUDnTI
 ZnzSp7r8BVQBIyFRiM6bqLknfCxlnlg9JBv5SRUK+E7Qet3AtFhdqZtFj45uF91VqZ
 0Snkc85VJijOSkdnI4tqD42gwqXoWHBRZ3uqp3K3ch9vJnmjCTRIxTpZv7nCAD2KKU
 reVkbWX7GIgfiZkRVQlmtqXQJqPc6xgOjVWPSCB9SdXWHMLG4FHUlJCv8swtDPhFz5
 lPvjgTnqa7fE8qZ7e/nGHrIhDOBELVocOCSth2LrmeK2et+5tLIzYDtyNE07lEnmDe
 2kQ2/mkDn6+0w==
Received: by mail-ej1-f46.google.com with SMTP id w5so23248555ejq.2;
 Fri, 20 Aug 2021 16:37:48 -0700 (PDT)
X-Gm-Message-State: AOAM5310tQVxixxtuoOv+DaH2ctbHZ1xwmrr+daFONP/A3LsSVSV3D10
 zS2rKlGj8r1O46tdPFzW0TlJh6iboThCnlP2Zw==
X-Google-Smtp-Source: ABdhPJyoX0rsifcLfFn0ncpSIxDlcJSTh5JTTO8orl9BlrUHsW13D079t4m+j2HQ+MYksTHDBQ3wtRBxiw+0NGaDS1Y=
X-Received: by 2002:a17:906:81cb:: with SMTP id
 e11mr1673753ejx.310.1629502667599; 
 Fri, 20 Aug 2021 16:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-16-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 21 Aug 2021 07:37:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
Message-ID: <CAAOTY_8UUyT1u1bNqK-rNjKaFUo5=MVVrfMF6CUXmcXDb-xV1w@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_163749_462839_ADB32780 
X-CRM114-Status: GOOD (  12.80  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDjmnIgxOOaXpSDpgLHkuIkg5LiL5Y2INToxOOWvq+mBk++8mgo+Cj4gQWRkIGRyaXZlciBkYXRh
IG9mIG10ODE5NSB2ZG9zeXMxIHRvIG1lZGlhdGVrLWRybSBhbmQgbW9kaWZ5IGRybSBmb3IKPiBt
dWx0aS1tbXN5cyBzdXBwb3J0LiBUaGUgdHdvIG1tc3lzICh2ZG9zeXMwIGFuZCB2ZG9zeXMxKSB3
aWxsIGJyaW5nCj4gdXAgdHdvIGRybSBkcml2ZXJzLCBvbmx5IG9uZSBkcm0gZHJpdmVyIHJlZ2lz
dGVyIGFzIHRoZSBkcm0gZGV2aWNlLgo+IEVhY2ggZHJtIGRyaXZlciBiaW5kcyBpdHMgb3duIGNv
bXBvbmVudC4gVGhlIGZpcnN0IGJpbmQgZHJtIGRyaXZlcgo+IHdpbGwgYWxsb2NhdGUgdGhlIGRy
bSBkZXZpY2UsIGFuZCB0aGUgbGFzdCBiaW5kIGRybSBkcml2ZXIgcmVnaXN0ZXJzCj4gdGhlIGRy
bSBkZXZpY2UgdG8gZHJtIGNvcmUuIEVhY2ggY3J0YyBwYXRoIGlzIGNyZWF0ZWQgd2l0aCB0aGUK
PiBjb3JyZXNwb25kaW5nIGRybSBkcml2ZXIgZGF0YS4KClNlcGFyYXRlIHRoaXMgcGF0Y2ggdG8g
dHdvIHBhdGNoLiBPbmUgaXMgc3VwcG9ydCB0d28gbW1zeXMsIGFuZAphbm90aGVyIG9uZSBpcyBz
dXBwb3J0IG10ODE5NSB2ZG9zeXMxLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQt
b2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jICAgfCAgIDQgKwo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgIDI1ICstCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuaCAgICAgfCAgIDMgKy0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8ICAxNSArCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwgMzcyICsrKysrKysrKysrKysrKystLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDggKy0K
PiAgNyBmaWxlcyBjaGFuZ2VkLCAzNTQgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
