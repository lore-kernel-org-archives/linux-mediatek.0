Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0CagsenirHtD0V7pzk/2SagtAsB8jLbaEiCDTbaJqU=; b=4mHKrbIH9j3pSr
	XLcilDVT8lNT7EDo4wi3a6w0THvZg8NnBSJWLZ6kaKTT22ICOHOwg0ZfykLeoif9lwdhAw9Wxhzei
	mqm7GzJ8+jJcCeVO4laGShvWKS7rheFcM4gQBIJJHxD+3SJElU0AJHxPfmnzQwjz3Tx9WBzR7Wq0h
	vtQEnepZf1KeNnrJxTnDt5NuRsBRujad3UszL4pXfjZjbHD8xDpZ4A/Bc9yKlUvn/2P6TgJGxLqc9
	RatXqQ2W0qKZ/zWkmFMrJGjj+TPoKmv9HJXhnTNiYSBgHIZY7BcTVed0PU33gDVBtsHeKw+u6TfER
	XyQroxeHJrpTc8ZxowNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX1cj-00DqiP-TO; Wed, 23 Mar 2022 14:06:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX1cW-00Dqee-Cn; Wed, 23 Mar 2022 14:05:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7A411CE2080;
 Wed, 23 Mar 2022 14:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FA3C340E9;
 Wed, 23 Mar 2022 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044345;
 bh=1oAteS9kFdrvyEzNGdIhJUXXW3m2qPYEMmS/a468Uzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oAvdrJwwvv0nTDkqjTkFxUBB0Uv5Xs+zarFCEWHugKri/ymW17SYVahPoE5wAK5fM
 FubYzfJjvyJKx3tzHi7m2z9xh1/fYcZEc0nEkGdjqwUVeTPM/GwZysQgjZmeh6hY4p
 x/JfwA/kwpS2UPYH89Qs+2MLo8DJguNBl36zG7zPzaDubIsO23XtHF/N7U1Su9G9KE
 Q6ldUWSTg26zKTJZtBhchqjoiKVw9zwV9rWakuQe4LS5n2uFEJ/VgOb3Re24xhjiKo
 8Loh6fooVwyMU2w5mZEiuCST/IF08ylTShDUI/xLwbnG04nbLjNySVNpg00aaFuZxM
 5KQ5KAGudir1A==
Received: by mail-ej1-f49.google.com with SMTP id o10so3096553ejd.1;
 Wed, 23 Mar 2022 07:05:45 -0700 (PDT)
X-Gm-Message-State: AOAM531GvAk/VPN1zHBQZwYGHLUCU0RuwpFwbu8HFCMp93sU1Yh9qy8C
 gDTVSC9wnExDK6/c9VPzmmHBe1cXpgQOxj1Hvw==
X-Google-Smtp-Source: ABdhPJy7E6vyxf070rK6ZOCxsK5AWkoUKOUi1IbGT0yD0nul4jRGmi2hr2Mpc0tM9FE9EBpY85DFp3LmxDC9L4QwWts=
X-Received: by 2002:a17:907:1c1b:b0:6e0:6618:8ac with SMTP id
 nc27-20020a1709071c1b00b006e0661808acmr137550ejc.82.1648044344180; Wed, 23
 Mar 2022 07:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220301233501.2110047-1-robh@kernel.org>
In-Reply-To: <20220301233501.2110047-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Mar 2022 09:05:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKs=00e_XdO4W0oML6DVrhR3CsSTD+Cfamcx52i=DAE9g@mail.gmail.com>
Message-ID: <CAL_JsqKs=00e_XdO4W0oML6DVrhR3CsSTD+Cfamcx52i=DAE9g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: mediatek,
 vcodec: Fix addressing cell sizes
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_070552_621019_E418AB05 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 1, 2022 at 5:35 PM Rob Herring <robh@kernel.org> wrote:
>
> 'dma-ranges' in the example is written for cell sizes of 2 cells, but
> the schema and example specify sizes of 1 cell. As the h/w has a bus
> address of >32-bits, cell sizes of 2 is correct. Update the schema's
> '#address-cells' and '#size-cells' to be 2 and adjust the example
> throughout.
>
> There's no error currently because dtc only checks 'dma-ranges' is a
> correct multiple number of cells (3) and the schema checking is based on
> bracketing of entries.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I noticed the driver is checking 'dma-ranges' itself. That's generally
> wrong as the core code should be configuring bus dma masks
> automatically.
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 122 +++++++++---------
>  1 file changed, 64 insertions(+), 58 deletions(-)

Can this fix be applied for rc1? Still failing in linux-next.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
