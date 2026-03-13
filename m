Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140A106FD87
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXrdpy/WIHE2X9P4Q9q/hAK5sgWHGc6Eec29rzkb/Q4=; b=AqpmGMNHyalkA3ZlAe9ijXWVFu
	CTMscebfStbkNSn+ju6TF6PuvQLb1a0S1e0EXUdiTWc00cx3TNgXP9PxS/lmXg0BFwCB8FCF1g5jm
	wVIKMWISBnH3l6U6+L+33upJ1ltAkYmhnZ9U6oQ7itAicH1TRqjN0w81f95uehEJPI3Bd7TyHxSzc
	VCoN9EEG7Py56Re5J8G+gkxazrvRnwGcOMTyuWVubDnvpPXTuildcPraODnuXe9ktgfLydsMndf7c
	RnPqq4wV3nc+TGYQPAGw/1OhgFPtSYYbUkBRpYeJDjcSBjQTO52XFuBB6UEV+OQx+8s6P/1vqBe2l
	9uxAwWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vxr-0000000GqWu-2tTR;
	Fri, 13 Mar 2026 06:25:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vxp-0000000GqWF-02QS
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 06:25:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcF74140725
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXrdpy/WIHE2X9P4Q9q/hAK5
	sgWHGc6Eec29rzkb/Q4=; b=JGuTiW7oyEus9gB2vM/Q29qihLHd+FAGe8PrXJA8
	fkZWJuX4MLEJkbxqiJOD8cdan2VsPx+t9/defMvDRePBWW9Qix2D+qwxcfBPII0H
	wAKXqe+pLD4Ma2W5SP7pdRqmh3hsBSXYVCTYAtO4E1HURQjjMvs7hFS5JPTNu7ot
	FD8VWnk20H6rpG0Eodu0vehkiA50jQPEfe5duCWuYBFIYm45Rmut7ofJqd/pTfYW
	WfY6p4+CjRx8aCKjC6ZlvxcH3DIpd6fZmLvV1zMqQICcNyIAZFqYcnxXEz0R/mHE
	2iDJJb46xwWtWnTsoRfV8S4vaziNJrkqyjZF+mkAHP6rnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn289u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2026 06:25:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fec8d44so1229171185a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 23:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773383135; x=1773987935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXrdpy/WIHE2X9P4Q9q/hAK5sgWHGc6Eec29rzkb/Q4=;
        b=frcKN+tbFWOnbYe94/PeP+wPt+4QgphXc9v0PZd/Ikc+02nhw+qA2WQz0xGZEEpKcm
         j+BdqjskPP7D+7Qm+7mRaADwy3b0YvUZKjReGAS6KjT2HyDD9BNY0kJh/MPIX9HhchND
         AQ47v7WQL1qQIuQEi+g3we7f8zVkFp8nNXTCstelDWn/WaVtGZAPvrj9FqcpSeZfQCkt
         nm3IKxTn7yIkMoMvhFJzprSZPvYI9ILO2F2fspIjZyC5Wp5D35XA2N8d8SWhId29lB7e
         MugBoNn6fdJFdxMjThlA33IKV8cty4fzq5HkqpTk6HzeBtTvwJXZuTiNNZ0lmgN/Eycv
         6iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383135; x=1773987935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXrdpy/WIHE2X9P4Q9q/hAK5sgWHGc6Eec29rzkb/Q4=;
        b=cXBqPuH4KrBeH1RcbYr837K4f3icjxf4WAeUwqEWL5kmBD6v2866WfYMy2Cxv8fHZ0
         DS4kDBZtkMDtfXaQ4rfMobNpW1UQBF/75+RVRoDy+kJhn0WMr9WpDFdEJXRbuIYV0Dag
         kGzkvLcl7rmuO6pFgD9G/giVbGxe4fAdZhHmjnct9GsxrJigGsIa6TV8EEjFYxk2d2fs
         X/v7e702fl584gFpPyyA/WcmiQRUCfBg+i/w8WnmaTul1M+C9za9KwYsUs/z03looJO0
         ErLFlwIyjGkwFI69PO6MtLPFg9nCKOdZ6WyA7Z9EpwUiaaSFTrBypGF0DZ+M7xUoA84q
         u0QA==
X-Forwarded-Encrypted: i=1; AJvYcCVcuWsaGOrd5M21RiGa6TtzPEgJZsmEl/82Yu4B9p6bacnnGoCWDEzS0hBsXH8DbCioS4UPwqRtpSU+2Mw3nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRk/KW1U129m1/Vsn5fUbxabfR4W1nfHPRcZ5S0SspH4aRqpkW
	Pbk05DV5goz3NxI3uOjCL2VSy4dZwGPOhaWuNl8xrWB7nRCeymNz4ermocIlecrROJEV1dktAe7
	vThtJ4JpSoHdmxXCWOM9sqmt2JpD32WGcnAa6M6I8y0dLFWajUJwKsIRTPR6fPK2lKWIWJIFgzN
	g=
X-Gm-Gg: ATEYQzy0O7xedBLVuONbqQ8jefziriuF7fJEvIhP3Kc4f/br9gfpsNLwgGHJlwtSSNu
	6tEk1+xFrHmUSQ4ZS4+O5U3dugZn+14p7X2p1jzTakutTFvZxN07UGVU/GyQfj1lNTM7ZwvQb5A
	hny0cwhmm+aOpJZsGVWfu5ppB7jemNIycCUsIl1A3KtS03aEkVR/+rFGuueUpHzSOMM6EeeLTVI
	tmaXicroy7E9nUo/v7CxFVsqkmuNsOSdphSbernWZD9NWP8rJdYMnAHv+cDNJeK2fZarQAx6etm
	kVwOqzwBbBwxBBLiSVYvuGsaB3LW1WcRGufANTe5fJLMmp4S43xxP3ldEbPDtJ69GbkCYAX7GRV
	wnN/Mcphs4Fb9R4k2kDrKcx3+ahFicXUt3XN80CIRZ/aInVXPDZ+RkIqOqQyPCZI0miigy2E29j
	tNrfywGjj15gT1zbYGaAXkTIRY5zdNLtTqZFU=
X-Received: by 2002:a05:620a:4111:b0:8cd:75d5:543e with SMTP id af79cd13be357-8cdb5b6fea4mr312600285a.61.1773383135355;
        Thu, 12 Mar 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:8cd:75d5:543e with SMTP id af79cd13be357-8cdb5b6fea4mr312597985a.61.1773383134902;
        Thu, 12 Mar 2026 23:25:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7dea4sm11787371fa.46.2026.03.12.23.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:25:33 -0700 (PDT)
Date: Fri, 13 Mar 2026 08:25:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Chris Lu <chris.lu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7921 WiFi device
Message-ID: <3v4kz62swpdorijfdfza2vro75mafluyy3nux5ldjopqofqecg@t3w7vu4glmug>
References: <20260313005616.2853492-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313005616.2853492-1-jb.tsai@mediatek.com>
X-Proofpoint-ORIG-GUID: -VhqP8ehWkPkVAv5myjTsl7Bzl3DlerR
X-Proofpoint-GUID: -VhqP8ehWkPkVAv5myjTsl7Bzl3DlerR
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3ade0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=mpaa-ttXAAAA:8 a=emzX2egCO8hrsF3yLq8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OSBTYWx0ZWRfXwhxVn0a/LZ12
 igZvPRBfUXYXOynXybFL5HdAZBtoboSR0Gyp0XaAFhceZ7lqRGJHXCcbAgu1HYwlORFv/uTnKDH
 jbLrA+hfQT+usN9JSANyiNyLewML+dS2hLZbPe9hh/tm9KWt5RWvre6sC5E6+HOHNtk3AzZfAjz
 ric9pW30PY5GiqWWAi0qxGGr+6r60Rs5ZngFPZRbiSPd69iEnD7Ik//iErZsELUV80L5qXq/LIt
 FR55907SMdJAWfMkZ2oDvjhQ2ifH/258KLq9ffEwnQRC3POfVcJx/AB1jYCrP/nixOJdDzDx5TL
 UcWP1mHE52isdWLezc4T4uGF0r1W9BGvHR1GlVHrWIYeCh9ivzgy9ZoluTHAunqzGnZQbRjrXoa
 Sok0OBkLSlA0nA30UXzWNvsJZB+XWZ4fYlOVdiNA1Ugdxqqv1bu0IY7pGW7E+7tr1UqdAHqfrwN
 rjSC31emGZnRZma+nTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_232537_055889_1F44F8EA 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, Mar 13, 2026 at 08:56:16AM +0800, JB Tsai wrote:
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_1_hdr.bin
> Version: 20260224110909a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20260224110949
> 
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  WHENCE                                     |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin | Bin 92192 -> 92192 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1.bin        | Bin 791908 -> 792036 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/957

-- 
With best wishes
Dmitry

