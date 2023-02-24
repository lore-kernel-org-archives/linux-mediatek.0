Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBACC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NP+TQ3vF7pcinlUFi6f+VP0D/VnVl3SCasWI8iXNvq0=; b=Mxi+tmUcv0nnOgZP6XEiX7UiM2
	GDcz+/1vn4g/UjXTH1+8c0VS5zrio9+kUTs1LaZmEKvXQoa9+kaCCavWWrISOfLA9RBqE3DkZLTB+
	+bBG9Am8wUbj8UufDG3ZuzBS8X8tNLQfTKWP97cjLdmVKrFk6Pbr5YO5ixOzGMhfwy1SQkfisTdEC
	bWz3jRK+EktEndf2ibQMafWgMShaUggMf5BmBqNO3J3McS4fbmk/k5AxYkAmDPx5hNu+skLEt5T8L
	EcvCXDWEidvQnZKDlku43Jiihcd9kvuBPniwxfkcWTyHK3my/MvtZT0XTrJ76sR45gLFVJ2kMmLhU
	xxsglquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUzS-001swI-0A; Fri, 24 Feb 2023 10:07:46 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUyX-001sWC-R2
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:06:51 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id a3so7700406vsi.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NP+TQ3vF7pcinlUFi6f+VP0D/VnVl3SCasWI8iXNvq0=;
        b=KzZ5FxXVT0djdApbCtHaE9KS4cMeCjftQ8c/GWwrWv1pIJR9tM3qJz2xBCtpWaN+Bs
         sE3RYtSLvumAu27LZfjCtQaAUeim8VIqQpug9Ya/Lu1xm3WLaAW/4FkZ84BZlUGVpaRk
         Gjaj3AONrbUsaowofBD5mee67ynkPkRsuKKBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP+TQ3vF7pcinlUFi6f+VP0D/VnVl3SCasWI8iXNvq0=;
        b=QCVm+T//F2Ed3EyzhOS9Z2Gvu5Z3OYg0dwZx3A1DR7mYZBth5zGxnboIxpw6mS6fTx
         bP9dbxRqXnRAhu5ELwBOQmGJN6DAbbYFCz6hDyVmNq+B91cS9aEV4dTjvhhXNGuSMAqt
         sgDgdD/sjabI6agSX/TpXldAJ6FMnD0d1OE3gyqA3KKjNuw3ei6US7LRKq8q+4T/j+uw
         cqmQ8ibG4OV7QLhkYOcJXtNrlEecVAykWGZGzcmp59kIea9PIqIEVMFwkwnynb1jw0hT
         JobKNgzBnul6E7P6H1tsnjUFW1dOc/iqWCSEi88b2TreRPzhWU5lr96CUIB7zrAjp8zc
         6JgQ==
X-Gm-Message-State: AO0yUKW5vw1pCZ7oCiUs0aUYsOrfF0nxRB0zxxAP0N7QU21IvqF4p/7y
	PgWoKeJRxLBFnEn/MGw7pMKGFVOwzQWxGBa6WVgKFA==
X-Google-Smtp-Source: AK7set81B6fbTOsk9gsG+fgNxGLa95H8zl0o1rhuh9Qq74RmfTqPLTa8b5jt7B5yFcT3UXrYEcLMEONRH8yre0k6t6E=
X-Received: by 2002:a67:c584:0:b0:41f:641c:f775 with SMTP id
 h4-20020a67c584000000b0041f641cf775mr331464vsk.3.1677233208519; Fri, 24 Feb
 2023 02:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:06:37 +0800
Message-ID: <CAGXv+5Fds=fxBff8T+scj+GHZEF3YAHwNturkr1nJfWoWDOmyA@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] drm/panfrost: Increase MAX_PM_DOMAINS to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020649_912930_76693C29 
X-CRM114-Status: UNSURE (   7.43  )
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

On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

