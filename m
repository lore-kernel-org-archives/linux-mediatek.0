Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C268C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Z8arH/L8dbgBy2K8H+HC60RfY1WMKLKdBsQeTpXgQI=; b=gfYEntkVCwspncajo4r6K6CW+y
	z+7RkKuUlrHGQiiJYsyMQO2LhRh4/XYH88fXCufY28ecGXDlMZOzVS0bcG80p5JBndYHhOs1hiR+4
	8peBv3vj0YV3tJ3Uh0C6iUXjF7ukO681aKThvEf5vRMBR7zBvOYFIB5H3HNKQ/Oh5Rwkh+Ha/e8D4
	OmlLFXcymoGrpSD/7a3Zt2RBC9KdbSq4feGi1oAfKsGoGb7Odk624mHbtK8CANB5KCDa1RWb3DDrq
	xXXRqNGd0eZjGWccQ1tmNxShv0pDm8acd6Vf+gKSKHEFCbloYKjiNgSXIkPqkJpiBdUqtfGrew4Yf
	d2IZ1Nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r18cS-006t4N-2h;
	Thu, 09 Nov 2023 17:15:04 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r18cO-006t0w-1H
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 17:15:02 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-778940531dbso68718085a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1699550097; x=1700154897; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Z8arH/L8dbgBy2K8H+HC60RfY1WMKLKdBsQeTpXgQI=;
        b=SmK0wTBVUqnp1fmGpD6D3jKoCKsWjQ+7/M5AzySH++L58Cb5l2ogy+wi9caneETDq6
         ATJ3WDYPUq2mvXaGNeFZgeT8PVBMhEMI0stBYxskxm1rPYSEj8x5fJROmMMh2btvq6AP
         uLCQqQ9+ColBMhj/8atwIx1ROmAMX1V8O1gEIEaVw8i12NeyPYoFUvzl6L4nJcBzk+gA
         rniK6V9X/czCPjxKsUd7X7o3xSYrHYVr7vUSjqTbesL5BhGJt2FTM45sOx/gDXDD/LFl
         C1/EL+Mk8F8BXdOBxq1xuUm8LDzP9kZ8TcH/gS0aqcWo+ftCjU58swASSizB7hkReYMK
         GEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699550097; x=1700154897;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z8arH/L8dbgBy2K8H+HC60RfY1WMKLKdBsQeTpXgQI=;
        b=ueOeKI75GrnygOU4CkYgnZ6g+jYgHOMneyASpsPC76KgJFTAUxjCQ1CGuTQfPVDl4O
         LM1dDN87C/j20SoqcP6lo+3D1RmkA3q0vvz1oO9tLTovjkvccqfs+gjGVpZPqlz7WQ2+
         QSFFRvLUlPlWCMerDdTfMmjd14E5WMr4GaBLQkoAhtabRNLnudfqdYLwnkiQi5Kei7r5
         Ep7OzLOQCBVdbeScjRvzcj7cb13DBOwdB+MycgbE0QENP+/BAN4l3g9fL+R/sFeeyzDM
         0FrHgyx9SnKINPAgpYeantd4ZMeFNM8OGA/x1mml4RrmIqI2hvPwXN55c9e0d/wb5aFa
         0/SA==
X-Gm-Message-State: AOJu0YyPzwE8YtO9fDogZpsxIIZb4kJwnLY3PzUR1dylCs4fIbXA28kD
	R0ftIz99FG7nqCECE8aw1ksHEA==
X-Google-Smtp-Source: AGHT+IHk0n0eRBECeJL4V3CQV/YSwTJA0WV6rOAi2qVWDwbsxMkM1rm/tlV9wSVWqrrPcgEnKL7yxQ==
X-Received: by 2002:ae9:e214:0:b0:777:617d:5f6b with SMTP id c20-20020ae9e214000000b00777617d5f6bmr5042051qkc.36.1699550096816;
        Thu, 09 Nov 2023 09:14:56 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:6dc0::c73? ([2606:6d00:17:6dc0::c73])
        by smtp.gmail.com with ESMTPSA id d27-20020a05620a137b00b00772662b7804sm34891qkl.100.2023.11.09.09.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 09:14:56 -0800 (PST)
Message-ID: <74c95ceb6c8554fb850ce79d6c75b1ca5a6b2514.camel@ndufresne.ca>
Subject: Re: [PATCH v8 00/12] add support MDP3 on MT8195 platform
From: nicolas@ndufresne.ca
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 09 Nov 2023 12:14:55 -0500
In-Reply-To: <813b3a54-f973-410f-950b-d99f6e563f1f@collabora.com>
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
	 <813b3a54-f973-410f-950b-d99f6e563f1f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_091500_645789_5367E564 
X-CRM114-Status: GOOD (  22.34  )
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

Le lundi 06 novembre 2023 =C3=A0 13:45 +0100, AngeloGioacchino Del Regno a
=C3=A9crit=C2=A0:
> Il 30/10/23 11:06, Moudy Ho ha scritto:
> > Changes since v7:
> > - Rebase on linux-next.
> > - Dependent dtsi files:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
97543
> > - Dependent bindings:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
97555
> > - Patch [9/12] has made corresponding adjustments in response to the ch=
anges in
> >    the compatible name of the PAD component in DTSI and binding.
> > - Adding WROT compatible name in the MDP driver's of_match_table in [9/=
12] to
> >    avoid deactivating 'pm_runtime_*' functions.
> >=20
>=20
> On MT8195 Cherry Tomato Chromebook, whole series is
>=20
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>

Would you mind dropping a short description of what your test consist ?
Which userspace have been used, did you cover all the pixel formats
combination ? Did you test scaling, rotation, etc. ?

Nicolas

>=20
> > Changes since v6:
> > - Rebase on v6.6-rc5.
> > - Dependent dtsi files:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
92079
> > - Dependent bindings:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
92477
> > - Move the patch that fixes compile warnings from this series and
> >    create a separate standalone patch.
> >=20
> > Changes since v5:
> > - Rebase on v6.6-rc2.
> > - Dependent dtsi files:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
86511
> > - Dependent bindings:
> >    https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
86520
> > - Integrate MMSY/MUTEX structure in "mdp_probe".
> > - Fix the build warnings that were detected by the linux-media
> >    build scripts tool.
> >=20
> > Changes since v4:
> > - Rebase on v6.6-rc1
> > - Remove any unnecessary DTS settings.
> > - Adjust the usage of MOD and clock in blending components.
> >=20
> > Changes since v3:
> > - Depend on :
> >    [1] https://patchwork.kernel.org/project/linux-media/list/?series=3D=
719841
> > - Suggested by Krzysztof, integrating all newly added bindings for
> >    the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> > - Revise MDP3 nodes with generic names.
> >=20
> > Changes since v2:
> > - Depend on :
> >    [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D711592
> >    [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?=
series=3D711618
> > - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> > - Add parallel paths feature.
> > - Add blended components settings.
> >=20
> > Changes since v1:
> > - Depend on :
> >    [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/=
?series=3D698872
> >    [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek=
/list/?series=3D684959
> > - Fix compilation failure due to use of undeclared identifier in file "=
mtk-mdp3-cmdq.c"
> >=20
> > Hello,
> >=20
> > This patch is used to add support for MDP3 on the MT8195 platform that
> > contains more picture quality components, and can arrange more pipeline=
s
> > through two sets of MMSYS and MUTEX respectively.
> >=20
> > Moudy Ho (12):
> >    media: platform: mtk-mdp3: add support second sets of MMSYS
> >    media: platform: mtk-mdp3: add support second sets of MUTEX
> >    media: platform: mtk-mdp3: introduce more pipelines from MT8195
> >    media: platform: mtk-mdp3: introduce more MDP3 components
> >    media: platform: mtk-mdp3: add checks for dummy components
> >    media: platform: mtk-mdp3: avoid multiple driver registrations
> >    media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
> >    media: platform: mtk-mdp3: add support for blending multiple
> >      components
> >    media: platform: mtk-mdp3: add mt8195 platform configuration
> >    media: platform: mtk-mdp3: add mt8195 shared memory configurations
> >    media: platform: mtk-mdp3: add mt8195 MDP3 component settings
> >    media: platform: mtk-mdp3: add support for parallel pipe to improve
> >      FPS
> >=20
> >   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 +++++++++++++-
> >   .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
> >   .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
> >   .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
> >   .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
> >   .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
> >   .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
> >   .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
> >   .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
> >   .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
> >   .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
> >   .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
> >   .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
> >   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 440 +++++++--
> >   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 895 +++++++++++++++++=
-
> >   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
> >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 139 ++-
> >   .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  50 +-
> >   .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
> >   .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
> >   25 files changed, 2744 insertions(+), 178 deletions(-)
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color=
.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge=
.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp=
.h
> >   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195=
.h
> >=20
>=20


