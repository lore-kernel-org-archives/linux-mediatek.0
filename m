Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAD1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IxgmVl2LjRy+6Fa2W+uzyDrwNR/QrzmkOl8Qaqm8pWY=; b=NqHjfGQvoVrCXX
	vTqgRWt9Ukq2mHQCG7FfF/Dfsfv5iafYUdTWOjNwJXn2rOxdxB979qLUh5UFXXIIm586UPlNixsJI
	SLugfkgvjEfkWj5FFydj47dius2qG5tm/AmQaxYKRT4KuaDN1sEtfX9Ex7VIolYIu8/1Ql1D5dACi
	rJnxliANyq0z65Due0mVynl5YHqYUjRka9L8wlcQPTZdhlXBqLv6cKuPBBGrSJ4al6QmohoGvU4W2
	alnZh7IaqVTq5eYcYy5iHUiJnydlb0Ys5dQw+H2dk8G4zR+13F3W9fs+gCK9eMawFIEjZFrRqozWz
	jkv8c4LaV3r6g45MIA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoO9-00H97o-0i; Fri, 22 Apr 2022 08:11:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoFg-00H5DN-Aa; Fri, 22 Apr 2022 08:02:54 +0000
X-UUID: dea7f8c0a70b42c887ca04f0591c18f0-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:429b26d5-9a91-4258-9b59-a48cfa6d3637, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:28,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:36
X-CID-META: VersionHash:faefae9, CLOUDID:f1b9c1ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: dea7f8c0a70b42c887ca04f0591c18f0-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1708813974; Fri, 22 Apr 2022 01:02:45 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:52:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 15:52:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 15:52:40 +0800
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
Subject: [PATCH V4 00/14] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Date: Fri, 22 Apr 2022 15:52:25 +0800
Message-ID: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_010252_396991_8C68A944 
X-CRM114-Status: GOOD (  12.33  )
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
     message-id:20220307122151.11666-1-jia-wei.chang@mediatek.com

[2]: The MediaTek CCI devfreq driver is introduced in another series.
     message-id:20220408052150.22536-1-johnson.wang@mediatek.com

[3]: The MediaTek SVS driver is introduced in another series.
     message-id:20220221063939.14969-1-roger.lu@mediatek.com

Andrew-sh.Cheng (1):
  cpufreq: mediatek: Add opp notification support

Jia-Wei Chang (6):
  cpufreq: mediatek: Record previous target vproc value
  cpufreq: mediatek: Move voltage limits to platform data
  cpufreq: mediatek: Add .get function
  cpufreq: mediatek: Make sram regulator optional
  cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()
  cpufreq: mediatek: Add support for MT8186

Rex-BC Chen (7):
  dt-bindings: cpufreq: mediatek: Add MediaTek CCI property
  cpufreq: mediatek: Use device print to show logs
  cpufreq: mediatek: Replace old_* with pre_*
  cpufreq: mediatek: Link CCI device to CPU
  arm64: dts: mediatek: Add opp table and clock property for MT8183 cpufreq
  arm64: dts: mediatek: Add MediaTek CCI node for MT8183
  arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq

 .../bindings/cpufreq/cpufreq-mediatek.txt     |   5 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  36 ++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 285 ++++++++++
 drivers/cpufreq/mediatek-cpufreq.c            | 504 ++++++++++++------
 5 files changed, 670 insertions(+), 164 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
