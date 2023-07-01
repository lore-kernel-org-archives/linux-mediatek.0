Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D422EB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jul 2023 23:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1KsDVEr7/c2nbbUeIZOJL2boV6COVoYPyMdElGZf94=; b=tQl31Kqv9+P60Qusst6dC2OLux
	ZhfbhpXsbSt23sTNUQ0u5kZKue2HIr6+aVtqXQw7MhJRvJ1omlnckQAsIj1AHOH+z6Phe0O4fz1Kc
	mE57jLHCuJYkkJoJgBueq4VB7jeTwjtZFGZKwrpXg+1aHvatlHvkWPeCoKCJdGb6dErU7VY4zk8TZ
	ASfBkC/NozWmEWzB2hVPT4uP3BWg6FMaqjVN4BNYjw3C+44nN0/wcrOLu9jFxWdEMsqGtp62IPdNd
	USDRc8/lB2jdYnGaV4i+jBAZupSyHpi/loivpdcKkcJzOooyD2fbl/mlQURlJlVpa9Cz7YT9ZCjWf
	j6ukUksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjmc-006miO-1T;
	Sat, 01 Jul 2023 23:13:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFjmY-006mgf-2f;
	Sat, 01 Jul 2023 23:13:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DFC360B41;
	Sat,  1 Jul 2023 23:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6141C433CA;
	Sat,  1 Jul 2023 23:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688253212;
	bh=GICJRTi1UBgWyszLEfObDb7ZtWarNasw276bsUk9Edo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ABeUQ/HYxoMx4QNp6spPUkG54BOEVOZZgI49j1meSVbaR/V8ISazd/2jhieBs5FRl
	 9TXi1qENoQImrN7kgt51WZIu03YBOsL66LlCm7joI7kdAZNjkVBPq+9j2wMQBxzBXb
	 f7tG/QAlAbLP//QLDdrNzyAYh+SlCKFGYRkgId1LE90c6fqo0wgW+fiLktYD+ewhS0
	 uvK+rQj+pH1NqFKPNDZcD5iEDE+WvjG6uNT6ok13FfzxG6fGlGQkA4zcrBbO7KQJd9
	 d2crJt0i7Ln6RJ6uqrMzdgnAvRKGLv9eUwoW9julgFSBvTJedoKmXb2YVyjgOrFaoA
	 dqhEj4XQN/ZRg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb41682472so4921882e87.2;
        Sat, 01 Jul 2023 16:13:32 -0700 (PDT)
X-Gm-Message-State: ABy/qLbu04ooom76ioXM/V2Wt1YN/jeuGHcTfNIHaWQO6muCvHO5J37h
	94IxzA4DdNSlSVkg/QnCvM8BEtwFnXP8Q4QoHQ==
X-Google-Smtp-Source: APBJJlE9BpPtxXnE/La0Tl+6juXJWlIVshoPEKn3r0kp7hY2oRRITeV9xtlN2CPvQoh+eGMqTfvY3/pJslXS8anUemU=
X-Received: by 2002:a05:6512:718:b0:4fb:7a4e:b573 with SMTP id
 b24-20020a056512071800b004fb7a4eb573mr4707448lfs.5.1688253210855; Sat, 01 Jul
 2023 16:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230630100321.1951138-1-jstephan@baylibre.com> <20230630100321.1951138-3-jstephan@baylibre.com>
In-Reply-To: <20230630100321.1951138-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Jul 2023 07:13:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZzR52fQdsC=J_sH60hz7rsRhBnSOL3trzu-KyOvpNqg@mail.gmail.com>
Message-ID: <CAAOTY__ZzR52fQdsC=J_sH60hz7rsRhBnSOL3trzu-KyOvpNqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Julien Stephan <jstephan@baylibre.com>
Cc: Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, 
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_161334_969071_177C9411 
X-CRM114-Status: GOOD (  15.45  )
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

Hi, Julien:

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Louis Kuo <louis.kuo@mediatek.com>
>
> This will add the mediatek ISP3.0 seninf (sensor interface) driver found
> on several Mediatek SoCs such as the mt8365.
>
> Then seninf module has 4 physical CSI-2 inputs. Depending on the soc they
> may not be all connected.
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  MAINTAINERS                                   |    1 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/isp/Kconfig   |    2 +
>  drivers/media/platform/mediatek/isp/Makefile  |    3 +
>  .../platform/mediatek/isp/isp_30/Kconfig      |   16 +
>  .../platform/mediatek/isp/isp_30/Makefile     |    3 +
>  .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
>  .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1561 +++++++++++++++++
>  .../isp/isp_30/seninf/mtk_seninf_reg.h        |   99 ++

I think it's not necessary to create a folder isp_30 inside isp and
you could just place all file in isp folder because there are only few
files. After adding more and more files then we consider to create
folder to separate them.

Regards,
Chun-Kuang.

>  10 files changed, 1692 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/Mak=
efile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk=
_seninf.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk=
_seninf_reg.h
>
>

