Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6o8TlxQnqCcgjEKi0Ej+SpL/q0kNjvIf//BdjdNmJNw=; b=Lt8W55fg7zK4sD
	YMMxMj4IdULb3tI5Qc9P6MWQFr3n7zJfv2rJmoF5LxHQ4MNPPeg2wy9icv67Qi7Y8LAvNIASzGB+n
	dkutrNzsvUycovGyrzIWij/EaKVveLmqrWleL1XSs2K9z2Ow5myoowGPLQ84TozkfnRXTgYPR9ZRD
	WmY5LYFjTVRB2oqGxuFby9eGkUXAdS/JR24QrrCBB9Y7YWUp/MSTm8cMDyTJskNooCSAnhjWhunHH
	pwIq+nJRmomhuBgQf7LHVjDHQXp1+rtSdDzp3eeckq72N4GQ6Sd/VbeslK1p29TthVeK9YIAv8tHP
	Snb7muYc/yRnH3Ug1ORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npM1t-00EKKF-3f; Fri, 13 May 2022 03:31:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npM1O-00EK0l-AZ; Fri, 13 May 2022 03:31:19 +0000
X-UUID: c585bd74c785433f87281c2665b37b45-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f3207785-94f5-40ad-aded-183efc726ecf, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3aee0ef2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: c585bd74c785433f87281c2665b37b45-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 299258035; Thu, 12 May 2022 20:31:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 20:28:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 13 May 2022 11:28:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 May 2022 11:28:50 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <djakov@kernel.org>, <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [RESEND v4 0/2] Introduce MediaTek CCI devfreq driver
Date: Fri, 13 May 2022 11:28:30 +0800
Message-ID: <20220513032832.17645-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_203118_469411_1B0149ED 
X-CRM114-Status: GOOD (  12.12  )
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
