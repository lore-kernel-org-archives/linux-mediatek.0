Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E1C52D7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eMsJxTM2zOmRS6+tqFj/KXfj/XkuR+C/+5c8VgCc3Y=; b=vZRZk3vvU4bTdA2T/CmYyanA/m
	DS+dUcRHjCIT3HnvhepzOvJtxmiQ/5tSbuaNBZk2km+FM3S9NWFE07Y9fVwf0Ni6fkBdvKZS8TMcW
	oaWmau18mbN/KURTh8X7Q7ccdDptr8LgwvVxgst9f2G9ViE2eoqmQCGIaTVlpakfKLarLYONoAK0O
	FFPjWcVad9crmo9S1+9B5miPlyZVZSJu2+sX80Q0VClKK+Wpo5JN/1UapeFmCOyP0sXLVmqNwv8Ab
	N7gY+UjFtHLaijVuxRF2CQ64vywGBRW9zkMrvfu9SLu8gXxIJCGBhrhrCvwAB4dYoXYIVdyZQ/73S
	WoacKwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfF1Q-0000000EwJe-2q9r;
	Sat, 17 Aug 2024 08:42:52 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfF0k-0000000EwCs-3Sa3;
	Sat, 17 Aug 2024 08:42:12 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6b0c5b1adfaso16668707b3.0;
        Sat, 17 Aug 2024 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723884128; x=1724488928; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eMsJxTM2zOmRS6+tqFj/KXfj/XkuR+C/+5c8VgCc3Y=;
        b=VilfOA7p/yc81SCbAtmxIqBbFyRlEAYoD6H+5894Ve3y1JsJ19ub3gJuo+QhQHJjv7
         KL8TJZLWui/dFvKr4X257TUDHPabLm8Ft5n9r7U77ueQSVYU55vDj9EuVD/0ueS81Wtc
         rPd4pGjMrL/FX50P5tjpqDKwWh1nT6clLkZD+rQ66uI9BfCtalYyX5KXGHQF44RcWnuL
         knIiDS/VMaQ2I5wyMCHaeSykKRbgv/50tOj9a99QmuCGTwbeDg3Gzd0fn0vLMqoBus4V
         XJmkE762TQ4ivwpStCpeYWNkTBmP8IbTiN176iGt+8gYYUXFFiZA34i+c9CKhm27gc2U
         X0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723884128; x=1724488928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eMsJxTM2zOmRS6+tqFj/KXfj/XkuR+C/+5c8VgCc3Y=;
        b=TbYYxK1hxc/YJCsStkRfZWtlBSS/s+dyDnZ4jQvnhM4nsmFvDrvGQIjduywjKSUpEj
         nRa0C029TaCSLHr7WupFldR0McacgP7xuZZNNYX28ZMq3FyDKLrmoTu3Eja5VCTIV25U
         c2MHUEWFO1i7ZRquGxVRFYEHfcQhziNsiopsZ3mp+VG7jjUftO/EFxzT+FwI09UjzE+h
         EUPY/i0EFkwld9XXS8dhaaE27IwjHBXhXoIwtfEl4kGaTmBVNgi6EUWilmZNt7tSFtqA
         ZDroh6D9oMA+B5Z+mBN60QvBNlVrILEsWzBBC73AceHUB0raenubdvcjOZ5zqD7d+zjS
         lAog==
X-Forwarded-Encrypted: i=1; AJvYcCUNeU/qBVuP8AbsRmBFCQoCbAw6l7McPb7GBtg6IzEsK3FAl2MY/4hKMyGBVm+0qt2VESC5/NdxHFd2yoWXr7e7jlOTin0BqRIDRtH7SvYFYesjAp5OTVPk/N4Zv4SFaqTGqm2QLY6JiDSnKp+2GwJl8aEgS4ROlDSTjrlFaJGzGjiZVHXKQBMfXkL6u1DIaMkFzszqHo9Nq31cxyG+8qDR0tKjtNXtCYQh3pkTmBgLqyCVUVDOe84NK+jHstazrEyw
X-Gm-Message-State: AOJu0YyHY382Ma0PGLAPPyzwBf44MP5PVzRHgLnoF4vfKMQ4wCmVc8pB
	zNW2ICLrLZgjC3OfWYm35W3uWTYSWZOSbsaRbKiDhQ35wQc3GgGs4A0c/Dlnd38vrunE0fu2oVa
	zfFz7cN/PHmhy/qmOTdcVa2kIGcg=
X-Google-Smtp-Source: AGHT+IH/bN7m+GREt6zV/O8rtGprxJFVfkBD2hfqkVRmLL3zNnCApsctC6ZVhzVCMOnM1LN6O5ppOC8r090pASW/sGE=
X-Received: by 2002:a05:690c:4:b0:646:5f0b:e54 with SMTP id
 00721157ae682-6b1b9b5ae86mr67136927b3.8.1723884128092; Sat, 17 Aug 2024
 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240817080408.8010-1-av2082000@gmail.com> <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
In-Reply-To: <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Sat, 17 Aug 2024 14:11:57 +0530
Message-ID: <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, vkoul@kernel.org, olivierdautricourt@gmail.com, 
	sr@denx.de, ludovic.desroches@microchip.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com, 
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com, 
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com, 
	linus.walleij@linaro.org, ldewangan@nvidia.com, jonathanh@nvidia.com, 
	thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, 
	michal.simek@amd.com, Frank.Li@nxp.com, n.shubin@yadro.com, 
	yajun.deng@linux.dev, quic_jjohnson@quicinc.com, lizetao1@huawei.com, 
	pliem@maxlinear.com, konrad.dybcio@linaro.org, kees@kernel.org, 
	gustavoars@kernel.org, bryan.odonoghue@linaro.org, linux@treblig.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_014210_889357_E6CFCA25 
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

On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > Correct spelling mistakes in the DMA engine to improve readability
> > and clarity without altering functionality.
> >
> > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > Reviewed-by: Kees Cook <kees@kernel.org>
> > ---
> > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > V1 -> V2:
> > - Write the commit description in imperative mode.
>
> Why?  Did someone ask for that?
No, I received a review comment on my other document patch.
So, make similar changes in response.
>
> regards,
> dan carpenter

Thanks,
Amit v
>

