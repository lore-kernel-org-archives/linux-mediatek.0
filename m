Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B7FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1244q/U/aV4xZqcwopSju4VQY1IPfDobqhAOvWfssA=; b=dilCxjWPUQ/FPFhtmPxIhNeNmS
	mbq2CYP0VUAt+8aoh6MfD357povtUgWHzzBgnHs7wFlKjjOhIzIrdWGqkMCM6IwHdaSik/yim13/n
	knLetHJkIlTws4KLn2aqCyp0fk1UTPfUjqTuzqiDbNR8o5bucC4QzajxY3ik1SAxU2IfTNA+MJwvU
	TPdiv0q+W+7tbXSFD3UPCVqAEBOAlmoIg9LKtTaWkTvH/2VSrO/UkMdodxpI/f4+4RVT9s956bWjN
	OjaJit4h6sXtIcS9OOtZ2hRKNPSG4KXTJDUZJeXbxtHzgsgDtxJxkjHBz1gWAyqw/js5U+rI9mCsK
	s7yXfhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuVC-002Ml2-9m; Mon, 11 Jul 2022 14:35:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuUz-002MeJ-Tw; Mon, 11 Jul 2022 14:34:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96B256103B;
	Mon, 11 Jul 2022 14:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099A8C341D0;
	Mon, 11 Jul 2022 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657550096;
	bh=BfPr1lGxE1jbjl8a2QBj/0+WuY7JwR7vYpOdLGWms+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jKvURwjH1YokH78vUQBfl4K9tGp1uvivl4KEzA1uJwxZh0X2T3pO0Gmp32iOR3Nw8
	 Tgj1qyFRZkseQV1A1SsnMycfHLo/n13IMA490X79FaOy9Jl17f7XbfbTDUOqIp8DVV
	 jt8GDn3xOxWZofALT3Ty/2TfWKU/VG5L7v8n2b3cOngOQjneaRqFLVZqvF91hFAjaU
	 oUhFl/+7iMu1CIhDvVelUkYWKFeiPOy/i/XenApeniAAiaAyNzMpBKg3y+D1ckl8sJ
	 SIJqNp9sOIlou/IetLQd01XHp8K+ISpmYY8oLSRGdyfO1EP2/xcfzNltdCtvMKOzWr
	 WmlEr8TRHKnbQ==
Received: by mail-vk1-f174.google.com with SMTP id g25so1037675vkm.13;
        Mon, 11 Jul 2022 07:34:55 -0700 (PDT)
X-Gm-Message-State: AJIora90Pn0Y4h9rG3sEKOMPSqsR7ktyF35LQkj6JJADfWe4Q8ZsGjtb
	RjqLQYdzXnzqGV9PuOA6QzXvUyu49TlfYDJmYw==
X-Google-Smtp-Source: AGRyM1sn++ZlUgWuTp7oyb/3PdW+mv3fyNFcVHoEbwlabyq3J/yuM6fMBU549T4VLj9nFYJduODWz+doU+d3OwEOSzE=
X-Received: by 2002:a1f:1ec8:0:b0:36c:643a:e985 with SMTP id
 e191-20020a1f1ec8000000b0036c643ae985mr6189642vke.14.1657550094933; Mon, 11
 Jul 2022 07:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220708192605.43351-1-nfraprado@collabora.com>
In-Reply-To: <20220708192605.43351-1-nfraprado@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Jul 2022 08:34:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJPguT+nntX6R7Y6yFnF8CPrQWT0tnEuVSWMs_T7ttp-A@mail.gmail.com>
Message-ID: <CAL_JsqJPguT+nntX6R7Y6yFnF8CPrQWT0tnEuVSWMs_T7ttp-A@mail.gmail.com>
Subject: Re: [PATCH] Revert "dt-bindings: usb: mtk-xhci: Make all clocks required"
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Collabora Kernel ML <kernel@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_073458_039498_4F9D91EB 
X-CRM114-Status: GOOD (  16.63  )
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

On Fri, Jul 8, 2022 at 1:26 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> This reverts commit ebc4969ae125e65fdb563f66f4bfa7aec95f7eb4. That
> commit was supposed to make the binding better reflect the MediaTek XHCI
> hardware block by requiring all clocks to be present. But doing that
> also causes too much noise in the devicetrees, since it requires
> updating old MediaTek DTs to add clock handles for the fixed clocks, and
> going forward every new clock added to the binding would require even
> more updates.
>
> The commit also didn't update the example to match the changes, causing
> additional warnings.
>
> Instead let's keep the clocks optional so that old devicetrees can keep
> omitting the fixed clocks, and we'll just add the clocks as required on
> new DTs.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

