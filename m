Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1D5C4363C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 08:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D544C2080A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 08:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZulYVHT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlkXAH7C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D544C2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVGmqOQvbquWeuuffiDcIRU8hDwHhBfhnMLb+HkWoCM=; b=ZZulYVHTPBZcf2F7YrhaXyKvV
	+q+eYuRiXEJcv5W1Hzb26EDeL2w1pudP0hW7o3iT2FotJJpGkuyyzC4dZ4zrf+s0WSbCFnXamg7Dz
	FO1qlYrSnnwgLrp7dQa3wqkio0onAnGZQKLjJIDjRZSi6D2LZdN+XQeaYkW3tpUAsiotY1YJzU2ST
	qzcGKA1erPfW7F/VboFihTU9Wv1kBCpT2pFWU0pau9YfvC6wY6wBqIdjADDIN4BsmdxOV/7PD7bEH
	4zfuitBNBrtmwlt5DAFXMdkDbGJp2rSor0XmTvd5/DXhqMpZ+YEO820viOtKuJkXsPsfZKNHTZwXN
	O3vCQh7lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4sx-0003Oy-PD; Wed, 07 Oct 2020 08:33:19 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4sv-0003Nm-1F
 for linux-mediatek@lists.infradead.org; Wed, 07 Oct 2020 08:33:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id r24so1122353ljm.3
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2020 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxByRzXtS14P4/kqXsVlalifhyVtmDWn1V/36Wva2yE=;
 b=zlkXAH7C+iLOICHOA8Pq+0jVGANDe3vr5yJxegEhyP9GdzD5Ro+DCLbvPEYzV9sXBV
 /2s8dUQa0i7Ctd5fV2h236vgbZzuI4gYBaNhs36z0Sl6ytH5y7kQ7XCDJnjJA6C3NS9y
 7EnnC85Ao0BTyqqyh5W2iy12XQ+uf/4ftN4Xt2x93y/eVG9jivjPnkUUD38bRb4HL4Ss
 l4cHCTq6BXq91NwKjXPPOpt5EwvbZxDFhXFz45rdtQe08/cONAesVyvwvRdNHczv0t/c
 oVS+Cj6qES4lDsBQsgpD6RTypDAZVbyjbOzaW85ZcHLvvdBRyrAjJBRhUdWTj1my/SwQ
 fIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxByRzXtS14P4/kqXsVlalifhyVtmDWn1V/36Wva2yE=;
 b=Tn+QqLyEI478f4+2MKDoMFlquLSNPoCmJIkfBRx2HMqPXzm5Cz/QoFthKHVJLQuUGK
 J7lJ5u2lkTWSvoGogrxPjiAGftkKXlCOxnLfjvRvNjrLOF8BO+fkmYjqNa6kvAr3aZyd
 h/Sm01lSb2F1WK2n3Vyt8SLiTXjM8VEdqgtS9YXl1VI4mc1knZUehfzSSRODC2xQTmJY
 h08uSj2aXGrnUd4cfXrU/052ny32uDTwLLy9LCHWiSJDl3as2sxtPd8YnmIMtws5VwZg
 9Dx/OKFxyIWZ5QqYH1MfWfsc10TEjcfbAXkRGJ2Q3aYaWZWt9lOyOGVBiI8/fEtpvcp6
 DLKg==
X-Gm-Message-State: AOAM5313HPmU/aLjtSKXDVYjLyvn9rXk6X7VehZV9VUb5+RBsfwaCNWD
 2S1bNhcMp0e02vCVeXYYmMMvYaoiXEl4Ql0GrAbNGw==
X-Google-Smtp-Source: ABdhPJxRwSM+vB7wFf7q0lCzYpkrH6QvTnRgE3TO454T8PFfp63JkFd5ISVqjKk0EWNZk8om1x7APCPRrmErvWxIPaY=
X-Received: by 2002:a2e:3311:: with SMTP id d17mr830847ljc.293.1602059593872; 
 Wed, 07 Oct 2020 01:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201001142511.3560143-1-enric.balletbo@collabora.com>
In-Reply-To: <20201001142511.3560143-1-enric.balletbo@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Oct 2020 10:33:02 +0200
Message-ID: <CACRpkdZ=WangdT-RA1qCO4BaN64dVhOcODrubPtk5b0C8cGaVQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: mediatek: Free eint data on failure
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_043317_358330_BD754D2D 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 1, 2020 at 4:25 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:

> The pinctrl driver can work without the EINT resource, but, if it is
> expected to have this resource but the mtk_build_eint() function fails
> after allocating their data (because can't get the resource or can't map
> the irq), the data is not freed and you end with a NULL pointer
> dereference. Fix this by freeing the data if mtk_build_eint() fails, so
> pinctrl still works and doesn't hang.

Patch applied after rebasing it. It wasn't entirely trivial so
check the result.

This will not apply on elder kernels and is now targeted for
v5.10. Fixes for v5.9 and stable will have to be backported once this
is upstream.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
