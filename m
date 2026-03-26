Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D782A109E55C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 06:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdEPxGlOLVBGmER9WSTa0ssfO+YRW1Jn+IHrzAWzqJM=; b=V12IxJ7cHaonTUoFOUrLz/DF70
	u1Ptw5UI9ylfFqQiyJyxBhuE3szGFzXvTieA7vQL5jGLkPU9hzvibOCrxyegEWoMd8Xp5hDkTXAWi
	aAFuywr5LL8IaosuTFf2YY+nVIgxZDQkkHvENNbnAPJ9eYZziKhnCyUCbfivfCXUJaZprUpxhbque
	L+GUdnvyO8ENy1ncExc3CqdobzHoUKtrAODZ9SRxXJYbl7K1QqzUzq4tnvA3iLZqc16Dgzu+89FEx
	2uBY3SBI6c2CYSeHgbNlOdQI66hLkTfmaJzRynZ21oODZAp6RTkribmp4V/7+o8BmBDgVfcc++PvW
	+gPjWpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5efy-00000004sm9-17DQ;
	Thu, 26 Mar 2026 06:58:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5efv-00000004slT-3mEp
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 06:58:41 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c742bc88d87so292646a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774508319; x=1775113119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdEPxGlOLVBGmER9WSTa0ssfO+YRW1Jn+IHrzAWzqJM=;
        b=H0MioLcu0bLsl1OKWmiTNLrSozpnZnAoqs61D2SW0rfjLkyvazGphNn00ibylorImb
         QwNwSNA5R0YhFK3mtVVhQcA8Gf1oEZg7sTgEOJpVm7UikqICNxs5QJ0PA4AsGoe+k6vL
         7p1+h+UNHFPKA4PFeUV8F/syYs7Uga8cQ1cZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774508319; x=1775113119;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SdEPxGlOLVBGmER9WSTa0ssfO+YRW1Jn+IHrzAWzqJM=;
        b=lQED40i8F8wn9VECj6k/bzRDAlp9SfswmRqQYrYYNHpvF6HovM7UfA3F1u9AC6ySVW
         4dUxKQ7Qio+tFZStWUz1NiKRejLN/r0s4DvyJDMvsSHmA8VvOW241JC92keEkfSeyK9h
         /e3M7nSOK4/dbhoB5Vxv4gGKiUTRKuhD+i7iGeFIgQU5aARzKrDa5bxu/uD8efVVo5sm
         aYaiOpHZIWfj8Bb3dMQh1NkvymWwGlCgRAPNBdOWJbmDq0C/UGW/+U8RmXubgukaQiMy
         Bms3ChZ0pbtc3KCJ2F9tMoOFxElGKcnXH0dD4Mq3cw/9FIAe4I/ZlqKQMWgNIhzWk1lJ
         wPzg==
X-Forwarded-Encrypted: i=1; AJvYcCVLG+2Wke5c0u7YjOQgUkyd08Ax6tGasL0v3NGc/dmbMFWohKOcPuxpNZLsNnDI93PStbxbgXw3xJ0vpZROVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys9rsrs+aoZyWSLLK+HV6Of4g8qTPY59XMtD7ctul3NJ2k6JXi
	LRU97i6vEYo12zHWV/lUtpJHeOoddzVgvLpAlqKV7f3fZ+VGXXXcNGeti6Ql3KV9Yg==
X-Gm-Gg: ATEYQzwwaQOOI8nWCeCkg9/LCtB/v3uUXTZ+rpqEhmB/AmWN3xfx+VeZw876QMLyXK3
	8wz27LkJPExnsjZayweLgxfZ3u2uqoXGEJ/hWFgqq3Chlfx5NAXi6ZmtqWTr7hQ6lQSdTWGhqsf
	rw+88rP4ukbu+diFE95RBggFmJozUBrpCLQyasd1zX9uiAw9SwO8jKQRv4TvnHrMmBU04vWC+AT
	58rWtKS4SaUS4X8JWFh5947fFicZaD/N7HQv1rtM8IpiG/UN5292ZtKrtloWwjOI12Mz3CqZ2e/
	qUxMw0X+tuCt4Bt6vZVajDeKBWkyt9OTtYBGekgRD7RGSDftc+xytPiy7jEX8i32XvVWVs8p4z1
	ySysQPz7usUuYtbvmWTsUQ6QMjO6Qqav31zs9fPNY7hzDKWuArspQmh6xoKeZgIurlzKvi/aGfY
	54LKekBTBwTd7OoGsG1Hp5iRTLSFNKMPld3DjFAgmfrdxR8WK159NVSdXtci45z5FbbCcCaveNL
	+9CUWMY
X-Received: by 2002:a05:6a20:729f:b0:398:7b1d:87ce with SMTP id adf61e73a8af0-39c4ab57c36mr7202940637.20.1774508318941;
        Wed, 25 Mar 2026 23:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76736e54e4sm1345254a12.0.2026.03.25.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:58:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/4] drm/gem-dma: Support dedicated DMA device for
 allocation
Message-Id: <177450831563.1057981.13951871384462146640.b4-ty@chromium.org>
Date: Thu, 26 Mar 2026 14:58:35 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_235839_977443_F8093CA2 
X-CRM114-Status: UNSURE (   8.21  )
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

On Wed, 11 Mar 2026 17:49:24 +0800, Chen-Yu Tsai wrote:
> This is v2 of my "support dedicated DMA device for allocation and mmap
> in GEM DMA helpers" series.
> 
> Changes since v1:
> - Link to v1: https://lore.kernel.org/all/20260310032511.2545500-1-wenst@chromium.org/
> - Collected tags
> - Removed reference to mtk_gem.c from the Makefile
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/4] drm/prime: Limit scatter list size with dedicated DMA device
      commit: 864279920b2b2c1dd491eba0d0c64764c0c03d9f
[2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
      commit: a9da24732aaa80d631bffc8a1390836d4b896690
[3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
      commit: e21b1a91430d5ff626a35f72951ed80268e26de6
[4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
      commit: 25e90f486f5bc8f606f4263c9d86e2d2b1db4613

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>


