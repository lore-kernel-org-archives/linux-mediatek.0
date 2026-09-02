Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642C6C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=X0VwPP0N2Jh5/Ch5aZE4jyTTPm
	SRy5EyEYj6/LEAwBJ1awcxhoyRnLa+wpox7nFRPiWo+RTflPkz+HB9ttUkdE/lUZ+YLvLvWmA92vj
	ZvsS1p+bA2X0nugdU29fdH56MoUBHGidUnQlElYPWtqzr9INuujjCha4Z+/TM8H7kGjZskcJEHV4Y
	0p7rQt2m+zx+qJT0K++3C0rSOt86ciCL+J0ULHNQKo75UHWX7Kmo9aW9bgZqQ+YVlvjE5FrWyMPx2
	HyHxnM6bY3tlB0Aq5CxpSkUWkDm+LEPNAOpCiievihEIEuHtTPZcaVgrx2SHGQkXQWqhREqYJO05M
	8LHcfAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFW-0000000FpAT-0v57;
	Wed, 02 Sep 2026 20:07:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFS-0000000Fp8F-42vi
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqsHO3377582
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhfxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94a158dc8so23346715ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=ReBEtpx2fKX9BIuYOw0sj1sDh37Cy8Ik+MpiJDmATpoGvIcL4bQ9FwVHYTa5FJs2+X
         +FO1DtzQTJR8xVQ7hK5DGjdg3uR3tGG4v6X+VrH/cI77NcEpecpnZnfghtIqefxmAgKF
         zITCuL62IJ1Z9IAn4JfIA+AO3GZr36G8xU+JglAmeZAd0tziHsRdGkoIRC6BXigBbKof
         j+tm6950e48b1+QAhcd3v0FH1A0Uhsp2une/8PrlO3CwEBLmh4BklLTonDY8t0Vi8ruG
         lLLjgYNOZ3Wm44kyTt+NBOzP2fO1AR7cxDR6yW67quJSLXCN1ZMSyc8h/g90q4ecvDd4
         wtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=h/D8YDydBIzuk7dmxh2Cry2hH2L6XSciVSFjMBCqtGI7l6639tLmRFNG7CElvKc30N
         +a1SBCi5VFETjIur6aQRMpc6Uuzq5Xl9zdAqMHHP9FaxcUlK5kvCBllNDQDdGHA/ZXAF
         BxIf+8vnXzAXhavDgVt4eQUQjHbIX4PuItjptLw9tgJXXa9o19WwzssS8dxHzhGt+YrU
         eIuul9OmI4MBbT2TxQkyrFa201aUUa6Nt1hocG7IUkPnwkuY4ORUKFVdv2O6adNRhEZb
         EgOauM2ELvQwF/FAzV75kQNz6I3VFvIYIGK/gs/SfLwSLxgr/e4HsccjuzQT2MEpU9EC
         iJhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOO6SIOiaBHxFVXZ2a2oBmqw1NwASTSAumOKKCeSNk6MNGz4rlSbCLhHKOvgc65YlfY4NTb8GUOjyatUoYhw==@lists.infradead.org
X-Gm-Message-State: AFuF++k2j9fJiMxgPP7XSmESbDqhBWdguPJljkc2RzHoOxaVpTth2Xaa
	bw5/goxcvxUgQ5Ak6J7N2bY5ohoDbV7JcipPmK1yMnsbhZMoZweMzwKPz5uf/OMo9HMW1iAbbrJ
	T/iVDtfwKu+BFIyYdASTQ1FGe+dcJvsI1Lw49NAkM9tcsFZrUxyc/oytR7TJZP6eqeUQa0kkos7
	M=
X-Gm-Gg: AYBFou1m3+T8Z0bVn1LV2kCS4n/HWn8hejzupJtS+mJplubh5MFRTVLv10Rl8L+ZAzE
	1GCCuIuSjN5ZsihPCtJ0Vfz2988uwwjp2XYD1pDGgs+TYj149YOl+3gOlwiMvUofCf5ytSuA1ur
	7ErnCL46TzNx4QHGUbOV30ghWGNNXR1zMi5Xsv+nSYo/zFpGQdD46zuAXQNcvR8n/dgSmVHtJCJ
	tAOtPvONszUqiQd8SZSWo2S+GOImnfsaliq3v69t732xQkUHXwRCW7KXgn27nBB2CcGrOCrkaOI
	HJqOdR2HYVTm0MYINWIcWDypsT8c6nvGvisXq9mSE6x/5o/7uu5VKIkcGLsSTpMtb2tUOXN4jQI
	ilPn+dAoma3OD9ay1AxhYnqTMeME=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505675ad.19.1788379673742;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K1xtlgF2Aq4UcXTQQuVsoD2R38AytlPn
X-Proofpoint-ORIG-GUID: K1xtlgF2Aq4UcXTQQuVsoD2R38AytlPn
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXx/NBim6eym1p
 BDHP7bHmy/sHTL4+WBnZoFbHBLwMW/T8nh/VPHLadx2B6mcBWNspXAK2BmQFAqVEWxBrrn2om/g
 XrH3OfF/TvvWI3PQN3QAVEAnekG73Ezm9O2APTabiIdE/E4cLywsHtvTPyq8AdEQwtdnvgmFgMi
 9DqYdJ0swIYxIkLBj/jvh+6XuawxsQzzXVSWBbS0gOlKxYFSkzCXFCnzci4dJ7LcohrUo5iTYWr
 WNS5uUguyGSyQKHBTO5BEU6/28UK/sFYlr8gDIi5jSgktkv1BSe8nNpl7giK+VuxvWJcixWfJDZ
 7R+d7dHzRnfzGkyAOxkf/l8yRyZ8f+pDXbJxC39c+b0+Vmw2psm0BL3a2JPMjCczSPauojdkbMx
 G6xCj6N3NsKJ5+i3ATI1YcyKvUJkORNQpwpFK6nUnhKDDFdlDgcBfgAfEnYiys0vSyyy1WvA+Lg
 eenjghgUbI4q3WokVig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXzDmaEBZ0b/2r
 vSKJ8/V/tPfNsV/BJVpyAuyZP07Qnho3qk+hhx23MLlb10rzrjwj4GyTGWKdsT6aBjqTRbYHWgD
 DNCapEWC7e9Ugst3PWwh78eStflsu7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130755_004033_50D93CA4 
X-CRM114-Status: GOOD (  15.90  )
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
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0


