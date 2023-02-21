Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFAC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfybcSb/k8uIiyikSufepDJldHy41XoHgoO+/sM6dlY=; b=eXSNK5Rw3+K1ShXmm48UcMzUv6
	/fK6g5wROo1hGKBOHSpgIhZvOUuIDW1muRAtP5iPJR8YRbSgfiRq4CYlvZnFYzkHT8hbxw2HpbIZb
	r4+J6q+v5nEBjPZhzlh0OkcV4ftDAYin18aYWgz1djX3LfzgRq3z32jpQrDUXotNIliJlcTTk9nMS
	SLve98SbHPzqbk/OgVx+R0MoyDVU+V7DybSwwMLxquQpRvYAfGg52AJ4RJtPRFEVrkYkGMA2O+cr6
	Ir8WnjmMJdijlgsJl8FP3XVLxGvsBdNizONn6ZDoNc1ndrAsTTzjfi4ynBI0Z/P0MOpGHc3b02Q8o
	KlwLRnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMjD-006opq-Jk; Tue, 21 Feb 2023 07:06:19 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMiz-006ojc-9I
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 07:06:06 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id bi7so1821704vkb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfybcSb/k8uIiyikSufepDJldHy41XoHgoO+/sM6dlY=;
        b=PjEF9BF/+eykiRu2kO6/TCvD01SBcFkKc9j20k4sfYekcZVrutoP8IFZUCGdB9iqx7
         bICgnB+63J6vfGJF16SIv3+jX5na0D4+O3vtQjAST44cXmb8hnJFLnlzEIx5iAr4DMXH
         AsB5OMOLiP0jCQ/62WHG/8x43XNyho2u/AJEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfybcSb/k8uIiyikSufepDJldHy41XoHgoO+/sM6dlY=;
        b=ja1OqjAH1ZhJdm3ZhUX345VWZDpLbl0wzX9LYbUYQsmA5BYm2XgJl3WAKnL/T5cbXt
         35GV6gNXqWBelT5EnNGal0a0DafxtwD2MslXqCFep61k8emGBRcUC2Q00m18DpinFzeR
         bQAdnFEMbrgwf5UosbJKhdYnybqM/eHjCjsZtxVdoLo2x2Ys6/mTw/BUwu+q4vjuUaI+
         qJSzmVCJXPpz/gooquwogil1PzqNs+lCgni296p//MFF3Vt96u21mJ9m+l1DmxN633nZ
         I2gpKiqZOMB8jfaZmJc3aeIyExrowQ6SwPzl07lYvf0mtSLhC7+vcWR3F8ugSYUZr/ve
         4FAg==
X-Gm-Message-State: AO0yUKXWm0XMkGDzd3ahguauTdbdH1cQnP1MPQuXGMcVIh0jWKfC705j
	tm6Er4StQYbvxx/8CW1bkxryxqJn7vc1Jj21al0Wpg==
X-Google-Smtp-Source: AK7set+OnPrFCVbikFqpSUdTza5B84fPwn8b4qF59+su/dSBE/FEN2fpy0kFxRLk+tGKHBcTmLfJbqS7LLzLUXVtXNA=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr880354vke.18.1676963162332;
 Mon, 20 Feb 2023 23:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com> <20230216130021.64875-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230216130021.64875-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 15:05:51 +0800
Message-ID: <CAGXv+5Ea6RiCqiAvs-mmmX2gNrB9ZdXDGnO8NXVkjFe2avpXFA@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE()
 to allow auto-load
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, jason-jh.lin@mediatek.com, chunkuang.hu@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_230605_343272_3FB6D046 
X-CRM114-Status: UNSURE (   6.54  )
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

On Thu, Feb 16, 2023 at 9:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Allow module auto-loading by adding a MODULE_DEVICE_TABLE for
> of_match_mmsys.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

