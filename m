Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B8DC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2WyWqf8Mv0ry/BlWjYTQuMB9f15uMCTP74er7Taf4s=; b=NT+BAhV5zVX2W7ZrWpqDO2u7xC
	xcBSOX1Q2azbvtI/TjrKlOUxJCYWb1JJWHWrRu+Oppez7nHl7WfGPfEANBhHWb4tCbmo+0UW6jxJr
	CEs+H94Vkina07Ms5SgBY7g9wsos+aTasG9NFIziqb5u1bpr9/2kzLO6XAatY7AXyVFjSy1Uk65TE
	VdbXawQp84fKeB7/LyXn4qOLXxvgexW1J06kybViwjX+98BVLEaatOs5A59gg6f1h4RHo3ksGDFjo
	m15Ay692zJm/rkA3JeYQBlY4Ocor7XM0ix6RqNAVDg+lhrdpmxjijspxdCZKMTGjAr8gkNTfRDF9f
	r/0Cww+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXshs-00FQGu-LH; Mon, 12 Sep 2022 23:19:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXshg-00FQBq-41; Mon, 12 Sep 2022 23:19:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68904B80DCC;
	Mon, 12 Sep 2022 23:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A56AC43470;
	Mon, 12 Sep 2022 23:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663024736;
	bh=Cbxm+wScoYOf9uPveDUFKU8DcvePcdgz86AWflGIWGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rvTMuQ7WeoupNppQh23rMin98zJBenTTh0ffkK+vAqBMaNLE4c3BzIakEvwtytdTA
	 zcFFV8BbKHNLWAnAEwG4o6mYHbTnzD8r+6TIc3Jtz8aS3S68BRvkIuSIZWRX0to0SQ
	 orZAAg64mcK9WhsBrPW7i3PyHosRp13pm9ouNzxRhF4B5sF6sZdTQoiPaTr7A6HIpd
	 h/XBvDcW7OPYMf73P3PGafLlm+/TLf/b045wwxLeFUhZ+8xcuG2LoLX6CQiFxQ24L2
	 J5h91f5jmTXwzBtnKBaq7HAmlrhOvhtIC5x6wjWHGeDgc1An/6BW8XgjlxRxqIND5+
	 3Humv28P1fyGQ==
Received: by mail-ot1-f48.google.com with SMTP id t8-20020a9d5908000000b0063b41908168so6920080oth.8;
        Mon, 12 Sep 2022 16:18:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo1kdLjbD+J4B+JQGqISCvUZPWqPkNI66kmfBYQhQ8xPCZz8ylg2
	7D60fi7nbfAopQ/P5Ge0GSeWbJzsnYmSEgPG3w==
X-Google-Smtp-Source: AA6agR55s+Nptinq02WALbixXv8dp5IISYyISRrmH3F234MXAeWMGzIeiugX1fRAbtZ5vhUEAsCawoybA9uXwAw5ejc=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr11827454otb.278.1663024735220; Mon, 12
 Sep 2022 16:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220908141205.18256-1-allen-kh.cheng@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Sep 2022 07:18:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=cNCLhvCAEnPsw3Y4iBE=g9aTS+QLZXDVZH8N3cj+xQ@mail.gmail.com>
Message-ID: <CAAOTY_9=cNCLhvCAEnPsw3Y4iBE=g9aTS+QLZXDVZH8N3cj+xQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix wrong dither settings
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_161900_506561_50317A73 
X-CRM114-Status: GOOD (  17.13  )
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

Hi, Allen:

Allen-KH Cheng <allen-kh.cheng@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=
=888=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A10:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The width and height arguments in the cmdq packet for mtk_dither_config()
> are inverted. We fix the incorrect width and height for dither settings
> in mtk_dither_config().

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 73d3724745db ("drm/mediatek: Adjust to the alphabetic order for me=
diatek-drm")
> Co-developed-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 2d72cc5ddaba..6b6d5335c834 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -157,7 +157,7 @@ static void mtk_dither_config(struct device *dev, uns=
igned int w,
>  {
>         struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
>
> -       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_REG_DITHER_SIZE);
>         mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv-=
>regs,
>                       DISP_REG_DITHER_CFG);
>         mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_REG_=
DITHER_CFG,
> --
> 2.18.0
>

