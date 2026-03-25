Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026EFEA814
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=; b=tb0HfwqF1q9Xp2rkaw4MG3JrEx
	/GVhpLpOzoblKmce71zG0bkU2z22rfsht6aSkexNpRpM9KZYe3fAdNIQl6kR3UPHmQKRfNMQFWX/c
	fkp+iOuCuKBQdYgQYxM/dHcqMeEwvvbgesD4AaaIXd6V20B6wk0ekm8asfoV8lgAd1rqcFv/BNjC2
	n6bwNtSiBlqqcVY/nIz6u7P1+PeAkzZJ37vv6Ph4BXCEW77VnTTS06n3hjHoPU2hQ9sx1O+e5f9pS
	r5uHOQQDCd7/Imp1TPmaDOkmYq6HyKGBlC3tyU83FrSjfAsEPxNRbJ3svaMbkiPMOt6bIz49NE5/w
	WOURytKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IK8-00000002opT-16R7;
	Wed, 25 Mar 2026 07:06:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IK4-00000002ooG-1g70
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 07:06:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JGIP3057481
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 07:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQsKwSTJPFyNadQFvKFExVIv
	rmCLGMcz0vINVo0Po1s=; b=L0m3F5brvM58NyDoxlUV5OVWo1Jmej53m0CksRk2
	d7xYJYzAzCTsf6dALVssxvAmBjHQ58BM0efr51a4SfNSYzgt934DCxQN6bfSehkS
	zINpH9s22Q12DVReWnso1p0P4pm9QZ1mgPuHg+cTIRsQ2TqHEYMVU2expcqGhNR6
	YkQlfy6Wqy3rd7+uTLNpsW9CNqAKnq069HlEYoZSD8TTVvFpnwQfiToUSxk59VaM
	oHufhv/vnZjJJcoqFhcPqzdMHeAv7cS12NIa+4MUdEL9j2yCCpm97X4wQ7QdRHqn
	gwFqff4iulnucegoIQrymBFi4cTG8n4irD1sPINtVw/6KQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0u2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 07:06:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso25594011cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774422395; x=1775027195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=YwPjyK5lDmXNpRweGJErjzFFpx8WBl9Q99HgIa2Um/q9ZF+mGUwc301PnTIpo/Lfq9
         RZrUykb589V09Q3TA+KdXCeIggG/TN2oi27tBRxWGdqTF+GytnxKpX2t0x3EZ4Ne/q2L
         KaGbXNzLuUF+LUDPeR81ZxyuSBCuwpfDPDomAANVZb2iLttt7spUqBCMNoeth0DlLNYi
         6fJvE/vRT0o0dvY7owA8BzNEYhKq0eZEGNcBUainG6TvYJyPBBKiFdXKSQt33epAax2m
         6Tm+lFSzfaWTSAABKfwiXQq/VFzanttrLwohk7WvDA11V27lBs1QK6fsO6YW7NGkw9g3
         v7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422395; x=1775027195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=WExxQfpC1mbwLZFAL2usXE2wjzsF3h5yskb3UbxvrCtPPNSkuKODtFg7kC/45C7OTZ
         m8/YYO/ui/J3KuEUuasZlQZV52M3VP3GAH2ZGMqGAhZZr20aLMmFYXYxU0hPl35pN1mz
         +dumDepVzcyJS/4bCtrYuvLbcbvtr+9tJ8wZnfViHduPVvM9x3uVPjtnFQ7BhhUEuuls
         HGBnQ2O6+CH6nU0ShWFCBIbQt8w39LB05KrAiCwXKzT7A9+NClszHPAbrA/kx+rhWCAX
         9dD71fEMxI8oWFkE27myb7JXLhRIMkJA6SqAhoT1vmpDVEVEn6/YVsNqNFtkmhxHTLZs
         W4YA==
X-Forwarded-Encrypted: i=1; AJvYcCWSTBi/i+JLIl08ExS3bcIuZsupvXWrnrJYZp3lJIWmpl3CG9uxzLnFLLtCUvmWFj8xyl233guxcEoqfqOHyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjJzkUbo1xkrUi9BopgvxjUC3kkcvGcn/+IEpjPA0hejE3Pq4U
	ku4CWRkd0RmLUtqX6mSC+radlfmWITl6wYqwPzpS2BoCin4npoQQE4PLqCD9cO8l1IKehiUWz9b
	DXG8NU0R+L9n9lYjEN2KRPFeEj1eynxNXg3LClA43uj66WF0V2xFO1T+1hY0mqCWtfoLRGJZw4F
	8=
X-Gm-Gg: ATEYQzyttQzFZXhJOw4XFIsYpQ011qRB0VOHrH+3hXfKwBUr+lWxIKVHNomBDKY/ZnV
	vdaj5WzRqU/1cxQDHPfGWeVS9OzSfTUyKF0mbqWrFWNYRJryLFaXReJwAClPq0qURD2GGboTklf
	iQHg8YsuFI6E0oV0J/zxuMaBpMneLlIDyR8dMho7Z+h5849Z0ePSu0gMjIARGQPxd56x4M8g48T
	NHhEvXov6yku+5gQJXgErS/3OoUR34oYSVaZAPeFgh0/lo2RrgZycBGNx25bViAuhB1oGoJ/q7E
	J3gZYBANQljGTJDJeovNjO0UYhikkuNS/NCA6njuCNF9dSbJIZ6DidlbZAdJcf7yOP5d5RB0JxK
	unXQ6djxfOJcKUbiUC9px5IMR5sIWWd8vpDv35OHpHvOviHQD8imDtHF1orVIVe/6SwKebswxDf
	cKBJt13AbZNp7lA1yeAahygi9vBkAK/idBkZU=
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059631cf.67.1774422394502;
        Wed, 25 Mar 2026 00:06:34 -0700 (PDT)
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059231cf.67.1774422393873;
        Wed, 25 Mar 2026 00:06:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2852071edsm3641505e87.49.2026.03.25.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:06:32 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:06:30 +0200
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
Subject: Re: [PATCH v2 0/5] drm/ci: add new jobs, uprev IGT and mesa
Message-ID: <pqa5xua2shwqpkmwbu2jitz2ogpbmgcd4wizb4nt6qtxstubse@4ltbfdvfpqxj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: PaeMzJrJL8qHoxW7qyyjgVEVh0wjyTWL
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3897b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=LmRgrdqyE-cJMQzL5zkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: PaeMzJrJL8qHoxW7qyyjgVEVh0wjyTWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfX0G5WSR2UEiJt
 I+kZb2LJ/DfWNA0PRKoXVVU7IGS9WVtdpWaebcjtwK64okXrCoUHubH2mg1b/czjZluhIzG0B53
 eVRymQE/BghlRPxfxXqfYSlknu9x0PqLUyotwbnbBazGelNe0Vpj/Je8tMy5IM11d9SKIU4vlJD
 ocHXuvOdSkXg2CnySGxzo830qfTWHsEq06i4kWrbhuQzqQ/4dy6XRTCW4nv5tO4jfJUQa8FUdu7
 n4pzIqJPrxNfWMn71Ocat1Ngmvfi3C0XruN2Cqqujv47Nmx8w8J90EC6AAhK4dzGIIW6OzToN1o
 Osyn+4FfKpk/D7CpdcGS7RTUwWiZkd1ndllb0IHsfH8PdSOMZAjMsZ/SYxUvhzDcXY0FanKqQyn
 0pNr8wyhPcgEtXFn/9gldNqv0vmC+GtyCGKOBtYfpCszSFHKpHvJU9XvV82WvVDX2bzSUlanY6S
 A54jF/UvKYOAidp8gwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_000636_469361_C3D2901B 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Feb 10, 2026 at 12:41:29PM +0530, Vignesh Raman wrote:
> This series introduces new job to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> 
> Other updates include:
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use lava-job-submitter container to submit jobs
>    - Use of the Alpine container for LAVA jobs
>    - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>      as these have been migrated to the Collabora LAVA farm
>    - Fix issues with rebase with external fixes branch
>    - Update expectation files  
>    - Various other CI improvements
> - Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
>   are migrated to Collabora LAVA farm.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.
> 
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1601024
> MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/213
> 
> mediatek:mt8183 fails and it is reported upstream - https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/#r
> Few intel jobs fails, this will be investigated and a seperate patch to update xfails will be sent.
> 
> Link to v1: https://lore.kernel.org/dri-devel/20260127104406.200505-1-vignesh.raman@collabora.com/T/#t

Picked it into msm-next, thank you!

-- 
With best wishes
Dmitry

