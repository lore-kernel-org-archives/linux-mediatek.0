Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B175DC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=; b=e3c4FG7Ql/0FUZpAIOmmG5kZdN
	DRbnFs5gBCwmqrWFpgEzyOoQjTGOmcx5KLv/z9PIqPV6/spRd2+8zFCI159DtGM3vcYeTV2dowVFy
	gis+rvPdKHKhCAZcaw6Edn01EtE4br7Rb6q2GlaLufHBGPfVm4I6gCYYQtew8el5RTMrOsZyrBINg
	abdAYiaA721jQ8kZk2B3izMPtbGs64heuUlmFULnjsKf5Kii8dDF+1Zgn/SHvvQ0z0lx7NXfzwysY
	ySCOoIHjffaN1srR23NLZWlH8FdkcMJHmV3XY1jCdlMEqXpQfG+/y3GCHjJtRcYFpnbtnOCG7T6Xk
	B/muKSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvl-00000003tXX-3S0c;
	Thu, 02 Jul 2026 08:37:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvi-00000003tWX-2lzW
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 08:37:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9c9916f75so8875765ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981473; x=1783586273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=bzeuw8c3wbB/3cyjhduRlyozdr46hKi/wBM3QZq0d4mYgz7MIc4GoRE3zI9dfaE40W
         a25BSQtuKCmSmvd80WGkG0R4e9XHvcrX5qZHEo2yDUVJ/q0PBp0N5ay3RMdljp0UBNYE
         Z18Hf6BJ5iJ264XliTkdTZrTkbpgYujaQ9kqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981473; x=1783586273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F7a9l8CBrmgZJ21cRo2dmJRdbnrg/txunQ3NzKsCjo=;
        b=YPTZoHyystM9u1bHLs7GDV7174m1Ngf6xjqVyhQ0qv0Oj//w1ZrMoremmaL7wXSbJA
         JvHkqcdyT5E9pQ7gTR6428zBb+j1MmRtF8pe823FRjT+2aX+ThMTcMqkiFOIA8mVtQu/
         LXV6B+DVoSuoSaBUqGCJV2CCH73qjxX/y7qnGQSHF0K3mZXHNLLSLase8SAuDsWSNzRw
         FzRT2fBi/ZISPGfX0m8kSiD0T858Nqp/HWFfJJVOTd+o19riuTQREm14ye0UJ7N8OhdP
         cE8KUs31H8+QSH2cA9XE/M89uj1CGQT9zMX0RLyzGeeKHU+v2r8WkUPPStpahaUZ35QD
         sExw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9gBt3KmS1tVoQMQJGpneRd+XEPU+6XFDbIEiuIFYdO2BVjzbjm6bxhwsgU5vkRZsZO59gMmlMJfto9ynY4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYaBRjedU2CUgcBmUxuIjEgbkGKvA/idSnw1AQko5/fE5jMt1A
	EBl4k0aMM5jVgyd4sROvOo/0IF2eygOdFPGsJZwsgK67OaXK0MJ7kQ0SPIIun1FjNw==
X-Gm-Gg: AfdE7ckOjeCQUXIBr16sSMVENiVsDhNm25nqfGanvdkSElYYNxkjr75YIFg+TWdCHAt
	5LxGO7mxmcnTpxeEwJauhWQF8OEHqoUYguyTZ3e+201cYtMBxOhPPN6Y3lWavQWBfqvMqnXs0n/
	79iSzCPxudRSPaCb7JvXdkbja44fjJZkJ9YChLBLEz2u+uuRbjtO1MOM7/56GhxiXrF5/unD1kI
	1ve6usOwsWM4zfpoOAVCmmW7O/+nYLb7mknPfg8PBS3xekse+o5nl6ICyJkrnKWMFpZ5MZLVIdX
	e37g4G03xEl7vrlEvkA3aS99sIW1mkV4uvYVE+tO5zBjvdI+T87gBoNurCz+EtS7UAI1HW/FnTb
	wmAMcdnftIWAI1+pjm/4dH6pTgLDj9Xa6/Jsbyop42peiJ817tNTE+Cs7T8MyMPZnvDSkkT/T9D
	//zjgDxxrwMfmst/7K03Q8wNrMsN44WOrkxLs3g/mNtIN0awH9KzyefkARaQXIyV4S190SAFM0G
	4hz8XK7
X-Received: by 2002:a17:903:22ca:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2ca7e706861mr54959555ad.21.1782981473366;
        Thu, 02 Jul 2026 01:37:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8fac27sm10102495ad.20.2026.07.02.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:37:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:45 +0800
Message-ID: <20260702083746.578461-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013754_734232_2CDA26B1 
X-CRM114-Status: GOOD (  10.11  )
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

The SPI NOR flash is powered from the always on 1.8V power rail through
a load switch that is controlled by the security chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b8d261b375d4..ed552f023cb4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -980,6 +980,8 @@ w25q64dw: flash@0 {
 		compatible = "winbond,w25q64dw", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <25000000>;
+		/* Power actually controlled by security chip */
+		vcc-supply = <&pp1800_alw>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


