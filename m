Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0DBC55ABA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=; b=AkUpU/ljFmw7gyyc11KDSCu4aS
	PBaByNHq+CPl1aoh2V1Uvtihd4zuTEUibSCNdUZgY9LIl4DJ3YpbBti7DZmJmO9pBt5kxhLgaVdle
	P4F0o0MvNM/jHqUyNe+zDEPjzjsM9xYbO1foU0oF5ugux+H1RnaIhakNJy1n1sA5bCIuSGpxNX7RS
	Radm5mY7zHtgZmXH6dY2HAtm3kmzKPYJb8YWMLL7H2dkO28C2p8ouwzSMWa1Ojp+GfJEdCl1GT2zN
	YRGH/0SSvJe/EECrvwMUxncRq03djQKoQCuq5u8iXhSEwDuKqSew8akU1TKEaoTDRyn7nmq7CwDPG
	zlQO0VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZZU-00000003nSb-0kHl;
	Wed, 05 Aug 2026 11:14:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZZR-00000003nRb-45ec
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 11:14:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dbDV2348649
	for <linux-mediatek@lists.infradead.org>; Wed, 5 Aug 2026 11:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oAJzndHw9wsib8vGGqXPbqag
	TT4QUYA2hq80PwAgHR8=; b=JxDwAnHb3y692ImDH97KgdFRe3OcrtmEWQIZO3pD
	g8u/Q4Etk9/WXziWNmqIqQQBgHoBCtDf2+QMTMUdNSp35fTLgCZ9xTOPcFAdwrYb
	P5Br1AOymZpumqajjOGlqDSEnUx11p3NnZ8kS5+qXczCzsjrS9icA5GOGQdjRg5F
	FScFurUrDj1AnMhXxDZYnoxZ00i/dPla+eKUUxvB5a1lo+juC3m8tGR8xrN1qvTs
	ZijhCY9/osAZsxTqEtF9/4OpMhyvPkXzIrsE8mLDj7CkpTeDj5/3T8bwRV02np51
	ZL8/4H7IO/bCGntQwTj65aQT7eKNNWJ3uhITZVqdYcSYZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nv6y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 11:14:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso8912451cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2026 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785928440; x=1786533240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=;
        b=Y7o1t0XIUw01KSjHULFTJXUWwLck7jgoCHYJX6uzdJootpQ95wvqa2R51xpmZjIl6o
         XuckZ2KrSvf/vdgA4cruDnwZVOLYGPvjD8eQlvS62uNaVjawkTn+OzNB1GhTBRVfIobe
         B8BeAeyTaQNNOg8vmMIhhe98Peeap6yMmiEcILkLbalWqyY8Lz85xBWQM9PN58Fkqdlw
         pT5fKJGjbuQEQp8xRCQnaUPiTRqZhWUeXAuHaa5AIPpi4gqebE0Tt+iZ63ButO3aM/rs
         wu0K2cU/d53o3+M/I+qsqEHc0rGI4mMj5D0f5+mXefsXz6BmdYJ5xNP1AKsOPlbPWEqx
         hagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928440; x=1786533240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=;
        b=jUO8GrVstFMC81hpGFgAH1UXhhXy1cKgBDbWnA2iEk8b9l2CyswjzsZ5Mi6ykUP7t3
         qBUVmD1OohKsSPKnVYl1yLyOKvqqICi5rJMwCB20WjL/MWfu0Xq1MS6B+0a9t0BzKgrc
         FRVh1hieSZtN6wB7m9UhoG81J1tspEUr5nmsteu1+DDMkdWbrZ9zMXmyLic6tFfA87m9
         Gvl733zMqTucTOvPUBLb8fMLxTifcndNaLlLZPEL66h7pY4tZH99WA3bQLFo6cWSARUz
         LjBuXyMV0WoGIqsldCrk3kor/W/Du5iFNIubWa4iXDVaRwAf2hnq+hNHV5FBD24llaoN
         3FpA==
X-Forwarded-Encrypted: i=1; AHgh+RrSH5n3M26/9GaIRk+6EEWFUsePv3w4epGlo9dYTXUKp1ookHF3dwq9KLX7u3D4kXKu3bJSHAbSvlDtBv3Hgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyueC7QFnpLQH5UrZ1D3+Ult7JiMll6Pk36NUplApehgf+WZHQ
	lA3JIahhQ6cFilrrLKCK6mFA3F1IUpLNrDnNLeJB5D3gbKD9hjA7uNF3McVyNPHK2YL2wcns9qJ
	YHzi0z3gwhDLLlrsjnqdQMsjuhrMsZiDGHg+r3oX+cs/2HorQO2o/fr0M5ismfm9tCG045E3LdI
	E=
X-Gm-Gg: AR+sD11spWw1uoRVe03SQFShi0Ibo6mZ4LukdEDxpcBNi808Yia3Uj7zmzsZXJCXYU6
	PT8nMS7RFLaBzWTO+Ah5gh/Ysbp6q1XqLKXakkA4Nsxt2/b4YDdws5r6vqnhz+RpABLbzz5CcoG
	d21UJHCRRCVB3iH8FO/eGuKmH4RZ9IURSSSodINv/RhyCWBXRlvS5Rsvpuqr7Ngq6+v8wEwVGpR
	7YcVVoscN70DPaSFOLRi/EFGRBVUB06wAMq/qwUjWKAO5BCYBimj1HB9eZOE3cVEYmLd1vj4KTW
	mcy86Q6zk/oLMNvhaMqxLrtt1d1Ob7LtM6J185lz/Cb9lpHP0ggNVcK3zSzUIEJpKrxAti9URQA
	QGKUTPh0mStOO6TdTJGjsOtqrP/7Z0+UssG4l/mfJfD6mGdkGcAh4cH5VZb3spvb+P8+9GSK2+q
	7PTO0OhgdGByzdSw==
X-Received: by 2002:a05:622a:2485:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52ce622dc47mr58820261cf.42.1785928440261;
        Wed, 05 Aug 2026 04:14:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52ce622dc47mr58819791cf.42.1785928439801;
        Wed, 05 Aug 2026 04:13:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c92d3sm103145e87.79.2026.08.05.04.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:13:58 -0700 (PDT)
Date: Wed, 5 Aug 2026 14:13:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-mediatek@lists.infradead.org,
        Lucien Zheng <lucien.zheng@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>,
        Joseph Lin <Joseph.Lin@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] firmware: airoha: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <7vt2klmqyntyscjcffdsb72g2psrbfkobcvjubs5ihpdvl24zi@fdrcysv3mher>
References: <20260805053652.1384026-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805053652.1384026-1-weiting.lee@airoha.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfX4Cg0a4r1Egzu
 AV2Nr2QGqDzMBhjzW740rsHU669Byys5KffBI93WMbBHVjw2ifhCK0fPOZtN161iTnPkkF+OSqk
 Iuw8lEUuGnvpJ0ZFyc6DdBXUAB4Nopz7HpXQd6vwCKyyQFFAHir+vKKb/sSjK4W3vMJxZU/Ky2X
 K0EjMbS9mXf6c8nLHa2zSQ9k6tp1ucbtAiLO7TEJ8+x1VNCjmfn9gqxNC6Um1B5UlR/F9raPk1k
 MDKmew3mMab0ueYRwhqubYVzVGV0o2Qq8fr263Ny2uLzZxMjPIV/MI4HumLnhLf3kq9VAwoJtRD
 2+FchOFyL0q6vC0PNjwoONjFl5Y8jWyIG7gBLgsJEQHzitSzXceL9NXcZYzENj104FJRXdMAGzf
 ZCM3u375DXNxRwmXbG5/pNyrS5WxOUFqKj9rp6JxfiJ66Ry8TVtAF0adJ79/gNwSOtMGilcfZVK
 ul4t3L86wJgF473vNLw==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a731af8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=JGXwu8-eAAAA:8 a=_rRPfmPDU2cP-XhUnEQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-ORIG-GUID: ImRmR_Pk02ubqMgCs_8vpsFZH7EigZoN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfX3S2Jmd64dk0W
 GSktlHyCgiZzzn6zYuIACbSzscM3XX7SUz4YodVMzMsU9JQ3BPClEPk/JDvv7u2MQxsfgC8FkX4
 c56RaRpYOdOBli9mDalIeBeIEqsHGQo=
X-Proofpoint-GUID: ImRmR_Pk02ubqMgCs_8vpsFZH7EigZoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_041402_129069_933AAF35 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Aug 05, 2026 at 01:34:30PM +0800, weiting.lee wrote:
> Update the MD32 firmware for Airoha chips to improve power efficiency
> and connection stability.
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

No need for this Link tag

> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.zheng@airoha.com>
> 
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>
> ---
> 
>  airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 32768 -> 32768 bytes
>  airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 131072 -> 131072 bytes

Is there any kind of version attached to these binaries? If so, could
you please include it in the WHENCE file? If not, please reply here and
we will merge this submission.

>  2 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

