Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6E0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=symJGMsghCtGvBGMFumnnn8XSl8s5K5BSajbCGhbLM0=; b=GMMMK8+5jVFN4tRr9TvfDhzT1K
	8tqQy7YSU1TgS1UURi0m60YHKrzNb38uFLOl/7F63of3AC+kz5EinfCZWregAU9O8BROVVphzH9Zv
	VfNWSijyjeZZ8KHfWVqcmEIk823Q3rnjIHWKXLKb1E83kW+0g+eVZXS1GKXvHj0K4F8hp6/vKeT0v
	sv/8Il9yk6j61WxGg/KDV9e/ImJaBBqUExmhoWhPXNEr55b4CNPo5oHc8l+GKxeh5KhLMplUFWJ2F
	Ami1ay4XswAaZV/B5kFWz0ddNBNQeGgsmn7JrY3BhIXO8qwfnGsE3zvp4/L5drDb0+47z6cB/55Ns
	KdS/1/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTfL-00GbQl-0U;
	Mon, 14 Aug 2023 09:15:11 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTfI-00GbQC-2o
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 09:15:10 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-77ac14ff51bso161330339f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692004505; x=1692609305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=symJGMsghCtGvBGMFumnnn8XSl8s5K5BSajbCGhbLM0=;
        b=eGRs4Ay+ND26wAbcQ1FlBvRI1gxFQO4+4/mt7ZmNa7fu4gYZ/hsTcRUrXrlzlKnTWd
         x/K/x+VOx/r2+LxmYt3Cjy4BVWiYQXO/0ipPsO3xOUqPtwjSajLEUe1c86KaASSZorBl
         XFIFzewmmBUiONdKoONnkaKvKbLg/e9GPPR/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692004505; x=1692609305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=symJGMsghCtGvBGMFumnnn8XSl8s5K5BSajbCGhbLM0=;
        b=OLTGC3SLMi9Xz0jkJCFOygegAOEGYl9MW6ioHpU/HSry2lFXR/OjQ/H3xT0KP8SI7R
         B5vabTe7KYXaPEEVmwE5NZnknZ8X7PDu/xcTh+FDguxuEw/IKsw2YoYb9gLtugQXhDs3
         8pXPACPcSaQdk8d9xcXNUg1zVffLVtzTI8fxwwSnq4+o4DvXIjLBbr9TyIfdoLNNXNm5
         BXGjy6krnJhgasT5pLg/ipj7cy6HYbneRroC9hw26+rMMguekNYMZL0OVTBd7cMUtXAT
         FvCt8mAWxgreFv9dw1/N1Okemr9KwueuQ1uUXP1zCbHkB8fpKfSigvaSdTjElPwGFm+m
         uoSQ==
X-Gm-Message-State: AOJu0YxNkK8n/Vs3x31QcGn2wssQhBy1fgfe6vPHThpFU9NwO0Y+eICL
	zUqORLIsPRm70xeeZrUHkgmCnkfKZMJgC3Ty4Ss=
X-Google-Smtp-Source: AGHT+IHaA+0IfYc/mxi/v2xxtcrXHS8hCcgRsz5rsCPyBYPsxOEw2eQ6HsarjAVJDTcIZsvQgDgerA==
X-Received: by 2002:a5e:8b03:0:b0:783:72b9:ed67 with SMTP id g3-20020a5e8b03000000b0078372b9ed67mr12339599iok.10.1692004505713;
        Mon, 14 Aug 2023 02:15:05 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id 7-20020a05660220c700b00786aa1eb582sm3122111ioz.31.2023.08.14.02.15.05
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 02:15:05 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-79093c0c68bso161988039f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 02:15:05 -0700 (PDT)
X-Received: by 2002:a5d:9ada:0:b0:787:4b5f:b6cf with SMTP id
 x26-20020a5d9ada000000b007874b5fb6cfmr11533549ion.5.1692004505047; Mon, 14
 Aug 2023 02:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072842.28597-1-shuijing.li@mediatek.com> <20230814072842.28597-3-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-3-shuijing.li@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Aug 2023 17:14:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh9QtE7CNpsUujqSAM-Q10Mb8dOfXYtJQebvw4RifqOBA@mail.gmail.com>
Message-ID: <CAC=S1nh9QtE7CNpsUujqSAM-Q10Mb8dOfXYtJQebvw4RifqOBA@mail.gmail.com>
Subject: Re: [PATCH v4,2/3] drm/mediatek: dp: Add the audio packet flag to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_021508_912309_0C710AB3 
X-CRM114-Status: UNSURE (   9.09  )
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

On Mon, Aug 14, 2023 at 3:29=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> The audio packet arrangement function is to only arrange audio.
> packets into the Hblanking area. In order to align with the HW
> default setting of mt8195, this function needs to be turned off.
>
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

