Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F4ED0C616
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceLR0IvL9qdGH71mlJjn14Kdj5vXT4ULmmpb71qNMEk=; b=xkB3XlPfyed5xL
	/ggY3pj0NXidDri+wGeGTdz6TEgKrkIwMdXcmJV1sL7rm20USnB89fM48eVtSZxuXTOa2jDKbteto
	a0ZDQkk/vAZV7H2vj0j/DOVWiqUYu4T9/t7zTFo28HfIbGTw/lhvNYVW4omnacHkD5VQ15yzM5EUg
	AVkiEFvg9amgOZ/EIdDxnD4GUXjbuatQ54auqGdCsDrBWytoomIENGID15AJq9t0QCLm2TgY9HVcq
	vYG0whpmjocVtMV+ycq2v16DwFUDZW3QD6chN9sn3KBppfgcV0PL6OTSc5UrXI/4nffoDS/CZT6ce
	Te2BgGc/+z4ZkZ10Y6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L6w-00000003yOj-4AJO;
	Fri, 25 Oct 2024 14:16:19 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HpS-00000003OkQ-3pJN
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 10:46:04 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1253775a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853162; x=1730457962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceLR0IvL9qdGH71mlJjn14Kdj5vXT4ULmmpb71qNMEk=;
        b=SWPOqIyrxPjFkBQZatM/b7TDfNTVVIRsfgGPqeDQoL32/1F8Gc61fy4zDazZ0F50Ho
         SiestOWZXDpjgy5j2ynVjOBQyAFWRyOTdSnf6kF3lwQA4PdLQixmziNF7XKiHHMN65Hj
         u1AehjW2K9dJa5Arh8ln87oY0DS/26F/9LK/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853162; x=1730457962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceLR0IvL9qdGH71mlJjn14Kdj5vXT4ULmmpb71qNMEk=;
        b=Kwcozv9Y7ZjMHmMVipD2iOCtvyP5bA3CerqFdYFkrAflkwseusuJ0G1J8UtlgddXfU
         2k8RjJ2UkruWcB5YqVeXO9QZVPCj9ed0rIEJ6q5vzcYSazvW4uWgx1MfSnKWDJJJPGdM
         jg1knN9P5UMz/Vxb6SVf1zFWFgbbK9cU77KEsbjKoAmt2QyHcjRqT7NojlzWu2kKCyun
         Z6xnnixxtnCgDitp/jr9P5R6xEt3T86j4RNRJ7+pT2Vqr0W6Yzt++8l7S7y6nzc8NFJe
         aPRlaNvGl69Kcw5RJkactvLU4Vod+Mj6cyrd43l5e5jUIWHfe1mThyXQrY3n+jkzSvgx
         Ycrw==
X-Forwarded-Encrypted: i=1; AJvYcCVIQuE6XPVOY2H2oTkFjxrTnbuaDcTfFdW9/e9ebplq3y/GItCpuAz0Ia7GtK3H/LKVjWyoz9SY04cmnCzgFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNNMyNUeUC/3XFopR7G8V74K1Tv0HK+TxPh0myUc09DLJfUpe
	KSmx6hdw2dpfQf1emucifWGIdzrPwrl9XyFi9bh8FYxAoJFmGfNpv5QAYQtLkQ==
X-Google-Smtp-Source: AGHT+IGz6wzyyQ3d+NeaKQh7ukjIPx/hDX/N2T3R4gD20OXmJ38D2JhCFST+k71O7anmr55JG00JVA==
X-Received: by 2002:a05:6a20:2d1f:b0:1d8:d880:2069 with SMTP id adf61e73a8af0-1d9898ff764mr4972242637.3.1729853161966;
        Fri, 25 Oct 2024 03:46:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:46:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp and dai-link properties
Date: Fri, 25 Oct 2024 18:44:41 +0800
Message-ID: <20241025104548.1220076-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025104548.1220076-1-fshao@chromium.org>
References: <20241025104548.1220076-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034603_078890_AA1E726B 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "mediatek,adsp" property for the ADSP handle if ADSP is enabled on
the platform.
Add "mediatek,dai-link" property for the required DAI links to configure
sound card.

Both properties are commonly used in the MediaTek sound card driver.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index f94ad0715e32..701cedfa38d2 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -29,6 +29,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8188 ASoC platform.
 
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 ADSP platform.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
-- 
2.47.0.163.g1226f6d8fa-goog


