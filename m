Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C926C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vF4XAR3mk2ZrFMINvDP0YS9WPLfwYHYB4feFT3aL1iE=; b=EcFMy1G61A7+fD0K4uEfgED+Rq
	T1xrnPjqa07GMWV/b6Yc17A8HSXA1dBULLCPYdfm9MsRcWz3cafB9mSgi6/4CEau9ShFw0CfruVpj
	AMhfUy3T0q2DLbOV+LDselk6pjQ4VejfucGYdVKcvtKZuSjYq7tgr6OhHRhXPVoz89xoR/p5QjFJx
	s6GQeDotLrw8o8hDn4lB8kWCz9L2m7fQviR58cPyp9rjdxI/gOI9qKTSw/DQsmOWbBLwKkJJhDHy7
	Flk1iXzQ8xxaEgLD0WcekSgS0xsOn4QDHrtrlqgLBlU0059FIVh8oXlnegUYxSTh6zSjcEkRlFe7J
	WHv3jTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXAn-000tgT-9u; Fri, 23 Sep 2022 01:08:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obX9T-000t8g-ST; Fri, 23 Sep 2022 01:06:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N08YpK018680;
	Fri, 23 Sep 2022 01:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=vF4XAR3mk2ZrFMINvDP0YS9WPLfwYHYB4feFT3aL1iE=;
 b=e/0VpLoAoiXU2lseUlhrc/GBn5zui4UKqjDpcK7uFZ/do0lfBgOsB0ZLPMvqoiuzlwj5
 ApVq3qvZqy3wIzpPbTMCfuh2gbcFf3yagPleW63PoMWd9727MTcIwxYF3SSt3eMGfkJA
 XPCBy96C/pv8Yq1pQ1fBVQXHjYq5d2qY9T/pXcEBBdZmvKMhu7cULf7cSxS2NkFGFxIK
 VhJaK1uGmqBhmgk4Z5BHcfbiIB6HFc9z0yPWSPXX0SevhuOUjW52PEiOcBQdJBrVUeH1
 CzjCR8JXhnurOQvYZ0OE5OquNn2ZVqGhfDpRfarIMTESoIvfomtAD+/YJnIRVbA1DxUC 4A== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrpqnskhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:06:13 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28N16BQe015496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:06:11 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:06:11 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <mani@kernel.org>, <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_richardp@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 00/16] Add Multi Circular Queue Support 
Date: Thu, 22 Sep 2022 18:05:07 -0700
Message-ID: <cover.1663894792.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _eHWTivX9oA1CgYXow0M2wjUbC4tC0RX
X-Proofpoint-GUID: _eHWTivX9oA1CgYXow0M2wjUbC4tC0RX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_16,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180648_110143_0E079C5E 
X-CRM114-Status: GOOD (  19.11  )
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


UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
This patch series is a RFC implementation of this.

This is the initial driver implementation and it has been verified by booting on an emulation
platform. During testing, all low power modes were disabled and it was in HS-G1 mode.

Please take a look and let us know your thoughts.

v1:
- Split the changes
- Addressed Bart's comments
- Addressed Bean's comments

* RFC versions:
v2 -> v3:
- Split the changes based on functionality
- Addressed queue configuration issues
- Faster SQE tail pointer increments
- Addressed comments from Bart and Manivannan

v1 -> v2:
- Enabled host_tagset
- Added queue num configuration support
- Added one more vops to allow vendor provide the wanted MAC
- Determine nutrs and can_queue by considering both MAC, bqueuedepth and EXT_IID support
- Postponed MCQ initialization and scsi_add_host() to async probe
- Used (EXT_IID, Task Tag) tuple to support up to 4096 tasks (theoretically)

Asutosh Das (16):
  ufs: core: Probe for ext_iid support
  ufs: core: Introduce Multi-circular queue capability
  ufs: core: Defer adding host to scsi if mcq is supported
  ufs: core: mcq: Introduce Multi Circular Queue
  ufs: core: mcq: Configure resource regions
  ufs: core: mcq: Calculate queue depth
  ufs: core: mcq: Allocate memory for mcq mode
  ufs: core: mcq: Configure operation and runtime interface
  ufs: core: mcq: Use shared tags for MCQ mode
  ufs: core: Prepare ufshcd_send_command for mcq
  ufs: core: mcq: Find hardware queue to queue request
  ufs: core: Prepare for completion in mcq
  ufs: mcq: Add completion support of a cqe
  ufs: core: mcq: Add completion support in poll
  ufs: core: mcq: Enable Multi Circular Queue
  ufs: qcom-host: Enable multi circular queue capability

 drivers/ufs/core/Makefile      |   2 +-
 drivers/ufs/core/ufs-mcq.c     | 511 +++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  84 ++++++-
 drivers/ufs/core/ufshcd.c      | 322 +++++++++++++++++++++-----
 drivers/ufs/host/ufs-qcom.c    |  49 ++++
 drivers/ufs/host/ufs-qcom.h    |   4 +
 include/ufs/ufs.h              |   6 +
 include/ufs/ufshcd.h           | 136 +++++++++++
 include/ufs/ufshci.h           |  63 +++++
 9 files changed, 1117 insertions(+), 60 deletions(-)
 create mode 100644 drivers/ufs/core/ufs-mcq.c

-- 
2.7.4


