Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD566C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:39:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7579864DE2
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7579864DE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTU/OLuimGQPwMueCyz4n55ma3wCn3m0N2Opq6a52qo=; b=MnC7NGnZn9mM3rBhijzyX3RXAr
	P2T2P01j90zSLECbq/hdeWbwSIDvnVIcMQh5fQMSRqhuc89pf5LromdLwTKPlW7Vpclkyl1Txibsa
	iPv0i+EELyEAl0lhGML7nOHz/i7uA2NB5ELhRQNoF+iRieRvHB7PRtUFphefTE7ul2gKovjmtT4Qa
	k5kMcKj2KojL3NjqARvwZVeJ4DP4DXzVBcQuH86JtGuage0z+2ZVswGnV4QjK1jYYFQU+CtPcZ4lA
	Mg6dOvTHQPPoY2Yfoa5Y8jwix1M56yxGjURx3BqZ8R/VGefwMM8LEJd/Fc6qWgX6r7r0YqMplQzO/
	WGjM/eWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QEy-00007j-0e; Fri, 29 Jan 2021 09:38:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QEs-00005N-PK; Fri, 29 Jan 2021 09:38:52 +0000
X-UUID: e67dbcc04422434893db440392e168f6-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pf9BXUpUQK+MTTReR8TWl1mvrtCfPLvLn2DEgC61880=; 
 b=BohYoZORq/MxWaK7Ed1P2/JKqlZZsdC90rnD4kZDN5LNftm8QKpeF6qiIFmRwnxEyd3bgNa+QrEqWilmQzz+ScN6IbDeVZ7mA485uBtX59TreWNb/HluTwSgpF0kq4WEGwFIfb8aZRJyERnySSFlbhq0WlTHndRTkQDWYttHEio=;
X-UUID: e67dbcc04422434893db440392e168f6-20210129
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1636490406; Fri, 29 Jan 2021 01:30:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 01:30:12 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 17:30:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 Jan 2021 17:30:10 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, <fan.chen@mediatek.com>, Zhang Rui
 <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [v2,0/3] Add LVTS architecture thermal controller
Date: Fri, 29 Jan 2021 17:30:07 +0800
Message-ID: <20210129093010.22909-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_043851_027301_1B35DF34 
X-CRM114-Status: GOOD (  14.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

[1]https://patchwork.kernel.org/project/linux-mediatek/cover/1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com/

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
