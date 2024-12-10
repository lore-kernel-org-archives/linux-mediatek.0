Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39041E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX02cU310eK6UTMw9sAob3UP3z+RmmuYzAOsviURsyA=; b=AyYa8E0L/n8MB4awzo1kXLCEkU
	F7Tpxq/DMp7+p+6TikZlf2+0svBnBpTuolS2czDBBp6n9OOz028zjqv652sPNT2oisckq81/w0q7B
	oeuxBMKNWL1PiPEiRZy70YLMLMx1Ky5AGW9b2bp2jbrVr80TP4seLbT6A4j5jhAPG4KWvhwsuBrJa
	B4izExNzQfQe+Ux4ipnMK4YVFgTidkO+mcJKs6ZKr6HmQc/TvKjB9qF0KkaAaTtBZe0tpi4EhOEd6
	6HtHe68lLmODp8YEZfzws/vfhtaPVjOwjwKWGJVsPhAVm+4BaBrGoUcvG+H4snIsb8Lkfge0bPRhB
	ciXri+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx5M-0000000B3vG-11sW;
	Tue, 10 Dec 2024 10:03:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwsL-0000000B0GZ-2jfx
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 09:49:55 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4280940DA3
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733824189;
	bh=YX02cU310eK6UTMw9sAob3UP3z+RmmuYzAOsviURsyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=j88XDFSHuesi8NqNMsGDIKoRN6RpFAb4BQtscwTDJ0EgSAhtvuNEZ0Ug+UicYr95I
	 FD61ilPLezWj4v8BvMNX0HGlblw8TmQ5XE/nSQ6QyxGJOk8RUruDhNgMtDbv9t6Fj5
	 16NDv1q0x292uE1ytrxqgxN5ulP8mp91gubtBfuoZwzeIikejn0GBrpT7GkJ9CWql7
	 vxLAperyxRpuDtGUL0iaUAvJCA9p8BPvo933/y+zrcBDwpQ23ckodt15pAbNwd6fSP
	 ZtiCu1VN5B1Lhy3lbarYiFIuK3MKF0UNW5iTMW58AFRN4NozIN3CUJB9dc3TTYBlVu
	 SNBn+C3pOHKig==
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-724fc3f60c1so7794298b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 01:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824187; x=1734428987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YX02cU310eK6UTMw9sAob3UP3z+RmmuYzAOsviURsyA=;
        b=U6mLLx//bytoDDkG6U8U2gjTmubN6Mc3OexEBKDCg+bUpriJerBZsfuhzJ4z8/4m5L
         8AVB/U8miaaB9pKr2lMcholba+DFkZFHXET5fmA9EykYhuv8m0JjAj/DetfMDJoA/V8i
         J3WXf9AYTjh79G+kZwOksXchGZVchJeXgmEV1O3NvuvddSZohbIgrb1SyDEKt+byGH7u
         o2ndfI+zv5twV7kacNJk9LevkOkLpfwoEd3lcQwNUQGZS79xWK0M4FQ8AJVJ8rZyIpTK
         pA1tzvUJp5whtTAEZGiLDyzwN5iFMPX8dHIy6UG4fFt6vZRKKYe87/mOEOG7w2f25869
         qHDw==
X-Forwarded-Encrypted: i=1; AJvYcCXChP4WGDXXi7u25TZU/DxbZfaxTgORMSJAseFLB+vCcYnd+msPJzB9PVfQ9dUubS9FLzimC0YZYg8GRtP9kA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9oXRbtyrtR6/MdJiAw4vBqN1XP3n14taJe9+Fd0a7KBQwYdps
	1EXZwr3viW/LR+C9sQ40XqCSEEfyohhV6FytpamjKTI0UzFueJqSLGISQ5ExsF1eXx9TRvbjcM8
	XNwjuyMhHveTFYee8a9h7w8ffkwgctMTZrzGwv7nSfoandd+tZHg4ZWkctyGaCr95CqWQy0IDAR
	0jT7jWOe6voLNcDIaECeiuY6UEk37D
X-Gm-Gg: ASbGncthCUCoo0mQAGZ20IpBxpEnshHcTQxM2nCMaWnJIL98EKDZr8ElbjUL0tceKeP
	u2JxJ+4GiCFfqgcLKnmz6jrK7HUJT/Bs/yXfOfSA2+8HKkvseaAPUnfiKr0zkUAL7fTJ7+Wi3I5
	6XFOO/s5aY5rs7cTMutU+CPXf4mUjlCPhbvpv/QzNk4wiPvJlZdqTXhanz//g1fCHXTO+3+c+ua
	s4G+xp2UKeGN546wImCCvTnXdvg29Zw7EMIjtAR9ufVFwyhOm4rKzxk9PE5Vu2VRA==
X-Received: by 2002:a05:6a21:8982:b0:1e1:b8fc:9a75 with SMTP id adf61e73a8af0-1e1b8fc9c79mr2086378637.10.1733824187588;
        Tue, 10 Dec 2024 01:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc2cxGl/CeLTHQqqooNvASMJ46pWoz0s7wY8js+sAtKaeywezSqmHODgvcb53WNeXpF+Xdow==
X-Received: by 2002:a05:6a21:8982:b0:1e1:b8fc:9a75 with SMTP id adf61e73a8af0-1e1b8fc9c79mr2086358637.10.1733824187279;
        Tue, 10 Dec 2024 01:49:47 -0800 (PST)
Received: from [127.0.0.1] ([103.172.41.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725de3cb93dsm4740565b3a.169.2024.12.10.01.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:49:46 -0800 (PST)
Message-ID: <0ba499c2-5f59-4a27-98ae-aa118b7f130c@canonical.com>
Date: Tue, 10 Dec 2024 17:49:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Set private->all_drm_private[i]->drm to
 NULL if mtk_drm_bind returns err
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241206135507.1274357-1-guoqing.jiang@canonical.com>
 <3670b4af699a1c12000f09d671e93e3ae7359724.camel@mediatek.com>
Content-Language: en-US
From: Guoqing Jiang <guoqing.jiang@canonical.com>
In-Reply-To: <3670b4af699a1c12000f09d671e93e3ae7359724.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014953_945643_92D2DEC7 
X-CRM114-Status: GOOD (  12.10  )
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

On 12/10/24 17:16, CK Hu (胡俊光) wrote:
> Hi, Guoqing:
>
> On Fri, 2024-12-06 at 21:55 +0800, Guoqing Jiang wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> The pointer need to be set to NULL, otherwise KASAN complains about
>> use-after-free. Because in mtk_drm_bind, all private's drm are set
>> as follows.
>>
>> private->all_drm_private[i]->drm = drm;
>>
>> And drm will be released by drm_dev_put in case mtk_drm_kms_init returns
>> failure. However, the shutdown path still accesses the previous allocated
>> memory in drm_atomic_helper_shutdown.
>>
>> [   84.874820] watchdog: watchdog0: watchdog did not stop!
>> [   86.512054] ==================================================================
>> [   86.513162] BUG: KASAN: use-after-free in drm_atomic_helper_shutdown+0x33c/0x378
>> [   86.514258] Read of size 8 at addr ffff0000d46fc068 by task shutdown/1
>> [   86.515213]
>> [   86.515455] CPU: 1 UID: 0 PID: 1 Comm: shutdown Not tainted 6.13.0-rc1-mtk+gfa1a78e5d24b-dirty #55
>> [   86.516752] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10 10/01/2022
>> [   86.517960] Call trace:
>> [   86.518333]  show_stack+0x20/0x38 (C)
>> [   86.518891]  dump_stack_lvl+0x90/0xd0
>> [   86.519443]  print_report+0xf8/0x5b0
>> [   86.519985]  kasan_report+0xb4/0x100
>> [   86.520526]  __asan_report_load8_noabort+0x20/0x30
>> [   86.521240]  drm_atomic_helper_shutdown+0x33c/0x378
>> [   86.521966]  mtk_drm_shutdown+0x54/0x80
>> [   86.522546]  platform_shutdown+0x64/0x90
>> [   86.523137]  device_shutdown+0x260/0x5b8
>> [   86.523728]  kernel_restart+0x78/0xf0
>> [   86.524282]  __do_sys_reboot+0x258/0x2f0
>> [   86.524871]  __arm64_sys_reboot+0x90/0xd8
>> [   86.525473]  invoke_syscall+0x74/0x268
>> [   86.526041]  el0_svc_common.constprop.0+0xb0/0x240
>> [   86.526751]  do_el0_svc+0x4c/0x70
>> [   86.527251]  el0_svc+0x4c/0xc0
>> [   86.527719]  el0t_64_sync_handler+0x144/0x168
>> [   86.528367]  el0t_64_sync+0x198/0x1a0
>> [   86.528920]
>> [   86.529157] The buggy address belongs to the physical page:
>> [   86.529972] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000d46fd4d0 pfn:0x1146fc
>> [   86.531319] flags: 0xbfffc0000000000(node=0|zone=2|lastcpupid=0xffff)
>> [   86.532267] raw: 0bfffc0000000000 0000000000000000 dead000000000122 0000000000000000
>> [   86.533390] raw: ffff0000d46fd4d0 0000000000000000 00000000ffffffff 0000000000000000
>> [   86.534511] page dumped because: kasan: bad access detected
>> [   86.535323]
>> [   86.535559] Memory state around the buggy address:
>> [   86.536265]  ffff0000d46fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> [   86.537314]  ffff0000d46fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> [   86.538363] >ffff0000d46fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> [   86.544733]                                                           ^
>> [   86.551057]  ffff0000d46fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> [   86.557510]  ffff0000d46fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> [   86.563928] ==================================================================
>> [   86.571093] Disabling lock debugging due to kernel taint
>> [   86.577642] Unable to handle kernel paging request at virtual address e0e9c0920000000b
>> [   86.581834] KASAN: maybe wild-memory-access in range [0x0752049000000058-0x075204900000005f]
>> ...
> Refer to [1] to add Fixes tag.
>
> [1] https://www.kernel.org/doc/html/v6.12/process/submitting-patches.html

Thanks for reminder! I think the problem is caused by commit 
1ef7ed48356c, so

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi 
mmsys support")

And before send a new version with the tag, I will wait a few days for 
other comments.

Thanks,
Guoqing

