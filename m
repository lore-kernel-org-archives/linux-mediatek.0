Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUAm0dza/a6VVYw+sGcsIq5PuVfxpu3iI76RDCW26E8=; b=HQ8xWlI8U6x6giF+oUjl23daMa
	sC/9HJcKaEJVK6Duo1JJ7r22ugExdjdXtlk+HVQaOv+dmk7D+C0/MEk/TFFA5U6IESE1AvYm+Y6od
	NMxhNQNspnt28fHVOiFSqREdxtN3QjDEUchnKRVWCp7bDjcVEu3DSlOQ+sE/Pgvz+GT226PaxVgk8
	9BxXGo4GDpAWM7rY6SN4dld6MDMHQ02lNNA6Ts6UHWch/SusCes01UcXv13ncFB4QvwBr7hnyCrN8
	f3YkFVOMA8KxxWaiR/4dxFF4uN3s9FSn7VsKUjby6rzpSFKTy4cHXr+JNTtIkYLGMReF7d0Upl0kF
	FrcUhTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZAa-008tjX-5A; Thu, 16 Feb 2023 07:59:08 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZAP-008tgQ-9H
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 07:58:59 +0000
Received: by mail-vk1-xa29.google.com with SMTP id a12so785215vkl.8
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 23:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUAm0dza/a6VVYw+sGcsIq5PuVfxpu3iI76RDCW26E8=;
        b=HDYgFSVUxfgi3rCp8OiA59w7Jsp+KNJ9d7STmmepYo4ATncHuUaxhCcTe7M0eiwJRB
         0PtBt7EozjJRRZYwZ7Gm5UXoatYhX8+alm2niPrCGSIlkCbVNNk9gR7ghW2gyY13zxsI
         HOSr4j/WI8GyxZNU360jMLYBGMR3Ee3toaVNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUAm0dza/a6VVYw+sGcsIq5PuVfxpu3iI76RDCW26E8=;
        b=GkTklAozsjjQwD9DZ7gpuF7/9S/9yqZTbTqts8J0DqM4B8+D+dO6cSpWrRUV/uPYMJ
         rUjWq8DRrVw8P3sbfGLu/cKMBGXLKMfF/y/dnPhzzubDWHPMv7pqsxiNApJvXoXzK5dI
         4EvDAerXr2t7h6yXYD1PyE29o3wMvFl6ogMf0zYHIzSuiPq4C54W5T31Fa/elxXuolTX
         2iEwRBTOqADS6bG9qcSAhxcbgCNnuY4UUm4lhnDDrJ4V1bwkij7Ke4PwIvmtU2g+Xvro
         ToJtybSWqSBoIJT9zsvQk/y03z2lETjUokooTZz9xRF3KvDvIR+lLY20HXUI6VYAd22H
         nEdg==
X-Gm-Message-State: AO0yUKVoB4oRH+tIw6+eVZ9U/En+X0ziEFfT9wXvelv1aSUJgBAF1P+s
	KaBHoAkkmuk35wlNjpjiIUbDKV+wVUMVJlXeBozKqw==
X-Google-Smtp-Source: AK7set8em8cNpEtfR7NNLJCYhRN3qLWEg9u+FeF7hd2SjZGepRPou1AUAu3rownJ1iaBcdIps8JIBHnvHr18yaQhr/4=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr781674vke.2.1676534336494; Wed, 15 Feb
 2023 23:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-14-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 15:58:45 +0800
Message-ID: <CAGXv+5EiSVixnW_ukv-=unuP0LOik4LsSiOqi9trWOyU96YYgg@mail.gmail.com>
Subject: Re: [PATCH v2 13/47] clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_235857_361565_ED5BDE2A 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All clocks in this driver are supported by the common simple probe
> mechanism and it's now possible to migrate to it.
>
> While at it, also switch to using the module_platform_driver() macro.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

