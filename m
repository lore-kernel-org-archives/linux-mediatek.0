Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61ACC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=; b=GX4PRfl1BxW7P8KHcehzDs9fhc
	HiYNH3PsAZ98wuqD+57Rrj+m1F0SgQFHWKknJz6F/lcgzo3Z/O3Y5jVqG+AATL+/CZAJGqppWbhWI
	UdAMzzQHvBM3f4XB7UT2stXJnYt3cgZWqgsmwV73veT7zgqn+JmG1Xuin9W5una7bwDpUPHtDHIOe
	EkNsVQ7iWT3mP8CR8jAOadZ0wDXo9LGMd8lgvyzGfJ7R+/UCPuHpyPbOfeWynGIUtZDsSsvI8NZo9
	bkQ/h91vzf1GS/pYrw2kQfoQUn43ys0bPnIYsnw2YKPgoTu4vf+MeOpl0bHMRsTY14YdlFFWdBixc
	4iGPwfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qih-0000000Fibx-2jMI;
	Wed, 02 Sep 2026 19:34:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiV-0000000FiRr-2c8O
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrhxB2730695
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bV9bUhXqj7T
	xIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=; b=MOsPBp4xt1VzCRNrZRrItXHJBMz
	XVTx9cuOEyFDux1gFol6vnj/1L9K68qsg3Q+9ZWsWhlYVxQMGycejHda//PVXU8e
	PwX3EH0jAyqEw0eXeUqpCwfJmRM1fJsz3IFuvKytTOEO1Bc2LOUNvNlzBZHzh7Q/
	q/pcTjrJC6P48nptcUjXUsUT39jtCjxZuHa50I+iCNXki1L7YNv7186I4AGe1Jtp
	D5yrMBTx2j5+d8D5p/dvLArsccJ2pbdEUgWfnVFjKuUSqIW2S3LBUxhzRDc/D0IB
	XCZwfz6lxnGH70n/+x6y94ExcmVWzxIOeLbQn8Zx9XUxfZhO2HwiDoBPP3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2nhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1955639a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377629; x=1788982429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=UcAn9AZWqLRLDSzSBE9e7ukvbpAZXE3z2MeoeOm6g10MXeIkw35DIS77GyLG+lPjAU
         R96d10hBpBGfOlLwB1QqMWAhIJoIP2dlfXa+clX3rfr4lCBVCvqxLcN9aO2ZWSBpKIQq
         ++dtnHErPi1LHslUhlJG1U0oIOMXL9kytspjzGeMptHGLJND4q6+CQCvEuvCgeRfJPCe
         slT4qifBuMfIWa0XY1di3DRuiwWcOVEA1l8m+okUYayw+tqG8N9sY3oK2MOtvZveMSsp
         ADWd7DcIKt18qbcpSsednMRthWml9NPuiQCKOsnSX1DEVTgYnY4CZnndn8P+WJcuExGj
         RJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377629; x=1788982429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV9bUhXqj7TxIzlz2cUYUu3ar9cY07d9G7qajlqH2V0=;
        b=eFVWsXNNm3U3RJFWgayj+lEySBuRwonDq3p1D37bQRZ798BkktyhINx3uoHTA298Gq
         LTEs0w6/q3rQ4k5sLBuAso8VBdkvlIKmPlQRS2wF4xjnLk+h2Mry7c6oAw7uuKkZOdw+
         Xw/UOL314INbDd6pNWEEUIfyxlVsIljTpQQ7kFD42e0so3TXVwZMt4+DLEde8GXWvm+O
         1YH385uUF/kvctLlMnqdNPk9xHybUju8CLWv/Smep8Oq3Lg+7LG68og8BheEsfydDZMa
         nQ85wJSjdqQP0zyMxBKKQuv3fBGoTFaZqPYrtjXDYbiYTWHZrRKo2AZ3fJD131Rb3EaC
         Dmpg==
X-Forwarded-Encrypted: i=1; AKwUvBwsuwkO60pa0ndWemBDib7I4c5FPqp/gm6IqwDcVQS1S/Wdc1iJsXwSfMxzPo+AsfjXpPD1MjO6ZqiHo7ahUg==@lists.infradead.org
X-Gm-Message-State: AFuF++lLWf6TNamU2St9vlyr0BREntzTc/gsFzjh0B9Vw6+mpdW06UgY
	iw7It3uTTfsElD5LueLg6AjzaJSdQqWSjcIsSQWGZMs1R+ruJHiYlxpxWzRoKvb7w36pSoY/kmT
	0qh2nTWxGni+vJ59vVJieOwuQ/5I5emW5eNG9KlPTbmDZM+V0Q2uCGogI95kN1EJqd99ZDqst99
	I=
X-Gm-Gg: AYBFou2LTBsffW3q9xg30UUej0HtYEc191xewc01HL+Q852IxD1zAsf+Zhd+nQmCIVa
	/l+r+Jazx8YOnk8kPXDr20F6eZGfJNjOrWFnPGhvjpdTN8DGx3TNkU+SfRG5uE+7SPT7fFkoqzw
	P1sywp5MmUk6NLd9yCkuSoN83T2A1eWh6mJXN5R6VVQiehKiypTrBWldRgH0HcLaCrc71vHWPWK
	PV34+vcLmSCLvvyq+/3EuHuZ/Q1pOH3D4l3j7od6N2F9gdYsqKmgJpYZl5Cvw0m5m+T4quXNnim
	HOiNAZpQbumv9FbwSartYHhkXyUrW+2yrPAOioCs3vsfE+mjrofCuoa2Ya9jaFdLHZdfB3inAww
	CkRmSZ5XO4dwr4abrx0vYVmtLbQ0=
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174134a91.14.1788377629411;
        Wed, 02 Sep 2026 12:33:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr10174076a91.14.1788377628898;
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/5] remoteproc: ti_k3: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:18 +0530
Message-ID: <20260902193318.1996827-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987a1e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7v6Lk8RlztZ-GcM17LUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pwOIIXON2tQW2FT4voKYMkeER7HgLJTi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX7ekvk0K2zUTV
 OHFaoCrum1SpG0HXIIxcGdteEqeA4H4moFJIUmvCXjbqumuapDbQ5ZrsX/uuf+F4/cTLwPRMhJ9
 Gbhp+hPI/1owiUqs6uxWYFA77HBUpYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX//wN5nJHziPu
 NQ4YOava2e+UQPws8i8Z43u613Aev2nvHGjuMgnuW4HMhMSlRXpugXU88GGaf8XQno6whwzM0Zt
 WkhcxqzT3aS4ApwUNGBDf32sDekIco0+5NH7OCBW7Wt90SyVMa/2yteYoUSlru1aAl6FY0BO6Da
 hcK+nNOQQufmhv8MHlMjCfqCTooBYByN0zuWGKoNZoHGXieJQ5WgHZ7kekLwrCsfauppZQltmM0
 BL1Uvcb/I9VoPxSGzknewzYJeiHjyODr6zDR3zQ956XH71QKD/B4iOO1/4sgVWTP4xyP8Htln2d
 fbDw25SDceT9ZgZUXYhcsfY+6zzoVWPlzkLwTO+HOVuXi3HR5c6KRzITVpNzDKVXLkzTXiJDW/Y
 a05GHJFHsW8GEZzw7xtv1A60+Dr5GB19zc/lEZO3Lp7N7WpANkf/vCr0c2uQISeCRDSgtoatsHA
 c93R2MoDJz5XcHEHXPQ==
X-Proofpoint-ORIG-GUID: pwOIIXON2tQW2FT4voKYMkeER7HgLJTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123352_169711_02A315BD 
X-CRM114-Status: GOOD (  15.02  )
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

Replace the hand-rolled devm wrapper (k3_mem_release +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically. Remove the now-unused k3_mem_release
exported symbol.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_common.c | 13 +------------
 drivers/remoteproc/ti_k3_common.h |  1 -
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..f08b9e373220 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -458,14 +458,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
-void k3_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-EXPORT_SYMBOL_GPL(k3_mem_release);
-
 int k3_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -486,14 +478,11 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	}
 
 	/* use reserved memory region 0 for vring DMA allocations */
-	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
-	if (ret)
-		return ret;
 
 	num_rmems--;
 	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..9a58aeb3867c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -112,7 +112,6 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
-void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
-- 
2.55.0


