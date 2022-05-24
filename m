Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gUQdxD50EyBTDIUbIvsv3UxPlBo6IIhJX/Wvv91/1s=; b=0b1cS7dfAOXImf
	o4nW93lrN0G7stzI+APSu3jZIcmv3B2LnKWUECcOhmyrEqpFI3WfnEnEMHZVg9UxHZaMYoX/UBJpo
	h5T25GOLF7Jj9bDHA9aR68+KH+0Ae4kZLiIbWfJ1FFIlRDOzk/diyAtxsG00oCH6doXOhG2ccQKTX
	007XU/wglO5+4BlSquKaDP4k+5zJ0CsdJkJKXyZjQdMKOQlLTVo/7NVCQuw0azwkVBFPG43bSaOvj
	b2rJ6h7JYCv8r73dBp2ETTtjWpGTGrawQEAnU0tz4jUq8pFHHgrp0n4Ao0A8PgoCyrpYRQscXWu6f
	ajxFhF49WBSb2t++FOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntNzQ-006wFH-RS; Tue, 24 May 2022 06:25:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntNzN-006wE9-1U
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 06:25:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id q21so13014769ejm.1
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 23:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D6CrZTvd23rvlgUVmBlktvH0Lw16RsXxIKRFjL+U34c=;
 b=QXnt/DwtsuMT9HJBssgL3VJNo9GWJaQqQaVDMl+s0Hm2bPiuqcNnZn5lqx/D2ev8x1
 0nb13D8QWy4GI9MsPHyK3mU6aaMU8vWqc5TO1yb9nZahDepktJeY87rv784dh5+WqCmK
 lsJiDsyIY3gmrrz2qzfxCih9mP5ndvlImauw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6CrZTvd23rvlgUVmBlktvH0Lw16RsXxIKRFjL+U34c=;
 b=ESIQKJ7l/lIMgsG3yhGZD4y3vxERw3lwxfE9eL1XwnECcukKYCZoqSlGvsDpDzOKrz
 g+PUXXIJowJWWtk/2sbbOipnM4hBueL0aLUvz9M3jQO20N3ky7hAAoh5U1aK1sshGHKH
 Dz91M+a+oU7a7typJ7XjMrRewa+vYxmtQ3JRdr9xpwR/gbPei9N4rI7xO2IjfT3IEqz3
 dQspe/AG3SsOAEDP/T/3ULli3+5HwxkGTwv7uCaoPfYkpAOsxRcJBK+E2oxYvgP/t2gu
 U5wQhCl1BkrT/+QzSDlZSiIUEWSicb2w4VC4sB9UCIAhsUnz2aWCq8s8jSwn8kZ6ZxcN
 2Hjw==
X-Gm-Message-State: AOAM5318dYpFbEwe9mLBRBUFLrrf5LdnGJq5R5Pvke+IWSApfCFrdQzX
 7kvNqmRxZVR9r+ffU6mpqJB8Pf+i92p0DSt3R0mwcw==
X-Google-Smtp-Source: ABdhPJyJ4eZQIwLnHC81UPge6C/F40nOdAKPI+hfZ0h+dhfs8oDDZ0QMG8iJQXX0hFsf5XrQuRjqGuQCwPKXFrhXFIA=
X-Received: by 2002:a17:907:9717:b0:6fe:b4cd:e0a with SMTP id
 jg23-20020a170907971700b006feb4cd0e0amr16054099ejc.152.1653373549810; Mon, 23
 May 2022 23:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220523160053.1922-1-miles.chen@mediatek.com>
 <20220523160053.1922-9-miles.chen@mediatek.com>
In-Reply-To: <20220523160053.1922-9-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 May 2022 14:25:38 +0800
Message-ID: <CAGXv+5Gswa7UWD-P3SwMFOHpRbZ+d10z3Aerh=zMbNXzfyA0tg@mail.gmail.com>
Subject: Re: [PATCH 8/8] clk: mediatek: mt8192: add mtk_clk_simple_remove
To: Miles Chen <miles.chen@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_232553_143368_2CE9177D 
X-CRM114-Status: UNSURE (   8.96  )
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

On Tue, May 24, 2022 at 12:01 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> mt8192 is already using mtk_clk_simple_probe,
> but not mtk_clk_simple_remove.
>
> Let's add mtk_clk_simple_remove for mt8192.
>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
