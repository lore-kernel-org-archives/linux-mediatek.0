Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE984C48298
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F62P9tp+eb7Ee4fh8Chen/6wW2u3qcpN9ys5GlRy8Xs=; b=afXNC34/HYXXTmQcPrWJJGelje
	gadW8ZPEzl2Yp6agvuABSRrv4ECb0GLtFpDR5+NoHfF4x1CLL6N5wizNeHs6hTnlaNbPE7y+Yx7/l
	TuRKXyoXSqi65bm1BGLFRweRPYmiyFafM1XjeeU+Ab5ZUCsrVuoQi0tALc+I7gjJSRpofpWqU8bOg
	iQDx1S9GOrCz//4i63WxxYCJaIZc8lm327fd2o2L0J3pJGVMlLk+hrLmk6hjQRHiKouAQ9DZyydHJ
	VBA74us9s9cG5sAk7hzbrqDRRS480pakC5u8YA+8+hwkD+IT4GEH0GyiXzkiA8pViGlM7s1O1Fuxa
	v8KhpmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNU-00000008tbC-3HuF;
	Thu, 01 Feb 2024 18:01:32 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNH-00000008tMp-3qa6;
	Thu, 01 Feb 2024 18:01:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I13Ro049520;
	Thu, 1 Feb 2024 12:01:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810463;
	bh=F62P9tp+eb7Ee4fh8Chen/6wW2u3qcpN9ys5GlRy8Xs=;
	h=From:To:CC:Subject:Date;
	b=swQ2TjJ1hhA0pJzR/Zxn6yfEVD3zp5aUl9+2D/q0jUTdZV4J5b51Oe9k2xJewBsCS
	 /4+4C9dkWyG+z/pztyx1wGd6cQfiyS8M3y20k+jNfY2A68FoAZ3twB2BSOsUct9zJK
	 OksPIH7oj2E0FSeNH11tCorzpB/PdHnI5CZPpjRY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I13d7120298
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:03 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:03 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:03 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Ge117221;
	Thu, 1 Feb 2024 12:01:02 -0600
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
Subject: [PATCH 00/18] Remove pm_power_off use in drivers/power/reset
Date: Thu, 1 Feb 2024 12:00:44 -0600
Message-ID: <20240201180102.70395-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100120_163132_0874E1AB 
X-CRM114-Status: UNSURE (   6.58  )
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

Andrew Davis (18):
  power: reset: atc260x-poweroff: Use
    devm_register_sys_off_handler(RESTART)
  power: reset: atc260x-poweroff: Use
    devm_register_sys_off_handler(POWER_OFF)
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
 drivers/power/reset/brcm-kona-reset.c    | 18 +++----
 drivers/power/reset/gemini-poweroff.c    | 16 +++---
 drivers/power/reset/msm-poweroff.c       | 25 ++++-----
 drivers/power/reset/mt6323-poweroff.c    | 28 +++++-----
 drivers/power/reset/regulator-poweroff.c | 36 +++++--------
 drivers/power/reset/restart-poweroff.c   | 25 +++------
 drivers/power/reset/rmobile-reset.c      | 38 +++++---------
 drivers/power/reset/syscon-poweroff.c    | 66 ++++++++++++------------
 drivers/power/reset/tps65086-restart.c   | 58 ++++-----------------
 drivers/power/reset/xgene-reboot.c       | 13 ++---
 13 files changed, 158 insertions(+), 266 deletions(-)

-- 
2.39.2


