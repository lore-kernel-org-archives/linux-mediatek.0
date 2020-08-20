Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165F7C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:46:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B37207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obwMkwDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZZdzKzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B37207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XvzlbgTmeFYyT6/6UJ3ZkCSwRaB/8xyCtv+krWT86yY=; b=obwMkwDU9vL9eQwEa9UEPvGN1
	vmY1WgDQR1Krj37lIFNgtDzvgwtPV2QZzBidIsRX9gRmjLLoLfn2/NHPGFWoIoVOhRQX3uy/i07yB
	MtVy41lQSVgwxJVDrszxmAwBQlCwOPJJmLEfVb5hWb3IibSd/0bO7GFkXomvxIzhXmi3g2cKGix3z
	6gH9JUVGLlXNZzjg0C9AuWdhooeTvfF5xTMjaBfWDuAbbcD+IUQq4haQfRIhONVahvEDkkTA3FhYx
	kKUzeqsqC+EAdOTa70DUBh+KPhdeeSCzM3cTRU/gquaLOUQTwfqSwfTENtwrg4FfWiKTPbvKgwDUh
	9T8WPPLGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8uGC-00058e-Sh; Thu, 20 Aug 2020 23:46:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8uG8-00056X-7G; Thu, 20 Aug 2020 23:46:17 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4973F20FC3;
 Thu, 20 Aug 2020 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967175;
 bh=Lgp8hsNdzOTq4kLm5ig7EfIsrARcaqyBrt2jpFkQe6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OZZdzKzBD51K1BPGM0EaH36CMBKdv2QMN7b+GZuFw580TLsXutGo3pLBWhEXxDJjb
 yyKWfMFiN5pyb8aRWbVR6bWiB3b6XemNhW8ka0ApBKAQewZpX+xuTYvG603BrQW6fU
 cJrqycD8Iahf+l7FUboEoQsu0APFA7Lj3l5W3YdY=
Received: by mail-ej1-f46.google.com with SMTP id kq25so257590ejb.3;
 Thu, 20 Aug 2020 16:46:15 -0700 (PDT)
X-Gm-Message-State: AOAM533M+3CwuQBZxhxd91O0PDtmSQAmkc/5WWgkETS/UpO84eqgCeox
 aAnQZnELl2aA22DGxvL016unSLdzPPh5mWp65w==
X-Google-Smtp-Source: ABdhPJwImiPZfml816TKJ8tULu0ObTfnI7+zw4vuK73Jk4H3K6TAuI9PR6yWIJfRJ60uRj1hxTknbdc2N7ifSaHVAU8=
X-Received: by 2002:a17:906:2356:: with SMTP id
 m22mr350366eja.124.1597967173923; 
 Thu, 20 Aug 2020 16:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-10-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-10-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:46:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8rWUdGgNQfvdZh0gCim8uQ=mJ7Pm=WRgCN_z+Dfb_bEQ@mail.gmail.com>
Message-ID: <CAAOTY_8rWUdGgNQfvdZh0gCim8uQ=mJ7Pm=WRgCN_z+Dfb_bEQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/21] drm/mediatek: fix aal size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_194616_402940_B769CA4C 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxOOWvq+mBk++8mgo+Cj4gZml4
IGFhbCBzaXplIGNvbmZpZwo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMgfCAxMSArKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggYzkwZDJlZS4uZmU3NjM4NyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0zMSw4ICsz
MSwxMyBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX1VGT19TVEFSVCAgICAgICAgICAgICAgICAgICAg
IDB4MDAwMAo+Cj4gICNkZWZpbmUgRElTUF9BQUxfRU4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwMDAwCj4gKyNkZWZpbmUgRElTUF9BQUxfQ0ZHICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwMDIwCj4gKyNkZWZpbmUgQUFMX1JFTEFZX01PREUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMCkKPiArI2RlZmluZSBBQUxfRU5HSU5FX0VOICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+ICAjZGVmaW5lIERJU1BfQUFMX1NJWkUgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+Cj4gKyNkZWZpbmUgRElTUF9BQUxfT1VUUFVUX1NJ
WkUgICAgICAgICAgICAgICAgICAgMHgwNGQ4Cj4gKwo+ICAjZGVmaW5lIERJU1BfQ0NPUlJfRU4g
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwMAo+ICAjZGVmaW5lIENDT1JSX0VOICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIERJU1BfQ0NPUlJfQ0ZH
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+IEBAIC0xODIsNyArMTg3LDExIEBAIHN0
YXRpYyB2b2lkIG10a19hYWxfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2ln
bmVkIGludCB3LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoLCB1
bnNpZ25lZCBpbnQgdnJlZnJlc2gsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGJwYywgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiAgewo+IC0gICAgICAgbXRr
X2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfQUFMX1NJWkUpOwo+
ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgsIGNvbXAsIERJU1Bf
QUFMX1NJWkUpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgs
IGNvbXAsIERJU1BfQUFMX09VVFBVVF9TSVpFKTsKPiArCj4gKyAgICAgICBtdGtfZGRwX3dyaXRl
X21hc2soTlVMTCwgQUFMX1JFTEFZX01PREUsIGNvbXAsIERJU1BfQUFMX0NGRywKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBBQUxfUkVMQVlfTU9ERSB8IEFBTF9FTkdJTkVfRU4pOwoKSWYg
dGhpcyBvbmx5IHNob3VsZCBzZXQgaW4gbXQ4MTkyLCBhZGQgYSBwcml2YXRlIGRhdGEgdG8gZGlz
dGluZ3Vpc2ggdGhpcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICB9Cj4KPiAgc3RhdGljIHZv
aWQgbXRrX2FhbF9zdGFydChzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+IC0tCj4gMS44LjEu
MS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
