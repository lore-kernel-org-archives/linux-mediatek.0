Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84911C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nl37GS74ZwU1ZCmlt5az1henVr/5XHKi4MxwqarmO7g=; b=DItgCvEKb1Q4nA
	Eo3LNnpPzgQ0wt3J0h2kAzT8Mbacd9cI9dxE3Kxl+6ZbxMdhVhf/3OLhW5x35y9M0v3+mD5zIGjGV
	5Q/8z006LGuNdp5C8nCCq9ZoMHS7GhlKan2HRzDuK8x++594XwAR4CR9cwLc+9G6IGRS7O9YagCd3
	ArBiYOwjIJbqyTkaKXWf4fPkE1xS0zZOEAshfdMkmjbF7f9eRMzhUOw7rnfjOehgug/vWi8n5Ya/T
	G5zCv8K5uu74qbYTb7BN7ehKxIoejdif5QqBJyVNIPfryhz/mMZLeVg1fRLtSPcGAgGa1bPq6mhev
	tjsl0RIF8GF3j9B3eAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgu3-00F2Gu-3G; Fri, 08 Apr 2022 05:11:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs6-00F1BQ-6E; Fri, 08 Apr 2022 05:09:23 +0000
X-UUID: e6e73adaae944c819349e91a7e8492ec-20220407
X-UUID: e6e73adaae944c819349e91a7e8492ec-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1202059544; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 12:59:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:10 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 00/15] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Date: Fri, 8 Apr 2022 12:58:53 +0800
Message-ID: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220922_246587_2212DC66 
X-CRM114-Status: UNSURE (   9.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cpufreq is a DVFS driver used for power saving to scale the clock frequency
and supply the voltage for CPUs. This series do some cleanup for MediaTek
cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
devfreq[3] which are supported in MT8183 and MT8186.

Changes for V2:
1. Drop the modification of transforming cpufreq-mediatek into yaml and
   only add the MediaTek CCI property for MediaTek cpufreq.
2. Split the original patches into several patches.

Reference series:
[1]: V1 of this series is present by Jia-Wei Chang.
     message-id:20220307122151.11666-1-jia-wei.chang@mediatek.com

[2]: The MediaTek CCI devfreq driver is introduced in another series.
     message-id:20220307122513.11822-1-jia-wei.chang@mediatek.com

[3]: The MediaTek SVS driver is introduced in another series.
     message-id:20220221063939.14969-1-roger.lu@mediatek.com

Andrew-sh.Cheng (1):
  cpufreq: mediatek: Add opp notification for SVS support

Jia-Wei Chang (13):
  dt-bindings: cpufreq: mediatek: Add MediaTek CCI property
  cpufreq: mediatek: Use module_init and add module_exit
  cpufreq: mediatek: Cleanup variables and error handling in mtk_cpu_dvfs_info_init()
  cpufreq: mediatek: Remove unused headers
  cpufreq: mediatek: Enable clocks and regulators
  cpufreq: mediatek: Record previous target vproc value
  cpufreq: mediatek: Move voltage limits to platform data
  cpufreq: mediatek: Add .get function
  cpufreq: mediatek: Make sram regulator optional
  cpufreq: mediatek: Update logic of voltage_tracking()
  cpufreq: mediatek: Use maximum voltage in init stage
  cpufreq: mediatek: Link CCI device to CPU
  cpufreq: mediatek: Add support for MT8186

Rex-BC Chen (1):
  cpufreq: mediatek: Use device print to show logs

 .../bindings/cpufreq/cpufreq-mediatek.txt     |   4 +
 drivers/cpufreq/mediatek-cpufreq.c            | 609 ++++++++++++------
 2 files changed, 401 insertions(+), 212 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
