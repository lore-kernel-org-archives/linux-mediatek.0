Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6175BC61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=283z1e1z3se7JPGQ9EXSwd95fy
	LG5p+9Jl/qD+bGe1XnlNqF97WAdVbmxHP6BjjKRnFHB5J3Gt8tr3mdeFG3syJHjInxhc5Ax4/DDXp
	se5M/5iTtttZZVKyvzCqHqkjS5ttfAbzcYfmJvLccsUhXTlQO9SiHDwvpE6E0CXBUD9qdvn8bpznj
	F4YcPXM74eVHNHG0YX5kVIWlQS+lroXAIg/p29QNpP4wPLe+oBoclzxi8FOfy5FezWHfkIbbmX/6c
	Vge1KsUmHggzuw17sPe8BwXmsV9PM4t2LjhdNJB6teMIfirM6gvwnwGIBe3TZdJ+9Y+JKXgwlpBDk
	+/V7/V2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiT-0000000FiQr-2y0F;
	Wed, 02 Sep 2026 19:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qiL-0000000FiLJ-1br8
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:33:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr1Rg2372725
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 19:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zozg2cEJHYL
	XQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=DLFKLOo0q26OrbncUQUU88QZG2W
	y3M+K5gS1al2wODWXNVz4vP1N0nWAqJzrc7fzDguo+yXsSFRhi6aJmkT1y+AEWyw
	xypvzrLlGH05FLzvt1UvLZyMPXRWx0ulU6lUFw6aO2FrDgptM29iZMHmr7MJi0EY
	JB7BrzFvVvxsmUAd44/Wor8bCUECxMXot+QtC3u1MY5rfG7JvOSSGFyVUTIeVeT3
	Ki8+wfnvxqid5Iy3PGrxwfj+9FT2EYxyTGklHG7K/2hUYRk/ZpCSAxsJhSjNnzQ/
	4dzW+7dK4hHzwD/4w2WP0daoGEddQXApyIcZLqeJRwOoOZEleTlodfSkuqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a3uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 19:33:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso208660a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377619; x=1788982419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=NMReCdT13iinUC9QwEPmRRIdXMqyycfXarcLQ0hAMJRNbWP1Vt6bDIxQ3rcCY0dqmP
         SvGCesuubnUF92kwa35rsI1g8WnsrBNUBbRR4f662G7RAMJoZkhTsAy+EztE8agYMWRt
         HKMLmYxaftDLR80jbZKS8P7oDkJJm8XRlrq7KbWhjmSAQQZXxXAZHG/w/Itk/Kop5KyF
         xuYuVfSzGSqu/gSXUPH8ElPBClfyQFmhZjKaseAz5OufMPqCvXdCOMjzjV7vYp2mYoAK
         ToW1HXeynCUcHuVrUbFwUnm2PskjVjg/Qb73FsT8MVy7MCa7jn1K42GYnQwBTfLKqaxt
         nDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377619; x=1788982419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=C/1xbIsCFh8j22jfC9hd8lg55YIiGbyC1rA6w2TcLo7r+AO5HdbQnCNvhFSlNzGhfv
         4uptxFaWa/A121Qwk2Fkvg3G65iRfnXQ3lyusZwLri51XfpjHtVbAP4oDgJMYQWhS0iG
         V7HYVaYdGes6LFiVa8el8WNZVXT4u27A5DHWv1Y8WCAPJeCbVpkQ2vkPk/Td/l+sLN//
         bwAuLkrqO8FyZdQcTtDj+Cbp96yyYpdTZU40GoNY5ElSRJ4DqqrDX/5jPxR8J0fu8jQz
         5rbAnPNRumFe/pixci7pQerQcptY5EdBrt/0do4ojYIMgaBEhqtOY2zQT14umL+yA4So
         SpHA==
X-Forwarded-Encrypted: i=1; AKwUvBzEzuoVQ2iB7fyPWiT4kfGB6Hd5+jgrN99ZDTQ6pYBNCZvQpUY0SnsiQr4G45pU0g+Wet413/bXv5zILc0+/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++k4n9kgoVCqJlRHi9Cd8/h9Rm4ONDoSm4vr25rEV/G+1DwSbl0N
	pzd75Ov8gfI9bujLVBcZrJ1yvxmhj3WrjNtug4lYq2QVt3/TKwYZX/o+8bdT/gxK9aWLCEidGcx
	sGU7LphvQyQNWzV09RzZ+Mzy5rtMdF/G629eZ9UbdCQYlyXI/Yz1N0hDvst+D7+InGy4D/ovR+X
	k=
X-Gm-Gg: AYBFou01EOpGiMbyJ/inmmWd4IFXjIAIz98Z05+zL+yCARnF65mZMx4FYgIIic1xbzb
	qnv24jqeS+91foCPo/uyWgNpP/f5yAo5tGFKByQqJFWImSFBEsutS8rBX6JJYtfQ2FySMS9cP6Q
	6lvlzE8v+VwVV2ddSox/XrePH6SlTSGk4sziOdoVWBBWf7VyLCh+BLQwnAkmmgeV7uRnJBKpYRI
	481N34UHm27g+aSvf13FiDq3PMvLgxlEPIiD1eGKfoDzLAgFQi51/097MNKDF7skgs60aMopxYO
	DQAzWP6MTfw/QcvmqMggvKSKWK/acyCGa502UC0F7lOc/FR1u+qbuy8XmkcjvJPt/8ZhmArDW17
	J258fEbug3dRbzlKeyjxmNR1Mvnk=
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404421a91.30.1788377619317;
        Wed, 02 Sep 2026 12:33:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404366a91.30.1788377618602;
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/5] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:15 +0530
Message-ID: <20260902193318.1996827-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WuzfebFhr85ztZfqSwmGRICGguPJNNV1
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a987a14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxCuMH12fW+/G
 elBlwtPWvz2flikxkWHvTIFOTXod4sJdU6svx0+6+826Ul2/a+k0Fj8NQ6u5b5BwXlLaBAEnS9n
 Fb2RgzSIEDwCmhp7gbCuBji2Rcr15Kbea3FTw1pWc/7jAlcBpUlkItvdJTmfkI2RtwZ/TRJ69GP
 5TYc7xa0kQOm0RwTtHorLahE0PFp05oE/RQBxhLGjhjMtIxk+YXbK3bHXevXHxhg8GMfA8uPPIb
 LHEtliISvF3at9pbIEYWRLFH3mj8twC2gldvu4ZMdaGxtfqc+ulVEUq8YyUd7CKqn5O7IK3R1HZ
 8dRRWV3Zef3pY1KVLZzYnoV9YGWUYYQzHKvzedQkJWrJU/6JavvR77R/kTyWr6mZG8ymd1I4kNy
 2X6bepwh8T+WOVWuoSnMCaV2wLsjYfQVLzdfSi12hFx53ZX11HZkA2y0RWA3f+9muW40HCSUxV9
 I05QrvelFi52Ec5Jh/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX9ym+d6JI6Sw/
 bBlA+W3TZ5auWTaLtBWqfITWztKvxpLakAF6j6MiQIMGB9zL8n4ZMr2pNb11wskAniV+VFJeKw+
 eK3dr5M1ywymDctH85KybGFyF4Ui4U4=
X-Proofpoint-ORIG-GUID: WuzfebFhr85ztZfqSwmGRICGguPJNNV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123343_391865_76044D39 
X-CRM114-Status: GOOD (  16.18  )
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

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 407d6034f748..d390f56b4994 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.55.0


