Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F00EC25B79
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBEEdHfSM5OUHXjJOAmjPz7SL/vpjvoUncaFIjx2+EQ=; b=k65sT6DHNhAfz2ssNYeXVJGe4p
	ofPbwQ9LewIcO1iebopfYa+BJc7qLYRMXZX0T/mkL+mHrynpbRGcj9ftuBdviIU70mf41EMA1QFhi
	n3S5xytKFot41/BEPIVh7FjrMmwWRKLMWmDLRkWJwBPrwicT4+wK/ndrQu0mWb7Ux+ReAEKGgJiDq
	9v0aunp68+zJwqLZuwFRbqYQrLYsF0n3hwabZZjrHtQ9vXH9QQsn4k24Y0r2j/XLm1IRTIMkgpgXD
	gI2cLDB/zzI1PO7wjKM81/2lHALzJPZ6LAPNHYmN1E+NEDflXld284B1bT93nw4qs9MLQLbr+q0NA
	HFUUyqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tH-00000006FCy-3fUp;
	Thu, 23 May 2024 12:49:51 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7sy-00000006EuU-22mb
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:34 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354e0d4db6cso1142175f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468570; x=1717073370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBEEdHfSM5OUHXjJOAmjPz7SL/vpjvoUncaFIjx2+EQ=;
        b=DQUR+MCVTHfGuQ+GOlhFTvE3hd1GnMW3Mj44m5TOVUJdzzFxAhZ5jdsV9ElvASKVmD
         qrVOC7OKA4WwEcwiGDv3T27cswXOOO5jPR1qbYK+TQIH/ABs102Wy95ORyVjYEnlzfNc
         wogvrRYHGjJH0Rmx3zYW2zhxmGp+O5AINxGMpWQeep+VfLY23n3RjTPj/JYhxLXZk7dG
         PxQapuih/xMskWF9gehaxuHD9AmIqhhIGk7Jzy+eWd12tY/qbZEwtgM6075vuQOZq6Ts
         EUyOtW4uE17+br1OttNgVY8Q1uGu4525MMEuaSyHDvwPDSOhM9b8Bd35qSYr/wJHVkG0
         lT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468570; x=1717073370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBEEdHfSM5OUHXjJOAmjPz7SL/vpjvoUncaFIjx2+EQ=;
        b=JDGRaPKCG/jJImp3GkeUrLimmo6d7rmP15KMsKWQUQLs74WOpNQZxZTUeK57jGfZdk
         6L4KzkYiNOR4bnPF39yVLTmA7E69RH5EZNBvHJyJtUuCb1BuHU/LFANMQE1URWmE4bDr
         11lgxVsH+XXa6xeeEPI/20TnGOWnn4WCQFJUN679Tk659wBoDo9LCHT4tXOQtoOfEwAh
         n9taNDoirhq+6/dq5OBCWvSQ/OKMpCCXS1vrV4YcQP+MF8D2WyZl58X4W10Rpuzcgfj0
         fZcN40DfpxQ/VLGP5yhjdJ3Kiz104Pmxju43p32ocWAwmzeT7FbX9v79Rf0gqJh0/IRj
         tf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5Mcr5Ey3AYh+iuKGpCXWXJ3U5q6f+k6Lko6XOU1h2dRopTw/tTWNOn0svYp5vasqDYYAKvnu77GNuQIh+r1b174Niqkoptx4de+rayKdtJl0O
X-Gm-Message-State: AOJu0YylUVvc1Wumtx65XnAiNAEVWfZIAneSILF+OG0WRq1Ye8SakIv8
	Cg8yRMdVrQlLCQHVy8XS4eqQyE1IEmjKVt4zz3038kG24iJVmIwKMpgLTpV8weQ=
X-Google-Smtp-Source: AGHT+IGU4vZHSbVWgh8XHQMjlPrDicwM7zOwzh1RrdRHAYdu2gyP1avlcsEUbQ9zz2Hk0+AnCcAFcg==
X-Received: by 2002:adf:ee8a:0:b0:354:f622:fc5d with SMTP id ffacd0b85a97d-354f75219a7mr1846012f8f.20.1716468569818;
        Thu, 23 May 2024 05:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:29 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:16 +0200
Subject: [PATCH v4 03/15] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-3-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HN5/a0+R+JO3pVI4xH3O+AT/j542BX4M1WSoIvyPJ9s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTadkyVemMx/MqAPbnK25Y1rtjyATSG8gU2vrq
 Su5Dn+2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURXw5D/
 4gvgJulo8RCU5wSOn+lQaGtmVqn7FJD6rHiNJckEy4zb3pfcDPgucVGSMrh1KokTOVufWjLN0w/TcF
 bVLttV6skzv/GEPPlqv1jFNjWf9N48i+obz8Z6wRFhDETvf3XvcR7/LXPqPnZWi/Ts3C+7+6SKYZYz
 BhW+CqE/5aOliJONAzhtQ1aOk0y2rfUeVLObj932UomPbBaNl32QaPBtb1pvxvJlx1caKHMOmVW/CZ
 z/D7qOYjRa+lKI9Dh+CSzVfQgZ/8tGclASeij3MPdik/Tbp7tOgB0IZvr/GgpOvVm9rCWBn1dQeP/M
 7y0IqSyG19Z0i70JCOqHkJWAkg/R5a3bvO6v3RlNLwb0wWrdIpL9hHu233BF10UILE5pchZLOhbU5v
 MIJjDX9Pj0bwzex94DcQEQ7lM/6uXDI7wTTg0mcMf57DfEb0SFKm89DWTZK5F7LD6xkY0l7w25tUOj
 CkcZOw+/lpprx4b+CZYGwkkZa3SpStFEuxW2lu29IFnnAN059dRnkmP6PqA+YkOGUgYzA/iTfLz6Fl
 LMf8+IkEAvBwRCAeqOvKiIPSz5IJut+kBJiMzZY5GrSSHoK27X4Y3SAZ/WQCeAa5HwSDQQVfWB3TMY
 QfaM9+N5kN4eN+rpWA0LX5TbhimGy053mjPPhq1WaNvBtAhucq/fksLKTCrw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054932_956118_D0F7285B 
X-CRM114-Status: UNSURE (   9.14  )
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 61d040a10c08..6160439ce4d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1


