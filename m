Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B696CE7A8A
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Sep 2023 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2aBbUyWzwzTAvUO52hhWzPsbt/+Uu1qyeSfBxvH+Zg=; b=ucetQFJY2rqqyqaPS7G11j/WdB
	5vs8QPoNwLAjg6a8yLAOabtRszkewMmHsfCkMU6/3+cg5Bi6Bu5T5hIzS4FEFDZxfRTMZ2IXej4hB
	ANlvKZ8mCH3yqzVrJI+8mdR+vY5WNoWuMOtPPyeDr2xvpPrwUMoNhWwjeOezxphWym0esD5gj11eU
	zkArWP0t8oXPgQR5KXaEn0kMy6bEhf7qp6Jf35aAlFjfb2lsiJ1zQ7W5E8nlj3y5vN/2lRWLcNK40
	hRv5BXV6/aa6dpMxI5jbQ/uhc6O90ErMwgbRhFgFNp2rrf56sekomCKGTyMBFCHac5/k+vXoPzLIe
	fqXVr25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkPnj-00CLcT-0K;
	Sun, 24 Sep 2023 14:09:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkPng-00CLbo-14;
	Sun, 24 Sep 2023 14:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 40714B80920;
	Sun, 24 Sep 2023 14:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A5EC433C8;
	Sun, 24 Sep 2023 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695564569;
	bh=hzaEJsc/MvyTSiwHDbUNHX3pHjivtFFehSFljD3hx+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JM4HtDoi5L9D14lI5GjMrgBYkePbSfp+99S9Vxtv2UgpN6rzsdjlKCjQQ3Ot9n34Y
	 tMMnyMNOz6LtOPhj3Jy2SurZw80l3tQUw36I8sua/AgmCkMdj5SCrCTgk1ZdTkGu3v
	 GB2O6xlqj3GT01oaMFF5LLs9BrvuZASKoIlXlFVQCj5XFNM/h42GWVCQ10pr4cozh1
	 y23Uw1Lw8PMUyefeFQsBVlxUThZjxCEejfo4Gm3jhmZSWb6riwO7WAfxK4hC1R0chU
	 xjhOrfjk+wTonCh0qL5tty5G9ZA3OuJLUYlpioJ1CnV+hLPgV8e4aMAeCVoWpeVBCR
	 NyTpgJBHn4JPA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50307759b65so7844256e87.0;
        Sun, 24 Sep 2023 07:09:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YwCsBeuNui1bRpf35n7MxriETE6GTl3uw95bT6C3Jmdq4ns4ivj
	WAE6lDvn4Gpi20ea1dzYedZGyu+MXmQp2jRHeA==
X-Google-Smtp-Source: AGHT+IGJ8a+c8899BJiT8DoTZkR0LqKr6jfxQvm+fUmHwVYOOXPzJ4ByxiWLhAZmxxEqpxpqDluyHoh50ZPqstltjjY=
X-Received: by 2002:a19:3803:0:b0:4fb:89b3:3373 with SMTP id
 f3-20020a193803000000b004fb89b33373mr3292427lfa.43.1695564567547; Sun, 24 Sep
 2023 07:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230822024155.26670-1-shuijing.li@mediatek.com>
In-Reply-To: <20230822024155.26670-1-shuijing.li@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 24 Sep 2023 22:09:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-xEunh0AOKTYEWn6BV5DM9zU81gsP38P1x1a-3FnpQXg@mail.gmail.com>
Message-ID: <CAAOTY_-xEunh0AOKTYEWn6BV5DM9zU81gsP38P1x1a-3FnpQXg@mail.gmail.com>
Subject: Re: [PATCH v6,0/4] Add compatible to increase MT8188 audio control
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
X-CRM114-CacheID: sfid-20230924_070932_523078_0669E143 
X-CRM114-Status: GOOD (  12.68  )
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

Hi, Shuijing:

Shuijing Li <shuijing.li@mediatek.com> =E6=96=BC 2023=E5=B9=B48=E6=9C=8822=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:41=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> Mainly add the following two flag:
>
> 1.The audio packet arrangement function is to only arrange audio
> packets into the Hblanking area. In order to align with the HW
> default setting of g1200, this function needs to be turned off.
>
> 2.Due to the difference of HW, different dividers need to be set.
>
> Base on the branch of linus/master v6.4.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Shuijing Li (4):
>   dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
>   drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
>   drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
>   drm/mediatek: dp: Add support MT8188 dp/edp function
>
>  .../display/mediatek/mediatek,dp.yaml         |  2 ++
>  drivers/gpu/drm/mediatek/mtk_dp.c             | 36 ++++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 23 ++++++++----
>  3 files changed, 54 insertions(+), 7 deletions(-)
>
> --
> 2.40.1
>

