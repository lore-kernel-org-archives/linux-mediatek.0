Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D92CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 05:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2kO8pgMtBzZNlbzXFL36B4N197Fi4UW0BCO8fu4xqw=; b=NfyJDPzTN2Uau67o04IviIC2I1
	Y2apeJETss3CZsSx8e1oztC+tQajfu1En4xyqEP745OAmfW4heQ0uuep+EwCNobLwOtMKIv8uumg3
	D1Ne3sH1KBcXdLNqcdpfy3uQyygf+wLtpWfM9/2QravgnTUCesEXgdtXxK6ctPbomgVC95wcdwY50
	DA84zQG5DmKEVD9EhHJ0NQSW1i6FPSLwRh/lizvxZxKLVUem4bP7Tx3IE7Fy2v6qRP5ZLSCkc1Saq
	7A9KsmNCAgbFuG5PK9QSwzT7mTiz337FEvSc6Wszqpz8M70OSRZ72fo3eKkhY7S8DNyhbkUa9G8hm
	csS7H5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7sf-005wCI-QW; Fri, 30 Dec 2022 05:24:33 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7sC-005vzl-Tp
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 05:24:06 +0000
Received: by mail-vs1-xe35.google.com with SMTP id x65so6875128vsb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 21:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2kO8pgMtBzZNlbzXFL36B4N197Fi4UW0BCO8fu4xqw=;
        b=Jl6Crh7Mm8B+2BMASpdiBuOTVnQhVFGCt9wvg6YWVF8Sn+/cS2kn+Qjmt1syT0QYVO
         vphIcYXev2LxGuz2zpb9Ea9eYlVyi5e94+rLvxxA2ltlA98SH9EnW2pGRYFziKBsiSyi
         18xo3AUt8+af1atgoRPWyHq/iyretmjX6m+zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2kO8pgMtBzZNlbzXFL36B4N197Fi4UW0BCO8fu4xqw=;
        b=g3nHHFAsVwuuTD9FD4CGYN56pi4KSZf1iqVqQsH996jsi5vLU6DACueP3kVpfcwLMm
         OBzwzOqQW5SHYkc1G9ZNlEmfHE5R6+tJXhPYHGEkyApIuelpwtSWOeA8Tb6KoOCtGI/e
         g8iODNnMvSlElm4xMrU/A8pIKj8oHlHkrn/Ji0BxcrJJklbUwigpo9tfV7Kg2XLun0zN
         /W24f6Qs0OLpM1KE8fzfv38gd/v2dPGcGWPPQ6QWmDsirtg6XNpbYL91ueVkf7nBenUI
         +NoZ1pLufS0Yh54BHZAOXcRpfwCTTxRVFKkIjISAi5mfPtG7Y7Vnbao+sAre9DSqDxVr
         PNVQ==
X-Gm-Message-State: AFqh2kqR2Gc5/vTW786K3t7nXwfQ+ncTZJYuH4uP9WePfOoAJsk/PJPI
	A/2YRvcRqcHfo4jbYi5V3ozXDRiSzdHb8bx1T8o3Vw==
X-Google-Smtp-Source: AMrXdXsNEPEEDbmMNdTXQ66dzte31fV01YoUyu4VK+PpkfRFqDEmbhNsYqdkXtoVcZvmwH1OYa9y0JeRg/5FrrgR4TQ=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2641293vsv.9.1672377843567; Thu, 29 Dec
 2022 21:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-23-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 13:23:52 +0800
Message-ID: <CAGXv+5GcBCrHRUJHZG1XAXbh+BJxGnuYSbF-QgPY6Sh5nPEt1A@mail.gmail.com>
Subject: Re: [PATCH v2 22/23] clk: mediatek: clk-mt7986-topckgen: Properly
 keep some clocks enabled
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_212405_095434_91BA0057 
X-CRM114-Status: UNSURE (   7.88  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() on a bunch of clocks at probe
> time, set the CLK_IS_CRITICAL flag to the same as these are required
> to be always on, and this is the right way of achieving that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

