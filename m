Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96401C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE8h2jNNZ6vFW2z7uotyBC53nGYQN5vB31WOkuARonw=; b=ybsuw16TLvvg0DAoH3Rq+YUdtK
	pQI11ZBYjRAjzlJdnv0xHZmd8kzE48VP14s2n7sFDYXaIHk+BwituQTgZJScWKKyxDv3azfxbKZHv
	BBMPFy18RztaD8ebmoGVirtCw5NveLOCAnlyGEMhXxG/Nq0ZoYxsl0GqUeWu8+g/58NXqUJTznkTH
	Yu+/9KsnJRaaPYmpRzF3NJLXQcGSkWSCveKo2++v6b8fHRefgKqrOgV3mC2sj2HUgSx0JJ7ZosXuZ
	3SUA1eljUrNwHzlVxOcsgLFLl4mACn0w/pfITaGjJjXm/ZIKTyHbeNz4iI8a3/lzS/Am1RiWLQ0Wg
	VQVu/wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsOo-00000000lmf-0tCd;
	Wed, 19 Jun 2024 10:18:42 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsOl-00000000llk-2gET
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 10:18:40 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3d516d3f0b2so807002b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718792318; x=1719397118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE8h2jNNZ6vFW2z7uotyBC53nGYQN5vB31WOkuARonw=;
        b=FKkAjh9kDE3J1W7IU56kePd8A5gMlakyJTDYZCaEyh5MX7nRb2FOzcM2XV2127fp+0
         stwEaO5DwS21FW55OOUDo6dTLx+CSd7kCr3OnUwt3LTMljSocBiDykzvVpqxGQ7ZTNrs
         zP6SkU4JKv1ljlsVDVckt5tUtaC2sVMZX+1vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718792318; x=1719397118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE8h2jNNZ6vFW2z7uotyBC53nGYQN5vB31WOkuARonw=;
        b=IAu8RtAezowjOsgJ1jFqhmZjkxmoloJWz0bnw0CAzCNd2GGPRnBeXzTDbO4UW45pad
         tCiuVj93BuHHPfF/YBEn3MoreXhk4ZV+CmEBIEDXSxzCjUc5TMNsd4SqPd4ZHXbSm6Zp
         kGlFdmUkTjw4jUi5g+RWU6UdGkdTIsz7W6MgS1FPwqzRzdkKIoMGlWQsLty6dib/Lgy5
         NTzXjXQ2npFH59UB3WcrAbg8FNXlvOwJYFQIou5cXaOG2lewfD0tRyAgpJXDdjU/d7fX
         52qdKE33L2x2orCHY11sga+kxWmvF8WWAcIeTW1vEji80kNnhkf+a5RgbD+eK419UTZ6
         PjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWYgaVQrhbhreBmDi7SccWeci/dtr7yynENv0jldNLMmDlfyIODPwO8sqH99vunnPNFC1yCs6g8+O6PgrSIDh/3MuQ1zN1xd2kMH6YNaZjxwaL
X-Gm-Message-State: AOJu0YwMyWGpNuf4qXUOPn4gPg5oeWlTZMqpzTd45T9OFanaZoB0p9I4
	j9T6xnuKYBp/1I+DTkoTT9lPYS0TsyPN7C9kHEUlKCF44iRhIf7MpM/DJ2hxomfOgG9ChJvB3+Y
	=
X-Google-Smtp-Source: AGHT+IG1/mP6550+FG464tLNDn8liCYA1Hxmu8lCpt3FLV/GtSJNjVCv4JGOLdM1+Npku36B+/6OYA==
X-Received: by 2002:a05:6870:6124:b0:254:cbaf:1216 with SMTP id 586e51a60fabf-25c94b040c0mr2853439fac.27.1718792317856;
        Wed, 19 Jun 2024 03:18:37 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-259847c97ccsm705836fac.51.2024.06.19.03.18.37
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 03:18:37 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b970e90ab8so3654006eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 03:18:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBiQUb49q4OigjVKrv77+q+D7A2BbxQ5strbdv7POPajhmCV+UfcOzSJDLKN4vLu/FGA7Or8547s8W9s6emzxujcaQXuCsTlgHh7iO1MUGp9eH
X-Received: by 2002:a05:6122:250e:b0:4d3:45a2:ae53 with SMTP id
 71dfb90a1353d-4ef27845548mr2420871e0c.16.1718792011586; Wed, 19 Jun 2024
 03:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com> <20240322092845.381313-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240322092845.381313-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jun 2024 18:12:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1niC5ZePFFbEM6Fhr4q7kNqv45uSQNnTp1U8pesfe5f_Aw@mail.gmail.com>
Message-ID: <CAC=S1niC5ZePFFbEM6Fhr4q7kNqv45uSQNnTp1U8pesfe5f_Aw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: platform: mtk-mdp3: Add support for MT8188
 MDP3 components
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_031839_693035_174FC559 
X-CRM114-Status: GOOD (  12.59  )
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

On Fri, Mar 22, 2024 at 5:29=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 and MT8188 share a similar MDP3 macro-block, with minor
> differences - as in, the latter supports a subset of the number
> of components supported by the former, but are otherwise handled
> in the same way.
>
> Add driver data for MT8188, reusing the already present MT8195
> data where possible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 ++++++++++++++++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
>  4 files changed, 285 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

