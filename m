Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7E7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 05:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvkWCp3TULXIw9lqlVxOiEqPNkLIY/UrROP9j1sk4DQ=; b=ysXGN3XaQon9kqdwT0o9IzUAgb
	exDIeto1XwtkY+Mw4whG0POKsfgg+ptDjeHHG8f7BRlwERfXzSzbBQ4vy8698XlGnqAQKPnbsaf3W
	kVj3s/mEHqFdHmN7FHdhf9jigYBtxv35zyC9BiYxgC1OGPA+wtrDCGHsGOID0eVbs6374sPR8NYyZ
	YcjnGYw58KMYbjI9IBBge064ir3yeSB/lYeJ53NddiJFo1SOaKU3Tk+SsRqPMJzonN/rvWux5r8PD
	sy3/WAv21LQkLDPzeiNzurh3lAtIbNvKnB+qYdgEpgkAMFwKKEvJV24afcvTWpSq3+KMSJDSvNANt
	eAHOk12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8SK-007sXl-KG; Thu, 09 Mar 2023 05:04:44 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8SH-007sWX-Qh
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 05:04:43 +0000
Received: by mail-ua1-x931.google.com with SMTP id v48so359883uad.6
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 21:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678338280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvkWCp3TULXIw9lqlVxOiEqPNkLIY/UrROP9j1sk4DQ=;
        b=lbAt2URQRLe8LSJFqdWbpmomRJNiXMA2424uR+W3DwF1OllEBMLepSWz3duHq5LKjz
         e3N2GlqN+Jy7R6PLD51J9fQF0wraQPE0TwvU1KO9hG4/sQN5Lp5o03WmBIPppEkT224T
         /kXv/iwsZ732FpJ6xRaE+1J8ASH0gwBJSLqaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678338280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvkWCp3TULXIw9lqlVxOiEqPNkLIY/UrROP9j1sk4DQ=;
        b=EnTQBIiOwCe4A1cFv8qfh62nGzltPUkxvZehqW8ssW4m7zCMOOtC6gp9WkWSZock2N
         1TPQP1pEPCN/tdeGDuJvcVyaook/REsVD+M5GF2Jte6DB7fa7D1KMNg9cpo5Vp+VPiOQ
         eplSaMRFvtlneIVeNFH0fZnpRgct58NmR8nGS6GwKD8X/3NXaWFgjeuX4CcVyY7ix47G
         tq6VBjQ7h3pN0mtOnL1wPZSimDOogPnON6dC8Tmq1pzetmMWokEi7NUW19cb2xhg6eIy
         lZ3/WVRmSzvh7IENFBSr6x5R7vapp5PEStjVeFjienBMRX+7oFzoJLRLeReJwjHnXZ1t
         HQDg==
X-Gm-Message-State: AO0yUKUyb4eMJUJO9cCAvsnzUMHqMgiYAJO4uTqPQcBj9SslanA3tZ7X
	rUE2PXWTpeF5cI9y5VGHRUX0OjqqybzqPlfEfnXWuw==
X-Google-Smtp-Source: AK7set/OuQNpfgATPmolGrn1KWxAEgo1eFsbDxOcmXs+3rXUpUz7lh8AvnQYkuxuMH2T2pWDyTvifVRol2PYQlc8zIY=
X-Received: by 2002:ab0:5402:0:b0:68a:a9d:13f5 with SMTP id
 n2-20020ab05402000000b0068a0a9d13f5mr13684728uaa.1.1678338280324; Wed, 08 Mar
 2023 21:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com>
In-Reply-To: <20230307163413.143334-1-bchihi@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Mar 2023 13:04:29 +0800
Message-ID: <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_210441_924523_721A2B10 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, Mar 8, 2023 at 12:34=E2=80=AFAM <bchihi@baylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTe=
k MT8192 SoC.
>
> This series is a continuation of the previous series "Add LVTS Thermal Ar=
chitecture" v14 :
>     https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.50=
294-1-bchihi@baylibre.com/
> and "Add LVTS's AP thermal domain support for mt8195" :
>     https://patchwork.kernel.org/project/linux-pm/cover/20230307154524.11=
8541-1-bchihi@baylibre.com/
>
> Based on top of thermal/linux-next :
>     base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
>
> Depends on these patches as they are not yet applyied to thermal/linux-ne=
xt branch :
>     [1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal c=
ontrollers for mt8195
>     https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.11=
8541-2-bchihi@baylibre.com/
>     [2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
>     https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.11=
8541-3-bchihi@baylibre.com/
>
> Balsam CHIHI (4):
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
>     for mt8192
>   thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
>   arm64: dts: mediatek: mt8192: Add thermal zones and thermal nodes
>   arm64: dts: mediatek: mt8192: Add temperature mitigation threshold

I tried this on my Hayato. As soon as lvts_ap probes and its thermal zones
are registered, a "critical temperature reached" warning is immediately
triggered for all the zones, a reboot is forced. A NULL pointer dereference
is also triggered somewhere. I filtered out all the interspersed "critical
temperature" messages:

[    2.943847] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000600
[    2.958818] Mem abort info:
[    2.965996]   ESR =3D 0x0000000096000005
[    2.973765] SMCCC: SOC_ID: ID =3D jep106:0426:8192 Revision =3D 0x000000=
00
[    2.975442]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[    2.987305]   SET =3D 0, FnV =3D 0
[    2.995521]   EA =3D 0, S1PTW =3D 0
[    3.004265]   FSC =3D 0x05: level 1 translation fault
[    3.014365] Data abort info:
[    3.017344]   ISV =3D 0, ISS =3D 0x00000005
[    3.021279]   CM =3D 0, WnR =3D 0
[    3.022124] GACT probability NOT on
[    3.024277] [0000000000000600] user address but active_mm is swapper
[    3.034190] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
[    3.044738] Modules linked in:
[    3.044745] CPU: 0 PID: 97 Comm: irq/273-1100b00 Not tainted
6.3.0-rc1-next-20230308-01996-g3c0b9a61a3e5-dirty #575
c7b94096b594a95f18217c2ad4a2bd6d2c431108
[    3.044751] Hardware name: Google Hayato rev1 (DT)
[    3.044755] pstate: 60000009 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    3.052055] pc : __mutex_lock+0x60/0x438
[    3.052066] lr : __mutex_lock+0x54/0x438
[    3.052070] sp : ffffffc008883c60
[    3.070822] x29: ffffffc008883c60 x28: ffffff80c281a880 x27: 000881f0000=
9001f
[    3.070830] x26: 1fc0000000247c00 x25: ffffff80c281a900 x24: 00000000000=
00000
[    3.070837] x23: 0000000000000000 x22: ffffffe5ae5d45f4 x21: 00000000000=
00002
[    3.086211] x20: 0000000000000000 x19: 00000000000005a0 x18: fffffffffff=
fffff
[    3.086218] x17: 6568636165722065 x16: 727574617265706d x15: 00000000000=
00028
[    3.097773] x14: 0000000000000000 x13: 0000000000003395 x12: ffffffe5af7=
f6ff0
[    3.097780] x11: 65706d655428206e x10: 0000000000000000 x9 : ffffffe5adc=
f4b08
[    3.097787] x8 : ffffffe5afe03230 x7 : 00000000000261b0 x6 : ffffff80c2b=
86600
[    3.105609] x5 : 0000000000000000 x4 : ffffff80c2b86600 x3 : 00000000000=
00000
[    3.112565] x2 : ffffff9b505f6000 x1 : 0000000000000000 x0 : 00000000000=
00000
[    3.127593] Call trace:
[    3.127595]  __mutex_lock+0x60/0x438
[    3.127600]  mutex_lock_nested+0x34/0x48
[    3.141844]  thermal_zone_device_update+0x34/0x80
[    3.152879]  lvts_irq_handler+0xbc/0x158
[    3.152886]  irq_thread_fn+0x34/0xb8
[    3.161489]  irq_thread+0x19c/0x298
[    3.161494]  kthread+0x11c/0x128
[    3.175152]  ret_from_fork+0x10/0x20
[    3.175163] Code: 97ccbb7c 9000bea0 b9411400 35000080 (f9403260)
[    3.189402] ---[ end trace 0000000000000000 ]---
[    3.193417] Kernel panic - not syncing: Oops: Fatal exception
[    3.201255] Kernel Offset: 0x25a5c00000 from 0xffffffc008000000
[    3.201257] PHYS_OFFSET: 0x40000000
[    3.201259] CPU features: 0x600000,01700506,3200720b
[    3.201263] Memory Limit: none
[    3.376838] Rebooting in 30 seconds..


>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
>  drivers/thermal/mediatek/lvts_thermal.c       | 106 +++-
>  .../thermal/mediatek,lvts-thermal.h           |  19 +
>  3 files changed, 577 insertions(+), 2 deletions(-)
>
>
> base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
> prerequisite-patch-id: 73be949bd16979769e5b94905b244dcee4a8f687
> prerequisite-patch-id: 9076e9b3bd3cc411b7b80344211364db5f0cca17
> prerequisite-patch-id: e220d6ae26786f524c249588433f02e5f5f906ad
> prerequisite-patch-id: 58e295ae36ad4784f3eb3830412f35dad31bb8b6
> prerequisite-patch-id: d23d83a946e5b876ef01a717fd51b07df1fa08dd
> prerequisite-patch-id: d67f2455eef1c4a9ecc460dbf3c2e3ad47d213ec
> prerequisite-patch-id: b407d2998e57678952128b3a4bac92a379132b09
> prerequisite-patch-id: fbb9212ce8c3530da17d213f56fa334ce4fa1b2b
> prerequisite-patch-id: 5db9eed2659028cf4419f2de3d093af7df6c2dad
> prerequisite-patch-id: a83c00c628605d1c8fbe1d97074f9f28efb1bcfc
> --
> 2.34.1
>
>

