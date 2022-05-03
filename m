Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B456C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQhQ4llIY0vDu1NmgL5Wd+6zT+ADfpuOf1ipp6MOmwo=; b=AhKosIS8Pw+GwM
	oOIVMrzrnK74pa7tsNGkQjr9nmIIel+Owpl2fyfJXxPejigVznV1/YS+b97Qbuqe5dRd7WdF0Vzfh
	pXRK6FuzolpV7WUyjhYnPDaSTeJ37NtSWSf2gRZYfLP5siFmgSnzbs1xLWrGYQAm25u0HlGRiJrxj
	n/c/7L606IjSw/UGMtfWv4asKclcxg8g3M/uylAHhlgeNapO3ZwVcozN0vzJ9RPkhDPLbC/G1FOGc
	O/vvvGS1uDpONL1t11H0MqRtqHY19fUgvcnwlFqOdtVcGABlkL51FLWUEMcBI3jJ9ZOh/DFEukilh
	3aHialNek4SudV06Y8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqEy-005Rag-OI; Tue, 03 May 2022 10:58:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqAX-005OqP-8h; Tue, 03 May 2022 10:54:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 639F41F43E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575252;
 bh=8SQUMn7/rW2ARSTN1rfGHqVZlZic7Iz6w4XuPwEGq+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XHgq1XW164qqqodKIoQVx4LNEUC3DuvrjCnn5OuM4qU3AV9g6gUPmgUaCFTRcLtjx
 VbFX6xg8y3af8biyZlM5zlCmY2BPXHcp36EN6x9uBZ3O0FIiOWxxw8WTlj+HP9Pg9R
 7Wa/YDZ4z9XwFRbvL46sPwdbfSg7UwVi1W9sCvFmJtm0Abl8ow/0g0+mhJA7/PcpZR
 ZXS2sfGOeGAVji0QK9Kvilew5NyJ7vPikTCv9XfqT1HSHz4LmuWZkjYwwYs1TrOoks
 STteOLz+60eqlKSnG/WWEvoh7JMwxWnS7DtAxJvDSRLIn0WwRXMGvNEzPukfgtYOup
 nQqNsRDUVqopg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] dt-bindings: pwm: pwm-mediatek: Add documentation for
 MT6795 SoC
Date: Tue,  3 May 2022 12:54:05 +0200
Message-Id: <20220503105405.54832-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
References: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035413_467841_1A74D464 
X-CRM114-Status: UNSURE (   8.38  )
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

Add binding documentation for the MT6795 Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 25ed214473d7..033d1fc0f405 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -3,6 +3,7 @@ MediaTek PWM controller
 Required properties:
  - compatible: should be "mediatek,<name>-pwm":
    - "mediatek,mt2712-pwm": found on mt2712 SoC.
+   - "mediatek,mt6795-pwm": found on mt6795 SoC.
    - "mediatek,mt7622-pwm": found on mt7622 SoC.
    - "mediatek,mt7623-pwm": found on mt7623 SoC.
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
