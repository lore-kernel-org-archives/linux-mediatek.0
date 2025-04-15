Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A4C369B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=; b=E1UtzM0E8tD2yxY5+Esp1tZXzd
	p+b8r/OxS0Vlgn9MF7Qe+fZSdihGhw8C0yO9CpucB+hgCkRcvlaIc9HwhCQnr2yhJPw8l0G+vnCFW
	MdTBBiwoZlfWqIzJKL6BM93IkqDdo6/vtDCP7zYUoDuPCqFK8y0zjIKJdDz5ASiOj/A0QLqT2jIxZ
	AufP7WULLG2+PNN1f20KJu8cUtJ/+G1T6aN6wZ+KAaXiQAuUjRwBIpiqJrlup+KXAfbPFouzRm5P0
	MOavmhFX7YJ4B4SdxrsSD7FokbyAEp4wnlZo1VQKXhi0tUhJdjCqHiAjIzQ+XYPvgH0tYtvUc8ssC
	g/XteJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bAm-00000004tlz-0DAw;
	Tue, 15 Apr 2025 07:57:36 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4azV-00000004r5M-3XRq
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Apr 2025 07:45:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso51147651fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Apr 2025 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703156; x=1745307956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=lTAjF7yg/yuIao2MwZe8EUkydVFFiV9U8wv5lzhmGYbN9t8csfiV2TYkUv8rYhQUdP
         2djXdLhAok+TThvRy4BCURPnyoeTXaInyx//O/JTqADEuS/Tn6YTfLhu1WJvMxFx/+Nz
         2GstnejW9ZujAGKe3JKeHTfb6Uj1t+/SE6SI3/aIX+haYbIKGDlMCo0Bh9zIx8fpMc63
         BlCbXOFWuwg5vwhTMMDxlKXwnzw5GhRfe3tF7Z/GlciQOkb7YIjqfBvdS1qSbaGBZ8/l
         MkWaItvwuAca4yC7POB+4JNvSWwuUFDslhVddsxW/Pc3fZGP+SNmYJPoDVVFCOHCJPgu
         EkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703156; x=1745307956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+gAob39nS5ihi78nDHJOLc9y+ZJq108PESH1zUJ2uU=;
        b=E9fCh0sWwq8wuPEYWA1lm785QRmV45eo9J0gihKfHCOKJh3v2PlRH7Ye90+0Q7/1Ml
         2e5uUCt27+FWGKGVTEyKCrLjV8+mx1InHmhApb9zBB4qlGObqtC0C8fROeGcN8vjuxNB
         Cfabwb6GgdUHc9iyQMZ/fUE8vZp7VHdt8Iv6tfVWa4oQsaX4abhIofy1oomQ48oiOT2r
         IzzoJ9dvg+Twj22ek6+CrF3Xxd2FfsOII5Qg3e/0h2BPpJpA07WTmg8Qs3jkGOE7DDEn
         wkcgozgkHh5JkdLE7bsytWogALNFpN1isuK29JhT/tzD42LqJorUVAszxEbUm4dzyqVo
         U+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcKU+aMBqyIYuEOYFaCKkTAKVy2HHwvTmofGWtH3lUVvyHw2gkEQgmgccwUO1+SaIsxWOKCOgusl8bYVqwWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg1g3Bp2MosoXovhekZk9rH33VZyJiOPtQ+Uurp2xmXTD6lqR7
	veP2MTQy/69KTz4OyGC+6OP0MlFOjICmx1mrwoTZpy8ziQXASI/xpvg5ojH/ZHpQi99g8BROQk2
	HF4TQBhtOD8zzFf0cr2wNyaBfloZlUmgmEtuYqA==
X-Gm-Gg: ASbGncv/NvMEYS30urGMLM/5ebc37RnUJ321eZxJus6Vy2CVDRiN7dfyuEC1mev+vQf
	5bjX/RDfPoTTItwhIVtpwzwHWGkfb4XJihN6zCFM5wxkdMu1PFU5dzInEDDQbouWjly6BTv01Lu
	OOrLRnJARMH6uvdqWgdzyQwg==
X-Google-Smtp-Source: AGHT+IFwAAfaAAzhBH2j7GeY25vZiQ/zwPAChqOV+UPITlwOewIZwKKaiN+msHLAb3VJXQqUL+3/Bv4el3h6PxyLHRE=
X-Received: by 2002:a2e:ab0c:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-31049509fd6mr47883131fa.0.1744703156150; Tue, 15 Apr 2025
 00:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:45:45 +0200
X-Gm-Features: ATxdqUH5lAyNEtt8NGqYFFPuzudR5N372Pir1OcHVfPuTb8kB94RThH28hJgscw
Message-ID: <CACRpkdajcn9XCy1L=EKEodTQRnaWqe3zdD4+dmt7rBoKS_n=Bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix the invalid conditions
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004557_896485_5740380F 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

On Sat, Mar 29, 2025 at 3:45=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> The variable count_reg_names is defined as an int type and cannot be
> directly compared to an unsigned int. To resolve this issue,
> first verify the correctness of count_reg_names.
>
> https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.came=
l@mediatek.com/T/
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

