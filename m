Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8284CC001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsKoa5ClLaGgZAsOra2e5wFriYLbf/iu32Moq+TLna0=; b=pHxsCnEKJdowcq
	fQJablTfzCPB/jLjEvshENv3B7TJWWuwVbed7+F678pX68XXjnEpEx/hsfz7v3k8hwk+MBBYmAIkJ
	M4KE6PeQ/HAhud8PW1MstC7WIFfWPrhwavfozVcd50EyCDHV8+xz/joU/xgq6iVhIXCR9eHLRpcB7
	4HKnLJj28up869kgFRLVWOuOC9CPKLqg8HVxhNX7dzEomu2rnyPJABLGme0SOayfkKYFWClw0DcCj
	b/P1VmvJgQrR0q1cfJ023HZxUhIzo596RHGJ4lVboCA+Bej1p+fvUA2IJ37qOIHxh4dWw7K6DMD1B
	I1bHI48mxajhxamPpfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcI-001nQC-0U;
	Thu, 29 Jun 2023 18:43:42 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcC-001nNg-2p;
	Thu, 29 Jun 2023 18:43:39 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id DA0925FD39;
	Thu, 29 Jun 2023 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1688064213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xsKoa5ClLaGgZAsOra2e5wFriYLbf/iu32Moq+TLna0=;
	b=BsI6oEu+oq0P1beccCVZAJi9yGquXvGiWCzgXhi1bVhi5GiSG9VVdJBfn5C/BxzqNtBwBD
	MXUXaXMIKHRnefJ/f4Yo6FfntJWpLkbRrC7kEBlU/7/2lMTcuoMUnUr7yl5h7FB+8Xoln1
	eMoFqGlw6Ln0zzcLTomv7JasOQjZfGI=
Received: from frank-G5.. (fttx-pool-157.180.227.241.bambit.de [157.180.227.241])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id ABC2C10073B;
	Thu, 29 Jun 2023 18:43:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] Fix emmc hs400 mode on mt7986
Date: Thu, 29 Jun 2023 20:43:16 +0200
Message-Id: <20230629184318.551317-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: bc943361-3c32-42ac-afa6-c1bf0ccbb437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_114337_125616_62F39686 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Eric boots linux directly from ATF without using uboot. In this corner
case clocks for emmc hs400 mode are not correctly setup.

Fix this by adding assigned-clocks and assigned.clock-parents to mmc node.

Eric Woudstra (1):
  arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization

Frank Wunderlich (1):
  dt-bindings: mmc: mtk-sd: drop assigned-clocks/clock-parents

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 ----------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi         |  4 ++++
 2 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.34.1


