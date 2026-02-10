Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F09EB2711
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=; b=2MxkR+zBp7zvIS8dpx9jhOKgf6
	o72gG2Th1Ze33QjH5/G4vfh0ll+Ad2jmZ03AKTQ9nLSvaGxWfMDxLj3pJUMPcgsmjFLcbZXPtXu4V
	cXZAM8IH+lDhW38SdUM9irnwBNbgXNrC9yWdaN18uqbbTWDfcnAGnFLcaKk6PhttOUZrf0zhMS7rt
	oFSlyyclrn7k0/mHhrmJhu3mD6kzLIvlYZmWu5l6jXxWEJkGaM2Ei/AzBhOLVKkyh7iKiBRHpTV75
	9gnkdyDe0arJzTfVCx2EtuP3kD8lRDZGrGDg+uzvQ2iDXW/L6/hfwujoHAxxoaUpE6kx2hSvpPlyj
	3lpnQ+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuxR-0000000HVN5-0a7h;
	Tue, 10 Feb 2026 21:07:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuxO-0000000HVLr-0B7B
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 21:07:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AKC9Ob2640778
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 21:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WYekD6MnY0SEVsICbNMS91My
	xF2Htl8S3olx63sNyJE=; b=BOj42PKjqHWpHuUFFKX7fABB68llL9h3EjDxQ+m7
	RERiH64TbniHjMINOGhJxsL/cpuR5YC41SHlQk9ilvrSLQ5TzUeIPi+i09rdl2j2
	aAh48Z/KrFLSA4Q3VhLof+0nEPrq4Tsw2aVi8cvG+H57j7nheg60qt29lIzC/59H
	KDB9Ljm9wjXiNBP+W+TJPGxeKGosACMgNDLFAoBHrO80pUA9Msw1HWXhVgR11zsL
	spxo0TF6+3N4sa5NTOoD+34Pvymqqu+KcKOgL1bI7x/xGJ7Tzj2W8gvtiqfvYMPG
	lcNfvwfEZsxPldedJmGFaaJaxM1kQPqAUYd4+vQYw/u59A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgng6wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 21:07:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8947d47793fso289310346d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770757655; x=1771362455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=Kl+kQ3Q68sKtZ87XqAotBBWO6omN35q4CQ+VJCPAsfY6CONkU8pVL1NjreXj/KXZqn
         /8MH1nLaqlbEr4/uuOHaqqmJ1a+N1/wtsO8YMCkshYe9Z2tKnbDjsw2lvIBmSo8hKQZN
         FnO+94eZwHDqBlKDoksCwnpNg6l6tUWzsxLHxh7Vz9FDY9ngMEkn3ktJCezS/QDn4g+1
         JJXgHCLucIYK6YrfEp7m5ofXVIOCNI6jTyVfHBhNs1hVhCPlnlWWE6RvblLc7b0DJAaq
         kJ49fmuo+9iOkgvooZSf8jRjBaeyvdBbq4lWp1pGWZdNGzGZC12zpBiQSUosHIsjGTA7
         JRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770757655; x=1771362455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=T8rmUH8lry2hMIO3eZeJayLqcKIczgshLuOCnwhjSmn25j4zDh6pYEPfUgakSJxiAB
         b9IU93iDiECu4EfOQVYKSpnLUl6OsmFm9R5s39KuTktDzenQBJXUlaww8S+4rfm/azMG
         z4zKnO8WXEwxEKvSdOvT+aKL37gYeAip6WcQRHFmSlxwkV4vd8e+h8qGt5HDuRH5MQnq
         20hgUj9IF2uhPLZzZD095nhwHULdHmcEIv7nfqlITB7rno+QhohsUfd2Qk545WAXMqhB
         vCtoSnwnEzugjxAQ/kQe62ivJ3r9TJVnRzKS85X/U2tboXU5Rr+S8tvaFyUYL0Touxa+
         4oQA==
X-Forwarded-Encrypted: i=1; AJvYcCUhQQDg/NGdKNGL3JFIJyPnpdmZhVe9mLjed2jxx7Baxn3j3s/4js4an1fTzrQG1jHTRgLuhCR7ftOZSk6dCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8gUwHHmHUbAAr8i+Oi6kg8ZVF5gcOqxiq0HzqiE3TLpoFNVPj
	N7CJZGUBDxmJl9QrM0MHNd0O1iHNZEKyZOG8k9z87mzOPyB3XknQ15WOW08p17s5WHCAK0tJ+Ly
	zV3C/lXrj3fZIFJB3CAkvmpskk69eHVJER86qY3KmqoVoookl4jpjHwoerkgwvmR5jaVOIuIwCM
	k=
X-Gm-Gg: AZuq6aJrxp3Mf4u2mwln9KhkTlVRrszk7jQegsBn4OKgrM2CzIr4XUpy98lmtaFhq0K
	hLe98LyZtg/gr2ou0y8nWG9fTDvTK2hiZAO1+nQHIdytD1Id4FT59iK8wtw3vClrTosS7jhXBVG
	308PCGp0Moe3MiAtSLfK3jb2lrNi6qyv6lUiIkBTp0tNjFdJFnvZqlS8R/bIOK7aJRmQ1D/s3YN
	5wTyGIR2ctgR7INWt/2DMVk5d0SxMGIUA9h5kb36ABkRGs66HRH2mxQ4piq6oxfaHSSDRS1bWWk
	Diw9ml8dSn9h7ve2GU9v4XasFVAHOdT2DZnSjIhaBrsdK0DUS+uUPEr4h0zVa6j28kaJRylIKd0
	fTh4B+PLRhuq4wILRWdpBQ7rifSp9azIwSltBj48fiqTTIsR1D7Qa8bOnhnodYFN25oCI5Iiu/I
	z3EzTxAQugtKwLZHmtuhyAhaqTYhGsDh40WWA=
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75880385a.86.1770757655205;
        Tue, 10 Feb 2026 13:07:35 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75876785a.86.1770757654672;
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm3514472e87.4.2026.02.10.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Date: Tue, 10 Feb 2026 23:07:32 +0200
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
Subject: Re: [PATCH v2 3/5] drm/ci: uprev mesa
Message-ID: <sl7sjcaylfmemxnqfs72wcb4mv4smcn2knhcj4he7skmgawqey@mzgj7wwzjvgb>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-4-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NSBTYWx0ZWRfXxDzCP0jS4zLA
 VxoY4S9SOyQ/vkmzAlHvGAiOMjqLmEJCg9cAhnFhe/jbgaFJjbe6Yj85hx4uQx7XWVJQoiM6jfL
 Njwy3P4dfHScz4FYhhxXJFSrghMLxUhszb6KalQGUI4xTL775QW8CEzCusLcAZ9Wh3g3/EaVOYR
 mj6FxTVvsrS2EkA6GkDGH6L2LD5AuTbiRGafXUUaTSsTDsXyhrMaWeo2QR5QRd04VBDcy3OEUwC
 64qEG5zQKld9oPgcfj3I+5OHmtxsCTN0kgWvYGKQQykG41eoeUbUK+Yj3DxRdSyjhuRv89hX1HX
 8LPn6YVDDKMkJI/Zzy8BviVJIGgyrHqHMOAI8xySXm7XxI38ALqeE3cnb8eQpFBuHYCHzoHbq8E
 PKfzxMs9ylZvDeiRuPb8c0V95b6sCutY8BQU1jo4eLgNnqPZ6F4uZToeTv3NCEoD2BCqDsDKdHI
 eUWrA8z2d1FOQf69Hvw==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698b9e18 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=eEoeB42FsikaTLMEZsIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: owjGtHPmSSjLZAXQVBi9uG4dFCgmF76S
X-Proofpoint-GUID: owjGtHPmSSjLZAXQVBi9uG4dFCgmF76S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_130738_115595_8EC546C9 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, Feb 10, 2026 at 12:41:32PM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, such as:
>  - LAVA overlay-based firmware handling
>  - Container/job rule separation
>  - Removal of the python-artifacts job
>  - Use lava-job-submitter container to submit jobs
>  - Use of the Alpine container for LAVA jobs
>  - Various other CI improvements
>  - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>    as these have been migrated to the Collabora LAVA farm
>  - Fix issues with rebase with external fixes branch
>  - Update expectation files
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - Merge patch to fix issues with rebase with external fixes branch
>   - Remove bare-metal jobs and disable apq8016 and apq8096 jobs
>   - Update expectation files
> 

Thanks
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

