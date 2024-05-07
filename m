Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857A8C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 19:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VWE6ZXP3AIBJkn4ZrcnxCPzQUxLvW0RGUuO+DHKq/oQ=; b=upe6SkmO10xiIA0Hz/YdUb6X4r
	YaAB4QTF5VfogcB50PDJ60ou4fbnEZb/LPOuuc4tSGqNE6XX3Mt7bHx7KhElOHefhqu0P6XpS6Hzg
	sNfFmE7yO3uVEpZFI+bCJGr1/XoJdzYEGGY+NtM/SgwlWQqV1gGvSK4hwBge1Gi7JjAWJK866haNU
	D3aNUBc0oTJt2Ibo5d0fX51NN5iDj3oMc4c0mUFwHVx8NMUresCNyz2AeH9pVyBBK2zjBxvny0PPk
	aKkr/K0aN3qGjKNfd64Nre55laTVHBy72MSGfYScQg2CrSJ7hpyHkM5fVTI7szF2DYdk7ZhMEd5aw
	sRhH5SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Q43-0000000CTbb-2kgI;
	Tue, 07 May 2024 19:01:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Q3z-0000000CTZa-3yqZ;
	Tue, 07 May 2024 19:01:21 +0000
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id BFE4A20B2C82;
	Tue,  7 May 2024 12:01:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFE4A20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715108476;
	bh=VWE6ZXP3AIBJkn4ZrcnxCPzQUxLvW0RGUuO+DHKq/oQ=;
	h=From:To:Cc:Subject:Date:From;
	b=BUPpBvirSU0EX4pKl+Phr89hCZNIv0k0Az22vm7KuGi0USH0e7qWgzZ6Udw0XYCc1
	 f8c0XlYsrfpY1Wu1Ayb0yKlIz14J+IO8Qd/dOrTV+O1rq/zlwl5rywcIUO15zHBLb9
	 uqJP7Ip9O/vzxFMcysGpkWIAo+IBXQpmPcE44qGY=
From: Allen Pais <apais@linux.microsoft.com>
To: netdev@vger.kernel.org
Cc: jes@trained-monkey.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kda@linux-powerpc.org,
	cai.huoqing@linux.dev,
	dougmill@linux.ibm.com,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	nnac123@linux.ibm.com,
	tlfalcon@linux.ibm.com,
	cooldavid@cooldavid.org,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	mlindner@marvell.com,
	stephen@networkplumber.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	borisp@nvidia.com,
	bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com,
	louis.peens@corigine.com,
	richardcochran@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acenic@sunsite.dk,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	oss-drivers@corigine.com,
	linux-net-drivers@amd.com
Subject: [PATCH 0/1] Convert tasklets to BH workqueues in ethernet drivers
Date: Tue,  7 May 2024 19:01:10 +0000
Message-Id: <20240507190111.16710-1-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_120120_185204_20A9EA55 
X-CRM114-Status: GOOD (  10.35  )
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

This series focuses on converting the existing implementation of
tasklets to bottom half (BH) workqueues across various Ethernet
drivers under drivers/net/ethernet/*.

Impact:
 The conversion is expected to maintain or improve the performance
of the affected drivers. It also improves the maintainability and
readability of the driver code.

Testing:
 - Conducted standard network throughput and latency benchmarks
   to ensure performance parity or improvement.
 - Ran kernel regression tests to verify that changes do not introduce new issues.

I appreciate your review and feedback on this patch series.
And additional tested would be really helpful.

Allen Pais (1):
  [RFC] ethernet: Convert from tasklet to BH workqueue

 drivers/infiniband/hw/mlx4/cq.c               |  2 +-
 drivers/infiniband/hw/mlx5/cq.c               |  2 +-
 drivers/net/ethernet/alteon/acenic.c          | 26 +++----
 drivers/net/ethernet/alteon/acenic.h          |  7 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h          | 11 +--
 drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
 drivers/net/ethernet/broadcom/cnic.h          |  2 +-
 drivers/net/ethernet/cadence/macb.h           |  3 +-
 drivers/net/ethernet/cadence/macb_main.c      | 10 +--
 .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   | 25 +++----
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
 .../ethernet/cavium/liquidio/octeon_main.h    |  5 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 12 ++--
 drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
 .../ethernet/cavium/thunder/nicvf_queues.c    |  5 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  3 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 41 +++++------
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
 drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
 .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
 drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
 drivers/net/ethernet/jme.c                    | 72 +++++++++----------
 drivers/net/ethernet/jme.h                    |  9 +--
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 drivers/net/ethernet/marvell/skge.c           | 12 ++--
 drivers/net/ethernet/marvell/skge.h           |  3 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 drivers/net/ethernet/mellanox/mlx4/cq.c       | 42 +++++------
 drivers/net/ethernet/mellanox/mlx4/eq.c       | 10 +--
 drivers/net/ethernet/mellanox/mlx4/mlx4.h     | 11 +--
 drivers/net/ethernet/mellanox/mlx5/core/cq.c  | 38 +++++-----
 drivers/net/ethernet/mellanox/mlx5/core/eq.c  | 12 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   | 15 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.h   |  3 +-
 .../net/ethernet/mellanox/mlx5/core/lib/eq.h  | 11 +--
 drivers/net/ethernet/mellanox/mlxsw/pci.c     | 29 ++++----
 drivers/net/ethernet/micrel/ks8842.c          | 29 ++++----
 drivers/net/ethernet/micrel/ksz884x.c         | 37 +++++-----
 drivers/net/ethernet/microchip/lan743x_ptp.c  |  2 +-
 drivers/net/ethernet/natsemi/ns83820.c        | 10 +--
 drivers/net/ethernet/netronome/nfp/nfd3/dp.c  |  7 +-
 .../net/ethernet/netronome/nfp/nfd3/nfd3.h    |  2 +-
 drivers/net/ethernet/netronome/nfp/nfdk/dp.c  |  6 +-
 .../net/ethernet/netronome/nfp/nfdk/nfdk.h    |  3 +-
 drivers/net/ethernet/netronome/nfp/nfp_net.h  |  4 +-
 .../ethernet/netronome/nfp/nfp_net_common.c   | 12 ++--
 .../net/ethernet/netronome/nfp/nfp_net_dp.h   |  4 +-
 drivers/net/ethernet/ni/nixge.c               | 19 ++---
 drivers/net/ethernet/qlogic/qed/qed.h         |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c     |  6 +-
 drivers/net/ethernet/qlogic/qed/qed_int.h     |  4 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    | 20 +++---
 drivers/net/ethernet/sfc/falcon/farch.c       |  4 +-
 drivers/net/ethernet/sfc/falcon/net_driver.h  |  2 +-
 drivers/net/ethernet/sfc/falcon/selftest.c    |  2 +-
 drivers/net/ethernet/sfc/net_driver.h         |  2 +-
 drivers/net/ethernet/sfc/selftest.c           |  2 +-
 drivers/net/ethernet/sfc/siena/farch.c        |  4 +-
 drivers/net/ethernet/sfc/siena/net_driver.h   |  2 +-
 drivers/net/ethernet/sfc/siena/selftest.c     |  2 +-
 drivers/net/ethernet/silan/sc92031.c          | 47 ++++++------
 drivers/net/ethernet/smsc/smc91x.c            | 16 ++---
 drivers/net/ethernet/smsc/smc91x.h            |  3 +-
 include/linux/mlx4/device.h                   |  2 +-
 include/linux/mlx5/cq.h                       |  2 +-
 83 files changed, 501 insertions(+), 473 deletions(-)

-- 
2.17.1


