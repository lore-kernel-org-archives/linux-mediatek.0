Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF83C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gF/M0cQp/Po1gWJguFknxVmvecw9rwR313j3e4N2Jkg=; b=bpbqW8CMeHMqe8+YE/whN5PKwg
	UKnFWhFiLAqNnd0V/Dn99Ac/tIBbNrQvCbXhG4mOvOSl5kpmRacKjljm9zJsDPeOCHMM68Apff4pS
	5ZUDgZeDOCcliSYLiqxYauCKl9gGohtvvMEXq2cY5y7SUa40izd8Qg3USfSVA85aud9ziOCDKTVst
	UercIf2mrk9ERCFZnZjBHffHodhZfLsa5x6sHB2RveX/Abd4V0N6gHOEIlr+Tw/66OPrI95T9mDg0
	DbTzlD1uyttWDEyCq8MtfQvl0r0rdQ5wpXnHXFGatBIn4aDFe2uGDQjuXSoO+3abbfQRV7Yybw+Jm
	VSOo1iOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8Sz-00000002zgC-0eot;
	Wed, 31 Jan 2024 11:09:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8Sv-00000002zea-2x4P;
	Wed, 31 Jan 2024 11:09:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V77IVt009454;
	Wed, 31 Jan 2024 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=gF/M0cQ
	p/Po1gWJguFknxVmvecw9rwR313j3e4N2Jkg=; b=m+AMCIyO4OkKcvN0VpEPNsU
	V1wiMCZbuTvPJHmGfBn90N3vv2X3Gtq6ABdGRGHpCsbJVP/jnK0Fg1g4XknLqkvd
	x3+ZG58z8wvuipQUd5nC59iqSVaFOU9U66bg43csrsCqvEdUYYmxcTlBv7EhgL5H
	sIIJCSSh0FndfjcsqjvqQGnHiFlfY3VDWwMP7941K3Q15Xs3HpBtStsA4sNiEdwd
	tnrC/4JM+pAH0PGAXxaf9LEfPcdMi2VKXSH70QiXKqi4BbJA9u4xBhV2Tj9xtQja
	k383moYLuGIeVqqI3nKyxfXHuz/9+KogAgLqzL2srAdEkJgN03ZLgNYh8yyXheg=
	=
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyb0csgnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:08:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VB8wwk006363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:08:58 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 03:08:48 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>, <vigneshr@ti.com>,
        <nm@ti.com>, <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [PATCH v8 00/10] Add Qualcomm APSS Minidump driver related support
Date: Wed, 31 Jan 2024 16:38:27 +0530
Message-ID: <20240131110837.14218-1-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.43.0.254.ga26002b62827
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -97ZvIopG6uQLw9plTQtOsQLB2xVb9yh
X-Proofpoint-ORIG-GUID: -97ZvIopG6uQLw9plTQtOsQLB2xVb9yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_030913_763759_DABF53E1 
X-CRM114-Status: GOOD (  34.35  )
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

Abstract and PDF here:
https://lpc.events/event/17/contributions/1468/

Video:
https://www.youtube.com/watch?v=3vL3gtAu84s

Patch 1 deals in detail documentation on minidump.
Patch 2-4 refactors minidump existing layout and separate it from remoteproc files.
Patch 6 is the Qualcomm APSS minidump driver.
Patch 7-10 Enable support to reserve dynamic ramoops and the support to
  register ramoops region with minidump.

Detail about Minidump is discussed in documentation patch (1/10) and also briefly
discussed after below changelog.

Changes in v8:
 - Addressed documentation comment made by Randy Dunlap.
 - Rebased on linux-next tag next-20240130

Changes in v7:
 - Addressed comment made by [Pavan.K] to use generic notifiers.
 - Addresses comment made on Dynamic ramoops about error handling.
 - Significant change minidump documentation suggested by [Bryan O'Donoghue]
 - Added Reviewed by from [Bagas]
 - Renamed ramoops notifiers.

Changes in v6: https://lore.kernel.org/lkml/1700864395-1479-1-git-send-email-quic_mojha@quicinc.com/
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

Support for Minidump enablement on Qualcomm SoCs is pursued separately and
can be done via below series of changes. For testing, these patches can be
applied

https://lore.kernel.org/lkml/1704727654-13999-1-git-send-email-quic_mojha@quicinc.com/

https://lore.kernel.org/lkml/20240109153200.12848-12-quic_mojha@quicinc.com/
https://lore.kernel.org/lkml/20240109153200.12848-13-quic_mojha@quicinc.com/

Testing of these patches has been done on sm8450 target after enabling kernel
config like CONFIG_PSTORE_RAM/CONFIG_PSTORE_CONSOLE and once the device boots
up. Below command can be executed from sysfs to enable minidump in the firmware.

 echo mini > /sys/module/qcom_scm/parameters/download_mode

Try crashing it via devmem2 0xf11c000(this is known command to create xpu violation
and put the device crash dump mode) on command prompt.

Default storage type is set to via USB, so Minidump would be downloaded with the
help of x86_64 machine (running PCAT tool) attached to Qualcomm product which has
backed Minidump boot firmware support.

After that we will see a bunch of predefined registered region as binary blobs files
starts with md_* downloaded on the x86 machine at configured/default location in PCAT
tool from the product, more about this can be found in qualcomm minidump guide
patch.

Mukesh Ojha (10):
  docs: qcom: Add qualcomm minidump guide
  soc: qcom: Add qcom_rproc_minidump module
  remoteproc: qcom_q6v5_pas: Use qcom_rproc_minidump()
  remoteproc: qcom: Remove minidump related data from qcom_common.c
  init: export linux_banner data variable
  soc: qcom: Add Qualcomm APSS minidump kernel driver
  MAINTAINERS: Add entry for minidump related files
  pstore/ram: Add dynamic ramoops region support through commandline
  pstore/ram: Add ramoops information notifier support
  soc: qcom: register ramoops region with APSS minidump

 Documentation/admin-guide/index.rst         |   1 +
 Documentation/admin-guide/qcom_minidump.rst | 318 +++++++++
 Documentation/admin-guide/ramoops.rst       |  23 +-
 MAINTAINERS                                 |  10 +
 drivers/remoteproc/Kconfig                  |   1 +
 drivers/remoteproc/qcom_common.c            | 160 -----
 drivers/remoteproc/qcom_q6v5_pas.c          |   3 +-
 drivers/soc/qcom/Kconfig                    |  23 +
 drivers/soc/qcom/Makefile                   |   2 +
 drivers/soc/qcom/qcom_minidump.c            | 690 ++++++++++++++++++++
 drivers/soc/qcom/qcom_minidump_internal.h   |  74 +++
 drivers/soc/qcom/qcom_rproc_minidump.c      | 111 ++++
 drivers/soc/qcom/smem.c                     |  20 +
 fs/pstore/Kconfig                           |  15 +
 fs/pstore/ram.c                             | 180 ++++-
 include/linux/init.h                        |   3 +
 include/linux/pstore_ram.h                  |  20 +
 include/linux/soc/qcom/smem.h               |   2 +
 include/soc/qcom/qcom_minidump.h            |  41 ++
 init/main.c                                 |   3 +
 init/version-timestamp.c                    |   3 +
 21 files changed, 1538 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/admin-guide/qcom_minidump.rst
 create mode 100644 drivers/soc/qcom/qcom_minidump.c
 create mode 100644 drivers/soc/qcom/qcom_minidump_internal.h
 create mode 100644 drivers/soc/qcom/qcom_rproc_minidump.c
 create mode 100644 include/soc/qcom/qcom_minidump.h


base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
-- 
2.43.0.254.ga26002b62827


