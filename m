Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A323BC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=; b=u+ZeahswTjdVDpLpJuP7Sarj73
	boYecwfUUOHJYRkjgUiMDS1PU82k+mVc3eSPiJ0m6+P/MjURx2PG6TEFjRJ7jeOPoxmfW2/WPGb+L
	wVcIXSf39wMq9nOLnfDh7WHMmjs/Wiq4vH+ws8zCd/22/PV1beeh0Ct5YkEWkjSfwPuMvIMKls5qS
	2IMoSd/khx2+iAsEzhg81wqJPkqzig0DSSr9+Q2GibQ0fivx7CWv/2bkFKn10MakP/6e4Dt9rdjoM
	mvqVn+NEgf2ej9GqA0gvwQ7YWyPVX5mDeJGEFeXcrnbrZgbLtQLtSyjfSCxD11+VPFIzkVCz6DHgF
	YRUu/4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiP-0000000FiNW-1jlY;
	Wed, 02 Sep 2026 19:33:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiH-0000000FiKG-3Uzw
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr4f92104995
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pky4TI8eRbq
	ns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=; b=RV/Xwt7RZrZ9agEo3mszxkiGeHA
	3DS2rt6X5jRpdKUxHIuRp3P0uHlzAoi0EJCWLBVXH+jR3dU6qaIEoOa3DrhEXnvH
	OC2Zv+5agkA7CJqaqCiPCAcjoP0TKG9kI4eMmlK6AKTrmrpnyYgDVA0w9qh0g5HG
	L9kga+Bpm91fU6dLvwjNNWdKv+jcd2sxlvcNj46sbYNtWorC4pHgJHDR47xx0Es1
	ZeSIIQ9DtPoJNyZ8nwt4A3d9bcFuV8ONE1+vV1hX/F9Y+eJeEXI44QPJfZaSZdcz
	9v38RBzcJIgOGK8n0rHSQ2Pi8P6rFJKE26nqCekVnjhnYbpC6+xAvHmnpfA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsa0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso27495625ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377616; x=1788982416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=QAOnvbeBLo3dqUipAMeitz/qmgPEm05aPVlbvOCdyADMyIDvQvUCffCYZhvN6RckmT
         OFKyOU3IsK3T/3Npq3jdPOGkrDiPr8H1MPYtJTOyijKWIA3+gQ1KJzeME7pswqzw0vjd
         qZGJY5OJlzOkllLrY7bLXMhOJRmb/N3vsrcXMfl4r8PF05GRkXYHHTim0w5kGKFJHCoP
         HOeui1gGatQRWlyUzXglZGQY6me51tCdOYPFlW9sM8hp4b1BMhpMJSPfHVlWn1pletjw
         iuB09FBuLuDeNNoaS1aZCVyN9NXtb7vuGpJ3AhUFALhBkNZDq2UJi2EPxKskSKOQfB8M
         ueSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377616; x=1788982416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pky4TI8eRbqns0hz7VUCWivurbwBwfDWrIIbRfCQA5A=;
        b=hVnC1ils5CjlmcNK7EeNHCQ//1lAbSg6N2Si48spoT3F/GBXPLvGn9kFwkvV5kH6oY
         vQWoN8fwXRaM5aCjSqpGr2D0aNxRi4i1tfQyv7j5750b9dotwteQFHEcYL0Gnhn+0J6z
         h0bUWmZ9j8TFWeXKXCsVyflQ1UZAChfQAr5KNSH6JDj8s9LEjZW8IRPHB+etSk3R2GTb
         ukj2mu9WtQHMzd8UgrbwKo1A6Fj7BEKO48PaJyqv0iXNuW9y6lhMDnZfyZo9yIO/tNT4
         +lyjOV2IUGPFPHH7gQL5rjoEAIU6EE1UvCdLADkqFectA0XSdNDV07D9IM58oE6+/WID
         lw5w==
X-Forwarded-Encrypted: i=1; AKwUvBxJa+jRkhmCIKVPc6JvcI2KqAWLzCMPm/et1376gNd4K+O7s1yVtToCtYQDwO0jVhkhcTnK8P1aLAJO2+KCqg==@lists.infradead.org
X-Gm-Message-State: AFuF++k12Ay94KdulYySMFAiJiszMfSC8PYgoG35z07JrHNxc+ociOqc
	q8lhIkJ79Pv5P2pAT70vjyq6Pi3ovOJ8h+sEKqknxo6bj7fozMMW0O/tP4FuB5U7t5GOBwHuLKh
	3NcRqI/xBkytkld+uF/fAfW7/46CrC2P75wxBGQfNmK+osAm7yTlJIHQUxKQM/V6Av8C4rXbrNg
	Y=
X-Gm-Gg: AYBFou09VNktF7H9Xe1HScbl0gyWUnRdLQN90uGKccJITSGJyojrvBwg8jJQBfZCbkh
	MMtEw6JfRcjT2YyjzepA2jTo2cqcaRWfj/BbAD6mEeLjwVuEQRB/2A8RjOF/z2Lnp9Nz3UvDTce
	V1GHrXwEM9xrr3VYSaY4Janwn8a5mrENL/aKox6WWbTZQFi7tUuIapoif/92XR89x+zw/gxzsZk
	hzKuoxIKd0tHfC1ASKsXNuBgtlPItxg7iYWLi7W6ubVnS6XY+AmKrVrI2znxGsKXUpNaGMbcPen
	1/l/Fw7ZqLG6el1dae06OgHB/02ORVm0oR8vB2CI0gn3q0gAxRt6CZsDFRsApp7Sb+TlODqnKL7
	nG1ZZEuDiqfhKTJgrnKvJFkIld6Q=
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083734a91.5.1788377615750;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39aedf7c6aemr10083683a91.5.1788377615166;
        Wed, 02 Sep 2026 12:33:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/5] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:14 +0530
Message-ID: <20260902193318.1996827-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987a10 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wJAmRqO6kuVQjJNRMUqOHvi5P_lnVNst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX579J9WJtFeDL
 keBrw7xX8F4mORWWY3wbRvcVaaz5ITO44T5lafxgW1efWvlZ2uopx1BskRmFIUpeo/26Cq16RTy
 VBX7ekFQ1rDsZmelIA0ZpaKnFkdsJOPVse72dWaVLt0mK5Rfa61t/h8J13mF7/9I7o8Hn0w0Caj
 bwFiwssmZn3pyzN/e8bXMQgfvj70iazcA2tB5zYJb1DAXbqUNMY1AmEOMESDkZb5ZVfbmG7ykt1
 MzgpsnEJvd8phAcovIjKDpUenVvFlK2ymCk3VbiEGpd11HBnns9WvW3MjQegCT/zepPpY9PkrN/
 xva5/4BvODKBEIiE8pgLY0cEM3xxB1/7dh/+/vqwqGbV+DWbwiTwNOtScwf3I2YTmIy0iTAVE09
 DB1NbHfpa+PClzMJDlLBqFIuYv8AjmxvWP2LmLCIFX3ubl6TyJCOqkm0HIqlgu0PS4f9V1dguGh
 ZP3LoeYQYslWUMZiECg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX4CvX7zLvgtFl
 Qjp/XNQN8cRFMjRngTaTfNBIWNZ/3N0//PTq5BBxRmC7X35NnyYf2VcoNzqVT6dgTvbffCil3UD
 chJAANLk5Ti7xqhMoZjuEEC8kVInPSA=
X-Proofpoint-ORIG-GUID: wJAmRqO6kuVQjJNRMUqOHvi5P_lnVNst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123339_313046_E7184076 
X-CRM114-Status: GOOD (  15.99  )
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

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 006fa7b56727..f75a01f9104b 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.55.0


