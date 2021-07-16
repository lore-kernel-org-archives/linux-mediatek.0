Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8869C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC98613E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC98613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEwXvURTLKYKCvhD8fYIdIa3z3Qb7bbsoHmmlyQV/LA=; b=qG05jnRwgNPzIh
	O5t+YLlvbQPboSf+FnyxGgY/fdRjqc+sSGaIkaIzSHnYQhmkoSmdHHXnzjxApRUxYR+rQ1eHwqkYy
	tqbnEzlCeYQFYXs0NxYcMrPdmGcFJRQ6pDi8XSJajVBhKAAOp3uf1MxRhiwfio7EobymUY2i8WVsv
	6twMjfJ6UOIDehp11EMY1Gnw/E7fNp4Srpk2EoczVmZSs25vI+UJzi6q3Lf+af6yI3YCRId2VrJxA
	v52u5QTvPJ0TJaBsyHhGuPJXr4MTxA2MvbP959c4TNe0b7CWQ/FWtvi/7I80GCbLwqfB0sYWN+g/H
	POtQca0/hcy7Q6vc6E2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4InF-003cva-Qu; Fri, 16 Jul 2021 08:01:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4In2-003cuL-BH
 for linux-mediatek@lists.infradead.org; Fri, 16 Jul 2021 08:01:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id d12so10971379wre.13
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Jul 2021 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LUaz+GS+zWVJuYW5ehQ4jb5HK9aKHSWwbmew2idPbho=;
 b=BdKqQCvS1OZI1vnkUrwlg4+sNF0QtP/eBkkTMJNrbUlOeR1AMZ/1jtPieURz1HdQgY
 MT6t23A4KqEcoQa5KfWeUftq62YBempq2JLzGwTZ3BtQPm8kLBLi9PCSM+T8bxmMhkPs
 6nb27IPNkgSmOIkt+fE551YPX+wb1LUVxtaS7JVNApwDsps+phm7aOa6ao2k/P+Ioxwg
 W5ollUOsIqxevwZdbCZ6C/cIVy61dUXDgYzp5DepRBVVMj5agXuUHz3DV6Pc5UkUIUEq
 E+Wp8mVRbk1FlvNxfgslrQrINbm6tGGOCLz9cMRKS0LNYQJ8bD/wcA2n5NuOg8izzuCW
 H+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LUaz+GS+zWVJuYW5ehQ4jb5HK9aKHSWwbmew2idPbho=;
 b=ACYOlAchTNUtn0MSXWaNxYu30hImJam3zz+sT547sd7nviH0mmDQPy39NilNqRDF2P
 O5GT7kZqDMYM+T8C3D0C20Slcz6XS90D48tyDYPqM0kzBG82PzunRQ0gDXPaQzOcXBDq
 PCnT80un0vLhDQqZP+L/+eCofcSSfWY4gyDKQbd6zp4XobBo79jQJ7eG9jcQjy/De1K2
 r2l7Olnx9UAgl/i7YwQocT49EaoYriyfGmz6PFK1TtcqOrmguCxXvZ7LxZ54EwU/IaLu
 AUy3Dz/khdC8OgthPDim3L0Hppd9ylrxTuXIDHGgf9o0Ffe8fQnc3pGmkHSyMzFZVMlu
 rC0Q==
X-Gm-Message-State: AOAM532E+Gd1wUcrviQclJTGaREdrUuJYFOMRJVfl81413lxafYCe0IB
 /1jwUVt0RS5lTshx8e9qpcgT9Q==
X-Google-Smtp-Source: ABdhPJxgSztBl+UjqzA//sgn6rC1JoTWkDQJvQSko/gR9NvTImxNOZC5SsC4kGfenn2tEITuemeOLA==
X-Received: by 2002:adf:a2c3:: with SMTP id t3mr10448145wra.223.1626422502459; 
 Fri, 16 Jul 2021 01:01:42 -0700 (PDT)
Received: from google.com ([31.124.24.141])
 by smtp.gmail.com with ESMTPSA id a207sm12292962wme.27.2021.07.16.01.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:01:41 -0700 (PDT)
Date: Fri, 16 Jul 2021 09:01:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fei Shao <fshao@chromium.org>
Cc: Gene Chen <gene_chen@richtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] mfd: mt6360: Sort regulator resources
Message-ID: <YPE85IQ72QOhf3DK@google.com>
References: <20210629094339.874120-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629094339.874120-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_010144_439629_E8D769F4 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyOSBKdW4gMjAyMSwgRmVpIFNoYW8gd3JvdGU6Cgo+IFJlb3JkZXIgdGhlIHJlZ3Vs
YXRvciByZXNvdXJjZXMuCj4gCj4gRml4ZXM6IDRlZTA2ZTEwZGQyNiAoIm1mZDogbXQ2MzYwOiBD
b21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdXJjZXMKPiBpbnRvIG10NjM2MCByZWd1bGF0b3Ig
cmVzb3VyY2VzIikKCkkgcmVtb3ZlZCB0aGUgRml4ZXMgdGFnLCBhcyBpdCBkb2Vzbid0IGZpeCBh
bnkgYnVncy4KCj4gU2lnbmVkLW9mZi1ieTogRmVpIFNoYW8gPGZzaGFvQGNocm9taXVtLm9yZz4K
PiAtLS0KPiAKPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8IDggKysrKy0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRo
YW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
