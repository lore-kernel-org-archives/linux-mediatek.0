Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD06C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=; b=S+n0CukYbX+R5bTN28pDj8vCIe
	aqyMnRlUaj7Xmcz6zZRbADPSqnzBOBMMgGo4e4nhzMsELhlGeML6Rrog7Ok9c4esnkyVQGtvNe/xS
	7KYpmibl2fGYi/TM71NKajgAaZbQB2LwMWk8i+3u32Md9g2xCQXGYjMoXKVedAKAIpsnsTIRgnGMX
	pJGrXd598hyhYhE8gd3ZI/c/enO5UntWG5rVMfZa+tK5qWLg1uoaL3C6Gy21/mJ5pnq9AYoRn+SQZ
	GuV+KM94JGz0LyaMk3CIBUcZXX9UuXniu6UEfSE3PbzNSAVsWc1z1ssIku9AVPXzYkkgj3uiOtY5R
	gHGnXHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6bo-00000004Sov-3WwT;
	Fri, 10 Jul 2026 08:29:20 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6bm-00000004SoI-3ZB0
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 08:29:20 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-664d4478a64so863318d50.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783672157; cv=none;
        d=google.com; s=arc-20260327;
        b=n1ogt37qj2zC+/G2ij7tbzqQC/MuPRn0DN8oCB9pi8IP0Ek3KTFG0icP/2vpLixwfz
         Vs840xJ0LVMFskKl8R7Cyj4W+p9FTX5v0NqNlRmBocXjHribETaPDZcC94WyAyth5wjg
         c5GC3RXwJOf5VGZLujgtenXjH0CJlCTGGX9J3rVQbVVwa5/U8RcTzyI0txRAT9oBwsxi
         TdZA9g9YGkN9BeqFy8XZ9Zfzn5YbCPEjgP7OgxmUE5ySQe9753XhBGMtTKM7t2EDU+ug
         V4vtiFEDY7CJAD4KpDfD0rkms2U87ewXa6W/Myo5nL5v8JmpxrhNM9Eb+dmTvVvDSyuO
         YsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        fh=8cu9M21SdPfnQIC3KuTuxvOuUWaIdhyUTRLvyTiJBvs=;
        b=swuKWTbuTEgb6EByE7XIsTUpRoJ0eqrB62itW3h7aBBPaAAT4zYdoMXpdnKCIj2hZ9
         ucML93qKvLZ/yvsSNOoG6TII9cwiIUZfCfGqKfVkCZOH+1pSIihsfn6v7IA6XdsHUKs1
         1ETGcxdZ8c4EleLT1qgqk4UB/7sIaJhbVcxW+EOBjj4wsVDD9VUSuMePohD30Puieuen
         /fsAHVeg2uSkUpJCZSya86KOL46HgPcXZZdbrRtKFifyIEGhVyCGd3zNw4lu9ZSWX3CY
         dT295ftTNYQmXuRDFy8aUwPGtfpksqzuwCldxEXQ1C0KU14Gn/AfBDj/xwUtjhJNWuCD
         K5gQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783672157; x=1784276957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=CjcJyJ8kEkZT58zsAOX38Z6FZhtfLtsvkEdv8k7utp0JaV++bl3khLTB/vNFxIt+Bj
         /0YNkeDmSaYyi/DNwtvl3FYQ/nd+N8b5aNxiu2oaZYXv6NFTs9aN7GZ8KK2d0PSatIBU
         iSOHJBdtLUDngyebhQ7xnu9mLQWJerK+gcO8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672157; x=1784276957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=GGJ96qhmo/Ynxpvb1A9sW4u+1OzRjGgkv1u/PMG89nvc1sQHwKEJXbYXGZfwztiWSr
         jmpco74oBB4m01aAFCjYx2FohXFNFT7p5YNgRXbxX8e0m+80kdwzQBUHbCLEEmoHeTRQ
         TC3LFlzSGBcsO3dr0H6/67KTxNENkshz5gH6b9e5PIawxFO2pupaM/cS9ImUWMm+ts5S
         wDmMWRlQnrCe3878Pb88WyVaDRzwRpzvbNKZwnCYr3P2wvEkT3TIYhqEXKH0ZWdw2yzZ
         rAOOWvPf3aoU7Sba3YMP9K5cpenqSSK4vBZH4/A53jmm6BkKvEzyKuM8SeiqCvBblrnk
         qtHA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv5M3jARWFDClP4+GMY02Y2OVllX8MpDmKR5IR/AbQngISl9G7V1IalliWRtKgFTC87rwUqKBTT+un9MOQRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL9aZvOSSqR6pBuWmPROQlZ2yADW6q/IihLsCPYeY7IskWSnfs
	4vps+5mzs2nBPaHtSHEJPcexyhUYkWEFuea5FSt6wobndA1arnnxgA8vxcaFHCbSrJ6fpqFqZU9
	YUVx745jAhXiJdYLcpCv1504dBjLZpxkas1GwdKxh
X-Gm-Gg: AfdE7cmNUDHq4A+GcVG9kokHwXkej0qiXyVdMMYaWHB25rVCknbZU52qjqzEFum4PEi
	pZpK2o7Q5itreNWYsjtNO7YHzWs4KAUgO7IbZsm+auLroEwyiJpnKDqe2PUgAuULB037/+9nhJv
	nkSHZH2IHwGCb2slWA5OQ3dM7gtgpSlXv6iPrzKMRWrnvme28jOwnirR7pG6JAJLksSHNQpLsIV
	mFeYGRYvdh3GL/ZiPk2MBKDdJ/sXeKDuNeFTwK1duapKyemdo4Yliivrrvs6OCrCtJOwy+eFHc=
X-Received: by 2002:a05:690e:d44:b0:667:8a32:fae1 with SMTP id
 956f58d0204a3-6679f0a52dcmr6501916d50.41.1783672157223; Fri, 10 Jul 2026
 01:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
 <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com> <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
In-Reply-To: <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Jul 2026 16:29:06 +0800
X-Gm-Features: AVVi8CckLfX-jPmLiB6-FBxM08KapSlFQ-lWffFShhwa4hHsSl2udMCCyyq6MUY
Message-ID: <CAGXv+5Ey+hvVZP-wu3-5oSwXQ9Rdxr8kf9BuiA-Qr3_px7uPGg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_012918_963997_0DA8B557 
X-CRM114-Status: GOOD (  42.48  )
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

On Thu, Jul 9, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/9/26 11:27, Chen-Yu Tsai wrote:
> > On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315=
_PP mode ganging in the regulator driver, causing silent cross-talk between=
 the CPU and EMI VDDQ regulators.
> >> - [Low] Grammatical error in the comment explaining the firmware worka=
round.
> >> --
> >>
> >> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6=
319 PMIC ---
> >> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> >> Author: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
> >>
> >> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4=
X
> >> DRAM.
> >>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> index 8e423504ec052..af05315092f53 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >> [ ... ]
> >>> @@ -1225,6 +1235,70 @@ &spi2 {
> >>>        status =3D "okay";
> >>>   };
> >>>
> >>> +&spmi {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&spmi_pins>;
> >>> +     #address-cells =3D <2>;
> >>> +     #size-cells =3D <0>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     pmic@6 {
> >>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek,m=
t6315-regulator";
> >>> +             reg =3D <0x6 SPMI_USID>;
> >>
> >> [Severity: High]
> >> Does this fallback compatible trigger incorrect mode ganging?
> >>
> >> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, whic=
h
> >> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> >> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> >> pp0600_emi_vddq.
> >>
> >> If a mode change happens on vbuck1 (which is allowed by the
> >> regulator-allowed-modes property), the driver will apply the ganged
> >> mask and silently overwrite vbuck4's mode bits in the PMIC, potentiall=
y
> >> forcing the RAM supply into an unexpected mode.
> >>
> >> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> >> lead to memory voltage instability?
> >
> > This discrepency is actually bigger than Sashiko mentions. The ganging
> > supported by the driver only applies to the PMICs in the Asuarada desig=
n:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)
> >
> > On the Cherry design we have:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+3+4 (big cores)
> >
> > On the Corsola designs with beefier chips:
> >
> >    - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused
> >
> > On the Geralt design (this one):
> >
> >    - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)
> >
> > Any ideas on what to do about this mess?
>
> wenst, I think that the only way to fix that properly is to add generic s=
upport
> for buck phases ganging in the regulator API... because AFAIK there's not=
hing
> right now.
>
>  From what I remember from last time I looked, MediaTek PMICs wouldn't be=
 the
> only ones, there's something else that also has ganged bucks, and again i=
f I
> remember correctly, I remember seeing one platform data struct for each o=
f the
> ganging combinations in that driver.

Grepping through the kernel tree, I see LP8755 and TPS6594 having multiphas=
e
settings. Not sure which one you saw. Also, some of the X-powers PMICs used
with Allwinner Socs also support multiphase. For these we currently just
read out the multi-phase setting from the PMIC and don't register the
regulators for the secondary phases; however it seems with some recent
project, we actually need to program the ganging from the kernel [1].

> So.. especially because MTK wouldn't be the first, I think the addition o=
f some
> kind of generic properties (and callbacks) for this kind of configuration=
 in
> the API would be both profitable and welcome.
>
> Mark, any considerations?

Quoting Mark's response:

> > Unlike separate regulators that are ganged together, in the AXP PMICs i=
t
> > seems that when buck outputs are ganged, only the controls for the firs=
t
> > output have any actual effect. In such cases I don't know if we should
> > just ignore / leave out the secondary outputs from both the description
> > and the runtime state.
>
> This is very common, I would expect any regulators that are ganged
> together into a single regulator like this to simply not appear in the
> DT.

So if specifying polyphase settings from the DT is needed, it would
probably be some custom property, either under the primary phase, or
at the chip level. (Because the secondary phases would be absent from
the DT, one can't just reference them using a generic property.)


ChenYu


[1] https://lore.kernel.org/linux-sunxi/20250919000020.16969-1-andre.przywa=
ra@arm.com/

> Cheers,
> Angelo
>
> >
> > Another thing is that I kind of wonder why the mode configuration regis=
ter
> > setting isn't ganged in hardware like the enable and voltage settings.
> >
> >
> > Thanks
> > ChenYu
> >
> >>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>> +
> >>> +             regulators {
> >>> +                     /*
> >>> +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> >>> +                      *
> >>> +                      * However, this device originally shipped with=
 a broken
> >>> +                      * firmware that causes register reads over SPM=
I fail.
> >>> +                      * This is fixed in firmware version 15842.175.=
0, which
> >>> +                      * is included in ChromeOS releases R150-16700.=
22.0 or
> >>> +                      * R151-16721.0.0 and later.
> >>> +                      *
> >>> +                      * Assigning the cpu-supply properties for CPU6=
 and CPU7
> >>> +                      * without the fix will likely cause CPU DVFS t=
o stop
> >>> +                      * working. Hence the assignment is left out to=
 avoid a
> >>> +                      * regression of the function. If the user is c=
onfident
> >>> +                      * that their system has the fix, they can adde=
d the
> >>
> >> [Severity: Low]
> >> This isn't a bug, but there is a typo in this comment. It should say
> >> "they can add the property themselves".
> >>
> >>> +                      * property themselves.
> >>> +                      */
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928=
.612294-1-wenst@chromium.org?part=3D1
>

