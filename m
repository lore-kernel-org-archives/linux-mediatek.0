Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F2C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=; b=haUHTlZaIb91UEwQOF7DLWacwY
	wowvcQk6lws8qAiGjHbLHMdL/VzBXsizlnlvnlWaoSPe23BPXRCY7PnYWNEZEtCMkNq2wZ3aetnq+
	XzKRA7tZbmapy2Leu/A97znaYyS7BcZh9jMg/VK45GKpFKAENmTBSTDLAQmQ3vIgpZtClSCM6Xujy
	mfJLFzxgwUUFBiHJs+lKGpVzIuXNLsuUJ1/UDMBJHeQh402fLJ6TKLEM/g1v7n4/JYJTrKYVvBS5P
	TUPld6i/A3a8/+qJtWgrsvgyMi7PnIUPb7sZmykLrtLyHSghp+w7lff7Oj1sgkzsfC5Y9ra/3KbSu
	M9g2AFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5P6-00000008jjl-3juK;
	Tue, 21 Jul 2026 08:00:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5P3-00000008jik-3aGT
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 08:00:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c1c24ec9525so29532666b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784620835; x=1785225635; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=LFSqyJvDl7pEoDa8eBlkLzj9n19ypvOGSc+0GVSTOjXOgZvxlDtwrUXY+2JsOvIcR0
         rcg+AxnrYnFVUA7VLo5xfn2ECe+Gm5MMA0Jb3joQr1yGdQPGgS+NYxe0BbBWFO+y6+Ol
         tD2HKXb03g+ROx5Gb1HflaATPRwyfmhv/qO0jLjoslgdafrr/DtDDmYmu0acp3oGfnmJ
         l2xvwXQm43apZAin557ZhyhRU762YfwZbnnnKH4OByM1RTxHZZlb8JpUNhwJi+XM5GH6
         7xa48sJgAGvO98FZMW2pEYxfzEDN4pc8PXThncQPvTGtZM8qMNMunVMmhZ0HxerSLDK+
         vn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620836; x=1785225636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VCTZhhsDkQDmv6W2lFgIQm5lul/8HcQoqcagpiQUCv4=;
        b=awTRrtPmK6dfVI+u0UQSFWBdPIsDg1/XIeOfUBiH2u27t50lBdB+ZzIVBL1SAfbWsp
         cMQV0q7mxroo+hpgke20JMMq9JXpv6689NGhuMLoaIaBzBiaeWX+UodAemQ4htAfjlxC
         /8OnIiW6QEn6tk9iifbaoiOzHXuFYC7MvOJINVAzozIYwsd8JRBhxyG8/P3dfEnRk/AS
         TnW7x2xxGb1CGwnJGc7m757rRyhWeSM9fl97PPXAbrFnvZW8Pa3yfAyeR4gOF4p2HFI7
         Y9H75mxtarrVKjzpcNjekh47e3y7LdYl5t1R1dcMyngCVtaQA1ZUP4lvUI2RZP3eZ2wS
         suLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpo4ov/3GnR7YKfyq3mdrtanruznHVVml+quqNYnghPyL6p/tH+s6PLQOABxLJDTyhgq5qaw1jx2TOfuqPeEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUrawXyrw2819sapwKbQwZynhnmLJS3WscKFUALkLpgfQvqFKw
	pr/TVT9LZdk+y7zaM6DC8zO4HqERdogJR7W75jTh0MXRilRr4+NGV1S0cZCJiXeM5Pk=
X-Gm-Gg: AfdE7cmZNmHSSJpKIrK5OVj2YQnPXez+JxSxyftbTpmfCTXG01WgaZJ8wi/iCkLWueq
	rNzlKc6GBhzr9h174MgJlvIqfNTwrM+MtxBhMStRiwKDloZjf8dfME8nXGCAfF2+Ts6QSivHznk
	9lYWSkDGkl9P4uy7oCaTChFShKyJayTPsNyf3tBhkiQ/NWejY2Q3ifjHDCvL0zbSI9Kv81EFkkD
	8NW0qYpFkQeu16gOA1IDQFYfwr1dg//B9yKtrA0aKEd1TNE/lqFuYzXNSrZPukhruD7RujyQulA
	bWtkeK5OjlC6Ru1udgwhXvVVvVYdmnnHrrpW/rHLRXyChZdxJRbMQtX3F2qfmfkaCa7WyJZJZw0
	iOPnVtXIH36AmJnPMrHZIvHSU3nbgzaDlWWOPB36H20RW1Y3h9oZM7r9/96QEO3IxtoIi2FE3xh
	O6HlZptWqJa82ttuzpvKuzH9Xnuzd+wjzxQle8JCrhlZFX1iJ9nsL/PoLVQQUz6p6+yBXnCA==
X-Received: by 2002:a17:907:d09:b0:c15:e04e:aed4 with SMTP id a640c23a62f3a-c16b47e6906mr747823566b.42.1784620835539;
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm541895566b.43.2026.07.21.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:00:35 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 10:00:28 +0200
Subject: [PATCH] dt-bindings: usb: mtu3: Add MT8512
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBBFf0Vm3YFMSjT0V0oXSRztFEwlDymI/
 960ri4HLufskDkJZ7h1OyTeJMs7NqBLB+Hp4swoY2PQSvdq0IQhuHZhrGsuid2CS7GGdJt6RS9
 xlDijUdQbb4OlgaCp1sSTfP6Z++PkXP2LQ/m54Ti+6Uvzw4gAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_010037_900587_28A90DA7 
X-CRM114-Status: GOOD (  10.03  )
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

The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
register layout and is handled by the generic mediatek,mtu3 driver. Add
the SoC-specific compatible so the controller can be described without a
legacy split node.

For now the only user of this is on the U-Boot side but we want to keep
bindings in sync.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..42da2c6dfba1 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
           - mediatek,mt8365-mtu3
+          - mediatek,mt8512-mtu3
       - const: mediatek,mtu3
 
   reg:

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8512-mtu3-binding-50165b8c8171

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


