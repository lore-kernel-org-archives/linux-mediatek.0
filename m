Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B39C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQXkSA3Hc1wVQPW1DsR8qc/gwkV7ffNa+9elP5CgccE=; b=pGdrwzYNyfm+z5
	WMC40a3JV7lWzdY99LxvGGTFG1e5iDRvLY+lnsHy+Lxw0wQyeDkTRKa++jnLlefneqq7TL5SWHgKK
	rNHiOKm5Js5M40AIprbHYJIv0c/dRmrh9XQhdFQcof84rlXjcMaytXd7SP3f3KZQHtuYJ0Kr8iSY4
	gjFyWKxn5mYoNnFQAPt7exUZqcWQx0/dOsVTFZFj4sS5w9plTHT7/Luvgw0AbC6TRMzoQ29TihGLH
	0wB92BHhq41jHo30DrHW9Ce0X2mx4zCIAnQc/5twjzZmABI3a6//zNcoLhbqNu92LwKxcaQeCc/tq
	h17CCSJxYB2vpbKqckZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDw7-00DMCI-FM; Tue, 12 Apr 2022 10:39:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDvY-00DLzB-JQ; Tue, 12 Apr 2022 10:39:18 +0000
X-UUID: cf8f5547581f4b849e2b13dba858b482-20220412
X-UUID: cf8f5547581f4b849e2b13dba858b482-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 493898580; Tue, 12 Apr 2022 03:39:07 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 03:31:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 18:31:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 18:31:15 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v18 00/10] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Tue, 12 Apr 2022 18:31:04 +0800
Message-ID: <20220412103114.19922-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_033916_672644_497A7715 
X-CRM114-Status: GOOD (  20.55  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 jason-jhlin <jason-jh.lin@mediatek.corp-partner.google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: jason-jhlin <jason-jh.lin@mediatek.corp-partner.google.com>

Change in v18:
- change get driver data by io_start and wrap mmsys driver data into
  mmsys match data structure to support identifying multi mmsys driver
  data with the same compatible name
- change DDP_COMPONENT_DITHER to DDP_CONPONENT_DITHER0

Change in v17:
- change compatible name from 2 vdosys to 1 mmsys
- add get driver data by clk name function to get corresponding
  driver data for mt8195 vdosys0
- add all routing table setting for mt8195 vdosys0
- remove useless mutex define

Change in v16:
- rebase on linu-next tag: 'next-20220303'
- rebase on series: 'Fix MediaTek display dt-bindings issues'

Change in v15:
- remove mt8195-mmsys.h comment for mux settings
- define the mask macro to replace using value as mask
  to fix zero mask problem
- add EOF setting comment for MUTEX sof register

Change in v14:
- rebase on mediatek-drm-next-5.17
- rebase on "Add mmsys and mutex support for MDP" series
- rebase on "media: mediatek: support mdp3 on mt8183 platform" series

Change in v13:
- remove dts patch
- rebase on kernel-5.16-rc1
- rebase on mediatek-drm-next

Change in v12:
- add clock-names property to merge yaml
- using BIT(nr) macro to define the settings of mmsys routing table
- fix clk_get and clk_prepare_enable error handling issue

Change in v11:
- rebase on kernel-5.15-rc1
- change mbox label to gce0 for dts node of vdosys0
- change ovl compatibale to mt8192 to set smi_id_en=true in driver data
- move common module from display folder to common folder,
  such as AAL, COCLOR, CCORR and MUTEX

Change in v10:
- rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
- rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
- fix some typo and "mediatek" start with capital in every dt-bindings
- move mutex yaml from dfisplay folder to soc folder
- separate merge additional propoerties to an individual dt-bindings patch

Change in v9:
- separate power and gce properties of mmsys into another dt-binding patch
- rebase on "Separate aal module" series
- keep mtk_ddp_clk_enable/disable in the same place
- change mtk_dsc_start config register to mtk_drm_ddp_write_mask
- remove the 0 setting of merge fifo config function
- add CCORR driver data for mt8195

Change in v8:
- add DP_INTF0 mux into mmsys routing table
- add DP_INTF0 mutex mod and enum into add/remove comp function
- remove bypass DSC enum in mtk_ddp_comp_init

Change in v7:
- add dt=binding of mmsys and disp path into this series
- separate th modidfication of alphabetic order, remove unused define and
  rename the define of register offset to individual patch
- add comment for MERGE ultra and preultra setting

Change in v6:
- adjust alphabetic order for mediatek-drm
- move the patch that add mt8195 support for mediatek-drm as
  the lastest patch
- add MERGE define for const varriable 

Change in v5:
- add power-domain property into vdosys0 and vdosys1 dts node.
- add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h

Change in v4:
- extract dt-binding patches to another patch series
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (10):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0
  drm/mediatek: add postfix 0 to DDP_COMPONENT_DITHER for mt8195 vdosys0
  soc: mediatek: remove DDP_DOMPONENT_DITHER enum

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  65 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 136 ++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   7 +
 drivers/soc/mediatek/mt8167-mmsys.h           |   2 +-
 drivers/soc/mediatek/mt8183-mmsys.h           |   2 +-
 drivers/soc/mediatek/mt8186-mmsys.h           |   4 +-
 drivers/soc/mediatek/mt8192-mmsys.h           |   4 +-
 drivers/soc/mediatek/mt8195-mmsys.h           | 370 ++++++++++++++++++
 drivers/soc/mediatek/mt8365-mmsys.h           |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              | 152 ++++++-
 drivers/soc/mediatek/mtk-mmsys.h              |   6 +
 drivers/soc/mediatek/mtk-mutex.c              |  95 ++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |  13 +-
 19 files changed, 1122 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
