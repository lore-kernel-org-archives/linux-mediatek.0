Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6ECC001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2e/DgbPH5Z735BTpVc79AFms8kX4Gp8CjDRy+gF54Og=; b=efLJOgrmhThZJOq9h/XT2FA+Qw
	z5h/dUDOAfX0bl+z4YUbMJFejADh0Lf+I3IbW5IbNItupDe4JoY6xiZxGCY4UxOJeGy+3Aurky38K
	XlNES0AOwd9xqDDLJNxs7cLjreg6/pCrHjBBleedNCH1PkwwSCxAGvrlVyacHGl3FMw0JBMkmfgM5
	+4hj15akDqrVw2CoaBha6gkebkenW4gUyNsV/5U4SKG9RhfYUTFXhW2T7rszeu3/FfDUHdBKcLqnj
	f5Ven4acPAs76Az2OXd2A8uHbXPmV3sqZpdclfKGqzqVpPgDIU8oWPjgM8wRppj9U0UIOyN9/f2el
	XdqN32BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQjB-00GF4s-0L;
	Mon, 14 Aug 2023 06:06:57 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQj9-00GF4K-0X;
	Mon, 14 Aug 2023 06:06:56 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37DMhSts019431;
	Sun, 13 Aug 2023 23:04:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=2e/DgbPH5Z735BTpVc79AFms8kX4Gp8CjDRy+gF54Og=;
 b=E/8P5/+jNOFDXnIeAK6eLktq00L60xiKYdb2qKHYNE+xCpg5uzwBma5HNeeDm5+xDr/z
 PtUPN2CVxipoL7xIRglPjHM0nr73ebcCfiBNHKO+ejsrYpyGT1z5owXlVZBvcqnjQTMi
 xVpi7MTLbBxFyMgVXN2gotRa8b8ZGbhZzCnaie9FgVwAx0KVLDEe3Z0Hs/va3cj30eI3
 bQep63FV2AJCT9K2ToAglpvTN/WgrwwX8gb7FG8I4boMHs0BV/6m7+XurB6k5AN7oOOW
 iqus7BoMwgqKR+ia384IF8M69kir+dL0CX57DDgO8auPhc0KzwAXvTjo5NFnI/q/asdB kQ== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3se7en58mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Sun, 13 Aug 2023 23:04:52 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 13 Aug
 2023 23:04:50 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Sun, 13 Aug 2023 23:04:50 -0700
Received: from marvell-OptiPlex-7090.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with ESMTP id A95D13F707E;
	Sun, 13 Aug 2023 23:04:25 -0700 (PDT)
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
        <hawk@kernel.org>, <john.fastabend@gmail.com>,
        <jiawenwu@trustnetic.com>, <mengyuanlou@net-swift.com>,
        <yang.lee@linux.alibaba.com>, <error27@gmail.com>,
        <linyunsheng@huawei.com>, <linux-hyperv@vger.kernel.org>,
        <kys@microsoft.com>, <haiyangz@microsoft.com>, <wei.liu@kernel.org>,
        <decui@microsoft.com>, <longli@microsoft.com>,
        <shradhagupta@linux.microsoft.com>, <linux-hwmon@vger.kernel.org>,
        <michael.chan@broadcom.com>, <richardcochran@gmail.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <yisen.zhuang@huawei.com>,
        <salil.mehta@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <nbd@nbd.name>,
        <john@phrozen.org>, <sean.wang@mediatek.com>,
        <Mark-MC.Lee@mediatek.com>, <lorenzo@kernel.org>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <linux@armlinux.org.uk>, <linux-rdma@vger.kernel.org>,
        <saeedm@nvidia.com>, <leon@kernel.org>,
        <gerhard@engleder-embedded.com>, <maciej.fijalkowski@intel.com>,
        <alexanderduyck@fb.com>, <wei.fang@nxp.com>, <shenwei.wang@nxp.com>,
        <xiaoning.wang@nxp.com>, <linux-imx@nxp.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <jaswinder.singh@linaro.org>,
        <ilias.apalodimas@linaro.org>, <UNGLinuxDriver@microchip.com>,
        <horatiu.vultur@microchip.com>, <linux-omap@vger.kernel.org>,
        <grygorii.strashko@ti.com>, <simon.horman@corigine.com>,
        <vladimir.oltean@nxp.com>, <rkannoth@marvell.com>,
        <aleksander.lobakin@intel.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
        <mcoquelin.stm32@gmail.com>, <p.zabel@pengutronix.de>,
        <thomas.petazzoni@bootlin.com>, <mw@semihalf.com>,
        <sgoutham@marvell.com>, <gakula@marvell.com>, <sbhatta@marvell.com>,
        <hkelam@marvell.com>, <xen-devel@lists.xenproject.org>,
        <jgross@suse.com>, <sstabellini@kernel.org>,
        <oleksandr_tyshchenko@epam.com>, <linux-wireless@vger.kernel.org>,
        <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
        <kvalo@kernel.org>, <andrii@kernel.org>, <martin.lau@linux.dev>,
        <song@kernel.org>, <yonghong.song@linux.dev>, <kpsingh@kernel.org>,
        <sdf@google.com>, <haoluo@google.com>, <jolsa@kernel.org>
Subject: [PATCH v1 net] page_pool: Cap queue size to 32k.
Date: Mon, 14 Aug 2023 11:34:11 +0530
Message-ID: <20230814060411.2401817-1-rkannoth@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bGx5XTdUaNF0Cpw7RYZXO72Xq3CLGQ2Y
X-Proofpoint-ORIG-GUID: bGx5XTdUaNF0Cpw7RYZXO72Xq3CLGQ2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-13_24,2023-08-10_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_230655_210491_147936F1 
X-CRM114-Status: GOOD (  14.48  )
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

Clamp to 32k instead of returning error.

Please find discussion at
https://lore.kernel.org/lkml/
CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
namprd18.prod.outlook.com/T/

Fixes: ff7d6b27f894 ("page_pool: refurbish version of page_pool code")
Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>

---
ChangeLog:
v0 -> v1: Rebase && commit message changes
---
 net/core/page_pool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a3e12a61d456..e9dc8d8966ad 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -171,9 +171,10 @@ static int page_pool_init(struct page_pool *pool,
 	if (pool->p.pool_size)
 		ring_qsize = pool->p.pool_size;
 
-	/* Sanity limit mem that can be pinned down */
+	/* Cap queue size to 32k */
 	if (ring_qsize > 32768)
-		return -E2BIG;
+		ring_qsize = 32768;
+
 
 	/* DMA direction is either DMA_FROM_DEVICE or DMA_BIDIRECTIONAL.
 	 * DMA_BIDIRECTIONAL is for allowing page used for DMA sending,
-- 
2.25.1


