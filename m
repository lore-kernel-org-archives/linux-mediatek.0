Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63FBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 02:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltJXCegFyxQxBBXU8F8ooPEr0BK+lcdYJkdrUHd++HQ=; b=mOsh540SUDnA3iKvffy7Qbqhy1
	cHxGotAD3zHeQLKQWExB2Ig/ra6NGgIEUG/bnm9excNpp4Yu68iU8xx1BYdHYhH7wk3luQr51yWbp
	HlSGPC0/yfRmuWN/j9+++TX5TPyQirP0ZygZKh/w9ohJUDNFG4GQyqW2M7TNWJvWc/MqNj1v/z9yw
	uejGOrBi4idv2uteWzEVfHY+1FYNgrpR4TjVeHFxFetVokROnaDRhLvhKp7Z1VEtdDaj2cAXFr7U7
	haamTzmEJLeaXHtnzIx+zJC9Tomm5dLU9Te/hIR3L+rRsmkwbG8JHFwLcSeApN8xFn8eNqtP3/s9q
	zmZgqASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMi-003xpW-52; Fri, 10 Feb 2023 02:42:20 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJMW-003xml-VF
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 02:42:10 +0000
Received: by mail-vs1-xe34.google.com with SMTP id p10so4275503vsu.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 18:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ltJXCegFyxQxBBXU8F8ooPEr0BK+lcdYJkdrUHd++HQ=;
        b=WFbOPUT+c7v5lpq3MwmMtjN+FwqFeeOxJmKEDTvdecknTdR5RFl6FU8bpTfPQ6vsyz
         g06nq9sTVTiMVVMU/QgYQm2U7hrQVET3Is1Z3bZTidzvYbn19cO6jj5jR4DErtzwCTwQ
         RYSqlTdXqYpWbgXbWme5CheEai7OnfcprPl1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltJXCegFyxQxBBXU8F8ooPEr0BK+lcdYJkdrUHd++HQ=;
        b=KOIscQdVZ0AJWYQ72lQhsRUmVV8jmTB0/Kn1SNsuxGIKyp4U8jU+elrl3e+T58eOvZ
         LQQqE0hSjvjARosFpxeKWQXz1Au1U9oSQuzsoR3m5Nig1qqddptt/roUFaHRZUzJhgi/
         nL3eG2u+S71yeuyGd0LnF6AH9hNTGLu5+DiqG6Y8/VDPCbU0tRC99YZ3aGnvHH0lTcoL
         56HFzcYxWC8PjQVuUdceuXwZAEceUJ58GEZMvFelVhfVo6Nex33/HyLwvTSnvJsAfnON
         5x+kMb/bOStkoNnIKw5e+h4TfA7/nxQKYD698tNdpoKJfZorB0hN9yvBZUTs/TgAf1dh
         U/Uw==
X-Gm-Message-State: AO0yUKVVbyWHmv95DUzN0OPa2D6rjuMRcx7Wy41lTyIKRo0pTJPc64TY
	z8CtdZLAuQVcKxbqfFNPyoOjec1cZ09CCqd8+ZIM1Q==
X-Google-Smtp-Source: AK7set/7PiJgyHmJjk/TX8Tls2T1YGvpQMaRarIFVi8Si4X3RLkp6SbWn96rOJwrf2bKykCzh1oZynfO0cWAOjJD1DU=
X-Received: by 2002:a67:d28d:0:b0:411:c14a:5bce with SMTP id
 z13-20020a67d28d000000b00411c14a5bcemr1359139vsi.26.1675996925169; Thu, 09
 Feb 2023 18:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Feb 2023 10:41:54 +0800
Message-ID: <CAGXv+5FcK9QbAKxa0TQ22C5iX9AL=zHGKBc9zQdat7CaOLd2+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] arm64: dts: mt8195: Update vdosys compatible
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_184209_075681_532D0E0B 
X-CRM114-Status: UNSURE (   8.08  )
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

On Fri, Feb 10, 2023 at 12:04 AM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> In an effort to fix the vdosys implementation, the compatible has
> changes. Fix the device tree to adhere the binding definition.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

