Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCDCD33994
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=; b=FtfofHOotgdOngIZCiL3W7AKjW
	KN/B5IRj8T62Lcv5Ce6GqRv5xivd77iLvBAPlARdMoajBxi5vSY8RRUlwbQ4JCEETGdHNOnXf0LyQ
	3VcgtFASwog/fxo42TDviss7RPKb0irBFmTIu86Hq3m/KRBKWB7XRqPPDBfBKRMTByW9S5QloKRlN
	neC82hEhLz39oPjQauIsBR+efewwwFnyy2ACQ98YZ5iYow91rJqz5tmfVl/hn1l1zox73oBERVMd3
	sA07GMarEOvEGkUUYz0fdM/YBCNbWXTmCMJvdrr8DnrmGgLoqU/deyh9QrlFMsou3FDC/vhi3RC/p
	iOoTkZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RHi-0000000BEbR-0oLk;
	Mon, 28 Oct 2024 15:03:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QrS-0000000B93K-2DuF
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 14:36:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4970108e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126208; x=1730731008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=m9rLBSQLOQe+pzXizMrFA2VXG35DVowqaIH4e/4rqteEI54/BnIQhXnNuLq97WNMBS
         MJYvHXWy8BdcGZZIwtoRJHynyXf8xqcmU5+MgfiXUDA4ZvI6BvI1IrJek/mmaXm0yG+B
         85exv2z0l7IQmW4Oafizt6rDDEnNLctRD3QGYPqtef2hZEUgB3ilf7Q/8uuFauyQnBvD
         A6jYymSB8nfXJM0r2G+08xQjzliPrAYNi6o0cNjWFQTEJhfbkjnGsUCy4DyNLbXEt4Md
         h84PYgvRMHeki0fOYcjTblX74u8P7bi//aomlqpOTzUG48iYT1kxSvYdTjlow5wlnaIr
         KMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126208; x=1730731008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=jpc1wD4UJ/sB2/vPS/frfkP0x+mN/VUZyYF+SLVtbWqI57QXdWzn2goK3ro0HbzIkJ
         9lLGQ+nOO5x1AkhBx6PbD/vlcIOHMPidjOZbW5V5i3B3+xoyxxUi+BWA41zOgZpAQliF
         ZywLWLWB6BN+dYE5b5nGZmZL54RvZHOqQqeDGM0QIvhpq1ol3UKwvSRf4N7v3bj3pB1p
         6AEyAQ5RF66sbHwu2B5N9xBbk641zf1D1fupkwcsFVxwEwfmh9o406YX51vinObjrJx3
         OsKFDsfrRO+mJ901qNTHMkymU5XQuVDnnyugxjEtnp6vfsdFKjzFxhFEtWXHeToj8zD6
         9AvA==
X-Forwarded-Encrypted: i=1; AJvYcCVOHtM1VddcktESlXM8DI013yUz/2zFf2cnZKgKLrd7FoqxFkLbdwHfLnGnZa+A4nbd+vMNK9IG6veSJwWGYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3irIrkyDuQt1wwW1R4/ElzKkjHJ84GgNJMgNOg1IrII2CFlx
	U+jY3ZcYzX3g9/cQIcd4+aAov8lTPXonCqtk1G0ZQgI0NvXTPBCQeTcxB+Wd/AdnNsMd2CLWEGo
	Tgp77ZrcswTB+T7Ib1GqdOiX84gSvAsewtSgIyQ==
X-Google-Smtp-Source: AGHT+IFMXRyPb+X0jTeOQPVKekZJqG3FwwMxDwb4pHs5ttD6aPRHRy5s8zoMSwymv42X/0WESdQov/Yws8ZdNY7ZJJI=
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53b348e576amr3463522e87.30.1730126208152; Mon, 28 Oct 2024
 07:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:36:37 +0100
Message-ID: <CACRpkdbBAa5piO8BJoxx04spOc22CBJ-zbi82BT9sG54c=csNw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/5] selftest: gpio: Add wait flag to gpio-mockup-cdev
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_073650_606408_BA26DFA7 
X-CRM114-Status: GOOD (  10.64  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2024 at 9:46=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:


> Add a -w flag to the gpio-mockup-cdev utility that causes the program to
> wait until a signal is received before exiting, even when its behavior
> is to retrieve the GPIO value of the line. This allows using this
> utility to keep a GPIO line configured even when in input mode, which
> will be relied on in other tests.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz has to look at this patch!

But overall the idea looks sound to me.

Yours,
Linus Walleij

