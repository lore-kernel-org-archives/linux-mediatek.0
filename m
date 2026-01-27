Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBDD2D8FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ABV36DRkDtQR4vYl4UAtKEgani
	LIpH+ZGOb2K0QymO64e3e1c8x/sm0PmbYxrZVm5NRO+1U72ReMSN5rSRioMKfEAV5WQxZWU7ve2wc
	SmLA8m00rL7+L4eMzGKwzZqLSE8IiRXYOQuoOmQSuB6GLm/8wNzd1rbMUjpT4L1byOwuR+Q/umOaA
	iLM2l0LJUMREGFT89vzUCi3Qi+0Yd+52YEKw+8A5/fx7nA02yh05OmeDXlh2ZBKYpFJXvNBGCGg/Z
	LZMkIzGQIiYeSxd4G17yllle/2mOdHsn9ssJlYn88L2/4PkwzXPA+p0ahfjmiob7uodZqys/TDQon
	8Xzp4oNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh7x-0000000E9P7-3LsD;
	Tue, 27 Jan 2026 11:20:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh7t-0000000E9NU-1keG
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 11:20:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA9MqB1268740
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 11:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ZOmoAHbzG7TQYghP
	Q/+fbofrkL7z1l7f55oU9lCHS5tFUbwHxZdoNe8x2Autw64GNBVGPZfGheI2QSXv
	FLteKO5fStxqgUtuFGTqtUmc3bhwpXiwUTAZq+eiWL9XCEl7E9oBmFcwcII/R3A1
	XIXCwti6ZrVikX3lgE3m+BnoMabUKfRhd6rX6vphMzGx4wHMLshJAZJClrQDYRtc
	V9wdwul5Zz53ucOdClomE9fcqt3xWzzcwLuJR/aoXdZY0kjqRw8azEK/efE5heiY
	9HP7tGuOK4teYFXiS9Y1Hx43Up5X4TKZSsUszoo+KyiOSAcSekrY+FTAMewIDm0c
	ocgIsg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasf74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 11:20:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662e5d9a84so6100123e0c.2
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Jan 2026 03:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769512852; x=1770117652; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=ZFV3UFfS5++2vGGec2PmRAlOSiEutmPfyfffpQS+duBzcQHZsFTQFfDUtpEgaC44sX
         mZiiOv10GrpW01vLU7r/sNTHk+WBIxGt8kIqD4mPvuMD1JAIOHjNDhyixyIpGv+DNws8
         +jOE6XeLlBNb0U20fUgnwSQPXCfb7qI3dG8hG/B7M2RbTFvg05bGx4vxTsxMbpdUF6+C
         qX5CEiP9zh7+rIvxsghw9f7leSBhKJiOo5XrbJKSscCrjXpft2SpGF0IXjtYAdt9s8PN
         ozi32eJuHhkXrRgiyuzCrxC+RzJhF/uGucyLga2iSEDCm7+//FFQ5+LIwATf8gvp6H8c
         dxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512852; x=1770117652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=nDms+trlrs9asOw5tmlFOMMAxFlW96ZYEs5DzKNus70Uy2OpwjrBWtBmShjSxQkkr0
         /RuK+2kCjzOKIyKN94DJmBKtxiB3Gd74CaCPkJnoRjOoLFy5fdwhMJvs24NbqXz2EbW5
         E8lU1z/SZDb0IcdwPtYcKulVyqom1l4Ti0Z20gH6jVWpJp7EY4R/LK0lbMqJzF1oFX6O
         p97Vuuw2T5k3WIsge07mw9AlWgS5E/AzHJ9qAaPCO1mfWnXh+YgAz0mrE1wa2SH32lXr
         G/uazQCjKAs3mmiGamz6/+6txcQsa6+eQ4gD15b7SAXSbG0BWCDPdHQz9LZKBxiP1jEF
         55Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU33x+3zJGGdYgr8J/uKmAnZYRnR6XfAjYaueWAPcBCEStXXvvVLgwLJoi4HaF2ULrfk4/sm45UsgjhQtyxDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyv9Uhil6gJLt/PdL7itWrq0M9oNhqq5PS8cfpXp6xaNjjbgCD
	for26+PPSr9bwyMPJ4EsxOS8hRb/G0YefaF14+xMwKYECoU2GjEqnVCRDEHjUeUnbC5s3bgIqO9
	f82tR7HteKEPMCsgEHZdB2WNnOqf1iBXPQCWtX57BYfJHknkXY2kouLWbfVXdQp/mCKJhvkPc3h
	Q=
X-Gm-Gg: AZuq6aI0UcR8ZIbQMBrC9vy0dTwib3bLxficmaBLjlDtyUrFvsC4GLIdiBEWNuvGfJW
	0qTo0zWUdfLGD8wFRz0fWjwawTH9S4v7oGzwLAPz5NxlCg3OQN0rmlQSMVP28Q4mOGAWAaXTvK9
	Ge8gG4Wxb2hg3ZW4Q3Q7QoMzbCKXmP+wTQq8XcvcZHCD8QIpwz2BRJOatZ2HA3AwulewSl9WUpe
	iffaomvdgSCeC/IAa5AmDc8C8afWmT/u8lP0aEF5PT3X26DB1GWZo2CVbPZttM3YjNilEwPx2Ma
	/sWPJhlrO1YuQhVkqE8NgCFlkbrK57n4mSFi9nC4vsQnthXjo+Ao1gIxbgoxLgA7JzDKPNH3gYN
	Q6B/Gev6nq2gCUw1ePDazvZQgBOnCF5Dck3uIGLadujiddn5B06Cfnr/5CxI4l0qZCXDcZWfQox
	RX5fTNoDMbRuqucCSQxtxRu00=
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521478137.5.1769512851712;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521455137.5.1769512851297;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48f0259sm3368696e87.45.2026.01.27.03.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:20:50 -0800 (PST)
Date: Tue, 27 Jan 2026 13:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to
 2
Message-ID: <ftkgk4xevcfe4dyx2pqi3gk3bqm7jcv65qvn3ypgrwls5dyx3m@srsgbmsteifw>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127104406.200505-4-vignesh.raman@collabora.com>
X-Proofpoint-GUID: kyMU5Xi7iLp2CVEOcUjHSRub-ii5n8W_
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=69789f94 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_49z0RMimKR0Jg0_r6oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: kyMU5Xi7iLp2CVEOcUjHSRub-ii5n8W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfX5XQ+LVDhsOap
 d+xYLK7LJmZtref+t8dT9HOWUQKZnssUxjYjUwb5hFvRiqhK/ds7bqNeakBQBtAk7Qc3nzvQs/d
 Co3bl0254wrcieCTZV9jUQGRGLGEKnV8DuwqEoIbYBbqxR8yoksZD46uitq8TtMI49RI5tRbN6V
 +CNTjQgetwI0eFNAg8kX2Nb23O11eu2oDiwlXEuwpBB7k4k0HKrf5b2O6xW6uDINmD7RyOclHt8
 nvYy5eQRlNQuKYYWITyR8Vh7sRBiGscxjWr1dJ7oJ7yiG5cmhnVKw4KzptzWF9U27UEHgLFOKRT
 ectj/G9ihb8dcAohzJjTVsm62XCdQOCW0tZRH5JDiUl4tjnA899EZwE2zG4805H4AMEM0VxtBwO
 y6KPtt7cwhjy/vjKOchhGtjUdXXQsSSNZpjgkbekKkBm7Cc/kwRLezgAwz7ef3Q1r6K5hXeP2Xb
 rMI+Np5QY3rdefoMoXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_032055_021119_26FBB0A4 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Jan 27, 2026 at 04:13:58PM +0530, Vignesh Raman wrote:
> The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
> the full job completes in about 10 minutes. Running 4 parallel jobs uses
> 4 devices at once, which is not needed. Set parallel to 2 to reduce
> device usage.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

