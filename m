Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4DECD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WziNI0dy9ontwBLhhuwGeSxizPXdz8ruFPYdBGBNZvg=; b=2TE6tu9U1PBcMOJbmnpqAMVX56
	+kfvhOZxJYu/jVuNjurrNShcy2emPJTNFjUZJ5exUudBnNT9aqc4Vk2jsFv+E6ufQ/w7k3TcnhsN/
	icl2BhApZYSWVPQoh9yuYM8VXZFNbXSee/1ckTiOd0Uo2pb9l+9KEtfwmEj6RRGkDP24tO8dk72yM
	aZM58s6dVuth9bPjGiRdGm9OCYRPIR7VegH0ffE87+gEtAOJrmGz6VFBsLSZYeHqbXlNX9qJ84Ynj
	iiLQkMdgIgld+aWRF4D0u4sIbrCkmDZe3jf5Ggd8WrPL8gNkkPbNx0opSKhDN82jNNqrXWAXwXrSk
	2+2ku8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwP-0000000F0sW-3XIF;
	Mon, 08 Apr 2024 09:05:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwM-0000000F0pR-2NaR;
	Mon, 08 Apr 2024 09:05:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso4161706a12.3;
        Mon, 08 Apr 2024 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567120; x=1713171920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WziNI0dy9ontwBLhhuwGeSxizPXdz8ruFPYdBGBNZvg=;
        b=NCZkLq9JCB6pAc1q8K1jJwBTViaQ7a1SVCM5ttDzLA17GGp1rSw7BUu+1OQj0CrXXq
         PuCYPY5AaaDwwJq90ehoI4UBgWPMdqZngbu2r1oBqT3i4TUIgQw5VKBILH1KLnfVKANd
         wPcvaPNUK2syDB5eCXRhlWhTPU54Q4roCNk8KgP81Z3Ln0AMmSIDu2shCcH2UpCv7vos
         yLyq+U0wzZQQQ/jQk7e1fJ15Zfmqy455nlmak1YpZcvRUXmz3OQaP7HHj9DzVZTcEGLt
         PhHYGa4GWxRouyzgebX86UcGKKx2yk/OxwjKkpGcgyBjLIjy+jgIbbMgfm7bLwzLJSb8
         4TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567120; x=1713171920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WziNI0dy9ontwBLhhuwGeSxizPXdz8ruFPYdBGBNZvg=;
        b=oLf5pCrx8+uhnoVh6qS6crFH975ld0S92Pb88sEANkOhcXlGqnZpDk/Q5apcBvyvAM
         YufBtetokekN7KA5kJzSm+bpYc3Hh4MELSBRf8z+cI0IbVNdrnU130qG5LL7TXF6HxK7
         NZsq7T93Tf6AhPyK3usf2N3+tXnrzq/IN2LXTNYnO0NzUoHtEslyToIs7O735oDbWG6a
         jIkimOaFVhTxQ3IyBrWzds/aWkcvh0c4gZM1ILnlNqXJFDTrMhFGT0z91TjoI3ShXpNm
         PbuwlV+sm4RRykLGUGjes6CqQUvWJ7UTkXR+1Axi/+7dYQ/8MFG6a6/ETDG2QDDlBLLi
         cL4g==
X-Forwarded-Encrypted: i=1; AJvYcCVAOmnpTIrqiaZHWov30ijidQURpaQ/i3Ivrkkx4qU7Qd6r9qUWr+VNI8+lHXydceOxzFZYJRwsXcHfRNwzLca74W+n9wpeYsNWCo3zr0CdMV8BO0x9MHLry2hfwe8Rfp+z4SqdqlIwyfrnXAuNBTD84tPIK+T5qqw=
X-Gm-Message-State: AOJu0Yzufh9wtFJnxfCw82g/pcLAc7qd/Teh9SqGNfJ5cjhd5WYrzygB
	y29RXDizhlF2+hlTE+8jr01SIpA8tTE4pdu88AZRpmhlbvxV8QT2
X-Google-Smtp-Source: AGHT+IFJuDSPZV6Dt59lpjhwCnHica/ftb5KxSrdAGBGyr3hReB6zu7+J40yCPnZLpMbPyfGBIDvvA==
X-Received: by 2002:a17:906:ecee:b0:a51:99e1:1f1a with SMTP id qt14-20020a170906ecee00b00a5199e11f1amr5386527ejb.64.1712567119701;
        Mon, 08 Apr 2024 02:05:19 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:19 -0700 (PDT)
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
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/3] dt-bindings: pinctrl: mediatek: mt7622: add "base" reg
Date: Mon,  8 Apr 2024 11:05:06 +0200
Message-Id: <20240408090506.21596-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240408090506.21596-1-zajec5@gmail.com>
References: <20240408090506.21596-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_020522_731586_A1E05957 
X-CRM114-Status: GOOD (  11.50  )
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

Both: MT7622 and MT7629 use two reg spaces: "base" and "eint". It wasn't
covered by the binding and also example didn't match incomplete binding.
Fix it.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index a9ab623b2697..eaa65512161a 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -19,10 +19,12 @@ properties:
       - mediatek,mt7629-pinctrl
 
   reg:
-    maxItems: 1
+    minItems: 2
+    maxItems: 2
 
   reg-names:
     items:
+      - const: base
       - const: eint
 
   gpio-controller: true
@@ -364,7 +366,9 @@ examples:
 
         pio: pinctrl@10211000 {
           compatible = "mediatek,mt7622-pinctrl";
-          reg = <0 0x10211000 0 0x1000>;
+          reg = <0 0x10211000 0 0x1000>,
+                <0 0x10005000 0 0x1000>;
+          reg-names = "base", "eint";
           gpio-controller;
           #gpio-cells = <2>;
 
-- 
2.35.3


