Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35953EA3F3D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 22:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=; b=GDJOe+c76dLsfCqLc8zwxSlYCo
	bCzNPlXHoDQiBHcGkn2Gtj+J4zJVHt4imsmX4AKpLXnkmdt/RoauXWtERo3iPY9QbomSuv/GW1XcC
	K+VJ9XekjqCWunrQ0nhBEQqHfJx0Ta0bFkNMso8THEhFn5YFgwd9yuOD6ASr/Sx9iqNgFWw85KWnf
	BOIc/0fnbWw2yttuxKlzKRrEajaYgFBAUQ3TwuC4dmmn796nRxIb86rdCn2O4gTH37WII5OO7B909
	RLq2IgSpnbx8H+DfLfcHbt2J+l6wC1Boy1U+yzzWz07hdV6As3jXS4cVaOTdsjaZTG2Z/aM+RpvAp
	RktlQYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvz3-0000000HYDo-0goo;
	Tue, 10 Feb 2026 22:13:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvz0-0000000HYCC-0h3V
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 22:13:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AKCLQe2640968
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 22:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5nTCr+xuryPJ1HpVPDG/DVIr
	pdNtB8DMTFv7L6Sd+kc=; b=HdEnIsj/u9lznKcM+cVpa5eAlJjqKYDIdfXWleDx
	ILcEWqi3xNQPG1uqcdNJVKuH6RDVfPeA27IGCPyNzunTkj3rB0UhqAcxY4CHCpD4
	osOg2arsTz+URJlKTNL9WtjlzrDlp3XOhEyN1gjO1N0V/LIakS4+C7WPkkZr0l2G
	APeufA8GrK0do4Em2NyYow+uauEPvQFQ1yxVRmkfEmo3djaLnTLDVD7WxOLQhlVx
	IgOn/GWSYha1OJBPHRg3pPAkGLKxLapiu+khCOPei/UcpQkl2AGJgXtxW56eUsqG
	awmcAC9T8OxeFQHXdAtBuoYiLUXQLjYrGYx2WUDp356dXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgngdwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 22:13:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso205982885a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 14:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770761600; x=1771366400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=EeiPBfSHrDNRnByW7mkxoz9JSxlX75hmv+7JZI3Vrnl4hIX1epc3OMc8rVOqD+lEio
         LlHbypkoEVhMYQPBeLoeUUaHzGMRjCfCnW08RxkPmA/cWwIXNETjYmUINkXFoSUV91bP
         AVU+hYFioMQOPeM+lJtfiZxOtFAToNWYEbp0uwIEnTZvX4A4txSvaC9z1DCGsVW39wKB
         mqAoDjhYUN5lBDumomCljTEGCtg0EwWDq5SmMzXTgcIF7WZNUIDCutnxNqm/gYqDTsm4
         aTToHkqY1NXTNZ0EyxdtrfYci+sfE5l74/GT+YT6My24EIE3QiRZnu3W8ECqFd/3se9N
         z4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761600; x=1771366400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=vhEBuOMZMsBjNl3Ld5w2rtxIYjyVZLHf6C4nAu24KyHXTaWUmTqQUniwqtQnYqlzA0
         UAxl7zCxSNZ/nulbCqyk3tW9Nsv6HUCtVjkAPTgEGBB+txiyOl5WnzXOfLwKUiPwsggE
         ayPJHey+hThzSwl1Ixcp3UR93oZlGJKFjMszbHNnsFsAn0rOCKbGv+YWI6wruaJVY9kL
         ODnUJeg2iZoLhP3mIf8hMjuU1eavFgruk4EqL+7RXSpswPbGNqG8aWMMqxe422A4xMA0
         2QN8gZpeD5i5jAB+JWNcG7xeFdE/PfzsZykerhXlNhveIL7Z/LDFdR3X6z+SMU8JzQT1
         NlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZZlfscfvUQ8PJOeOkmzFcyAuGS0fCnhxRjFu/V26+tN+7xR9MCN90v+7ip70lD+woSHy1M5hsudXOEH6jaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKmJqLdM+mlYs8ELCmzuHtj1/gbq51+QDhLVB7qDG728Qf9ucY
	5ps560Zjed1M8urX4V+Nsa5YEacIv0ISNO2hzNZl1m2oEw+Fo56990BZuiOJfl6qb3pm+rzmY60
	POUdYjOYt1g6v/pvF+Rwa0+kKIhCmh0WYo2DQT4S0CvVS4Nq33aMpQ0Ql2deW5omLVTth1PP2lk
	Y=
X-Gm-Gg: AZuq6aJ8ussGKGWt88BfB5Jl9uGG45X8YaByBGx2fg3dwFoshk3lK68csy4qIe7C4Dw
	dAxFeymOT+4LOXarDu4UsSLOKTNiNdQmt8XdG88OIl4VVuh5NaX+ArBRF0TFRmnooUyLyE+vlbR
	ckfstvABWXCI0atuy79AQvCgMDpQeJscFK/ZTb2i2KhhJj278YhJ+J340Ke8aajruARuPyaP63h
	KkGUox4Kew6SFqO6PvF/2pYq0V9pNnVCtvIcDpc+9IGnkCcabGYuH1uY3abCIjE2qRn8oRtpFB1
	dy2hwDkM/1yQ67tIgCmIyuBvQc6R6L6rOaMWPUZfkWb8BB70KQumj2eHFJBjh2AMSSrWAAvC3HJ
	hcSIc2wIneVLbN2Ihu+V/U9yCqQ4PABH0Jd72qYmy49Tg59kTMxiWRCIIe+NcwLhuxHOlnVrMsQ
	VUc3x8fIK4PgfZYDFvzyTnLQ8v7d2RIjKHVc0=
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257941885a.70.1770761600412;
        Tue, 10 Feb 2026 14:13:20 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257938385a.70.1770761599898;
        Tue, 10 Feb 2026 14:13:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f72sm3521414e87.2.2026.02.10.14.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 14:13:17 -0800 (PST)
Date: Wed, 11 Feb 2026 00:13:14 +0200
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
Subject: Re: [PATCH v2 4/5] drm/ci: move qualcomm baremetal jobs to lava
Message-ID: <55cjkwps5sfd766uxab5viu36tez77rnrlnabocqb3o7t5hhr6@nydrmwbimnzj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-5-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE4NCBTYWx0ZWRfXzIKFvGqum+hR
 HLaTvV9Gt6USPbQcFmKYXQC59utmV0G1/v5buJ5N133AZOMws3H12XO0bN0a3prrVdSkJJjFiIR
 LplcgHnCKeX4ilRBaFOo2ZNW1T636yQf0ZeyG+TD8MJj8/DKX6+6QciTXmzBviYABBm6HJwCuYm
 OxfCunBjN23QC4G5f8T49Gc31MdxhjgN3Qj4QiTv9X/V9jZGoHHB04oKih7Cxcx+CXReBGPmmDp
 u/+NrMP1yjXwSCtQIH3o6252aPu8sAx3HWo+BE0LpanQcTSEr7PZTIof9Vnm1iWnv/T2me9WmO1
 WcJwhEjOtmYpAr8f5QegIK/dndATm3Qrz+6WMpDz96ln+WcaPR24PEbNb7//iBfXv9Auv6uGx2/
 suHLUwqRbWajM2sH9iHejeD0VJ8BVZOywSMtwLSF6SHKIvgvWsO5B/2q4QBH+vJa53Wc6cQRzds
 K9fLWwBNSgyDXLdKMxw==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698bad81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=9K-sheTcyn_FmZRYi04A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: WxOzVkb5oBaV8Zpu3QiDNyBBfWOforOc
X-Proofpoint-GUID: WxOzVkb5oBaV8Zpu3QiDNyBBfWOforOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_141322_217955_D809582A 
X-CRM114-Status: GOOD (  13.54  )
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

On Tue, Feb 10, 2026 at 12:41:33PM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 41 +++++++++++--------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 31 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

