Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A89C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2ED61250
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA2ED61250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ql4P5SwcoR+Bv9IT8yBYb04P/jqBu4o9hbiZycFsq5k=; b=dnhroO22qMeLZU
	LcWxFsbOs09spOW6DyOchr51LuyzlbYtJyhCqF9gG572rMnksDvdrmX6zklYfCWDy1GZtzJatfWdG
	0TPDZK7T3n0nV1zkk5XrpO+YSj8iUVwkNf/VGB+Tofo9z8ZqTj21qMDJSTS4pCbvVNEZW311TQGq2
	Ma+0hvBH5yvT///pkCzbZgB2BAthIE2qsRwXVTkFye90/kV7If4636kH7YB8nJ4xFhFqYHQ2nCgU7
	RXqp6QuC15Ni6OV5XxwcXRVEhPFikGontzBa+gdSLzdO90X7mtJVI/jUULrbM1lNoDOtqKW9HYZdV
	dJayhPRgE9ypPTzDO/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThjL-00DvIF-6U; Fri, 24 Sep 2021 09:42:55 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThj9-00DvF3-5w; Fri, 24 Sep 2021 09:42:44 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2A3612030C4;
 Fri, 24 Sep 2021 11:42:39 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E5A53203095;
 Fri, 24 Sep 2021 11:42:38 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 273FC183AC8B; Fri, 24 Sep 2021 17:42:36 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: allan.nielsen@microchip.com, joergen.andreasen@microchip.com,
 UNGLinuxDriver@microchip.com, vinicius.gomes@intel.com,
 michael.chan@broadcom.com, vishal@chelsio.com, saeedm@mellanox.com,
 jiri@mellanox.com, idosch@mellanox.com, alexandre.belloni@bootlin.com,
 kuba@kernel.org, xiaoliang.yang_1@nxp.com, po.liu@nxp.com,
 vladimir.oltean@nxp.com, leoyang.li@nxp.com, f.fainelli@gmail.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, claudiu.manoil@nxp.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, horatiu.vultur@microchip.com
Subject: [PATCH v5 net-next 0/9] net: dsa: felix: psfp support on vsc9959
Date: Fri, 24 Sep 2021 17:52:17 +0800
Message-Id: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024243_401255_8F2FF4BC 
X-CRM114-Status: GOOD (  10.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VSC9959 hardware supports Per-Stream Filtering and Policing(PSFP).
This patch series add PSFP support on tc flower offload of ocelot
driver. Use chain 30000 to distinguish PSFP from VCAP blocks. Add gate
and police set to support PSFP in VSC9959 driver.

v4->v5 changes:
 - Add MAC table lock patch, and move stream data write in
   ocelot_mact_learn_streamdata().
 - Add two sections of VCAP policers to Seville platform.

v3->v4 changes:
 - Introduce vsc9959_psfp_sfi_table_get() function in patch where it is
   used to fix compile warning.
 - Store MAC entry type before FRER set, and recover it after FRER
   disabled.

v2->v3 changes:
 - Reorder first two patches. Export struct ocelot_mact_entry, then add
   ocelot_mact_lookup() and ocelot_mact_write() functions.
 - Add PSFP list to struct ocelot, and init it by using
   ocelot->ops->psfp_init().

v1->v2 changes:
 - Use tc flower offload of ocelot driver to support PSFP add and delete.
 - Add PSFP tables add/del functions in felix_vsc9959.c.

Vladimir Oltean (3):
  net: mscc: ocelot: serialize access to the MAC table
  net: mscc: ocelot: export struct ocelot_mact_entry
  net: mscc: ocelot: add MAC table stream learn and lookup operations

Xiaoliang Yang (6):
  net: mscc: ocelot: set vcap IS2 chain to goto PSFP chain
  net: mscc: ocelot: add gate and police action offload to PSFP
  net: dsa: felix: support psfp filter on vsc9959
  net: dsa: felix: add stream gate settings for psfp
  net: mscc: ocelot: use index to set vcap policer
  net: dsa: felix: use vcap policer to set flow meter for psfp

 drivers/net/dsa/ocelot/felix.c             |   4 +
 drivers/net/dsa/ocelot/felix.h             |   4 +
 drivers/net/dsa/ocelot/felix_vsc9959.c     | 695 ++++++++++++++++++++-
 drivers/net/dsa/ocelot/seville_vsc9953.c   |   8 +
 drivers/net/ethernet/mscc/ocelot.c         | 112 +++-
 drivers/net/ethernet/mscc/ocelot.h         |  13 -
 drivers/net/ethernet/mscc/ocelot_flower.c  |  84 ++-
 drivers/net/ethernet/mscc/ocelot_vcap.c    | 103 +--
 drivers/net/ethernet/mscc/ocelot_vsc7514.c |   7 +
 include/soc/mscc/ocelot.h                  |  54 +-
 include/soc/mscc/ocelot_ana.h              |  10 +
 include/soc/mscc/ocelot_vcap.h             |   1 +
 12 files changed, 1011 insertions(+), 84 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
