Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682EFCE79AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 04:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmEnr7MOsW32eYu+b+8FnRwHd0rSZ6YFBdaquMDq2+U=; b=RecdAQQf47QB2lMBLYMiOFbO6s
	8/YF4FpScWSE/O2mloqSCE/fricH5ZCyo4wSjHz6OcCm8IjqmiIuzHVVoOvBQzyRf9E/Zj3rlB2Li
	VuzRZd0qANC/r61Ft1lc9Ej8MJ7FfJw5LpIuifcWgC9cSgKlEdXDQcn0r20xBAAb+jYjs7Wmcg8Tf
	cKRBQXaJcz+MTG5SwikBB2bHuQ6fYpRZY044YI/X8hrmVPV4AAOpvLiQLhMEq5B1WCszvBRV4yhf8
	O650CAnuTiMkxY6htKXTz1LL2VWjAkWDZaop/fC+hcWzNexkQNnTgQJBuz9kGGhoSBSxVBEMv5hhn
	6M2tshHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qioau-001oO6-0G;
	Wed, 20 Sep 2023 04:13:44 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qioap-001oNB-2w
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Sep 2023 04:13:42 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so104334641fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 21:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695183215; x=1695788015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmEnr7MOsW32eYu+b+8FnRwHd0rSZ6YFBdaquMDq2+U=;
        b=BduQZvrpeyouRa5zCe28r32AVrJkHJEKrDWBf+jDKmxY2BKeHmfhDptaO53z82Xovh
         HgKi0AaiwTfIZMXsIl7PLypeC6HXUNdyHA5k9zu1ZwqlVSbMw2gu2HZBE724SB88TGu3
         DrIqqFXvsL8eHYB7okOSCISJpcaqEXM1LQLxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695183215; x=1695788015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmEnr7MOsW32eYu+b+8FnRwHd0rSZ6YFBdaquMDq2+U=;
        b=b3cnsx6i1hhUhiWNHV4VLeQ8yHC8NmatrVYvPQeWJf6tpQpAMmcUlOOqNQs1eh7ZRv
         fsP2TPLVl47e7qb+XfHGzFgdP6RhBaC6vuCXVikSZeGxEkZYDZ/C8GpbmwRBQ758M3YR
         mOwMSfRH6BSYZhcXM1I9npYISs26AcjYjqF16kFC5QLNN+JOCfQrDw737CcO7Sj3NX2Y
         qNlnD+uxjOxVa2L5O2XjswaN6mwy1/SHZj2bprIlLAwLDnnUkZMJFa7u1+LnGgoZ7DXe
         Y5lTe7ncqSsW0VKu/ML8NJqWFfz6jC9Hx73FRTxHqLlMml0X36aOELEAz6uYDpE7NuLY
         bDyw==
X-Gm-Message-State: AOJu0Yxr+1Obcx4irybTN0wreCv5Ek1ko0jD1kwr6urcQUBgEKPk3gwc
	Af6ju6A6KjJs7ygZu8r/RwFmHSeMGbOaGsHQplVTGg==
X-Google-Smtp-Source: AGHT+IE/cNlgvUxsLJOM7aKMti83Xoi5Nx6Vz+dMUhejKEZtcedT3nnod4eUcpXK8uBfcBmyawnFpxcZxk2WhG14L0c=
X-Received: by 2002:a05:651c:1714:b0:2bc:b448:b8c0 with SMTP id
 be20-20020a05651c171400b002bcb448b8c0mr1008459ljb.34.1695183215260; Tue, 19
 Sep 2023 21:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230919104357.3971512-1-wenst@chromium.org> <20230919104357.3971512-6-wenst@chromium.org>
 <20230919195752.GA85007-robh@kernel.org>
In-Reply-To: <20230919195752.GA85007-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 20 Sep 2023 12:13:24 +0800
Message-ID: <CAGXv+5F9gb_hYaKQM6rOZA9mrS3RYH0WE9y_5jwNQm26jrHODg@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] regulator: dt-bindings: mt6358: Add MT6366 PMIC
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_211339_987746_975C31DD 
X-CRM114-Status: GOOD (  32.22  )
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

On Wed, Sep 20, 2023 at 3:57=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Sep 19, 2023 at 06:43:48PM +0800, Chen-Yu Tsai wrote:
> > From: Zhiyong Tao <zhiyong.tao@mediatek.com>
> >
> > The MediaTek MT6366 PMIC is similar to the MT6358 PMIC. It is designed
> > to be paired with the MediaTek MT8186 SoC. It has 9 buck regulators and
> > 29 LDO regulators, not counting ones that feed internally and basically
> > have no controls. The regulators are named after their intended usage
> > for the SoC and system design, thus not named generically as ldoX or
> > dcdcX, but as vcn33 or vgpu.
> >
> > The differences compared to the MT6358 are minimal:
> > - Regulators removed: VCAMA1, VCAMA2, VCAMD, VCAMIO, VLDO28
> > - Regulators added: VM18, VMDDR, VSRAM_CORE
> >
> > Add a binding document describing all the regulators and their supplies=
.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > [wens@chromium.org: major rework and added commit message]
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Merged all the propertyPatterns together; the if-then sections now
> >   only block out invalid properties
> >
> > Changes since v1:
> > - Replaced underscores in supply names to hyphens
> > - Merged with MT6358 regulator binding
> > - Added MT6358 fallback compatible to MT6366 regulator
> >
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
> >  .../regulator/mediatek,mt6358-regulator.yaml  | 120 +++++++++++++++---
> >  1 file changed, 104 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt635=
8-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6=
358-regulator.yaml
> > index c5f336318ec2..05e381899d08 100644
> > --- a/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regul=
ator.yaml
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6358-regul=
ator.yaml
> > @@ -16,14 +16,18 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: mediatek,mt6358-regulator
> > +    oneOf:
> > +      - const: mediatek,mt6358-regulator
> > +      - items:
> > +          - const: mediatek,mt6366-regulator
> > +          - const: mediatek,mt6358-regulator
>
> Would the mt6366 regulator driver(s) function with the mt6358 driver
> unchanged? If not, then not really much point in having the fallback.

The argument by Angelo was that the PMICs have an ID register that can be
used to identify which variant it is. The mfd and regulator drivers both
use that instead of looking at the "mt6366" compatible string. (Note the
drivers are already merged.) Yes the drivers would need changes to handle
the new ID and whatever differences between the variants. But other devices
were handling this in the same way with a fallback. Krzysztof seemed to
agree.

> >
> >    vsys-ldo1-supply:
> >      description: Supply for LDOs vfe28, vxo22, vcn28, vaux18, vaud28, =
vsim1, vusb, vbif28
> >    vsys-ldo2-supply:
> > -    description: Supply for LDOs vldo28, vio28, vmc, vmch, vsim2
> > +    description: Supply for LDOs vldo28 (MT6358 only), vio28, vmc, vmc=
h, vsim2
> >    vsys-ldo3-supply:
> > -    description: Supply for LDOs vcn33, vcama1, vcama2, vemc, vibr
> > +    description: Supply for LDOs vcn33, vcama[12] (MT6358 only), vemc,=
 vibr
> >    vsys-vcore-supply:
> >      description: Supply for buck regulator vcore
> >    vsys-vdram1-supply:
> > @@ -43,18 +47,20 @@ properties:
> >    vsys-vs2-supply:
> >      description: Supply for buck regulator vs2
> >    vs1-ldo1-supply:
> > -    description: Supply for LDOs vrf18, vefuse, vcn18, vcamio, vio18
> > +    description:
> > +      Supply for LDOs vrf18, vefuse, vcn18, vcamio (MT6358 only), vio1=
8, vm18 (MT6366 only)
> >    vs2-ldo1-supply:
> > -    description: Supply for LDOs vdram2
> > +    description: Supply for LDOs vdram2, vmddr (MT6366 only)
> >    vs2-ldo2-supply:
> >      description: Supply for LDOs vrf12, va12
> >    vs2-ldo3-supply:
> > -    description: Supply for LDOs vsram-gpu, vsram-others, vsram-proc11=
, vsram-proc12
> > +    description:
> > +      Supply for LDOs vsram-core (MT6366 only), vsram-gpu, vsram-other=
s, vsram-proc11, vsram-proc12
> >    vs2-ldo4-supply:
> >      description: Supply for LDO vcamd
> >
> >  patternProperties:
> > -  "^buck_v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
> > +  "^(buck_)?v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$":
> >      description: Buck regulators
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -69,7 +75,7 @@ patternProperties:
> >            enum: [0, 1]
> >      unevaluatedProperties: false
> >
> > -  "^ldo_v(a|rf)12$":
> > +  "^(ldo_)?v(a|rf)12$":
> >      description: LDOs with fixed 1.2V output and 0~100/10mV tuning
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -77,15 +83,16 @@ patternProperties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_v((aux|cn|io|rf)18|camio)$":
> > -    description: LDOs with fixed 1.8V output and 0~100/10mV tuning
> > +  "^(ldo_)?v((aux|cn|io|rf)18|camio)$":
> > +    description:
> > +      LDOs with fixed 1.8V output and 0~100/10mV tuning (vcn18 on MT63=
66 has variable output)
> >      type: object
> >      $ref: regulator.yaml#
> >      properties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_vxo22$":
> > +  "^(ldo_)?vxo22$":
> >      description: LDOs with fixed 2.2V output and 0~100/10mV tuning
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -93,7 +100,7 @@ patternProperties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_v(aud|bif|cn|fe|io)28$":
> > +  "^(ldo_)?v(aud|bif|cn|fe|io)28$":
> >      description: LDOs with fixed 2.8V output and 0~100/10mV tuning
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -101,7 +108,7 @@ patternProperties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_vusb$":
> > +  "^(ldo_)?vusb$":
> >      description: LDOs with fixed 3.0V output and 0~100/10mV tuning
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -109,7 +116,7 @@ patternProperties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_vsram_(gpu|others|proc1[12])$":
> > +  "^(ldo_)?vsram[_-](core|gpu|others|proc1[12])$":
> >      description: LDOs with variable output
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -117,7 +124,7 @@ patternProperties:
> >        regulator-allowed-modes: false
> >      unevaluatedProperties: false
> >
> > -  "^ldo_v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|mc|mch|sim[12])=
$":
> > +  "^(ldo_)?v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|m18|mc|mch|m=
ddr|sim[12])$":
> >      description: LDOs with variable output and 0~100/10mV tuning
> >      type: object
> >      $ref: regulator.yaml#
> > @@ -130,11 +137,50 @@ required:
> >
> >  additionalProperties: false
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: mediatek,mt6358-regulator
> > +    then:
> > +      patternProperties:
> > +        # Old regulator node name scheme (with prefix and underscores)=
 only
> > +        # ([^y-] is used to avoid matching -supply
> > +        "^(?<!buck_)(?<!ldo_)v.*[^y-](?!-supply)$": false
> > +        "^ldo_vsram-": false
> > +        # vsram_core regulator doesn't exist on MT6358
> > +        "^ldo_vsram[-_]core$": false
> > +
> > +      properties:
> > +        # vm18 and vmddr regulators don't exist on MT6358
> > +        ldo_vm18: false
> > +        ldo_vmddr: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt6366-regulator
> > +    then:
> > +      patternProperties:
> > +        # Prefer cleaned up regulator node names
> > +        "^(buck|ldo)_": false
> > +        # Don't allow underscores
> > +        "^vsram_": false
> > +        # vcam* regulators don't exist on MT6366
> > +        "^vcam": false
> > +
> > +      properties:
> > +        # vldo28 regulator doesn't exist on MT6366
> > +        vldo28: false
> > +        # vs2_ldo4 supply pin doesn't exist on MT6366
> > +        vs2-ldo4-supply: false
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
> >
> > -    regulator {
> > +    mt6358-regulator {
>
> regulator or regulators is preferred.

Assuming we don't split the bindings again, doesn't this end up causing
the two examples to get squashed into one? That would cause verification
errors, since the two compatibles use different naming styles for their
regulator sub-nodes.

Thanks
ChenYu

> >          compatible =3D "mediatek,mt6358-regulator";
> >
> >          buck_vgpu {
> > @@ -156,4 +202,46 @@ examples:
> >          };
> >      };
> >
> > +    mt6366-regulator {
> > +        compatible =3D "mediatek,mt6366-regulator", "mediatek,mt6358-r=
egulator";
> > +
> > +        vdram1 {
> > +            regulator-name =3D "pp1125_emi_vdd2";
> > +            regulator-min-microvolt =3D <1125000>;
> > +            regulator-max-microvolt =3D <1125000>;
> > +            regulator-ramp-delay =3D <12500>;
> > +            regulator-enable-ramp-delay =3D <0>;
> > +            regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
> > +                                       MT6397_BUCK_MODE_FORCE_PWM>;
> > +            regulator-always-on;
> > +        };
> > +
> > +        vproc11 {
> > +            regulator-name =3D "ppvar_dvdd_proc_bc_mt6366";
> > +            regulator-min-microvolt =3D <600000>;
> > +            regulator-max-microvolt =3D <1200000>;
> > +            regulator-ramp-delay =3D <6250>;
> > +            regulator-enable-ramp-delay =3D <200>;
> > +            regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
> > +                                       MT6397_BUCK_MODE_FORCE_PWM>;
> > +            regulator-always-on;
> > +        };
> > +
> > +        vmddr {
> > +            regulator-name =3D "pm0750_emi_vmddr";
> > +            regulator-min-microvolt =3D <700000>;
> > +            regulator-max-microvolt =3D <750000>;
> > +            regulator-enable-ramp-delay =3D <325>;
> > +            regulator-always-on;
> > +        };
> > +
> > +        vsram-proc11 {
> > +            regulator-name =3D "pp0900_dvdd_sram_bc";
> > +            regulator-min-microvolt =3D <850000>;
> > +            regulator-max-microvolt =3D <1120000>;
> > +            regulator-ramp-delay =3D <6250>;
> > +            regulator-enable-ramp-delay =3D <240>;
> > +            regulator-always-on;
> > +        };
> > +    };
> >  ...
> > --
> > 2.42.0.459.ge4e396fd5e-goog
> >

