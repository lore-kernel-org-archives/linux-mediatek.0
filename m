Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEBEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 22:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLFKCAvv9NnBIGV+tAxtliZ7HU/1gvuOfVNy1ePsM88=; b=qACqDUZOun1V8Q
	R+7Ty7SS3N/X7kEyYMyhMS/v28ONMHVFQmkaKm9MHvVyyGkbOZpm591uOygOVulgPFBwlg60C5QSZ
	WdnHluaOSJf52mvAVf1XC/6JG2BQbIP/GwMgH7Gg4O65Lx4tqimOWm4EF5CollXZgc8JLm5Zjveuv
	PwWid2qQJwUt03DnHFPQuyXIWPiIdB1xamc9cm+edmTCl3jZMsDAFGhi4K63J5x1Bqc09t0NJnhUJ
	ab5N0v4EAlt1g5IvCsqznODYmJ9HzSnD0fNa+gqgSe3GN9RvAnVuAEmsbEZ+uqd99FyHijg8n7kW6
	l3rvTabpre4A5EhRKJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nleD7-002s0z-Sx; Mon, 02 May 2022 22:08:05 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nleD4-002rzq-7a
 for linux-mediatek@lists.infradead.org; Mon, 02 May 2022 22:08:04 +0000
Received: by mail-pj1-f46.google.com with SMTP id p6so13802117pjm.1
 for <linux-mediatek@lists.infradead.org>; Mon, 02 May 2022 15:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+WzlqIMp293K3H3f2sHDB997qf0xEgsGTkNiSko9TGw=;
 b=K7J5qp+Q5cBIpCefX33spWt1p7Q/n/3EnjjE/Wgj2yefH2nQ0R3pe8Z+aQ5WNVRvRO
 EvKjFbW8mpAX8ZaenzJt1aOFdESG/rwDVqPw03UpqVsAlaYeQAphjF56t9pGijjwPl0D
 oKh7coQUbtSsTa03pPzVknNxcEJTvu7KRWER6lAjhegFbZebseew9icGao+2s/iTajVl
 Pegr7S/h/I1p2wO3ki7WK+0fDpJcEb9QfearGw0Wa/48T4odU88RNYGWF23mzcvDvnPy
 dPJjwc6V3SGEYhJwtZMiq6wgmLezwxEsqvxLPx1Z/EFI9MXyEwYOYYXBHcomsxxJ2lh7
 Ib2w==
X-Gm-Message-State: AOAM5330Wa8r1PUEQBB6bqoh/vOCvQU6VvdbUCfdxOFHROLkEU+EmQMK
 UxnkBf54TjS4/joFwx6fjBL1ug==
X-Google-Smtp-Source: ABdhPJy77EMHFvDo/1IyhZFgTnu75Y3CzXZKSBDCXc2aNKF4uB76iHf85o37EM0Bt3dSQlistTdcqA==
X-Received: by 2002:a17:903:2043:b0:15b:f6ff:79ed with SMTP id
 q3-20020a170903204300b0015bf6ff79edmr13581711pla.15.1651529279501; 
 Mon, 02 May 2022 15:07:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 s13-20020a170902988d00b0015e8d4eb2a1sm5105174plp.235.2022.05.02.15.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:07:58 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Roger Lu <roger.lu@mediatek.com>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <rex-bc.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen
 <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, Xiaoqing
 Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang <Charles.Yang@mediatek.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <CAGXv+5HtMVCUdV=kNfOTCp3-1gEzTWtZ1xapgw=L-C2nTC0yag@mail.gmail.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
 <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
 <7hsfq6ql4v.fsf@baylibre.com>
 <d67d5f4f2ec96ade2398e7c0897dbb16bf5fb145.camel@mediatek.com>
 <ca127f7f-0620-1c03-4f39-206945b0e612@gmail.com>
 <CAGXv+5HtMVCUdV=kNfOTCp3-1gEzTWtZ1xapgw=L-C2nTC0yag@mail.gmail.com>
Date: Mon, 02 May 2022 15:07:58 -0700
Message-ID: <7h8rrjr3k1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_150802_313657_F4DCE9F8 
X-CRM114-Status: GOOD (  39.57  )
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

Chen-Yu Tsai <wenst@chromium.org> writes:

> On Fri, Apr 22, 2022 at 11:38 PM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 22/04/2022 04:24, Roger Lu wrote:
>> > Hi Kevin,
>> >
>> > On Thu, 2022-04-21 at 12:41 -0700, Kevin Hilman wrote:
>> >> Hi Roger,
>> >>
>> >> Roger Lu <roger.lu@mediatek.com> writes:
>> >>
>> >>> On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:
>> >>
>> >> [...]
>> >>
>> >>>> That being said, it would be really nice to see an integration tree
>> >>>> where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
>> >>>>
>> >>>> For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
>> >>>> board, it fails to probe[1] because there is no CCI node in the upstream
>> >>>> mt8183.dtsi.
>> >>>>
>> >>>> I'm assuming this series is also not very useful without the CPUfreq
>> >>>> series from Rex, so being able to test this, CCI and CPUfreq together on
>> >>>> MT8183 on a mainline kernel would be very helpful.
>> >>>>
>> >>>> Kevin
>> >>>>
>> >>>> [1]
>> >>>> [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
>> >>>> [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe
>> >>>> fail
>> >>>
>> >>> Just share. I've tested this series on below two platforms and it works as
>> >>> expected.
>> >>> - mt8183-Krane (kernel-v5.10)
>> >>> - mt8192-Hayato (kernel-v5.4)
>> >>
>> >> Unfortunately testing on v5.4 and v5.10 with lots of other additional
>> >> out-of-tree patches does not give much confidence that this series works
>> >> with upstream, especially when I've given a few reasons why it will not
>> >> work uptream.
>> >>
>> >> The examples I gave above for CCI and CPUs/cluster disable are good
>> >> examples, but another one I forgot to mention is the dependency on Mali.
>> >> The SVS driver will never probe because it also depens on a "mali" node,
>> >> which doesn't exist upstream either (but panfrost does, and acutually
>> >> loads/probes fine on v5.17/v5.18) so this should be fixed to work with
>> >> upstream panfrost.
>> >>
>> >> IMO, in order for this to be merged upstream, it should at least have
>> >> some basic validation with upstream, and so far I have not even been
>> >> able to make it successfuly probe.  To do that, you will need to either
>> >> provide a list of the dependencies for testing this with mainline
>> >> (e.g. CCI series, CPUfreq series, any DT changes), or even better, an
>> >> integration tree based on recent mainline (e.g. v5.17 stable, or
>> >> v5.18-rc) which shows all the patches (in addition to this series) used
>> >> to validate this on mainline.
>> >
>> > No problem. We'll find a machine that can be run correctly with recent mainline
>> > (e.g. v5.17 stable, or v5.18-rc) and add patches (CCI series + CPUfreq series +
>> > any DT changes) to test this SVS series. Thanks very much.
>> >
>>
>> Thanks Roger. I'll wait until this got tested with upstream Linux, before I will
>> apply all the patches.
>
> Hi everyone,
>
> I've put together an integration test branch:
>
> https://github.com/wens/linux/commits/mt8183-cpufreq-cci-svs-test
>
> This branch is based on next-20220422 and includes the following series:
>
> - ANX7625 DPI support v2
>   https://lore.kernel.org/all/20220422084720.959271-1-xji@analogixsemi.com/
> - MTK SVS v24
>   https://lore.kernel.org/all/20220420102044.10832-1-roger.lu@mediatek.com/
> - MTK cpufreq v4
>   https://lore.kernel.org/all/20220422075239.16437-1-rex-bc.chen@mediatek.com/
> - PM / devfreq core patches from
>   http://git.kernel.org/chanwoo/h/devfreq-testing
>   PM / devfreq: Export devfreq_get_freq_range symbol within devfreq
>   PM / devfreq: Add cpu based scaling support to passive governor
>   PM / devfreq: passive: Reduce duplicate code when passive_devfreq case
>   PM / devfreq: passive: Update frequency when start governor
> - CCI devfreq v2
>   https://lore.kernel.org/all/20220408052150.22536-1-johnson.wang@mediatek.com/
>
> And some patches of my own to fix some errors. See the last handful of
> patches including and after the fixup! one.

Thanks for setting up this branch.

> This was tested on Juniper (Acer Chromebook Spin 311) that has MT8183.

Is there an upstream DT for this platform?

I tried this series on mt8183-pumpkin, and since the upstream DT doesn't
define a CCI regulator, the CCI driver fails to probe.  Without CCI, the
SVS driver also fails to probe.  So the platform boots, but has neither
CCI nor SVS.

If I add a regulator for CCI[1], it goes farther, but then fails more
noisly[2]


> Looking at the mcu_*_sel clocks from /sys/kernel/debug/clk/clk_summary ,
> it does seem like things are happening, though I'm not sure how to
> thoroughly test this, especially SVS.

I think you're probably seeing CPU DVFS (CPUfreq) working, but I suspect
neither CCI or SVS have successfully loaded.

Kevin



[1]
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index b288b508fa4c..e064c06dc0d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -384,6 +384,10 @@ &mfg {
 	domain-supply = <&mt6358_vgpu_reg>;
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
 &cpu0 {
 	proc-supply = <&mt6358_vproc12_reg>;
 };


[2]
[    0.560083] mtk-ccifreq cci: devfreq_add_device: Unable to start governor for the device
[    0.576083] ------------[ cut here ]------------
[    0.576670] WARNING: CPU: 3 PID: 1 at drivers/devfreq/governor_passive.c:382 devfreq_passive_event_handler+0x80/0x3a0
[    0.578021] Modules linked in:
[    0.578413] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc3-next-20220422-05886-g9cd0610279c1-dirty #58
[    0.579653] Hardware name: Pumpkin MT8183 (DT)
[    0.580217] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.581097] pc : devfreq_passive_event_handler+0x80/0x3a0
[    0.581780] lr : devfreq_passive_event_handler+0x7c/0x3a0
[    0.582463] sp : ffff80000808ba40
[    0.582883] x29: ffff80000808ba40 x28: 0000000000000000 x27: fffffffffffffdfb
[    0.583788] x26: ffff0000037ba810 x25: ffff80000808bb40 x24: ffff80000a406640
[    0.584691] x23: ffff8000099153c8 x22: ffff0000037ba800 x21: 0000000000000000
[    0.585595] x20: ffff0000035c40a0 x19: ffff0000035c4080 x18: 0000000000000000
[    0.586267] mmc0: new ultra high speed SDR104 SDIO card at address 0001
[    0.586498] x17: 6f6620726f6e7265 x16: 766f672074726174 x15: 000006837f6218f7
[    0.588233] x14: 0000000000000320 x13: 0000000000000001 x12: 0000000000000000
[    0.589137] x11: 0000000000000001 x10: 0000000000000a50 x9 : ffff80000808b7a0
[    0.590041] x8 : ffff0000028b0ab0 x7 : ffff00007fb19d00 x6 : 00000000076832c3
[    0.590945] x5 : 00000000410fd030 x4 : 0000000000000000 x3 : ffff80000a3f70e8
[    0.591849] x2 : 0000000000000000 x1 : ffff0000028b0000 x0 : 00000000fffffffe
[    0.592753] Call trace:
[    0.593065]  devfreq_passive_event_handler+0x80/0x3a0
[    0.593706]  devfreq_remove_device+0x38/0xd0
[    0.594247]  devfreq_add_device+0x328/0x5f0
[    0.594778]  devm_devfreq_add_device+0x64/0xb0
[    0.595341]  mtk_ccifreq_probe+0x340/0x4e0
[    0.595860]  platform_probe+0x68/0xe0
[    0.596330]  really_probe.part.0+0x9c/0x29c
[    0.596862]  __driver_probe_device+0x98/0x144
[    0.597416]  driver_probe_device+0xac/0x140
[    0.597948]  __driver_attach+0xf8/0x190
[    0.598436]  bus_for_each_dev+0x70/0xd0
[    0.598925]  driver_attach+0x24/0x30
[    0.599380]  bus_add_driver+0x14c/0x1f0
[    0.599868]  driver_register+0x78/0x130
[    0.600356]  __platform_driver_register+0x28/0x34
[    0.600954]  mtk_ccifreq_platdrv_init+0x1c/0x28
[    0.601531]  do_one_initcall+0x50/0x1c0
[    0.602021]  kernel_init_freeable+0x20c/0x290
[    0.602576]  kernel_init+0x28/0x13c
[    0.603024]  ret_from_fork+0x10/0x20
[    0.603480] ---[ end trace 0000000000000000 ]---


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
