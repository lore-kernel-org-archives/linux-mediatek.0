Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1E2C47E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 12:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33C521928
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 12:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wi51LqnS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACiWYYwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33C521928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xg3fy/JrZVLkwKtWp8ABrbesGchEUSmKVmcHuF6Lgx8=; b=Wi51LqnSe5DMjg
	IiEFBwX7nmFXpqgMBflK1srk4WPV+zKfuKK/XQtS5klcspUNQfj5MaM2G2vU/Tj32A76fCjnNe9wN
	GE1/A1WI8gJAxw5+Ue8aXt+lYFUKvxGkOTi5gqNBRaK5BGnGs8OrvRzPwSeiCwPC1kxlLPp2KRAyz
	mFsOxaQqqj3bbfx+h8mjWn4MLSQetNlpIhLDP7iiPTukUamvHt+MfDqN9vvhsaOQ207aDrwkZutos
	uKaHHVZXh/FvHxJ9q1acVLWYPEYrOOWKlkrfkzqRjp+EwSh8dIKDuuI7AyW4PQc9+n+dLvf3Uo33B
	ba2aD66kCq9+JHN8ltCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNbqf-0000SO-Mq; Thu, 24 Oct 2019 12:04:13 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNbqU-0000Iq-94
 for linux-mediatek@lists.infradead.org; Thu, 24 Oct 2019 12:04:03 +0000
Received: by mail-vs1-xe43.google.com with SMTP id l2so16013500vsr.8
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2019 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yIHdRDSmrUwrFRgZT+l4aoJ5+wJfwLc1Gxo6qeqIHsA=;
 b=ACiWYYwSNj0go/Tl2/lQqg76/wKNHgtph1WZCkgwEJe+upDk/hj6BlpfFgn9+Bowg8
 jz152L6lXUVWJiTqirAUj9jqzvqB06NHvmV3RDhScyffS58ZGPFZzSI6c9B7jFP293S8
 jh38rJLqgSQWl/oXaLYtseJ1zWtZhTuVLL9uK4dWuP8jpSN7xzM0vS5EelSPDkwDmp6p
 nxMu6fAJYoE5Djc8CPllGbBwznEYsqk8sA1l+Fcbw+fynz7uA0UBRAAHptjGXDTqLlVr
 Dt09fWR5mLgf9rPKJO0+C40g9KFUwEXUSTolAIDb7FkdpSQKkUP3vvqM3/ZfvVhwk0CI
 QsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yIHdRDSmrUwrFRgZT+l4aoJ5+wJfwLc1Gxo6qeqIHsA=;
 b=hz8+GgL8nY3818oYyC9zPcRladLXgb3qwNU86BFE/Tv/L6+wIGSf3L0HZ7jX8hy8oQ
 vNlAmtEhhGEGVVGfygq+DX2uFBfi8nBlE6x0LGxIiDr23Vwt53SQX3VxgzwaUi1+3fGd
 SHti5D/7rfOYdrE5NoeMHfS47YLbzpQsHL7zEFehAfESSUiHp7XmOt9Fdg9tC8Z3313j
 qk0IiQ4L2xLVC4hjAcPacYARi8bFY2BXFKHR/5SZPIMS4v1jCWGkCOSv38sqAcnbamVv
 5inm2tSrDs5QUAMsPySVR8sZQAVUEp5pBRQY4QiZT7eW2eWGrtASy+sg9z/xFSYj5Pwz
 uTbg==
X-Gm-Message-State: APjAAAV9cUdBTHQsX8PvlMvdsuoaU/8s7+JtYI+vcbw/CrifaZpmnB0t
 Jbvl+xfDGs1/QGVo8wXTLrP57f+QoRBTXSFEAo7Q6w==
X-Google-Smtp-Source: APXvYqy2tjNnWaUw1UPJsxMKldXvGJ+Z5Kl6+j0vYrUnvZIiztW/IstiPyKsEf34lEfaQ1dY5ztUXc9J76ibMzre49o=
X-Received: by 2002:a67:edd6:: with SMTP id e22mr8357905vsp.84.1571918640462; 
 Thu, 24 Oct 2019 05:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191016141053.23740-1-yuehaibing@huawei.com>
In-Reply-To: <20191016141053.23740-1-yuehaibing@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Oct 2019 14:03:48 +0200
Message-ID: <CACRpkdZFmXBs8fUnq5hiQ-=RELKM_L+mN4Sy+wWkDTwJb3sPgA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use
 devm_platform_ioremap_resource() to simplify code
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_050402_331403_E83A41B4 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 4:11 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
