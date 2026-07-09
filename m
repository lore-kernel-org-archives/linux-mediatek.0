Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58AAC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=; b=JZcs2Y8kggJXPUNBRx3UaPvbB0
	qbHwoOSZxiCqzle7ZI1KCG1eWrPD6IIGZ6mz0Iwa/cI5Eppuol5r9qKLtVtLhSn/YwM1reXde9k2x
	Oj6S0mJdjJL94Pqj6YDfIiG5Uw44dkApJah7D7R+urhSbYQ9Ihc6Ylm/EKbxiW608tAV0rYd/E7fC
	EB5zW+G1aTuZqNQ6Ulis+ScLzPqItl7A8aVrEbCj+UPDRpRgJzxULwOdN/LewetYCk0IV2osqSH71
	KtUlOSpb9cVEX00nT3CThoqw9+nEWkPKvG3vp1drv1X6sKQQoXJP7PkIns3k2n7AW6Il5xtTfSZ4f
	gjP8IOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl2x-00000001lM3-27Wj;
	Thu, 09 Jul 2026 09:27:55 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whl2u-00000001lLZ-1TJn
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:27:54 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6662551100bso1037646d50.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783589271; cv=none;
        d=google.com; s=arc-20260327;
        b=foRGK8NZoma2WYWExRiBRpb2sTXAx4L+ejuv9FrVd58qqcjaPuCxLhrRnI2e1AU0EK
         UPka5ehbj16eMv7mzzkoHQInrfWjyS+174/zz/zs3zqMNwSma5/OvWV53m/d0k5gregg
         j7DA4bf5NSLgHFLagEN/vTgB1e6A/UzfVvNQMDOYglRPjVUyISG3AQaQ1uuPvvYe6L5+
         guFUmyML9T7JewTtQUwxMpMH9ZI6ticrAeF+zLhcqcGtZxUMjnlha8r2zAbpUSGqaexL
         1p/umSZnWvngS3WuWrXkdtdJuezLJm5Dqc6SDjk+8C8juKo2WzDmmmQ4O9gvWN+96bYZ
         Mckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        fh=K61A5eIv2GzGPcbuwMq5uraePEnb9anC7bQHtPuMwf4=;
        b=VCSwnHqtByZhDP7PUemTon65N4jXgv8JENavfP3KAKdrXMMg7pweOgmQQnZ/BBby9W
         MePbzN0iclcAje68N4dcpyMIVSnWnnnBxjDxA10i5S8ergBwXqTqKs9pqTlJ7YYzlV0v
         akZxIQHqoJEFaYqS3vuZOHnriA9Pn+Y4k0XpkkWwAzWFKyyJ8YLyIcROnXfDLweu36n8
         K8ECFRjeGewhtZuLu1YqQwMCirYkWxImiQtSQrr1wY9FDoGd7XKRla/szPgoPy7nDdwE
         LoTSXpbaUFPYFoEpX333yyojBbaiBs5gLCbWoTFS1/gjKw5fLiOeTh16tkC/Mf+0ytb/
         fdhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783589271; x=1784194071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=QTESevrWsysgy+g83NkNi5HIObhFen+htJtsNEEkLunl5JloCyxd5S4AUhXbIY8P/a
         sR8rXbA/2/L28ESrqKpCDW/F+BwPpEDhGRhUHPhFSmHKGFBSaTzRT7Tu4LsXXjgzFId9
         cowvJSzAS6Lk2vpnYmclm8iMn5SZXsLpOeem8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783589271; x=1784194071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=MNgrd1+oYS6LVxuMNoeSvb6HW9wMMR3bCb01NQ+5hH9rczr0FiNuyjIXV1Tt0cwIEZ
         H26GGKoCAuYFL1YDSBiAbuvxOFL2kVcql0RAd4kbszcYoFBHwgjmZWTlrCybalmpRCLW
         qhlg2fCg0S7cLM4Kp82I34TKO3hxmlsBq7Dy7yNmbng4AM1/zsyDHLtm2zmmC2KFhpHK
         Xi5gLyak0SWSe01SGlUTZ8pA9xI/QarM/HmLhF1ISeijdS3C/bDe0WpA/Gk4rXRtnAx7
         g5TvwBRkB2FgW8HF7kyBQB18sRCgSHXuk68R+P1LOgGuzxhjmN/dxKRXVBIH/BU9tS25
         X1uQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBM1E0QKKeagCFczDeK2Tv1Gra1wnD/VwlJVOLdgbqQficwDDOR3hALUnu2oakOMy8DdKc8Xb8RhghTEvPfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF2jmaOCTqfh0NVPrs1cavjX1s4lg1ZInVQwzeiU0GwjIAnBBt
	JvyiSqMiNx+Cbb+kANFm1DumGFlPpUTiDIVE/u+XOgSBAdobjVnX8cR9Ap1TnXvIUdHmVXYYCN4
	6HcwervANa+9fsbTITrcEXBaYX5+bC/NsOAS3oNdW
X-Gm-Gg: AfdE7cnBBlCw6zaijHQadycf5IiC2zhUQ3dwzUzYv+ospWy6Gz5Qdx3mwrDiyNBe59N
	WaWCcOffquxK67znc1KZb6R/Yt5RPoW+PO+sI/LJxDnkPnwZWzZXUdy+QQUL4pSOlZkLXZwRUR9
	V4Z727bPmRy9FEd4AKaRm6QiRGGalYS+x7EZRfgwHZVUSYVgd9BG8iX3uvCOr0nCLXY19d5ExTZ
	sIXPNdXZfUjrCTeLKKC2pxwx7ByR6r3dAKsVskpCJtXnwqWmBO5ej0Eni6QwtyQrs6bSL91agJb
	c/gSx9nWeF5ds7dybWZomwjuHkA=
X-Received: by 2002:a05:690e:134a:b0:667:b262:16bd with SMTP id
 956f58d0204a3-667b26234b2mr2825271d50.81.1783589271117; Thu, 09 Jul 2026
 02:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
In-Reply-To: <20260709083024.330381F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 17:27:39 +0800
X-Gm-Features: AUfX_mx_3xgToBgzkBmOX1DPVDvwVrzb4et6fk5WWd8Ysjgsr4mMAnsSLQdDprs
Message-ID: <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: sashiko-reviews@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_022752_538337_5355E731 
X-CRM114-Status: GOOD (  26.48  )
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

On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315_PP=
 mode ganging in the regulator driver, causing silent cross-talk between th=
e CPU and EMI VDDQ regulators.
> - [Low] Grammatical error in the comment explaining the firmware workarou=
nd.
> --
>
> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319=
 PMIC ---
> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
>
> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> DRAM.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 8e423504ec052..af05315092f53 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> [ ... ]
> > @@ -1225,6 +1235,70 @@ &spi2 {
> >       status =3D "okay";
> >  };
> >
> > +&spmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spmi_pins>;
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     pmic@6 {
> > +             compatible =3D "mediatek,mt6319-regulator", "mediatek,mt6=
315-regulator";
> > +             reg =3D <0x6 SPMI_USID>;
>
> [Severity: High]
> Does this fallback compatible trigger incorrect mode ganging?
>
> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, which
> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> pp0600_emi_vddq.
>
> If a mode change happens on vbuck1 (which is allowed by the
> regulator-allowed-modes property), the driver will apply the ganged
> mask and silently overwrite vbuck4's mode bits in the PMIC, potentially
> forcing the RAM supply into an unexpected mode.
>
> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> lead to memory voltage instability?

This discrepency is actually bigger than Sashiko mentions. The ganging
supported by the driver only applies to the PMICs in the Asuarada design:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)

On the Cherry design we have:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+3+4 (big cores)

On the Corsola designs with beefier chips:

  - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused

On the Geralt design (this one):

  - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)

Any ideas on what to do about this mess?

Another thing is that I kind of wonder why the mode configuration register
setting isn't ganged in hardware like the enable and voltage settings.


Thanks
ChenYu

> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     /*
> > +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> > +                      *
> > +                      * However, this device originally shipped with a=
 broken
> > +                      * firmware that causes register reads over SPMI =
fail.
> > +                      * This is fixed in firmware version 15842.175.0,=
 which
> > +                      * is included in ChromeOS releases R150-16700.22=
.0 or
> > +                      * R151-16721.0.0 and later.
> > +                      *
> > +                      * Assigning the cpu-supply properties for CPU6 a=
nd CPU7
> > +                      * without the fix will likely cause CPU DVFS to =
stop
> > +                      * working. Hence the assignment is left out to a=
void a
> > +                      * regression of the function. If the user is con=
fident
> > +                      * that their system has the fix, they can added =
the
>
> [Severity: Low]
> This isn't a bug, but there is a typo in this comment. It should say
> "they can add the property themselves".
>
> > +                      * property themselves.
> > +                      */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928.61=
2294-1-wenst@chromium.org?part=3D1

