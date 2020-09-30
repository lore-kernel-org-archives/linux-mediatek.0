Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD05C4727E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 09:47:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55DD02074A
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 09:47:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="geZK85Jk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HOHADYLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55DD02074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jV6uVpwPcE+mnE2vO5cLWFbYSWx2Es2BDTzk62nIM7I=; b=geZK85Jkj3FXCpe1EeafnH/+8
	PcOE1EOw+hXHKIrHPm0kc+GIZWMYOWidGpcUoBNUE/0MR7uu1Oar1vUTcdf8csQKND5QrVG/zE6UH
	Ue8KBwRwKTJndv/kkvg0AHZ2neJ7J1PJI25L16nBNh0+956NkrdTm7TLoa1u3WY0uMNTb9pHtk1+C
	nMtQVx63Db3NfgM5MrNXmd5/3deiIbG8iZVvaaobM/Y/IB6Nzgi778owcBlb/9QrmA7OfJajyrGIK
	nB5G9ItsZTl/W/sr/nRGdz+ot9BlH7MsBfw4zDdCyHkril3ZoItwOINrzUdtlabteTYvtGliyhLv9
	7BQp41wQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYi7-0001FQ-Mt; Wed, 30 Sep 2020 09:47:43 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYi5-0001Ea-QT
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 09:47:42 +0000
Received: by mail-lj1-x241.google.com with SMTP id b19so997275lji.11
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ol/xccxtcNaUn5n/W3xWoKSpLgUl5lz2xY3r3AugO8=;
 b=HOHADYLC0y2IrheXLaEGwD9rtt8CSvpYrABU0NMoOff2N7i5xWDIyolYguSu/rxYG3
 crVmEoxBJVMBAjHcC8sIBYlBN5zDpvWwoW8L3inLjcHO9aEqAJOiELTZ5Al5P2eEcpoa
 tWW9cv/StO52LiuDDrh1Pog8NexiLuZoElT7sVs2igD9k4DwcHxfYAXC5tHZAyUzasfN
 pcjptIkuodjmPCMmwfAbnLMTi8edmmWa48q3NI70UOUEMgGPXpAvhwbql3FIOw7aVaAJ
 4NsPXSf7r2zV05WOOtFJDSuq0TFDexprTnRypfnVESDmJecMcVQ4uPljeAZnAw+9Pj+4
 LE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ol/xccxtcNaUn5n/W3xWoKSpLgUl5lz2xY3r3AugO8=;
 b=ZQJkb9AA1WP8oTU4j9qinQEEHzjPgZ3Ir6TIHQMj/UnVYm3AZg9bvtUN2G8q1Sfb2U
 ydsObtQ6usIzVJl/mfORLxMMBGjWgRWcn03EvKwq2noZZYIp1lFs/GmPqw64kj3NHPbn
 hS147lp7o+QmYtNU+vKoLMUs2gJwhK+3EBZk4DcY3QvKQJo/SAa8f5dE6bcbKF2KTA9m
 +g4g0B6VAfZpbHpw4POfJ+PO+05h2NZVNa5LO+5zO7zfO7HdxShiKmKBckGlN62qPKoA
 dvwfOSS6sLhWjpTygmU2b1jpBFiGJfs3VzP0F7osWt9huNY7UklmPhFAxVMbEkX1kk/B
 I0pA==
X-Gm-Message-State: AOAM531bnV1B5H+PStdA53djzEPZ6wZKWGa0lyCpx+I5gFviZMevGVzw
 DKAkwJFi5vxJSE06PbhMze07Pfp1NhhVbMLNNwEGxA==
X-Google-Smtp-Source: ABdhPJwoa/bnOD0ty8V2zJfl3gmzesmmlaUbFQLnWtsNhyfTCGEoZLeYcdQ5iyRgF0PDA+MSID1zGAuyWxM0WaI/dG4=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr590961ljb.144.1601459260374;
 Wed, 30 Sep 2020 02:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
 <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
 <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
In-Reply-To: <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 11:47:29 +0200
Message-ID: <CACRpkdZFAjL5k9MdQWQoktHiFuHKacgPd4p49+dUqUYXNsH2=w@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To: miaoqinglang <miaoqinglang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_054741_867492_0B5EDAA4 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, Sep 30, 2020 at 11:39 AM miaoqinglang <miaoqinglang@huawei.com> wrote:

> I tried to rebase this patch to the pinctrl "devel" branch but there's
> no conflict. Could you please try again or show me some details?

If you used "git rebase" this might work for you because the git tree
can do a more intelligent rebase than me. I only have the patches
and they do not contain context.

However I actually want to apply it on a clean v5.9-rc1 (that's what
I actually tried, sorry for the confusion) but maybe it has some
dependencies so that does not work?

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
