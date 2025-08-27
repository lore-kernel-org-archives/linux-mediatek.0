Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C2CA0FFC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 00:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=; b=1c4dKO8WcdL/1SOyl7C/8WMLla
	T/Dk8VjcahesPxPpdakOGra0SH9iaPnBYnpcrAEAyIrG8dguZ3dT4qzfJKKDtjmSW3yN4IF4zS/W4
	7qWgRbvcno4zy5q+bq7WAxTU/BnqXzJ7EoiopX0nBNVFsN0evE0QMV2Ne/OJdXH++J2RjzJNzttbq
	xXNFX6kVQp5dvBIzI10Cv4kqxvtBMXFjYUCy/t6erAAqOku0C715o2Sg8Ql2JQ1YdJAh58n1+MYTv
	MVMW8d7MCATahewOndW8yp0KfjRfdS1w7VJQaDwpSEEwVmVAAKko8XnEXewAV2QWm6+mm2pXPRAxX
	aIWVV9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQQY-0000000HLeL-14th;
	Thu, 28 Aug 2025 00:23:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOdK-0000000H6Cv-0GxE
	for linux-mediatek@bombadil.infradead.org;
	Wed, 27 Aug 2025 22:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=; b=ImiERv4pXHsT49NZGg4L8gV5Pa
	5Ed41l+oOEhCC5uqP3aG9hkHewLW32X+Z/7WWg6F5Cs2wQLzkOwnKu3l7HEWXMFAKZh+hFYrYTrmI
	9Xk9Di7df0rkeKhiNrJ7WKSGS+ceeM+XgzjYSb59nCMJo5zsc+bCw0ZMGt0Z5H/y0TU76xzbtU8qN
	Gg/YxVm7HWc2thuHzLBSZk+78PaQVsRcWf9Zw+srzFiJR3b4UxRWOvns8WYbKR3pADMdonTJ5CCdD
	GNjVmdh2Zqk9b+2ypc2QVM/QFriMxh60OKZKP494cB5f0RBV9l6p1Dd4CHRpcZH8DMaeNBcxFfk4Q
	EM6fEnqw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOdA-00000002Wc0-0gbf
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 22:28:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57REuWbb001842
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 22:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcrLZoaMuieBwoDNhdy1YKKE
	PmtaqIZQcasiCx3hw8M=; b=ksBOx0FaLwkdk0t38aj7T0xGmpchr04zFiJSkZgZ
	Ba64KDw1scqklvR5h9sPhUMIU5Lm2ULbS+dB0sk27byD5zxz1LdT8vRZaUw1mIEL
	xh0i2qoc9SiowpsxDWLGj59eU9BUKYNTd+Lt+SZ/9us8XpkdePkPbROX9L0c1Nis
	xuzdRsy97JbgBGv09uGR8V2gtRSajQOd+AstxEjUOr+Q/Lp78EBk7+sbA+6J7rxg
	ssnXa5MEdmfrn2nI2mdVDxwzLzHHqhlfufrgyew42L4gAJrqTf9p2WsvRy8xNAKa
	HZ7JFU2mS/Vczvql0G9Re9yqBmoUE7SgnNjvTTRqpyeYxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48t47b944n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 22:28:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109be41a1so13386741cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333713; x=1756938513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=;
        b=S8Z5W5wEknRhTtJTAd7tRXgu1zYIpMVBzeBD9CGuJ+3b0hwcFpuhSYoKdeSSM1U8bI
         AoZewInB0ErGj1olnlJXVR05R4QjHzUsngMW2kPv+zdouy5Sxy/9WlBOmrdE4uTD8pN5
         xc+DEUQyfLmecyq6YBtUQIYjhMjoZT7hbNWxTCoReyeMlHcH+0kirfOUXkgRq4SVUFq/
         85CM0FhmCXDsHYM3Lq03WysjEtoWDNjhu+d7jC36boK7QBdG6gagNm2MuuU+bGS8R72c
         rYhZXDhHH3+y+issDWBItKwu06IQ5lbL53MJs+K7vPvbPmZYMw+NVtTG/IRA5CukdtQU
         TdLg==
X-Forwarded-Encrypted: i=1; AJvYcCUWg7f01emISRgewcYrDSVpWgmpmD9ZBB9suJRCl2CpSq8/vTrfwtvvpT+/5Hv51SHTjOwMeUtEsNaEtrZEag==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJKyhG8AtL8Jiq/gmh77zPY4945Es4k0+zWUCU57Yv1NWZ6Ys9
	YO2Hn88VKvJ5IegbpTfDZSCxQ6TWyOVpBFr6IMdMCC9bQH+ZG45/NXns5STMx6Ui5kE0W2BAx+M
	zWjz+kFgwiOiWYKkboWsDuwgk1cIMiWB7sDjOOwY8pdo7gAyQ4WyHmPIzHTS0wqMH6IX7YXeQtw
	k=
X-Gm-Gg: ASbGnctWPxDNQao7/1/CGcmfZvA9tB6LKOEJQb6ambu6hAwaJ/d5wbI2lO+GLmJjFjd
	DdOLAfG1Scht3g9NnZ9fevGysDGp4hGUhFmOH71s45T6B8o5GKdsLnl8QUxNzF7521Iqg5XgRmM
	q+RsXt/flkewkvDSGOHim03Qjni1HHQbXGJcUupxlSwdvvPD5RHU0ar2VhRbVAOAZMX0AXC9Q9J
	z0Q9ta+NgXqHJInpy+82wF1hE4yjMzyAhz8l0OV+egzKNyHx8WW2U1MIiUBoGWNIKxiI03T2ZLk
	gkYf7m/ZypAIxkNKi1GTsyvW4FlPP+VYApNRbwEMV/OrSYDjt0JnhA1pIrCZhSlaZWFa0DwBnM5
	JBVfHEhBKd/cgFGjjfwxOfuqZXPV5oIkVCakFLOOCk1lJq1fCQqKo
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541721cf.32.1756333712523;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5nmdIbVBTqmW1BSWH9OY/lezBX2PorYOAsLp+HwXKOdiRgVyGEp2e8fxZ/9eVS1zmC9A+GQ==
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541351cf.32.1756333712052;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c13debsm2882288e87.57.2025.08.27.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:28:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
Message-ID: <a3hwkno4nemddbmaz6dayd24rmqcr3zxujrvsspnulrivntxjz@o3tm6o4mc6nt>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: WWF3gYcOOGCH_djjWc2MBBAXgwGi0-QG
X-Authority-Analysis: v=2.4 cv=CYoI5Krl c=1 sm=1 tr=0 ts=68af8692 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ROUmOPvenB7E6LXmrzQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: WWF3gYcOOGCH_djjWc2MBBAXgwGi0-QG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDEyOCBTYWx0ZWRfXzZf7MhRXULjB
 Tj/eBKt3a/2BMC8c1D38k5Dio8Lb4vQ+lm1Kf+zGstuTTfbvhn7U7KbI+URpmiO0k4Rkq8GmLwZ
 /YHQkeDa/PFSdRpQRASYg5bYLgIoktV/qCA8PIzOUS+5Jrj447YeHR4ftbNzyuJLQvSnkrWdUaU
 Dq9ykQesQpWQh+5rtmT9zETj1s5Hodk9GAEbJe0Bw3HaGKT3iFXtyvsyXM8j+9nC2TpmZyHNnYv
 pwxkXAxHPM080AMzYKdRQhQc52deSDFTTRCsGrBemXosyzFDeQfeAYRCWJi4z4sMtwfj7Ee3bCg
 82jS7jOf1PR9otON4CvGOI5VaLV8dITRXWJbdw2Dwb2mVM/k5kMLCOiTwq1b1nJj7uWWW0/fsBv
 aT/XwPGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508270128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_232837_117318_C8DF2F05 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Aug 25, 2025 at 03:43:09PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_existing_connector_state() function is deprecated and
> isn't used anymore, so let's remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

