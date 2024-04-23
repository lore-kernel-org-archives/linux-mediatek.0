Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF98C04FFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZri1bj6pQ9QXHSvnyPN/Y1Q6Ds0162YmTBPPdNsJqU=; b=FR0ZS929Wt2sFg2zB1p+qz3hsY
	t48uScL6RESagJheWFTYhQbkW+M3acEcbA2AGsjogofRkNAVBsbJphJEAZVcsko9+2LD04MIsg8m1
	/XxOU5V5fI0gtyUh3ZUP+vgcCEl7E8M+peay4DLRa3oS503jozzFiSjb66vAOJI3acC53mJVtWil0
	TJ/vLqSZ0/oWzu4sdgKDhzuGM8M+Fk97dbfJ8AS8+/8au4wFSv68yjNCWWCFqJF3HHaVfm0fWo5QK
	BuqyllSPJbgNhqEuzGNe5WxZ3eceajG8rEnxC2Zb+qml40NEmMcJBVlrmJlBDJHxfENORB5I4qAC1
	nEOdR12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz8Bx-0000000Fz1c-0KOe;
	Tue, 23 Apr 2024 04:55:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz8Br-0000000FyzS-3hmT;
	Tue, 23 Apr 2024 04:55:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a58772187d8so62730566b.3;
        Mon, 22 Apr 2024 21:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713848122; x=1714452922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZri1bj6pQ9QXHSvnyPN/Y1Q6Ds0162YmTBPPdNsJqU=;
        b=ccr3T2oMGgrPBaHz0x1st/JFT8+CTHLjc2WHrUh61ML2qXd/LYURmmRkDrw5PfNZqe
         D3Lk+jkzwCcruuIpT2QRfS0RmdVHl4afZtAlPO5WtWcQLHi24k7MZpO+djLu1dJuAuL4
         Azj5wpsfgKvW60oj5F7ryBnef6dUilEJbd6ke55ojk5vt3Gx8XwH7ONjIME7XpbwqNXT
         0pVkCd17gG2/3g11/z+sgHJXMIHtGkFzx5cHzMLF2V5iIsDhf9bqTLnkcZUEmBbRgmag
         nQF837ziRKeau0CMGN84mOP2+TMhhXmnNC0q1fq1KaXiguX2zyJ+7mp5CAcJCTWpGntk
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713848122; x=1714452922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZri1bj6pQ9QXHSvnyPN/Y1Q6Ds0162YmTBPPdNsJqU=;
        b=ZZb62KtdNfwPECOPwZbhYfHHc83DNUzmBsuskXFfTHB4hY+eXC1mfK9KUT6LUWen9U
         +zl24arIS9JI0s1mCGKrCGAJYMuOZBjRLc8hV2n/COyAKsA+YqOIghAyqmAsZF0dvbzI
         C78t+VJFks4wSo/7rdei+Da5n9OaJZwIM8sHRc6mGeNDeVN05doZsZFSJtTIDcemjd9s
         XNXSV2YlHTCota9mulu7AsjJ9mEFDqBI3JJRdgQvqg3pyzHZdoFNzoYLoyVaTtjt64Dq
         6+L+/z1NPUoaHo5VD8q3IfCaUEOdMAB0mpVtlI3bQsHPsXM7f7qcF6FLP5pgBgQbH+ut
         oo7g==
X-Forwarded-Encrypted: i=1; AJvYcCVGxe0f1bI1jEdUlJAvCySe7h69olOWCyES4U9didH58yXa271TaJUrHoPI38dMX3FRvqTTGJx01wdbjwFy1OXrLy+lNLYSF+iEMAxgF+3lAwOME1gJVynSBVrNrU2iHS/V6igoc5X7AAVCcnHZzclBg2i4/6IyDFk=
X-Gm-Message-State: AOJu0YwR+6+9qaJXEWqRVkjhxcLbSfAMLjCUgjyramIRMVsvnj4gW8qs
	JFHEViavzOWYzsyTVXQW0HhyZMlbfN7FtsQP9V8fUExbaFuWtDtM
X-Google-Smtp-Source: AGHT+IFSKe8jvyP1Ht4wpCuOFwYLEwvgWH0E5ppWlcON8JBGb/+WQ9+0qATSieF5kLfBtW8V9RnDTA==
X-Received: by 2002:a17:906:915:b0:a51:c964:3cb7 with SMTP id i21-20020a170906091500b00a51c9643cb7mr10662587ejd.61.1713848121918;
        Mon, 22 Apr 2024 21:55:21 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id rn2-20020a170906d92200b00a55a67a81c8sm3019557ejb.126.2024.04.22.21.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 21:55:21 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH RESEND 2/2] dt-bindings: pinctrl: mediatek: mt7622: add "antsel" function
Date: Tue, 23 Apr 2024 06:55:02 +0200
Message-Id: <20240423045502.7778-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240423045502.7778-1-zajec5@gmail.com>
References: <20240423045502.7778-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_215535_928238_1D4A51F3 
X-CRM114-Status: GOOD (  11.54  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7622 pinctrl has ANTSEL* pins. Linux support for those was added in
the commit 19f599e83ac5 ("pinctrl: mediatek: mt7622: add antsel
pins/groups"). Include them in binding.

Cc: Chuanhong Guo <gch981213@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Rob Herring <robh@kernel.org>
---
RESEND without 3/3 that needs more work

 .../pinctrl/mediatek,mt7622-pinctrl.yaml       | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 60f30a59f385..a9ab623b2697 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -75,8 +75,8 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm, sd,
-                   spi, tdm, uart, watchdog, wifi]
+            enum: [antsel, emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm,
+                   sd, spi, tdm, uart, watchdog, wifi]
 
           groups:
             description:
@@ -90,6 +90,20 @@ patternProperties:
           - function
 
         allOf:
+          - if:
+              properties:
+                function:
+                  const: antsel
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [antsel0, antsel1, antsel2, antsel3, antsel4, antsel5,
+                           antsel6, antsel7, antsel8, antsel9, antsel10,
+                           antsel11, antsel12, antsel13, antsel14, antsel15,
+                           antsel16, antsel17, antsel18, antsel19, antsel20,
+                           antsel21, antsel22, antsel23, antsel24, antsel25,
+                           antsel26, antsel27, antsel28, antsel29]
           - if:
               properties:
                 function:
-- 
2.35.3


