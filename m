Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76935C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=OH7tehXPUJriDhuW2t3aoykeJF
	ZcrDyuaUnuinYLoHIGTsbnJGYWz8vn7qO47R8P6aqT3gmabQpLALopblYkSP9M1ag17PtHikgXa9D
	jHt1u64qff6bOtTPt3mX6pVZhMz8+iUxisFkBbAbTEeE5TVynYKeJt4aN91k6umlWdkwv6d5y1DmF
	DfSbHsRWMCMTFWaxF60F3EX6iyCKfpfbMdS1BVK/88pG/+A+BY3VDMoJKnXcQcgbk1jGoYgTbDsz3
	mVH2ZTWvovMPcpPo8vY2my2/vYZNIC9MHZD4gl9kqNfi0gfXYIeDpMLyqy1Ks9MNUOxFOjybprfFU
	hDWusvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFg-0000000FpFR-1EMo;
	Wed, 02 Sep 2026 20:08:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFd-0000000FpDu-3nqG
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0os2372714
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a791-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so25692115ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=kZxCaLzQ9Zfkx4Hj8SoHhI6V8N/6btb71FHuOAFSQTbjWjFK1qD76JbUtS4adjilfe
         +t72cWb/NAhy6QPMjpgvecgfl7V3HdQM9M+/sG756LyfX1eZD3AklSNDw4SH3SO8dQoZ
         qBvmKe9+54REC0thgYW9hLt7MDzQiw/jsn5Rjxg9/Dr5/dees7pG5JRyMFoqKS/QNY9N
         8v9hwZJ40cPngmRXdobNaxQpJWqn4P7Dm+Ox8gwKzlvrLX4etcF/706H4XXvh+dqP54q
         atUBUjshL5Dv4K+SYE8MnlMERwULgBGQ+Rwl2RGRCJMZXWkzb/CE5dM2RHGcbtUeY7et
         zAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=dRWF76SOP+BL0fbGHqYLIMu9Hf5pFFb+IxDblxi0SZ/3sRq8nz8/HMVopRd/h/aScB
         0AEoB6+Zy+NSoEpYO8eIs1Z2pb1XzxqpEKnYYrGH2LbLc5K6TbvvkJpQ0eUZ9+CLC+a9
         SmWo4GGjb1wemk5tXK7L3pD6Gl42wGsKUDRkNXVyNFwqkusccxAWyFMGFQjByG/iR3GV
         1Jsu1TSbkgsUxvT/U9REhatJFJ42ZjVwCg3uuMF0FQeYY03Tv7PpmZ4q3Jw0d3HkPeHo
         JNAGdJ5aGmVIhgHP1bufmcNj/48eqLRGb3sRuBQY9lu06U/4YaJ1fCIYk8o514JA5dmS
         Tbiw==
X-Forwarded-Encrypted: i=1; AKwUvBzcsZK1TdfDgl5h+rJ9U+shgrbeASVq5lC+d0t9gUCMv+e3O1+UFkYFtRJ2XgFUM20oIAjZwA1yFK0RxpeWyg==@lists.infradead.org
X-Gm-Message-State: AFuF++kbAmXP1d3w3PvDjMy+RX0oROvjc68d2KSOKn0Wl8JDknkHHxWZ
	oNUk57utvGhyKqLtyD4yPqZJilhrpgtmBIfQ5vv624c4mu+HWwX/HDIRi0dQIm9ESc1TIqcbxnh
	wpJUIqLn9RoqS7UNvxRa/bNeloz3QlAiRZQ761MIpg3WNzaljb8zCRE4awzmL4WdCKIB1vqSO/W
	c=
X-Gm-Gg: AYBFou1t/uckx3QZ1R5og8ttYBN+gvS3JyRTA5LDp/z+QjGl/pbKIVoYD0MXq8Sml8l
	UAnztCyyFFZ+AWKtBP4LLaffR78rCDy9YsTlZj5A9oN9C8Y5HXk3kSEpPUbq+FbiCBJW5KseIxj
	ClJ0ly+eq7AZ4Yg30kS+moJBC3Y0j7hqxEUHC+r/wU9MNMh2m5LOCmz/IHuUI3TCZOYaKBVNpXZ
	uutzzlcrorPK0TpmdbzgoaH6phF0BViUoz6SoIXhgd5tUD0hfQrDVx8pIvmk/UOazkBW4KR93v+
	eSywtHFMFNtuwMtU3CWcksqESkWVs49gg56r1WxspluC108y6ie8jXIb7Ve+a0QYKBmfFEJyVCu
	gd9u2t5ttH9r9uS6BsXcSYkLrciU=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445965ad.4.1788379683916;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8m2ZYAX4QH4XVMB5ZBqpv2VgP9mDBjmG
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7e8B1ZKRZgIR
 8dDqWTIrr75EcjMz+doRQGjHXDVVpS6bQJy0zUUIchGVXD/HEliQ8AlbEVeUzOfWf5bBY0QdnSs
 z3AfzY9qjsVH+FZZndlsjF/jQr0R/3C9oEVpPM4IGF46yT6ytg1Coj21Rgt9/iKG+ooqKZw7Xwe
 zXIisttKQXHI5aLK0/cBMKiQs86/nUOg4+hy+PkeAO7g11ivwEoioOMr6fRtywW1DWeHtJFcrRB
 hz8pF2gEtGvNiVupSJjqSX+mPJ26pe4ltRdoDJ2EaAoxJ6Gw7iElchiAROuUTlwsrkTT5etgDrV
 GKWyUOYcdvpZVRd5lH53pgBKKjuiBhY36kVAQX8gXIZw9XisNQTXygg0eVsT5urvzqd/RSvGbIE
 CyqtvbWqv0BV41TEL71O7G1nxRoHeu7baykrkL+ZJbvzlq7rWcaXWn17NhjfkuaO4hKD/iEdUIF
 eVYv3fzs78sF4HMhO4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXywJlaT1GU09I
 7zjmMwZIEvbCu4aeWfq47yqhDmtW6L8RJAKZDhntMLRtdj/GC39OYj+7VSfv5cJ+plhqoARYobC
 je0Q9bf4L40YrGsVvKTuPitdL5NlJOQ=
X-Proofpoint-ORIG-GUID: 8m2ZYAX4QH4XVMB5ZBqpv2VgP9mDBjmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130806_056080_EDB9476C 
X-CRM114-Status: GOOD (  15.89  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0


