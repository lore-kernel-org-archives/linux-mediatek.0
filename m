Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC4EC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5531260FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5531260FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yye5rPzekM7KM7K4zaElGNJAoF+QePWRgCjamppJTo=; b=UkRsZS3IlqISgC
	LDa2B7HFqQf4BVxrN/pm06wAF8TNcJHdkWjA1FTvhEr9cj9fJShHBL8Rnn7mD54VpCC++qcwcdUOv
	wUqNOjYnGf2IfxnKK2hDlZ4s+W9kgzic/m79LfiYa5pZaU96IcHEDfsQhXkoeM2vnVDfsFzOSU76g
	Oi4uClq0BcyioecjRIukl/KXMx2iuyOTVeg0J6vQb90lbyBB95dCCoFL02s91LgdP3f0wZZMPHIei
	Rgw+c7rjWDkpic21GJcNORpzx+G0l7hF707G+DSp62o01aWB3yQESIzdDeBdK8tb4QvCPpObVWQRA
	cCn1G4hacm/+e/cryUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2p5B-005xN3-TR; Mon, 12 Jul 2021 06:06:21 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2p54-005xKv-8k
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 06:06:15 +0000
Received: by mail-io1-xd36.google.com with SMTP id y8so21162388iop.13
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Jul 2021 23:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQbTdwpHiSKGRKYlqDaIH++wFzRy31sqh5rrqS0iJ60=;
 b=t0Y/ybxJlERi6+gcvIqxVoSHTxGvCReSlnUccJ0b1pilessjk+biRgnQ360cyUs5gF
 DVmXtwAxqwsWyEfnN/s9dN/8smb09/5fMY5dXaJYUSvYX0q8kAZtiSD2XXmy5PC8BXIG
 L+f1CAFBBKhgbXBIJhWwGV4rK9oIRHCprc+giXaWBITPhymUkEPPaTtjW9m4ICbDXRcT
 5cZ6hOz0l3DqGbNT0Om0M9SQVz+hAaMDp9lzyXaN19+Fy8sTIHN3klJ8Urf+Ss35Q+Um
 hI1P+L5PNxTSCzSIatiGeR8jrcg7SLbNGsdVkp3Z6vN89yM9w60EI7VCKhqwk7D9520R
 WVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQbTdwpHiSKGRKYlqDaIH++wFzRy31sqh5rrqS0iJ60=;
 b=cp9AbzugdUrDeNGtf0S347CvTSjaf71SYEtI1ZyAQGdz0YEMXfaidVKjIokW93PhNp
 L1tV4uTDce8KRVZUNuXgam0d+B02OzjwhHHTXy4krHm4PwPyhE/tjBkzPiijooY+q168
 YLHga9SDdwtfM7b8qcDWIi3pJQyFqX7b1l2dgiYWczVOyVLPIzRjNjdUJUMMAq6zBydm
 AJ1xDxYrHZbtVu31rRZx7AeCJOZAf2h4aCrw66fzyRwUO+56QP76wqvMtlSNK3V5AKvY
 kO7HqhQWMXQb7eRkAbyfwcxdA63K4zQfFarpB2EXhD0QeetoaQpUP7H3g9brNrqE0S7n
 Nuhw==
X-Gm-Message-State: AOAM532cib8MhTIrRRzwLWOWC/yl4indbKLMu3E8AlyUZF1CTHtRNI8t
 WhdKeFp2Y+QqmH5b3ATo2q5uuDDrt7pP+HcgLiPNqw==
X-Google-Smtp-Source: ABdhPJy7eNcQX+XxQ8vkxSM7FMxxg2yrDt9MGG1GMQdcRqA3qp7XJidTxHybq7Q7j5orvAzZQJxZZLV5b5QuCu0V/M4=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr38727515ios.109.1626069973247; 
 Sun, 11 Jul 2021 23:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com>
 <20210710122446.5439-2-tinghan.shen@mediatek.com>
In-Reply-To: <20210710122446.5439-2-tinghan.shen@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 12 Jul 2021 14:06:02 +0800
Message-ID: <CA+Px+wXJo1R5WU-Acn==DEqubzzZDfxnJpCeFvKoYzzrzr-H1A@mail.gmail.com>
Subject: Re: [v2 2/2] remoteproc: mediatek: Support mt8195 scp
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, 
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_230614_372768_7D1D6531 
X-CRM114-Status: GOOD (  10.07  )
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

On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> @@ -785,11 +785,13 @@ static int scp_probe(struct platform_device *pdev)
>         if (ret)
>                 goto destroy_mutex;
>
> -       scp->clk = devm_clk_get(dev, "main");
> -       if (IS_ERR(scp->clk)) {
> -               dev_err(dev, "Failed to get clock\n");
> -               ret = PTR_ERR(scp->clk);
> -               goto release_dev_mem;
> +       if (of_get_property(np, "clocks", NULL)) {
> +               scp->clk = devm_clk_get(dev, "main");
> +               if (IS_ERR(scp->clk)) {
> +                       dev_err(dev, "Failed to get clock\n");
> +                       ret = PTR_ERR(scp->clk);
> +                       goto release_dev_mem;
> +               }
Use devm_clk_get_optional().

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
