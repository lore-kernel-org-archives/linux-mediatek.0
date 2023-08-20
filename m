Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3ACEE49A6
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Aug 2023 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ttFFnddrbDryzWp+rWK4n1Z6VL4bZZQrFTzcJyGs58=; b=ap6pE9weQ8qK3r
	20f7Argr95N/eX5pAjdwoY90jyECdWobPITrGZVueyGeSokPB4/GS8gJ4rJT7WAh+/CdiVcxYh8Sw
	jfmzfOHy5QUMR2LKFNeLhdOn3cP2vVda15Jf5+csBMcrm4LGSTVzv4DAPcKhIZzfI5f6hZgEp9Rwl
	Bv2ZtqniQzND5MK0I7is11mpKB/YctnE1NGQPAiGvQumVIhnwnUMy4wKYE9/kdCrFhNGbSXPdkRhd
	t/ROgb4xGDbKHDSiiwgeXeprctnCNG1yy4tPWKwJ1VhDPRtzJfWddj6ijhZ2BCKUuCOjokJRBbO2V
	rxtEM2BgaqgbzEenIZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPZ-00C6yC-0y;
	Sun, 20 Aug 2023 15:32:17 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPG-00C6sA-0I;
	Sun, 20 Aug 2023 15:32:00 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 24D17100105;
	Sun, 20 Aug 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1692545512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0ttFFnddrbDryzWp+rWK4n1Z6VL4bZZQrFTzcJyGs58=;
	b=w5JJ9w5khdAuJc2SElQWlR9qQ5wuEVb6rv0evDXW2Djfaf2G2fg2dBZKH04oRUL7gO8phb
	o5PuNHHGq8UODCZsXaXDz29Uuj1OlwB7K4vkEf48mmCHRPUQsvScQ5VqUT6gmLsHY73Yge
	l4jwrwCNRwm0q1GJODnnctW7gsJUkJA=
Received: from frank-G5.. (fttx-pool-80.245.78.65.bambit.de [80.245.78.65])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 30220401CF;
	Sun, 20 Aug 2023 15:31:51 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/3] mt7986 DTS fixes
Date: Sun, 20 Aug 2023 17:31:32 +0200
Message-Id: <20230820153135.42588-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 4bbdd863-5dcb-4cc8-96d8-e32299f3a55c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_083158_292609_1819ACA0 
X-CRM114-Status: UNSURE (   6.48  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

It turned out that some SFP needs more power than the default 1W and
cooling-trips can be defined a bit better.

Frank Wunderlich (3):
  arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
  arm64: dts: mt7986: change cooling trips
  arm64: dts: mt7986: change thermal trips on BPI-R3

 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 12 ++++++-----
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 20 +++++++++++++++----
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.34.1


