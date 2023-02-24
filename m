Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A85C678DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cOUMETYWPj+3zj+V0LZyGIDXw+UlRgZsHTjIWEqX7c=; b=2cxr3y1gZQHq7+du3sq3h+f7pB
	eot/rT1LVz8hvC7DieiGbxxxteWiBM1XkOtm/FOhJChk5l653xegtmiwK7LlwQ5Hh45yRFyuDJY6Q
	m8yaqIrC10WegdtE9MmvBT+uA1OxcZ/yJdCDfKQxNi9XN7jzMoyxG9k9V8KzjEAtNq9PDpirMQxCT
	Klt/gQRR5g3K33KF643mL+65UNIJVVr8Vp3Oxe00vOD550XNk+cUbJcGYqqEu+wwxaLCqG73GWw34
	T+XUZEs8mXuwb8pe+aqXugVYg8RIQe5Lrw+EkRP0hUTdxLy3HGTk05xZueuYeAZPM+Xtrl499fK6D
	AZntgPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUjc-001knD-DJ; Fri, 24 Feb 2023 09:51:24 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUjX-001kkj-3i
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:51:20 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id f23so20395333vsa.13
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cOUMETYWPj+3zj+V0LZyGIDXw+UlRgZsHTjIWEqX7c=;
        b=OMT/zwGv0rtaA2+O2iliW9lV4XB5TC+1rqUYocI55/ldmQZUOKhPbMapW7AiEsM2pg
         r1fWLwRfGvCc21VrKvUnXrHZ1vgNsAkMkXvSF9hkyjqRwR0hcoS7a+PzlLjTh4W6pAJp
         lOqK3+yXWdtz83RVNOSI3JzNqr64F8a8Mr8B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cOUMETYWPj+3zj+V0LZyGIDXw+UlRgZsHTjIWEqX7c=;
        b=vmpuZsTKFoPNljJIH9gs3fdK81vYYdPldyxIgCbWXFS/D2+Yah2J2accnlNeIHcQGq
         Z11zwBGdEFlBfuGlOTGn5lN+FgamuEVMryilnopIZ1zqd0Q5FzrljyFiIYOxVoLjJ34l
         IvfrgBN5PuWK7u880hTXciFFjIwNY5/Zj332YG8d+v6IIOI8juyvt7d8bXlkstovfAYz
         l8P5j6QhuJomhOshwnpSzQCcBK/0wnyq/7rhsbC2hurtcxjzMxHt5TtQiesWzPZydFiM
         mslwnMLGzmNHECr92g1EpPKpmkCmENZGCOWko1A2g0Q76PkQJnN6sMxWiaz9rJwAQdZu
         5aCQ==
X-Gm-Message-State: AO0yUKUUNwajnO3qTQr6iHKzkvaQU9Fom4g54ryTaDsk01QB1KSDMTHH
	Px2Q3CQYzUZL/DHQGgHMAK9mBeMtUE261cAYSoC7Rw==
X-Google-Smtp-Source: AK7set/xJ8xCePXsC2JlZPb6XO+wk7EFsOgwgVrZbRKYzXiRy2pllaTaIQHKfgnaTfJvc+Dy3pyqED+k3tlyKGtms38=
X-Received: by 2002:a05:6102:3d16:b0:412:d91:5ef5 with SMTP id
 i22-20020a0561023d1600b004120d915ef5mr2576584vsv.0.1677232277889; Fri, 24 Feb
 2023 01:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:51:06 +0800
Message-ID: <CAGXv+5FzzosPhBNFyWu2U8ZBeUg8fHSvEy57LL4gduy6=GOj3Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] arm64: dts: mediatek: mt8183: Remove second
 opp-microvolt entries from gpu table
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015119_185097_5F4AC40B 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This was done to keep a strict relation between VSRAM and VGPU, but
> it never worked: now we're doing it transparently with the new
> mediatek-regulator-coupler driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

