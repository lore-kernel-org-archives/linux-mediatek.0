Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16730CAC599
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=; b=BDu7pSwjmsM9L0wQ0b20mzg05x
	EoPfhzrqzE++XOFb5tiFwhr7iLZWXGeGWHFpVCOHV+x9xr5ik0w3qZOCqzPsHAwdbkHZQiMrpQ40t
	foG5RTyJ8eK4evaZ7zqMMejHEDJ3fG28d9Auf3vlRKLCFnhZtaJHOpBMWG0IWTzG+JkIEpiMj+SEu
	3MxrTlb24nKesvGDfrF7m2HbokG9qs+3sdzvsRQwRNXXDYiDCsoWf3KIXAmtTbJlSeEQhyNSC16lb
	75b8F9XFK6spnL/D4jotJIRXXN2hadln7lxy0kccaabLtwgfHCiSg3RkemcNQajHvLDb2Ss8I9ZOa
	p9YygdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDG-0000000CFjc-2wfN;
	Wed, 17 Sep 2025 14:32:50 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDE-0000000CFi2-0t0b
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 14:32:49 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-ea0150ee46dso5585235276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119567; x=1758724367; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=LAMprJAXB8Ugc2AMJ4HAoG99DFuD0B9qm1bBjy2BuGCWGs29r5jjMdOK09GRslB9d0
         oDJslLJwbvjiVGbc7Y9Mloc+W6ZynxvTUj0WGR1k7vometSil5AahdjWM7aMV1/1em3f
         1wPag7ixntEHXWzOvi6h0IZQIldmfbmyf5fvnwuFIQ+hFGARBLOayw7sMMO4m7sslNbo
         1zrJOQWCCWS4zupCHv5xqnj2PeBTm68liHKuQ7rzNJFGDYsJDG7YtMvvIFO2PRYWoRHP
         Mkq4hghTGlOA65TN2Ivh+E/H3ZicTP16k7mR6l7FfDAOLBfBkQm3/hTROOLRFwLqHrMB
         orfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119567; x=1758724367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPP9Vl6NqhaMU3EPY2zVx+QbBHXXovM2n/lYKSxXZDQ=;
        b=NbaYnzPH2lERiVE52Vte/b7+qVTr5+r2RhvrWrSsmewQ+JVtItqVkaUT66JVNvCpDJ
         6qhbx6as8b0kOFICD4iGwcyf0HgoJ2RhCV1D/5txW7TzmLHTqpIefthsKt3275tADe0P
         YVRr8lb44ebmGkqfNHUksx2BdBwDjEDyQzWXWcCf/VBHWzMYKGKOQxUGplkXnk/IdtRo
         9cr9piExJRAspCGHDQkFqH5N+qs+d4G9qNl/6txX/aSmUO1n/D7kLicXXjzP5wwnWUba
         1QaQ+wv3B/Uo7J5T6n0OsUqSk3nqlF/jPy2WrKV092K+91u/ShjpYHn2dzs9lw58u0pT
         7FEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYXCX8ZVFw2+juelx7W/6PrlkwqKKt/UhXCoAm6spGmaPnBnvw+eTYgVeSIQny2NHvNudZiLHZwnZ8FFeHdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4l2AV7Eac3xaJC7/d6XSnhX46tII3fDGiKoJgVtXJvBVvRyNO
	WW5OqLCJVIa8mZD8/cxJ15sSLmO1ZLL6tI02at6EBjTPBGbLD+Ho7F5N+lbnSkYPirgxgdoveFf
	HdYzCLWpxjjCH6buUOpGZ783dQMiJpE6XlKtUAh0Wc2j2tmhArlyJ
X-Gm-Gg: ASbGncvm22ewV4zFEm1KbU/LnpmJaad4mwB0scIxo5sBjh39x8tUoizqKWCpw5os7zp
	yFGRuR0fKxbFykT85AwRHkdwkdxSKFM+b8WNoFQUddWkNc3mGYcgZZbODvzkie/YAaBRvsHIFDp
	t0MxyY+x7q2cqqSE02g4BIrUZBrT62v9PGqxEvqhG+og+1mKCxtydoPDrgo+ubkJCrg6ydDeN/U
	a567iUk
X-Google-Smtp-Source: AGHT+IF8958qtxMgepRmmh01erhzEe2CCKMaB8p0aTdmbEk0KITYYPXFKjQVfYFyDlneSgtW8sFxeX7TRTnXN5JBV/c=
X-Received: by 2002:a05:6902:6c1b:b0:ea3:d667:affd with SMTP id
 3f1490d57ef6-ea5c06c1586mr1899822276.53.1758119566841; Wed, 17 Sep 2025
 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com> <aMasUV14w0Dc1ki0@redhat.com>
In-Reply-To: <aMasUV14w0Dc1ki0@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:11 +0200
X-Gm-Features: AS18NWC-l2ZajfsWo9MjcYD2GJjmouYf3pDYfF1nnijLrVzTzi40JFoPMgBPLz8
Message-ID: <CAPDyKFosHY_aVP3EdzXJj4=DvZCPfC5c80oSwTEeyyV-7MRQJA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_073248_265495_AF23995B 
X-CRM114-Status: GOOD (  14.09  )
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

On Sun, 14 Sept 2025 at 13:51, Brian Masney <bmasney@redhat.com> wrote:
>
> Hi Ulf,
>
> On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > appended to the "under-the-cut" portion of the patch.
> >
> > Note that prior to running the Coccinelle,
> > airoha_cpu_pmdomain_clk_round() was renamed to
> > airoha_cpu_pmdomain_clk_round_rate().
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.

Sorry for the delay, applied for next, thanks!

Kind regards
Uffe

