Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C972C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=C29CvmJ86Cz68tHqrsty/fAp/Q
	B58n4wl22iuw3klLc9W10mdWHhIgeip3mjrVT+3EQ47HOE7MhUVsQK/wRFN8ZkD+bFqFD+Ab6Il7y
	ihpct0aX8oxUZb5LEscK0MGRjG+8lgmAinpR3vUzskHPz5k/yUJuTUrYrFvHhBuGdgo3W4O2jnpEv
	/9WLRyF9CT4lp2l73nKdz7J8hD+oc2NF49UotKhbRqyKyHt4GhFrUbtgzpoWH0ZUVFl6EKL46XvDw
	aPUER8TJeUEo7ThGt9Ka5IRTlKsqfWyCcUjs1HeUZMWtWuw0GL2WWU+zIlnmzDFvPjxRi7q4EsuLH
	N/NLBTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiZ-0000000FiWk-1mtw;
	Wed, 02 Sep 2026 19:33:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiR-0000000FiOc-42se
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrZCv2483918
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cozdIoP5Yma
	6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=QgD99kG0wNh+lPLXjVw0AF8oQHC
	bbrXfNjcM36t7K13gEgas+IHgz/ipLijzu7HwowfH0fez9Uy+9ZbNZf8hmitV5ZV
	4DtmTL4/rV3Y0lsK9gitYztOl6b+6zozAqCjcA0lccusbv8QwBwdczkzFf5NPUcq
	TayVFZVN7X5UuqBkswz0f35DIUFfFjVCdyrO4pmbKxIXiZbOo2FiJZWiBaKouhUl
	Ez+Qq2/BNBOqOTxKHrRvY7IUphHTanNYkgvzfpAUJ5gzGLcv763/YiPPsmdOKCi9
	/zovSKs3FM8OymU9PjQEJsVlrZdAnYceZXH0JZcj2S523Y1xhe2wh+zJQxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9jwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so3465161a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377626; x=1788982426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=brDdw3m8J+8ovZaDVyaihBamDpufs2hz+Ju8AhLZOjCTyHPr1+h8vDGrsfDGlcFttZ
         rePIyni3RYsB5DIdbjxBY2DTD73G91SA/HFKSP4JK63uHQkPNhSYwQEMDeuM5bEGtU4r
         S+DEhqIVrvPZ1XGVh35NnE+WS4xn77SUSA0Hr4YnHdWc8a5jS32EnwjHeB3fgXE/8A1y
         xeAo/MrkmWB5/U+0wDe7ddLy02I9IajQ94ZTzaRth/zM8ZuU6T3WCeq9rdqp2Gjrp+2Q
         2Y8LqNF+lQt8/6fXvuPrW+VX11ZQdT+dWItlVZ4ADJpMcCgHf/LB7uuI2Aqtl+Gsq7gn
         ztYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377626; x=1788982426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=cVHScbuILnOTVuEeX4dPA+/NkMRl4hCy8stqK1NpmJZdzb8wP3B2G/91f1qNoy6Nfl
         jGtWVt3NK2jNYaKawNpI1U8doFq5rcErPI1UUdxGaS1YEcRJ51bxHBh3obqHmT7il79p
         r6VbWjlDQ0TKGTYq8WXNs5CvoANNI21mLoCgkucHU5jDk98b5ypzbNNy2A1I3AYNyK2/
         SiS5ehq+tR91U3Nazdg3egYKs5kVLDUWbBk5o0dfas/CprvAixjC1xa1afNTid/ROPpP
         59PzmnQW6g3ZqHvVHWqInjPmjfQQmf4RHAG4rCBET40w/bKIPggHkLEE7koopPJ4U40i
         MvrA==
X-Forwarded-Encrypted: i=1; AKwUvBxkWRsUyM5U6GjaqH9842xJG88W/g+pNLYfKy32k/SV4D5Z2jw6tXFvQR+B+aQW+wZJHEgWx7uoCeXmD8NNcA==@lists.infradead.org
X-Gm-Message-State: AFuF++lbE+6yNiZoccIAqIoFcHim+YAXi8jT5lRG7t6aOYP2/DNc9ElD
	mJaUW8a8tTWN4myvzGB4TyQwFreah39V8PNU/aNAX5ImvDp6UUsemUSBjKTqzo/rAJlhpOWyfAz
	EzrW+gI7TboEjCsqJ/2cbc0XR61AWWtw2go4lR0+KVznS6nLSPsWIHSf/xZUnB36aJV7pwvlEEf
	0=
X-Gm-Gg: AYBFou3S62axd6UTDl8xJsepmTQdq+9W/+p9pEkUhjNDenT4HalcxhsOttPu0+Xgyiq
	fksv0Ds2YC8+WAQMzc7zKiLv7Z1rLvVrKLWAIhhXjnKU5Av2rj9vbbCYGM0H3wCuG3HqY3e/Tix
	WKistxzege/P7BWBsWt9p4CfBfvq6PLzFtEkm5LoH5x1449ZVtXB/h9nzpbm11V76l4ExdAYao1
	p2Zou3H+H+Mce6YdfM4EbWKGeunjVsz3GNcA34G3kq5xktHecNqj3ck3ns4yJwtOiZ2jYb9O9zy
	jfyA3oMuIgTi8EueEZi1KEib3aWU1AuURbAX2oPmP8P+5HK1RtY34F0eA5AJnwVsYHFj7bijtNK
	UqMgvPj3L0lzWmkXEJj6rRXsHnBY=
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809909a91.25.1788377625934;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809857a91.25.1788377625511;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:17 +0530
Message-ID: <20260902193318.1996827-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4X36QBjaWovejRR7gfvBGtSn8t0NXV5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX8bbL7YJfjjQj
 7sJRbQlz4m67aQVdd2n5EIFHkZoX/n9b4JEaEHO1lXEvVzsxlcokgTpjdrZR5xWRhQk6OxoTuQy
 D0fG9A6t7NL/MYKH3Q+7uxnHfugf1o9YqvXp1HoksB5ilAw+oaycxeLBdlor5+zqteUw6Wk2y3v
 z9eASuXjp9lqOWl5JbDimq/xK+hL9imuJfAwLpkJwx3sUfOfxuRePrPghdFd3czcHZ4Aj7jNYIZ
 7F5dKm0vykyHaWvvRmffXaTYlxJmDob4JQdOaGQ9b1lYW648iLBdQtfbgLxA/rLHKI9TqYWoudt
 d4DiqAup2fGSNzXUfOeKnogHD97hHkecdb9IRyFwZl7UX0qYqHT1GOm+rmBGnmsP7N69/9V+98C
 oQx6SZ+N5h115nri2WnvWJQCT9LGuH54ZloBIWvHAibMjuh0K5sZIKY9nZqjk73TdOrhJEjn1AV
 CtMdWPirNaS1O5YKI+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX1Jt1LGhAmH8M
 XY31Wjs3LLOzavAafu8pK4eZfsLvnef+n3JKpsSX32VvyEbzWHOa61YYcYvUttWORRIjxluIsQO
 iw4iiwn+YR+9c0ora0e7xy4nlDyPZlI=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987a1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4X36QBjaWovejRR7gfvBGtSn8t0NXV5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123349_371161_B6CCF658 
X-CRM114-Status: GOOD (  15.59  )
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

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9751acc2bf83..2a6c286b86a7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1034,7 +1034,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1067,7 +1067,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.55.0


