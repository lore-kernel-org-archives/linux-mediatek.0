Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0838CCF6495
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Sep 2024 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EedeES2rtNeV4YWRh0TPWkSTA0alnE1XrpkIkW1q7+s=; b=nSlIVm0VAki+T6I2FyQU8FF5TG
	UwOxq8Vl0DarxeT5kfcvVVx7o1Ne6AD0iLAVhbjDLPraH8bAU+rNwxo5uPyWjW6MRjxmjnex/kb8C
	HB5WlopnppVUGwkqqjojq7aIfWunumHBTYy2QypSyRetN4yy+tl/GXo7ZDQwdmZ3uqiVWa3LtEDML
	BAsQVEzDSqk1wsGz/dX/+i0ZDS/z0wEZVmrM/se9rbvd1F58utLPcvRFv568hiYDm8XaLH6T5nyVq
	Owgd2ea00IVT28OoaGQr/X9Jreh0jzqEZAPtKrJDhdUB4mC8m1ZofzmrxdqBVN6sIMQE8k3VhX4GM
	SxEm9vUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suX5s-0000000D5d2-2kw0;
	Sat, 28 Sep 2024 13:02:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suX5p-0000000D5cD-1rY6;
	Sat, 28 Sep 2024 13:02:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so26988555e9.3;
        Sat, 28 Sep 2024 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727528554; x=1728133354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EedeES2rtNeV4YWRh0TPWkSTA0alnE1XrpkIkW1q7+s=;
        b=PqMhm7t+kah3joU/e6ATjgyGKwjEHfkl27GuOCprAE4uQg37oM0oueAq1RSbWOTTKe
         NUUhA1uOjptkANQYivdTUDWP6sirzhRHXH9pGaDwm/D9mBLbFdfP6QSexX+YbRTv0rx6
         GqW3ZtUVP0Dvw+YuWzVnm1CzfLy5g5/yB4tYHYs2o1NGb41fzQLF4Y2Rgb97fKxTtW3A
         mjDSOetAfnybR4nrHEvJBjMqhAsayMyzNTn2SkO2E4aNzPg2SYLwsYOuxfKY6WJ6JVxx
         dOS24i50JDfvcF/eA9zqM5uFcj6tGoLM/Xilsms6drLXr0GP1wUetNrRgG2iKFmQsL2S
         FhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727528554; x=1728133354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EedeES2rtNeV4YWRh0TPWkSTA0alnE1XrpkIkW1q7+s=;
        b=UgEa+PvwwRHoRQLvgn62RM2FLF0YxRwd4PxSuJzYqEtemmbRecCsH9PUQpW41WTSvw
         3F2rtQgvZJIIsAPTtk+LrA2T85ZXnceo4vEGshBt8WO5GWZKkFpIQKzZhNF8pKg/4x0F
         nMCjE9g5HVHz9NTQm9N7tXQmrpiQJncIlaHgDNqA1hlB26ysTggpYFfAyHcYMDy2er0O
         Ns6OwAtAntsMhlwQtO6tHuCtsUhXrjW6uWkgIEscjwL2DD0ouuGnwoTvAdnF7oTOvfal
         CyVyNqfhNBuE1K2lKiKHmsxrSOXQWEzO8CUzD5Ybr6Ifvm5WpBoVfMet0yAx2lQkFN5o
         7+8A==
X-Forwarded-Encrypted: i=1; AJvYcCVHsqMPp7ELmdnhlimtcmT7Y85KEEs6wPDVoGmRnQ4plPtKsJWoY/8dbI4bJz3qGKyTeAQMqhRug2SJQ743L+pF@lists.infradead.org, AJvYcCW38BI2Ly0kJGQsIIoUbUhxGE1An+BizxTMiwsF7wPT2+s/DtWre550LC7uwVvO7HwHXQAHzQ7FdnhBwycdjnk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyB332BikMtk92bnqb3Pnoc7rtt3QQ7j6tCFZTP98ab4r11aBxI
	MquX2ERcROpKADMea6du67K2/6gz9RibPBMtFgW8qwWqjXdwdZ4M
X-Google-Smtp-Source: AGHT+IGEznQ3u6gvyrG89Vgks8gfWnd2OfS/AZaiWVRXkRg9Z2ETr3av60pSZvjToKoQqW6UgNJduw==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr48043085e9.26.1727528554170;
        Sat, 28 Sep 2024 06:02:34 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f211dsm102599235e9.11.2024.09.28.06.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 06:02:33 -0700 (PDT)
Message-ID: <adf21ae5-6820-44ea-8cc9-7a42b345114b@gmail.com>
Date: Sat, 28 Sep 2024 16:02:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240926102238.24303-1-jason-jh.lin@mediatek.com>
Content-Language: en-US, tr, en-GB
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <20240926102238.24303-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_060237_526702_7C4A2BFA 
X-CRM114-Status: GOOD (  10.48  )
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

Hi,

On 2024-09-26 13:22 +03:00, Jason-JH.Lin wrote:
> Some SoCs not support pre-multiplied pixel formats and extending
> configuration of OVL pre-multiplied color formats, such as MT8173.
> 
> Fix the SoC degradation problem by this sreies.
> 
> ---
> 
> Change in v7:
> 1. Add the remove color format comment patch for OVL
> 2. Fix warning: 'const' type qualifier on return type has no effect
> 
> [...]

I get warnings and "*ERROR* failed to create property: blend_mode" a few 
times until mediatek-drm initializes. It happens on MT8173 and MT8183, but 
not on MT8186. Colors are correct, though. (I'm tempted to add Tested-by.)

------8<------

From MT8173:

[  +0.017201] ------------[ cut here ]------------
[  +0.009250] WARNING: CPU: 3 PID: 37 at drivers/gpu/drm/drm_blend.c:586 drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[  +0.022533] Modules linked in: [...]
[  +0.158166] CPU: 3 UID: 0 PID: 37 Comm: kworker/u16:1 Tainted: G        W          6.11.0-next-20240927-deb-00006-ge514a0f89dd9 #
[  +0.023542] Tainted: [W]=WARN
[  +0.005936] Hardware name: Google Hana (DT)
[  +0.008379] Workqueue: events_unbound deferred_probe_work_func
[  +0.011694] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  +0.013959] pc : drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[  +0.013111] lr : mtk_plane_init+0xf4/0x198 [mediatek_drm]
[  +0.010829] sp : ffff800081d538c0
[  +0.006634] x29: ffff800081d538c0 x28: ffff0000c431e080 x27: ffff0000c19787a8
[  +0.014314] x26: 0000000000000548 x25: 0000000000000006 x24: ffff0000c431f000
[  +0.014317] x23: 0000000000000035 x22: 0000000000000006 x21: ffff0000c0ca1058
[  +0.014313] x20: 0000000000000006 x19: 0000000000000000 x18: ffffffffffffffff
[  +0.014314] x17: 6f72702065746165 x16: 7263206f74206465 x15: ffff0000c414e626
[  +0.014316] x14: 0000000000000000 x13: 0000000000000028 x12: 0101010101010101
[  +0.014313] x11: 7f7f7f7f7f7f7f7f x10: fefefeff726e6f79 x9 : ffff800079e689dc
[  +0.014316] x8 : ffff0000c5875554 x7 : 00000000eeeeeeee x6 : 00000000c0c0c0c0
[  +0.014314] x5 : 0000000000000000 x4 : ffff0000c0ca1190 x3 : ffff0000c0ca1190
[  +0.014313] x2 : 000000000000ffff x1 : 0000000000000006 x0 : ffff0000c0ca1058
[  +0.014314] Call trace:
[  +0.004891]  drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[  +0.012415]  mtk_plane_init+0xf4/0x198 [mediatek_drm]
[  +0.010132]  mtk_crtc_create+0x34c/0x858 [mediatek_drm]
[  +0.010479]  mtk_drm_bind+0x4b4/0x600 [mediatek_drm]
[  +0.009956]  try_to_bring_up_aggregate_device+0x21c/0x2e8
[  +0.010825]  __component_add+0xc0/0x1c0
[  +0.007685]  component_add+0x1c/0x38
[  +0.007163]  mtk_disp_rdma_probe+0x148/0x230 [mediatek_drm]
[  +0.011175]  platform_probe+0x70/0xe8
[  +0.007338]  really_probe+0xc8/0x3a0
[  +0.007161]  __driver_probe_device+0x84/0x160
[  +0.008730]  driver_probe_device+0x44/0x130
[  +0.008379]  __device_attach_driver+0xc4/0x170
[  +0.008905]  bus_for_each_drv+0x90/0x100
[  +0.007855]  __device_attach+0xa8/0x1c8
[  +0.007685]  device_initial_probe+0x1c/0x30
[  +0.008380]  bus_probe_device+0xb0/0xc0
[  +0.007683]  deferred_probe_work_func+0xbc/0x120
[  +0.009253]  process_one_work+0x178/0x3d0
[  +0.008033]  worker_thread+0x200/0x3f0
[  +0.007511]  kthread+0xe8/0xf8
[  +0.006115]  ret_from_fork+0x10/0x20
[  +0.007164] ---[ end trace 0000000000000000 ]---
[  +0.009278] [drm:mtk_plane_init [mediatek_drm]] *ERROR* failed to create property: blend_mode

From MT8183:

[   13.936989] ------------[ cut here ]------------
[   13.946224] WARNING: CPU: 5 PID: 60 at drivers/gpu/drm/drm_blend.c:586 drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[   13.968714] Modules linked in: [...]
[   14.116814] CPU: 5 UID: 0 PID: 60 Comm: kworker/u34:2 Tainted: G        W          6.11.0-next-20240927-deb-00006-ge514a0f89dd9 #1
[   14.140323] Tainted: [W]=WARN
[   14.146248] Hardware name: Google cozmo board (DT)
[   14.155830] Workqueue: events_unbound deferred_probe_work_func
[   14.167505] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   14.181440] pc : drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[   14.194529] lr : mtk_plane_init+0xf4/0x188 [mediatek_drm]
[   14.205338] sp : ffff8000804a3860
[   14.211960] x29: ffff8000804a3860 x28: ffff715445288080 x27: ffff7154417fa748
[   14.226247] x26: 0000000000000548 x25: 0000000000000006 x24: ffff71544528a000
[   14.240536] x23: 0000000000000035 x22: 0000000000000006 x21: ffff715445a49ae8
[   14.254822] x20: 0000000000000006 x19: 0000000000000000 x18: ffffffffffffffff
[   14.269110] x17: 6f72702065746165 x16: ffffd6facceae8c0 x15: ffff715470421d46
[   14.283398] x14: 0000000000000000 x13: 0000000000000028 x12: 0101010101010101
[   14.297686] x11: 7f7f7f7f7f7f7f7f x10: fefefeff726e6f79 x9 : ffffd6fa92d179dc
[   14.311973] x8 : ffff715445156ad4 x7 : 00000000eeeeeeee x6 : 00000000c0c0c0c0
[   14.326261] x5 : 0000000000000000 x4 : ffff715445a49c20 x3 : ffff715445a49c20
[   14.340549] x2 : 000000000000ffff x1 : 0000000000000006 x0 : ffff715445a49ae8
[   14.354837] Call trace:
[   14.359718]  drm_plane_create_blend_mode_property+0xf0/0x110 [drm]
[   14.372111]  mtk_plane_init+0xf4/0x188 [mediatek_drm]
[   14.382224]  mtk_crtc_create+0x34c/0x858 [mediatek_drm]
[   14.392685]  mtk_drm_bind+0x51c/0x600 [mediatek_drm]
[   14.402622]  try_to_bring_up_aggregate_device+0x21c/0x2e8
[   14.413425]  __component_add+0xc0/0x1c0
[   14.421094]  component_add+0x1c/0x38
[   14.428241]  mtk_dsi_host_attach+0x80/0xe0 [mediatek_drm]
[   14.439049]  devm_mipi_dsi_attach+0x3c/0xa0
[   14.447413]  anx7625_link_bridge+0xfc/0x1c8 [anx7625]
[   14.457522]  dp_aux_ep_probe+0x54/0x110 [drm_dp_aux_bus]
[   14.468150]  really_probe+0xc8/0x3a0
[   14.475296]  __driver_probe_device+0x84/0x160
[   14.484009]  driver_probe_device+0x44/0x130
[   14.492374]  __device_attach_driver+0xc4/0x170
[   14.501261]  bus_for_each_drv+0x90/0x100
[   14.509103]  __device_attach+0xa8/0x1c8
[   14.516772]  device_initial_probe+0x1c/0x30
[   14.525137]  bus_probe_device+0xb0/0xc0
[   14.532805]  deferred_probe_work_func+0xbc/0x120
[   14.542040]  process_one_work+0x178/0x3d0
[   14.550059]  worker_thread+0x200/0x3f0
[   14.557553]  kthread+0xe8/0xf8
[   14.563656]  ret_from_fork+0x10/0x20
[   14.570803] ---[ end trace 0000000000000000 ]---
[   14.580052] [drm:mtk_plane_init [mediatek_drm]] *ERROR* failed to create property: blend_mode

