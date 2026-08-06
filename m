Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B00C561E6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 09:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=; b=WD/MwTN06Pl0zo4D2PTwIzg26y
	OZlFIW+RrpR5qSCfDGr4+zMLY6HPFkezkSYl9B1KfnoVS5TyfMx0MUwPB+UCKr8Ii9x0iGGZrQpgf
	nQ3KURn1zmBWQSmNHTFgzbkgtOK97ycoPrXnIlXXLPMqPjsFHFtPg1ebLw4g2oZW3JbtPSRwack3y
	hpUIMGUXSEEH3J+Rig55G9TJtm/M+Ce4YetW7vHqYwo74K8wMYJ4f8bUCBIqV3/oeD6Cn8ci2Qdyj
	oBjSNZfJQZ6vXmuhjZgyPKZYX55+yGQSamn7owKOJ+NhNBDs9YvsgEkh92XGTg+tAxM6h3XeJ7rwt
	ba0zAhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruBS-00000005M2Z-1HzD;
	Thu, 06 Aug 2026 09:14:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruBP-00000005M1y-2VRJ
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 09:14:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67694NMe1172684
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 09:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/oI0JfMZETsCXcSZ5X8qaxVJ
	CZziGK+rQ8dESfqnXcg=; b=CIhSFRc+WPD8W2RZoA8BdkLJoLYFHiMAiB/Ub9dZ
	RRwFXzPnoSDYnRkcJ3QqrJu6Ob5v6O7b3DLT55EbrJelTNojz0iklN9zo/3tDdQk
	APLWNlPV9dNU9aiv4XDBGWqEOJeRgv4028nkiJu9HVL9pDAaMG5LJ18cnGmb/CMm
	q01cP7Ie9AukOyr6DxOoD8PThqcHL+PNgG/WEsed2rJ8s2PsdQuPnSkYAQaIjP0d
	nBEgHjRdVATfoNJ+vZ6yl8Y+411QAkcihUAe9YZQc96N+xRae7yWIdIfzT83N6sO
	4vhZteEok3IQDYALtOvzabzd1TPvIdWmIoSIMqTlQh0s+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueh7v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 09:14:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bff5c7035so35122651cf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786007674; x=1786612474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=;
        b=V/BxSFjw9tRqfwFvrcvr0qoIu1GFYNBtTiuyVt/K+4gZdBLkxX/3cVeG2hxZGeXS9G
         48VsjKcHLDrPHMPk4lEiYqjJH0W+NM1PCKdCxuFEfn/W3/xaWvOCGLTqwtyw3DlOFlOT
         fONM2AcMQpDoqFC89H0ds7pBm2RYuu0+XgvcQFVadlQ5Jz/DvTuQK579Vo3T1a2Qo5pw
         g0hBM5mDzKjxVp28d4ql4sKiZpKB/l2iolovkYOxlQ3SRHKBUuoOFx5MEtwAmJEwcZqu
         /wEYcTw9dkGOEuWdDvDcRjymIgw3CUMaxNNP8R6idxhotGPFTgzwytzK9mbG8JEPZAt2
         w7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007674; x=1786612474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oI0JfMZETsCXcSZ5X8qaxVJCZziGK+rQ8dESfqnXcg=;
        b=c8g5ngcNmu867/kmZUVGjw1kmEjWA8oec5baU5bhOmc2TxSOLKWm7oreGuuQJ/0MEg
         m0NickqVJ2YA0keFAaePm7jTtFEJKq85YmI7R3+yP7r5AQ0TJsNu0Fb4J8dwWlEyQA+o
         N7TZ3I8QfK1iCXzSdLZ4t34uE+3otyDrx+n6ph7OE6Et1YdM+wf7UsHTpjceOxWX4Eaf
         aGHHexDsQ0NBh5K84WwxBnG0pQ9VqKnMoiT6jKV/mFBanmuTRI3w2YfAbyqD+kxzQXx4
         dzJH+lgIU98inKFBhSkWGd4B4E4cQM3dYaoqg4udd07oD6Y+0F+BqToFBcPyVwPytK/C
         gNHA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7R4EhYR44G/0QKX4+CrVPt1QvP+Bw3ONl5bEs+r/OkvoF417jMRD4RKj8MIc6CbTRawE7tOfUgFJC4QADjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3xSH6BPQ1BfBpPInebf6zlCqbiAvjtp8kosLyaNNofOCEKVe
	k1Pjp4Ab9lLFzGZxDqJ8EGBUtR8X9rX4ZAd+9l9eR5+FjwIfLl0Uxah1l/7mUPenQTayUNjZDq5
	xKo2OHKLW9joCtXa8CMqVOr/SJp7VC34vHBGkdafmy5upVB175iTK5hj/fUrRUo/rNhdcPanmy1
	X0WUMqT6s=
X-Gm-Gg: AR+sD12+Q1BsS1zv2LNQ4wxATjuLMEwunl2sqQbs+tHvpND1uDRiuCUe/BbLJYYbF64
	J+dBtg1n4/LyHy3VQVqXRC++vqvbs611AZuQV5O1ksMIEiK6rqP9uJDPIVdYVZMoCe2UXsA+UPP
	xXRWwygDeXhZago8HEq5CVRrW8sqRHkGVC0AXf+LLNaAuthEgcpFFXM5U6uHileNT+HUKZ0G5RJ
	91yBGdWXdOJWlsxT6wE8kfs1LGasey8dZtlckPf6FpPiBqacS82ab3bUHmgMKl07VezL2RK3mSu
	ZAsmTAuqD5y7bGwNvNTImFTE8kxcXOEad/xHoPFdgGWskXxUUw/s5xJ8fArEHhZxxK2uPQbiCzU
	adYoFQvYS3Ey8Lhi2AiFw8DJgx6zfUp6SrnYCPJELNWD8KIAJNkGZtx75vz4N3P6lpUC92Eq3x+
	ZHdNNpwVekwILkDg==
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id d75a77b69052e-52ce6110546mr130660221cf.26.1786007674114;
        Thu, 06 Aug 2026 02:14:34 -0700 (PDT)
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id d75a77b69052e-52ce6110546mr130659781cf.26.1786007673675;
        Thu, 06 Aug 2026 02:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62af86asm601516e87.52.2026.08.06.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:14:32 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:14:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Joseph Lin <Joseph.Lin@airoha.com>,
        linux-firmware@kernel.org, Lucien Zheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org,
        Albert-AL Lee <albert-al.lee@airoha.com>
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <75rjyey5vhw376f7swxkdlzfxp6t44znped5r4l6iey6wnm7j7@a6qnh6iurmok>
References: <20260806090122.1391450-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806090122.1391450-1-weiting.lee@airoha.com>
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a74507b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JGXwu8-eAAAA:8
 a=uDFsXW_6BNhtH2ik2TIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-GUID: QqOxItAuRWVVbq3y67yBo1QP-AkT5Uwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3MSBTYWx0ZWRfX+LXdyIOVbUD2
 jJZZcjDJ9wHbIkrW+P/kfWVTnYMt/acO00FCihv6ltnskEXZyjR7U20QWxSer6rZhSNPJ0K0p8r
 nJ4bNkYMnoSbhzScNWs3fw2ur0FjmNtODCOotKVxHztf2GQvhgufEZVB72wNlHXflX6DUGKh3Yv
 U+snI/73sXqb3LvWvQi2wIA97+4ZtGMpQFoX7dmj7+RYjXYSoVisDl5I6AZ1hsmmw7XILJ/v8EK
 v4Vf8SpPbvQK2ZF2qCCZYMaWfiBduM734u7JLZV4ko4n+LzrOrF4TunrOxUYNVzTdNH0jP0TbAK
 SyV7caTQ+fC0gJpxmQDBM8o0JjEPN7JqLh6KHxrlQNSHwZB7AWc59YI4JvzAu5/cKQV0btIx8Bg
 PbzQi/bO8OPEKrHw2M2/kJ9x9kEMIfDTzWoFttLrNIHMQIjuvhjGbs8KaoeEXCQs9oPlWBIoGiZ
 bSF5McAwPCfSgFoiVrQ==
X-Proofpoint-ORIG-GUID: QqOxItAuRWVVbq3y67yBo1QP-AkT5Uwe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3MSBTYWx0ZWRfX+ETtZW6XRmTh
 S6Mrv/iIUdK2573rLfRoCYpw6a5lkDd295UOL40+iUKyau/13wtDIvfqYjDwRxEUGIsqe7xzKtW
 kcoo5gbKHB3FnSLGZBz/DUQzIBRqjk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_021435_639266_21A342EB 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, Aug 06, 2026 at 05:01:18PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> 
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

No empty lines between tags. One of your SoBs is incorrect.


-- 
With best wishes
Dmitry

