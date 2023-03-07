Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FCDC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUGE4NLp1dzlaCpuRsuoXh7GQOmh7Ex8Ez1qpO97Cww=; b=Jr16oCf7eNvQueZn1cLyeeiWef
	jpP6UEJyZjLl4uIjoVaWA62wXjQYq+uz31XqbvGteao5cMhzALT415jjoRhL3paa9+LN6XfgF4Xtm
	CX3k1TPdm/XiL+oFeJbRZbeY4Rtz2nfExLiDJSzVpVnqW2ovw5h1/sBcaqk6z2gfVIS2RZeT27X0A
	TyIeRBK3QWUdYedRvmlAoAqNCkP7IVOhAw8VBcpHUrUV1rpsQujrGvLuOxWTkYpMdxaTfTkwHqxrO
	1PBWDKD6y8IK9V74BBtrcy2rbrYCnW+Ia2Po5+iyeWaUb5q/EjmAiF1Djal/aL1Oqwa/K4Z43vWd7
	mWx48+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU05-00H34w-5u; Tue, 07 Mar 2023 09:52:53 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTzy-00H30j-9e
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:52:47 +0000
Received: by mail-ua1-x92a.google.com with SMTP id p2so8453771uap.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUGE4NLp1dzlaCpuRsuoXh7GQOmh7Ex8Ez1qpO97Cww=;
        b=BVAJ05WjjYYe15giRYYRnN18GQChdYZf706gda4lAbHnGoRJe8RXTaG0wJnnwOcLEG
         hNR6rzX5zoi5OXDO+2A00TzCqWW2vx2T8li26kEjNl7rEAaVmTYnoUvQjtIKPAbVu3vh
         ZhEqsZL3FF++lT86RJGglOGZl/4WljehR4z6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUGE4NLp1dzlaCpuRsuoXh7GQOmh7Ex8Ez1qpO97Cww=;
        b=7hX5wTI9+lEksfAN2pD/JveX+QPndyP0HskmKPjjGfDipY3UMUOKaviWlt/zogJkLn
         aZ2Ouz3jkkz9m2JB8W3Dnq8Y9O/EOuk6lx9ESUJEU0lmiZIGMsv+1JQfjl6x3XNkQRj+
         e4BEldhNfDGkw6uB9g51p2RFDUsHCOZf2zPRZn43aJIZbZl4ZB3ty3/DI4Nsc17bGVRo
         eMbwuY5zyaGRl3XwCq6ICHXzm3EvR8VG46BZ/nxY3TuFY8CuEayRlYJd0aRNC0uIYwhm
         h1I/Ciz4YuWnxbpySXampKr7NHIPVxx/dL/HeLtijcpdFMDbf3blRA2dXPxtgrLoCryF
         oL+w==
X-Gm-Message-State: AO0yUKV8lJWkbc+W2ktqjFxTcji17SsLgUbxZHHoxk3b5zowspJWivmm
	E9m/e+oXZDXSZerCr9YFHI4IUjHNXmtqal71edQuQg==
X-Google-Smtp-Source: AK7set99pajDzF78Cn1Ybb/FJD0puSgRBTD5C6iX7PfjJMAHS1OJ7pSRgHhIKA1sI9K6oLm73zy7R2g+hfTT8VQSDKQ=
X-Received: by 2002:a9f:310a:0:b0:68e:33d7:7e6b with SMTP id
 m10-20020a9f310a000000b0068e33d77e6bmr9296190uab.1.1678182762200; Tue, 07 Mar
 2023 01:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:52:31 +0800
Message-ID: <CAGXv+5F9afH2x=yioheatsaWvf9y8XDSdXCs=R3eM_1GRDieEw@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] drm/panfrost: Add support for Mali on the MT8186 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015246_347802_C4F1ACF3 
X-CRM114-Status: UNSURE (   8.92  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
> and platform data using the same supplies list as "mt8183_b" (only one
> regulator), and a new pm_domains list with only two power domains.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

