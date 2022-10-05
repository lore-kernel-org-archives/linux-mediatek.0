Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA06C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+CLRBFlSL1ov10J+uevk8iYtEx5Lrr8EaQpxu9a9Lw=; b=2LPKdtz3YiCgADtQW5/tx86ySf
	k/b5u4YwErISabGm3s9zZLGKixiyUHbzpGaQpYMJJx+Xr39X0sixp7RZ1yWdETh/bvLyeeeLgJbyq
	+bFUI2sMvU6P9SezA5RBa0Yr+4YZoSJ33v5SH4yl7DL4GlZEO9xGE9jDwUrZBF+9bK+vWhEeb+x4e
	1swscF0rCjgn4RykNksCyH891XFWVs9uqjqEuH5UD0rliDE1/LepbHumBvTj5E2gyXmdmIgpfPaMm
	oOdTrv0e2Wi2/0cTSBiylBWU+U0lO1lcqrviIRYq7wUz425Vl2Xu5BcCu9N82BYDephxp42+T7OO8
	58VNTvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qq-00Ei3Q-PD; Wed, 05 Oct 2022 14:58:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qD-00EhkL-Fw
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 14:57:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u10so26227274wrq.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=s+CLRBFlSL1ov10J+uevk8iYtEx5Lrr8EaQpxu9a9Lw=;
        b=4z/dLjviSn7zfqdTN/An5N64z93GP96nvU8QRIvaYA7odlZMjwUHVN6eNxxdrMPrTF
         zOsLFff+wqUSKIPA4wuRlkMFxK2E4/RZZH9F1mFy9dD6+/rPQa2MeZYYHiTcGggS7YEv
         ctp693yr5qI6oa4Njx1ye4WdADunUaSaFrKpT8nCZW/C0wW3ZPBFJBPPkk5orqKrpYXc
         7PAgEciHcSO9UJrDjUY8VY7Irn/eA0r1la8im9xFi96VbTvxoCVGkEM+BnSfeVMcR6nG
         ayGpTe52F8676sFV6owNJ07xum0tjvkJ+IAvWh+BA7vXRJTiVZxxvzzKwW98bhJkJrIl
         UQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s+CLRBFlSL1ov10J+uevk8iYtEx5Lrr8EaQpxu9a9Lw=;
        b=qAgSnM/9Kg/mtQRMA5U7pCv/EGUkxi3xA4TjW9Ww0QVg1tXEx0OnkM02nbPZTM0GVq
         ouhCm5EKvVMekvx2p7fi7IzuFldx6ofTxD1wCagA738Y1FfNfpq17Mxs4XkAlg4fr7Gc
         /Dy5CgyYJhT3sDBQxh/Qn2I0rk80N2B3x9zXKRigVCsabL0ds3hj1fZ5eApSadcnp+3f
         cvAioIoi/6TbX9Beqzr9VoIcIxvTM7d7o/C9Jz1HRXVtHyZ13h/HQMotSh6DYLtjnfAK
         dhosiBhLpZpsSiSgZNly3LMyVl8j+zkPJ4l1wyKNqdvwip94KyPZDeMysvPqBz0p1Y13
         HoxA==
X-Gm-Message-State: ACrzQf3m5J6HvIoXdVZnqJfDEMZ/YWZdZwCDESAsSL3IOuH9j0zgLQid
	QnzpeLxPEJhxKhXDMZKOQ09aQg==
X-Google-Smtp-Source: AMsMyM4K9uNjIUEU5oRVePb9o4GJMjsAIa3NMyBDwIbvtm4ZY+x3YXOjJGnKtkk8Wpa5pBXt11tq4Q==
X-Received: by 2002:a05:6000:144c:b0:22b:dda:eeb0 with SMTP id v12-20020a056000144c00b0022b0ddaeeb0mr73656wrx.335.1664981862771;
        Wed, 05 Oct 2022 07:57:42 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k38-20020a05600c1ca600b003a3170a7af9sm2313758wms.4.2022.10.05.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:57:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Oct 2022 16:57:22 +0200
Subject: [PATCH v2 2/5] dt-bindings: input: mtk-pmic-keys: add binding for MT6357
 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v2-2-f17ba2d2d0a9@baylibre.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Vrvq5OBgHsKlbdllLY5D49KrDviTWoLwSjjxQY9UWKQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjPZti3Z21O1HcABDeF3kwXbl2TleR4abbscroKfXG
 a0kzo7OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCYz2bYgAKCRArRkmdfjHURTjmEA
 Ce29Lt9aj+iS11MB92BXYIkIumWqKh5Zn/Ghtco3wKqQz9pd/vOJFQeU2eNpiXVAn+cmwKck3z8JC4
 NhVWR4kkGpcauGXddoiXuJQQZiGVBfDlCx1f6y8x+mCdMLlPTNyT1VTuidevjBFJdzm1TcGQ3gaI2l
 PMIueAByEfHYIOLCEeOFz2RKzMPco2Q7PMJlMKyAx4MsgX35IhE2m7U7tP+pjsSuoHWavHcyUO1THZ
 pdAGj4CyESudF54PZxIKbVWxmJAi6CbUPjEnl6rrBxhQHuC+K+cwHnpYjZBxdYVyK4Xf+Mx5ElaSx0
 C6dgmUEiir3yya5qO7g7zULwYYX3nn+e3jB9/UgdLxa9qxDmZHKYyLd6AxBzhVMEmYY6FaZhiBGI00
 hJvcAmw0Dp1+4D9Z1S7ISfl7DTfH5Qeno/5sIJDEtRsSDZqOuWwRnOhChPe+0TKicwfDm0RcvqHkUh
 a0Jn8pKpd7HiLbrpYc1DAkWP79iBMx1VzppNf2MDiaRhmBAuW7N5V+P+c1iwcS3BV15h9lMS89ZknK
 WU5C1jvMa6A2V6pGigCQyDM6GxVvvyWwpG5TfTZPh0ETl4SkweipjpPCUR+zc3vM8EzdVyOqGSOP43
 3Up2YYYxH0GxqjyLHtgSzpU56en4HPZysFTQ/EbHy42Sm70bsBmSO4zwSt1w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_075745_553518_32D57B8E 
X-CRM114-Status: GOOD (  10.15  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 2f72ec418415..037c3ae9f1c3 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt6323-keys
       - mediatek,mt6331-keys
+      - mediatek,mt6357-keys
       - mediatek,mt6358-keys
       - mediatek,mt6397-keys
 

-- 
b4 0.10.1

