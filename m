Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E06FC5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i/6eJM3fOsriNYf7PCVpfDjiGc5hnm60G2hUzvC/N6I=; b=ZlE9vcrzSeEDO4n++FtCn4mOn9
	RtqqwfzR6JYHnztmxjHC49cJMc6hshExgDbKq3/iPodkS3W54Gd44+LJj71bNb4bnR+Cy1CQAPo1g
	dKvn5F49opmMLPsR05OA1KiJp9fqqdqQrqLVYMknJqOfFnStnC9Y5Z8UK+3ddqT1N53SXhbtly94r
	KWqIV8vBiQiH6ODc48s42/anwvsd8WStJRHFjOqckoIYt2tR9GvMNXDIoZb0wTMh6BQyY75+cnnvn
	kCuXjgBYQbDts7i/4tkP1QekJbuv+NBETUZBEJzYx+AbfzqL0vi8El/BxnSDFIW02R0e/zCASSZM+
	mBwkw+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjxS-0000000EC0z-3Y80;
	Thu, 14 Mar 2024 12:13:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjxO-0000000EC0F-1VOQ;
	Thu, 14 Mar 2024 12:13:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42E9Mwas025880;
	Thu, 14 Mar 2024 12:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=i/6eJM3fOsriNYf7PCVpfDjiGc5hnm60G2hUzvC/N6I=; b=Z3
	go+nSUMEy+ifZFMzTHvBm3U7UubnuJkH2aD08XDdfLhIgyqOJJV59W50cvPvHyj0
	pf1rm1W/BmQ+VLuqlLvGXjHclrDQ2w2IUo7rh68lqzvSnd8XUFwuSm4mn+eAmexR
	HpbUCaRtC0P3Tee7p7Y9A2LAXNSvJhHAF3rNsPN+lw7m1ub5GuixkhSnEvJKw0uu
	s+Zh3mXugqVQ0vROmoRzq4fKOewbLYDLt2NGCf6YCaLGcvmUGEgPTR77OCPzu/gz
	+CxNVkSJZK7KOvTGhYNSF9Dp9qy6n6GaSy1py29imbINg6XXYCJRTgAY207MjswM
	Jwab3fYSnOGLwmHauGXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wusxggy9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 12:13:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42ECD24C018568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 12:13:02 GMT
Received: from hu-amrianan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Mar 2024 05:12:55 -0700
From: Amrit Anand <quic_amrianan@quicinc.com>
To: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        <peter.griffin@linaro.org>, <caleb.connolly@linaro.org>,
        <linux-riscv@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>,
        Amrit Anand <quic_amrianan@quicinc.com>
Subject: [PATCH v2 0/2] Add board-id support for multiple DT selection
Date: Thu, 14 Mar 2024 17:41:50 +0530
Message-ID: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9HbCtnvwlODWwAfE7hgXH8kYgPgf3f1C
X-Proofpoint-GUID: 9HbCtnvwlODWwAfE7hgXH8kYgPgf3f1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_10,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=3 impostorscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_051310_547374_65269068 
X-CRM114-Status: GOOD (  16.62  )
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

The software packages are shipped with multiple device tree blobs supporting
multiple boards. For instance, suppose we have 3 SoC, each with 4 boards supported,
along with 2 PMIC support for each case which would lead to total of 24 DTB files.
Along with these configurations, OEMs may also add certain additional board variants.
Hence, a mechanism is required to pick the correct DTB for the board on which the
software package is deployed. Introduce a unique property for adding board identifiers
to device trees. Here, board-id property provides a mechanism for Qualcomm based
bootloaders to select the appropriate DTB.

Isn't that what the compatible property is for?
-----------------------------------------------
The compatible property can be used for board matching, but requires
bootloaders and/or firmware to maintain a database of possible strings
to match against or have complex compatible string parsing and matching.
Compatible string matching becomes complicated when there are multiple
versions of the same board. It becomes difficult for the device tree
selection mechanism to recognize the right DTB to pick, with minor
differences in compatible strings.

The solution proposed here is simpler to implement and doesn't require the need
to update bootloader for every new board.

How is this better than Qualcomm's qcom,msm-id/qcom,board-id?
-------------------------------------------------------------
Qualcomm's qcom,msm-id/qcom,board-id are not scalable for other distinguishing
features as we need to add a new property every time. Board-id property provide
a solution that the bootloader can use to select appropriate device tree. Board-id
encapsulates soc, board, pmic and oem identifiers. Qualcomm based bootloader can use
these key-value pairs to uniquely identify the device tree. This solution scales well
for cases where additional identifiers would be needed for device tree selection
criteria. Adding a new tuple in "board-id" along with "board-id-type" will help support it.
				      
Changes in V2:
 - Based on comment on V1 related to challenges on designing common bootloader for all
   the vendors, where different vendors can have different representation of board-id
   and the best and exact match logic can also be different for different vendors, moving
   the board-id definition in qcom specific binding.
 - Adding support for board IDs for all the boards that are in kernel.org.
 - Adding Qualcomm bootloader best/exact match logic for multi DT selection. 
 - Keeping list of other vendors in CC for comment/awareness related to this requirement 
 - Link to V1: https://lore.kernel.org/all/1705749649-4708-1-git-send-email-quic_amrianan@quicinc.com/

Amrit Anand (2):
  dt-bindings: arm: qcom: Update Devicetree identifiers
  dt-bindings: qcom: Update DT bindings for multiple DT

 Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
 include/dt-bindings/arm/qcom,ids.h              | 86 ++++++++++++++++++++---
 2 files changed, 167 insertions(+), 9 deletions(-)

-- 
2.7.4


