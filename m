Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48334EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz6eKo8ao64sqXLdxYJHv9qUv5zxZGq6Qjyo6fttDw4=; b=1f9NJtauKDOho7zHTplC0o7Qst
	Odw6c1iyDq+7RBWZ7rIGeXlRTJRneHUN2PRB5BFMqrxmu/n0oQruyX1DoBKyT2C0WJDF0CnyW0hcx
	Ox9gMrPMV7O5zhkETMQzzALXD+HCNdYXjc7iGMVrdKZCqbhrILJmL2fK2eAR/ToFwxPnqy1p6Xrwc
	9toRdTWi25cIQWRD0BACaVX25TJf4bBMFuFP1YfGyV+0CTwwzwHWwcdTnCLt355HJOwGjOQ7/2vtF
	Bm/WEIkmjcbSok2juscZ7yeqsLupeJ4XaZZDcx8Len4SZ0yGE92MRKF4yZqczU1uWtaRkhfpnItc7
	1phhI5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStle-00GGwC-1a;
	Mon, 07 Aug 2023 06:31:02 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStla-00GGvH-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 06:31:00 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4872462d9fbso668539e0c.2
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Aug 2023 23:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691389857; x=1691994657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz6eKo8ao64sqXLdxYJHv9qUv5zxZGq6Qjyo6fttDw4=;
        b=mqWQ6iX60FNxqn1uZdDpETS1WqNG6kf0qgn5d2qNxveiPsG7uVPGE44hkvxr0svXsf
         MCelDOTnhurHG9EEQ0GIHC5Rh5W4NedMhlr1gzMIX81oXiOOaflVbHPh+wkrUsCeaww2
         Mk3vAx+AqD5UCOQfkpMjJLnfF1GJah1GEUPcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691389857; x=1691994657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz6eKo8ao64sqXLdxYJHv9qUv5zxZGq6Qjyo6fttDw4=;
        b=JtYyj1OYoH4o5PQ2KGL2QnuMlg157VQ6nvpbnwEZV7DbD+gSw8uyAiIqbtgh/PgKLG
         ry2kp5zXDNIXbSqPVS8OFb4E3fJmEWg+8Tp4Xejol3QdQqRypU0BqqCYf1DcH3bmhPL/
         Sjd3Rh3QpdpikHAO3gD12noSSGJoMpMK4Zifa3IPgWZwMHBgGK1YbLFH15kOBW/7D5rx
         wpfhw64MrUlYJEnU9TFPKYaMBZqKqq+DJEYIPJOZE9Ev9W43pHU1OABplhDFVKB/P2xn
         i+sSm4B24nfs44GlqXS68MQ5j1ITJB86DcYWNc5fYJl7INMOy60ft/byjiJthz6ujDuv
         uaSg==
X-Gm-Message-State: AOJu0Yz7GPMAzUeVwf3NMsdaOWJTuNyfWnFfwIKOJJVLLK4xG9xgXGXb
	qavw9FjVxuAYGomDtPeREJY9QRhTyWGoF8cDhUmGMPoB4kLj2k0k
X-Google-Smtp-Source: AGHT+IHAIsK2vrz4BJhQdqKK6BvozPPoH0WWweyvQz4XE8NxINWS7h3Y07jWSgKFBY6rRarBKCKnMXk8PH9IDMazhhs=
X-Received: by 2002:a1f:4511:0:b0:486:4a16:63c6 with SMTP id
 s17-20020a1f4511000000b004864a1663c6mr2586648vka.15.1691389857325; Sun, 06
 Aug 2023 23:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230803074249.3065586-1-wenst@chromium.org> <20230803074249.3065586-5-wenst@chromium.org>
 <6bf91ced-076f-ecc1-f626-f531f7d991bd@linaro.org>
In-Reply-To: <6bf91ced-076f-ecc1-f626-f531f7d991bd@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 7 Aug 2023 14:30:46 +0800
Message-ID: <CAGXv+5HkKQ79k8T7LbowpHLCLHDvyxKrOZn=PePyrPREdpT1sg@mail.gmail.com>
Subject: Re: [PATCH 4/9] regulator: dt-bindings: mediatek: Add MT6366 PMIC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_233058_940087_D31C5560 
X-CRM114-Status: GOOD (  25.84  )
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

On Mon, Aug 7, 2023 at 2:23=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/08/2023 09:42, Chen-Yu Tsai wrote:
> > From: Zhiyong Tao <zhiyong.tao@mediatek.com>
> >
> > The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
> > to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
> > 29 LDO regulators, not counting ones that feed internally and basically
> > have no controls. The regulators are named after their intended usage
> > for the SoC and system design, thus not named generically as ldoX or
> > dcdcX, but as vcn33 or vgpu.
> >
> > Add a binding document describing all the regulators and their supplies=
.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > [wens@chromium.org: major rework and added commit message]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since Zhiyong's last version (v4) [1]:
> > - simplified regulator names
> > - added descriptions to regulators
> > - removed bogus regulators (*_sshub)
> > - merged vcn33-wifi and vcn33-bt as vcn33
> > - added missing regulators (vm18, vmddr, vsram-core)
> > - cut down examples to a handful of cases and made them complete
> > - expanded commit message a lot
> >
> > [1] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhi=
yong.tao@mediatek.com/
> >
> >  .../regulator/mediatek,mt6366-regulator.yaml  | 154 ++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6366-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt636=
6-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6=
366-regulator.yaml
> > new file mode 100644
> > index 000000000000..715c6ffcb3ab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regul=
ator.yaml
> > @@ -0,0 +1,154 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT6366 Regulator from MediaTek Integrated
> > +
> > +maintainers:
> > +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> > +
> > +description: |
> > +  Regulator part of the MT6366 PMIC. This node should be under the PMI=
C's
> > +  device node.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6366-regulator
> > +
> > +  vsys_ldo1-supply:
>
> Don't use underscores in property names. Only hyphens, if needed.

I assume that applies even if the actual name in the datasheet has
underscores?

Will change, but will wait on discussion on patch 3 before sending a new
revision.

ChenYu


> > +    description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, =
vsim1, vusb, vbif28
> > +  vsys_ldo2-supply:
>
>
>
> Best regards,
> Krzysztof
>

