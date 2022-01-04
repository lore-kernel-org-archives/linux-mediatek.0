Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8948C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kigu4z/xo/9W31czQPfKGC5AQbTSMHM7iHVOl+Vp3VM=; b=nGBmTTOmmKHYY2
	h1fU7C2/DbvfllKDR+Q4zGLp6Mlri0kAQG03yAkznt6fJYz9Nvpuz6yMtcaqOKGlB4iJ3mJTDKLTn
	zr8z7ChHvVZDR6NoEvUJDxRd11P7/a6rTK3e0A6YGtdusIgJbN9TH+Go8E72a3xzKOEAd54fUtgfU
	TOb1MPyYaz81Goscw7oN9YuT0Mjl58OKydxmlgWK9+Xi7YLw+22CiOxMK6xYXCovmmA9I/EaB+JPf
	hhLFh9kqNGQVNFShH1mRareD7oHhZvi6SKQAC3+re8K6fumEgotW6dEmtmoW/QUguZLqP/GX27thU
	Ky1Z4vsd/qO+6eaSHjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4eRU-00AX5o-6B; Tue, 04 Jan 2022 07:41:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4eRR-00AX4G-Tn
 for linux-mediatek@lists.infradead.org; Tue, 04 Jan 2022 07:41:11 +0000
Received: by mail-lf1-x12a.google.com with SMTP id o12so79959009lfk.1
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Jan 2022 23:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
 b=bt1dpabRFl1fZ8T5SBzU3zX2YrJv3AsPCn9mVTUi72pE9/1bN4aZhW9dpJl33tZaM9
 7iaESPWbHBFnnXArza/MTy3T7FYJJCgiv99Di/U7qTqFZsyAYk/MJuo9oKra72g9vygN
 17jVAOAM3wGl52rn6RtjqDkgFo6TsIUDIPU5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsNGkAuTfXI5FN0re853yKsBlp1/TfiDupH7mdPtEH8=;
 b=AtbIzcjGhNaHgl2jHwj7s31+Vaiu95wfKvMnGR/4+m3aG4qGyP9mH82B9aY7sZ6xtA
 DddHyWfLfOkz9YauKh2yXIjKXynq+98XyQd0TtKoQ1aWZKOo8EuzieUO6mn3aCYifww6
 GhqDNUF30o1Eenliq3PGZFhBlNluEImroMXkyywx8GvkPVtJYVmWf7JxFKbyC/uks6B9
 EXkDFYSKigRurn4m/YcU2v1mjdPAJkIYGyuwd/E5cR9gInh6iOVT7kEBaMdi2By4A/6L
 nRDbV4e3sr45WJj7jxuA4keuvuIyt8XxJhMxd6b48o9k//Oc4oAqPl/RqY+hvh4xYP/I
 TFIw==
X-Gm-Message-State: AOAM530faDX/feo+4RJT8C5emLgvikpK3tGsDck6xJ2Byiw0K8yLJh79
 x/uTGHfcR9OXpr+1DL8AqNMiMv7nqOYB/FET9OhQdA==
X-Google-Smtp-Source: ABdhPJytUCpP+bhk+Y00OMKDkyKKeQaE6cvos2kOI6OSzqWU42kDCIZUSxoTZ5LSAvJPEeULqokCCRGBCTIG3y8Buzo=
X-Received: by 2002:a05:6512:202f:: with SMTP id
 s15mr45046523lfs.501.1641282067147; 
 Mon, 03 Jan 2022 23:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jan 2022 15:40:55 +0800
Message-ID: <CAGXv+5HJSDZe-Ob4jpPcPnsCn=4Pqu=JHz9B4S4hANQF80r2kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: pinctrl-moore: Simplify with
 dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_234110_010314_7EE95792 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
