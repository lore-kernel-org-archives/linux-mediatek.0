Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CA3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:10:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B4820702
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B4820702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PoUX3jTnNY1sQDZrewT+f8EUuNhp8qXd5tbOD2Rc3Bg=; b=gLNKlrleY5sh82gzkqUJqTukR
	o/b6Wjd01LrvMn1Cm2Qpvlxbsjw+K0WTfz14Xz1CwlsDEL8FyvEdp99cdXd0WGbYddAzbCNOqPrhH
	EZMux8mqbkq8gCReRrXs4qS0nI8uQUOFFt9qn78yOw+LEgARDCPK3WBPh7dBelB+dBe4hV9wjZh24
	8Nr+Drql4HslXhSqpuGOKUFDuoK7xdZU71aDGkyUiv5AAxz7z0pZip5ctTSh9nji5E3/gLCpAhEKz
	M0yfBcpIFNe+Vcerx52/3rOC1159c/ocyYdCQR30/K6DoYl2aTkbkbPbJc/lTij8spsrSfq3JCUQp
	KOCs6xXhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwKwG-0006PU-VR; Mon, 04 Jan 2021 08:10:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwKwD-0006Nd-7y; Mon, 04 Jan 2021 08:10:02 +0000
X-UUID: be0367bfc5ed426f804800360d94c6fb-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+X9H0CSZyO6a6nvs5b8pZMjbsAGVRAJssVAfwhACuSA=; 
 b=hrp9y/fB51KkOFahT48FKjPkzWeT2xgZjqRLLezcBksXANVyXHZZzwsOyBBEqmXgvccJQDaVESjw331J/EZp50/tWWOZX0s7KWnOcAZTPrROdqqZBojLSZNZszyuKCXoH+05iEYtqErJ6bibYsrrR+/WPPSBx03oOVKDpCQ+HpQ=;
X-UUID: be0367bfc5ed426f804800360d94c6fb-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2086621; Mon, 04 Jan 2021 00:09:49 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 00:08:30 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 16:08:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 16:08:28 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will.deacon@arm.com>
Subject: [PATCH 2/2] arm64: configs: Support pwrap on Mediatek MT6779 platform
Date: Mon, 4 Jan 2021 16:08:23 +0800
Message-ID: <1609747703-27207-3-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609747703-27207-1-git-send-email-argus.lin@mediatek.com>
References: <1609747703-27207-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3DCB31C1B1B77694DC1B2B165066C09602E2E195E18C46C67D4FBD0BB5C939062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_031001_500922_42B92E2E 
X-CRM114-Status: GOOD (  10.46  )
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

Support pwrap on Mediatek MT6779 platform by enabling CONFIG_MTK_PMIC_WRAP.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8383016..a2c926f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -479,6 +479,7 @@ CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_SPIDEV=m
+CONFIG_MTK_PMIC_WRAP=m
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
