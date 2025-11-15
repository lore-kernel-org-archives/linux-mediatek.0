Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA111CEACF9
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Nov 2025 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=; b=iqWE0zMOnctabuceRch7Ae6G/o
	u1VdAHy5+dt0zK8lqpvOsp64kwQX6mOitNai44k9cf9cfKjfRE5MSGW6zY2PSDP8L4gn3kPygFLCa
	JtqchLoM8/kZETs364L12WrMhjm+weSc4q4PgXTgL+13fQL7BmnbqVGT7hapduS+53jfyoQ6Omjj2
	X+yYRWsXdZfe5OJAI4lwietF06E/Z1QTwWmXmfmD/hXosHRfSo9hWQIzCgPV1Cuc/eIbxFnL7PZgZ
	/2XAU3GCMWgAh6+fCg4U8lS+ixDb9NS4WOOLumZzoovBRRp2RrK5X74y//ahMzHH52T9bT1C/vLk0
	4F/blpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4UX-0000000DIks-38Za;
	Sat, 15 Nov 2025 00:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4UV-0000000DIjl-1heY
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Nov 2025 00:50:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJMGfn4151891
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 00:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qs9XNl6C5ygh9qZUkoG6dSnI
	2cAtbM33aIVEqpZU3HM=; b=LxUYZC8H3vZCJgDMaslziF+/Q+DGDpgidTjmxz91
	36M9bXPQASL0FtjnxYfrUVa1RxfX/6Gx0QRblsZWir9/aZGk9+AO/Bx7/lK6htOu
	Kld39VgMAHM2tQvShW6rixT4ooi/0ZDEkCQl+CHmcUqd7XlYKDhy9nIkb/l1G30P
	8MUMR014eDXOtxX+gjWzx34mcc9JA6nEV5BeVunCkD+NB3z6IefYWUeHupCjzzTd
	AzfeiCztR72AYwahKrSIIHEMhcWT5EQsRTFBaSGjKloFPxSK9SPAbPxvOhpNAzVX
	fLJMN8YRUPS0S07zPbKtVfvjn6QEYSfcvTnlirAT3vmhkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeagyrpar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 15 Nov 2025 00:50:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823acf4db3so73274896d6.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Nov 2025 16:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167810; x=1763772610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=EBDrYjBSuS2mXLaq/wIXjr6kDLPONQONu+w3oydwcBsI0gRKDb/L1alXYPhBnq98Uc
         3NVR7++BNrXppR10flgUEQDc14WRppnr6Wv04SafQbTGVLwSk6e+KWh5UIdlQD7AP4Cf
         aHaIh42+QinsmCL2zTzS7XuzUuwByMSeL4Eq1AjaEzwfziKLiMmQVmpF8GXnf5Vpv/K7
         CoJEDr9CHQ29iacARH6nGb15z86YYR/E/0L8qJqKpALdUtircHOesfL1aEZO6CwI3JQn
         zMeneqYC4a7+f39RDoH6eqlhgK5EsPjy+5kowY3mZcw9Lg++qt3bCgDyWVbppQTCbRvk
         fYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167810; x=1763772610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=Tu6ECzDlAM7woXn39/I6qvzG8/Dx/hTy23j4uYoVCgNku9ly31/57IwqKs8TFh4ZqY
         VSg/kx6Qd058EBXewZijcIalKj+uo7zA9tNPCia+uo+lApaF4KueLfatKuSocGplu1lX
         DNzZrVniWcayZNrdstZZIIpksaSZ0eXrXn4ezC8TwlC1xbyLZjUQxru/4TcUkvebwLJN
         lRN7d6TPjsRqn/pkdcGzJG98iCkoLAXxYHLWHlN7q8kcfnGmIr5NmpCezrcYnEZu+2v0
         RAoBc6CJEHv78SBzgbOaT/xDNY9PLsFJZYl0ZA+azm5PJSh9auO17IX/ukB4CZ5XXZxC
         ep6A==
X-Forwarded-Encrypted: i=1; AJvYcCXOOA4r50LRz1Dp29ZGYfn+fyYvtFDshFjXIn7Bny7iGUwrnmL912VV43bLXR6CJbaB8gODZwscMNvJxbdP1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws/MbuD2ibKI1lWyq56ObAzZmRAK7IYqEBVQLJydFUGsGj4riC
	903/SMCuTbsAnzawBaHRm4gKqU4YtiUbtVhEx7hRRgKx+Xh5rc5UNbvQkv9CGGDZ/4uGTfY6678
	OBuYhOFFFMb55JZYK4bxeWHkf68S0rRjCpySeOZKkWXj197SmJzdDwQEDq7sgv+KaRWso6EOq8J
	U=
X-Gm-Gg: ASbGncuMwX3XKdYo2yJ7pIkG0YEQ2KlwuGiB1v0Rh2wL5EqkTVwsLa48QDf7yPzjL4v
	P1gzxXwxb95QoLtGHBXE+6ArlDDOKLqjzPoNhklLOPsnSKKwOLLY9CEBXLKoPHrjxpCpeKa606V
	JpFe3K2eFAlPMk/YV1pA1+U0ZBBuavLCeSifBdMRCF/MzXQKIxjlp30v6KkPTwzzcX5bjVQ+ZX7
	onqJI/q76fSHD8f4Z5N+NR3/lqmfA6szWd3+RbPDzG4sTWIiIYWJc7TYiU32vYMsfZL0MIscEWA
	/RqOLPtxG33Jre2/oquY6Yx2ZE8Xso3Lp7WeenRwiCHAHSUQXWemYBKjAcv85L9PgmpP6zmRYuG
	4BLQ6Cdk9qLqke9FHvPHME6onVt2AxwOucl6FJTtp27rZoQxH1+FuASymbKptKlZZb5JRCvyNEz
	Gv2RkMutAxkahd
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113346d6.49.1763167809704;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjIFGATfZLfaUZaE3KWR5c8p1sYfBsOVpYyQEawnaMA0DTE16Ifr+U3lmX3Y+76mKypsKpog==
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113096d6.49.1763167809268;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce0822csm12716841fa.10.2025.11.14.16.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:50:07 -0800 (PST)
Date: Sat, 15 Nov 2025 02:50:04 +0200
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
Subject: Re: [PATCH v1 2/2] drm/ci: Move qualcomm baremetal jobs to lava
Message-ID: <ursdbkco5n734zhfqceztib4b6vxb2juq5jfllzcjeuctd6lvn@dbdbkbr4csws>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-3-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: XgkurUXGSBc4LQ9TuWq5AZEoDudXCj2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX82waPvuUoqdP
 IAWM7bKc2uAvBK+cAEEFxJh3nowldugtBSHzs3z9BKm1zUPTL9clMRMA6mnkWohguxsCseJ9Z5m
 TPz4bWFYM9mTkx1+ZxsubUwMetIZeiXgd03oOSjXuVt1nlaxCSBSIq0f191xT5xGQpHZqUSYFwu
 GHkAVXH+j3VeUG6JX6KAJTXxb7ajtGdf8q2nIZx/nzTVFzomWp+ainQbBtEKGZUirAyae6Ud+aq
 lUXgEowiamMBfopV+K0txIR3eNjz96KlgkJEyfEVGW1m15wAiyO7DklsudYSSTrOrvDv6KZW5VZ
 7cfzuxwWhHiRdp0NUdsnHm8cVarDP390La/n1rJkOvbEd1aIO60y+8cv68hCLXpZPGtZOSa8Kkw
 BW+RcP/asjDHduG1Q17kQ0xWKoPdyw==
X-Proofpoint-GUID: XgkurUXGSBc4LQ9TuWq5AZEoDudXCj2E
X-Authority-Analysis: v=2.4 cv=Go1PO01C c=1 sm=1 tr=0 ts=6917ce42 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Oc5gQ_T1tCqBBtY5fQkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_165011_447997_704004AC 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Nov 14, 2025 at 08:30:51AM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 27 insertions(+), 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll try picking up these patches through the drm/msm tree, if noone
objects.

-- 
With best wishes
Dmitry

