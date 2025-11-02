Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB35ACCFA05
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Nov 2025 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=; b=SiN5jLkvLNoU+n+Y97H6ThtaXx
	jFGLJy2WPoeAMKunQm4y9Lpb5vlRl9kHcS2kjZmxWucHvr6ui+r8Vdiud6wgU3OA7g5N1YIbT1vgo
	JzbA9lGTu6V7CjRCBE74VAsJgONK9CJzxQprj4UGy1fAhHxus41g6XcaPodw3K5KkaGosMoKN2Uoo
	/1u1cKF+WOaaWyQrEusu+w29rEbqcO/sQzReRlVT9mA7uTStmjTwuXNlBlwzl5Y/4hdML58RAJYt1
	3CwwhLvIXhwQUyyge9kgmSsHvNVQLDnhw2TeHX4pAi/ocRiIxt9hABvBNs9qv6kPEoWpjzawXlC7w
	3SJJDvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFb77-00000008f6B-2LPN;
	Sun, 02 Nov 2025 16:39:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFb74-00000008f5W-2lBp
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Nov 2025 16:39:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A29ukNi4051227
	for <linux-mediatek@lists.infradead.org>; Sun, 2 Nov 2025 16:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
	Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
	/9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
	gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
	FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
	AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
	VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rtduw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8916e8d4aso86521251cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=L1MdfBf9mJT9yLaJy5kDloBAhnv4qmUxycUy3QcTBxlW0+C1J/eVBPyPtBwlpKk8Xb
         U2kCI1V/k9r3vIqQBPfhjFTxI8siiJLz53aQWi+hDokUr/6VdJGxNtvqp4IeQ8tdZI+Q
         sfXriq2He0i+d1Vo9ssVSnDCLsb+ZBEYJArS5Fhtg5pNjDnUt2d7WKEqE0BCLMe8tszC
         Y+X9YY1ODu9U+73/k6JcK9calDwTLC5HL4SoWlwJj4Tpllo26xCVSh8OUmrlrDS2FiRz
         UMBtnBvVSKSIVz/utjixp2S+D0YCvTagDufbNKgPvyRiHmj9TlZbciBjdgR71al1V182
         L9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762101569; x=1762706369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=DPpFYhn9xVO0FWVLzNZRff91Htk3llPqM+T+SskpPo8WBp+zWrkGtgzeUOTpuiUZDo
         fE0gqlNRQ7D5stZQ0xTQ7fHeGfO/2YhQIet/ncRccmAKYLK62UJODZ+V7K8XNfJ2VqFA
         S2Fpti5vWeYXaXIMH+XCl9k3qPcAM/exIojrqUTSo2zYRyd5MdTBHN6nsOQa2n65fU+0
         5yC/2XP3HEB27lvGdwtJldaMpCKb7XAp/FohowaslHxFydwxEP2+i9LC8FlQ2CmGdcxW
         r2Jwlz9vZZ2mQXReYQyAk/pW23EW5alemnBZl7VjI9bgqbIy6tvxQ5W/7h8FkzY87W5s
         AP6w==
X-Forwarded-Encrypted: i=1; AJvYcCWYNMvXeoYHUSDirqQVuFPe9ofSptbLdYDJluPZqFmA1K8ZslZTcu5zUJFj52VbKf3QKCJO/zfA1c7CVSUKmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTlmYmEfwluGFjLKrDj5grnVo2kbZ/Kb+fAJ8HsRLbBDTg9nnW
	gA9DWw0yYAnejfg0zLhtbKFzqjMOvPgko6zFv8nQHAtQSOCvCF5exMpVpOHGdcueMYu1kyUUzzi
	h41mW/3XYXHQ0CsKCrnDXcVXtilGzU/BmwJ6zRp1IBBgGHHnpTe8VGhqfGVLW9l4lDZR8Rgm2C3
	w=
X-Gm-Gg: ASbGncs6e/ylrSO3pS+X3jzjvw73mvzLiroaRoD9WadPZO4Xjb2zuhnxe9pe9RJ/fWi
	EFkNWuZ+b4xNbGE+dr3+uby81p34oTwR2SJH5oiQXekqpsfRltkGIhF77ZXPFEq5PPDh+aJ2y2m
	g8q2eqIbZJsWAQYdGDTJrGfhXO2jnPxWXQ6mSqEVCsZj9XL2A2UM6EI5zm450Gjjbjc6C9A3OMj
	S2UvrK+2CDJpGA4/CQ0uRHPqX91jU/+PNnJeo4vSBqqrks0yiSIPnTff61PDWYfcp83F4rzm6dk
	SoD3lB9gpuIUibGWrYj5EH4qKkDH0AeAqGhSCg+2OKrMDUGXKNlrROGD5zg42aeW4Iis4q4jbt3
	lk5pIyfZ3qlsdRFBoA9Ky0O+jmqtMlIX1MAwWwnjoq2XBgMk88djQ2jGoqQBVG/Ojc3H7L+K8cV
	Dnp27pEGzycJkU
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57411171cf.54.1762101568698;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
        tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-GUID: K1OsOHC4MaPU3WlNUhCbS0fcgHE4MV0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfXy0sAeOSuggcC
 YKKFJRJCrEgitM8XMdVB9XrLiYvaDm07/hhwqqRDrI9j7z25Ksx4Yeps4H9iaqNPqp4zMSOB9YR
 7DzoD51AP/0KpKFqsGAxCKRJSkW+7C8XFFbe9msCEHHDCP/+JbcPDpDVjNenpjTtLrJhVo+o+uO
 RRb3gzsWHuKju6wgIrrXxQSyYyCXuh9rHNaQG97GGN/J1C6JLHV+qxArwjL6ZGiwiyLpW0weGQl
 efizrp4AxvkcfufOjC4ijrI+G/zzSXgfHwkNf5YfP3UrIQEkb+F4TDx3ETwTyvv1N/YtJZaiAJ8
 jqqCU4YMZZVeJfNdjRlZ3e+qpYwnQX/DQChD9u3Ma8AbfTcVOtyaUHALkpp5w25/VrQM23i94Cd
 h8mB6ccfFJGjs6KPXZb0g5Rib7SYlg==
X-Proofpoint-ORIG-GUID: K1OsOHC4MaPU3WlNUhCbS0fcgHE4MV0g
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_083930_721884_6C5531E1 
X-CRM114-Status: GOOD (  15.80  )
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

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry

