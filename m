Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B20C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icHKrC+ZUVNLRzqIQ0Rv72/29tiMjrivczyahS5Ha5Y=; b=u5CWhyiK4jAEy2
	uCMSP1T3bHvBUy+gZQc/KMGzZNfcO1H3iQl8GgXT5CFqk/wYSGrGdAhfQSpcOyOiIlGWR3I4JF3nj
	l8eVATFypvYe5gpvTze1kXnlZCv3+Rip5lPE9uGE5PeRKs9RVUjI4vRYumGBvq0vCUjto8dhVEemE
	i1QnER5ktvdj/4esJX4Wtd8XYByuENv1ZGml6B+RrfIvzCF6eONIvMXYv9d7PnA/sxkhGIIHiyG5N
	PAlPwH/3Pvv+5uyovYkBIZ8sK2whxdD4mlXRxIDKcyCB92bSz7TuIaqNaGKb0SfceGHjkqg69pRbJ
	BorvqukQ2IVCnLUQAmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUTo8-00D4Ek-MV; Wed, 16 Mar 2022 13:35:20 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUTo4-00D4A5-J5
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 13:35:18 +0000
Received: by mail-yb1-xb29.google.com with SMTP id j2so4544670ybu.0
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Mar 2022 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WNRIm2snhOLrjHDrRT45Al18e6yX+6IjtBw2hvIFtuc=;
 b=bl6xXHfUk0jza37f3JJNngv7+hb+rNkTVteG8qFGpuWSZHFNpW4/ck2144lMbppgke
 VedQEh+UgY27QEqhYUahKxZl39G0PAUbDtvPwRPCvG2MDO02K9a0KFdCt+8/lRSGUOHd
 lzT7xMJd3npkRtbQq5icH4pCvllCLjPtlpTzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WNRIm2snhOLrjHDrRT45Al18e6yX+6IjtBw2hvIFtuc=;
 b=eMDdjhnWq+KMtoBmL38pWaVxVSq8SZ4xuKDIGlBaBRra8dIiTWT7DMqj9/ImiafYk2
 nrfIJWoY9NcrxlYFd7RU2yaQibKM6bomVxigGugtVemMk9yXHi7pYVu55Y2JOdSGP3W9
 G5+ejTIPvDYGGgg6TsgLBMDwqRJZy4VNmJ5W6pzA8DOEKJo1ewuv+IjzA8FJRXBnknh8
 PooIZt3e/wtomH5vo7Y29U1OqHhBnPoGSaFUlkpae1Q4NC3fHLNZKlHRALFh5PznfIF5
 pz5fKWnb1kQ/1rQAv1v85Ot2LD5JRmDiB3sW+SJTQYpYjNpaeo2cAgsr1fSfFR88kDV1
 aTPg==
X-Gm-Message-State: AOAM5321iuETmoP3KxdIHGMtJuF0+zxMkPKezFKL1VGJrlG0xBGPxGly
 hqLKL6+cL+54XBpvA2oX7qv5sTWOfGgY0E0M4S28sQ==
X-Google-Smtp-Source: ABdhPJzBoD2Jj2tGf6FiQyu4qnE17Z74AigshCqdfSdH9Nn6dOvJw3Guj90WJtvPBJPDHtGui5i1uCXGBcxMlWg7L7k=
X-Received: by 2002:a25:3403:0:b0:628:a2e4:ae8a with SMTP id
 b3-20020a253403000000b00628a2e4ae8amr27494313yba.219.1647437712360; Wed, 16
 Mar 2022 06:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-19-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-19-granquet@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Mar 2022 21:35:01 +0800
Message-ID: <CAGXv+5GfiVhK1cvgjnnxHxHnL7rQnUyQJD93d9NHNmT+txfgcg@mail.gmail.com>
Subject: Re: [PATCH v8 18/19] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com, 
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_063516_669391_ADAD34EB 
X-CRM114-Status: UNSURE (   7.36  )
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

On Fri, Feb 18, 2022 at 11:15 PM Guillaume Ranquet
<granquet@baylibre.com> wrote:
>
> From: Jitao Shi <jitao.shi@mediatek.com>
>
> DP 1.4a Section 2.8.7.1.5.6.1:
> A DP Source device shall retry at least seven times upon receiving
> AUX_DEFER before giving up the AUX transaction.
>
> Aux should retry to send msg whether how many bytes.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
