Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2D0C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 04:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjnhtH64eML55ISxgIP0mbjGK87d9wufZ0dMxupwBB8=; b=OVYU8GXurpvCCXnwrdg0AfY0oh
	+HW+sIwVEI5HBXtqy6MgRIszPSb/r9LExc3E45okm2qK9abphrMCXBZnoY74lHS1UxHQRFat7VXt+
	1hSlHdji8IWV4qW/MKUmPAkStz+LHoLnveb0HXo1Vuw4PI5sEf9WzbhQFpmgeYrLxDxXajKu5NoYy
	qf3JcyezOBLXJ1JaC784XnbJ2UTyI3sZbR/SIFChql+R0ZZIJul+dRYU3Yq1nYF2HSmqVPemSqauP
	bv3SZ3+veXC+yc9Dmk7Vg2P9SDS6UZFxeHyiTONRc9dOKNbhV2oUflGLWxYl847Fy8Mz66eYQPp6Y
	5MNyisJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUguB-00Akbq-GW; Wed, 22 Feb 2023 04:38:59 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgu8-00AkYQ-J3
	for linux-mediatek@lists.infradead.org; Wed, 22 Feb 2023 04:38:58 +0000
Received: by mail-ua1-x936.google.com with SMTP id n4so1985193ual.13
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 20:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SjnhtH64eML55ISxgIP0mbjGK87d9wufZ0dMxupwBB8=;
        b=lqrWBFFqj06m2wFc1tGmWC/sZDK+C19hDP4UIu5cVpbUtFfwJOsq8t6KqUwp+puZTM
         xlxcOhBFLwnQEXS/+AJA6bzHgUSP7bhC3Epgdd6YRaOAUCpXfcYDN21kgpjtnuydVfTS
         xmjsDddgoEcBvU3bv1C7mLsikIeNWew45cDD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjnhtH64eML55ISxgIP0mbjGK87d9wufZ0dMxupwBB8=;
        b=TvkYO//++Og02JnBeAftAkr+/I/dNmzTLCcpGEeXBcrbdu+J6o2wN5YECldQknXxwM
         7XRkXKmEapUCHitRXArjITvxMuDx/ghKqy7AxU/pW7MFjBiugYUP2vqJ0IudWtHtujYj
         HWhBOGb8iFEUjo7XNIhTG5/W4dIJxaed5dHXgHL+Y716uvhQ7cTDT77lwApwiYVk4qXT
         /D2vkGeaKaInzo1hh2lzOAh0ywDusHCEAKgzYqQuY7Ao5mx2/3BPJqXtqtm2vGAUWJF8
         pzzl6i//EIXCyUuM7KYOoTHjOgiZcZQFc6s3GWXR7WLKgS9HgXMMchn9oBNdJgVjoccz
         kXnQ==
X-Gm-Message-State: AO0yUKUht5imTaEYOpSs3thewad+HUxrVGHil8fICX5Iy5IAEq8AhFjk
	+56Tx+hg5kGF1GkDBiBfg+7iY9pxzy2IiZR1XPplHQ==
X-Google-Smtp-Source: AK7set83ZvblSYZh7JNvc7QCFEKUZbLt9LcnNtZrdB1tyX1tEXVX1rHD9xKFOJ5X0MZjFwaqGFlydH4WbQIiF5KY8zE=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1238225vkg.2.1677040727547; Tue, 21
 Feb 2023 20:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com> <20230221153740.1620529-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 12:38:36 +0800
Message-ID: <CAGXv+5FuKJ7ce_tPeOt_+yPw+hZwiiePRHp+QsWBm-sf7UD4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] drm/panfrost: Increase MAX_PM_DOMAINS to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_203856_663226_5DD6553C 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

