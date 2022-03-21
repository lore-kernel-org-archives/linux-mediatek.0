Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 04:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXjOzMTQ7//e114UQ0clDG9V5znIzXYLo7CHJ3JrXxk=; b=Bj+Yg37tqFZlO6
	Zm50wiV296KEZP0pPjX/uHuI50uC1jbbXZ266QzfraShNdXYIenq5Wa7sNIdeCtUNL1Odzw8+w7oB
	wQO6xXNe/OV4l5gu4pNt/sD27+WuAYO7hlx0zXpgnnZH/XQqt4H+7yaCbV5AA9fF4ShKKfC8AFdtv
	qNwmhXD51p4d/tR9GgEY4DfpMFpWrjj8Ro30AH6g8sGX2Vn/jB4ZI3jeEmxvq7mIwCfdosB2UKKgL
	2al/qEMcvdg23XjGO+J5nD1M/53AZjf8nGW0RC94j7vp9u8QybyfAAAz8IbUcwVa5bbYaR/5G7e7O
	ppYMFCsKX2jI7MzIuZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW9bq-006T8U-MJ; Mon, 21 Mar 2022 04:25:34 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW9bS-006SzA-Cc
 for linux-mediatek@lists.infradead.org; Mon, 21 Mar 2022 04:25:13 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e612af95e3so31325477b3.9
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Mar 2022 21:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4NSXl8x9VQewgRZHgqXMmZGOEdV3eFjb3sYvvvg6pNg=;
 b=J6gele5F7EmCQLLAJAVg85lJycQ/fkbtMV60Bxn6mvBD54K/cP91HfuCJSamixeAe6
 SMimZpLUVi6GEmvbVU07gyHdeCeiYdtk4dmtLUJ8nH0xQuKRP5nXagiIZ3LrTCv9YfDe
 C+mSOTSyfmPr+Jge0Xnm2nipVd5HfDakmx2EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NSXl8x9VQewgRZHgqXMmZGOEdV3eFjb3sYvvvg6pNg=;
 b=HHcsXUGmvppQ0airmRzuYByIDOSM35MquWkK431IIiGIkofmmgAOyNTbt8bfplk3Z5
 1izH8rRYiXMFdFJ7us6dM1E/PW4xPA7+dpyTCC6lgkMUovBTgK1FOo08B/+7STW8nrAK
 fm1RcFIncBB9SSvUGC8PhDEXBUd6uOnnGK1F0Lr0K7aQJBy8mOj7iGGcB94sMFoKZ1uz
 fa/Xo1cc6DTsCLd73aj0w3HQn+9Fpr4DDEMy0zOW7j0zmeINSjKGbjRZf0kphaSnynmd
 qeHerzFY6vAhk+j948a7McSwvOA/OPxIJ34MjFCO3jm3UNI1Nvqbuhs/14nu7zEW66S8
 M24w==
X-Gm-Message-State: AOAM530NMmE0F/GPlqM+WWN3BAKhZPHJT1L6aBx5fCcwVsNvslBAXfmJ
 iyeUD5TpKlZcHL2tswGmtORITn9lxED5BkJVeUNT/Q==
X-Google-Smtp-Source: ABdhPJxzqdQkJL+E26J8ZUZbTwrpFeuieBZ6OBpvDJ70M8HbgvzqPpoqzxqTXlsc0yVVk8krFj2m/iV9tyn319SkBwY=
X-Received: by 2002:a05:690c:9c:b0:2e6:4ca0:d140 with SMTP id
 be28-20020a05690c009c00b002e64ca0d140mr502772ywb.161.1647836709475; Sun, 20
 Mar 2022 21:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
 <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
 <319cf016-55fb-dcd4-9157-ad795c8e68ff@kernel.org>
 <e0adbb4d-aa87-49ea-d79f-11c5f4fc4bdd@collabora.com>
In-Reply-To: <e0adbb4d-aa87-49ea-d79f-11c5f4fc4bdd@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Mar 2022 12:24:58 +0800
Message-ID: <CAGXv+5GzC_LFd_1uTBDT=2otiUrJn9NGa4g=R4NhED7-p-G9RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com, Randy.Wu@mediatek.com, 
 jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com, 
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_212510_451521_23BE833E 
X-CRM114-Status: GOOD (  22.46  )
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

On Fri, Mar 18, 2022 at 9:56 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 18/03/22 14:51, Krzysztof Kozlowski ha scritto:
> > On 18/03/2022 12:12, AngeloGioacchino Del Regno wrote:
> >> Il 18/03/22 10:54, Jianjun Wang ha scritto:
> >>> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> >>>
> >>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> >>> ---
> >>>    .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
> >>>    1 file changed, 75 insertions(+)
> >>>    create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> >>> new file mode 100644
> >>> index 000000000000..868bf976568b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> >>> @@ -0,0 +1,75 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek PCIe PHY
> >>> +
> >>> +maintainers:
> >>> +  - Jianjun Wang <jianjun.wang@mediatek.com>
> >>> +
> >>> +description: |
> >>> +  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: mediatek,mt8195-pcie-phy
> >>
> >> Since I don't expect this driver to be only for MT8195, but to be extended to
> >> support some more future MediaTek SoCs and, depending on the number of differences
> >> in the possible future Gen4 PHYs, even different gen's, I propose to add a generic
> >> compatible as const.
> >>
> >> So you'll have something like:
> >>
> >> - enum:
> >>       - mediatek,mt8195-pcie-phy
> >> - const: mediatek,pcie-gen3-phy
> >
> > I am not sure if this is a good idea. How sure are you that there will
> > be no different PCIe Gen3 PHY not compatible with this one?
> >
> >
>
> Thanks for pointing that out, I have underestimated this option.
>
> Perhaps Jianjun may be more informed about whether my proposal is valid or not.

Just FYI, for Allwinner and I believe Rockchip as well, the compatible strings
always list the first SoC the hardware block was seen on known at the time
of driver/binding submission. No generic compatible strings are ever used.

Not sure if that's the general rule or not.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
