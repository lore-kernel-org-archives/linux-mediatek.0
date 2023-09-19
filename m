Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FE9CD343F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbXneqlvqIGCYRFq8SaQCy+9zDbbsrcbESBLAJ+M0h4=; b=PlSeeE6Jdv6z1M30vJYkxNKkSb
	ORQiZfZ2VVcLE6iRjn6bgkbTZSQJJHrSPa0Fk2cAUKKmGxXTH1WrFtC1Am2RsAGZ8Jg8rs3ECcWHT
	HtP6y+gK3/8NLdAUXFFWQBBzIIUmVsXXWriOwUETSFJYzAfm3n4qrG78jKFtYG8UXoCIk2GSOZMtY
	MUQvwTtWxVWk8WXgrkhGWPS2U3ZnWEcuAGXwb0eK+7ultxgyLPZnvnFSXqAIYfQCD89Bd7R8pqQCK
	WPibLz/zP28pyyFcnKvOR3Uq3C9Ao9IvaAHKC/52zNTmjMjT+AC/shRSSbENzEfbG/wnuT/8B4EZD
	vWWQqHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUIE-00H8sJ-1O;
	Tue, 19 Sep 2023 06:33:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUIA-00H8qx-08
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 06:33:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso1390047666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1695105177; x=1695709977; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GbXneqlvqIGCYRFq8SaQCy+9zDbbsrcbESBLAJ+M0h4=;
        b=z+69voKD6CgePFDpB3Zf7otOF6++fGoZgmVIsA09S7BRyEv9U6IJCg0NnsirVw6hy0
         aBevwhOHwitJX5CswK2Ty4TaNoxJQWnavrA1f1+7qvqAcHrldezi6OaE9BNA/hlQrDRd
         W6wH/4idy14SvyND5wltj9Z2FDJ9KZ193RlP1Buxh63ngY2NdecsKme7TpBl9stG5cDK
         SQ/WlCsEjByIOqPrNi9kDQAc9tzsHsjvpQkPg2IOa2kBEz4/48TOEUB3YaiACaMye1Mf
         UlA2dvstmbW+dgwU4FVX9zLmz8SP061hWFj8IH5VE0nsYfrTIKmfhyCd5rS2TV64tf3H
         hZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105177; x=1695709977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbXneqlvqIGCYRFq8SaQCy+9zDbbsrcbESBLAJ+M0h4=;
        b=UOKOKvar4ffGBd/sCQXFQlacumn7Mom090PtgBPJY8E5J2bg2Jfs1vA2a/D8RP8V0A
         nPc8JCPfQFJZxN5JWp5QldpRocCfd1G202pZoO8fp3uwC1oxosHpSb0KlHYRg69qEUVY
         Pmml0gCgsckbkhv74RSPR5OjNR3tB8QcolsXyXj4G4jXL4S1YJ3gEnHLd7YcXf1LfqOp
         k0GYW0laP9Ruonc2VagvTAOhr+q2MwML91NiNZBNQXb+TcnU9j+JiHlc/DI5vzwpNGTK
         Nu/ZomXkuPiGNMPSiXV70ZZPGJRknv7lbABpgmuT6EHTQQqkUoJJBNsLg9AbPnh0mMEc
         6U2w==
X-Gm-Message-State: AOJu0YwX5m92oSI1TpD7aj58WQDCEupEdP7hIe5kz2KW/s1y6GKWZsKN
	uHPQ8woc1mloj+6RyzdduL1PM8lP3bIZH+MOL1UiPw==
X-Google-Smtp-Source: AGHT+IHpV5Vew41sZRDC2b41rJaSvmNBj24K6LKHAVA5Q188InmpQ7BMq5mvfnybMr2PJTT4+AhBMJwTFm7hYcrfhYw=
X-Received: by 2002:a17:907:97cb:b0:9aa:f7f:e276 with SMTP id
 js11-20020a17090797cb00b009aa0f7fe276mr2314608ejc.38.1695105176878; Mon, 18
 Sep 2023 23:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Sep 2023 07:32:44 +0100
Message-ID: <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_233302_292195_41311145 
X-CRM114-Status: GOOD (  24.07  )
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

Hi Jason, CK,

On Tue, 19 Sept 2023 at 04:04, Jason-JH.Lin <jason-jh.lin@mediatek.com> wrote:
> The patch series provides drm driver support for enabling secure video
> path (SVP) playback on MediaiTek hardware in the Linux kernel.
>
> [...]
>
> Memory Usage in SVP:
> The overall flow of SVP starts with encrypted video coming in from an
> outside source into the REE. The REE will then allocate a 'secure
> buffer' and send the corresponding 'secure handle' along with the
> encrypted, compressed video data to the TEE. The TEE will then decrypt
> the video and store the result in the 'secure buffer'. The REE will
> then allocate a 'secure surface'. The REE will pass the 'secure
> handles' for both the 'secure buffer' and 'secure surface' into the
> TEE for video decoding. The video decoder HW will then decode the
> contents of the 'secure buffer' and place the result in the 'secure
> surface'. The REE will then attach the 'secure surface' to the overlay
> plane for rendering of the video.
>
> Everything relating to ensuring security of the actual contents of the
> 'secure buffer' and 'secure surface' is out of scope for the REE and
> is the responsibility of the TEE.
>
> DRM driver handles allocation of gem objects that are backed by a 'secure
> surface' and for displaying a 'secure surface' on the overlay plane.
> This introduces a new flag for object creation called
> DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
> surface'. All changes here are in MediaTek specific code.

To be honest, it seems strange that DRM is being used as the allocator
for buffers which will mostly be used by codec hardware which is not
mentioned here. I can understand that minigbm and gbm_gralloc make
this easy to implement, but it's not really right to add this all to
mtk-drm just to support some codec features.

NXP posted a patchset a while ago to add secure-memory support to
dma-heaps[0]. This would be much cleaner (e.g. avoiding strcmp on
allocating name, avoiding mtk-drm being a render node when it can't
render) I think, and also allow common secure-path semantics between
different vendors.

Having common secure-path semantics between different vendors would be
very helpful, because the first question when we add new uAPI is
'where is the open-source userspace?'. If there is at least a common
interface through e.g. dma-heaps, then we could have some standard
cross-vendor userspace code which would work well with the standard
interface.

Cheers,
Daniel

[0]: https://lore.kernel.org/lkml/20220805135330.970-2-olivier.masse@nxp.com/

