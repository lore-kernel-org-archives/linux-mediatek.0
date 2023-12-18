Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F223EC46CD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLeSp9svZHdzIR7wKKoMmeEW8m57qpvxDofSrsxLD/g=; b=K4M7cnSjUBWY30qDI/c1lxXTss
	Z2TXfQ5GwNMpTTWLGxrOjNpCOWctvcUkaHCy77+jfPqtfun5Ulhp3umpYeG30uLtnLWD45PEbnkZA
	tK2YD750PAuqNo2qM0FOkJw5Xg184kcyA6yWrvWjk4Z5U4DkhQvnOzsBbGmymDjoWu3L1TfR37VEH
	SXgS+wQiEOCkkz56NUvHvOc+EwgYefVhdUIs+Toudvn+ElYSEp6hCQa4jxMUZX0jopDu6e0WGWNs+
	5nhWAN6SqOr1gUPfqhMDyuTKfgLs39aQGKIhi+VYV+dwgkagtZM6AHkNcPBKV5ZdzsndjzXAr3FVN
	6u1ue+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGWP-00BSRF-2c;
	Mon, 18 Dec 2023 16:31:13 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGWJ-00BSP2-2C;
	Mon, 18 Dec 2023 16:31:09 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-593ca6813f1so14805eaf.0;
        Mon, 18 Dec 2023 08:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917065; x=1703521865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLeSp9svZHdzIR7wKKoMmeEW8m57qpvxDofSrsxLD/g=;
        b=U63ibsuXZmEY4VB1GCbSJtgoI65pH3wIjMngWryaVfDeHdhpE1KgdMW7/Nj3j8nuVp
         f569EY1dLTf0e2Fn9tdxMHUHNp4TSfgQGwDkrctazqLTHvSk6gjJVkJOiCwwZeVJF9DN
         qNuWcasZFraoXNgJWsO7s9nRk2RR3FI9ULnHXnLEgH4zWDZP/8wPHky118I9kq79Zi+t
         vxcPOPCSQYVsHAAl9QIFoTDy/AeHy3uoKz9MIlNcGQcq+H8a/oDMLff1bahhAsUm9xUj
         LQ72+zUhhmx6GNemlbrTtvI6dfT1j0CzFwY5S4XkWSKdePj95o99FuWKyT6yWuv51hXw
         LMwQ==
X-Gm-Message-State: AOJu0YxEtYOEBxlITG7eJob+9qgVArsrbfpznZp4gEvBwgXAyDfMkARO
	d8eYCkLyzcTGmRhDAFDTUp+oZ5Fnivj09IExgfE=
X-Google-Smtp-Source: AGHT+IFofdWjtkDWEQou9mkAm2c5om2fMPeewg9j1b4feH+ggxh5Qj7m41Htmcb5xxxiW9yQoS1SJGd6huGeMXjjzMA=
X-Received: by 2002:a4a:c487:0:b0:58d:ddcb:db1a with SMTP id
 f7-20020a4ac487000000b0058dddcbdb1amr26740074ooq.1.1702917065186; Mon, 18 Dec
 2023 08:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20231218162348.69101-1-bo.ye@mediatek.com>
In-Reply-To: <20231218162348.69101-1-bo.ye@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 17:30:54 +0100
Message-ID: <CAJZ5v0gguUpHj59AUfjo20thpZkzUUQxiQXtcqStx2ASLixNBg@mail.gmail.com>
Subject: Re: [PATCH] thermal: fix race condition in suspend/resume
To: Bo Ye <bo.ye@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yongdong.zhang@mediatek.com, 
	"yugang.wang" <yugang.wang@mediatek.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_083107_793778_C60959D0 
X-CRM114-Status: GOOD (  27.73  )
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

On Mon, Dec 18, 2023 at 5:24=E2=80=AFPM Bo Ye <bo.ye@mediatek.com> wrote:
>
> From: "yugang.wang" <yugang.wang@mediatek.com>
>
>   Firstly, it needs to be clarified that this issue occurs in a real-
> world environment. By analyzing the logs, we inferred that the
> issue occurred just as the system was entering suspend mode, and the user
> was switching the thermal policy (this action causes all thermal zones
> to unregister/register). In addition, we conducted degradation tests
> and also reproduced this issue. The specific method is to first switch
> the thermal policy through a command, and then immediately put the
> system into suspend state through another command. This method can also
> reproduce the issue.
>
> Body:
>   This patch fixes a race condition during system resume. It occurs
>   if the system is exiting a suspend state and a user is trying to
>   register/unregister a thermal zone concurrently. The root cause is
>   that both actions access the `thermal_tz_list`.
>
> In detail:
>
>   1. At PM_POST_SUSPEND during the resume, the system reads all
>   thermal
>      zones in `thermal_tz_list`, then resets and updates their
>      temperatures.
>   2. When registering/unregistering a thermal zone, the
>      `thermal_tz_list` gets manipulated.
>
>   These two actions might occur concurrently, causing a race condition.
>   To solve this issue, we introduce a mutex lock to protect
>   `thermal_tz_list` from being modified while it's being read and
>   updated during the resume from suspend.
>
>   Kernel oops excerpt related to this fix:
>
>   [ 5201.869845] [T316822] pc: [0xffffffeb7d4876f0]
>   mutex_lock+0x34/0x170
>   [ 5201.869856] [T316822] lr: [0xffffffeb7ca98a84]
>   thermal_pm_notify+0xd4/0x26c
>   [... cut for brevity ...]
>   [ 5201.871061] [T316822]  suspend_prepare+0x150/0x470
>   [ 5201.871067] [T316822]  enter_state+0x84/0x6f4
>   [ 5201.871076] [T316822]  state_store+0x15c/0x1e8
>
>   3.Enable thermal policy operation will unregister/register all thermal =
zones
>      10-21 06:13:59.280   854   922 I libMtcLoader: enable thermal policy=
 thermal_policy_09.
>
>   4.System suspend entry time is 2023-10-20 22:13:59.242
>      [ 4106.364175][T609387] binder:534_2: [name:spm&][SPM] PM: suspend e=
ntry 2023-10-20 22:13:59.242898243 UTC
>      [ 4106.366185][T609387] binder:534_2: PM: [name:wakeup&]PM: Pending =
Wakeup Sources: NETLINK
>
>   5. It can be proven that the absence of a switch strategy will perform
>      unregister/register operations on thermal zones (android time is 202=
3-10-20 22:13:59.282)=EF=BC=8C
>      Because the logs for other thermal zones switching are not enabled b=
y
>      default, we cannot see the logs related to other thermal zones.
>      [ 4106.404167][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_unbind unbinding OK
>      [ 4106.404215][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_unbind unbinding OK
>      [ 4106.404225][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_unbind unbinding OK
>      [ 4106.404504][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_bind binding OK, 0
>      [ 4106.404545][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_bind binding OK, 2
>      [ 4106.404566][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Therm=
al/TZ/CPU]tscpu_bind binding OK, 1
>
>   6. thermal_pm_notify trigger KE(android time:  2023-10-20 22:13:59.3158=
94)
>      [ 4106.437171][T209387] binder:534_2: [name:mrdump&]Kernel Offset:0x=
289cc80000 from 0xffffffc008000000
>      [ 4106.437182][T209387] binder:534_2: [name:mrdump&]PHYS_OFFSET:0x40=
000000
>      [ 4106.437191][T209387] binder:534_2: [name:mrdump&]pstate: 80400005=
(Nzcv daif +PAN -UAO)
>      [ 4106.437204][T209387] binder:534_2: [name:mrdump&]pc :[0xffffffe8a=
6688200] mutex_lock+0x34/0x184
>      [ 4106.437214][T209387] binder:534_2: [name:mrdump&]lr :[0xffffffe8a=
5ce66bc] thermal_pm_notify+0xd4/0x26c
>      [ 4106.437220][T209387] binder:534_2: [name:mrdump&]sp :ffffffc01bab=
3ae0
>      [ 4106.437226][T209387] binder:534_2: [name:mrdump&]x29:ffffffc01bab=
3af0 x28: 0000000000000001
>
> Signed-off-by: Yugang Wang <yugang.wang@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>
> ---
>  drivers/thermal/thermal_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 9c17d35ccbbd..73d6b820c8b5 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1520,12 +1520,14 @@ static int thermal_pm_notify(struct notifier_bloc=
k *nb,
>         case PM_POST_HIBERNATION:
>         case PM_POST_RESTORE:
>         case PM_POST_SUSPEND:
> +               mutex_lock(&thermal_list_lock);
>                 atomic_set(&in_suspend, 0);
>                 list_for_each_entry(tz, &thermal_tz_list, node) {
>                         thermal_zone_device_init(tz);
>                         thermal_zone_device_update(tz,
>                                                    THERMAL_EVENT_UNSPECIF=
IED);
>                 }
> +               mutex_unlock(&thermal_list_lock);

This isn't sufficient.

I have a patch fixing this more completely, will post it later today
if time permits.

>                 break;
>         default:
>                 break;
> --

Thanks!

