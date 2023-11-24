Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B84C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3S+u3ZeOXdXyzfyx49yFJm2wHGcWXW01GWCrtZL834=; b=1D/F+mBFeokbBwqPIe9Xw3rWCe
	TiY361r+zY1DnzmfjYcTJF5KpklfdEOuIOIXpCC+Qnx2YFr1ju1A4ajFCs0oW+VB2QUohSiOq/X6b
	yQHyaE8LCZx/tfKael3KBIx1Sg/44ene4KQwQ9Ht/6u6jkjw9coCyPnQi7pVKyTdxVkXhtm5Xor59
	DVklqtg2JVpQ8B64tIEmvRE/Ho0kT05u+DxxtgjrKFaYXXmxv4M3GImnavEL41U2bO2llBbEBog1n
	nzpv/SbUTNEKg6VSVEz92kDF/XFemTpcYWmRb+cOOAaasS9H/t1a9bU0M/HidhHFbArGq9EPkAfwZ
	1dSQBPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eXx-00875Z-2B;
	Fri, 24 Nov 2023 22:21:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eXt-00874Z-0d;
	Fri, 24 Nov 2023 22:21:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOMFPBt029499;
	Fri, 24 Nov 2023 22:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=R3S+u3ZeOXdXyzfyx49yFJm2wHGcWXW01GWCrtZL834=;
 b=dTSBcCuHu+iZT5tWuApQBL5kHUWUO7KsySs9VaeZwaYl2Fg8NzxJokowf6kYfo+sJz3R
 stqxpVXf+JaouDNXyYokmKx+tlEj+CoDun2x//S4cjTrybQ3D+bJYYT5ZdTwpwvFVz5I
 knamDNGgxZwz7fWTUMyJtFJq6AS1eLvl/24Lhgt+9xOPMK23cDvqqwuHx2cgtqfNL71f
 tH3auNVO7gcDQlDseLl2nOziXF9KPqW8Hj7mDsgtQri2x2Wk4NFFnkYJORM/UYwvCrqf
 w3VwaDECUZnyVacdwq/wd/TZOwL44iDNbcgCRcV3wCqBgk5xPM/V7rdYtwdZot9oTPSJ aA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj4hwm102-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:20:25 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOMKOeh006632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:20:24 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 24 Nov 2023 14:20:14 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [Patch v6 00/12] Add Qualcomm Minidump driver related support
Date: Sat, 25 Nov 2023 03:49:43 +0530
Message-ID: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FTtjlgsJs7xJcy_6yFfQJ_f2FygY4iYh
X-Proofpoint-ORIG-GUID: FTtjlgsJs7xJcy_6yFfQJ_f2FygY4iYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_142109_449662_022F0D69 
X-CRM114-Status: GOOD (  38.97  )
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

Hi,

Just for information,
We have recently presented at LPC2023
Abstract and PDF here:
https://lpc.events/event/17/contributions/1468/

Video:
07:09:00 hrs at
https://www.youtube.com/watch?v=68EBBgEltXA

This series should be applied on top of below series of some SCM patches sent here.
 https://lore.kernel.org/lkml/1698945247-16033-1-git-send-email-quic_mojha@quicinc.com/

Patch 1-2 enable support to enable multiple download mode
Patch 3 deals in detail documentation on minidump.
Patch 4-6 refactors minidump existing layout and separate it from remoteproc files.
Patch 8 is the Qualcomm apss minidump driver.
Patch 10-12 Enable support to reserve dynamic ramoops and the support to
  register ramoops region with minidump.

Changes in v6:
 - Accumalated the feedback received on v5 and rebase v5 versions in v6.
 - Removed the exported function as there is no current users of them.
 - Applied [Pavan.K] suggestion on caller/callee placement of dynamic ramoops reserve memory.
 - Addressed [krzysztof] comment on sizeof() and to have qcom_apss_md_table_exit().
 - Addressed [Bagas.S] comment on minidump doc.
 - Tried to implement [Kees] suggestion in slight different way with callback registration
   with ramoops instead of pstore core.

Change in rebase v5: https://lore.kernel.org/lkml/1694429639-21484-1-git-send-email-quic_mojha@quicinc.com/
 - Rebased it on latest tag available on linux-next
 - Added missed Poovendhan sign-off on 15/17 and tested-by tag from
   Kathiravan. Thanks to him for testing and reminding me of missing sign-off.

Changes in v5: https://lore.kernel.org/lkml/1694290578-17733-1-git-send-email-quic_mojha@quicinc.com/
 - On suggestion from Pavan.k, to have single function call for minidump collection
   from remoteproc driver, separated the logic to have separate minidump file called
   qcom_rproc_minidump.c and also renamed the function from qcom_minidump() to
   qcom_rproc_minidump(); however, dropped his suggestion about rework on lazy deletion
   during region unregister in this series, will pursue it in next series.

 - To simplify the minidump driver, removed the complication for frontend and different
   backend from Greg suggestion, will pursue this once main driver gets mainlined.

 - Move the dynamic ramoops region allocation from Device tree approach to command line
   approch with the introduction command line parsing and memblock reservation during
   early boot up; Not added documentation about it yet, will add if it gets positive
   response.

 - Exporting linux banner from kernel to make minidump build also as module, however,
   minidump is a debug module and should be kernel built to get most debug information
   from kernel.

 - Tried to address comments given on dload patch series.

Changes in v4: https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/
 - Redesigned the driver and divided the driver into front end and backend (smem) so
   that any new backend can be attached easily to avoid code duplication.
 - Patch reordering as per the driver and subsystem to easier review of the code.
 - Removed minidump specific code from remoteproc to minidump smem based driver.
 - Enabled the all the driver as modules.
 - Address comments made on documentation and yaml and Device tree file [Krzysztof/Konrad]
 - Address comments made qcom_pstore_minidump driver and given its Device tree
   same set of properties as ramoops. [Luca/Kees]
 - Added patch for MAINTAINER file.
 - Include defconfig change as one patch as per [Krzysztof] suggestion.
 - Tried to remove the redundant file scope variables from the module as per [Krzysztof] suggestion.
 - Addressed comments made on dload mode patch v6 version
   https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/

Changes in v3: https://lore.kernel.org/lkml/1683133352-10046-1-git-send-email-quic_mojha@quicinc.com/
 - Addressed most of the comments by Srini on v2 and refactored the minidump driver.
    - Added platform device support
    - Unregister region support.
 - Added update region for clients.
 - Added pending region support.
 - Modified the documentation guide accordingly.
 - Added qcom_pstore_ramdump client driver which happen to add ramoops platform
   device and also registers ramoops region with minidump.
 - Added download mode patch series with this minidump series.
    https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/

Changes in v2: https://lore.kernel.org/lkml/1679491817-2498-1-git-send-email-quic_mojha@quicinc.com/
 - Addressed review comment made by [quic_tsoni/bmasney] to add documentation.
 - Addressed comments made by [srinivas.kandagatla]
 - Dropped pstore 6/6 from the last series, till i get conclusion to get pstore
   region in minidump.
 - Fixed issue reported by kernel test robot.

Changes in v1: https://lore.kernel.org/lkml/1676978713-7394-1-git-send-email-quic_mojha@quicinc.com/

Minidump is a best effort mechanism to collect useful and predefined data
for first level of debugging on end user devices running on Qualcomm SoCs.
It is built on the premise that System on Chip (SoC) or subsystem part of
SoC crashes, due to a range of hardware and software bugs.

Qualcomm devices in engineering mode provides a mechanism for generating
full system ramdumps for post mortem debugging. But in some cases it's
however not feasible to capture the entire content of RAM. The minidump
mechanism provides the means for selecting which snippets should be
included in the ramdump.

The core of SMEM based minidump feature is part of Qualcomm's boot
firmware code. It initializes shared memory (SMEM), which is a part of
DDR and allocates a small section of SMEM to minidump table i.e also
called global table of content (G-ToC). Each subsystem (APSS, ADSP, ...)
has their own table of segments to be included in the minidump and all
get their reference from G-ToC. Each segment/region has some details
like name, physical address and it's size etc. and it could be anywhere
scattered in the DDR.

Existing upstream Qualcomm remoteproc driver[1] already supports SMEM
based minidump feature for remoteproc instances like ADSP, MODEM, ...
where predefined selective segments of subsystem region can be dumped
as part of coredump collection which generates smaller size artifacts
compared to complete coredump of subsystem on crash.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/remoteproc/qcom_common.c#n142

In addition to managing and querying the APSS minidump description,
the Linux driver maintains a ELF header in a segment. This segment
gets updated with section/program header whenever a new entry gets
registered.

Testing of these patches has been done on sm8450 target after enabling config like
CONFIG_PSTORE_RAM/CONFIG_PSTORE_CONSOLE and once the device boots up.

 echo mini > /sys/module/qcom_scm/parameters/download_mode

Try crashing it via devmem2 0xf11c000(this is known to create xpu violation and
and put the device in download mode) on command prompt.

Default storage type is set to via USB, so minidump would be downloaded with the
help of x86_64 machine (running PCAT tool) attached to Qualcomm device which has
backed minidump boot firmware support.

This will make the device go to download mode and collect the minidump on to the
attached x86 machine running the Qualcomm PCAT tool(This comes as part Qualcomm
package manager kit).

After that we will see a bunch of predefined registered region as binary blobs files
starts with md_* downloaded on the x86 machine on given location in PCAT tool from
the target device, more about this can be found in qualcomm minidump guide patch.

Mukesh Ojha (12):
  firmware: qcom_scm: Refactor code to support multiple dload mode
  firmware/qcom: qcom_scm: Add multiple download mode support
  docs: qcom: Add qualcomm minidump guide
  soc: qcom: Add qcom_rproc_minidump module
  remoteproc: qcom_q6v5_pas: Use qcom_rproc_minidump()
  remoteproc: qcom: Remove minidump related data from qcom_common.c
  init: export linux_banner data variable
  soc: qcom: Add Qualcomm APSS minidump kernel driver
  MAINTAINERS: Add entry for minidump related files
  pstore/ram: Add dynamic ramoops region support through commandline
  pstore/ram: Add ramoops ready notifier support
  soc: qcom: register ramoops region with APSS minidump

 Documentation/admin-guide/index.rst         |   1 +
 Documentation/admin-guide/qcom_minidump.rst | 272 +++++++++++
 Documentation/admin-guide/ramoops.rst       |   7 +
 MAINTAINERS                                 |  10 +
 drivers/firmware/qcom/Kconfig               |  11 -
 drivers/firmware/qcom/qcom_scm.c            |  62 ++-
 drivers/remoteproc/Kconfig                  |   1 +
 drivers/remoteproc/qcom_common.c            | 160 -------
 drivers/remoteproc/qcom_q6v5_pas.c          |   3 +-
 drivers/soc/qcom/Kconfig                    |  23 +
 drivers/soc/qcom/Makefile                   |   2 +
 drivers/soc/qcom/qcom_minidump.c            | 668 ++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_minidump_internal.h   |  74 +++
 drivers/soc/qcom/qcom_rproc_minidump.c      | 111 +++++
 drivers/soc/qcom/smem.c                     |  20 +
 fs/pstore/Kconfig                           |  15 +
 fs/pstore/ram.c                             | 139 +++++-
 include/linux/init.h                        |   3 +
 include/linux/pstore_ram.h                  |  11 +
 include/linux/soc/qcom/smem.h               |   2 +
 include/soc/qcom/qcom_minidump.h            |  41 ++
 init/main.c                                 |   2 +
 init/version-timestamp.c                    |   3 +
 23 files changed, 1456 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/admin-guide/qcom_minidump.rst
 create mode 100644 drivers/soc/qcom/qcom_minidump.c
 create mode 100644 drivers/soc/qcom/qcom_minidump_internal.h
 create mode 100644 drivers/soc/qcom/qcom_rproc_minidump.c
 create mode 100644 include/soc/qcom/qcom_minidump.h

-- 
2.7.4


