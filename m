Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2470DC624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=UDRtlAoDcy6nICIXsyDthzA6HQ
	R9EtsrAwxj1RhOiqVZL5YLcm+dXVT3T/gbHUz/JCpx9j07Y2t/DIvC6zQEmxl5MukJ04hfMoIf0Zx
	n4P0yXGoYBE3L96Xf1TCRxFJRBp47l/rxn0/bi2PRCRMZiimtPPVcdSoI3SSDkdMpu70Kxhl7fSA3
	Icn2p1i7gwxi0+L4zs0yxB2jyS2XPdTIUejczZ9NKwkh8kJZUGJDF5UQfskAbWQKoJ0KnC5blCoWU
	VvvI6kXLPp8oTmhXswaoYnD2EtsLSgwDx1mXa7IP1NsO/Q3Dg+q3yK/BeOb4pX3oQ2j2bEH6PBW2T
	tVi4vB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFM-0000000Fp43-44Ol;
	Wed, 02 Sep 2026 20:07:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFJ-0000000Fp1w-3FNm
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:07:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrXHg2483839
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9p8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2902487a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=Xfw5k3XmK054kpFid9USan1OUzOJ8A3NilLDSA4usVsU16hnWANRhVMPibtsU8MCAg
         fNXQy43hsPMHGnW7AfA5LX1qYE8h+XUFcrKjzi4WpCInAYw000SqLziGoyus79vrYElT
         fFLxDJi3ElM8xwLCtFxTuuVza72tex97wtS54wSoGf3YPeEwQqXHFvSKqtXKH/Px8UfC
         ik5lhm3mQuJ+0BA16q2mt0zU4T8CtXcpV/pR6rsl0OJM69ALPvp1es2xYNWNVM6asyfK
         MCS8R7GVznxZ+eaNAa0wincjTlxvJD/hlw/3O3iq5VvdkJ3ot+dQeNfakZHAVU9EBtrr
         CdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=Ue+L2cMOEov5DDhW+bAfu6T5W+Sid0ZxeP1cR9vjVDrbu3vln0nTaC2k6OXmS5wIu6
         hbFkUZhw+hRph4hv5mTap/4MOKtaj5c/A8JB+0+t4/Y7RGvT8XsFLKfFPfci8qhjUuGk
         fo7E/UkW5WzR8GTkAMW8a6TYiG4hMfvVPhWa8DaTZlQ6jyGWB2kLw8vDj2BQQVgtIVT8
         G2dYV3R83liJjPyPK1UOy268Ju0HvnKJfPWrs64OmKe0CKOYZFFkZlkY0k4A6Kr+YRU1
         k6Qln4Jm3EO4FF5x+5DGJqFbkNmpZi/2oYTgMKLyyd7i5GtdWal0zTy0TtimpVKNT6gg
         OUJA==
X-Forwarded-Encrypted: i=1; AKwUvBzOV3P3b9Sf1RhOqLKw0D4MEJpiGRlIPLZjO2gRW1FAtReOrkKX/Lv75mY4W+5c/hvrRoD6s7XzuVCmVwh3Mg==@lists.infradead.org
X-Gm-Message-State: AFuF++mw+mHoo8q7pPdF4wTPKHd293r9kjIf1NkkopzRc3lx2yqO+isu
	nZPwFGF4h3GfPDsiei7IZzsHnGJQIhcbKdxTvBGSDdE2IPCc0J2EFHI9tTdfrWLs6V4FmTlHNC0
	5rbabyOlPTSNFqrv+6zvCf3AtBkVsYz/3ASbJFkr0CS2FC+RYGB/A2Nj8Z9vsgEUXufyNZyFvD3
	U=
X-Gm-Gg: AYBFou3i/19pVaWZZ/f061qLCrCh76C8TLsCF5wrxb7zY38wQXKIiHRMJxVbpOdzJLi
	SwtPHMnPR/aWZgg7iOyK0Jy1r9FDP86FV60+nFhU9e4z32Tf+bldUxUKNi8kHCZ27JGXkw7EAbS
	fDk177aEarO4gxVflQvuoN9Elp/N5nqsJXl4nbeQHqHSZsiB5Sd3p5voIpFAri1q0Rx9x16R50H
	XW25YrsWhtlJ2vlPtAvMwk05Z1sWIJzks4wboEGTb4Fx425179AsrBXRPinL6CtSd1QgNjwk/nM
	1GjzyzwmBZioxiL4nEpxvKNxEZ2yFyvGwEHzZsRjEycITqh7oi/CgcmdRHsKfAWKTXAHb4/Zp/G
	WBu210FKndcWSSIiLUdSyPycqtHU=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639280a91.7.1788379663613;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
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
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NW_bm-hj5pO0c4IlODboH80rbC2JqMbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXzIByDSg6lUj0
 jwTb3S1YJNPS/vnVywhf1z6tPeJ7YTbYdMPBgyL8ti71H1I6TQ/qEi/SCp0Xh4jTN8J78mMzn3W
 o4mFDLxmCTJn6gmYb4OLBDHnk9+UF8pWpJEwSZ4cBJLIdlI/tk3xiUKC9VRyY1t4JfgCtD1RjQg
 Mz4Q7OS8uo3M43D7+9engpFhZbqhABThwZxbBBn2VhDT6eOKQ50PiTpJJJS7+eQEF3tmDnc52I6
 +RZOFfpaivsrEXFqq68QmvRqKEeIDRrQp2lOU9VAg1hN06AuFPQoonyW7nJyUcF7IgI3GNoZuTb
 ajGiJcvS9FLgfzLsCI3hmKc/y/FBYFY8rTUoyGoDRO9OElFFuxu/zbUu5qu0feh6YP+gqoruyny
 Lxq+Dbt0v+NvKHx3KQuKVTop8pV4NmganN0yGfcpPBsmkVhCUzOsP0M2kAwHkvThgPuv+odcztO
 XcES4cqzEMCkTdRvJMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX0mUb6+11IXRu
 MLhSJ4HFBpngbzLNGFzOc3tnyVrZ8TEyoSb7UtmU7nKd9FavwilfgxuNBruuPGALsKjH3nq5Sn5
 nE0kdF9w0UTHkHTEl8NWajVuHCru8dQ=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: NW_bm-hj5pO0c4IlODboH80rbC2JqMbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130745_922949_76C46091 
X-CRM114-Status: GOOD (  17.25  )
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
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.55.0


