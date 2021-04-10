Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB31C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:12:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA3061165
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA3061165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8RdfsDf8gz5dCU66hEepDFqn/aiWwqlglNNSCP1ol+4=; b=D0unwlzYDDGJLXv2dScAb7mYa1
	pYTw5KvGR8M7vhP/5CyR1aa6xQZFozDVmY4pLUITIGew5Ah8Bgp1kstx+U8rK2nfnNVAUeeO7FR7H
	Ps1NTjVILDV9MQRoH5TUnVZVbIg4/6oKiSR02OPpJZZ4bd2qFnfIIcvQ1vFNpuMPM2IiTSMYWzpf0
	mPQt6E3z3RR8jamtYcmbVeVMcQZRuTk+AB0w/w4gqJAEIHGmWC7LtNf2RcvFP/si+q9KT0Aws4zk6
	Gpkw4KdwXasMnHixOMSwOGb49ZJTHhzbl5y8UyIcQhqZ1vupztssOc5OQ3LlEu6YAyPehr7rcAXlz
	CAuuREJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9er-002Ue9-PZ; Sat, 10 Apr 2021 09:12:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9ed-002UdJ-37; Sat, 10 Apr 2021 09:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CE9Ap/fRDXrkTMy5VK60sq606mhE2PVXNDQZDNLG65w=; b=jWkhP8YLmiEiq4no07HxLBt6hu
 MALC7j5L+LbfPwcsaWRjMciezqF2GVOigUXQlwjCXgUoHvqweALR02iNE/aL2+cp81E034aJ6PU4a
 bh1+XZOF41wOYxVFrW4yWeI0uodHpbeec6F0cf4t4q9PbCpKs4wnTo++wjdlYAAXXLLxxL+Irwjlu
 Itxuvx69b2aI7J6Zl40aG1nI06Aj9Sb1rhIt3WvVDDjKcdp9ID220i3H7OPkQtnl2J2G5oZpVSYtK
 B9QjIwWiFx9Jn8d2IkDnGSvaSn1NK+v7/HeR+grr6Rih1FGTLeLEv7AmW2gBOQROAM3iLr9YiczZw
 U7PjwayQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9eW-0050DZ-21; Sat, 10 Apr 2021 09:11:43 +0000
X-UUID: 83177b25e2834237abe9f55235dc9882-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CE9Ap/fRDXrkTMy5VK60sq606mhE2PVXNDQZDNLG65w=; 
 b=MTdR18deYJOr4waQyU0C2kyNp4+J/aLZe0uB3avoZmuA1sgus0ltQZqUrwSUXGtRHZ4pjMMCj3HkGs/e7WkuCDFGDKZui968Adgx6dfBoiQvW/fmbZ+Sawva0Fbhev6sJCVRt6587XUkxFKhsYq6D/d5McjatP/w8URHSRj4LpI=;
X-UUID: 83177b25e2834237abe9f55235dc9882-20210410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1256295336; Sat, 10 Apr 2021 02:11:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:11:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:11:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:11:33 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 00/16] Clean up "mediatek,larb"
Date: Sat, 10 Apr 2021 17:11:12 +0800
Message-ID: <20210410091128.31823-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_021141_537914_1213B8E7 
X-CRM114-Status: GOOD (  18.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek IOMMU block diagram always like below:

        M4U
         |
    smi-common
         |
  -------------
  |         |  ...
  |         |
larb1     larb2
  |         |
vdec       venc

All the consumer connect with smi-larb, then connect with smi-common.

When the consumer works, it should enable the smi-larb's power which also
need enable the smi-common's power firstly.

Thus, Firstly, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

After adding the device_link, then "mediatek,larb" property can be removed.
the iommu consumer don't need call the mtk_smi_larb_get/put to enable
the power and clock of smi-larb and smi-common.

About the MM dt-bindings/dtsi patches, I guess they will go through Matthias's
tree, so I don't split them for each a MM module and each a SoC.

This patchset base on v5.12-rc2 and a vcodec patchset(separating its node)[1]
which has already been in linux-next.

[1] https://lore.kernel.org/linux-mediatek/20210325122625.15100-1-irui.wang@mediatek.com/

Change notes:
v5: 1) Base on v5.12-rc2.
    2) Remove changing the mtk-iommu to module_platform_driver patch, It have
    already been a independent patch.
    3) Add several patches for the MM drivers with pm_runtime_resume_and_get
    instead of pm_runtime_get_sync since smi already use it.

v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/ 
    base on v5.7-rc1.
  1) Move drm PM patch before smi patchs.
  2) Change builtin_platform_driver to module_platform_driver since we may need
     build as module.
  3) Rebase many patchset as above.

v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
    1) rebase on v5.3-rc1 and the latest mt8183 patchset.
    2) Use device_is_bound to check whether the driver is ready from Matthias.    
    3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
   reason in the commit message[3/14].
    4) Add a display patch[12/14] into this series. otherwise it may affect
   display HW fastlogo even though it don't happen in mt8183.
   
v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
   1) rebase on v5.2-rc1.
   2) Move adding device_link between the consumer and smi-larb into
iommu_add_device from Robin.
   3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
   4) Remove the shutdown callback in iommu.   

v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/

Yong Wu (15):
  dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
  iommu/mediatek: Add probe_defer for smi-larb
  iommu/mediatek: Add device_link between the consumer and the larb
    devices
  memory: mtk-smi: Add device-link between smi-larb and smi-common
  media: mtk-jpeg: Use pm_runtime_resume_and_get for PM get_sync
  media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
  media: mtk-mdp: Use pm_runtime_resume_and_get for PM get_sync
  media: mtk-mdp: Get rid of mtk_smi_larb_get/put
  drm/mediatek: Use pm_runtime_resume_and_get for PM get_sync
  drm/mediatek: Get rid of mtk_smi_larb_get/put
  media: mtk-vcodec: Use pm_runtime_resume_and_get for PM get_sync
  media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
  memory: mtk-smi: Get rid of mtk_smi_larb_get/put
  arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
  arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes

Yongqiang Niu (1):
  drm/mediatek: Add pm runtime support for ovl and rdma

 .../display/mediatek/mediatek,disp.txt        |  9 ----
 .../bindings/media/mediatek-jpeg-decoder.txt  |  4 --
 .../bindings/media/mediatek-jpeg-encoder.txt  |  4 --
 .../bindings/media/mediatek-mdp.txt           |  8 ----
 .../bindings/media/mediatek-vcodec.txt        |  4 --
 arch/arm/boot/dts/mt2701.dtsi                 |  2 -
 arch/arm/boot/dts/mt7623n.dtsi                |  5 --
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 --
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 21 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 35 --------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
 drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
 drivers/iommu/mtk_iommu_v1.c                  | 22 ++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 34 ++------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 ----------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 42 ++++-------------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
 drivers/memory/mtk-smi.c                      | 33 ++++---------
 include/soc/mediatek/smi.h                    | 20 --------
 29 files changed, 99 insertions(+), 312 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
