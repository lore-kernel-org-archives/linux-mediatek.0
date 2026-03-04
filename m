Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80EFEDEC11
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 05:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=; b=RSXKO5p/F6CN++UQ7eHRKw/BtY
	nst5S1eaAFl9w32LNVTUzwgBBmWwDM1uolL0C1xMtNAYof6Xj8rZBqPF580PTZk2bm7eJjRMDMgOj
	KXRinckRb8L9ZP/2ZA8a1wz+dFX8nQWzsYo/pGROY2q2OlfuwC4DxkcFyv2j0X413X++gCxJPsnvn
	Da6xSzK6oNk+zUAN1NLDS8JYJZ7Jo5UDR+dlao1dHvnh3tLKcXIkn45LN7SPkm1fosyFBvtW2ZFk6
	aDwWKtSKHoGAdS/FF5oiLYVIJHVH5Oz+4hapvyL5TTyOm757KOLrbCDNt8iolZXw1/PnVhnbPJ984
	O3ggJuhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeyT-0000000GUXB-308i;
	Wed, 04 Mar 2026 05:40:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeyQ-0000000GUWH-2yLv
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 05:40:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Spam1108800
	for <linux-mediatek@lists.infradead.org>; Wed, 4 Mar 2026 05:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=; b=n4KQL2D4nW+vb9Xx
	LzjtRBihWkWIc7PDGPrANMUCWp4eaeoZn2XalpftiEevWIPtAr8BlyYk8zKXBG/Q
	fSzNPHRRMzKEM0or46IUjXUMhOhaUWIylIbkBPC81gl6vHIhDkgKy47mn+oE2XrG
	VMAfilXk1iRAqyOGdAHPPO5pHgaVCBTW0b+qgYJD9vZzH3NVuN2NwrpZYTpX/lWJ
	gB/r9gw2FhKSuiE1A6u1woG728q6QCaQQ8Ty1h2hpIc4ZsKMMON3oskmNnnfKowX
	u9VgfLz5HLjc73KQsqSzPBKD3+t8TMi3UXgn0lrzsYmfG6f08EMrfCr/pVvUnjc9
	xcWUEQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm4hk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 05:40:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be21146933so2586569eec.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Mar 2026 21:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602840; x=1773207640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=iVwjyYD3Lwz+fUVlk/R5rYRmNnGcSJP2FULr80LYHBos5H/k9htiHdZskA34zvWjVa
         hz5w7MrycPKw9TGjJMeYyl6DOel1jJ7RbwZiR80w7FZJ6weMREheJ00H+KTzqUCCObdQ
         WLFpIckP6uuy4XNQ/GDzl/SJ1AbZTAgXQp7KDhowZmkLPuv1+vAIRD5r075VSWxHZwrK
         FMpyhxGrb8oqrAUtT8z5azPXzkVfJ8fR4GRz1ef+4HnevB7Iyj5J2obuYZQHGX3HIpmo
         8ZgaqlJ4Py6jTV3mDElv2kcoEEMicNtCBVvcz+fFtzri6Dky+RDfuKRbAh5QtXFRAEtm
         Ioaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602840; x=1773207640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=Xivu971JVeOjWoGV0HYx+o7wuB4acDAt3+iJXXENyxech0Oooa2PtMSEysAyVuBf5X
         KQsqWMT/XFNqnLFrdQGx1Kl80swrbBZDokCh/gw9Z3WCNzTXps3LGzfW7KavkRPnlLUZ
         q4zhXMUybNSKAVLcKmL5ZMj9KHXrJtus8ltKu+rXRQSRMXq78zrja4W2d0DKmrZb7aUg
         5LwFmWBaV/0yx/XisNKwjt7Sx99OhJbVn86pdgTKoZGr81k9QeKGRu+URM3utgO86k/f
         qrUu7rSuHFJuS8MibBvt0m0c2Iua4yTDvq1S/blPt3gKJT8w9kRS3ZsdftXDzxUU52qg
         ls5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDfw37+q1iWXeSTzwyF5NAZNOoUGnoygn7Jhi+V5bbSyxYHzBJk6pp3esFunAUH/Sm1Hyqb1UOVon5bNE/1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU3p2F44amiAmZX2DSqXWrjSDfG8ZSEWd+Y5Sg/9x091E5o84o
	kaY+UICdyy8Sp5YoAP8O/66v0E1ZnHGeFYiElcsaIrFe8nNvl0d7qqcpJpsUnR9qrandTE6ZhC6
	x6ZXN5hxBsqClQ9mr2JOhFgr3guSHJvEk31ktVwFFENGplOp5XmOFWQgab0gj0C/h3AShO0YMuk
	w=
X-Gm-Gg: ATEYQzx3IWv+AGhzJKHtYJj6z9C03ywYM6vj2aYNsp2zu9rqF8hgyjX5yd+gZEJch2z
	sDv6kXrHigqsLRRC4YYdxKKs0ZKoUfl4ee2juMMP4KvSszjozzzCzw6vCIL1YjDUIpDV5EZfUWL
	cjXTvsyLiolfq1avg2raP250jNpqfmqi9jAVBsMGLPh+pt4p+QN6gIXe8INnBCfTkI8J84wZ5wo
	qHD8UgE51dorqNM1k99G7yO2gNysVCx7iwMXyS5o21cUdbLWMTKqwXPb77tiLUAHbMq5el6iZUu
	I+ojN8nnS67MI3tii2+hiV/x/A57ha8yL3qRAc65BXALboikZFNIMMXgpJvCl3HhkrzW3TqaiFD
	n1RJT24d/yrFoZSozsD14AxEMRIU7SD+h49Xyxu2ChFsA5plhMLoVEV4=
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294708eec.26.1772602840463;
        Tue, 03 Mar 2026 21:40:40 -0800 (PST)
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294695eec.26.1772602839913;
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e02f95sm14383897eec.13.2026.03.03.21.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Message-ID: <2387f306-d7df-41a6-a526-d5bc56ae1c06@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:40:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clocksource: Add module support for timer drivers
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LLR0df1U6Hwe8r9cR5dLYYSkqYrzzvkn
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a7c5d9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=tqqUqQLlst2uEWk403AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LLR0df1U6Hwe8r9cR5dLYYSkqYrzzvkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfX6feV6PiE7/xb
 7eq/OQeg0RTetH02/JJzIgravze3GpaK+Re5v0o874WIF3DC8LRv1gIT1k7BvH35HiOEX2WuDaa
 CFhcE9lU/h2pTV0GEY/04dMuULWAmWsgYx63pPaLJUFcAukBhZAYTHGBj4uWZjE0R6MM/azyDDV
 ledvOACzIwOL2QuowsI6i0bzlVybXrtnJe8GSh10lXxjxm0k+DJOuwV+XjFMSfbQHyzHnXR5s2S
 qqCCrkpUEjqb7PU41egTqYVJMXNGRYGzGq5zXQWxAis0zMSKGxBInqO0zyh6pD0TDQ7oF1HuH4A
 K0q2ZpNb8QmCf2N4L1IFo9nz+JN78twLzMHcC7JoMyLjYsoJ+UzcMxViOoOA8furtkXPvWPuJl/
 H/UzJ4oPo8rSkkOfa6dgWQcEACyZQcM3At7hPlENJGQYQVAYPXhhl5K9k9849qeoYOjOWIFMeMm
 KP4PEKsBBkJb4cM5+lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_214042_774145_6702B0E9 
X-CRM114-Status: GOOD (  20.44  )
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

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> This patch series enables clocksource timer drivers to be built as
> loadable kernel modules, which is particularly useful for GKI
> (Generic Kernel Image) configurations.
> 
> This series is based on the previous MediaTek timer modularization work:
> Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

You are not explaining clearly on the why part? Does MTK doesn't have
ARM compliant timers and due to which you have specific timer driver?

It is not clear. 


> 
> The series includes:
> 1. Export necessary functions from clocksource/mmio
> 2. Remove __init markings from timer-of to support modules
> 3. Convert MediaTek timer driver to support module build
> 4. Convert i.MX TPM timer driver to support module build
> 
> Testing performed:
> - Built and tested on i.MX8ULP platform
> - Built and tested on MediaTek platform
> - Verified both built-in and module configurations
> - Confirmed timer functionality in both configurations
> 
> Changes in v3:
> - Reworded summary line for timer-mediatek driver as suggested.
> - Improved commit message formatting (line wrapping).
> - No functional changes to the code.
> 
> Changes in v2:
> - Added Signed-off-by from submitter (Zhipeng Wang) to all patches
>   as requested by reviewers
> 
> Changes in v1:
> - Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
> - Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
> - Added i.MX TPM timer driver module support
> 
> Chun-Hung Wu (3):
>   clocksource/drivers/mmio: Export clocksource_mmio_init()
>   clocksource/drivers/timer-of: Remove __init markings
>   clocksource/drivers/timer-mediatek: Convert timer-mediatek to a
>     loadable module
> 
> Jindong Yue (1):
>   clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
> 
>  drivers/clocksource/Kconfig          |  4 ++--
>  drivers/clocksource/mmio.c           |  8 ++++---
>  drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
>  drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
>  drivers/clocksource/timer-of.c       | 23 +++++++++---------
>  drivers/clocksource/timer-of.h       |  6 ++---
>  6 files changed, 88 insertions(+), 22 deletions(-)
> 


