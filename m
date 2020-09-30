Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E85EC4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33B8520708
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ajlsd7y9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uvnIFiV7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33B8520708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWBmhBtBj8s1uWjjSUIPUvHYH40I3P8AAb/xdoGq2UE=; b=Ajlsd7y9ZHl/9HZgYm7GpAQp5
	AinSKZQSmTb0xO1zHR/XL/8766TwWzCeCi5xJI/esMJpXArkUJ7U9Lu41ys4mtEKjhH82O7kCacE3
	K1x/f5tsQ0PyjiBeeDvkDqwgavmf7iNgFpr4nTAFJltf1Sm8HJxS8dN+ggxA+aIVIKPqYU+PIm+dL
	Vt6ZJlESaYq4sSxq3SvNYw1ZQm5WnF1yeI3J9VpMqjXEvuBhYZyDjB/1Fo+/XDbXe5r4ozKoIBFmZ
	pc9tBoW5VCa+/Bibk30l54snRohwq0YblZOITYFEKXphhoFULZZRVYIf4eDY1twBEssl//205mAw0
	MsgFNhJJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXmQ-0008Sb-En; Wed, 30 Sep 2020 08:48:06 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXlq-0008CA-FM
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 08:47:31 +0000
Received: by mail-lf1-x144.google.com with SMTP id y11so1159766lfl.5
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2020 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cr4F0zeDS/obqT3hxezbEXoAuNHnHKvlXLl42w4NaIs=;
 b=uvnIFiV7FZ+zzxcN3L+fCOcCWuTR9m5Qa6z3OabpBiheRDK7oh62P0AGiTJ6XmPIb/
 LbyEdCxFU83nObD/1diqJRWJlStu0Z5jC8YKKXrNm/btn67XGWCMhOkviYDGeFTih0lr
 tPMt6Whw+O1h3ZbA2rZ5mimAi8PWwVpQy4ek4HBScVoprn0iLZoVa0t7Netjtmmiil/V
 REimQjACKl1DgKtpQ4Yt7dPbJTE0au96lQDi/QUkdIMgVoR80ZwpE1cTIF8nKW0ss8ix
 AOKNfOOB7C9QqYFsUjoqnadPe2jn4unxwRkIBRv3NkTXHBsNHuJzF4m8hRO5E7+PmYO0
 svaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cr4F0zeDS/obqT3hxezbEXoAuNHnHKvlXLl42w4NaIs=;
 b=d3tBRHUK8q2KwcnCmOFFHBpouDp3k4Cg1VJvTP7rDdVH1IShXySpMQsK3x3k6cPVaa
 NKcoMiMMREKBa8MvVbdNrcVIrwgTiMlHCgoKticCEIw2q/t/Ti+NSWSc7MPs8ZdCO265
 CQ+VxySNWwAur1dkIdnzsd2WYNUGIOMniTEbJVSOqPWtiFCVVnwvWYGsPevXVFiVwdIG
 hZbI6L34isfVmhN408Ofnx3Mnl8PXWAABwtqyb0HcOmtB39ijUyTZ/s4i+2tYKubQo4W
 5rv0WyTpEcEqQgKKhf+Tq6uVl30OE+hRzM6JdIMn+YR2SexDopDpqmVD1sWz08iJo6l8
 ZxTA==
X-Gm-Message-State: AOAM530xfLUfFRLbF8TbcoWk2y7sKzBVi0waCt136lg3eIXk2dHEArF7
 LMK2Tjxzm6OP6cYpw/ODKwjV5v/MhG0UUoPcOjNKMw==
X-Google-Smtp-Source: ABdhPJxOpTPzyw1+Tet95je7SIFAGeXemd7JxYndbFKN8UuWccBXA0YLrbqMLAAR6lN3f0fEFaZho/Y4cHjNa8sCDj0=
X-Received: by 2002:a05:6512:20c3:: with SMTP id
 u3mr473893lfr.572.1601455649061; 
 Wed, 30 Sep 2020 01:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com>
 <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
In-Reply-To: <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 10:47:17 +0200
Message-ID: <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To: Sean Wang <sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_044730_561705_75472334 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:

> v2 seems the same with v1 or I was missing something.
>
> I just thought we call devm_ioremap_release to explicitly to free
> resource when a certain failure occurs after
> devm_ioremap_resource?

What is the semantics around mtk_build_eint()?

If it is called on the probe path no explicit free:ing is
necessary: anytime probe() exits with an error code,
any devm* resources will be free:ed.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
