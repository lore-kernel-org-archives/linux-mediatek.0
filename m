Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED4C9EC8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFchl4IL2iHP7X4M9jCzRqchpxPAMZ+ZvVMJ6ag12p4=; b=HB314iy+p7lNGeKDNSXiXSAZdB
	HwA7J6oqW3imIzJl9LtVZHYGnm8cSn2ic8KVMO2T5WJ6PhrNQ3wh1wxn7Sji7+Phh/cGZHdfUU3FD
	nuPoLoZZjDadVfIb+52+qZB4weWvDN/peeR0OciNM8ogV7iCJT/E2ag/nRifuHUScpTTw/LdFbb4j
	xkpky34zeS80dcVgmWvpRSeFnlgU6BVE3XHnua9g1mbQtV/A77NCc51DgpT6VJlpjYIB9XXzbS94s
	U8mJ+frRHvQP5Y3iyJRI1VfTbQ80tTt5Qb/Tbu7WhY7XO2YThSbHZW6IcfUIDM4t2I6NekAwwKj4B
	wKKw0cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKSb-00000005hK6-0OSj;
	Mon, 12 Jan 2026 16:08:05 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKSZ-00000005hJi-17H1
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 16:08:04 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so9831187a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768234081; x=1768838881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFchl4IL2iHP7X4M9jCzRqchpxPAMZ+ZvVMJ6ag12p4=;
        b=YljR+9GU5WYWXO1wwydD5t1hnlsOb4xfLWtsQGqy3+joRfSdJUtXactSXgpw+ctAej
         1peZ+6PhPQb8NnoM5Xc/7gvous4nSBGaQQ7Ynyi6ffOOzYNOAKDePBDWAazxmiVFb4wZ
         THDQSJydeZhzzVAQGBginoJdZKkDpx7qLOskaZsi73R6duJ9f1dnoAT5+8bqzgoLF7Uy
         px9uiMvYxjlP9cxReMG3DW9LWVKGJSYN4SNfL3/ZoWxu2zjK89hWLkJVLeauzKrA+9dw
         2sK5cyyhIffJEXwdh1G+35Mhg5+1P9G6prRbLzeMTUXmdj6ly2AHJcrOVtjgdOrI9LPx
         fXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234081; x=1768838881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFchl4IL2iHP7X4M9jCzRqchpxPAMZ+ZvVMJ6ag12p4=;
        b=N+GDV3Ita/0JTjarMjEQo8vouOduQnVFhIZkG9FQ83TLVnMQW+3aKA9k3u5rtcLHtN
         oJXn99iGao96kxaQpJVLh2KZnbFmxnS0Mka7Qi31OUNcNrSmvlosmlQ7RbWTZuKARlvl
         JAbaudSWkyGxLXSC7JHS8W6sGdI/6+lT3Lplq9YC7z++czAtPFUDJ8TZPGg41gKuqsJy
         cjwsh7us2Q6ewbtgRoeRq/pw8CMG7M7V74iptGlDw1dzjqkRY4kkZCcHaN4G5wmJA9uA
         VGP2ifHEzp5TnBTqoJPoaSQbqCSR9FVIDmmqawWp/CDR0mpjCRjLHhLc49TroZLNQ288
         tVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2eJge2WPNssHAqameM+ipB8Iku7s18bXUvYeuIxN5+lUVDs2Qje1BAXAv4uhmQmVZUuWMbfnv+c3dOKr/aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCf/0FSSPxlInvMwasQ1R25IkSFTrjBGli3p2NInIA4Ck4Pm7I
	nJXRT8+9I1bzGNrjz1+C6hBlyD6e4d5bExKKKIG4PWmaQHFtK3kr2j4p
X-Gm-Gg: AY/fxX7fm337cWo21sVD72ntXw9Uv37TW/27Mw+bShzAApeV/r3y7ozJbFUL3NAFMfz
	9itrPmj4VsQLD1/GIX5XlLQzCBVLY+KMTL82s5JrL9+lg0MqQgiFIbZ6Ewzmh1VYHsvOHp4cdd9
	S1fSPODgLLwe4F6vChee4X1d0hQc2AnKcBCUo6E90Kd3FoTW+70CXG3HkmYibTQRDWbm3KcLwoT
	qvNjNOCEc91if12yxfKQvmlntipP9z274O2II/tdjDbPyBH6AEwNhURGsZpPB3791A1cz9vF0iu
	wZ8F++b7TJ3ry3r6Bca6BnDWOincLVfIdEtncF39oMpU4/5XINjrUAWRMsg/SPdlx8nXr9kKYHl
	BWj18oC2C2WMcK8UrKGYXjO3/At1m7LOm3L+7fT7KP+tu14SPnmOFZhGwUDJXs4NZ6JxTFa38xk
	sWjIYo3yLetxLYB9D0n7Kj6CHg9L+dQM7hmy67/yc0SR0=
X-Google-Smtp-Source: AGHT+IFz4Glbd4ZA3dxtqcV317tXnM3myln6ByCS2T281F927mkqk5Eht9v3v1U1SGONoSGsJThyfg==
X-Received: by 2002:a17:907:9403:b0:b87:7e8:e287 with SMTP id a640c23a62f3a-b8707e91202mr564365466b.30.1768234080781;
        Mon, 12 Jan 2026 08:08:00 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f9a9103bsm667481666b.30.2026.01.12.08.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:08:00 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: display: mediatek: Fix typo 'hardwares' to 'hardware'
Date: Mon, 12 Jan 2026 17:07:59 +0100
Message-ID: <20260112160759.19027-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_080803_329054_11A5629B 
X-CRM114-Status: GOOD (  12.12  )
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

Fix incorrect plural form of the uncountable noun 'hardware' in the
MediaTek DP binding description.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 274f590807ca..8f4bd9fb560b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  MediaTek DP and eDP are different hardwares and there are some features
+  MediaTek DP and eDP are different hardware and there are some features
   which are not supported for eDP. For example, audio is not supported for
   eDP. Therefore, we need to use two different compatibles to describe them.
   In addition, We just need to enable the power domain of DP, so the clock
-- 
2.52.0


