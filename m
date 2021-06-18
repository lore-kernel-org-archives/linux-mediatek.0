Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9670C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 03:29:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A848A60C3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 03:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A848A60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQBo6UrpK+ikm/yiXbXT68anCjSTuxozczswULZQEXE=; b=ACibAIKZgx6Zkk
	RW9Bu3WqkXBYjXUTRMhnUG8Y2z9SfAWGQzswkrzVhbJrbLLwzj9y8HniwayAtEyV+tGc2FitUXo60
	yFQ2CM2nZeSpct36aCWmrp509gWGuWyE4zNvB9SQi9jn1t/LP2HnGbv4wF951cuKAuSoO6eNyTbq2
	RfMkoqFkbcvYMMPGWqCkaJqlab+TMDcx1HON3rLmVncvg+kTJmFNfVj8ZAeAtFjqDK+vZDnX+WhJB
	RzYRDx/XM3PceNVCvX9xyE2c8Obwp0Sbd96FMgvreKSKSDlThpP5zTJJ5AzQzxnK+uaMLpeTYQQV6
	DNxIdCkyOiNd9yqHmmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu5Br-00CSjg-Px; Fri, 18 Jun 2021 03:29:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu5Bf-00CSiY-LU; Fri, 18 Jun 2021 03:28:56 +0000
Received: by mail-lj1-x22a.google.com with SMTP id k8so11930807lja.4;
 Thu, 17 Jun 2021 20:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KU0XIwJ0XXrc92jT9YLWiEwSpSoGcMOVK76Rj0AjqYE=;
 b=p50ZkJy8Px6CQI47WEA9P7w5S12ZlUR4qZMAJ1jBHmahMP0ijF98QnO18pKdc/w/3Y
 9A+gh/mOFAG0E1z0oq/zuCPwDZwpjjjBknFg4qWs0b6rXGDpj99bnPIrxTs/gBANuxoT
 DsiC7qpOOqZbESsfjuIuCeWRWOb4Wt50ODKbJHQzmoMHbHF1qdzLsiN73zRHh0vpTh0S
 qklC/oQbKwBfuV4VobOIB4PanGDU4dh1tG/sMo+jQpKaaQwjCXTGGSqNl8fqSEGDeICa
 KqJn2Xz2P3wmkcOwlUSkwXVzJZ/0Xnjz4TNXM4V+heS+gvT6nzJcZCo1v3MQ+GWhj13F
 pp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KU0XIwJ0XXrc92jT9YLWiEwSpSoGcMOVK76Rj0AjqYE=;
 b=e6PZcTHnZs7Otdy+RfLF3qG0wv6bCHc/o7OOgdEC834CD6+nVSYYktPw+HTC8Gg53Q
 p7qkjLaygWluvl8WTf6BLlqDE0bUh82ORZc3WMQrfr5FlwEZYBqsXZ6NkaKXbyQ4EQv9
 BZ7d6+pp4yPztwsayIM1XZrKUyzrhczzmUIRpmLG+bMJrBVyAtXJdyAbjsN+/WxiDMTG
 BSAeSOBFgZqESwPTd5lIdCJecRRfxnEn9n+3Coe9Tv7U/eh/O8Z2xwqIw3AjQrfTODGq
 HwE4BooDKx+tQRdouuRbmVJ1iGt36ejqs2GOfhQ+GDrr7KPWK+BUr6PMISycCu5XvnF9
 bCxQ==
X-Gm-Message-State: AOAM532qdov00Z8mpMoN53mO6E9G8ojOKGAvxOfrNFeDVsNhU+/BGpfw
 WtoQckoU2kKfaFDLQeL+uiNmoza1a1nMPYFvjEw=
X-Google-Smtp-Source: ABdhPJw9OuwMCESWUrDgrF6XLH+4Rsb+54yvZX5ftkDs5+pzB/f5YhbOu4aeL+7uEtI5hxmTOeAQPVQBsov8IFIUCCc=
X-Received: by 2002:a2e:8542:: with SMTP id u2mr7580839ljj.141.1623986932876; 
 Thu, 17 Jun 2021 20:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
 <20210611201643.GA1583875@robh.at.kernel.org>
 <CADiBU39Prz99ZLtkYdcM9XDQsd0nKKeiEGjW3wq=u75JGjwX=g@mail.gmail.com>
 <20210617162919.GH5067@sirena.org.uk>
In-Reply-To: <20210617162919.GH5067@sirena.org.uk>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 18 Jun 2021 11:28:41 +0800
Message-ID: <CADiBU39-HA518TP=7_i8bYQWfhAUK_pj+Gn0O6rTKEZxq6GR1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, lgirdwood@gmail.com, matthias.bgg@gmail.com,
 gene_chen@richtek.com, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, cy_huang <cy_huang@richtek.com>, 
 gene.chen.richtek@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_202855_748692_B8A09D6A 
X-CRM114-Status: GOOD (  15.58  )
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

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDbmnIgxOOaXpSDpgLHk
upQg5LiK5Y2IMTI6Mjnlr6vpgZPvvJoKPgo+IE9uIE1vbiwgSnVuIDE0LCAyMDIxIGF0IDExOjA0
OjAxUE0gKzA4MDAsIENoaVl1YW4gSHVhbmcgd3JvdGU6Cj4gPiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiDmlrwgMjAyMeW5tDbmnIgxMuaXpSDpgLHlha0g5LiK5Y2INDoxNuWvq+mBk++8
mgo+Cj4gPiA+ID4gT3JpZ2luYWxseSwgd2UgdGhpbmsgaXQgbXVzdCB3cml0ZSBpbiBwbGF0Zm9y
bSBkZXBlbmRlbnQgY29kZSBsaWtlIGFzIGJvb3Rsb2FkZXIuCj4gPiA+ID4gQnV0IGFmdGVyIHRo
ZSBldmFsdWF0aW9uLCBpdCBtdXN0IHdyaXRlIG9ubHkgd2hlbiBzeXN0ZW0gbm9ybWFsIEhBTFQg
b3IgUE9XRVJfT0ZGLgo+ID4gPiA+IEZvciB0aGUgb3RoZXIgY2FzZXMsIGp1c3QgZm9sbG93IEhX
IGltbWVkaWF0ZSBvZmYgYnkgZGVmYXVsdC4KPgo+ID4gPiBXb3VsZG4ndCB0aGlzIGJlIGhhbmRs
ZWQgYnkgUFNDSSBpbXBsZW1lbnRhdGlvbj8KPgo+ID4gTm8sIHRoZSBjdXJyZW50IGFwcGxpY2F0
aW9uIGRlZmF1bHQgb24gcG93ZXJzIGJ1Y2sxL2J1Y2syL2xkbzcvbGRvNgo+ID4gYXJlIGZvciBE
cmFtIHBvd2VyLgo+ID4gSXQncyBub3QgdGhlIHNvYyBjb3JlIHBvd2VyLiBJdCBzZWVtcyBub3Qg
YXBwcm9wcmlhdGUgIHRvIGltcGxlbWVudAo+ID4gbGlrZSBhcyBQU0NJLgo+ID4gTVQ2MzYwIHBs
YXkgdGhlIHJvbGUgZm9yIHRoZSBzdWJwbWljIGluIHRoZSBTT0MgYXBwbGljYXRpb24gcmVmZXJl
bmNlIGRlc2lnbi4KPgo+IElmIHRoaXMgaXMgcGFydCBvZiB0aGUgb3ZlcmFsbCBzeXN0ZW0gcG93
ZXIgb2ZmIHRoYXQgc2VlbXMgbGlrZSBpdCBmaXRzCj4gd2VsbCBlbm91Z2ggaW50byB3aGF0IFBT
Q0kgaXMgZG9pbmcgLSBpdCdzIGdvdCBvcGVyYXRpb25zIGxpa2UKPiBTWVNURU1fT0ZGIHdoaWNo
IHRhbGsgYWJvdXQgdGhlIHN5c3RlbSBhcyBhIHdob2xlLgoKVGhhbmtzLCBJJ2xsIGNoZWNrIGFu
ZCBzdXJ2ZXkgdGhlIFBTQ0kgYWJvdXQgdGhlIFNZU1RFTV9PRkYuCkkgdGhpbmsgaXQgbWF5IHdv
cmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
