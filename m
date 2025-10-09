Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC5DCCD183
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=; b=wxtTnlo13pIf6h92s5qCcPYkNr
	DrQJ1oLkppCCA53y4dkXj1RTTj7I2bTCiQSLJaS79o4mz0fu7qMWzQGnZJSDLJqRogdyDh8D0lW7T
	flqv0Zf6/Y04PInPmT1tduNn2FdFz+ZY0NZxtBKCqig9S3MTRS2renWnuLxu2NKU8D6Xs8y5JSWMc
	lDXpuj0TIL4HkLYuAXggExFbLDzxeDktlK7QzBBKxfsM3eqL5pbfYPi1tYWOYaqVBuu5BWLpL7noq
	ZQZ2HTj3ios8wEM84NUoTOBjDBwI7ubuVaKTYXjjMbILFjzSQMCNz32KKkczSjc3I2vk8yY1AgFEZ
	oS3H2rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6m57-00000005X1M-2vJY;
	Thu, 09 Oct 2025 08:33:01 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6m55-00000005X0a-04yc
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 08:33:00 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-375eff817a3so7192521fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759998777; x=1760603577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=SdwdhZY5p25yZwhH+Z4WbALFfM6op68On569Pxe1I0+7b755yfQa0W8hbO4SWzQyKn
         jnPhJcK3oxknTrfvDb1mepzS24nsPA+yYJFWXDI2KP66VNilJSABNJNIIl8QjxClXFdO
         CRMa0SI33pjdKT/vWyzxuNfsUj3BXGIpuxUhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998777; x=1760603577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=qr542Y79fmxE5Ud635cUkC8k1OSlzP7vHxGg/PJaq9036tHAX0AddKtODFRpP0jrjT
         nXWYiIVTakGHnMGNsaYR4SXqkUEkdUeu+h9YW3NCduP10xKGdtKH06tgz8eDio1gBkBp
         y17jWlsZVce3PHERSHMyvD3UaoNFWgMWOkVJIicrH08Bg56OnEfTCITN0jKUFHrSlE8H
         B84FTYcQlOmjD/hSk0v3b4CjxgJlxNALMuY9sg7YBnk6raXZkfyOoTLC6wppGSPCdK80
         ++7bEDaudRyTv9EdSV0vGD8T1hTXaRRb9M+9N4YbE3rjagrULRN83o1R+FrepPZkv1Ph
         wYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAPMrJS01PeH0mSs6idcWRCkq/TfpABLHfJkDAYJ/MBZvEsa1mG9BrQg8B2D9aIhha6IW+qqSdqP91cEjqMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpr1xKReDk2YPCe0bnn309T4/z+aIY9IZ6Uvs/Po+KggTyFfbS
	CyYMYNP1v6fWD8jYlvcA3PXstWKnV+o6CGZNUftpxTGMi9w4abFRn7YU2sB8BnVRdH47F3SezOO
	Rt83DqpaKZVQ6097fSCGZvjJYJiSnOVqoCRGhj6+c
X-Gm-Gg: ASbGncvQU2bhHM3QKGbE19p9B7eLI4NhIRPr4e4KFRrp95PGsldnrS0ZcgrPmn/UkZF
	d5N/cT3sZBJgGEfnoxOsN5Kl2xQy+suCVLtB5uuqXGyE5fv+wgU75l5hCRp1RLZvjQoeUntDuAe
	kB/Ll9vXuVXOI8V6FjO5fECdhxGlTyyokcJB7D7QiRW8QilmTqX3pZR7lZ9WuzUwitK5l7iYctU
	Gjy3Sc31YZ5C7W2guqmIVAAaQy3/hWbH8/dRyUPq8zgeCzms/vHIzd0mJiP6w==
X-Google-Smtp-Source: AGHT+IGNqC+T82k2UhLGhs5Z+RJRCLCjdXUj8T+fy/dwo+JYeZAn+ZeihTGmoYgDd/1wSNYOMWZ3ybZyqQU5hYgcf5M=
X-Received: by 2002:a2e:a99e:0:b0:36e:93a3:979d with SMTP id
 38308e7fff4ca-37609d52442mr16172291fa.19.1759998776858; Thu, 09 Oct 2025
 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:32:45 +0800
X-Gm-Features: AS18NWD6JVU3Hv0pwNvYA85CDPCr9XWrThP36lbmILYiActB6r-bT0qxLSR0NtI
Message-ID: <CAGXv+5G8XMRGasd2=H_obsLJ-97M-cNPDo3BJCrwhx2+GHhYcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Pass device to clk_hw_register for PLLs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_013259_101776_94185B54 
X-CRM114-Status: GOOD (  13.90  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clock controllers. However,
> the mediatek PLL clocks do not do this.
>
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
>
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

