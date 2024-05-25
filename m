Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47408C25B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8rLV0HeBn69eRaQfJMzJjbq3WYSpLpvqrC1Q0pSsCA=; b=W+vvqWqYZzVPdy6MBTp5goj6m8
	bJzWIMX+OmFOQJcKMZc2c/bGf8GI+uRZE6YMKXQ17V9Ce4bqD/4H11ntjmGPc/8E7H3SpMH5+YcZY
	o61t0lwCaS/uqL2KiSuWZYdLP4Y+ZhJecc9xNCKgjAzg4irH/Vh3J3Z6299uDx85JWXcphJnG26Ky
	S1IZle9t3XuPNlt6rVWU1LjZd6PuEEUBpvkgmHtduu3zhsIYhFtfahAIHODrtRBl1jeJPkB5ZjRKB
	D+scavDdQeATfb4HGW7JRUWmh+eE+IGpU1DPpGTap1Wg2+AMYTWP3Vi5IkCicKCVFHm9FsufsIX+9
	cbqlHWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0Vn-0000000Bpn9-3prN;
	Sat, 25 May 2024 23:09:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0Uy-0000000BpE9-3C8M;
	Sat, 25 May 2024 23:08:26 +0000
X-UUID: aa3a64101aeb11ef82c84f6416ccf2f3-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B8rLV0HeBn69eRaQfJMzJjbq3WYSpLpvqrC1Q0pSsCA=;
	b=bxib8nGOGrFxYg5faEzXumTHLbLaFo/eYvoH+4oZ8OeNro/UQNWEC2rHfD7nqT0YAgSWOLxg9dN2ALGrK3c7q5mDQu2sbatWb3vamG7EoNihkihZelYzPn63ni/yIr+UZMDuewsQ49y1+jzj1whvu/5FymPvHjenPsKPJkhNrss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:85d694bf-5541-42f1-8d84-0e1dba9b10e0,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:82c5f88,CLOUDID:e0db4f84-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa3a64101aeb11ef82c84f6416ccf2f3-20240525
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1301334172; Sat, 25 May 2024 16:08:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v6 0/8] Add CMDQ secure driver for SVP
Date: Sun, 26 May 2024 07:08:02 +0800
Message-ID: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.574600-8.000000
X-TMASE-MatchedRID: HhL2K2fGQMRsLX/Zy50gf4QnnAFRgjn9OlW1BAebvzBzwVmY5TMrNmSQ
	gJ6pnW8lfTfiNIO3sGjdzcJEB3Zs4SgoulOyr3u8/4ToWehCRQUZKp0SZ4P+dcUmcSma304TOGj
	73Ju1zWPhNoChA1M9WA7VVWr/VuT8LSTGw1g/Kd4SEYfcJF0pRbLiLKO9VZOiGNAPebYwJ/uYAj
	JavrGfnw/OeYZBTj6CEdcBbrgDa8DHGs1A87wEZt35+5/2RxqmiK5qg1cmsr+na6U74e0+qLZVh
	39LD7EPfRvCo8kOueMuDzNTHYi3Lf4zNVp6ir9FA9lly13c/gEraL2mh8ZVK0k7tZaD19NMo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtux1CiS1LpJ8yNvWrkZnUKmwBl3cPmzc+NaSmy0CtSX8vwdI
	o2/jpWg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.574600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B488D17A83804E6D2B18BFC25267F78324440A50A8DE9971BC9C55B18A0ED2162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_160825_005422_0B628389 
X-CRM114-Status: GOOD (  16.26  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

For the Secure Video Path (SVP) feature, inculding the memory stored
secure video content, the registers of display HW pipeline and the
HW configure operations are required to execute in the secure world.

So using a CMDQ secure driver to make all display HW registers
configuration secure DRAM access permision settings execute by GCE
secure thread in the secure world.

We are landing this feature on mt8188 and mt8195 currently.
---
TODO:
1) Squash cmdq_sec_task_exec_work() into cmdq_sec_mbox_send_data()
2) Call into TEE to query cookie instead of using shared memory in
   cmdq_sec_get_cookie()
3) Register shared memory as command buffer instead of copying normal
   command buffer to IWC shared memory
4) Use SOFTDEP to make cmdq_sec_probe later than OPTEE loaded and then
   move cmdq_sec_session_init into cmdq_sec_probe()
5) Remove timeout detection in cmdq_sec_session_send()
---

Changes in v6:
1. Rebase to linux-next
2. Change the way to add gce-events prop into dt-binding and add more
   commit message
3. Remove unused parameters in secure mailbox driver
4. Move cmdq_sec_XXX APIs from secure mailbox driver to helper to fix the
   build cycle dependency error
5. Remove finalize loop API and write_s_reg API patch
6. Add cmdq secure helper API patch

Changes in v5:
1. Sync the local changes

Changes in v4:
1. Rebase on mediatek-drm-next(278640d4d74cd) and fix the conflicts
2. This series is based on 20240307013458.23550-1-jason-jh.lin@mediatek.com

Changes in v3:
1. separate mt8188 driver porting patches to another series
2. separate adding 'mediatek,gce-events' event prop to another series
3. sepatate mailbox helper and controller driver modification to a
   single patch for adding looping thread
4. add kerneldoc for secure mailbox related definition
5. add moving reuseable definition patch before adding secure mailbox
   driver patch
6. adjust redundant logic in mtk-cmdq-sec-mailbox

Changes in v2:
1. adjust dt-binding SW event define patch before the dt-binding patch using it
2. adjust dt-binding patch for secure cmdq driver
3. remove the redundant patches or merge the patches of modification for the same API
---

Jason-JH.Lin (8):
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  dt-bindings: mailbox: Add property for CMDQ secure driver
  soc: mediatek: cmdq: Add cmdq_pkt_logic_command to support math
    operation
  mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
  mailbox: mediatek: Move reuseable definition to header for secure
    driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
  soc: mediatek: mtk-cmdq: Add secure cmdq_pkt APIs

 .../mailbox/mediatek,gce-mailbox.yaml         |   8 +-
 drivers/mailbox/Makefile                      |   2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 113 ++-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 932 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            | 195 ++++
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 191 ++++
 include/dt-bindings/gce/mt8195-gce.h          |   6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  35 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   | 342 +++++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  | 106 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      | 105 ++
 include/linux/soc/mediatek/mtk-cmdq.h         | 113 +++
 12 files changed, 2118 insertions(+), 30 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

-- 
2.18.0


