Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0RJIEu1H5AoRimltZhjlWrx9TE0LGki2y6NizMxJ9FY=; b=eLV03dB4/ggHuv
	nMvWTPjKxZN/QFLY9kii/u4nxJt+QdRePVOt5KTGI1MY2vT+dOg9noUjXLxNtBnx7orxlImKJ+Lv6
	hZg6kp9ytWDdCLhnNUTlStkbF+1t+qnwBDldhWX0ZWVz1FXGPS7GpxFloJ0ya+3+MQ3I8KouNcTUX
	IZWQCVqxF633f+jsSsyZJLB5JCLIkANClmD/lgNPnniZXCfEcL0zf0hxcdnjspL1XWIeEE53kpbnL
	za/yipRCVdAdrYPvQyYUholsu4XW7jR+GiiwVXM+ExZANGwCemyC4ub0xVKkhOHYbnuoGzNW/5ZJR
	xsPE+6jbzrB1JiGhRbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2YJ-00CatA-SC; Fri, 20 May 2022 13:20:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2Y8-00CaoT-Gj; Fri, 20 May 2022 13:20:14 +0000
X-UUID: 3f0f5679104a4e528cac377dc10f6d08-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:cb1e3a65-fdfb-4d36-8db2-06770d15f9e6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:77daf5e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 3f0f5679104a4e528cac377dc10f6d08-20220520
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1536843743; Fri, 20 May 2022 06:20:01 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 06:19:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 21:19:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 21:19:58 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v5 0/2] Introduce MediaTek CCI devfreq driver
Date: Fri, 20 May 2022 21:19:54 +0800
Message-ID: <20220520131956.31150-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_062012_588157_EC9DD037 
X-CRM114-Status: GOOD (  13.07  )
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

Changes in v5:
- Modify some binding description.
- Remove pre_voltage member.
- Not to enable/disable intermediate clock.
- Not to "put" resources that using devm_ variants.

Resend v4:
- CC interconnect maintainer.
- Change sign-off sequence in commit message.

Changes in v4:
- Add a maintainer in the binding document.
- Modify clock description.
- Add binding document into MAINTAINERS.
- Replace format specifier %d with %ld.

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
  dt-bindings: interconnect: Add MediaTek CCI dt-bindings
  PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver

 .../bindings/interconnect/mediatek,cci.yaml   | 140 ++++++
 MAINTAINERS                                   |   1 +
 drivers/devfreq/Kconfig                       |  10 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/mtk-cci-devfreq.c             | 474 ++++++++++++++++++
 5 files changed, 626 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
 create mode 100644 drivers/devfreq/mtk-cci-devfreq.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
