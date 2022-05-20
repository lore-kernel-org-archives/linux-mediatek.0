Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTQlK0UdVSPtTUP++CMihAMZq+P3j/tgbDv15/h2kms=; b=myf6Y2V86UEkV9
	q9nP7gkJLN5YoXjU+PpPzIQ8nWNYfCGUGwSTn4KveVEYtNO1FdYTr/50neyLqXwmEVuKDIXq0bXYW
	RAgE4o6DB8IadKdTTozmHxmaSgvWU+32k6eiFvwarzqbdk9ixhVZAZYTXcIiREn/wdNDHPHnnNdj9
	fY4bVTUqKv/Uh0NJrAj3RSqrvkrQg5vZZaK78p5R2qp7Djo1sBZuI36ThGyaDSvHV8RtSK6jrUmY/
	8o/eQEe0b8TrG2qbw3M4xsptkELcqMxrJf15Vk6x+CAZAgTFgvkbQS/UaORjvbcwz3k16bYNnr9cr
	9VmVt03v2zmvzceAD7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns226-00CRXt-SZ; Fri, 20 May 2022 12:47:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns21S-00CRFU-6q; Fri, 20 May 2022 12:46:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 702821F462B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050785;
 bh=wjZR/q/Koar3Z14wlMyDBlnpLWB8CYxTpYy9Z0nOJxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KTvCEyHrN1lzQ6fX3qi9RxhiLsck9Z9hyq/ApXaSpRPfIYGXIfRCFEqiZ195msond
 agxRq9XNH4Pl2hfwhNEGy2gLRNrrd8EGtaep0k6dioRif+6wl6xmRDWRHq41dLs9kt
 WN5o05Mp8dTx3Lv8sUH0l/t0E1PP+8hwgmI9ik0W/uOItXeIWO8Th8d64gsiyA2w7e
 +wPFYrToKGWj0PlKP/LAsGITNp5ZkKGEs5k950LkTtrK9R7ej6CoYCVw6ONbDlljZ9
 cqyXMiO23sPvt3LpGKYkcRC8++CWuz6GiwUBRTnKIrpDK64Vx8yXZRZMtz9lG4doWB
 6D1kgH8bKSwOQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 johnson.wang@mediatek.com, hsin-hsiung.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC
 and keys
Date: Fri, 20 May 2022 14:46:16 +0200
Message-Id: <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054626_417110_D10B3671 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT6331 is a multifunction device, providing RTC, keys and more: add
the necessary compatibles to start implementing the basics.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index d59063503b0d..2a9533c47365 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -30,6 +30,7 @@ Optional subnodes:
 - rtc
 	Required properties: Should be one of follows
 		- compatible: "mediatek,mt6323-rtc"
+		- compatible: "mediatek,mt6331-rtc"
 		- compatible: "mediatek,mt6358-rtc"
 		- compatible: "mediatek,mt6397-rtc"
 	For details, see ../rtc/rtc-mt6397.txt
@@ -55,6 +56,7 @@ Optional subnodes:
 - keys
 	Required properties:
 		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+			      or "mediatek,mt6331-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
