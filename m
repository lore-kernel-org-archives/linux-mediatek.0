Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D95C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 06:24:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CBF20728
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 06:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCHT+S08";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ao1EG2Hn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CBF20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P0kUeDNsP0zQdki+5QSM/sVmuKpYtQWHOchaynqOXD4=; b=mCHT+S082faP8K
	YgjxcJ45mkGm6VSyelWx8Kiye5mcKW1AarS3kt9ez0xfCu87IWMHBYWTQET0BtoB/lCkQfDN6hN36
	vw4Nw4cWdK+SFFPei03SwpZa97RlcIT87AHaKfxcBpS58SSPMAkxY5FM5zHKC8z+gflMcH7wwdkEV
	fHX/gCwO913NdlKOdwTspAYQeCiuuGA3tJTEEVDc712iS+sRl43yv8ESEz0uyZDyhfPQQrER8rY4Q
	FeGt6oWfJfDPf9ZV03KZGkUZXqx+JqLGZvnjKADFk5jxg8qEbaEjNekCWMasUOH2GXfQL8FbqRHUH
	3UY9n+1EBNkN9p5M2KqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZTlE-0004of-RH; Fri, 15 May 2020 06:23:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZTl4-0004fs-3O; Fri, 15 May 2020 06:23:49 +0000
X-UUID: f6446ee324a84e54b1d6bd835533eb09-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JKzhC7ZyS4Az8kB6uFAL7FCHI2123du89vRJcZ+CFlY=; 
 b=ao1EG2HnyD5fy2iEl9El8MPa3Uf41MTi/kICMADmQQeHsT7a3cWGHaoamHnh04gimNralyoOdg4cGKGpNhGunTJZXGRKftrbxNGoqTyxW2E+ZXMM0Li+STER+0R8sGKjB45DcdW9fI4LXfJZFLalmRKAKHhJmUNWDebXSIXdOI4=;
X-UUID: f6446ee324a84e54b1d6bd835533eb09-20200514
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1258676876; Thu, 14 May 2020 22:23:42 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 23:23:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 14:23:23 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 14:23:22 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v8] Add matrix keypad driver support for Mediatek SoCs 
Date: Fri, 15 May 2020 14:20:04 +0800
Message-ID: <20200515062007.28346-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9506C491B6E551E93E6FC636CE37D46A8BF0457FA886208279F30A3D36F6DB1E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_232346_145175_FA19638C 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Change since v7:
- specify compatible property as const string
- add maxItem in required property
- squash keypad example nodes
- sort header file with alphabetic order
- align all define values and add MTK_ prefix to make more uniform
- change debounce value to default 16ms if not specified in dts
- remove extra braces
- separate clk prepare as an internal driver function
- add special compatible string
- modify CONFIG_KEYBOARD_MTK_KPD=m to build keypad as ko module

fengping.yu (3):
  dt-bindings: Add keypad devicetree documentation
  drivers: input: keyboard: Add mtk keypad driver
  configs: defconfig: Add CONFIG_ng.yu (3):
  dt-bindings: Add keypad devicetree documentation
  drivers: input: keyboard: Add mtk keypad driver
  configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=m

 .../devicetree/bindings/input/mtk-kpd.yaml    |  94 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |   9 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 231 ++++++++++++++++++
 5 files changed, 336 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
 create mode 100644 drivers/input/keyboard/mtk-kpd.c

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
