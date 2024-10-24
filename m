Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB94D1036C
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=; b=X9Za26yMFKfv+38YSLxY2BCTzQ
	CbLjUeg2xcYDyP5p1YHKr+kkFZMUbjnsKKOCkItdcUi6iP6UF4LfYQthsZvOuUjPWAOSI8eq4+XFR
	RVllZKuiz+rEh7V/ikSffd0fKKXHFgtaQKEqR098m1GQkZPd/+Z3ZxyuBa51KHzg+41FIy8YJVzo2
	Frc3BrATx23kyvELpb4fIXvVO3qV5aKQW7v32WOuJq7rA4SfJ3SLewhQd3vWl04eYgr5U51Hd8BAK
	mbOg5WT67VCBT1a+bQ9GjMjNh6SKaq7FsGvYDOPbRccxVjF6ZuN+VoZ+hGm/lAgY+Pz4aG8LE10DM
	Wa/6PgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44nV-00000001n4U-1gWg;
	Thu, 24 Oct 2024 20:51:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44ka-00000001mcm-1KUY
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 20:48:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1605529e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729802884; x=1730407684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
        b=mREphOFZL2/d/bw7MGpUoVimLoGMGt7mU6XsHDCJ3pdyvbzzkkht/+EX2OJQUGvPDH
         JCH4LSW2t6jV+YoD7+Z1h0LUu2SHUFLDN7YsvLpUE7amY450oqAPyQIhwRf4S1bjREzn
         f8qs7SqmIQTAJfr2IYMc2C6aCv5oI5Y327ZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802884; x=1730407684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
        b=gusXkQklJ0VbyRAAmVUqFuVAiReIXeDOwBLIQdkzHzNWftIadCtsO8h4lok6Hv/8JK
         q/5BQJhYtdov8dS/UjTEEIvRO6m10qiaXKkyXKqTtnndLY2nPcyl3yOZnZswPHdlyIcg
         Jcqb2N7ZPpawwyTfC2k4EfIhF9laK+1p2iihhmWeVBBPjSORVdEeezybI5AAuNnLH2BY
         FKz0viXWGqabnlp/EBS0k+DjpnqAnsrDCEgJ8f5genq3L6ccu00LEramChdAA8nN1KlB
         kbquhJ1PRUL0p6yw3u0vLSf8uu1scWUM+HXz2l1aTRAwD1a466pXJtCAT75b/Be+H1b9
         YWfg==
X-Forwarded-Encrypted: i=1; AJvYcCWqzIolj1dAigK4/9w9KsOYThpbcWDzOlBB1TtozLNlmx5N6qRVk3Q9qXLW0vW1DIs0b9EvWaYVeMz1IgtjBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhq5kaFskx4N7jDQ44I7LZpdd6qlr8wLMqdksQa4gYqIpZTABZ
	k0DnKS6nnvt7ueCAMZP22oY68FwlxK3Dl6tat40ZhoIsTND6ByK3Qqw3iWeUsYXmOZFhmAPMdRk
	kOQ==
X-Google-Smtp-Source: AGHT+IEch9L8ch86FgEoOogRwQ4+2bZOSubXErmrzbl4fFIR82E/B/STQJbAnWwJP5gPrMRfhCqiIw==
X-Received: by 2002:a05:6512:3d8d:b0:539:f6b1:2d05 with SMTP id 2adb3069b0e04-53b236dc906mr1222018e87.9.1729802883840;
        Thu, 24 Oct 2024 13:48:03 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243158fsm1468199e87.220.2024.10.24.13.48.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 13:48:03 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fe02c386so2465836e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 13:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXluepgHl6k8M7hHNXV+GYBh1MJB4ts0gFGQULpcFgDDacEbWwgDJ2Sb+99A7C6tz667cwNRrD07Jhl9r9R/Q==@lists.infradead.org
X-Received: by 2002:a05:6512:3b8e:b0:53b:205c:e9ac with SMTP id
 2adb3069b0e04-53b2374a94fmr1177376e87.20.1729802881828; Thu, 24 Oct 2024
 13:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com> <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Oct 2024 13:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, 
	Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
	YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134808_367526_C1EB0E74 
X-CRM114-Status: GOOD (  11.63  )
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

Hi,

On Wed, Jun 19, 2024 at 9:39=E2=80=AFAM Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Always add DRM_MODE_ROTATE_0 to rotation property to meet
> IGT's (Intel GPU Tools) requirement.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
>  drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
>  3 files changed, 11 insertions(+), 14 deletions(-)

FWIW, this patch got into ChromeOS's 5.15 branch via stable merge and
apparently broke things. As a short term fix we've reverted it there:

https://crrev.com/c/5960799

...apparently the patch is fine on newer kernels so maybe there is a
missing dependency? Hopefully someone on this list can dig into this
and either post the revert to stable 5.15 kernels or suggest
additional backports.


-Doug

