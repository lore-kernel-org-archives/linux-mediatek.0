Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C3FC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05laW2U2aanX1BnyvNjeBV2y8hpKydG+cBolNRJxwCM=; b=dsX56h5pxEnaqV
	V7RCkizvPrKBqT+k+bR5o6gM8mEBVLNWuk2jYO68MBOHHFkF+lJb2EwdHfQmKKJrHUuumzq/5bu6+
	qdpVoU3ge9RU7/XzsGkHx2n2ihn5/+bV+SuzK+QLFMdgJwjgb4ueNh0ouKUQmKtnfxZ0c8bLgCJZT
	CPX8uD8gRlz7VGqzRew0v2dBRXMqqeXsGWzK7iJgdjrNo6o6RY4PeHZB2JSDcjFtYNQY1jwfV7O9A
	08e5f6/KBwAOCuSGL+EM2hbHfU5tt4WqKRtMLDDSbL/sitSnSSphC7fJ3ZNf087KNGQWieOfmY9to
	Pr9Wz2UC4q2LYEK+6giw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD8A-00Doin-4w; Sat, 08 Oct 2022 16:56:54 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD7p-00DoY1-Tu; Sat, 08 Oct 2022 16:56:36 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 697236045F;
	Sat,  8 Oct 2022 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665248191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=05laW2U2aanX1BnyvNjeBV2y8hpKydG+cBolNRJxwCM=;
	b=vqT4Hf95SJowAj4HZsWr9ud9xmbd7UHIfIQ615bWtpsYUSzYjYiRO4zOTHNGzLq5TiqoiH
	wTDgh2Kp6fkquj8gKwQkIoPHrGYFWTXmYWP6+6KVr8Qa6hp5IwmdeyP61LxNUjgfAIyODK
	VxRZ2a/pIm/u35nhx2FvJN2SaYZz5jY=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 86A5F80098;
	Sat,  8 Oct 2022 16:56:30 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Add mmc-support for mt7986
Date: Sat,  8 Oct 2022 18:56:25 +0200
Message-Id: <20221008165627.114782-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 58070d61-a93b-4ada-813c-c801ba3c1945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_095634_134212_9BBF03F3 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This small series adds dt-binding and driver change for supporting
mmc-controller of mt7986.

Sam Shih (2):
  dt-bindings: mmc: Add compatible for Mediatek MT7986
  mmc: mediatek: add support for MT7986 SoC

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  1 +
 drivers/mmc/host/mtk-sd.c                         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1


