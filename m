Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2949EC55ABF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=; b=IeEqkzgYABDRxFmx5sTCOuSn07
	EQscM/dN7KY1SfhStGwc1m8P/PZjzTTaOmhXiLRKtR6VP+WU0Hba2YSZf9WJXBUm7LR8s6JU9RTVF
	rx5tpzS1iiJ+Zw0LliCvFiRc5RS8vEsRjmyE5y4sPtmR4onq6j4uTnME1L52dMd7dUbYrvy0HDCQG
	XbJCmroIBC23VF+i8kujRkYclpmM8fDDYj0Mk6OnCfQjGRmqjjZHomi3zhGI47l9XZmqXZT4mjyWZ
	i4i8L9HfCFy/J8iAOGUZR50FRDaZglAhlF00gR95Ea/5posIH3Fb0XqkkGqLml0i+snuey4wVuJfU
	5hC1MNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvSw-00000005Zae-3Qwr;
	Thu, 06 Aug 2026 10:36:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvSu-00000005Za0-2RAH
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 10:36:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nrid1228396
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbCO4s3/ZzN3OMR9yVmbyO0y
	DikBCxKYNTltlYXBnZQ=; b=WBJJZPe0kdMcdysk7sO4UOPFUs8NYhF8IG+O9hwv
	YaUxzoMVMs3XifD6by6CYRoQHd9roq9ffpYT5lMBo1M7NG3bL7OWpm3kNAXFbBFj
	sqxThVnbCbPhVx+wLiVa8caTRShTlVB/ebFjRB0roRRkHkTBLtmt9BhM5MTtEiEj
	ao+rWhq1Qet6PCzwVrazixp9ASQ6ar2LNwjfg302ulTQmmGooC2tdiEyVQiVZwFt
	TMJR07W3iKCCQXfDM0Cikw/rHPphgkM9whFPzRvx0RaJsmH0o1xO9aRhhHQIYunS
	SNh4X4gWIMOfUy4sXrMTGHqskhqytxnBXq8GrvVbNILQ5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugb74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 10:36:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so19569911cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 03:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012603; x=1786617403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=;
        b=WUk7m1LHkaGXT1Xj6NIxwOwwLGu6cLd+afRRyfuU3aJmeds/W7iWJUlHp9E3w7cX+4
         GR61ZW7XqdiOabhNdWg/54jFYwpMo6kNx9k0xKyKI5bRtzUqFlR5Q3TlpQDGfdW++Otd
         2IsraI6hDZPI4JoTAGGwE8bJ1YLHyGFHFP1BM3KvzJaJNSrZWtvlz97llHt3hLoAL3ON
         VlN+Q+iHtDSYiFe8g7SP2x/7xq/tz20gYI33+z99Zg7T/srRg9eXZMknQOO5muoDPPBp
         zJ4o1uegihssV1nx4rPH3Om8CFD205s0yFcPZcX7aQqO+OiroEGsCx22SRRcj/+F2SJ5
         HxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012603; x=1786617403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbCO4s3/ZzN3OMR9yVmbyO0yDikBCxKYNTltlYXBnZQ=;
        b=pkw2qu4eV4FecgN04TjViO8632r3NNMJtB0R1fDrzmydsyWOcO8nJGBn08Fre6ZQJo
         xLzdUvY3HaJOrEDQvmpW4vqGTsaFvQcdNk9epDmkKa9hpy0l34bR7uYHQx4iCKfJhxN1
         QzvRLsxPKBm5q39qve6vunqYUwY9UJm9RymYMe3oGmystGvjPMJF6gpkSf1ZuVo9u2w7
         IFJCys7yS+Uc/wYp4Z/jqtRRBjA+3GLP1iAdTlWoCoQZNQ1/zz2ZI8YxkdBl+0E279iF
         /OCyEExLmcYd7zv6tUEBemboFnAy30UoTbgUyy+3o0QvicrwwjO0EzbOHV+yWEy5WUbe
         UXAA==
X-Forwarded-Encrypted: i=1; AHgh+RpRB8xfehbNwqJiqn3dBYldiGDpb4IBVhvSYMgYx/oFS/t7sDtDSxw7Qm02E4CueyPOzyE6eHNjgchi0L4nag==@lists.infradead.org
X-Gm-Message-State: AOJu0YylbhsYiBbV9WWtvS4ACsMyWqyVrLrbTggIpCNtAY6PMTQDFQtI
	OmzVY+azed1rltZbhfAUZdvhgoJuY2gOE4hpavFvTZ7Amp3SPMF2EeTqeYdLNM0OfNPRUFQ6p5I
	FlLaC4t+gD2mJdi72dNE52X5L7K9VQR1Por5XMrWrJkMvB4p5Rs+ZGrkHSbQcybF7BNj1U+GHRL
	Z7N3aJbr0=
X-Gm-Gg: AR+sD10ZA8zqbjYdyeriG3J6TAa95p8TaTZgHME/WJBqa/zc+sPrvkyX7sUugTyg/yd
	0rgNXFJ6hhZ5j0Qja9Gs3QBhi/eTOWnf99Xk0H/wnpuNJVblcp0wkeoLFqxQW4BiZRYCYN3IExI
	NcCuKinR0a/y4oEPK0HgR/TWSWKRVaGLhisjSyhwAWKb39AEvBO78EQdA/jepW54OYhID5XRCsm
	BKJa6j0PvG1klyw5RX70WCw94OhjnUwnoXjAt0rKIubXjHCx/MYD2zczkTB1y/rdpKNMA00pB2e
	yCqy3IASHd8dZfOTHal+6EM+qqx83V6UQgn7Km87cJo0Ge4Zmsj5hy/m9RpuF8bFhCFtAjLsN1w
	vcZX9FYleVwdtVpkI02Z/14QajfnbG99hyHwIBt+5hGNfQvT3AhM9w/FHGx/ykVSBTe7DRHJ6PP
	fnMLfGJxuggzzT6A==
X-Received: by 2002:a05:622a:4c6:b0:517:642c:8196 with SMTP id d75a77b69052e-52ce5ff0cbamr138225701cf.12.1786012603215;
        Thu, 06 Aug 2026 03:36:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:517:642c:8196 with SMTP id d75a77b69052e-52ce5ff0cbamr138225221cf.12.1786012602755;
        Thu, 06 Aug 2026 03:36:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df6bsm639515e87.25.2026.08.06.03.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:36:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:36:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Joseph Lin <Joseph.Lin@airoha.com>,
        Lucien Zheng <lucien.jheng@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>,
        linux-mediatek@lists.infradead.org, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <2z4ujfn5vqwiqnccxadatux7dktzk3xoc5qahx5gna3jp36d5w@55oazufgjsi5>
References: <20260806095415.1392102-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806095415.1392102-1-weiting.lee@airoha.com>
X-Proofpoint-GUID: 958XmGgddDR55mXxjBxPsPft20L1berq
X-Proofpoint-ORIG-GUID: 958XmGgddDR55mXxjBxPsPft20L1berq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfX3+/fT4CTUJ1F
 jT3cPNDd/+c34Yd5XCQ8khucKPprl8rrq/kP/iTJgcSeFmoNl5mS4iAxAFXY8x6kpKhAo8cgdWc
 2GMKhsnwxIJh4k/gUn3xhFPrSzVznyKLHlAUVtV1Tn+DqwmUKORe/gxypTY5t0roNhJysWfNh6d
 3ktjZ55qaQSzRcHkjKwKV8MegL8fcwdKlWOVra8J0mbiRVnYJVO/tadch1xZ/0X+CrHBuzGQ+/V
 x9C1RG0ubgOGxi0b18jwJCxSzuDtQcsiy7yd+PK/uvq07Qe9itEYOAsD1nhxrRXQpYGzeQXhexh
 WLgKuFkDULMY9K5LbBKVImEiRqHLXy3tE9trg1WEFSN0z7syUtvknWVteaIvniDcg2IwB9ZkxiO
 PUpyEWGTL25gDh3SWoQafE2ysaIvvrn6OMJxTSOZi1+8AHZF5OMsBNWYXuMaCMoTOcWfzfCEz87
 JZ4dVUckQjO0ibGIC+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MyBTYWx0ZWRfX6wsE2l09lOzG
 jkvyTITsG1sMqDSPbFjE16N+RHl6qakdaqvMqNyZnMN3OK79TydKEq6i2NqBtXFAMuhk06lUisi
 p3uMVgmJhU6m6GKYwgXQ9F3nTlw72cs=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a7463bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JGXwu8-eAAAA:8
 a=ZdEXjVfr67PsjufVvTIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033644_621430_954BB096 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, Aug 06, 2026 at 05:53:59PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

I might be really nitpicking here. Why did you drop a good tag and leave
only the one with the login name rather than a full name? I'd highly
doubt that you have a dot in your legal name.

-- 
With best wishes
Dmitry

