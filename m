Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A36CD6E79
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=; b=AJ0nWx7rfI4iLyKNNhRcf3qnrG
	4hEr3Mx5A7vK1tAGocZAaORTTlpEDL5bDp2cbWXNUWAZaOt4E/CU5saJYLuGdMAOFnE2en2hus4aX
	IJo4AaY2u9sJULyMntpzXg/wr8DrDkjn4XaMQVXKK+J+hMOn4ZAyoJRfxL/UVTuXMsunJz8WSkut5
	aOrvjRbzcV1H5H7+NW+y2weVIgwNNUkfUg22j71gcKEA5Sg0S9qFkxQ7SZo+IIsdl7GeRm0vXut8r
	tz6MfgG++z7NU5lYAicf8TjccVtWbDLRVb9xjgGwk0OpOZhDz3DzmxLjDRFqTQ79V9nAn8d4fSaVO
	/s8cZnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhxI-00000004SjU-2KrN;
	Mon, 08 Jun 2026 21:56:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhxH-00000004SjA-0Owd
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 21:56:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 749AC437C8
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5873C1F00898
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955782;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lAIgMewmy2AqrOVitnE3g9ROOWy6QFMGahxL4x3X7AiV48Y1UoVpFJDP2+8f3sQlQ
	 bidlXC38fBDBzNMHM9EpBriCsyujrcWYkwZ7+Pnqu0d74mwIKoABVhELattqYP6hdA
	 wHWVHVyrNBHSNMfy0ZeoBBG5RnH/DGAcfMg+0whFVCW0mFBCVD9NW2VkuZpWdcfGyr
	 eo5ZVAWVl4qWeZTT1SoIG50hnNAbkN4228k1svyNX2pXkIn2kiNiQ44qbVn1MvucV5
	 ECAHPP6gBC/GcVy7AiMWI0QIp99nwBTKQT+4vyN2POXnS+VYzZbmzZGJz3KpNG3lEc
	 HZjcNQmMENbgA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso5053216e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 14:56:22 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx6uAVXZuHhkzzHoNZSLbBLKZAJzeQafRiRWMUBtEPqVx5gEz5v
	liNVoPT7D9FxQqAmyc3nZ9rtWUEZm5jJFDImAIvEIgYQidTNmo+YQAub/KjdooOx6szlbMZieBc
	cG0yVQKfibQeWOooo7ZTE3yF6MgpWGEI=
X-Received: by 2002:ac2:51d2:0:b0:5aa:6a11:3a29 with SMTP id
 2adb3069b0e04-5aa8865d774mr3483769e87.3.1780955781186; Mon, 08 Jun 2026
 14:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260531162340.5326-1-l.scorcia@gmail.com>
In-Reply-To: <20260531162340.5326-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 23:56:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
X-Gm-Features: AVVi8Cchkr8o6T0GxWTVM7rSwLob_b-bRRivY5EIJqXqcLMh2ZhFlagIXrN1y7M
Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register
 offset of pins 34-39
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, May 31, 2026 at 6:23=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Valu=
e
> was verified with SoC data sheet.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")

Patch applied.

Yours,
Linus Walleij

