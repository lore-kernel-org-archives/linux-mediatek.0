Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE37C6379F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gnvKmQQsZNTmUuHgm3zwNFDqUUkz6YkNKxFpEYsREs=; b=d8ZPcuk4+uRaPnMXQQqVC18qaA
	rZ0Njd7SPbrtw55HC3vvK/Q4FiHYtza76N6H+vrepgDBXQUrOME9AqRBn2HMuooPw+QOkbRw1RclY
	dzNY0LxFNwVuiVsxjsrUO6NJaAaujmvStj40vq+OTc5QaLIJHX8tRj82jw8WWiDi2PWvHZIdYr3xm
	oUkbAKkNQKXqQpzMnuzRGL6D1LFoswV+BHe8VwlE//OIeeRls/7F1FxI3L1zQjaLcbXy+HsWZvNbk
	T2LULr25nAusAyhKcnOGcotHZREOACn3bA7awBSmITaE9y/uo3e5SPhAsmgeTVZsAMzWdQeazgAvX
	M7WuBarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR5X-004PZ0-EL; Fri, 13 Jan 2023 20:55:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR3c-004OY8-MB; Fri, 13 Jan 2023 20:53:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DKmYYP018224;
	Fri, 13 Jan 2023 20:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2gnvKmQQsZNTmUuHgm3zwNFDqUUkz6YkNKxFpEYsREs=;
 b=MDc+EloaPbilFlagWJ8kJ0HBb+UNlSsm8ZBZ5NEoA2xR/efYPRVr0pRMb7kfD7QKe4qr
 ZI6LpPdKlKSGSJK5oo2g7XKnfzVidLK5AziskUofaljKYbOeg9GQRXY+GUXHT0KiYB/2
 DIlJOjvc3UU8cMjwg3kFZCWYvAiy/rpvpmLuuPm0zFKW02NBmciwvPAokBQ2qJqm7Io4
 jIE3v0ihCNI2b/wAtWBU1i1BBk/nBE7N0Zv30OqPeXUdR43C6Zt1cOIq0vgQ6Pcm8p+t
 KQ6RDcWq+JkWbQeQBcT7G+QSmXZ+eqKBOP513j2RPe4smvSBz5VGjKTRq9o502NU42Px /g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n3a8mgj2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 20:53:44 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DKrhKc025709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 20:53:43 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 13 Jan 2023 12:53:42 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jinyoung Choi
	<j-young.choi@samsung.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 15/15] ufs: core: mcq: Enable Multi Circular Queue
Date: Fri, 13 Jan 2023 12:48:52 -0800
Message-ID: <1dc2055e6ef1b0b080e2881bd15851dbf1cdc397.1673557949.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1673557949.git.quic_asutoshd@quicinc.com>
References: <cover.1673557949.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YM6usDvVXS49QQ1xSnV_rOzwzfhrN6oM
X-Proofpoint-ORIG-GUID: YM6usDvVXS49QQ1xSnV_rOzwzfhrN6oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_125348_768030_B9C5EB1D 
X-CRM114-Status: GOOD (  13.71  )
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

Enable MCQ in the Host Controller.

Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cb1bca4..54717c4 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8455,6 +8455,12 @@ static void ufshcd_config_mcq(struct ufs_hba *hba)
 
 	hba->host->can_queue = hba->nutrs - UFSHCD_NUM_RESERVED;
 	hba->reserved_slot = hba->nutrs - UFSHCD_NUM_RESERVED;
+
+	/* Select MCQ mode */
+	ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
+		      REG_UFS_MEM_CFG);
+	hba->mcq_enabled = true;
+
 	dev_info(hba->dev, "MCQ configured, nr_queues=%d, io_queues=%d, read_queue=%d, poll_queues=%d, queue_depth=%d\n",
 		 hba->nr_hw_queues, hba->nr_queues[HCTX_TYPE_DEFAULT],
 		 hba->nr_queues[HCTX_TYPE_READ], hba->nr_queues[HCTX_TYPE_POLL],
-- 
2.7.4


