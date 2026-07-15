Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB15C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=; b=J7QEGVtDZisK1xvIVWVUqi7JXQ
	zGLoPTB9fkd7Ji17p7v2BcPJQqa7zQz6sbdxxyM+fkoEWlDmZdPU9G2ogHhEQ0aRLl/i337rBzQSL
	/zEx1QdTvCEg7fYwr6e6eHr9+LVRVhC39E1cCVdg9DEPF1Z/c7BRau3RCItOnvf61u5Ouv8pLMAu7
	k4a8x0hjmVQFRIS+Y/d3DUyLymdZy4tHoysVo5rmpix5ryL78Y4iKS3/vx4iJjl/M1Yf1qAVQKL9o
	e2snXkUwLoVK4S8ya60oMzPehD7Q/VnQo2/LUqyuSl2y9Eeyykq6eLRAlOEr/oUNyuXvLtKy0rsvV
	7HQx1dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06X-0000000F1AM-046s;
	Wed, 15 Jul 2026 13:56:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06U-0000000F19P-3l6l
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 13:56:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so16728535e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784123809; x=1784728609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=;
        b=NXkurFVQkBi41I2ZHrGl/vvoqlDozDGFkrPmhSp3QCCPCm7cxXZau+Em2u7Sc8+0Kk
         r4xnYLBGNv1DT6o109kHUyjd9eomEv+liUCjmSRFaD3DpLAkHqkjCxXd9k9gyxxaVswB
         GbaUIp4f0d8zqeRf3l5iIEV4iWybvNYG4ps+5X6sKLpNClTcI3TIMqqeVNYAMACxmLZl
         Y2iyArz7wPlOIcGoPaslAvG14eJwThgLE7z24RKBwArTve2TBR1SxsN5eWRSNCJ+Kk6u
         OecPOXmySGmWnEuX7eGlSLs79/B9xlmjHgUp3uZd4bt+kbq5XmbGkK0dNg3JD2HAz3C7
         w9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123809; x=1784728609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kaSv4wtGCrlgRKnb7+XoZM8S1WHPmiPgEfak3MCbz8=;
        b=BwuBw0pdVCLcwUg5Z34qO9I6k9gbk9/KWhQCzQC6evs66G2EfPccwpfy5NpUrIOM0h
         hZXsc6rEicN53WwEZX5m+onq8P6yiLSfGGEmuPIVAcx/qanj3VVWEDhyQ7b5V44snkYM
         K7ty8BXaSRCxGBmx7ICKNSUm83zrnf6/vWbwuHl7iFp/mZFLsN73zqlc3pbcs7eue6hX
         gDKhl25WrIAdkRIQv9y5FWwLb7rvxA9YQk3h/fw5D66OlFJWfkq1MZvG/cy0A9ALT51H
         ACJTZH9XwyFitkDlVXRNPwUcEoquEYiSAzOSFTHlrKtKCYc0oCSlZHE50u7ACJ46c7h1
         MpVA==
X-Forwarded-Encrypted: i=1; AHgh+RoHbE7XSnuUdpRm4SdRZIp/uQbdD18ZLgYqfcCU/TK1LRVo9cFin1ezVhAyYTD5UXXK7VROMuLdqCKGgW3/Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh5fW8/ITjp3eJ94NUGyK/hDa7nXy20a19vUzS1QPxlL3NCf4g
	TYhrrS0CFcMQ70XFz/VxnRUlfQm8ZtbexfbyL1MjTjpPcOvsoX/EDh/tSUSyozcJ
X-Gm-Gg: AfdE7clyM5L7/KnX5UOUI4x0Okmfsu/e+vWibdvyX0OzXYVpITZZCMj+YrQnmLAP4ce
	GXY3U3ioU0I5mz1s73SnMNIQtetMk5fpjYCfY2ccFB0Feka2uSsLb9k/Xjru7tTyVQox9HlEP7R
	arNuzDM7TqcoaGuSHFHWfB+kXEQ2RKQ1YRCAImNrAaW8yceqKixI/sI9Afr/ZM+j/uLxUBm6qyH
	YnriO24t0BowPlpo2TZi9+Xwgk0dfhU3EOn2mJyCAKrYBzk5cnlIWSRjHi0WBVoSr75c240J75u
	wB4FUB1CtJtlvSVNWiih7+M/hctE/71NuWZj3LpZbCW4mWcLDfJzwqajPqfppZ8VqAE0bF64dMY
	q61sxgHMkHd+8SBk0kXNt112jrsg0lp828NDf98Lu2HqDDz+pCStdWW3ZmdkBFjQD+tsb/6zkgU
	TVFH+lDCNs
X-Received: by 2002:a05:600c:e557:20b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-493f8818052mr137073085e9.23.1784123808894;
        Wed, 15 Jul 2026 06:56:48 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm223373325e9.12.2026.07.15.06.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:56:48 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:56:47 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable MT7921S support
Message-ID: <aleRnyxN-xt82lKf@owl5>
References: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
 <177850089272.133673.2886390087848759794.b4-ty@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177850089272.133673.2886390087848759794.b4-ty@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065650_943887_2B3BA2D7 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Angelo,

On Mon, May 11, 2026 at 02:01:32PM +0200, AngeloGioacchino Del Regno wrote:
> On Tue, 10 Mar 2026 16:52:12 +0100, Gary Bisson wrote:
> > Enable MT7921S which is the SDIO variant of the MT7921, also called
> > Filogic 320 [1].
> > This driver is now used by Tungsten510/700 platforms which are now
> > included upstream.
> > 
> > [1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320
> > 
> > [...]
> 
> Applied to v7.1-next/defconfig, thanks!
> 
> [1/1] arm64: defconfig: Enable MT7921S support
>       commit: f86e8870547299cb6ee5b8c29d7e35d942b4bc39

Any idea when this one will be picked up?

Thanks,
Gary

