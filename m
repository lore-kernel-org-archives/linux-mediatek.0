Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbcxgeMZKfnmmjFwrmrHb8y+YOe8nEWZaNeIOrV1Hfk=; b=XqmxZt/L4B66KH
	f4/taVLlNiuOIShquTnpfMqhFLmYpGisr/kLcR/BeL6IVP6BPdlG1l7qli1AHCkrsXQSyj6KQ4ghn
	BIEDqMgb2E84dyzrkM8TGpHil3Fm1pQ/12GT77QQzk2WoOREeKTFpc6dQA4WnRl5hGLjHQllggXmo
	wgTehuajeoZvT+59Zjej03Jev1CjanAKfT2Hhz7hGdEinCWIJV8dCa3bhbDq+vgAQZnQjMdPndyAw
	GdBZWQJxniil9Q0TXPfvmH+k3k8UXasUQOkHI8/c4s/2mGCFJKsdTEuGzMC0+ybaDQdf15yLOgWGi
	OySGlLMpcNrpzqntFEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niyFz-009Zhm-8i; Mon, 25 Apr 2022 12:55:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niyFw-009ZhE-HP; Mon, 25 Apr 2022 12:55:57 +0000
X-UUID: 3c7a724e1e7e40dcba2ed7ab94dd446d-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:98609b32-d58f-4df4-b9d7-51f2760bd044, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:0928dff0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3c7a724e1e7e40dcba2ed7ab94dd446d-20220425
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 439453636; Mon, 25 Apr 2022 05:55:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 05:55:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 20:55:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 25 Apr 2022 20:55:49 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v3 0/2] Introduce MediaTek CCI devfreq driver
Date: Mon, 25 Apr 2022 20:55:44 +0800
Message-ID: <20220425125546.4129-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_055556_621197_F78838AB 
X-CRM114-Status: GOOD (  12.42  )
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

The Cache Coherent Interconnect (CCI) is the management of cache
coherency by hardware. CCI DEVFREQ is DVFS driver for power saving by
scaling clock frequency and supply voltage of CCI. CCI uses the same
input clock source and power rail as LITTLE CPUs on Mediatek SoCs.

This series depends on:
Chanwoo's repo: kernel/git/chanwoo/linux.git
branch: devfreq-testing
[1]: PM / devfreq: Export devfreq_get_freq_range symbol within devfreq
[2]: PM / devfreq: Add cpu based scaling support to passive governor
[3]: PM / devfreq: passive: Reduce duplicate code when passive_devfreq case
[4]: PM / devfreq: passive: Update frequency when start governor

Changes in v3:
- Move binding document to 'interconnect' and rename it.
- Add COMPILE_TEST dependence symbol.
- Remove need_voltage_tracking variable.
- Move mtk_ccifreq_voltage_tracking() code into mtk_ccifreq_set_voltage().
- Add an interation limit in the while() loop.
- Replace 'cci_dev' with 'dev'
- Replace old_* with pre_*
- Remove of_match_ptr()
- Use module_platform_driver()

Changes in v2:
- Take MT8183 as example in binding document.
- Use dev_err() instead of pr_err().
- Use 'goto' statement to handle error case.
- Clean up driver code.

Johnson Wang (2):
  dt-bindings: devfreq: mediatek: Add mtk cci devfreq dt-bindings
  PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver

 .../devicetree/bindings/devfreq/mtk-cci.yaml  |  72 +++
 drivers/devfreq/Kconfig                       |  10 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/mtk-cci-devfreq.c             | 479 ++++++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
 create mode 100644 drivers/devfreq/mtk-cci-devfreq.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
