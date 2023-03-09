Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D89C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXTLVKonq145fe0ytXdOtgCPf7KTsG27A4IaoSc+Vu0=; b=BYyJ043QgblNL0mENmZoYIMmNT
	fekEEiqi7K2vV6Ii4PS63O5fvV4Ft9rlXCMzbX7PQGJJKinN/LTdAmtXz84v021VOtC6DjVU3KvLx
	d+x1F8UJOI82Cx6KSIUt5uio5s79aox5PcC8b5+B4cukJSCGay7orqUgBJ5kaiKCM0svrr75pIfdp
	zhtdKmIA7RFjfD7US9BV5Uq1bNLqTGyw86TrHPocHBNp5craTXkIY1THJWzFqSmHzX0hGgs8gOQEk
	quMAmKKvMRQIQq9vSLksfKXJIbVNo+lTGIxivCxE7ZEh2rHgcP+YJUzLMV3Vxky1HdtZGTDItt/AU
	Wo4NYRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDp1-009D4Z-0E; Thu, 09 Mar 2023 10:48:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDov-009Cy2-Pc
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 10:48:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g3so5250917eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678358899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXTLVKonq145fe0ytXdOtgCPf7KTsG27A4IaoSc+Vu0=;
        b=RhuYXi/vwq0tgS5GhFnoNC8LMoV5+GTnZzhggDxNiDUfvUTEwHjXH1QFdCwwWjE+G1
         e0/S+kYLzRP6l1fYv2oTVChyZ92RZ9jv3ZjVCC5abcHsLGtNPVh5F+wjvYAlFL2eFG3p
         Hf6be/kM1yWovX+Gxbt5XypEX0RGI51I9b/zn/41TNhfusLsWJ173XcR2JmECfLbnJKg
         Ph+KR9/Xt5aa86kOYksjU75n5VXBllhrOrOX3JpZ59U+D60EIS0T2trte2YoUV5XtW85
         U25kVOxsfFpHo0lQa0dpIUezA/Jl2MXlIAnxlnVOps2JcsYm2FxHgyZEDW95eHKdTei/
         b8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXTLVKonq145fe0ytXdOtgCPf7KTsG27A4IaoSc+Vu0=;
        b=hAY6G38o7rVKWCWtVZT9v/ZIz6+Ln0079584CBCaHp+GhQSGlnNa/dtli1L3e/7be1
         zAQ3FzfId7zqQeUhVY+6jK6+sAw0iFXrt4Jq/YG2LZpUz6AFlY2mQ1xR6MQkscZzCh30
         bTXMkOTfyPFh7tPU0Uu/sQMUHciqTSKIYa7SDpdYKvpt9JioLFHggN+VvhGUAqx5q4Kw
         7N3x3N2ww3pLUZC9VrPdh8RCzD6OYRBZ5aXG4bi+IbauCL3wGm9jOO4kwXI3YOXyPpHz
         i3H3iw030EQB1zrsjhLm19uaiiuCX+Ez70yG25pfbZE7/8taKa81dZyYryFHolI++PdR
         Fk6w==
X-Gm-Message-State: AO0yUKWrjr3vHH3Cp8rTfOog7wg/uAOWUFjMwAQMvJaccmhUSFb9aqR1
	PPuz11/Q9qwziyQ9Pb4m2W2tCe727jZ+TpgGWidDhQ==
X-Google-Smtp-Source: AK7set8OJIO98YFS8R5gs+1Y4ruIuk2NfbZOxptFzB7tMyH1e5MDNlprG5ONb0fZqQq4CxO53p4GZ4Hhr1rIMNPEkRo=
X-Received: by 2002:a17:906:338b:b0:879:e5b2:e12d with SMTP id
 v11-20020a170906338b00b00879e5b2e12dmr9882276eja.13.1678358899375; Thu, 09
 Mar 2023 02:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
In-Reply-To: <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 9 Mar 2023 11:47:43 +0100
Message-ID: <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20230309_024826_071450_687C92D5 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Chen-Yu,

On Thu, Mar 9, 2023 at 6:04=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Wed, Mar 8, 2023 at 12:34=E2=80=AFAM <bchihi@baylibre.com> wrote:
> >
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add full LVTS support (MCU thermal domain + AP thermal domain) to Media=
Tek MT8192 SoC.
> >
> > This series is a continuation of the previous series "Add LVTS Thermal =
Architecture" v14 :
> >     https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.=
50294-1-bchihi@baylibre.com/
> > and "Add LVTS's AP thermal domain support for mt8195" :
> >     https://patchwork.kernel.org/project/linux-pm/cover/20230307154524.=
118541-1-bchihi@baylibre.com/
> >
> > Based on top of thermal/linux-next :
> >     base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
> >
> > Depends on these patches as they are not yet applyied to thermal/linux-=
next branch :
> >     [1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal=
 controllers for mt8195
> >     https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.=
118541-2-bchihi@baylibre.com/
> >     [2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt81=
95
> >     https://patchwork.kernel.org/project/linux-pm/patch/20230307154524.=
118541-3-bchihi@baylibre.com/
> >
> > Balsam CHIHI (4):
> >   dt-bindings: thermal: mediatek: Add LVTS thermal controller definitio=
n
> >     for mt8192
> >   thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
> >   arm64: dts: mediatek: mt8192: Add thermal zones and thermal nodes
> >   arm64: dts: mediatek: mt8192: Add temperature mitigation threshold
>
> I tried this on my Hayato. As soon as lvts_ap probes and its thermal zone=
s
> are registered, a "critical temperature reached" warning is immediately
> triggered for all the zones, a reboot is forced. A NULL pointer dereferen=
ce
> is also triggered somewhere. I filtered out all the interspersed "critica=
l
> temperature" messages:
>

Thank you very much for testing!
It seems like interrupts on mt8192 and mt8195 do not behave the same way.
I am investigating the issues.

> [    2.943847] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000600
> [    2.958818] Mem abort info:
> [    2.965996]   ESR =3D 0x0000000096000005
> [    2.973765] SMCCC: SOC_ID: ID =3D jep106:0426:8192 Revision =3D 0x0000=
0000
> [    2.975442]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    2.987305]   SET =3D 0, FnV =3D 0
> [    2.995521]   EA =3D 0, S1PTW =3D 0
> [    3.004265]   FSC =3D 0x05: level 1 translation fault
> [    3.014365] Data abort info:
> [    3.017344]   ISV =3D 0, ISS =3D 0x00000005
> [    3.021279]   CM =3D 0, WnR =3D 0
> [    3.022124] GACT probability NOT on
> [    3.024277] [0000000000000600] user address but active_mm is swapper
> [    3.034190] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> [    3.044738] Modules linked in:
> [    3.044745] CPU: 0 PID: 97 Comm: irq/273-1100b00 Not tainted
> 6.3.0-rc1-next-20230308-01996-g3c0b9a61a3e5-dirty #575
> c7b94096b594a95f18217c2ad4a2bd6d2c431108
> [    3.044751] Hardware name: Google Hayato rev1 (DT)
> [    3.044755] pstate: 60000009 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    3.052055] pc : __mutex_lock+0x60/0x438
> [    3.052066] lr : __mutex_lock+0x54/0x438
> [    3.052070] sp : ffffffc008883c60
> [    3.070822] x29: ffffffc008883c60 x28: ffffff80c281a880 x27: 000881f00=
009001f
> [    3.070830] x26: 1fc0000000247c00 x25: ffffff80c281a900 x24: 000000000=
0000000
> [    3.070837] x23: 0000000000000000 x22: ffffffe5ae5d45f4 x21: 000000000=
0000002
> [    3.086211] x20: 0000000000000000 x19: 00000000000005a0 x18: fffffffff=
fffffff
> [    3.086218] x17: 6568636165722065 x16: 727574617265706d x15: 000000000=
0000028
> [    3.097773] x14: 0000000000000000 x13: 0000000000003395 x12: ffffffe5a=
f7f6ff0
> [    3.097780] x11: 65706d655428206e x10: 0000000000000000 x9 : ffffffe5a=
dcf4b08
> [    3.097787] x8 : ffffffe5afe03230 x7 : 00000000000261b0 x6 : ffffff80c=
2b86600
> [    3.105609] x5 : 0000000000000000 x4 : ffffff80c2b86600 x3 : 000000000=
0000000
> [    3.112565] x2 : ffffff9b505f6000 x1 : 0000000000000000 x0 : 000000000=
0000000
> [    3.127593] Call trace:
> [    3.127595]  __mutex_lock+0x60/0x438
> [    3.127600]  mutex_lock_nested+0x34/0x48
> [    3.141844]  thermal_zone_device_update+0x34/0x80
> [    3.152879]  lvts_irq_handler+0xbc/0x158
> [    3.152886]  irq_thread_fn+0x34/0xb8
> [    3.161489]  irq_thread+0x19c/0x298
> [    3.161494]  kthread+0x11c/0x128
> [    3.175152]  ret_from_fork+0x10/0x20
> [    3.175163] Code: 97ccbb7c 9000bea0 b9411400 35000080 (f9403260)
> [    3.189402] ---[ end trace 0000000000000000 ]---
> [    3.193417] Kernel panic - not syncing: Oops: Fatal exception
> [    3.201255] Kernel Offset: 0x25a5c00000 from 0xffffffc008000000
> [    3.201257] PHYS_OFFSET: 0x40000000
> [    3.201259] CPU features: 0x600000,01700506,3200720b
> [    3.201263] Memory Limit: none
> [    3.376838] Rebooting in 30 seconds..
>
>
[...]

Best regards,
Balsam

