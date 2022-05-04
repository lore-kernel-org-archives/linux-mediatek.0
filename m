Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5529EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wk5aP6Ugs1C1wu3dRMcAExk5OjSscbSCre1qJLGtiFU=; b=wWeGTzqXUPcGQ5
	4/NWLYL9p0qB0fF6Q6RsnQUIK8i3FHj+rCDNsozKP8+K3bkQgLATWj6D7WTiEE7COtmEYfRs+8kmn
	n0RRGYKX5WG9S2SeilrgD/hvPzSyvL2mGGJKkEuFjy2p5u89FdxjYkq0hi0OuPr+HHje1755AMKcV
	D1fY92LI0IH6MiSd0m64dD5DflN0Jh1ehSxfyrkk6lOEk0XG7VaVBLHynWCQNZDXjaevLUAzk8i9B
	p28T7HEc9aoYLj7gInVgaxcYgXU50AR7Je8113baOYu5ltdQdkQxJiElf/D/pq+TFtHDxFaZZvwdr
	vCjtRuddGVJwz81DnqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEhc-00AuH3-0o; Wed, 04 May 2022 13:06:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEhO-00AuAN-S0; Wed, 04 May 2022 13:05:48 +0000
X-UUID: e7598c10d21d465d9b91c427a64585d3-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a667c5e4-fffd-44c9-a57b-9894447ff539, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:50
X-CID-META: VersionHash:faefae9, CLOUDID:ff5d8cb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:801,TC:nil,Content:3|8,EDM:-3,File:nil,QS:0,BEC:n
 il
X-UUID: e7598c10d21d465d9b91c427a64585d3-20220504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423155846; Wed, 04 May 2022 06:05:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 06:05:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 21:05:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 21:05:40 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v5 0/9] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Date: Wed, 4 May 2022 21:05:31 +0800
Message-ID: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_060546_931210_7F8250AC 
X-CRM114-Status: GOOD (  13.66  )
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

Cpufreq is a DVFS driver used for power saving to scale the clock frequency
and supply the voltage for CPUs. This series do some cleanup for MediaTek
cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
devfreq[3] which are supported in MT8183 and MT8186.

Changes for v5:
1. Modify the description for the reason we need to use mediatek,cci.
2. Drop [07/14] cpufreq: mediatek: Add .get function.

Changes for V4:
1. Revise drivers from reviewers' suggestion.
2. Fix name of opp table issue.

Changes for V3:
1. Rebased to linux-next-20220414.
2. Drop accepted patches.
3. Drop "cpufreq: mediatek: Use maximum voltage in init stage" because we
   make sure the voltage we set is safe for both mediatek cci and cpufreq.
4. Rename cci property to mediatek,cci.
5. Adjust order of cleanup patches.
6. Add new patches for cleanup, handle infinite loop and MT8183 dts.
7. Revise drivers from reviewers' suggestion.
8. Revise commit message of some patches to avoid confusion and misunderstand.
9. Revise "cpufreq: mediatek: Link CCI device to CPU".
   We do not return successful to pretend we set the target frequency done
   when cci is not ready. Instead, we find and set a safe voltage so that we
   can set the target cpufrequency.

Changes for V2:
1. Drop the modification of transforming cpufreq-mediatek into yaml and
   only add the MediaTek CCI property for MediaTek cpufreq.
2. Split the original patches into several patches.

Reference series:
[1]: V1 of this series is present by Jia-Wei Chang.
     https://lore.kernel.org/all/20220307122151.11666-1-jia-wei.chang@mediatek.com/

[2]: The MediaTek CCI devfreq driver is introduced in another series.
     https://lore.kernel.org/all/20220425125546.4129-1-johnson.wang@mediatek.com/

[3]: The MediaTek SVS driver is introduced in another series.
     https://lore.kernel.org/all/20220420102044.10832-1-roger.lu@mediatek.com/

Andrew-sh.Cheng (1):
  cpufreq: mediatek: Add opp notification support

Jia-Wei Chang (3):
  cpufreq: mediatek: Move voltage limits to platform data
  cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()
  cpufreq: mediatek: Add support for MT8186

Rex-BC Chen (5):
  dt-bindings: cpufreq: mediatek: Add MediaTek CCI property
  cpufreq: mediatek: Link CCI device to CPU
  arm64: dts: mediatek: Add opp table and clock property for MT8183
    cpufreq
  arm64: dts: mediatek: Add MediaTek CCI node for MT8183
  arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq

 .../bindings/cpufreq/cpufreq-mediatek.txt     |   7 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  36 ++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 285 +++++++++++++
 drivers/cpufreq/mediatek-cpufreq.c            | 399 ++++++++++++------
 5 files changed, 608 insertions(+), 123 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
