Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318DC83F05
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=2+saoQJZECUeXkYVNhH1vM/EXF
	OP7+bBRiatjU/H0OC1KF+3rCS8zSDOPV6+kwWOAfbN3p43QVQZm+d5RVMMRu23U7+rtiMEqSG0s79
	nmbAI9woiEwwFtqUhF1yHk3+Zbm9Wy6pjvz6zs+X5qdcc2xp4U7Y1S/Y36QCRzmNqXpNuQRROnTuZ
	Y9yuqSeZ13bF377QaLjAvIfvZ1VzG/JKkjJO9C7TncnbA9AQLlM5LI5+IXreYVEm9CJ/wSKhaxUFh
	25Vzhw1Ooq1XeCMRzJSE6ZDNeWUowvxoutFZyfUPJ8aCLA8dqNuu7gs6n6rK1NLPEfcsqRgW0kGyZ
	yQfO5C7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXp-0000000CqlH-0tPb;
	Thu, 03 Jul 2025 23:40:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSZX-0000000CkBK-02sH
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Jul 2025 22:38:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563E5PFX010370
	for <linux-mediatek@lists.infradead.org>; Thu, 3 Jul 2025 22:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=CWyUayD+8Bux6HrS
	CXSgMVfZdWOYL4PH1XzrD0XHMeNGifHqaXcXt3dSsVnScByMnmAkiQRTpL7Rwruf
	tkl+NV8VC8/mMl2p2UjTD6e/32uJajCEkw9ysfYert8V9Qs/l9Ij2Ztb0TW1zjn5
	Hi5Oic5NDb728rQvotIGsYRtInx+ZUoxbHQzTnOu6VLUFqldf0wY3+3zwsg3/53O
	Lo5F93pr4Ihri0ZI6Ija+X6iZ3R4XVvTn4UsbN3CVm08y+Uu9OMdOivvlHPYHQXM
	tOvQgY66FqQkZzZ4bdZCQZoEqnGrWWIdG2uJQViBPXBP5PK93LOpeYC5y4lbZmMJ
	w9OG2Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30exmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 22:38:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so201724a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582304; x=1752187104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=;
        b=dJAXT1r060Zj6BvhKqnSUe2PQFcz05AMydR+BDamm3cPnBkttN9zYZdelkrV8e5io+
         rx7xQQ8BjN3DNmO42voKKSIMf8kCjzF5k2p6ptsuUIBauVZPltTflhsUPHj/7D3510M7
         FCyLD9RqtBgJ6JM7+oPDUjT+lWTVtr+O0UuDwmRo5C0bz7J84VsGfHjMgULPoRXYOYoO
         3vKKApRlmwXFoqmbhYYobQsAUUO8+7LgLZ7SYkhSYZXVPZyBKiy2olr+joHtDYWPMPeH
         v+gb39j0qVLbHPVHCUPeAwo4qZa9mVxM3E16bqAApUsdbteD3bSCrZSoZUW+aXRiThQ7
         aurA==
X-Forwarded-Encrypted: i=1; AJvYcCWi3dIywZgd7vg1kn0xb28TLFHoUZxK+dfrhNBVTf+So6XbnxZsTIZfUTdLWljYN+M9kcXBk7ClOSiFTfqN0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+jBxpsWIaha34f36RIulVuIVWxiwGv1KIwWJDxX/5XZqGp48A
	h9mB5N+4jwhz24/FYXSG1ypalVshN2DUEyZ8lpacHFuyD6avEtv6jHMiKhlSuHzxMr/PSePKrMS
	osum9cGo+iWxi1o39IrrvHjCVluUUJM27beL/YXRn7Btdjgo//sY6dKbbBSp4NLcvc8I5+cxyLU
	g=
X-Gm-Gg: ASbGncvV/6VpS1pbGlVhYICTaXvWLNsHeWddKn3CxbaRQkOJqbJk3DOBaTP4DlxPu2U
	UmvKUd4PHiU2yqoqbws1ekChmrzhOkEJOgA/T1puUfcDXdF7E3vHBoupwXfCGDn6uK781gg8pmP
	QShyUIzwPcp/3vkHU8iCovRp9JjDPG+oWqnkPvbs0y/qkeUSOCzlVJWHm+LNt/yLgywQOeR9l1c
	NhP4+/PNSMgiv734eZNHifxgBzsNBGMip1rY4vvG1NMQlpKGaXyuwWNhFLFO0voMZ+Ge6Sv3EeY
	s0qd60D3OjZZTf508b+gmLzYow86Ca5O+niR8fohPfRZIGRxaLia5pM6oaAD4lBXpOdyTt1eACR
	tdBIBiOVRCt+2xnI=
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678875637.23.1751582304188;
        Thu, 03 Jul 2025 15:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT4Lpx7Qr7u2DGYV2UWbI8VMttTXhwYx8YoVd9mUgEjIMP8UGVB0SwmR2RW7RvDWCQB5IHA==
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678833637.23.1751582303769;
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40c2sm559085a12.33.2025.07.03.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Message-ID: <339f0d83-a28a-41f2-99ce-3fde0b5ef95e@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20250703183502.2074538-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703183502.2074538-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68670661 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=iqVkCsNWeGCx9g_Yh1UA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: UkhRtVGsQVqhPCV2UWVXBPhjirOy2aX3
X-Proofpoint-GUID: UkhRtVGsQVqhPCV2UWVXBPhjirOy2aX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfX9gQ1zspjS1UH
 ItvbPyPqIeHPRNzL6gcGKLWdtxBFSyvNlL1op49N15t+oM5zpKycemc80ManRC1HTstGoxVkgOJ
 5pcpgO2G5k0o8wGuAPxr/DKC7TJ2TCtDxrvdNnPxZbA1ZsQfZXrQ8Cleot4iRZObjnQpvtb5+Q/
 k/oL4yBdyQw3zlzFggUuAPjRDgyXv5ggx/bHVAd7cumMPwJVKz5uUWyZiny2oyED6zikHg6IR/y
 EkOmiRWCFKaThde465PomCVIIqTedHGeoTZ1qMp/QtZmaUtNh6odd67V77JQzdJg5BFeyqKksIJ
 5d5aZ+Yh6bRTOmo3FTqtatwJFfTX9FFTjGIxAP4tNIOALeUEFDN4hF9jOA50dNlmgD47JPm2pr6
 Cwxshy61uuYRIYgOS6vTla1RZCIcHWG2BSHaJ3P2lj5dN33KN5qFRuBZowbSKF0VAeSnLBNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=723 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_153827_077189_4F430C14 
X-CRM114-Status: GOOD (  15.64  )
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

On 7/3/2025 11:35 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
>  drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
>  drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
>  .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
>  4 files changed, 18 insertions(+), 51 deletions(-)

Can you split the patch into 'ath' and 'mediatek' since those drivers go
through different trees.

/jeff

