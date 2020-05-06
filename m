Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B5CC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 15:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48ACC20B1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 15:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8+Ds9mn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4pPQvxD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48ACC20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XSWrkwvW9tHLm/Qm0wZyws66JisJyeb5jInx+0WiFI=; b=f8+Ds9mnWI9S6d
	BQ7wngztLgRZrARU7wuh4KpVbsZwuzp5s6qZqJ9vWtbrwQIv9OiTAQMHMq4VYFiBrCdTMhvN4J1os
	p1RfRda8xfSYN9YPTb7QSXLqw1NuBeVsYG4pAvC5Ijx+k5mVHyaGdMWdxv6Tk867xMUP8p7URWIC3
	pBidr51vG4w7kU1k6WPoPm+nbt2INUIupTcQUAByAkMXfYhO/zYEJMP3/ULkpbFQTY4U2stG+zc8h
	SegMOD4jJ9ToUwbXxoHivszfXYti7inhVVBvVfsOCVHLuqbICRFDxRm+Ye8NLFWk2JXHcajlnMDZH
	cr3MV5jjOYp58C4bg17w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWLsZ-0003e5-4V; Wed, 06 May 2020 15:22:35 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWLsV-0003dQ-Kd; Wed, 06 May 2020 15:22:33 +0000
Received: by mail-qk1-x741.google.com with SMTP id n14so2307354qke.8;
 Wed, 06 May 2020 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTLapDh6d6sa8JwxWOzYsk+xzBhP38ZyiktZuaXRCHI=;
 b=U4pPQvxDSFslfW9caqLL2iEZJPKAkK07gBRE9swSmx0eoxQPVz7uvid/DnJKkfomyj
 Qku3qbx38HEbSOfJ/7i1rK5VqUxEEibBDynvO2JtYd8jsPBuOJSqRmf9xKjBERGYKZ/c
 GwVO3uJ4W5YsQBhphnG0UlxOfdAiZY7MMHh26coLua4rQMY57/bVZgjbvxIjci01AlO0
 ewa6+hKVqoH/lycs4MtAmlJ7rV8I6a8g+DuNUjC4k+8dyl5ql2VwKPagDk4SP6AXwoEm
 8Z9eD0tLqSjlyEQl7gwggn3e8qjA6oVWT0Y0XI689Qu2uoxVdNMYqB78Auf/W78dQsFR
 AQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTLapDh6d6sa8JwxWOzYsk+xzBhP38ZyiktZuaXRCHI=;
 b=TsYEGVxh4rE3PEimT33PwiHQYxMzk7nlCbo9IhdZpRL/JRMQo/HJD3WJ4gI7wqrFKn
 jqNpC+dpWC/ZB7JUmWJL3Vf7U19NMcRNwCdD1N+loxQ5JC/29Bf7Ccl0vidXdPJTxrLI
 PqPGomv1lvEMbazpkm+xnbt858vOeCfAwFe1aWWgZGC1GcX9FsEDJcV37JZM9Xvpf+JQ
 yWpG3+gFEVwCI9xxagVC9Jf4A6pWKpLWLk0mCYhQHw1eXQWLhDMXHL3Aj3PUdcFIW7/p
 ZfmgruKBP/awP3jE657ruBFPtLw1XvYkCS9zTssukdBWFqkzrdck0UJ9csNdyIY+QVJ2
 UEpQ==
X-Gm-Message-State: AGi0PuZufH9a69FLDygdiv910R2e15NJKd9UiqKZw7eVD0FsT+oF3eIn
 oiUNXKmthHcxM6/LwIck2BAPX5W7oDjhbCjZiGs=
X-Google-Smtp-Source: APiQypKsxvWF4y74GYdGypVDcJfTSzmgBGHkfDV88Yy1EbC8OSn5BNhqQrbQzK/PTVwD9mD+DIxmTIufp9t3uVKQClE=
X-Received: by 2002:a37:a7d6:: with SMTP id q205mr6564216qke.85.1588778550313; 
 Wed, 06 May 2020 08:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200506054920.109738-1-eizan@chromium.org>
 <20200506154832.v2.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
In-Reply-To: <20200506154832.v2.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 6 May 2020 17:22:19 +0200
Message-ID: <CAFqH_53hZMxwR=Wk8YY485v_uAgPDh1MRs2ksv-BkfJ7TJGT6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] [media] mtk-mdp: handle
 vb2_dma_contig_set_max_seg_size errors during probe
To: Eizan Miyamoto <eizan@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_082231_678910_4BE79C6F 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dc., 6 de maig
2020 a les 7:51:
>
> This is a cleanup to better handle errors during MDP probe.
>
> Signed-off-by: eizan@chromium.org

As I commented on the first patch you should drop the above line.

> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Other than that:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>
> Changes in v1:
> - remove unnecessary error handling labels in favor of err_m2m_register
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index aeaed2cf4458..9b24b8d46eb7 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -193,7 +193,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, mdp);
>
> -       vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> +               goto err_m2m_register;
> +       }
>
>         pm_runtime_enable(dev);
>         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
