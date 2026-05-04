Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83ECD3427
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gq053oVtS3TSD7VktC6VEOO7yzt0A6zW/Lb6qaxVL7A=; b=oflZwgyBh3F287ur68FV5Coql7
	wt997qR0FksjOrwo68tmblVbO9UjaRSAU9XzYblYrVV1LrPKtJI6p/VgSnrIiRxf2k9j9P21kpm4V
	xqOdGz31EieFQFF1xDJVPipbzuCEwtWqVLsYSKQTdfk1EcpdomnQVNtVG8EHTQQ7d9oXwnme5kwco
	8wOdCHWobic9iRmDdtLLxP2gxVdalTnQKR3GII7xhVGhgpbCuuWe4GwjBIwnB9EDgAwtR+DCoC4lJ
	UemQymn3Pn2PkYmGZ96+A5NKm5fm5zSjYWzMjGFiyWv7vSBp7BZBZzJIropEcT4encez5Rf49yZ2+
	PeeXKYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJy33-0000000E0MM-3hQQ;
	Mon, 04 May 2026 18:29:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJy32-0000000E0Ld-2XSe
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 18:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F179B60126
	for <linux-mediatek@lists.infradead.org>; Mon,  4 May 2026 18:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A855AC2BCF5
	for <linux-mediatek@lists.infradead.org>; Mon,  4 May 2026 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919379;
	bh=Gq053oVtS3TSD7VktC6VEOO7yzt0A6zW/Lb6qaxVL7A=;
	h=From:Date:Subject:To:Cc:From;
	b=ZudSxXKS3ircpSE1ecMi5elvVnpO+4fhxoiL7TKkKcF6bxP9ZIaobtlyvleAUCZhj
	 G4VPGHdRM9E7tn65F21TFduYaDTR0sWi/IDSZQC4Ags5/Vbl3TGVe6b0SjtOt3EaCk
	 z6rb+Dik7YQTDqVwB7e30mtzRP+AVNpWp8tt6cYidicy4IVP8SvTT1dyw7+2aLbFq3
	 iCFGTaF4GrPZ9PpXh7hHDOVa3LtEGeeeJj5zxbaqyG7h1zjLCJmU2c3KfGGqptXYJr
	 zwosDSBJLrab44dQ2j1NIRvz2KZuoJwXQpWknasEfmz8orkG4TsH/Fz87+tzNn454N
	 2zYnvwB6/ugtw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so5881543e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2026 11:29:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+SRnsbgV/tkRj+ogJLiiUDyIzu7JvsSRdsPQqKk3R8okUogUF
	mjdCLBP4PmAFVsl+AyDAattQDaUH8k5/GbFaolIr2TIxUaqwh4jDP7pTd9gB3DfbbaHRnp4nZ0Z
	w+UGkjRMmOAL6xXXmrPCOTdqnYjSgaos=
X-Received: by 2002:a05:6512:1251:b0:5a8:5ca8:7f72 with SMTP id
 2adb3069b0e04-5a862ebb68emr3363288e87.4.1777919378367; Mon, 04 May 2026
 11:29:38 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 4 May 2026 20:29:27 +0200
X-Gmail-Original-Message-ID: <CAD++jL=GZ3x_pWZ6xYUHH_OFuA0Dyzw2E5ACvo=XDWs66BCeGA@mail.gmail.com>
X-Gm-Features: AVHnY4IuAq5c4lNKdZLiGmzZmHmfV4Bry4dlrtHayxO3--O9zWJ9-sV2BDvEaow
Message-ID: <CAD++jL=GZ3x_pWZ6xYUHH_OFuA0Dyzw2E5ACvo=XDWs66BCeGA@mail.gmail.com>
Subject: Extension of Airoha MAINTAINERS
To: "moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, abelloni@kernel.org
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

Hi Airoha people,

I have asked Christian Marangi (ansuel) to send a patch adding
himself and Lorenzo Biaconi as co-maintainers of the ARM Airoha
sub-architecture. I'm doing this as SoC co-maintainer.

Please take the platform out of "S: Odd fixes" at the same time.
There are clearly people interested in maintaining it.

Maybe a good way of working is for Christian/ansuel to accumulate
patches and then send per pull request to the Mediatek maintainers
since the platforms are so related?

It would be advisible for Christian to include his own Airoha tree
into linux-next so they all get tested before getting pulled to the
Mediatek tree.

This is being asked because Airoha patches were reportedly missed
from the 7.1 merge window and while such things happen, I think this
will oil up the process going forward.

Yours,
Linus Walleij

