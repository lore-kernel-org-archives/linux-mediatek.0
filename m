Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DB6C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72kVJOjDQJkrwjM0ZlAP/foyy3XhLgjfJ5M64CNka8E=; b=hSAj+mIClr61K8graYqfQA5flB
	7xQqtBVCVAVlo7fqL6UZ3F1t9hgl7Njny8ZXF1pmk3TNEtSDLPNh9ttsY1ef538a330NZaoQJDTmA
	46jZUl0lMoqoozMnj3tKVcA+q89WyKJCiSPkFDC7SgcYiZNhQWNdbB1MMX6/Qyr3OD6WTh6lHxsY1
	5n4GPoibFQlGib7uLDrpGaDpLtkkUfgq4Roh8OER9bQFyBFRR7v0hdELBhCRc8O6KAUOD5bGSHkVE
	rfQf37qCksGCCdtXkpiZzQW3Ia0FUkvxACb3irEguHplfoaPwSFCZRLbfoPH6lo4/yue+1n7C31JC
	ZDTKGH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7rR-0000000EPXd-25ds;
	Thu, 08 Feb 2024 17:06:53 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p3-0000000EOd1-0G5b;
	Thu, 08 Feb 2024 17:04:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4CdW095444;
	Thu, 8 Feb 2024 11:04:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411852;
	bh=72kVJOjDQJkrwjM0ZlAP/foyy3XhLgjfJ5M64CNka8E=;
	h=From:To:CC:Subject:Date;
	b=Q6LWPO6726DQWKoNr0ajun4Dqu1U2P5187Ko4KwBZrW/TR03Q1g85ZVEtaipsMH6Y
	 k2i6J4XUeUHnhYXSOVJoWZ0rCGHRWCKWitoi7m5FZQSUFxWRJZIl5MiFsFYvSGXdnH
	 +o+zKJ60NIm5t/ATewmTycO/GFi3qrsJ9OD4sml8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4ClS042364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:12 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B62091006;
	Thu, 8 Feb 2024 11:04:11 -0600
From: Andrew Davis <afd@ti.com>
To: Sebastian Reichel <sre@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Cristian Ciocaltea
	<cristian.ciocaltea@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v3 00/19] Remove pm_power_off use in drivers/power/reset
Date: Thu, 8 Feb 2024 11:03:51 -0600
Message-ID: <20240208170410.67975-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_090426_702879_7FB57240 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

Hello all,

Use of pm_power_off is considered legacy and should be replaced with
register_sys_off*(). Same for register_restart_handler(). Do this
for the drivers/power/reset subsystem for all trivial cases.

Thanks,
Andrew

Changes for v3:
 - Use dev_err_probe() in patch [11/19]
 - Add review tags in patches [18/19] and [19/19]

Changes for v2:
 - Fix sparse warning in 7/19 and 10/19
 - Add new patch fixing an already existing sparse warning (3/19)
 - Rebase on v6.8-rc3

Andrew Davis (19):
  power: reset: atc260x-poweroff: Use
    devm_register_sys_off_handler(RESTART)
  power: reset: atc260x-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: xgene-reboot: Use devm_platform_ioremap_resource()
    helper
  power: reset: xgene-reboot: Use devm_register_sys_off_handler(RESTART)
  power: reset: tps65086-restart: Use
    devm_register_sys_off_handler(RESTART)
  power: reset: tps65086-restart: Remove unneeded device data struct
  power: reset: brcm-kona-reset: Use
    devm_register_sys_off_handler(RESTART)
  power: reset: axxia-reset: Use devm_register_sys_off_handler(RESTART)
  power: reset: rmobile-reset: Use devm_platform_ioremap_resource()
    helper
  power: reset: rmobile-reset: Use
    devm_register_sys_off_handler(RESTART)
  power: reset: mt6323-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: msm-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: msm-poweroff: Use devm_register_sys_off_handler(RESTART)
  power: reset: regulator-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: as3722-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: gemini-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: restart-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
  power: reset: syscon-poweroff: Move device data into a struct
  power: reset: syscon-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)

 drivers/power/reset/as3722-poweroff.c    | 30 ++++-------
 drivers/power/reset/atc260x-poweroff.c   | 55 ++++++++------------
 drivers/power/reset/axxia-reset.c        | 16 +++---
 drivers/power/reset/brcm-kona-reset.c    | 11 ++--
 drivers/power/reset/gemini-poweroff.c    | 16 +++---
 drivers/power/reset/msm-poweroff.c       | 25 ++++-----
 drivers/power/reset/mt6323-poweroff.c    | 26 +++++-----
 drivers/power/reset/regulator-poweroff.c | 36 +++++--------
 drivers/power/reset/restart-poweroff.c   | 25 +++------
 drivers/power/reset/rmobile-reset.c      | 35 ++++---------
 drivers/power/reset/syscon-poweroff.c    | 66 ++++++++++++------------
 drivers/power/reset/tps65086-restart.c   | 58 ++++-----------------
 drivers/power/reset/xgene-reboot.c       | 21 +++-----
 13 files changed, 152 insertions(+), 268 deletions(-)

-- 
2.39.2


