Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3690C55ABF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=; b=23a7Ha4rLKx5LDih8WNrYZA3rQ
	WD+WI7GG+PC3wHz5POWjQpay5p2L5B/TFXwUr2J3YK3zPcN7wZNX8d597OdWyLTadGXOpZPFwzzn4
	0fgw1LOr6mZrGUe8z6BKwRCitnONezC9d28slCPIRMc1bMVq4S2hXf0UErWMLbrmSgaVtHJilleNY
	LTxEi3AdgE8q3ahWc2i2RQVuGR3yA39FvTW9dJHJ7Wsprggrdf6+vJlQXiQ3cv2mZ4qApCqDCGLUs
	gKiJ6P0GnbAOMz9ILrO88e7gT8fUVxjUiLD57S78eqCuPQjfPBVmA1INhFm3U9P/1aLMMs41yrzVl
	9zwTllew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwtv-00000005iKq-278h;
	Thu, 06 Aug 2026 12:08:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwts-00000005iKG-0aBI
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 12:08:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769o1Hl2105641
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VwpHTow0GXvAcxc33H3Y0/8B
	TZ3AwmulazAaVMLolnQ=; b=px1EYx7hKwJviPzsIyRIUUw1hjELCRdynUoSYNVd
	lFt/DQtshw+FRYr+ugiKupe4oKobe63ycifGd4j1ywnRJjf3WjERkfvuvcgLrcCA
	ShCAAmRwYejLbG8ctzALujFm0qgB5j5jfV9LJUsLEkzzzy9avLX41D3XrdJyQHz3
	mBqwoGeQhTopMnUV1U5Hh0pico8m8MbUK9Iz5CBWX9tYdAUW21p48X9M6p7FtF14
	7kGR4+naXTFHGLsfYL7kflaeKBtAtw6XCyDCAvjAF7+16wkJ9lJGSInBMQBQicmi
	ZhfStSu1vewGWib+m7If0rXt+OsDUVr/io3iizn57BX4kg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730ver-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 12:08:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so9674991cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018119; x=1786622919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=;
        b=FCzmdsWsNyEOrGL1ymZ3eQTmr5z/pC+ffEX4ABo+RnL3aBlM9+mQ5nIzAASZVU0v4Z
         uzBl24sdZeTEjKBx+tF9WCRNPruW1Ey17OP0FH3Wc/DnJ3ZKpVH4XDZH050rL2PzX3et
         yNUWQFkadC8sfgGHFP9QToc9Mxr0FN6OKXkHCWZ9S6yf2wiF0dyrKiqj/DpKDT/6xNJn
         B6iIcGiTkat3EKlIrnuk41AZfk8emRAtGWcIJpkTRx5ChQ1lBC3V35dx9Inha80Gg0Qh
         such5cql3n+BNpbShCSTIgTaqg5nt3UE+jePqlo51A1ULio7p0IECKaqoKV4Qt3rOvgm
         sYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018119; x=1786622919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=;
        b=p3kF8HnSIr2mU/OfPnh/s8E4lZHwL7aOcYL+AoJXhNtWYRC4Dg4FB78LFsp9NFZypx
         MSZb8w6OIK6cReXMZ7vhJU2w7oJWQPPgmpdt1SOXpe3+TJrcYCJAdnbfOzxptEmAIXFq
         Dv8uVV9RiCWsC8v/D2R45tVWqs8VwJNx2voKYtgMshAmIqZhFT8W831KSNXvTAK7KPpO
         ZqDdLf5iRbD1C13Tdjy3nLleUcPaSIocQipzEdWb/5E08rrPU7Zsiq/y0YSk5G3NdvD6
         OohXWjZdosTRvNNK3cm8KbccGsq/j1sENwc5qYkcnIdvL1CpBMQz6oMQtc2MSL6lcvpE
         QtFw==
X-Forwarded-Encrypted: i=1; AHgh+RpHq4DosOcCMxKcxu7PLg6RvCwYmh16VX1qDxv2pLGe/IXGtLHQzlv8xtLXw+K/vrSYAPaWcfGORbyzA+z5Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9zvbzWSyXt3DDgDC6+o4IGmdYAX7BI/n3c6p+g6DmaHnQkvcS
	EQP+Zp2BVDZz58TD1ERymqoomBA+OdyaVvfuTUOjfWRGGjbhpdtpFqAqhsA60qNJTNcbVXYatL/
	fRfVexmiOPCpBhCnBHUAojFFrqwfslN5ocEw3uvEkSXc0rmDUC/Pqa1DG0Zp9MPhHyNRB3NIkSD
	8=
X-Gm-Gg: AR+sD13qYFR8Bf8BxrVcK+bdrSoETG9jxBXNG/T986U+Vu0QlzrKdwqgRZUYhV5OFwd
	tgDJaGKvirTSu16CBmA69PnHtG+AIAqdsSFqJXz3mDQpowhskKcFSvm5+x+LOeeWSSJHQdCDFhA
	HAIDWl6f0BYV6Wn9Qsne2FiMnZn23Vv9EWdz+pl25aUruWXPLgfNjBighQJvemSiSpa2S/Z/OJx
	/tUJZpNymCW9S53HFV8J+9DFKhPivmeZPd6BIY3Wiw5dqM8wohrJurbFY/UBpHQxcCKGRsQm7Qo
	Uglin6czHC6rVeGr6BT0S29YfUiVaH84i86zO1tnUCvDdhu4hNZBMoIjmko0ghVzbKZM7g2i7xh
	l3vmhBS0HjiT7jGoWGkeTFJ/FMbwfvypqJDsySH4AmKN4MXP0Ia7PNtKBiR8ngFmAYYxzjP8naM
	UWl7yXFT7KJ3/7hg==
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr69620311cf.16.1786018118504;
        Thu, 06 Aug 2026 05:08:38 -0700 (PDT)
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr69619361cf.16.1786018117980;
        Thu, 06 Aug 2026 05:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df54sm712338e87.26.2026.08.06.05.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:08:36 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:08:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Jheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <ga66sufzlzldv5inu7zt6ubibyxlio4wzabnx7dbdsmfwbfhzd@4rjfjglfnruf>
References: <20260806110130.1393101-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806110130.1393101-1-weiting.lee@airoha.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX0zP1NKWDXufy
 wikbNfuLsMCt0+BVw4jq/y2GMT92zkxImFkrhWAbggKhu0xBS7DZ4m9OxPuZWjUX8C9AiQ7aW4P
 1/uF+cVwrJnw1YYACsIPmjlLqkNnVifyVeXDk2kOJulytOh0gaX52Av5d1UrPEokbpApZmi/F3F
 vhgvbJyimtJziLfLCe12IW+cJfJrhiiKvCPYcMRAAugDo4Hl1NYxnYWVih0Dh5pCBfdfHz0UVa5
 LUVXe6hIIG1sCXL77gNi/VLRHN/pm2jOpPIjfUguiYVD1JgmG1U3dYKGyPXyuBsXfhINC0bs4nb
 BvBOgCDbx5t8B7LEjNKr/7H2BFK/w+Le5InLH8NtmRzYWLt0q3e4eh1z1fJl8C8/wRuXjv1YC2N
 kdZpN29p6vLYSrkRw4KO6Tf03V2MWSbSSw5DJFx8Ug3phGEW5jd5dxjMOIddhUchV0cWaJOjTaH
 gyayv8ZwnLAXaCbxC9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX6/IOsvVT/gEm
 xdmogMIcqbYuoYANWgXz827nvLuUZYJpc5csz7wcizFglNFa6b6fsHwmkntWt79WIoTmkSttBPE
 pUBK315Z6KA6ebH7H8DfjASjDeIu76M=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a747947 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=JGXwu8-eAAAA:8 a=J6nWL7tMu-auEnYDJm0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-ORIG-GUID: d8cUnmGl1SZ81ltShvy6Wan-P9Dsc69r
X-Proofpoint-GUID: d8cUnmGl1SZ81ltShvy6Wan-P9Dsc69r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050840_237844_74A0F438 
X-CRM114-Status: GOOD (  13.48  )
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

On Thu, Aug 06, 2026 at 07:01:26PM +0800, WeiTing Lee wrote:
> From: "weiting.lee" <weiting.lee@airoha.com>
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Jheng <lucien.jheng@airoha.com>
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> ---

It got missed by the robot, so I handled it manually. Thanks a lot for
your patience!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1170

-- 
With best wishes
Dmitry

