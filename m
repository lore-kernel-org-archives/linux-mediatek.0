Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CEAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D248C20791
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0gtHGNW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iz1kpOyX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D248C20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZztRvyGsmh4JWv7zieeMQ0n91F9SVIbetm/d1KDPCxI=; b=B0gtHGNW2OBo0HS6rOuGIXiNQ
	qF7hA+1PuIQgKhD1PZ2fvw05D4tKB5QcUES+HBcLI8scLZZC/uwdziIfAACwAxz5GuRjumFMxwYag
	AISC2JEgaCGw7oPtzk92bTWpqzZ41acz2pnxhj5pM+mH3vl/pA2fZCuf62uTpNotlkpSfyQe1dbFL
	9pFe76o9ayqTDb1pIH8TkwrkFqWCF9LMQO4t8oy3IQSCNon3DbNZCrp36NRhREein00CjkYjj4opL
	a1o7f6Gmx2WIESOeAv06rQokv5gLKQ8T5HJAJcPW5gkAsSpN0um+vO/jCrD/kiu9cm5xCeBAw1LQA
	khAga4/pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jusJ5-0007qI-Ip; Mon, 13 Jul 2020 06:51:19 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jusJ2-0007of-0b
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:51:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so12033539wmf.0
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XtqBoIrlR/rKjGKe/kJfJA9m7jssET7vVTff1SRKfT4=;
 b=Iz1kpOyXeERVc160JxW7TBcIMts9gBt6OzZQ42NyzP7L65h8SiePRFEfs707PyxatA
 r42kEqzFhLAsoY2mu7wmHpSOaN6PeM0w3rYTnO9V1vKq09ZHG6LgmUJwBjYXfjFegJsf
 hJEKYFPJGRs7aJdfkFT5wJSXgqo9OSRDJ3KVhIE+6Cf0GkriovHjFIKBzPsD0SEPPMqg
 49C5LIMpFYW8THARpmq21W+xRCQmrvf5/bJ+Q8xn/fbn/U40oHFzxPbh17EVRuFF+PAJ
 X51qp7Bkkz4cbe9aQLLZ9o/UvF3K3x64HOLbASb/HzW64cIMgKHsrCGLvC6Mr3xehxgk
 ve6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XtqBoIrlR/rKjGKe/kJfJA9m7jssET7vVTff1SRKfT4=;
 b=tA0GpdPNFitI0hV1zslf3VYd4bFlUbxCc0z8Gek7gUIQtDYrauzblcDSx7dC7SfsJ1
 b5Q9G80I5mabjdhxX9UVh4aXQkUWyEDd6JU+d7ZtHsLUYltFZi0AbtG1Bb7lZDlQh6f6
 7htzcgTSD+f2TZCmiKOUFMQ6QVKqZd1HIFBlToW4IJ63Aj4Yiv8ye/mfhZEPCGt8dQNH
 1uVDkLkEF8lwJOMWSULAFSvEBlxfEWNBhRtgDVm/6lnvc6SshfSP/HEeK6IBZIC5tf7m
 bIR8ZNbVytXV8QW2QQVO9wt9q10fhglOEHgQSt1VaifAghOk0Fo+BasQeEiZnpkudLum
 fIFw==
X-Gm-Message-State: AOAM5321ynHiEKgIb61CdqAu+62QsQ9pZbYP7qlIg+t/6IgcFgw7BnQM
 hLgmst94p8awN/SUhU9QNbOHcg==
X-Google-Smtp-Source: ABdhPJy8OEkwK2hosu91yGd1UjKt6vgKwMfNBMFBiiqF6YAhQ7DiMfBX6YGkHs1p4KY5vObROeab5Q==
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr17053090wme.0.1594623073259; 
 Sun, 12 Jul 2020 23:51:13 -0700 (PDT)
Received: from dell ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id z16sm22066765wrr.35.2020.07.12.23.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:51:12 -0700 (PDT)
Date: Mon, 13 Jul 2020 07:51:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/4] mfd: mt6360: Refactor and fix code style
Message-ID: <20200713065110.GB3500@dell>
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-2-git-send-email-gene.chen.richtek@gmail.com>
 <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_025116_720170_AA6E4A07 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Gene Chen <gene.chen.richtek@gmail.com>, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMCBKdWwgMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gCj4gCj4gT24g
MDcvMDcvMjAyMCAxMjozMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gRnJvbTogR2VuZSBDaGVuIDxn
ZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiAKPiA+IFJlYXJyYW5nZSBpbmNsdWRlIGZpbGUuCj4g
PiBSZW1vdmUgYnJhY2tldHMgYXJvdW5kIHJhdyBudW1iZXJzLgo+ID4gSW5kaWNhdGUgc3ViLWRl
diBjb21wYXRpYmxlIG5hbWUgYnkgdXNpbmcgIi0iCj4gPiBDb21iaW5lIG10NjM2MCBwbWljL2xk
byByZXNvdWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzLgo+ID4gUmVuYW1lIG10
NjM2MF9wbXVfZGF0YSBieSBtdDYzNjBfZGF0YS4KPiA+IFJlbmFtZSBtdDYzNjBfcG11IGJ5IG10
NjM2MC4KPiAKPiBUaGF0IHNlZW1zIGxpa2UgYSBsb3Qgb2YgY29zbWV0aWNzLiBXaHkgaXMgdGhp
cyBuZWVkZWQ/Cj4gSWYgeW91IHRoaW5rIHRoYXQncyBuZWVkZWQgaXQgc2hvdWxkIGJlIHNwbGl0
IHVwIGluIGRpZmZlcmVudCBjb21taXRzLCBlYWNoCj4gZXhwbGFpbmluZyBpbiB0aGUgY29tbWl0
IG1lc3NhZ2Ugd2h5IHlvdSBkbyB0aGF0LgoKQWdyZWVkLiAgVGhpcyBzZXQgaXMgc3RpbGwgbm90
IGJyb2tlbiB1cCBlbm91Z2guCgpQbGVhc2UgcGxhY2UgZWFjaCBsb2dpY2FsIGNoYW5nZSBpbnRv
IGl0cyBvd24gcGF0Y2ggZm9yIHJldmlldy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2Vu
aW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
