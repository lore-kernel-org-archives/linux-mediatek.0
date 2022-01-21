Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F0EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn8K0mYoXTmovoku5UKsuYmNedT4um9uTY3Acea2Nbg=; b=dHAZX8aqbgvkNM
	TVnTea6nkrhYO0k7HUuYh5mNMSkW21o8IIQlRMMWAyeyp5ERitztm58zFHKpw97bqkLqD2u4wtWuY
	nG9Wji0aINng4oLoWTbO5a0Zgo2NrzH7sJvdLuy+Ro7iyeO1W6K47wBpHQOiPALu9M/nSkjbpbzhn
	le86YcPTbuLdqoLa9vPWHaTGRYpl+F0/0uo01r8dY33TXgCZNjAVeH3OSR9JuwwCJYQqGQnrvSc2j
	qIYLkACIRM2VzQxzuTB9vGLK2rAXt6ViUMAd7VrVjCbxl5u1u/Tp45SVK7fDbQBnUNVd4RF7t7xMm
	kZ8Fqvr2bc9u4IJIKrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB181-00G4tT-HC; Fri, 21 Jan 2022 21:07:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB17p-00G4ra-Br; Fri, 21 Jan 2022 21:07:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBED661862;
 Fri, 21 Jan 2022 21:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECF5C36AE3;
 Fri, 21 Jan 2022 21:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642799230;
 bh=089tvZeJfnrUsvrEacemjg/8ubghXaxBlNFpompPN9s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u3ESIMNf26/2y58DPKWZwUwPGob5WnqdLJuBFldic8ux6SzmVOsuZXMt9zUM81rH9
 sQDopliPwWT/2YX9BZfrRlhFmFL+6/VBqrPXPqY7N0zTg3L6RZ+Y5oxHosqxIzJBHH
 BfWGf/X5lkhuCEe5yVyXyot2FHdkJYDwQjA3T3kAo6/lDqvyjn1QtunFpz3k1+0b0h
 AdyDpdZvcZLqTS2ilSli0/24KcckzWnsnq8SOTOor+1bJNdG0d03qDaTHePUZD7iIV
 AJ4IRE7dNOzYOEYXlHj7+zxUZxPO0zs+jjlgrURugGWpjB9n7aeqm58yeIitteg/hC
 vv8rC8TAl0X6Q==
Received: by mail-ej1-f46.google.com with SMTP id a8so3337904ejc.8;
 Fri, 21 Jan 2022 13:07:10 -0800 (PST)
X-Gm-Message-State: AOAM533VbWk8fQv2ofKw9dqRN5kxgd59XKeVW9LJle8gxAxLemkcjAFW
 Q9vlfbcdKACXFOM+yxZgpPVF69xqNO8dFa4vfQ==
X-Google-Smtp-Source: ABdhPJzqTexivh1nIIrrin0+gSI1gf48e0Cr+GAzce0ilw9MmhV+9Yl/P/ftNrRo9eCqJTDvBx9AEGTjE43kmQN8KcE=
X-Received: by 2002:a17:906:7801:: with SMTP id
 u1mr4650474ejm.82.1642799229094; 
 Fri, 21 Jan 2022 13:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
 <20220117055254.9777-15-roy-cw.yeh@mediatek.com>
In-Reply-To: <20220117055254.9777-15-roy-cw.yeh@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 Jan 2022 15:06:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcT4_h+5_ci5423rKzd8E8uJZyt7nus-zs+X=ZozPM6A@mail.gmail.com>
Message-ID: <CAL_JsqLcT4_h+5_ci5423rKzd8E8uJZyt7nus-zs+X=ZozPM6A@mail.gmail.com>
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek: mdp3: add yaml for
 new modules added in mt8195
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 Moudy Ho <moudy.ho@mediatek.com>, "river . cheng" <river.cheng@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_130713_524633_CE8533EE 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 16, 2022 at 11:53 PM roy-cw.yeh <roy-cw.yeh@mediatek.com> wrote:
>
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
>
> Add yaml for new modules added in mt8195
>
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
> This patch is base on [1]
> [1] dt-bindings: arm: mediatek: move out common module from display folder
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20220107101425.6917-8-jason-jh.lin@mediatek.com/

Looks to me like this is based on:

https://lore.kernel.org/r/20220105093758.6850-1-moudy.ho@mediatek.com

Can we have some coordination between all the MDP3 series. I have no
idea how all these sub-blocks fit together to provide any meaningful
review.

> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  2 +
>  .../bindings/media/mediatek,mdp3-aal.yaml     | 56 +++++++++++++++++
>  .../bindings/media/mediatek,mdp3-color.yaml   | 56 +++++++++++++++++
>  .../bindings/media/mediatek,mdp3-fg.yaml      | 55 +++++++++++++++++
>  .../bindings/media/mediatek,mdp3-hdr.yaml     | 55 +++++++++++++++++
>  .../bindings/media/mediatek,mdp3-merge.yaml   | 54 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-ovl.yaml     | 53 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-pad.yaml     | 56 +++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 28 +++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  2 +
>  .../bindings/media/mediatek,mdp3-split.yaml   | 58 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-stitch.yaml  | 53 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 54 ++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  3 +
>  .../bindings/soc/mediatek/mediatek,mutex.yaml |  6 ++
>  16 files changed, 652 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 763c62323a74..9e59c8b738bb 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,6 +31,8 @@ properties:
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8192-mmsys
>                - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vppsys0
> +              - mediatek,mt8195-vppsys1

What's the difference between 0 and 1? Defining instance indices is
not how things are described in DT. If this is just the same block
with different connections, then you should be describing the
connections (with the graph binding). If there's some other
difference, then maybe those should be properties. I'm pretty sure
I've said this before.

The same question applies to the rest of the schemas with numbering.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
