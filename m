Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F159C624B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 04:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dd6qsG7SpyCH+oXyVh29L0R88Pw7qF1+ya5H1LtamA=; b=tJtu+S1+xCc8PAjxpi+wP4KqEd
	ZJbeBm1z9bY5JVgTicvLWrY1SwBqiPvJlVehl7gE6oDyJ4/MS9FP25Cm5/03+zI+YiJ/2a6BT7sEg
	zVEevm2PpjFj/gmD2HMLVwaYd7yJ7TKi4v3Smi62pslzmKE3rRLrpaSxR3zi7qm5wWbeOqwQYNqDE
	6k6j01Tdqv7PlPU22stdLRYRC3tUPuDxT3Mg8jZ5iDguZ7HIlVNx4/y58MitNkOLfyTCJ5EWavQwt
	FCC6qy2TclMwfHbad3GnMPK8PuMRddIT2OQ+xp4OYA2LIiYIImnuRXQQUWvx21IrvaeGEJDamm4Nc
	+q61kPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Np1-0067Q9-2K;
	Fri, 24 Nov 2023 04:29:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Nox-0067P4-2O
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 04:29:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a29c7eefso1936701e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 20:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700800175; x=1701404975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dd6qsG7SpyCH+oXyVh29L0R88Pw7qF1+ya5H1LtamA=;
        b=QY5UlyOoXT0rIaI9PmBDqkt1y/LsFlfo31YXl8dQMWybtQUX5CkA8MSkqZiFyUNoPN
         Ami6bg9Kh2vDrFwZTTjo+tLoYjYEQbG/kfwi9UX/HlAVKPH8dFwdSIirjy7w9pmmbDc7
         0X4AE9eQSAClJW4vQgzMd9gvnJU1m9SpVoyyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700800175; x=1701404975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dd6qsG7SpyCH+oXyVh29L0R88Pw7qF1+ya5H1LtamA=;
        b=C/QWLkjB8da+bbLZ7q6i/aZnaRi3RvsDsUYomwZxivx/Gql6jtDLT89lnRUbFd2QY0
         pE08OUfDsRxHfiPSmMpy9REa/wbnsLESacXcpzzSebN6qCIr9QPFVXT0BoCofmE/GauS
         riyG2lP/e1J0ISdydVHJW4tCKmPvb9jAEZGt8tTazcjb3vuWL4efJS1FZIQkRjrDGHsh
         qSUlv+J17hS+nLPfoh/P3P52+IoQsl0XULm3wkTja39Jn9iGoSbxwL0PX3uf/mJ59zRU
         XbHR45Y1F9PPw3q/l8+JNP/b6FuJuO1CJr6M8mPWG79hASOJFmZZmiEapEu6JdJfKIce
         BlRA==
X-Gm-Message-State: AOJu0YyvvT3dFJQP8xgt7fDaGRg6/sjEBGc+VpTfgHykS98NT+5mN7Or
	7AGidBCnkshzNlgrCYLtmnVisFiOaE6PuxSZnb1t6A==
X-Google-Smtp-Source: AGHT+IGZXwZ/D3VAWI6V+xCJUP7f/cdrxSi7tGKy+WxKapuYtBWE62lFk5owbyXuNoT+fytnXEH8GSYhhk8XqsfrYrQ=
X-Received: by 2002:a19:ac47:0:b0:509:2b82:385c with SMTP id
 r7-20020a19ac47000000b005092b82385cmr911988lfc.61.1700800174778; Thu, 23 Nov
 2023 20:29:34 -0800 (PST)
MIME-Version: 1.0
References: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
 <CAGXv+5E4TXrPmhb++r3vMGA4WoPc=covi7_=zgLLcOhGt9UBgg@mail.gmail.com> <CAKpemQJDf9RqeOStB4Rm5hzuQdzYF6JEbuz00Cr-a80cWZKR6w@mail.gmail.com>
In-Reply-To: <CAKpemQJDf9RqeOStB4Rm5hzuQdzYF6JEbuz00Cr-a80cWZKR6w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Nov 2023 12:29:23 +0800
Message-ID: <CAGXv+5HuxOtFfdWdocspTcDRytCK+0Ny+c_aFLJyHCUbYTboJQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
To: Bret Joseph <bretjoseph@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_202939_805978_9006D92C 
X-CRM114-Status: GOOD (  20.94  )
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

Please keep the whole CC list. Please don't top post.

On Thu, Nov 23, 2023 at 7:27=E2=80=AFPM Bret Joseph <bretjoseph@gmail.com> =
wrote:
>
> /sys/kernel/debug/regmap/1000d000.pwrap/registers
> 1e00: 2808
> 1e02: 2808
> 1e04: 2000
> 1e06: 2000
> 1e08: 2808

According to the datasheet I have, x8xx is not a valid voltage setting.
It wasn't valid before my patch either.

This is vcama1.

> 1e0a: 2808
> 1e0c: 2000
> 1e0e: 2000
> 1e10: 0000 # I have deleted everything with 0000
> 1e20: 2808
> 1e22: 2808
> 1e24: 2000
> 1e26: 2000
> 1e28: 2808

x8xx is not valid here either. This is vcn33.

> 1e2a: 2808
> 1e2c: 2000

x0xx is not valid here either. This is vsim1.

> 1e2e: 2000

x0xx for register 0x1e30 is not valid. This is vsim2.
x0xx for register 0x1e38 is not valid. This is vemc.
x0xx for register 0x1e3c is not valid. This is vldo28.
x0xx for register 0x1e48 is not valid. This is vmch.
x0xx for register 0x1e4c is not valid. This is vmc.

> 1e80: 2808
> 1e82: 2808
> 1e84: 2000
> 1e86: 2000
> 1e88: 2808
> 1e8a: 2808
> 1e8c: 2000
> 1e8e: 2000

x0xx for register 0x1e98 is not valid. This is vefuse.

> 1ea0: 2808
> 1ea2: 2808
> 1ea4: 2000
> 1ea6: 2000
> 1ea8: 2808
> 1eaa: 2808
> 1eac: 2000
> 1eae: 2000

x0xx for register 0x1eae is not valid. This is vcamd.

So basically all the failures you see are due to (as far as the datasheet
says) invalid values. The driver prior to my patch would error out as well.

Either the register readback is faulty on your platform, or your bootloader
has configured the system into a weird state.


ChenYu

> /sys/kernel/debug/regulator/regulator_summary
>  regulator                      use open bypass  opmode voltage
> current     min     max
> -------------------------------------------------------------------------=
--------------
>  regulator-dummy         3   35      0 unknown     0mV     0mA     0mV   =
  0mV
>    vdram1                      0    0      0  normal   500mV     0mA
> 500mV  2087mV
>    vcore                         0    0      0  normal   500mV     0mA
>   500mV  1293mV
>    vpa                            0    0      0  normal   500mV
> 0mA   500mV  3650mV
>    vproc11                     0    0      0  normal   500mV     0mA
> 500mV  1293mV
>    vproc12                     0    0      0  normal   500mV     0mA
> 500mV  1293mV
>    vgpu                          0    0      0  normal   500mV     0mA
>   500mV  1293mV
>    vs2                            0    0      0  normal   500mV
> 0mA   500mV  2087mV
>    vmodem                    0    0      0  normal   500mV     0mA
> 500mV  1293mV
>    vs1                            2    5      0  normal  1000mV
> 0mA  1000mV  2587mV
>       vio18                      1    0      0 unknown  1800mV     0mA
>  1800mV  1800mV
>       vcamio                   0    0      0 unknown  1800mV     0mA
> 1800mV  1800mV
>       vcn18                     0    0      0 unknown  1800mV     0mA
> 1800mV  1800mV
>       vefuse                    0    0      0 unknown  1700mV     0mA
> 1700mV  1900mV
>       vrf18                       0    0      0 unknown  1800mV
> 0mA  1800mV  1800mV
>    vdram2                      0    0      0 unknown   600mV     0mA
> 600mV  1800mV
>    vsim1                         0    0      0 unknown  1700mV     0mA
>  1700mV  3100mV
>    vibr                            0    0      0 unknown  1200mV
> 0mA  1200mV  3300mV
>    vrf12                          0    0      0 unknown  1200mV
> 0mA  1200mV  1200mV
>    vusb                           0    0      0 unknown  3000mV
> 0mA  3000mV  3100mV
>    vcamd                        0    0      0 unknown   900mV     0mA
>  900mV  1800mV
>    vfe28                          0    0      0 unknown  2800mV
> 0mA  2800mV  2800mV
>    vsram_proc11            0    0      0 unknown   500mV     0mA   500mV =
 1293mV
>    vcn28                         0    0      0 unknown  2800mV     0mA
>  2800mV  2800mV
>    vsram_others             0    0      0 unknown   500mV     0mA
> 500mV  1293mV
>    vsram_gpu                 0    0      0 unknown   500mV     0mA
> 500mV  1293mV
>    vxo22                         0    0      0 unknown  2200mV     0mA
>  2200mV  2200mV
>    vaux18                       0    0      0 unknown  1800mV     0mA
> 1800mV  1800mV
>    vmch                          0    0      0 unknown  2900mV     0mA
>  2900mV  3300mV
>    vbif28                         0    0      0 unknown  2800mV
> 0mA  2800mV  2800mV
>    vsram_proc12            0    0      0 unknown   550mV     0mA   500mV =
 1293mV
>    vcama1                      0    0      0 unknown  1800mV     0mA
> 1800mV  3000mV
>    vemc                          0    0      0 unknown  2900mV     0mA
>  2900mV  3300mV
>    vio28                          1    0      0 unknown  2800mV
> 0mA  2800mV  2800mV
>    va12                           0    0      0 unknown  1200mV
> 0mA  1200mV  1200mV
>    VCN33                       0    0      0 unknown  3300mV     0mA
>   0mV     0mV
>    vcama2                      0    0      0 unknown  1800mV     0mA
> 1800mV  3000mV
>    vmc                            0    0      0 unknown  1800mV
> 0mA  1800mV  3300mV
>    vldo28                        0    0      0 unknown  2800mV     0mA
>  2800mV  3000mV
>    vaud28                       0    0      0 unknown  2800mV     0mA
> 2800mV  2800mV
>    vsim2                         0    0      0 unknown  1700mV     0mA
>  1700mV  3100mV
>
> I have also seen errors when consumers use regulators which I think
> could be related to setting values on regulators
> Here is an example using mtk-ccifreq driver
> [ 0.668869] mtk-ccifreq cci: no pinctrl handle
> [ 0.669128] device: 'regulator:regulator.5--platform:cci': device_add
> [ 0.669278] devices_kset: Moving cci to end of list
> [ 0.669311] PM: Moving platform:cci to end of list
> [ 0.669340] mtk-ccifreq cci: Linked as a consumer to regulator.5
> [ 0.669713] of: _opp_add_static_v2: turbo:0 rate:500000000 uv:600000
> uvmin:600000 uvmax:600000 latency:0 level:0
> [ 0.669969] of: _opp_add_static_v2: turbo:0 rate:560000000 uv:675000
> uvmin:675000 uvmax:675000 latency:0 level:0
> [ 0.670245] of: _opp_add_static_v2: turbo:0 rate:612000000 uv:693750
> uvmin:693750 uvmax:693750 latency:0 level:0
> [ 0.670512] of: _opp_add_static_v2: turbo:0 rate:682000000 uv:718750
> uvmin:718750 uvmax:718750 latency:0 level:0
> [ 0.670763] of: _opp_add_static_v2: turbo:0 rate:752000000 uv:743750
> uvmin:743750 uvmax:743750 latency:0 level:0
> [ 0.671031] of: _opp_add_static_v2: turbo:0 rate:822000000 uv:768750
> uvmin:768750 uvmax:768750 latency:0 level:0
> [ 0.671598] of: _opp_add_static_v2: turbo:0 rate:875000000 uv:781250
> uvmin:781250 uvmax:781250 latency:0 level:0
> [ 0.671921] of: _opp_add_static_v2: turbo:0 rate:927000000 uv:800000
> uvmin:800000 uvmax:800000 latency:0 level:0
> [ 0.672178] of: _opp_add_static_v2: turbo:0 rate:980000000 uv:818750
> uvmin:818750 uvmax:818750 latency:0 level:0
> [ 0.672434] of: _opp_add_static_v2: turbo:0 rate:1050000000 uv:843750
> uvmin:843750 uvmax:843750 latency:0 level:0
> [ 0.672681] of: _opp_add_static_v2: turbo:0 rate:1120000000 uv:862500
> uvmin:862500 uvmax:862500 latency:0 level:0
> [ 0.672945] of: _opp_add_static_v2: turbo:0 rate:1155000000 uv:887500
> uvmin:887500 uvmax:887500 latency:0 level:0
> [ 0.673200] of: _opp_add_static_v2: turbo:0 rate:1190000000 uv:906250
> uvmin:906250 uvmax:906250 latency:0 level:0
> [ 0.673465] of: _opp_add_static_v2: turbo:0 rate:1260000000 uv:950000
> uvmin:950000 uvmax:950000 latency:0 level:0
> [ 0.673720] of: _opp_add_static_v2: turbo:0 rate:1330000000 uv:993750
> uvmin:993750 uvmax:993750 latency:0 level:0
> [ 0.673988] of: _opp_add_static_v2: turbo:0 rate:1400000000 uv:1031250
> uvmin:1031250 uvmax:1031250 latency:0 level:0
> [ 0.674327] device: 'cci': device_add
> [ 0.674499] PM: Adding info for No Bus:cci
> [ 0.674643] mtk-ccifreq cci: error -EPROBE_DEFER: devfreq_add_device:
> Unable to start governor for the device
> [ 0.675571] device: 'cci': device_unregister
> [ 0.675730] PM: Removing info for No Bus:cci
> [ 0.675862] mtk-ccifreq cci: failed to add devfreq device: -517
> [ 0.680084] mtk-ccifreq cci: Driver mtk-ccifreq requests probe deferral
> [ 0.680148] ------------[ cut here ]------------
> [ 0.680163] WARNING: CPU: 6 PID: 56 at _regulator_put+0x340/0x354
> [ 0.680190] Modules linked in:
> [ 0.680208] CPU: 6 PID: 56 Comm: kworker/u16:1 Tainted: G W
> 6.7.0-rc1-next-20231115-g2b600507077d-dirty #34
> [ 0.680232] Hardware name: MT6769H (DT)
> [ 0.680246] Workqueue: events_unbound deferred_probe_work_func
> [ 0.680268] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [ 0.680285] pc : _regulator_put+0x340/0x354
> [ 0.680302] lr : regulator_put+0x58/0x8c
> [ 0.680317] sp : ffffffc080483950
> [ 0.680328] x29: ffffffc080483950 x28: ffffff80c0030000 x27: ffffffdd0020=
37f0
> [ 0.680353] x26: ffffffdd01747650 x25: ffffff80c0f5d0c0 x24: ffffffdd0018=
0d80
> [ 0.680376] x23: ffffffc080483a98 x22: ffffffdd01f46d50 x21: ffffff80c0f5=
d780
> [ 0.680400] x20: ffffffdd01ee2bc0 x19: ffffff80c0f5d780 x18: ffffff80c1f8=
c660
> [ 0.680423] x17: 000000040044ffff x16: 005000f4b5593519 x15: ffffffdd0221=
fdb0
> [ 0.680446] x14: 0000000000000891 x13: 0000000000000891 x12: 000000000000=
0001
> [ 0.680468] x11: 0000000000000891 x10: 000000000001cde2 x9 : 000000000000=
1464
> [ 0.680491] x8 : 000000008020001f x7 : ffffff80c249e600 x6 : 000000000000=
018d
> [ 0.680513] x5 : 00000000000091ec x4 : 00000000000091d3 x3 : ffffffdd01a5=
e070
> [ 0.680535] x2 : 0000000000000001 x1 : ffffffdd01ee2b60 x0 : 000000000000=
0002
> [ 0.680558] Call trace:
> [ 0.680568] _regulator_put+0x340/0x354
> [ 0.680583] regulator_put+0x58/0x8c
> [ 0.680597] devm_regulator_release+0x30/0x4c
> [ 0.680613] release_nodes+0x8c/0xdc
> [ 0.680629] devres_release_all+0xc0/0x164
> [ 0.680646] device_unbind_cleanup+0x34/0xe4
> [ 0.680660] really_probe+0x200/0x75c
> [ 0.680674] __driver_probe_device+0x100/0x2e4
> [ 0.680688] driver_probe_device+0x6c/0x1d4
> [ 0.680703] __device_attach_driver+0x170/0x238
> [ 0.680717] bus_for_each_drv+0xbc/0x18c
> [ 0.680734] __device_attach+0x124/0x2ec
> [ 0.680748] device_initial_probe+0x30/0x4c
> [ 0.680762] bus_probe_device+0x138/0x168
> [ 0.680775] deferred_probe_work_func+0x134/0x1fc
> [ 0.680790] process_scheduled_works+0x26c/0x73c
> [ 0.680808] worker_thread+0x294/0x690
> [ 0.680823] kthread+0x1fc/0x22c
> [ 0.680837] ret_from_fork+0x10/0x20
> [ 0.680853] ---[ end trace 0000000000000000 ]---
> [ 0.680923] mtk-ccifreq cci: Dropping the link to regulator.5
> [ 0.680941] device: 'regulator:regulator.5--platform:cci': device_unregis=
ter
> [ 0.681041] platform cci: Added to deferred list
>
> On Thu, 23 Nov 2023 at 08:25, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Hi Bret,
> >
> > On Thu, Nov 16, 2023 at 12:52=E2=80=AFAM Bret Joseph <bretjoseph@gmail.=
com> wrote:
> > >
> > > In mt6358-regulator.c
> > >
> > > static const struct regulator_ops mt6358_volt_table_ops =3D {
> > >     .list_voltage =3D regulator_list_voltage_pickable_linear_range,
> > >     .map_voltage =3D regulator_map_voltage_pickable_linear_range,
> > >     .set_voltage_sel =3D regulator_set_voltage_sel_pickable_regmap,
> > >     .get_voltage_sel =3D mt6358_get_buck_voltage_sel /*regulator_get_=
voltage_sel_pickable_regmap*/,
> > >     .set_voltage_time_sel =3D regulator_set_voltage_time_sel,
> > >     .enable =3D regulator_enable_regmap,
> > >     .disable =3D regulator_disable_regmap,
> > >     .is_enabled =3D regulator_is_enabled_regmap,
> > >     .get_status =3D mt6358_get_status,
> > > };
> > >
> > > the function [regulator_get_voltage_sel_pickable_regmap] causes a -EI=
NVAL=E2=80=AC when registering
> > >
> > > vsim1 vusb vcamd vefuse vmch vcama1 vemc vmc vldo28 vsim2
> > >
> > > using [mt6358_get_buck_voltage_sel] results in a successful probe
> >
> > Sure it will probe, but any values you read back will be bogus.
> >
> > Can you provide a dump of /sys/kernel/debug/regulator/regulator_summary
> > and `grep ^1e..: /sys/kernel/debug/regmap/1000d000.pwrap/registers`,
> > and also any relevant logs?
> >
> > ChenYu

