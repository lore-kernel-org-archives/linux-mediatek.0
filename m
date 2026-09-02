Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86428C61DD6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=PQzEOa6uwGjjCnMqFRzXEE2FxW
	2vRnJn9SLROrr312SIubW7DQ3GJiBM5d6DPW2M/vMYdsxvsFR4/Dr5JqMzFfLTRBkCydFofM59rvQ
	k59gbSU2CAVXyVtyoU/2qmIJFwuCBM1WGqZFi4uwjtrE+cBKgk76fKVtroGXXqwCN3s2yylaiqDRp
	2Cpi68aq+jfjbgOZMxHqrBmyouXqoKxelnIfI3pjerm4q+6SNa8pzRrcJXQz2WqOc+MCMmxOjgyjB
	LTSmJsCLZOxrlXtCLCWAcTrY4AqalNCa6mYQLvsOWe7YbHnBLj0bUT/7t9vq2Wc0lq6JV7asL6rYt
	mN9qRYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFs-0000000FpMx-2GqL;
	Wed, 02 Sep 2026 20:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rFo-0000000FpKO-1Dhe
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 20:08:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsJ1T2732010
	for <linux-mediatek@lists.infradead.org>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2s78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2182311a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=QPt1cDRnq88u2bLOG7C9GYiYbG0TcrvdhboGhBjFptQAU00ljILgqmaid6A9BJ37dU
         oNBGrJe/zvXO1yQDzHrJt5WO+PjYJ17QZ4F7U0dKOwfdrAb4S8Q6IOTZ0ULeW+aBdPJV
         cU421jdc+PrpSArmhsiBjM3f8ky68yU0xlBdPegaq3acOKpGcrDwLB53ivBUg6nQn2Fh
         wMwdFabNJOwVMIetcEag0n0VKjwvWh9nicTD6Wuq7bjGVx/Gjfk175TzfcOSo29/mfcs
         ep/uWXtBGfd58gRUYXK1y/57dSNhrpqhF58JgzpqH53610CbbztwxioTxJDru/NJSfOt
         F32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=Q7lOoqO+ClAv4e7wnOoF/bBPRgd9A6/WJVwSSTlHbbO2ErAmL8HkjrGeetf2jzhqom
         f2uHXAR9HSaLdd98PHfOdYTCcmXi0kKQuZk2KsNrgKOkEFgh1hBdPbCPwikKKxRIpQEt
         W6zv7T0lNbK4m0O4ofXo0lgJJ7eCmd8FMC9PXtjDusPr+y/KEPlgHyp74By30AQLxJT4
         bXONNdOsHIPMQn/bjaZN4tN/Lgw2OxixZJ6frSEkjFXNNfjX0bzOC7+tmJLA5PgGiglF
         3yYyjWW0IEXDkKldgr8+ZUYExH0vJMnMbxZTBkCEjTk4uVCm+/h6vyuC9rs7BYccyZWb
         0bfw==
X-Forwarded-Encrypted: i=1; AKwUvBwpgdXnUl1BDW4UgBtI2CM/YFkqrpg+fiyNFYwVZQgEuiCiJ93MXxpUe+bjNtmu4rmkcww0DcspLfNzV3xDog==@lists.infradead.org
X-Gm-Message-State: AFuF++k1r5kULqsc2j2M+I/RpYH0E8+BzNnmLM0zE3h0j+jQDomBspUZ
	epj/galqh1VPJbjDH0MrvoMcHociMh6LW/NNJJ+ROiYzXE3a/WVhhxP+ZhDl2y0QRSfsn8AXKLU
	yS+c1rMoifz6FShXR9NelKBAjC9v6tqIVk2syK7RPSo0mM76OEbxfyXT7QX52lC/MRLCHweaF2/
	I=
X-Gm-Gg: AYBFou2Xz76jMBR9M5AMw3/ljfVM+nEx4XDnXRDfU5b1ek0ci5zw8rkLfH/TSQIc/2W
	MM6x9u6w/7n75bcEe3jxVTt48yp5zQ3PQdPVx1cVZOpbE4YwWziRIysN0TpBWY5SC1vsOBYqiGV
	wQHR08PzO961BwZt2L+R88JUgwOyj8dnBBbfQZabC4WWJv8Fg0AedZDrfrbydpJvPmtACDQLRju
	mfS8a8r7b8kIZNEJ6aPymCH5FXF44NjNYJO7Aqa1ygnYO48LuBVcYeO8XefKEtyxkdVHtZtjNLL
	SkcOkqZrtT4C3c8ioVPcCYBmqoJaSKXwzPrH647Or1TixcYxdppw2rIF0vKg2TCiKyoQ4CM6pfS
	Z4X7rgEmWGiVCv2uQRdvK3sofveI=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811225a91.3.1788379694170;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
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
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pnR-5Sksp6CLK7SOnsZVE0iDpDusdLTg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX0P21ZCH7+mNC
 W4sPtxsYZgSTODS/upAkZXyjMU7yiI/XlRuQ+lZHu1QaraK4yu7JKJEMYWEF+kqxTcVDYhb4imi
 3to9wLyPASYME6EgHSYOi7xv+ePQkcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX1KCSez5TdknP
 PxKiwuL3bnzOHdH3nQNlfoaqm7yTTCPWKsMsboCMuaiyI78ePpCI6hQv3D+Mb7zIg3oXFvE/w6g
 cTX5XmeROUkU0KGh25seDIxRM9s/R0USnqyXwZe+lC+mvgrZiKUpIgJ4Pd61mkHjwmEaKVxl2E+
 DSK5fofbEnv/ASB+63Mg4rOYZjLVix+ScyJsVRrqOV91JKMHNFW7a9vkUSFBPoqzO53TfNdOK5W
 VtgWEd+jOJQf3G8NxHnq8Cuggiw6RSwuYQqHrwvY+63EVIlDCz+DAuUHX2DcLi2v+NPU4dpjl10
 wNFtGkLtE3zRBXkru8o/QGLuf3ctS6rRGB3dAjzA4ahrt9LOiYbp22E6Xg8MgMUjq28ST+rC3uX
 SuVRX2NHvnQ6Qt8wdbHZh/KXhEJ253oWhuScNV8IwSHAfRs25T4sxs8qyhdw/R796LcAisSWmDv
 s0FIh1At0PZboldgELQ==
X-Proofpoint-ORIG-GUID: pnR-5Sksp6CLK7SOnsZVE0iDpDusdLTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_130816_451996_9C0C9062 
X-CRM114-Status: GOOD (  15.09  )
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
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0


