Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D67DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSafCXpipRSxzzFpFX0dXj3lah5yTsQeNolmAjxvtUw=; b=nY1CqMJFvaaWh6VdjKifcv16p1
	40uFn/59TWnXILRLOaMGfiM2XegiPM7otE7eg7rzqPby4x6w4wGD9G3+XPfx90ZilUMZn2ncIM14P
	2F6TFjjnSrvg0BerJDkWtzvZDqRFZh3n7uqjnoAAHjHWq1uVaH+HkOUohX/gyoROVf4fVuActwa6U
	E3i4n6FHS1NfS6XDIGOBpooN0Z7eGN9OtAnMT4tabIls7pFQ4WNIpwfWBvJCCi9rDNIZgNdBEqiy3
	yhFHjdbxUW5mQDDtoPZfj0MqQrFg1oA8pWt/Fuw2qLkV1+ltaz9NZOu9THSrDmpnYbxRGcIvQuc4S
	FzsLo8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4SkA-00GZyo-DS; Thu, 23 Jun 2022 19:43:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sdd-00GWpp-7X; Thu, 23 Jun 2022 19:37:15 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 09F7966017E9;
	Thu, 23 Jun 2022 20:37:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656013029;
	bh=lwViBhJmQ4/VLbe6swJu1r+MvFhkFBSR7vNRdATdHGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvZ2UyUNN7W3hH7fIv4ijJ4u54yR4ttyl7sF731m2+vrdlaGq11/BgdbNdx47Q7Fd
	 sJk8ScUQuYDXFWzYJQG577TfaibR87aK5291xkThfd63qkgcyCWzb9LotVSgQcWznl
	 eBHh9U5yG7UKezERUN4sEE3ttSaZE2OQiEEHgone5yNJgD4zctTzgdhfovXVM4dJz4
	 xAAbphNQoju41Jf+PZeefeFOIYVvkpeU2I+OB6fzQvQ59MWFCIuLYzzat2OwCCNqUC
	 eWU827r9gblwPaKQq264XTbx8GL4kuRDWNPORAAdSudIOSPeBi9ezLsxJL42bFU3xJ
	 PNp3BXGfJqtqQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be optional
Date: Thu, 23 Jun 2022 15:36:59 -0400
Message-Id: <20220623193702.817996-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623193702.817996-1-nfraprado@collabora.com>
References: <20220623193702.817996-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_123713_506359_56A6F80F 
X-CRM114-Status: UNSURE (   8.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add missing "minItems: 1" to the interrupt-names property to allow the
second interrupt-names, "wakeup", to be optional.

Fixes: fe8e488058c4 ("dt-bindings: usb: mtk-xhci: add wakeup interrupt")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

---

(no changes since v1)

 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 892718459d25..63cbc2b62d18 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -57,6 +57,7 @@ properties:
       - description: optional, wakeup interrupt used to support runtime PM
 
   interrupt-names:
+    minItems: 1
     items:
       - const: host
       - const: wakeup
-- 
2.36.1


