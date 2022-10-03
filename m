Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22774C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTjG2IBq4YiYp0Z+21USaQk03ELeEIZtyL0WiW5rA6o=; b=rOliWrfBRv7wxIm5JQbPvGOwcH
	GyH1+MEupBhNL76XLDBq7+c6CIdj3nz0pB7dZO/0n7RtXp8A1yvsg1WRdCmgJ3HgAKfln/D/pxnM0
	rSw6pghVf72969n5eWMM/NGXwSr4VdOt/xLeRWmC4vJJKyr1Wv/FAu3A4QFqIUq44XSEIQpVJZRZG
	9EpTO3YrRtBjTqAx6MrOJKi8akxfCQmILotBnjqBhwKQ36s5tqLPnjQJ5lKv9K3Jc0ueNhk1hS1Z8
	1NN7XQXu5Y/PhqRMUaN4srPAFU2IVXrFB+gLFl/fkyeFt3NsdeKBo+4n7M0O9FCBGSduRglxtc5Nh
	l/I3469Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHPO-004uMw-UK; Mon, 03 Oct 2022 09:06:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofHOK-004tgc-6o; Mon, 03 Oct 2022 09:05:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o59-20020a17090a0a4100b0020a6d5803dfso4622796pjo.4;
        Mon, 03 Oct 2022 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=yTjG2IBq4YiYp0Z+21USaQk03ELeEIZtyL0WiW5rA6o=;
        b=nZjOeUTkBtEqttsAo/AunR57RjNfBT0j/QhUvx3m6t9151Cm24iQ7+FjNFFysXZVsC
         hD/gXAiiTO7HO6fZxnEX1o60KY8fxF91PX1TIsNLGsfqXDYYtNHzwWVF7By6iP7lzREz
         Vrl6/dR+EeVp7S9/S/cWjoTCgBC2bqmlPau7fqEtagCbxP/FY1LxGiLLYF5Syzd94Nxn
         aiuab2MjP2LQLjVyv7lzWixIkZGVgGWstPrmO88cgTSCxhujHMJL7cJwQSHTbVRavKJc
         3dLKWfptri1YCKxnKfvcjurpKLRdqx43Q/Z9jl4fblTBNMOKyfLv58MP10pxDyRK1nq8
         tzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=yTjG2IBq4YiYp0Z+21USaQk03ELeEIZtyL0WiW5rA6o=;
        b=wT6BpDoHkpVBwswXZL/0bqwRiA4ar2Bp7W/FvaqsNHeDsdH159uxheqRuO3yFY9Kci
         ybTNUNxRtctuv8JYJIdGeHs2EdTb8Ud5+1zG6qNXS+DHczaQFPeXWG0OoTN6Uv3DcF55
         5xoDi22Jvs4fG8ooPnAY3kDgdzcU+zd08OHFN9Le8CNqAvbs1gJvIQtlmS9SYOo9tuRo
         y+kIn8rB6TZFFifj8AxHcZnDy+RKowDgtFukqMQBoB3ucFRX0m7Yz0EyY/ka3+ERJcFU
         CmDV1n1sXk7NqaU6JqIHIEiT9fPvrGDfp7BljNDok8gZZW7dkKMZ0vuVXYBm6A1eP2AB
         XwVQ==
X-Gm-Message-State: ACrzQf0iTrzAe2c5av2jBI9rwzn3/QCIjwkr/QayCNFy6jBS/jxAqvuU
	ST5AD81pztFp4fqKcx3s5oo=
X-Google-Smtp-Source: AMsMyM4ewwmWqikfbn6cyJfsan27i53/9bPAN4ryA0Mij/1Ql2UIn8IDGf3RwZDo791EHcsQsigIFg==
X-Received: by 2002:a17:90b:3b90:b0:202:8a60:c852 with SMTP id pc16-20020a17090b3b9000b002028a60c852mr11243637pjb.169.1664787935220;
        Mon, 03 Oct 2022 02:05:35 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-45-201.emome-ip.hinet.net. [42.72.45.201])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b00179c81f6693sm6678064plg.264.2022.10.03.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 02:05:34 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	sre@kernel.org
Cc: chiaen_wu@richtek.com,
	cy_huang@richtek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of the charger in the example
Date: Mon,  3 Oct 2022 17:04:23 +0800
Message-Id: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_020536_287491_D6BE9B33 
X-CRM114-Status: GOOD (  11.37  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Fix the interrupt order of the charger in the binding example.

Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v2
- Revise the commit syntax.

v1
- Due to this patch modifiacation
  (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
  there will get some warnings in linux-next when compiling the dts.

---
 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
index 410e2d4..1f67e06 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -139,8 +139,8 @@ examples:
 
         charger {
           compatible = "mediatek,mt6370-charger";
-          interrupts = <48>, <68>, <6>;
-          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          interrupts = <68>, <48>, <6>;
+          interrupt-names = "uvp_d_evt", "attach_i", "mivr";
           io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
 
           mt6370_otg_vbus: usb-otg-vbus-regulator {
-- 
2.7.4


