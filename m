Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D50C25B76
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=536ZuBV5Xko30Q9QMlfsPn5bbVS/iTQ4a8HbJhBdSFI=; b=DwiDPVX0w0j15bJIIjSXHsHObK
	Os3ZJRUsQKrETWPKXsek5XR9ftfOCZEbxKTH1dc5M1eHnSrGYJymK1BYKKSNQ5BJ8KeZQ8F9FyoC8
	xX6lGNd8jDNGNlB/uNcX7Whk3He6k7UWRQfGTq0M4VAeCA9OGHRVReQhkSTPxquq4Kd3KWl9tv10H
	5PKoB4hy8UK/lU0HCzsnLQNA2OwWK/r95/UyXBZ2qoGulyaS1k58TLMD1Vk+xdSn56KEhSGM/b7aR
	w43tpADkW+09B+/UjnY8/MUXHkfgqMUvxqDPGGgTGhlVd/HZuoPDfhQ1jNioeAaBtQ0x0rbCRF7DG
	Mt5e495Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFyyr-00000000LHA-2JUn;
	Sat, 08 Jun 2024 16:31:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFyyn-00000000LGe-3YLy;
	Sat, 08 Jun 2024 16:31:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458FkEHQ020933;
	Sat, 8 Jun 2024 16:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=536ZuBV5Xko30Q9QMlfsPn
	5bbVS/iTQ4a8HbJhBdSFI=; b=HNaoG582wKFtHPPjR/c2amJbmbFW02g5F18ybt
	4JZKO4mSYkPEXG0zX5U5NyCJF27w7dGkpZj5lcOqvXg6Ja+QRu3ZAen/+lkryHuZ
	0t+2NURJx7LVWDwLJIy01mj1Lds+AzzJfjfvFlbNS3l6JYJ67DW9biFCeX1EeKZc
	k4W+F+pw33pTfuOxuwyxg3R/aLNkjDUNkhGsJUQThxBO3JzJZVqMH9ctC8soMOP6
	SdQ0g5oKO+okI/zT0RoxsCMtwbGloDBECxsIhu1OG2e2CNmd4mh9IU0wWPfeTzVA
	hzxHBbPqg9FfOScyrbwCJc9jlOjU1FNqJKIY8yi05b/e23RA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8rn07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 16:31:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 458GVeI8018130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Jun 2024 16:31:40 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Jun 2024
 09:31:40 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 8 Jun 2024 09:31:35 -0700
Subject: [PATCH] mailbox: mtk-cmdq: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240608-md-drivers-mailbox-v1-1-6ce5d6f924ad@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGaHZGYC/x3MTQqDMBBA4avIrDsQf5DSq5QuksykDmgsM60Ex
 Ls3uvwW7+1grMIGj2YH5U1M1lzR3hqIk89vRqFq6Fw3uNHdcSEklY3VcPEyh7VgH6lvE6U4hBF
 q+FFOUq7p81UdvDEG9TlO52qW/Cs1ti8rHMcffDtjaYMAAAA=
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        "Jeff Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sgnuojmQtyHcFGj8RcGnPU-sjzXGdcTN
X-Proofpoint-ORIG-GUID: sgnuojmQtyHcFGj8RcGnPU-sjzXGdcTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_10,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406080125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_093145_934616_D0474AD9 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4aa394e91109..8247584bcbeb 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -790,4 +790,5 @@ static void __exit cmdq_drv_exit(void)
 subsys_initcall(cmdq_drv_init);
 module_exit(cmdq_drv_exit);
 
+MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240608-md-drivers-mailbox-3cd31fdfc4b6


