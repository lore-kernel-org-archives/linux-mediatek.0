Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP1kRRWfGFb3g9OhTR24L/naI0lrc125JK+OAjeqp9A=; b=Oz7XZ078RuOUP+
	/ElE3s8RzXL/QPw01Z/SRlp5hT3cuFIP8cXf7JWi5dxvjtLOTW6w6505tWtCDTd+LIXPpJCTf0tKE
	5wFcwns80JxWcMt9wt2z+ZQ3XRCWLpNQ/RQaaOu2+WJIb3Eaav1mwPEp9Lcjx5PdIM3knUCQIlQp5
	7iuVDgZVEFoOIhV2GNCo1eVDyn1OmXJHRDdm2d6CWgZZ1tYakYrtnJRUrqRUzutG3CLPJR7WAXg7I
	pVK6m2Cmb5OQCnSYQA2KERRMey3gw6dyn8+mHiWQG5gdDfZ2kxZmYETZ2HZolJzX05T1ws+eLoh7D
	IzdKbohK7sYFAFwLBGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGK2-00FWls-4d; Thu, 09 Dec 2021 10:06:42 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGJi-00FWe6-Hn
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 10:06:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id m12so8156598ljj.6
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 02:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4lFATsequWOiCgnpZ4p/6BBWla14PJU5Wf+t9BaVSeE=;
 b=D8Gx/46XuC+G4SdL3UPnzw5BJbgf55Qxd5JmtotiY1ynfDNb8RtTnulE65G9a6uho+
 NhC+AXr42MKR8uh/is+sgaXRdtZ/LChoW2Bpb836OIT2anUdS3ZqJnyGU9af/xG5Varj
 z4259F+PM/GID9nAYLcKnbZgytkDHyjp6eNha/0fRTrEkAQmuUoXDDAsAwus00otIPa7
 Dmd2W2WF+G+KgVyXPwjD6jDk21D/NcY4L/qZTKZ8dxaCxazDt9O7t2eLTPuQEtW8SJ1q
 pla4kcIbGWrlQikz2EeZy2ME21VcQmNN0vA9To2AHNHtkfbUjlI5GOgVzoUFqQAXKhOd
 CKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4lFATsequWOiCgnpZ4p/6BBWla14PJU5Wf+t9BaVSeE=;
 b=U4rJpgdr6Nzm6vkcFhMPtYDtwBMQbo3bhVICGXXudGyzoJ28P9ny4QW8dWjH/bHmXl
 0/6aGTXNnLuLJedVpH27uskUkHL+kBr5lfjEeFdrV9Ss74/7nZdDPt92xwa1zLQ5kIxq
 ZAi9ZvFYbuhBEVIFl81LL8dkwqZVgVJj9MJg/7h4KooBwC7v4VJhKx04hxfQkXXLLOW9
 AY/hSU1lENbusEVMthXHxgTqVWcQ41FiI03ItNUk7Eg0m9Rl3IGFCf4qIeL3Az+hCobU
 v6wxQGYL4zAdgviHCeYIM4D5CIyxNpFAWoM22GXaEcT51s08Ldlvm+C8nf9FKM+cex+g
 VCjg==
X-Gm-Message-State: AOAM5313uCLfiF7C5GOIe3cS6neiZbfmiwl4UuTBSV4FkWWJQX5P3v4k
 FgZNBMv7D1e5mlhG/EyvrD1tjq3KMoCHZn7vN/aGlg==
X-Google-Smtp-Source: ABdhPJxH23WdQ4mT6uTrJq9zH7lO81XwGmaOOoonGOh9qQI9zjkuCKnUu+dh8lkJjj41ieGjwixrLVBJQTLbcM6lrTs=
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr5619180ljf.300.1639044380237; 
 Thu, 09 Dec 2021 02:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20211207075013.22911-1-wenbin.mei@mediatek.com>
In-Reply-To: <20211207075013.22911-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 9 Dec 2021 11:05:43 +0100
Message-ID: <CAPDyKFqakV8FiQohbvh8h9UCpO14XJFDETPojSmdDUCeC1Kj8Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v1] mmc: mediatek: free the ext_csd when
 mmc_get_ext_csd success
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_020622_623261_FC2D8E03 
X-CRM114-Status: GOOD (  15.23  )
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

On Tue, 7 Dec 2021 at 08:50, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> If mmc_get_ext_csd success, the ext_csd are not freed.
> Add the missing kfree() calls.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Fixes: c4ac38c6539b ("mmc: mtk-sd: Add HS400 online tuning support")
> Cc: stable@vger.kernel.org

We don't need the stable tag in this case, as commit c4ac38c6539b was
introduced in v5.16-rc1. In any case, thanks for adding the fixes tag,
it certainly helps!

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 943940b44e83..632775217d35 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2291,8 +2291,10 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
>                         sdr_set_field(host->base + PAD_DS_TUNE,
>                                       PAD_DS_TUNE_DLY1, i);
>                 ret = mmc_get_ext_csd(card, &ext_csd);
> -               if (!ret)
> +               if (!ret) {
>                         result_dly1 |= (1 << i);
> +                       kfree(ext_csd);
> +               }
>         }
>         host->hs400_tuning = false;
>
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
