Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD9CD8C9D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=; b=vZ804Y+kQZvc+Y7yh284SZd9E1
	eSGXWqrsWd5pakkSM+F8MznaTAIsBl1wL6G4QM+SelKHCBtuapFWxWVV1XWubEOK3ZZCQLUuZpS8w
	8jDyvBpRZdO40VZDSSHs+KaS5813qYR1xCil1r/laZwbIcCAPnhM6gBKbIDh7DkzbrKQGetDn3Tq9
	Qx5idHazslbUQtypB/UuZolJ5G8jQx6hlZSHH08iu3GypbWBmXDlxrJuRQfqh9+eyuYj/Kw0tpzkh
	PsiHwE0giExQEQags1kNyjfAjdybz6IYxke2aSZ3uNpy4IGU5GFFKK2PXea7bTMEpYPGSAYNgtlaF
	pU3PoBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcdj-000000042jj-10Ik;
	Mon, 08 Jun 2026 16:15:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcdi-000000042jO-01hM
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 16:15:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EBD9601F1
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0422A1F00898
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935349;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=E+13TOU7YgvmeavzIrLGwPocfSBlIRC7JM36vRUTvHbVbOFY58TRUNH+IiEJQB2Gk
	 velx8lPMXyW+QEqcsTM9DXHEVGC0E0b/IuvwlhytoCTSoJ1h+ZUkt6Y3vN1GTX1+RU
	 4JH7EMDJqLiB0rBDYIfUOXBwWt8eZzPwqvL4dcTfNx1ykgRz1s+0MsvbY6QT6/MblV
	 0uewjjKrGM8mO04hGoItolaQ5tGFhNdmyEDu/FeTOY5QAiFV4io0wVsf9XiscWFakn
	 mfkq3eCkuLHuvykpWXQTgcbssEcbQFpif0GpQNGcRt7wGKUuhP+WZk+HsGQfrmS2bx
	 gcNs9GTDoGHAg==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-138129a622dso692066c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 09:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uqAHbcSmtfvP8iCA0DQT6s5VZzPMZySQB5WZ02bYgTjiDRpJZKMiF+lPmSe/kUMjIaJvND3/K7cWSXWYSEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5EtMXRzGBbvd90wATso3A3oNnEZLhTZJnCkKxbmdoGVKUTiv
	42KsB3c4JQG98nFW9MNBVec9Vlt6ki+exr/HFbXXnnQZplEX+qYo1/gOyJ4+F6NZv16mfPlq582
	CZfs1UJLFJupQjUHczTea1dCpgYIM+GxUg9/6L9n6Gg==
X-Received: by 2002:a05:7022:3d04:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-13806720e38mr8578839c88.28.1780935348033; Mon, 08 Jun 2026
 09:15:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:45 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:15:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
X-Gm-Features: AVVi8CeehSwizvVfI-4XqLm19u4Xy3rLoafM6ZSuZ51yo6ba5Mu-K9LrhjWFHnY
Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
Subject: Re: [PATCH 17/18] pinctrl: airoha: prepare for en7523 adding
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:53 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> en7523 a bit differs from an7581/an7583. It has different register
> offsets and slightly different bitfield masks.
>
> Let's adapt common header and existing drivers for the future addition
> of en7523.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Looks good to me.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

