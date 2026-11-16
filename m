Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5328606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f3JPeuCQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8fSkSN3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=; b=f3JPeuCQ3GtXse
	854X7leruTqFVbHrFIj0oaRc+S2PVTmVB0tGLUOqgPHUkuq0eK+RsR+orqSf0GJ2j3goAj2VPi3ke
	mzwYlLtbx3jdU5+s+YaxH+B4r2sujWNE/BvoFLi/GHDklklC/hHGGvqW2I1lAl0gaEFxpdgo1qQ2E
	7pFN2dVAsUklGWZ4n+IY/eWy1p/OLF/e6x9FiQBU8jAXIF0FxQQFZvmfMUTmy5zYtXL2Sp60EP+2Y
	NBEe67H8u3pBmdPSXbh503EhgV1/nUE8wKPZrgV3h67mUUhOUPGf8Rtd3mYGrfU4YntYQrg+Xzr4l
	J0G8hwDtCYjjBYCCpdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Sb-00000003YiJ-1dgV;
	Mon, 16 Nov 2026 18:29:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1SY-00000003Yh4-397g
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:29:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so38072595e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853780; x=1795458580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=p8fSkSN3kM62CkECfY2MQQeuTAL5G+zRaSIxExkLjpK4NhOYwNdkBCLvOGufGweuaH
         xeHeTpeZRuy8U9q6ORGyKWjl6oLJ6K1fUgiSSeRLyu1Zn2W9OSZpwV1yPguPHOrmagBF
         wsBAMo5zJrV4k0hNt6IH4B3jxqjQQCcGIMv5FwpcGeivNl/+i1tudU95FjzUa+atdwFw
         mc08NGGymgB43qXbg96RgNDYbRHD8W7ecjNyVX1KqEKJcJ6PYf6c1cc9M+T+Qbc3t8VS
         hAfkU/Pj198+hePOetgdLcF28rFQZyJ1pkaD6FSoB7mnmJJAc9dfd/rQIaeQhq0Dl4UY
         Bvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853780; x=1795458580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
        b=mglxbwXoyIWv3Gzq1jmpuvpWzdLhc0MxZyk0TEPInefJmvCuuUaqVnLek4zHWLBNDT
         /qbM1CYFO/Vx8lLxUsYrJ43riTzxTn3EC4BCcQ06Q5NremwOb3xlHePpqQrks6F6A+LV
         2o5zZt/91phm5VY5rHTtjbECAoMccKeTLnbi0hnWepTlnB9/Y/E1gcEhRFCiPDrzNwFV
         iEFXPm/QP47DQC9oO9Hmcgy3ks/xtMaaYP5w2Pq5KK1+KtsOuP4gVnyjgnfo40kDzpm6
         eXS1j7cSzEMcK1lTHaZwxTzSfbDDcQFFGN3gqObN2Rfy+FhBaQxuuWcmkEe8Yz0m1Wyy
         hZwQ==
X-Forwarded-Encrypted: i=1; AL+hErHLEfjCLSHRDrB8mDOb0KZWsmLoHQFz6uijYhaVHmR8MJnYLV96tg8DSVOl7e0+1TlZ33Ciq5ZJBvwxAXZx8g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8wavGF7R9lsUYsb4ZC4VcSJVQzq5rq4xFWmx9i3Njkvk8yDduH
	xMQuUsQ5KD75oitjUKuVWSJE/azjPgQenaY5LQ/Gvl6aETtIBZNRF+da
X-Gm-Gg: AYBFou1KGYpRsB6bCXvxWfKhfZsdDqRfm/r3mE46ORsuo6LVtuKiaphSocaSJZSjD84
	LnunOg/KdZ9PWjJxpUGEY5PAw24eSXjXHXvG8pWgdllXaY1bXJlxlkf0k/IMRt1CtIf6YR+JlaQ
	+qgYXDK56aL+dLTH2C0yceQ+xXEeOcI8W4bIEKzS6SrQswlEbwZ4wKVr3ZZtvxdlgTSrIjSvdii
	riMa41qqjYkvoou3Z93ZcOkShYoxZ+S3lMCwrX/Z0TU4EAqv5z7gHDgv+CnQI/qA8LAi3GOqAaC
	ttLtOB3Cy6AuWcsyD+D2egMA1QWXKGnlc1hv+fag+XIx/a2Z/AUKoK2UYW6YS+49fcik3Ty3ECQ
	Xv3YOSSsLT1iqFmXDpaoQCA+XVpZbpj0RGNlqVNeCrWMKWQTiJt4H5Te9gpp4DswMu/jlseRZd8
	8JkqJP7FHJ/Ye9cvF22LQ3hAdX0rl2FUWJF3+cKyGJC2L9m0YqeyWHI5dFfvjVaLeTIglW7MPw7
	C5vj7fs44k9jlLExflnenVFqc7B05YjGmTeVBEXmBukKrrJRM9b3m9GPbDIwkTQbFGF510wcqbR
	0Snv+YFLOE3JUZ/TuR6tABVSXPltn5ppBgY5uQTs8bOtoYlwKSc=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr254839115e9.17.1794853780298;
        Mon, 16 Nov 2026 10:29:40 -0800 (PST)
Received: from [10.155.107.148] ([147.88.200.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm7171285e9.7.2026.11.16.10.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:29:39 -0800 (PST)
Message-ID: <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
Date: Mon, 16 Nov 2026 18:29:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and
 clear up the "async update" helper confusion
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Erwin Springer <aot.lerwin@gmail.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102942_805155_DF5408A4 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Am 16.11.2026 um 10:11 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The weird uapi semantics of the atomic async flip support make it
> really hard for drivers to implement. Try to fix that by filtering
> out the no-op junk from the commit that userspace likes to put there.
>
> Also a lot of people are apparently confusing the
> .atomic_async_{update,check}() hack with async flips. The two
> are completely orthogonal, so try to clear up that mess by
> renaming the hack to .atomic_bypass_{update,check}().
>
> TODO: atomic+async is in serious need to proper tests, somehow
>        all that seems to have gotten skipped when the feature
>        was added :(

thanks, this fixes the KWin case for me, so my patch is no longer
needed..

tested on Raptor Lake-U (Iris Xe) with unmodified KWin 6.8.2 and a
fullscreen client that requests tearing through wp_tearing_control_v1,
without my patch. I applied the series to the CachyOS 7.3.4 kernel,
the only conflicts were the renames in amdgpu and msm.

Before, none of about 350 frames per run was presented without vsync.
With the series 3330 of 3336 frames tear over four runs (with and
without CCS modifiers), and the "async flip not supported" message is
gone. What is still rejected is the first flip after the modifier or
format changed, once per run, as intended, and in three of the runs
one commit that touches the cursor plane, which can't do async flips:

   [PLANE:146:cursor A] does not support async flips
No warnings and no flip_done timeouts in the log.

If you think it fits, feel free to add:

Reported-by: Erwin Springer <aot.lerwin@gmail.com>
Tested-by: Erwin Springer <aot.lerwin@gmail.com>


