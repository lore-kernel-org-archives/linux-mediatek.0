Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6A5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 18:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hglZ5geJcN6+sNlwDrDLZjtnA8TF+rFE1zmy/o/Acz0=; b=KLvn6gDTICWdk4
	NgJoFxgBZDd3o7tDneJlzVyyUbCTp6szlOrKyJpv7pmWdhh+uEMi8BNtvKKGa69KiDYM247N5iBQD
	at6uzdpdyfE/+IgpZTYBxMKOfR3KlgeHjSDn1Ly+Oh6xEMVHR3JRDmQmlM9BImnfU+eVJ4XNqjIHz
	m/dunE3RghFPO6BIL/TwNMmp0w0D82hq9PM05JXjjuq2fON4kIw/GayqjLazEB90xRbOiGp7qI2t6
	AxNZ9nyF9/5c+frOfY2cTR+AYv3IYZVbza1gjW+0Nzz0iqSvmi1uA4ZEo2VEJyWw0uLbd9Q+FRPAo
	OCHLLxPk4ZDHowhsxcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkSl-003AyK-3K; Fri, 10 Dec 2021 18:17:43 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkSU-003AuE-RH; Fri, 10 Dec 2021 18:17:28 +0000
Received: by mail-oi1-f180.google.com with SMTP id t23so14354927oiw.3;
 Fri, 10 Dec 2021 10:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YU9YCbZbDktrwFwYhXC085Scw8TfNhTNhBZqDcowh58=;
 b=FF0IRoQlf0VIilTMe7mOcrRxe8DRMWzisXRhjmugla8m5PJB1vWd/AlNxsV3mYGpoJ
 CfPxnuB81t1J7vnOH5tDTRweg8AQqz/qyicrviPU7x2VQgKqZYOpUjXVMG+MOtLEmdl7
 l5a65D4i7+tFjkUdec0VCf+b1EKodhdSj9sbmhcXDVmxUPvGYXzQctIyo+SvqhrlkAW7
 pDnwxkOSG3GL/lVVhDFKNBnZ2HLAubGF/RYCZlixf5t2op72w3ZPPfrynmgsa5IwDnqj
 hNfY959vcQN7pee0DKkZ3WR53h5ggGSrGHJHRBJXZV6AbGOu1cZ0c9E8h+xZpDo4aKX1
 OpBg==
X-Gm-Message-State: AOAM532bFq1L43YVS94GwqX0COrxChvApu8mcCGlNg9tBWO/mh97HKYE
 D7z//39YfmNe4jZxH3xRZw==
X-Google-Smtp-Source: ABdhPJyvpSgennWM9D8Uf+LQaqbHK2gVSasZ6S9vGBlFwcRSN30Q22MHR58rfH44QR08viRIKDt9jQ==
X-Received: by 2002:a54:4692:: with SMTP id k18mr13899661oic.93.1639160245462; 
 Fri, 10 Dec 2021 10:17:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bq5sm930460oib.55.2021.12.10.10.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 10:17:24 -0800 (PST)
Received: (nullmailer pid 1641340 invoked by uid 1000);
 Fri, 10 Dec 2021 18:17:21 -0000
Date: Fri, 10 Dec 2021 12:17:21 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, 
 drinkcat@chromium.org, pihsun@chromium.org, hsinyi@google.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, 
 allen-kh.cheng@mediatek.com, randy.wu@mediatek.com, jason-jh.lin@mediatek.com, 
 roy-cw.yeh@mediatek.com, river.cheng@mediatek.com, 
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v10 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
Message-ID: <YbOZsd+zNmwOpB4x@robh.at.kernel.org>
References: <20211202062733.20338-1-moudy.ho@mediatek.com>
 <20211202062733.20338-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211202062733.20338-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_101726_910677_B2B98D1F 
X-CRM114-Status: GOOD (  22.32  )
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

On Thu, Dec 02, 2021 at 02:27:31PM +0800, Moudy Ho wrote:
> This patch adds DT binding document for Media Data Path 3 (MDP3)
> a unit in multimedia system used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    |  67 ++++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  57 +++++
>  .../bindings/soc/mediatek/mediatek,rdma.yaml  | 216 ++++++++++++++++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  68 ++++++
>  5 files changed, 473 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml

I'm not a fan of bindings/soc/ either. Put everything in 
bindings/media/. What's the difference between these blocks here and 
the version used for display? If they are the same h/w, then the binding 
needs to be the same. How they get used is the kernel's problem. 

It looks like the display ccorr, rdma, and wdma aren't documented. Fix 
that before you add new stuff.


> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> new file mode 100644
> index 000000000000..d7f104a0f165
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Resizer
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
> +  One of Media Data Path 3 (MDP3) components used to do frame resizing.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8183-mdp3-rsz
> +
> +  mediatek,mdp3-id:
> +    description: There may be multiple components with the same function but
> +      different addresses in MDP3. The MDP3 driver can select one or zero of
> +      them and connect other components in series according to the current
> +      application to form one or more data paths. This property indicate the
> +      selection order of the same components.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]

Again, an index nor an alias is the right approach for this. Use DT 
graph like others do. 'It's too complicated' is not a reason unless you 
show how and why it won't work.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
