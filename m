Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA999C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcVjTGn7kbtsskUzpli5enhaWEJ97X0D7MTunymKgDA=; b=pjexOvqrmKwCt2iEs5Ykemw2WK
	3khEmDaVa5CwllPABb0xcMJcFXQMtSpihkUbxL2VBKnxoirXkt/JM44adj0WEOKDeTfEqqgIYOnbz
	wyI4OCHRHy0/q6x0kBfErEpu6ND3a6ZnLT5awCTP+ngr38jb/q+yOGVoDA4/IS9vtfCwVYQjtNz6u
	BRmurXBwVRFTZBH9iwT5cczcHmraAboIrr0m5rHMGqa9YoOaAVPQIaMmA6cahri2AbzOAlA9BBjJz
	fcTuubuMgmJVgsc1jrgABPCe59qChj6C34X1Rkt2ha7f3n9bPYylTh3VZDeEsrLaaAUhfLDkkYbmu
	2+koVkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP23k-008pNz-T5; Fri, 19 Aug 2022 13:29:12 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP23W-008pDU-Jb
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 13:29:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id e21so827714edc.7
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EcVjTGn7kbtsskUzpli5enhaWEJ97X0D7MTunymKgDA=;
        b=EFINGNzLMYGWNtRBOvem2NfAjEGK5CsDlouqgDIseNqvAWaE/67j8+xZEQr5fzwv50
         50O6DLABl/kbDSCNvLyErR7bNIUV7/S6PM5SuRZMqq8otAu0mRiY7BDFSa/U5ZLJ5eOP
         UgNDmX4snUTIH3fPqVyJdhA0C4d1pM2cfBFr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EcVjTGn7kbtsskUzpli5enhaWEJ97X0D7MTunymKgDA=;
        b=gfu9lJpOO1rqREBUuhiQofP3+LwG/lT5oSigUYYNiiCF+mrfzRa54XPQXfysg/Vsnc
         lCXt7oQSnQ4i0Hr7L4bXXrGz04X6zHouV7i0ZwTiEuERY5CoCuWjRPGEl0j2w6cIFx68
         JnCdL6eXkSXkZeD3AEL3lV6wXcQU5WW9En1nPiVERn25xn+96bKrnHh5yrUrUlAwMPVu
         q2Di2KnX4YBgADd+ktd2aCGj3OOOCkMX2stkPWxt095R2FSGdIE4puxs6CfD+IBalm1D
         TWur8kXSToT65CJOJbgoiAQ8edymEsPhz1HaHyR46tTgROwIM86CzGUgFoOfSVAcf8nk
         jIEw==
X-Gm-Message-State: ACgBeo3yxS7CxwthM/1jbe0ggdIyyc9mHUJ6LsoxuHI1xBcNyN6zbhll
	Sv/IKTGQ+YtuNwdox6uBdeijfc2alhiQZJx/K+3MEQ==
X-Google-Smtp-Source: AA6agR6NNo/OKhYHbs8DSbr0gfcQjweYTiRfMZ2zqaMVE6pXULEaWlXjNBLUMXZGbGHalj/+4CUprSImapqjpNaobAo=
X-Received: by 2002:a05:6402:4029:b0:443:a5f5:5324 with SMTP id
 d41-20020a056402402900b00443a5f55324mr6289038eda.51.1660915735800; Fri, 19
 Aug 2022 06:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 19 Aug 2022 21:28:44 +0800
Message-ID: <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state,
 reset callbacks
To: chunkuang.hu@kernel.org
Cc: jitao.shi@mediatek.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, airlied@linux.ie, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	xinlei.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_062858_657934_4139398F 
X-CRM114-Status: GOOD (  18.05  )
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

On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
>
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
>
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This patch is now needed on top of v6.0-rc1, otherwise booting will
stall for a while waiting for display vblank, which never happens
because the DSI pipeline is not configured correctly.

ChenYu

> ---
>
> Note: The commit that has been mentioned in the Fixes tag should
>       *not* have my Reviewed-by tag, as the author changed it but
>       erroneously retained the tag that I had released for an
>       earlier version of that commit (which was fine, but the new
>       version broke mtk_dsi!).
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 9cc406e1eee1..5b624e0f5b0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>         .attach = mtk_dsi_bridge_attach,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_disable = mtk_dsi_bridge_atomic_disable,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>         .atomic_enable = mtk_dsi_bridge_atomic_enable,
>         .atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>         .atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>         .mode_set = mtk_dsi_bridge_mode_set,
>  };
>
> --
> 2.35.1
>

