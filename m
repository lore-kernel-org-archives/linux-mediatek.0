Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC2DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:19:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F7564E28
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F7564E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSBH90dPyHpzLTjaAs/pMV3Ze03GxJMiJLENN3XORZQ=; b=DstCMi7AQXphe/ED/ujL+ezR0i
	vRQUkTBO8EZWo+xwX163GkZuetH8QBV60TYdGWnkqDDM/bTsLKI7KBijL7MkMnbyEOjDgdxNliWTi
	MuiA6teyzsV43RFm8A1jIlmmko7YaafSTsC1GMk+AXoL38Rp8Wi8jsYhAQwFvX95AjMCHFoX9Wvbi
	Kx5IazAX5Jprm57BmzSIk14K7WYTBir2ofuejOZQdgs1p1XytC5sGH+Vu8muCeUoaUJ19vzBLFD1r
	OmzTqja6iuGuoOUL1sLalPVN+QVTMMcO5LsijFIhc34O17TzDEcgyWTyR4wXZQMETrY3Tld5SeIHi
	L6mq/pYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Qrk-00028x-VC; Fri, 29 Jan 2021 10:19:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Qrj-00027k-Dp; Fri, 29 Jan 2021 10:19:00 +0000
X-UUID: 5cf45de29d9b4cf2ab2af385210410a1-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uPPGwNDWj8mVXZjA0YLqnstNF6ujD5k712YP2OPhDN4=; 
 b=pY3UwsN7h551ZTqEz+3Xwg5oGykmnCBH8MOY236GVEYFCjwUp6BvSItXpS9itOb2pHFret7kup6GkoFUOFq6JYUPHlMgeXDfTH53bffeqdxSE0BBKswtrQ3oLU5/NmvLSPjBQ9Bympwl6iz+UF5bp+FfkcN77BlaMrJbjpq3iFI=;
X-UUID: 5cf45de29d9b4cf2ab2af385210410a1-20210129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1273234991; Fri, 29 Jan 2021 02:18:55 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 02:10:14 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 18:10:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 Jan 2021 18:10:13 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: <michael.kao@mediatek.com>, <fan.chen@mediatek.com>, Zhang Rui
 <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [v6,0/3] mt8183: Add Mediatek thermal driver and dtsi
Date: Fri, 29 Jan 2021 18:10:09 +0800
Message-ID: <20210129101012.25180-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051859_596605_000FB39E 
X-CRM114-Status: GOOD (  14.22  )
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

This patchset supports for MT8183 chip to mtk_thermal.c.
Add thermal zone of all the thermal sensor in SoC for
another get temperatrue. They don't need to thermal throttle.
And we bind coolers for thermal zone nodes of cpu_thermal.

Changes in v6:
    - Rebase to kernel-5.11-rc1.
    - [1/3]
	- add interrupts property.
    - [2/3]
	- add the Tested-by in the commit message.
    - [3/3]
	- use the mt->conf->msr[id] instead of conf->msr[id] in the
	  _get_sensor_temp and mtk_thermal_bank_temperature.
	- remove the redundant space in _get_sensor_temp and
	  mtk_read_sensor_temp.
	- change kmalloc to dev_kmalloc in mtk_thermal_probe.

Changes in v5:
    - Rebase to kernel-5.9-rc1.
    - Revise the title of cover letter.
    - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL"
    - [2/2]
        -  Add the judgement to the version of raw_to_mcelsius.

Changes in v4:
    - Rebase to kernel-5.6-rc1.
    - [1/7]
        - Squash thermal zone settings in the dtsi from [v3,5/8]
          arm64: dts: mt8183: Increase polling frequency for CPU thermal zone.
        - Remove the property of interrupts and mediatek,hw-reset-temp.
    - [2/7]
        - Correct commit message.
    - [4/7]
        - Change the target temperature to the 80C and change the commit message.
    - [6/7]
        - Adjust newline alignment.
        - Fix the judgement on the return value of registering thermal zone.

Changes in v3:
    - Rebase to kernel-5.5-rc1.
    - [1/8]
        - Update sustainable power of cpu, tzts1~5 and tztsABB.
    - [7/8]
        - Bypass the failure that non cpu_thermal sensor is not find in thermal-zones
          in dts, which is normal for mt8173, so prompt a warning here instead of
          failing.

        Return -EAGAIN instead of -EACCESS on the first read of sensor that
        often are bogus values. This can avoid following warning on boot:

          thermal thermal_zone6: failed to read out thermal zone (-13)

Changes in v2:
    - [1/8]
        - Add the sustainable-power,trips,cooling-maps to the tzts1~tztsABB.
    - [4/8]
        - Add the min opp of cpu throttle.

Matthias Kaehlcke (1):
  arm64: dts: mt8183: Configure CPU cooling

Michael Kao (2):
  thermal: mediatek: add another get_temp ops for thermal sensors
  arm64: dts: mt8183: add thermal zone node

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 140 +++++++++++++++++++++++
 drivers/thermal/mtk_thermal.c            | 100 ++++++++++++----
 2 files changed, 215 insertions(+), 25 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
