Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EFC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTjAP1Oa79bQY5vP296y5F3oGcaiNBrkRdnRZD3ar3c=; b=PZ67MWH5on9ZuwrkxqwxO24yUS
	W5MicAZMJzQs90fp5UWNL8sxtkXDKiV2Kk9DN7ecR/6tAxq2R57MxxyJuR7aghQdrj+DMx4ZI0fCe
	nRJCYL3ZT8hAwSBLi1pXnVbf25weEeOK8TdFuQFSdkoZTZyfoutz0EUnJIU+X55w7HUPlW6RBtf1Y
	h9j5Ly5A9ooXhoW/noFOV27qe9WRF3R19ify4KZr4iiMC6JFP3E0QqUBuiL4sJXm8SqgFknNWrewm
	E6y61aovqdlWQ1wWAeXMaKwwWTbzo7aU+42AWLcwX27PFPUYgMm+0Ymw/xSjnJ20+aq9GXd3i03MR
	woREj49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbSA-0000000AfAv-1vCU;
	Tue, 02 Apr 2024 10:33:18 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbS8-0000000Af9o-00gW
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 10:33:17 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4637302276.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712053990; x=1712658790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTjAP1Oa79bQY5vP296y5F3oGcaiNBrkRdnRZD3ar3c=;
        b=Epj+iA84PkQ+TckSz6+yyAntLaajzMGxEkZdMKQD7/XynHhZMkQbKiBg3A8retMwmS
         3Vh6Ziz3YrH80B8QmwtH1py8oJzVXWD27apaI0YyHjT6ve+CwQgorRFheSRiFEfvlimR
         5q3xGJHVXaBcsD0qCTCpUnGEHlLqjEF2O1xryJgiGAZjiz4nI6ZVxvXNYR9b1tf84GTB
         sqCrU+EkiUw/GftgrfrWsYBSWvHxS99c0c9She+fDfO3SMAf07ZmCU526ZVx48PMFjQg
         ac1pFFWJb//JrmA+C35vCtqsxpRN4FkuxYjC6Pd4ue+8n3BTlOezE6/3FOW6rfJ29Ee/
         SuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712053990; x=1712658790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTjAP1Oa79bQY5vP296y5F3oGcaiNBrkRdnRZD3ar3c=;
        b=PxmhyyhX3c1NgZnkSHKkqtcSLKWi9qH+IBz8E2Bm7fAVbms6qw5+V7jgCwIx0C4FKP
         ljVtu5bMh+3+ES6hZP9p1ZoY+B3PWzDNeBxTwp3SW4fyFEzSgDXL+31Fp8piLELRQYGZ
         9yYhjpj+dO32S1UH9iANH3rm6jWbrAj7mqLojbk/5nuqIBMQZjxws6J2O/vpDOMnKqWG
         s/jQ9Q5F6pwe3l1aoodVJMXystQuocXDr9Kvy+xMDLsGEHAw/zHeYpi/jgwmEsLlFp/T
         V9K0wHuGT9fNbmkRNYCy3kg4bdoL9jPsLZwIYLOlGC+LThO0vLoFhYcjKj5qrV8IzP7w
         9lTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOGM9ST3oifJf+ohFi/3oFx+w7Xbuhsf0+HRoVLrQtt7jOuq19+FyftHNPIqiqNmhEF4pzVuXJm+4NND7kSlLACGV4gMyougtEXFVV9QIrxv8+
X-Gm-Message-State: AOJu0YzEyh5/xHQLVqArd1t4ZxkOLEvy7aUDmQRbpfIHzOLJfVNx5JGk
	fbwijCXxLlI0R+pTlVxNY0fBQfyZHojPL2DFKl7VEiZDtS1XJ7MeFGtJi7Oelbl1Yp8AbD5xpHC
	mkZuTJ7fMR7DvoLHCtSr7X14XciG0NNfS3YmncQ==
X-Google-Smtp-Source: AGHT+IElYHGm6fwXhBEqIk71kCbbQLnWRlQW5xHkW2oi+F/hIWeOy7TrU7S6sLaD7XQSTD+RZgjjCe8le7UVlrObhE8=
X-Received: by 2002:a25:2688:0:b0:dcc:3a3:9150 with SMTP id
 m130-20020a252688000000b00dcc03a39150mr10863236ybm.22.1712053989458; Tue, 02
 Apr 2024 03:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231222022741.8223-1-boy.wu@mediatek.com>
In-Reply-To: <20231222022741.8223-1-boy.wu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 12:32:58 +0200
Message-ID: <CACRpkdZJpoHZ9DwV4R5NBSDXTwVjWVU7a1_qh8tHCtxPWPMTnw@mail.gmail.com>
Subject: Re: [PATCH] arm: kasan: clear stale stack poison
To: "boy.wu" <boy.wu@mediatek.com>
Cc: Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_033316_109199_E4B47717 
X-CRM114-Status: GOOD (  10.04  )
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

On Fri, Dec 22, 2023 at 3:28=E2=80=AFAM boy.wu <boy.wu@mediatek.com> wrote:

> From: Boy Wu <boy.wu@mediatek.com>
>
> We found below OOB crash:
(...)
> We find the root cause of this OOB is that arm does not clear stale stack
> poison in the case of cpuidle.
>
> This patch refer to arch/arm64/kernel/sleep.S to resolve this issue.
>
> Signed-off-by: Boy Wu <boy.wu@mediatek.com>

With the commit context pointed out by Mark Rutland:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

