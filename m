Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504ABC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE532074D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btVVSS8A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/KRxrBX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE532074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8cq6kHFd/eQoG5IcGQSOOm9Rl6jG4i0zRCqfN8Dj8k=; b=btVVSS8ATsYwaE
	uEnU6rvKPukW0eVNumREmx77pL4Hu+Q1LiG2CkFDi2CZHNiP5v7/Lo0wZBT3W8I93nolRTnKYVPkE
	dWsEP2bYDIFi+3SQC3QqzvZnjNYZ3Yai0Z6a9wU8G9Kd/tx35FlepM8utOwZcA8Mo5kwvapE/g8GC
	/lV5AUQNU+S8owUbPt2C8Tk40z99Xxbe+AsYU8hVK0zxf1TBGd2yGuCN3gX8M28a3LzKKEpAmF+UI
	Q1yMNdZOY2KaMy9Exhez2yfg4z7GC3qHQPpEfWljWYB1dw3d/w6N0KHW95WQqWoitBg5W8MMr45r3
	Axa5iD5XHpygT0oyopXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkpfn-0005AB-AE; Mon, 15 Jun 2020 14:01:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkpfe-00052O-BR; Mon, 15 Jun 2020 14:01:07 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C7FA207FF;
 Mon, 15 Jun 2020 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592229665;
 bh=4ZrW2imLQHEXjli9BMhglqZFIS7OW1wia511Wm26A1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K/KRxrBXnu5c9C61GD1bP9YnkYAS8ruyvyXbp1IrTBwyjJw+wcLWprnxL6Pt+0wlm
 iClKngonSjFnN4GcpEb/ADtDlsiWUqvVUKQ8JDCe6hgbWqgJU1vZkvsgZoL6NfpZR3
 B5ltzhb/M60tsPAqEQpKTzCJp69GVQrDZHrDNus0=
Received: by mail-ed1-f42.google.com with SMTP id d15so11581285edm.10;
 Mon, 15 Jun 2020 07:01:05 -0700 (PDT)
X-Gm-Message-State: AOAM5312qyMRFdEdQb3rK78o7dhAxg9eNTg6qYklxgRD+kJUPpmZR/nn
 9duYWXwkO5SF3NOAZZD6n5koT+81/3Ty0vj2tw==
X-Google-Smtp-Source: ABdhPJzhTQFzeEH1zu8mZaCAKp7pknQNSxFhk52tv3DYlzeZp7BzgLrUFynXCoEueO+cSHinJ+GV8Pn0MiN3cVMAAd0=
X-Received: by 2002:a05:6402:1247:: with SMTP id
 l7mr22777542edw.61.1592229663698; 
 Mon, 15 Jun 2020 07:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200612124007.4990-1-bernard@vivo.com>
 <48891eaf60c5e0c449e573a906894db2c3a7b72c.camel@perches.com>
In-Reply-To: <48891eaf60c5e0c449e573a906894db2c3a7b72c.camel@perches.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 15 Jun 2020 22:00:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__sSV2f4MqSLJYvSW9TGV=bCKXz+zELYREaEOFVjA6XQQ@mail.gmail.com>
Message-ID: <CAAOTY__sSV2f4MqSLJYvSW9TGV=bCKXz+zELYREaEOFVjA6XQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: remove unnecessary conversion to bool
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_070106_412462_827EACB5 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4g5pa8IDIwMjDlubQ25pyIMTXml6Ug6YCx5LiA
IOS4iuWNiDQ6NDHlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMjAyMC0wNi0xMiBhdCAyMDo0MCArMDgw
MCwgQmVybmFyZCBaaGFvIHdyb3RlOgo+ID4gSW4gZnVuY3Rpb24gbXRrX2RzaV9jbGtfaHNfc3Rh
dGUsIHJlbW92ZSB1bm5lY2Vzc2FyeSBjb252ZXJzaW9uCj4gPiB0byBib29sIHJldHVybiwgdGhp
cyBjaGFuZ2UgaXMgdG8gbWFrZSB0aGUgY29kZSBhIGJpdCByZWFkYWJsZS4KPiBbXQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gW10KPiA+IEBAIC0zMTksNyArMzE5LDcgQEAgc3Rh
dGljIGJvb2wgbXRrX2RzaV9jbGtfaHNfc3RhdGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiA+ICAg
ICAgIHUzMiB0bXBfcmVnMTsKPiA+Cj4gPiAgICAgICB0bXBfcmVnMSA9IHJlYWRsKGRzaS0+cmVn
cyArIERTSV9QSFlfTENDT04pOwo+ID4gLSAgICAgcmV0dXJuICgodG1wX3JlZzEgJiBMQ19IU19U
WF9FTikgPT0gMSkgPyB0cnVlIDogZmFsc2U7Cj4gPiArICAgICByZXR1cm4gKCh0bXBfcmVnMSAm
IExDX0hTX1RYX0VOKSA9PSAxKTsKPgo+IEdpdmVuOgo+Cj4gZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYzojZGVmaW5lIExDX0hTX1RYX0VOICAgICAgICAgICAgICAgICAgQklUKDAp
Cj4KPiBUaGlzIGlzIGxpa2VseSBjbGVhcmVyIGFzCj4KPiAgICAgICAgIHJldHVybiB0bXBfcmVn
MSAmIExDX0hTX1RYX0VOOwo+Cj4gb3IgZXZlbgo+Cj4gc3RhdGljIGJvb2wgbXRrX2RzaV9jbGtf
aHNfc3RhdGUoc3RydWN0IG10a19kc2kgKmRzaSkKPiB7Cj4gICAgICAgICByZXR1cm4gcmVhZGwo
ZHNpLT5yZWdzICsgRFNJX1BIWV9MQ0NPTikgJiBMQ19IU19UWF9FTjsKPiB9CgpJIGxpa2UgdGhl
IHNlY29uZCBvbmUuCgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
