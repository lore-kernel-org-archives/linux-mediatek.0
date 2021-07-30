Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB396C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B60C603E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B60C603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8GD2IjxWAiVHVUrNnTlaEAO9MsWXVK2bUCk53PmsbI=; b=wwWZ46xvdvU/LC
	5T6A4gTy9RZO/llHzDDUPAnIkPetlzfuKFUrmUJvGIJAU8OZ7q9OF87ZACd39yAl947nPJiTFr4Md
	ji3SzBNrhX4+Z8gHBJ4bfZl0BPnU+aiYDC7HvTN4xSMe7CkjkXiqpDn39DCCYsqQOj5Z1bf7FipNB
	784VE0unD182GS0ZM01u3V7KnIt4QdAifo5jU9p4ZACCmft0/C0f26bRofwpLaesXCAzVAB/Hinp8
	v+wuithJqrZVnIf5chYk9xjhokPmeQOmRjANGcNhpLHZoBNmmsBv0fbhA2Z7fRJyrDq5IEU6TpZlu
	liiPL7qKlmK5GMt4GrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Os9-007tl6-Uv; Fri, 30 Jul 2021 09:32:05 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Os7-007tjI-S6
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 09:32:05 +0000
Received: by mail-io1-xd2b.google.com with SMTP id f11so10645641ioj.3
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8ZWMHHc2Lzy1so91uQOvvF+YHMcuXp3i590hglYW/0=;
 b=Fx77fDgwTtiSAGHabutbrjOyCZjKbo7MH/4iCNF+bzQi2dSATPXmG9Vu8ojRPSJsed
 IuEP5hk4WZWBzspgjApfNEshHGFbR7QT12J1ByuPTS5EIDGqT8xBg8tnTl95cIKGoNXp
 vxkAaeOKzZx5FUFu4YT8Ad0RuBQqh8K4pMFEWlFBwcpNtI9wIOKwgcpXQKg19clZUrzz
 9+LaqD2QqWicqMe4D6jCjRJlY9p9hcw+lYy6q6h7pXKkx9ev1mwqNzL+pCUEjNRQtCOL
 3KmecR8yZL4z5Ng7535bbfigmn7rXXRTiIbuijeBjZvipdq5sD6fWp/FMKcOoDkfy2Dz
 t5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8ZWMHHc2Lzy1so91uQOvvF+YHMcuXp3i590hglYW/0=;
 b=YeEp2xBX1HMd78jWaO0k2OyQvDu+VzU8vX3O6sqnEkK57weYr67HOWe7DpErfB3fAI
 oSqSqCgpxIieo2+BhVypWennWilM14Ss+lbj0xiTKXOmLJwPuCCSlx8AEowqyTgWdU4S
 le67YZkwUxxRPIpWTz4axcYuEI5MNWh8nZSJnqNPKrgeL/w/+BC7GGvrfX46PIc7aINd
 k2BelCj4r6AqVFlctX3mBbcfKI84ND0WwquVNYjm6t8OZW5vMDoJ7bGMUlxMaxw57HFi
 JL3SfYmyjBAQwTL3f8zDD70NlMi/5ffBrIOax1ljh+yLP759wmcDz2fWwwZ7Xf2Ml10c
 uigQ==
X-Gm-Message-State: AOAM532vKpPCLteOqtiqXUnDsdQ9L/G9DnScV7scwanqdEXUKL0M6PzB
 3kwl98by/9mTp8Y6BQV80E18cpc+WXwpSclk2hQuKw==
X-Google-Smtp-Source: ABdhPJxqDTwLCydinawV1ga0hNzX7YN2mmLocrJgnBJXggjsSyMAMZ/u03ewHGOvI8jHRtI+RmlJVZQlQ8E5E5PrQJg=
X-Received: by 2002:a02:7f12:: with SMTP id r18mr1435455jac.50.1627637522473; 
 Fri, 30 Jul 2021 02:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-2-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-2-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Jul 2021 17:31:51 +0800
Message-ID: <CA+Px+wUXmpT6TBOvD9J6ircLQ_X5D=bByOotfk+L7U+sXev3nQ@mail.gmail.com>
Subject: Re: [PATCH v3, 01/15] media: mtk-vcodec: Get numbers of register
 bases from DT
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_023203_968169_65244515 
X-CRM114-Status: GOOD (  12.66  )
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

On Tue, Jul 27, 2021 at 06:10:37PM +0800, Yunfei Dong wrote:
> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
> +{
> +     struct platform_device *pdev = dev->plat_dev;
> +     int reg_num, i, ret = 0;
ret don't need to be initialized.

> +     for (i = 0; i < reg_num; i++) {
> +             dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
> +             if (IS_ERR((__force void *)dev->reg_base[i])) {
> +                     return PTR_ERR((__force void *)dev->reg_base[i]);
> +             }
{ } can be removed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
