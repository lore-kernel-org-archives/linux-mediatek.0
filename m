Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FF2CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Aug 2025 23:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1bIDCj7cfHHj6oCXiv26pxEcrhqSGDOZhC14EMM9N5s=; b=3B/XEJA3zgxe/cW7o3Pd+mAKYC
	883NWSd3CQ2T8b1Ort3YqrPMz0SRYBMxaRveeTnFhfjqRenl7IoC0kPonBv32QdCUrWDjzo/valBU
	+PazScl8EQGftgmBcixxN2Azt7bSrFk+Xakaot9BRrjFCB0affOO/iEJNlQU/yPzVnAwQ+H6+RdRA
	DBNqQgLLecILzgWMo/TfiBbyEJvdgXCoAiOaDIZ7ul02b3HSgRpTSRUj1tWII+BBT1ejdzFn4oR7X
	DoVIbQLiun5RW35oU/uhwPV6Kyo+Dnd1ufK0e5GCi4MCKYXeCiTFgbJxRe8OGLhlJYOgtL7sSNiXT
	DUg4wvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usrXW-0000000AoZY-1bmg;
	Sun, 31 Aug 2025 23:32:50 +0000
Received: from mail-dm6nam10on20609.outbound.protection.outlook.com ([2a01:111:f403:2413::609] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usrXT-0000000AoYk-0hPX;
	Sun, 31 Aug 2025 23:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeKPSQ+mMuuxB1ANxLrF3vaT7umjy+KNK6xOZKQ0zNdYm6iyoWtRl1sE97/iyQNZggxqektbxs/aJJWsAkFp6xLjiygNHC6UegpFviZek/tP4fStvuqtTzng1NRtXH5xo95iV8N4QG5BatuHM7Vl/Yo0oYP5B5FcjUIMdUfU8q/mX29lBx1flSnZ/1TdO0v3ASWFZTXKzm3XAlC4YlPo448DRbAOfIO1XspFX9NTf90tHsAzObzVriFqyZYuivrf1CXQi/YrVWStr33oRCOTPZIX7alqtYG1SIPR4oZ7rduAyF/sLjk9FCozyQKpaHY6HV+5Zbf5jlRYgypkROTrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bIDCj7cfHHj6oCXiv26pxEcrhqSGDOZhC14EMM9N5s=;
 b=cnJ19RMQ5OZ/5pqV9TWSnVVLgJKYXguFkxkO506XgpHCbfJ6Bf9wjF4YyvpPGGwjh7dAN2aZLleAivfD5yV/sqV2TQrJLkmM4w99xn856vekBBH2FYHmA7nj6FZBNFLF45q9YVE6qvOysq3zpGuAbJG4VVOCd0VZVL8Nzf6dVDw7LtoHgBmHY93AXbMhqD7SK9xysyGi2JFUqH8lN43JBwrUMzJ4S+ANeJMrjlnGeaDgXWual/+dXl3a4rbduIs7SwAf77YEvfDvWgWhBC44Ub0M4j3FjPlhYFCesqMd0af9tXLasxA+jT69NRJHu6fnoVT96ELjECfDQMkgMmVyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bIDCj7cfHHj6oCXiv26pxEcrhqSGDOZhC14EMM9N5s=;
 b=edZrnUtdxbk/tFc90itATzmWB7YNG0S0b8oYtgj2dSBliGisDl3a8SywzWEZ1f25FrR98xa64BQBbMaERmV6ZJ85+K/eD1F7DxF/ey3r1xYNl4kr6KwTfIVZXCpcxDZA9ZOHaeDDGmkcQK1dc+AuJTSifTNo4PQoBN2KMBQJNQjUm1rvqRw4EeTtAJUDH7jbh4uUsHjxAmlpAxTHdKVR9ptvkh4TlF7FGNW9foVkVLG/AcDujCAEtNqQ43vhjA9Ika2bFQFJHvYfpM47VyZ0RZtF0OaLWZ1HTreqU8qWy7pp/EGZziIaLG04FxqGeRKmseTDJ2rbxUN5sbbH9lpucA==
Received: from MN2PR19CA0052.namprd19.prod.outlook.com (2603:10b6:208:19b::29)
 by DM4PR12MB7743.namprd12.prod.outlook.com (2603:10b6:8:101::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Sun, 31 Aug
 2025 23:32:40 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::76) by MN2PR19CA0052.outlook.office365.com
 (2603:10b6:208:19b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Sun,
 31 Aug 2025 23:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Sun, 31 Aug 2025 23:32:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 31 Aug
 2025 16:32:20 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 31 Aug
 2025 16:32:19 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 31 Aug 2025 16:32:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, <jgg@nvidia.com>, <bhelgaas@google.com>
CC: <suravee.suthikulpanit@amd.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <sven@kernel.org>, <j@jannau.net>,
	<alyssa@rosenzweig.io>, <neal@gompa.dev>, <robin.clark@oss.qualcomm.com>,
	<m.szyprowski@samsung.com>, <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <heiko@sntech.de>, <schnelle@linux.ibm.com>,
	<mjrosato@linux.ibm.com>, <gerald.schaefer@linux.ibm.com>,
	<orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>,
	<zhang.lyra@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <jean-philippe@linaro.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <yi.l.liu@intel.com>, <cwabbott0@gmail.com>,
	<quic_pbrahma@quicinc.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<patches@lists.linux.dev>, <vsethi@nvidia.com>, <helgaas@kernel.org>,
	<etzhao1900@gmail.com>
Subject: [PATCH v4 0/7] Disable ATS via iommu during PCI resets
Date: Sun, 31 Aug 2025 16:31:52 -0700
Message-ID: <cover.1756682135.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DM4PR12MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ff8d33-bbb8-4b38-8731-08dde8e6acf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q7AJd0LoGCqmJ13O7nfpwyxZtpZGgaaDn2k2WmhSKuIfV6Uiert1UwR3M04n?=
 =?us-ascii?Q?mw1cf8FQ0ZOsS/q/NmteKAjpWJYSwy9ZsXI/2R/jYYIwJZorsdVFgkzhkuoq?=
 =?us-ascii?Q?4czf7vnOMMTqJhTT/Oq1mHlL9GnIxq3VNHEoN/LgydMHFNnbMXrTsl8yGZhz?=
 =?us-ascii?Q?kD+mNfddIOlV2qNgyIn+4fiW9cHt37XqetcnMzxFFiE16vYvwa3GNqKK2YO7?=
 =?us-ascii?Q?wjc1Bvbj5yZbvJwF6mo4R5cKbOjFlIgPCTBW6hkdDx8qLKslRS1hj9iWzS+9?=
 =?us-ascii?Q?g/bzKsFM+91t+6tv4dRE2634uRKkq4ezYKYdR4RXFYWXmS1ei0pGAAO0iCsn?=
 =?us-ascii?Q?6JUkBxjH/6d7PW4MKiZGdaSUYuB+LYuXRH9ROHgU8yqakdPdzjYP+YqNhenr?=
 =?us-ascii?Q?CM34QGV1ZL0CoFQXIsLPIwWXnmBG2EtstKcutdVOztPGLaBV9PkI/TSUSjpQ?=
 =?us-ascii?Q?atTln2f0oczfJh9OPeRqk9HPtBidlYRa6on095sExgH9you9uT/mjBWh71w2?=
 =?us-ascii?Q?ko9SaMH+bkMJ4uBKPgEPFySSisjLaK2UxhX7isXN1wr+8iEOP9FiL99QYG+J?=
 =?us-ascii?Q?q/PSd+LsZOenthCAEB61+UTCPwl0Jf9eQpV4JkwQXqv/+rCYzpDDsfHHoiQu?=
 =?us-ascii?Q?Zty680JmAuKkMbE6P8xZbQ9lAERqVytFot+N5p0CsQMt/8w6twiGsHZOPAjQ?=
 =?us-ascii?Q?qGTXgBbTmZ+hoZdKfwuhdU6EDMFUmZQkrQPfCeSRJmVcRsMHm8Izd0scBfct?=
 =?us-ascii?Q?snLDxswdbpn1NopSNw4JYfCoy8UQy0fZcOQnrp7qUgsUZHeDBwvAysAcqAn4?=
 =?us-ascii?Q?MxNaFZozGoKmO7l0RlwWJzj49xU8NmEFlS2ZVMbclG8zEmCkZLvAuLOGO5Oo?=
 =?us-ascii?Q?GUVcvPRkknbAoxdo0eTLU9VfRR4nDrbabYixzvdupQPQvHRM4+np6PziIyE8?=
 =?us-ascii?Q?D7gzcKOZCD1q3sRcVDfpD6U460dKcYi+mQnVPd9XalAo8/ns7mE4Agl7rapN?=
 =?us-ascii?Q?lCK5gCdq6V0BOUMSntsaAsX99VcdZbEv3F8jPbje8wgq2YXXJ/v8avlGY/HA?=
 =?us-ascii?Q?6M04IrGNrXta4RmfkEi8+9qvZ/RxlXrUk3AblX4zH65gv9ZuazDo2iLxHuVY?=
 =?us-ascii?Q?pqe9hr1ddXjJWvDHDGWjKnm5c1K9ZP4i5gZHfBfiGp0gF60rYMIkhCIAAI3O?=
 =?us-ascii?Q?1kdYMuelrGhrdxLS+QLMZHUYOQyz1CIrzJEewecgWaXbHMB61YLUEaiCKKMO?=
 =?us-ascii?Q?F0br5Segwk5roWXa6+MyhIR7iye2G/ssHgZk8SsO/xt5L06+aBcRfSJsOqM9?=
 =?us-ascii?Q?5KQm3VDTfZcKV63hGdz+Ok/xQejpX3yJM+wPBtDpyHrebulRuExKENdrH+LI?=
 =?us-ascii?Q?mKOU0ErKlni0Z3emdXlCJolCIsdrx0hhhPQnIPluz/p+2u1CsNHzbiqZvFUZ?=
 =?us-ascii?Q?qJtN+PpanMBK/7JPREaeScLKklGZg1q1NRsmF92tL7RQ6C57pG3lHtUQyAVu?=
 =?us-ascii?Q?2XvMT4GE3/gOGbE6SFsJVUdzV+rgcRmS9UGIU/fQwgEj78ijLbVh16u9Vg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 23:32:39.6542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ff8d33-bbb8-4b38-8731-08dde8e6acf3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7743
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_163247_259486_6B74AF7B 
X-CRM114-Status: GOOD (  17.49  )
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

Hi all,

PCIe permits a device to ignore ATS invalidation TLPs, while processing a
reset. This creates a problem visible to the OS where an ATS invalidation
command will time out: e.g. an SVA domain will have no coordination with a
reset event and can racily issue ATS invalidations to a resetting device.

The OS should do something to mitigate this as we do not want production
systems to be reporting critical ATS failures, especially in a hypervisor
environment. Broadly, OS could arrange to ignore the timeouts, block page
table mutations to prevent invalidations, or disable and block ATS.

The PCIe spec in sec 10.3.1 IMPLEMENTATION NOTE recommends to disable and
block ATS before initiating a Function Level Reset. It also mentions that
other reset methods could have the same vulnerability as well.

Provide a callback from the PCI subsystem that will enclose the reset and
have the iommu core temporarily change domains to group->blocking_domain,
so IOMMU drivers would fence any incoming ATS queries, synchronously stop
issuing new ATS invalidations, and wait for existing ATS invalidations to
complete. Doing this can avoid any ATS invaliation timeouts.

When a device is resetting, any new domain attachment has to be rejected,
until the reset is finished, to prevent ATS activity from being activated
between the two callback functions. Introduce a new pending_reset flag to
reject a concurrent __iommu_attach_device/set_group_pasid().

Finally, apply these iommu_dev_reset_prepare/done() functions in the PCI
reset functions.

Note that this series doesn't work well for a resetting alias device or a
SRIOV PF, so skip these two corner cases. There is nothing we can do for
alias devices since they share the same RID. For SRIOV PF, its VFs would
need to be blocked as well, and new dryrun attach_dev/set_group_pasid ops
will be required to allow compatible domain to be cached concurrently.

Some future followups after this series:
 - A pair of dryrun testing ops for attach_dev/set_dev_pasid to make sure
   no incompatible attempt will be given to attach_dev/set_dev_pasid().
 - Stage all VFs to the blocked domain as well, if their PF is resetting.
 - Clean up all unlocked iommu_get_domain_for_dev() call for UAF concern.
   Replace with safer alternative APIs.

This is on Github:
https://github.com/nicolinc/iommufd/commits/iommu_dev_reset-v4

Changelog
v4
 * Add Reviewed-by from Baolu
 * [iommu] Use guard(mutex)
 * [iommu] Update kdocs for typos and revisings
 * [iommu] Skip two corner cases (alias and SRIOV)
 * [iommu] Rework attach_dev to pass in old domain pointer
 * [iommu] Reject concurrent attach_dev/set_dev_pasid for compatibility
           concern
 * [smmuv3] Drop the old_domain depedency in its release_dev callback
 * [pci] Add pci_reset_iommu_prepare/_done() wrappers checking ATS cap
v3
 https://lore.kernel.org/all/cover.1754952762.git.nicolinc@nvidia.com/
 * Add Reviewed-by from Jason
 * [iommu] Add a fast return in iommu_deferred_attach()
 * [iommu] Update kdocs, inline comments, and commit logs
 * [iommu] Use group->blocking_domain v.s. ops->blocked_domain
 * [iommu] Drop require_direct, iommu_group_get(), and xa_lock()
 * [iommu] Set the pending_reset flag after RID/PASID domain setups
 * [iommu] Do not bypass PASID domains when RID domain is already the
           blocking_domain
 * [iommu] Add iommu_get_domain_for_dev_locked to correctly return the
           blocking_domain
v2
 https://lore.kernel.org/all/cover.1751096303.git.nicolinc@nvidia.com/
 * [iommu] Update kdocs, inline comments, and commit logs
 * [iommu] Replace long-holding group->mutex with a pending_reset flag
 * [pci] Abort reset routines if iommu_dev_reset_prepare() fails
 * [pci] Apply the same vulnerability fix to other reset functions
v1
 https://lore.kernel.org/all/cover.1749494161.git.nicolinc@nvidia.com/

Thanks
Nicolin

Nicolin Chen (7):
  iommu/arm-smmu-v3: Add release_domain to attach prior to release_dev()
  iommu: Lock group->mutex in iommu_deferred_attach()
  iommu: Pass in gdev to __iommu_device_set_domain
  iommu: Pass in old domain to attach_dev callback functions
  iommu: Add iommu_get_domain_for_dev_locked() helper
  iommu: Introduce iommu_dev_reset_prepare() and iommu_dev_reset_done()
  pci: Suspend iommu function prior to resetting a device

 drivers/pci/pci.h                             |   2 +
 include/linux/iommu.h                         |  16 +-
 drivers/iommu/amd/iommu.c                     |  11 +-
 drivers/iommu/apple-dart.c                    |   9 +-
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   5 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  66 +++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |   9 +-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  11 +-
 drivers/iommu/dma-iommu.c                     |   2 +-
 drivers/iommu/exynos-iommu.c                  |   6 +-
 drivers/iommu/fsl_pamu_domain.c               |  12 +-
 drivers/iommu/intel/iommu.c                   |  10 +-
 drivers/iommu/intel/nested.c                  |   2 +-
 drivers/iommu/iommu.c                         | 256 +++++++++++++++++-
 drivers/iommu/iommufd/selftest.c              |   2 +-
 drivers/iommu/ipmmu-vmsa.c                    |  10 +-
 drivers/iommu/msm_iommu.c                     |   8 +-
 drivers/iommu/mtk_iommu.c                     |   8 +-
 drivers/iommu/mtk_iommu_v1.c                  |   7 +-
 drivers/iommu/omap-iommu.c                    |  12 +-
 drivers/iommu/riscv/iommu.c                   |   9 +-
 drivers/iommu/rockchip-iommu.c                |  20 +-
 drivers/iommu/s390-iommu.c                    |   9 +-
 drivers/iommu/sprd-iommu.c                    |   3 +-
 drivers/iommu/sun50i-iommu.c                  |   8 +-
 drivers/iommu/tegra-smmu.c                    |  10 +-
 drivers/iommu/virtio-iommu.c                  |   6 +-
 drivers/pci/pci-acpi.c                        |  12 +-
 drivers/pci/pci.c                             |  68 ++++-
 drivers/pci/quirks.c                          |  18 +-
 30 files changed, 509 insertions(+), 118 deletions(-)

-- 
2.43.0


