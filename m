Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59291C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyW0wb6h/ewYkcm4nOES88WkSKZACJW34nPTenGGtRw=; b=CpdFEHpshSO12mxzKE23+8HOv5
	iDCCIlIKwXFmUsT+QhlMU8WkEjKN8f6Fzf4NDh4a3v7HKPTeYx9JYSHadbwWz1Vx7qVYaDq11UNVm
	bMr1H+bUznLehWAj/Ub+psk4pVenk2vS9KNJ3ZgPrjdVZn00pzdak/3TR/Zx8VOsbQKc6Q97davWX
	QUvXZfDh1Ql0c2ncFCUwgoWN6jQ/X421p2tocKUA9i8l83k3SzL+n77E/HmiPgc3YtT21AXF0hb7v
	r+1+ePmPn4il/EKTDzEQKAfjNEITR0jSF0NXGh/FUKcCl8BfMVjUc/NVBrN67xS8uyKsk3dH3h907
	S5lbSw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hO1-000srQ-2H;
	Wed, 22 Nov 2023 07:11:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hNy-000spS-1O;
	Wed, 22 Nov 2023 07:11:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM5naGJ011387;
	Wed, 22 Nov 2023 07:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=yyW0wb6h/ewYkcm4nOES88WkSKZACJW34nPTenGGtRw=;
 b=gQ2OfOZa3tmYp9zpktZ+ZEcJ2/up7tqp4/2FmYyhJoxOTwKYtgm2LlV+NfU5ssKmzHZl
 PaXxlBc/TyXjC/L57rwPRDl+TROyI+5uK4VvnNcaX2BDAfvb94dEmFmKHALqbtonjfzO
 VJD5HsqGs+PaCZ4sQZOOTSGvE7NZ49X9+wkJNY9aJzTcXQQmGYfH5ipUYCk+YHqQPQ5Y
 QFLdBXQLuBsxu00djHQmOmpfvoaVI0a7kJZyeOOyfnxl9AxkXsBxNKLndAE7xu+uYlpX
 abquMtWPezRUFjh71uF2n2Oc34bciZEbk5DWUBlg5JrjL9wf9pGL+GcX+wYTz8ssadyM Jg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhbjvg78a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 07:10:46 +0000
Received: from pps.filterd (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AM6xd59016382;
	Wed, 22 Nov 2023 07:10:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3uepbmyg4q-1;
	Wed, 22 Nov 2023 07:10:45 +0000
Received: from NASANPPMTA04.qualcomm.com (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AM77Pm9027574;
	Wed, 22 Nov 2023 07:10:44 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTP id 3AM7AiPR002249;
	Wed, 22 Nov 2023 07:10:44 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 4701A20A65; Tue, 21 Nov 2023 23:10:44 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v3 00/11] Enable HS-G5 support on SM8550
Date: Tue, 21 Nov 2023 23:10:31 -0800
Message-Id: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yA6AKC7hls2fHaSjTkW-Wo9l2VL-SXP8
X-Proofpoint-ORIG-GUID: yA6AKC7hls2fHaSjTkW-Wo9l2VL-SXP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_231058_663272_8B9911BB 
X-CRM114-Status: GOOD (  19.52  )
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

This series enables HS-G5 support on SM8550.

This series is rebased on below changes from Mani -
https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-1-manivannan.sadhasivam@linaro.org/
https://patchwork.kernel.org/project/linux-scsi/patch/20230908145329.154024-2-manivannan.sadhasivam@linaro.org/

This series is tested on below HW combinations -
SM8550 MTP + UFS4.0
SM8550 QRD + UFS3.1
SM8450 MTP + UFS3.1 (for regression test)
SM8350 MTP + UFS3.1 (for regression test)

Note that during reboot test on above platforms, I occasinally hit PA (PHY)
error during the 2nd init, this is not related with this series. A fix for
this is mentioned in below patchwork -

https://patchwork.kernel.org/project/linux-scsi/patch/1698145815-17396-1-git-send-email-quic_ziqichen@quicinc.com/

Also note that on platforms, which have two sets of UFS PHY settings are
provided (say G4 and no-G4, G5 and no-G5). The two sets of PHY settings are
basically programming different values to different registers, mixing the
two sets and/or overwriting one set with another set is definitely not
blessed by UFS PHY designers. For SM8550, this series will make sure we
honor the rule. However, for old targets Mani and I will fix them in
another series in future.

v2 -> v3:
1. Addressed comments from Andrew, Mani and Bart in patch #1
2. Added patch #2 as per request from Andrew and Mani
3. Added patch #4 to fix a common issue on old targets, it is not necessary
   for this series, but put in this series only because it would be easier
   to maintain and no need to rebase
4. Addressed comments from Dmitry and Mani in patches to phy-qcom-qmp-ufs.c

v1 -> v2:
1. Removed 2 changes which were exposing power info in sysfs
2. Removed 1 change which was moving data structs to phy-qcom-qmp-ufs.h
3. Added one new change (the 1st one) to clean up usage of ufs_dev_params based on comments from Mani
4. Adjusted the logic of UFS device version detection according to comments from Mani:
	4.1 For HW version < 0x5, go through dual init
 	4.2 For HW version >= 0x5
		a. If UFS device version is populated, one init is required
		b. If UFS device version is not populated, go through dual init

Bao D. Nguyen (1):
  scsi: ufs: ufs-qcom: Add support for UFS device version detection

Can Guo (10):
  scsi: ufs: host: Rename structure ufs_dev_params to ufs_host_params
  scsi: ufs: ufs-qcom: No need to set hs_rate after
    ufshcd_init_host_param()
  scsi: ufs: ufs-qcom: Setup host power mode during init
  scsi: ufs: ufs-qcom: Limit negotiated gear to selected PHY gear
  scsi: ufs: ufs-qcom: Allow the first init start with the maximum
    supported gear
  scsi: ufs: ufs-qcom: Limit HS-G5 Rate-A to hosts with HW version 5
  scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 5
    and newer
  phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550 UFS HS-G4 PHY Settings
  phy: qualcomm: phy-qcom-qmp-ufs: Use tbls_hs_max instead of tbls_hs_g4
  phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed Gear 5 support for
    SM8550

 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  12 ++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 171 ++++++++++++++++-----
 drivers/ufs/host/ufs-exynos.c                      |   7 +-
 drivers/ufs/host/ufs-hisi.c                        |  11 +-
 drivers/ufs/host/ufs-mediatek.c                    |  12 +-
 drivers/ufs/host/ufs-qcom.c                        |  92 ++++++++---
 drivers/ufs/host/ufs-qcom.h                        |   5 +-
 drivers/ufs/host/ufshcd-pltfrm.c                   |  69 ++++-----
 drivers/ufs/host/ufshcd-pltfrm.h                   |  10 +-
 11 files changed, 275 insertions(+), 118 deletions(-)

-- 
2.7.4


