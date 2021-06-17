Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2489CC48BE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 11:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF5561410
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 11:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF5561410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ZPf2s8EzjI55Q8aNPo7FASn6Js15znAPfmiLFihLTA=; b=3zmxNE+ZjjYB+M
	Opm0ldB3cGFgbwm2/uWjkzPV7gi6UCY+thYoumovtnTBGK0C0Pvdx4k3ZueNh4mcCUm91aNKuUBlk
	bzHj+ogKpeblxfc+T7qiqecyYhnM2WlyjZ1ac00bzJzyI04kUCNPCez6H5ssIxyRIKYwN1aRuGYX7
	1WlW8modi0DUUS80Syjr4pe0uXWkBYVi8smqBKeRWEbj2QHhD0YsYln2Fx9JaUA5+I8aRuT1RHqXE
	14t1DrXhh4i5WGnukBEex59bCC5oDlajPq/PriE6qWQ0qAfole4SXEzUYoNHGex/AoYttNnLjZUE+
	oxWdqzMHAh7XY/EHqm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltqUU-00A7Ut-95; Thu, 17 Jun 2021 11:47:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltqUO-00A7Sh-4J; Thu, 17 Jun 2021 11:47:19 +0000
X-UUID: 277aa3e30bfa412ebc08c5adc736f86c-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qRAIZ+56hSI6lz17g0ir6Szi12IrLwp4KknHMn4+ET4=; 
 b=lZYHijlt0L/RSzB5s+zRrg47Kp5sYk2w3Fgvdvv5W/AeL1/1gs09eDw0QSqU2SM2u2DRNgPk8Sdo1h9xfF35b57cZfq27uTYBbonXkIb5nIdXAWwUB8r1m1dImqPtvJkOQNtwZd5QXqn9qTOKPw7IngFz01zCaDwGicpq0ngBZU=;
X-UUID: 277aa3e30bfa412ebc08c5adc736f86c-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ben.tseng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 510657316; Thu, 17 Jun 2021 04:47:12 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 04:47:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 19:47:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 19:47:09 +0800
From: Ben Tseng <ben.tseng@mediatek.com>
To: Fan Chen <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ben Tseng
 <ben.tseng@mediatek.com>
Subject: [PATCH v5 0/3] thermal: mediatek: Add LVTS architecture thermal
 controller
Date: Thu, 17 Jun 2021 19:47:04 +0800
Message-ID: <20210617114707.10618-1-ben.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_044717_692086_1E04F310 
X-CRM114-Status: GOOD (  15.15  )
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

This patch move thermal files related to Mediatek to the mediatek folder.
And introduce the new architecture LVTS (low pressure thermal sensor) driver to report
the highest temperature in the SoC and record the highest temperature sensor,
each sensor as a hot zone.
The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
can connect up to 7 TSMCUs.

The architecture will be the first to be used on mt6873 and mt8192.

Change in v5:
        - Use 'git mv' for the relocated file.

Change in v4:
        - Rebase to kernel-v5.13-rc1
        - Resend

Change in v3:
        - [2/3]
          - change the expression in the lvts_temp_to_raw to dev_s64.

Change in v2:
        - Rebase to kernel-5.11-rc1.
        - [2/3]
          - sort headers
          - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
          - disconstruct the api of lvts_read_tc_msr_raw.
          - add the initial value max_temp = 0 and compare e.q.
            in the lvts_read_all_tc_temperature.
          - add the return with invalid number in the lvts_init.

This patch depends on [1].

[1]https://patchwork.kernel.org/project/linux-mediatek/patch/20210524122053.17155-7-chun-jie.chen@mediatek.com/

Michael Kao (3):
  thermal: mediatek: Relocate driver to mediatek folder
  thermal: mediatek: Add LVTS drivers for SoC theraml zones
  dt-bindings: thermal: Add binding document for mt6873 thermal
    controller

 .../thermal/mediatek-thermal-lvts.yaml        |   81 ++
 drivers/thermal/Kconfig                       |   14 +-
 drivers/thermal/Makefile                      |    2 +-
 drivers/thermal/mediatek/Kconfig              |   33 +
 drivers/thermal/mediatek/Makefile             |    2 +
 .../{mtk_thermal.c => mediatek/soc_temp.c}    |    0
 drivers/thermal/mediatek/soc_temp_lvts.c      | 1287 +++++++++++++++++
 drivers/thermal/mediatek/soc_temp_lvts.h      |  312 ++++
 8 files changed, 1720 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (100%)
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
