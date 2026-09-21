Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4F8C982EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=; b=0XenNvPyPHeZaD/+HR9vwrzyGL
	zWJml+1EZYaM2jaQBZFIXZiViFDhVo7ILZ6LDZJgf6vN5ISSPUj4kS2Rd2f3WsJm7tivz1pS2SxJJ
	0bEJPze0bhxL7icBKTsARCXeBvIsibiMDso698obtFDcvNjeQ9TwCV9N6vgG370/yffQR3eNamsqy
	uCiBRhgcJ3I5OITfeaNm2AH6xxDf24kKOAGFpx+OsRapOlbJLcAQq+8fpnwplSLUK6BmQHa/H57V2
	qY+AMNQ0YJvLDyePBzfhBzeX5NCA/pJ9AhcEC4F/FlKqw/XDbYzASe5ZfjvSElVPNUsshxrINnDev
	hwJ6dKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cag-00000001ydM-03ob;
	Mon, 21 Sep 2026 11:53:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cae-00000001ycM-1E3F
	for linux-mediatek@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=; b=ijstm9nOoSzDl9uiOiF3Q1ECIW
	Bc5Oh4gz9PcJQNM6zk/SgelNR1GgHIWPBfrDiwB1x6yrwhav7T5xLlgiufhd2s10MP9Mv+NXIAxEH
	XuHmOYaUQNwWo3a7UiOp0LqeftfcfSJAXJ8dO/dJp6glbUbhkcESPuBd96BJuRDbZsXf04jbZ7DGO
	qi7PXP9n2KO/lKqNsr7xh+2K5yXVJACp37q7ZVNyzDBjA+PYLgIzBFl+m3jNPVsMOZvpnbv14OkAJ
	qZ6LTzoHa/h6XzvCY8geQcLi/vo9NOIptl+RCuNRhb4acUkS4RvCPJxlSQsCP7WLPueG4Q0csLLw8
	ZliJDFAQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8caQ-0000000CEyu-3CFb
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 11:53:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4pPG1130013
	for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 11:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tEMjD4QABtsqcKKWJSSUlZeC
	K+qOD0w5nqpSa9w3MOQ=; b=SQ90gUYGFPYclcUdbC/XZkbNnW/4Op5voV5izajI
	Tf0f+7EidkucBFZbHM87YD6n61hJYHPf1DwTzCPPYVo8eIXZH5atog8gxJCSvovG
	jKx/fe9a7H3me6LGHCLb5qWdOjJGDiWPNEMI77+zIKs8iiicGt6q5kBcYymcM5ws
	66U611gmAJFl2zA5JP+3WuePGB0fGDc8+zGOOUWRprqp/bXTWS+tp15jxY6eEJQp
	1/gY3HmMFp1Skoc+vvkAwmBre6Fczus9DrbTQgzS2LL18C9Jcov6rRFqWUgGaWqj
	Oj6Up9qkqe1W7FLe9Efc38vdEPvvrNDcjmC6kkL8nP6TKw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg5yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 11:53:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2208774241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991604; x=1790596404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=LMIPV2p8pdH6UKtVWl0ozImyg3Zu5Kf/SnRBlyyWCEWljfjLTzPj4YnRcDhpbWspu0
         BwoJqn2X0+bUboYTbyeHg5m8HrKGbE95P/axJo8VMJGLUErEekmXAUA/wehkMgjRO/bU
         67hVQ37Dz+CKmy8UegJz9jeIGxhejFjjHuMe5Vw9sqayY6MQuhYroDlMFP4yUsVhm82D
         XwKSRqvD5nl0+frsW6fWvUgjMAX1NVu0eGpP/ZPFW4J/DVCyOYMx/h/uJ85qTJAgqyen
         5NmUxXc0dMiKIhvXNVLXbwhCV9GC6KsAOiUyPZRbBXoE0xZAuI5xfq2uIvsg/jzz90kR
         MLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991604; x=1790596404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=OzPsS9jjKgBmSiTd5GDlkvIDB0HOU9xm7Z+8YTHSqRPyZRLvVpA/ozez2Sllrm7Ocb
         xCRXOGWi1hhQ0HRKSnG8Gf4izNI7xfRRuj8xgG0d/f6vwF1Tiq4Ayp0pV5ZPzrW6AKMz
         RFPlPccOgONgTWmOBffM7CX0HqdX4VDdbsMOetNex1WVZgj3Sws06hdQbMlFKfn9gly1
         cA4/gnO1gYvtea9T93xsR+icl7k1ZH9eovMXdUqyk85wvKieodD4Y+K+B80X/e5DmvYU
         UXD6Vt/ovo447GySHGBwRWSzohZ5nIFJaoVVb/aaGL5ZYXDVHLuA7irxoK7mcMsXt4pT
         3lXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr3qfjwmpHHtOnfkFubxhKR6cs55a2ItQ2XywbpVKdixCGKqC2YOa1Lul03wxlpIPooJ1+KndGZ+/qVz3phA==@lists.infradead.org
X-Gm-Message-State: AFuF++mBlBIGKc278zAu97eQ97Fl+xNSab+pHEs0XsI/KZNsbuFY1Qb1
	wsfvDWCQ49Xp5yqBBrKV/W+TCqLy4mPcNNm7O8M6bVDs42kyWspw3GhCMy/MCc9m7Hda8tBBZNf
	mamqRnPpERfVU+IfIY5+n/58H1zi10M7jDMUeQd60gXMneATejDd0dgFUtTBFM6OHjIdBFcCGww
	I=
X-Gm-Gg: AYBFou1pE7qh8Q/C1Oc2ReUNur5SayhQFaw0KPuDM3UM16Q7GK4FgYk9H4UE86bPoXi
	Vdq4K2C4DuYTFy9M67wcEevZFhF329xtYrxwBVsHtvk/V5bYgz5EnHflODhcCdJk3a8muunmtXU
	yT/zMTEtQevgEmQePLBtTHjZcsPu8NVKGwM8VKGaJsjJiBQWYhRKpevGNSxNkgkVHhc6En/Ldw2
	bB1HVVjPrUXoOF+88lteEkta2Rg2ccQw0yjPpQFI9jOh3zs02uhPmHXMh8tMpj37Z08F7s0TVt+
	4omx/k29iaKCdzRIjfb4fHegV1tIdLTw6RYKNbS2sctym7qk3dRUUAldfOG/pKxT2Ho8MkjFHlO
	TfBWOn0NB09VE4zA=
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069596e0c.10.1789991604523;
        Mon, 21 Sep 2026 04:53:24 -0700 (PDT)
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069584e0c.10.1789991603944;
        Mon, 21 Sep 2026 04:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23129187f8f.10.2026.09.21.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:53:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:53:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        nfraprado@collabora.com, sboyd@kernel.org
Subject: Re: [PATCH] spmi: mtk-pmif: Fix clock reference leak in
 mtk_spmi_bus_probe()
Message-ID: <wqj654zd7zqr2uyoivfypt3qioqitciwakxxhb6eslu3q3sawn@jy7nsjxmgozh>
References: <20260917155037.2161027-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917155037.2161027-1-vulab@iscas.ac.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfX3BYGFEZwsWda
 q8LuVwA8fkuPC7Y4MRkIUsiIwEZ2WRAGSRX9LyRDR7XN9dG5xvF9l00Km4CXcADhDCGYTjOUCd4
 TR2OjZu0KJOnFXe9eE/F6slB/G8CLi0=
X-Proofpoint-GUID: 3h9pjjWCfiUijcLopzGiA6JYw8R2BuW3
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11ab5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OgdZ-FXbkxQzFk8FBkAA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfX9pX031hpZiKK
 u1DUKUzc2Rvt9GN2bOXdYJhgdSZCtl4T7r0ecW9PEWBfmH2oV5RZLx7MW9rB2fcMQGPbbBmHPxP
 O223hLEVAYBFb9JBBohwp4BXXLWR0/W6o1kFoE/Sa5dm0k39E1wnswl+4uJ0ydqBlKJgrbE8F21
 p0AOB3zl856ISI5yvkuc1eLigPtCCiocGWJ+eC92JOaMA5bL4ldfRFQzS5wALQ0Ob/1Hv+GwHPc
 vsZ0Gx6qQAowpfNaqiExzUuGD6G/4L/Gne8XUTTUjFAgoOO7dboakM1mMZwtk6tISs6MjoYAzVR
 Tmf9dgHgACismc7lxxdAiiUsWXFJYJ9Y5FLVhKJvGhOFfKwMlqYUJrGqLdl/YBXGV1oELZ+6d/Q
 x6kgMdySQjaWyuU7VopDfqvwrguOulDugtdK6R6whr9I732vgur4sJzQsKAGj/MtBtFJik6DNcb
 T0mF4jy9ldSTihIYnbQ==
X-Proofpoint-ORIG-GUID: 3h9pjjWCfiUijcLopzGiA6JYw8R2BuW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_125338_657963_B61FAFCB 
X-CRM114-Status: GOOD (  10.11  )
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

On 26-09-17 15:50:37, Wentao Liang wrote:
> of_clk_get_by_name() returns a reference that must be released with
> clk_put(). If the lookup of a later clock fails, the function returns
> without releasing the clocks that were already obtained. Put those
> clocks before returning.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

