Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1521FD3E194
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqmN+Pv+ZkLGAVjFOcuodLYBgxnH70IFWhBIjkIvZIA=; b=Bf3ZtBAGZX8WfBvHwxWwmjW59v
	LK+AnaUKcoc15z2v7NVPMBytwpaBJVcB7s3WpRqGNsFXbGj5Y7DHVsJzrv0qKjlL8r74gfurw6Uqc
	6VkGx63pbLTpa0HM+swfcuNCjeynTfLUid6BgZdRG0zX9DeJZJ36yvkFhjfAwKt5997qvb0xftkNF
	DtXxGJGDZRsSLs7G7Ou+c1KVQ4V0nK/AjEoSUhEHpQZe++baNegSl3ZR3lumW/4iSw7DqTdtxyEZh
	ALuTgrVaLV/nTXuyd2+79Yzz6wydTa/3n16R9i2vrh/verg3vERGrrkKDPSHS+Yvgir+wdaQHYXCU
	NFDrY0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1y94-00000002OJE-2znO;
	Sat, 19 Oct 2024 01:20:42 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1y7a-00000002OAo-1yC2
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Oct 2024 01:19:12 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6e377e4aea3so24274367b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 18:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729300748; x=1729905548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqmN+Pv+ZkLGAVjFOcuodLYBgxnH70IFWhBIjkIvZIA=;
        b=X4y9t3Ho9k7C6kZ6Ci7cU/ZBDmPqPpawmRSg8YAxxkqgjhEcQwR5rqaiagQtWLjcun
         /vyZrYN6Gu3uwKaXY1FoBtN7mdkyvP6UD6k3JPSVUs0GMiflZap+QiMOvSjdHB6y9E83
         +rpkpMg9bDyxEVXo7P4KKiRzmQ1QnOAU31NXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729300748; x=1729905548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqmN+Pv+ZkLGAVjFOcuodLYBgxnH70IFWhBIjkIvZIA=;
        b=hoGnoomq00OsOhNBDy6Laj0z+i9yv/6PBrlNcwMM0JFf0kKTzlJDucKZAzGh2o9sHk
         8wSC5mYs3PPUuuNoafPcz3lBWPhF9niV0OZO2yvyqdiglVXAMTskIhqPpEfYUQUCKFim
         rPEs55QH3Kv1CcjBWumjBwvT9NBFeOn3UQGZTsj/DDiVqWQSKJyI15jjCUpd8eMzYHnE
         lKfv6oZhgwbKE7LUFhc9J/7ezeiPdq511EAZ5+FEWmWrt9C72NZyn31MdV139tbsmJLa
         HzN+ktXulaYZhOpUrtvxt1hJXcQ5zO+e0pQ2HX8gzqwgBdD2mKXpYLsvqhmANh3fBQ8y
         o+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUztS3U2xM4KVX/DKKZCI2o/EHFisd2lnxO0aR+vTDvORJigVVYE90/eVq4+p3P6nEQoBVWgCogY0usw5CnlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ6667ZpK29U/GN2gmoMnFuM7dOz0jvFxDwq/tg99S5GL0U/iM
	gzphjZv6Bl47SY508gbnN34/10zgCRCicPbI1HGmAHpo6lCV5NMYH8iyV0t8W25bMgTWhHLCJq+
	tLVuRSkEWxVwJ3kxHPYXtFi21yVhZR9EWqV3Z
X-Google-Smtp-Source: AGHT+IHJIDotEBqysnywDOX1fj18ueDufCKbPGiOJRzKcwmzpCSI2hijWJkoHfy4063NVRqBiN9mNe9g5L5dPCK45tE=
X-Received: by 2002:a05:690c:28f:b0:6e2:313a:a022 with SMTP id
 00721157ae682-6e5bfe94d4bmr47875317b3.33.1729300748516; Fri, 18 Oct 2024
 18:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <172925540039.17739.8191775806524492819.robh@kernel.org>
In-Reply-To: <172925540039.17739.8191775806524492819.robh@kernel.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 18 Oct 2024 18:18:42 -0700
Message-ID: <CAJMQK-j7maS3_kRLTAiEow5dNP7422jdJ0HKSRyJmc_Eay3zvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: mediatek: Add MT8186 Chinchou
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>, devicetree@vger.kernel.or, 
	wenst@chromium.org, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	sean.wang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_181910_564085_2F85130A 
X-CRM114-Status: GOOD (  23.19  )
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

On Fri, Oct 18, 2024 at 5:52=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Fri, 18 Oct 2024 17:11:32 +0800, Zhengqiao Xia wrote:
> > This is v2 of the MT8186 Chromebook device tree series to support
> > MT8186 chinchou platform. It is based on the "corsola" design.
> > It includes chinchou and chinchou360, including LTE, stylus,
> > touchscreen combinations.
> >
> > Changes in v2:
> > - Modify location of "const: google,chinchou-sku17" in mediatek.yaml
> > - rename "pin-report" to "pin-report-pins"
> > - add "vcc33-supply" and "vcc33-supply"
> > - rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
> > - modify subnode of sound
> > - Link to v1: https://lore.kernel.org/all/172900161180.733089.896354374=
5385219831.robh@kernel.org/
> >
> > Zhengqiao Xia (3):
> >   dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
> >   arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
> >   arm64: dts: mediatek: Add exton node for DP bridge
> >
> >  .../devicetree/bindings/arm/mediatek.yaml     |  29 ++
> >  arch/arm64/boot/dts/mediatek/Makefile         |   3 +
> >  .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
> >  .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
> >  .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
> >  .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
> >  .../boot/dts/mediatek/mt8186-corsola.dtsi     |   6 +
> >  7 files changed, 441 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chincho=
u-sku0.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chincho=
u-sku1.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chincho=
u-sku16.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chincho=
u.dtsi
> >
> > --
> > 2.17.1
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=3Dy mediatek/mt8186-corsola-chincho=
u-sku0.dtb mediatek/mt8186-corsola-chinchou-sku1.dtb mediatek/mt8186-corsol=
a-chinchou-sku16.dtb' for 20241018091135.17075-1-xiazhengqiao@huaqin.corp-p=
artner.google.com:
>
> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: pmic: 'cod=
ec' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt639=
7.yaml#
> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: pmic: 'cod=
ec' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt639=
7.yaml#
> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: pmic: 'co=
dec' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt639=
7.yaml#
>

hi Zhengqiao,

This appears after
https://patchwork.kernel.org/project/linux-mediatek/patch/20241001104145.24=
054-3-macpaul.lin@mediatek.com/.
To avoid this warning, change `codec` in pmic (in mt8186-corsola.dtsi)
to `audio-codec`, though this is not caused by this series.

>
>
>
>

