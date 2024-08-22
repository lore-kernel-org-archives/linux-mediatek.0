Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8838C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 12:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gf6d6gBiHNQlXYscyYOO95dpy0Bp1bU+H7gVNsFEGYM=; b=DisrZBu8oNqfch+j/PNm8S/ss3
	HiLwDF3R4czNGWuBGVUfrZyp9YmMuPpuegR4FKy+2zT00scfMRdCr76s8EH6qbilEax9rV+GpQiuo
	ssV4lq1rLk0KkuBxo6SqyZhp2BRRUSvLH8ew3KTI2+merv9RIBBGW9hkuAtacH9ODRD1Q+jVX01nU
	2/sOHsqVP4UmUx/nxDTr346VlYzClDncGZmhiIAUg7mx1a8jN4etk9ulw8c9asnTx1FcBAQtpqfTe
	YThWFE97R180/qIfEM9ELpNCwnmVyS/slr55XGnHy0ZAn0kTQYdnAF9tWSLzW+sbuIsfgdWl20G/t
	maYsexjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh70L-0000000Cmas-32mF;
	Thu, 22 Aug 2024 12:33:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6zF-0000000CmPE-3Z37;
	Thu, 22 Aug 2024 12:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1DA66123A;
	Thu, 22 Aug 2024 12:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9970CC4AF0C;
	Thu, 22 Aug 2024 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724329940;
	bh=3af2BVUg7wf877z1PfuGs3wFXkF2Hf6gkN6iUlwzOPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fGCY4rNZ+Ie7rmcXzo1e5KkmmhOxayNQ8qGypc/6Tlwr66plwu7Vf7hT9touwWhKH
	 rUoNAJHmyQsisgYFbbxNW/czVeQYc8HcbiYGW6kc9xqdpzvqcRAo3NfUFDjavZqTad
	 tRZUy75t/yH2hYctAlN1jI54n4U3itSta0HA5XOQZ+UqSDtyHGwWVvqPdlrtZ0/HYh
	 onms/swWnYhoEeOuowTK6O3p+s+1UZWmwHu/7yC3jyRv8WY9/xfype8r+YRB1ojYe7
	 g++KZRyxyWPI0RHB5dYxJ+eQoqI+icXCep4EYStV++dIiX6hN6n/LV+8YcxGCHa5Jl
	 Ol9eq/j9bqLBg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efef496ccso675185e87.1;
        Thu, 22 Aug 2024 05:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDNZfahlO8DnKGAtS+Ad5CgVLJeoTk934lva5rvlehMB2ty9lSi0n3zqYri3icYYiVL1ljkcCHmrdmdhds+LV2@lists.infradead.org, AJvYcCWYxKZ0eCozB1vWFqypM/Tx61p3EHTWa8WVKP09K4AoTg1myz4n8YdawJWF48W1YDOa9CVQCnbY26CFqMuipbo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ecuBG9R6bkbnb8Xucs9+GuFyyc832epGiW54p1VoDprCo7ZV
	O+ZjRkQNOLbwU/pCqaAPCINX0P3GPP0xBLfT6Uy9tnN9DAgIDE4UOuunLCxQotZ57i2pXPVlWzP
	2pkDsz7LbF9JaQe6oTXRT4jv4eg==
X-Google-Smtp-Source: AGHT+IELJMuJDkhpPsO12MEEDtrpTV6xfsgInNXMN2DkC/1JY0q8qFL3c0BlEZIxWu6oS9dghQSXPb+CLV+6LMPxZ6c=
X-Received: by 2002:a05:6512:1095:b0:533:4517:5363 with SMTP id
 2adb3069b0e04-5334cab22d9mr1028392e87.21.1724329937988; Thu, 22 Aug 2024
 05:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-2-wenst@chromium.org>
In-Reply-To: <20240822092006.3134096-2-wenst@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Aug 2024 07:32:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJuiB8+PdH9SVum4CTNb8uM7Kzt3r2Y33yNE2yMGFVbug@mail.gmail.com>
Message-ID: <CAL_JsqJuiB8+PdH9SVum4CTNb8uM7Kzt3r2Y33yNE2yMGFVbug@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] of: dynamic: Add of_changeset_update_prop_string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_053221_963324_4271BE59 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, Aug 22, 2024 at 4:20=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
>
> This shall be used later in the DT hardware prober.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Use modern designated initializer for |prop|
>
> Changes since v3:
> - Use new __of_prop_free() helper
> - Add new line before header declaration
>
> Changes since v2:
> - New patch added in v3
> ---
>  drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h   |  4 ++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

