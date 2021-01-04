Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25317C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:15:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC6C20758
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC6C20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EZa4jvZ9x+ruUi8LhI0Lz9+bbD6ssLEtc8glNKBOXyE=; b=Wr0RAZSxXMX1pOIu2XQDiFRBhc
	nRsvJT8CXT2snWaOcxyOUJ6Yud9B8LTSOjZG4FnuH/jgbuFJAsAJNEUVO8ZRHdQf+KXv3PVN5galc
	I91jMl5/b/h6owCufzgZIFkrv3KzfmCrQ1+v8tQ6eWi2mawZ6Scmtneh9A/bioVmnl5VHNsJhd4lh
	dTHFKp/lxtsZyQhSQr8IsU3SpOEqIAnkHgsAV22llsO8lSzFT5R6Xj5z16u//8jk2EugT/tAX0/m4
	EnbEejI2+zYppibhLohMYvmeTAU5rNvzUyXKfX7tSC+hGMxG/CFMT/6XbQFbD42FVFJ4JFORLVt/j
	68VkN5xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwL1k-0007Wq-D0; Mon, 04 Jan 2021 08:15:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwL1f-0007Ua-JM; Mon, 04 Jan 2021 08:15:40 +0000
X-UUID: f592a99deb5143c285d50767a20f3152-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4hf/qXSWcl4930bgfEywF/5zjPfWeRpQ/DzX3+/HeqU=; 
 b=f9fOWK9ONPMvny+AHYZgJyxtAQmfDUu4/w8Op4fuWTbyBGC89TaS9aeSy6ygnkInp9QuDGdl7W4KznaS0YztyDZ+OXD2zlEkdpNLzLBsxB4zgSASjcDnNouZBL/hFdzFDjl384TDDS2FPbTxWpRKJhSZgXil5RCQxiCvv5cXDo8=;
X-UUID: f592a99deb5143c285d50767a20f3152-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1827427168; Mon, 04 Jan 2021 00:15:33 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 00:08:27 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 16:08:25 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 16:08:26 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will.deacon@arm.com>
Subject: [PATCH 0/2] arm64: Support pwrap on MediaTek MT6779 platform
Date: Mon, 4 Jan 2021 16:08:21 +0800
Message-ID: <1609747703-27207-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_031539_867246_0B4C66F5 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Anson Huang <Anson.Huang@nxp.com>, Max Krummenacher <max.oss.09@gmail.com>,
 agx@sigxcpu.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 argus.lin@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds pwrap on Mediatek MT6779 platform.

change since v1:
  - adds pwrap node at mt6779.dtsi
  - set CONFIG_MTK_PMIC_WRAP at defconfig

Argus Lin (2):
  arm64: dts: mt6779: Support pwrap on MT6779 platform
  arm64: configs: Support pwrap on MT6779 platform

 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 9 +++++++++
 arch/arm64/configs/defconfig             | 1 +
 2 files changed, 10 insertions(+)

--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
