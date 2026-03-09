Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205DEFCD99
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=; b=CmPZeum7PxxJS82zX8m3vpNdBP
	wTiepIPyXb2zfi+sAQQZB8oM5o3/zChNH8iLTj7madt2RpBsIrZoIitAkHvErcteY9Aq8rtLK9h0S
	VhnIuBskbsBBdFfzHjLrqakp5TKdw4emQ2YtSpjHx26qMlb84vbLJ1VoKHUglII1TigkSew51I4+O
	iI7tG9cPoqoyAUzvnGX8anXEM305H5LGwRHPJ7IZQ62EH0iJECeiG7MBkWJZ5+wMsi73Qb5fXY170
	ClXEqFrvbhi0XmO1hhiiVgyUvI+9TmHza6xjY0dbK/8ICv2Rx6ZVF6lUNls0Nv9Rv6SoSVtaaTEtk
	seC1QJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYeA-00000007Abk-3TFn;
	Mon, 09 Mar 2026 11:19:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYe7-00000007AaA-1qG8
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 11:19:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A0M7w1588538
	for <linux-mediatek@lists.infradead.org>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy99cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 11:19:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4a6bb316so81940265ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=hnt0Dxnt6G65uOAHn4OjZCrUDT4uY8N6aFWyXkVHoBYTvvQAsrqibYFS8U1ab0UPqC
         xAU7MrQxCCSFoB/vOcIOqRMddUJR0bKJVxYMQuHkxGhmPUeZn03k1wXl1qJciwwAWIs6
         tQzlZUyoUG1bARG8vzhXKuKtnBKHJe2JpYu2j0FpMFmsCLJiFt+e1SFJ/ndvz0jZ2IAj
         ds4nMUIlYv1QTDqvKvoZ7xwRVsoQvEg7C77FnXYjX7Pw8DebNt3BXPwk+3UFLAH9fgbz
         KDlz39uBVa07+dpALhHgaaoq6uJ9DHfEQUeJzCYShSR3dzKKuwLkc4m/r6v4+7h1juws
         utRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=qAnRTu+UyBUo5cZST8LJs0bDKPMO4eNv1jQ6MgAYR5ycfBQ3eEgNVDefqm7OfCYkAU
         qwsPzIhY3cdJ9z1iRxlguGrUQVxTp7pa557zHDzI4xreJY3pr6ZovTKdR7AWV8nMuS+v
         ITaFi3DeUEuWvODl6vhlmSYpUE7Nl0gKwIu8GEtZMJa/7WjZZ3wUzFGwwm5HS8u1p5s0
         QBj8Hip5iTnY8eSU343riZbcDHfM7H6Yvvn6XUlBb9MEWIYWPB60Es/IrDSn9aPHeFb0
         XkM3uoZdcWHa+vSPvxKablw4YQFgVAHlc6ZpzEOEzlrK6s+ZkilPrGSWoAWM1AIOGMW7
         gCXw==
X-Forwarded-Encrypted: i=1; AJvYcCU1pSCiNusIXYqpujKdt328thg+NltPeAblbJ3InTPKDL3v13GlouVkO6+YCdLm4BE3FhVX6ZAbGZ1/xfunWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCgmEJVDXeRyUvb3jpBwiy1WudSufULvr+Nmp04H6rPHb+F17+
	trun/z6WQF6+khd10l9ewnt9/EphjrJ6VvI2fun3iSZmCIgJHjx8YV1FXHMqBWoxLJc+mtZon/Q
	RFUa1jbvk3AjLnuYFjIaPcGSa+mNhqjvB5m6e1H5KTOMNi1xt0jT+qCVwPHNPWVjwDZGj4c5lub
	JAM43EaBU=
X-Gm-Gg: ATEYQzwwg33285FxaicBBWR0MQWdMnxykMjpOfxWBCtrrJe4P5zifkrccxAHrADGeeU
	CIHNhVf0YrNidiaNBmbUUoWtdtE8+BfyX6RJ0IP6bzyc6tbeX9078TGVO1yclhXu09+NoryW7iz
	HkTJm5NEfpjq//1Vc94Ehskp8UKkPaONpc/TAI66/OSweP5lrd0vcqL/IHL4omS3tys8dtQ1MtB
	x92nvV3rG3YzkBRJclaRlnZtcNtn8xwS6PjB/9AdG4xDKvQPOvZiUhEb70INIaeb7cDcDBwyUdF
	PuCBn31iZpVavqQVKpIE9faO7CtAoZGzPUemeLj4uuQsxn0OoG2XwBjXwLZJdyDY6kVVr3Re0xx
	jvMI8igw/qMnxHS2RPrqTJ0lwp60s+Lr1FOg=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474275ad.41.1773055174149;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfX3Cp6a77Xxkym
 V48d87rDmRIacTdxbL9lo68r3PL6weK31sam7MAsbVj1WsQg3BrbtuRKndpaYRk0iKG91T9bBuM
 D7/wX0WxtFHTDp9RLdLAUaddXYezwDdtIQvTgIz/R9eXzjoevkAkhnvs4hHgkEXWQ8+aG2+iMlM
 TY9Xx/zCcwE10UVdKRzS6TkRbXC4eV713OCOdKSuTi3XmN6wStrj8BPfjO9xOPcd0PZgXKigc0j
 hz+/zwSQK83zj+QTRANcqNNPzxfHVBzwt+6IHoaKmRbwH2FJMMpAo2mIPUgis67YPUCEpuS3din
 hHYmJrGVMo6f5x3AnbK/xVpR9r9yDfrwK/iF0vUOkXw3/aNVuBUqUOzJfBUCyuHxLQvgfTrMvCk
 CWlJl28kmr9Po/sszvlNRMQX1RJItl1O1KG/roW6R9oh4WTyIRUd5+Msi4wZF5+wuWpCmc8E8Rb
 C5ck4mOzngXfDHUrWjg==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aeacc6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WP3R6BR8iYqgIQjUvoVnHKB9zCBsNtU1
X-Proofpoint-GUID: WP3R6BR8iYqgIQjUvoVnHKB9zCBsNtU1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041935_478527_CFE12D6E 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan

