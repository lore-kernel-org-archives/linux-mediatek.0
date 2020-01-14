Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEB6C33CB1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 12:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42FA24676
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 12:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKoDneWk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HsajmC5/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42FA24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LCNK6INs0O/eGn10T/titeUcU+4QvOBPVn4prtUVkRA=; b=EKoDneWk6mfagl
	UF7YZjw7xlA9mHMwxm8g1a/WTJs6KsN47iUXSrKtveQ0xbmM8cMTjCAej/4amwGKt0LywdNotliXL
	kh0lI3/VJl2/CO0Ksm86vL7ojmiEMO0KZuRtNsf9dc/4zYVlxCEUPP7IADz/Oz4MAtLYFxsvQ0Q3R
	Y/HlqCIldhf8rsm/JcASKj7DnR42VXLtOkXIAdmVOI+nzoGHQHScWPyZHX4hDlk/Btl2veDE2wzPt
	JkHBWWfyjoGjKHsfgH9pW27hXzbFiJJ9qaggjkABC6A+nQv6fr8Qn8aGPOJJ8tyMzZmXnTXtRKWzR
	Oc0AWmQfw7oiBBTXQCvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irLML-0007lW-P3; Tue, 14 Jan 2020 12:31:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irLMA-0007d2-5O; Tue, 14 Jan 2020 12:31:42 +0000
X-UUID: 36bc562da80a47d3a61f8e203b6d4969-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QRMmPmOayCbvin03gJizFCVhejoqmtZkRD1DyKfCPNE=; 
 b=HsajmC5/7BQVApvHTqDNXBR+GWKc3CUx+X70bXUuKYbmvuZmw+v4QSgBwvSqSexVlHvulJjnti4nlY2cWfeyxyh451JE5xnU3VzFaSMNZMiF1s39vGwQFVMOrgvManc4IPUeel2GMNxHG6iMbjsu4NBzB6x/1V6PdEZ9EU9mTOQ=;
X-UUID: 36bc562da80a47d3a61f8e203b6d4969-20200114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 530064676; Tue, 14 Jan 2020 04:31:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 04:28:59 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 20:27:39 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 20:28:53 +0800
From: fengping.yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH V3] add mtk matrix keypad driver for keypad on MTK SoC 
Date: Tue, 14 Jan 2020 20:27:37 +0800
Message-ID: <20200114122738.103344-1-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_043138_204402_81C9F788 
X-CRM114-Status: UNSURE (   6.86  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Change since V2:
- add wakeup source optional property in dts node
- update debounce time as microsecond
- remove origin hw-map-num and hw-init-map properties
- use matrix-map to define keypad rows, columns and keymap
- remove tasklet and use thread irq to deal with keypad interrupt
- use devm_XXX API to get device resources
- modify dts parser using matrix-map API
- modify irq handlers using for_each_set_bit to detect which key status changed
- remove surplus log 
- remove surpluse header file
- replace readw with memcpy_fromio to get keypad status registers value
- fixed other issue according reviewer comments

fengping.yu (2):
  dt-bindings: add matrix keypad documentation
  drivers: input: keyboard: add mtk keypad driver

 .../devicetree/bindings/input/mtk-kpd.txt     |  55 ++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |   8 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mtk-kpd.c              | 280 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
 create mode 100644 drivers/input/keyboard/mtk-kpd.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
