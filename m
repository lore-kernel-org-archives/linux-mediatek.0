Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A03ACD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=; b=eAU1tRv47xFS4do0+CufQwTo7m
	fQSu6CwOScrxnERtrPNFB4P4inBngia37Dtu6Nh6TYmBqT7zE7b5J0U8fULGHQcEUeRE5W0paPkQM
	Ta/HS28clsaK94PF0iZ8/F+0MAu3Chuc68JX+GVXpZte02PhAXt5OXPxOSupUm03FJyUZnX0bWnpp
	0GWJ0MGUvi6qRAG7VN0YQjjEPZa26tEuXpVWHqRi0z5F5Nfdgzb5hmYS6crM1GuYJpgss5HHb2MhI
	GvQ6QcyRSbjL46OcR9iRBxPOiLcZo/FtmpmZ9JmBJm1c3/3ETRZ0HIGUpjMG4osaZHpCLLuOMDOHp
	uufK88nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT43-000000059o6-0Mk3;
	Thu, 14 May 2026 10:13:11 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT40-000000059kn-1nBE
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 10:13:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c828daf83e2so2277095a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753588; x=1779358388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=cOSk93O95aVG2vCqYOd8oItBsoDsS4BrXcVGtjCpMCdhONDY0rRvb2e4Ik6NxNkvc+
         7F/5R3RuoU9Fn/GYCqgkpZEt2wWNl/BCBVBNavJe6F8YEz2RDZC8cXKmNiBsTySfVKU8
         WwKTw+TdtW2xaDQyZNelHpNRX1hgYoTrHzAj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753588; x=1779358388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=Z4p8feanm5bzzsXqmJEoMQFgky1ugdTbcRJa40d36YXfLYcszzkDB/1gDWOEb5ATAI
         phz35zK7e7u4OW6C8vUQlCTcTK8eNi147iajTGOyDTQ+f6THm4yVv0qBFn/wz9C4ZiJr
         yGVroLVCcmtuQLSv5XTXVZEp0mlTdHdTpQb++Tr7PC98CYi3y7rb5n0X7FR9ev9KEIRo
         c5z8Z2rmZ22Mn1Hlu8Tt82TEDAOn+GztvyqmvhLbOF6gLIMuwUjfwQvVS8b0z8AuasLv
         rZjPHoMGaOkheUb50WsjjZcQznspkVmaCGC15LVViYzztNIPy8DUiqXPbRazijE40RJ5
         PYpA==
X-Forwarded-Encrypted: i=1; AFNElJ/EE/ohlp+lBNuwgYG/J7CB+IR0cHMGFTiid/nJxwPe95f4QYKAsW04UjHsMhJLFNT4t2Rutf0QcEUuHBwVGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDACEFmiBEOh2mbzbwxQBVkyDzI+6Gpdq2+nCl7XFywQQ+BVUW
	wwk1iEInMJSTdNNNp6LPvv7+i72obkfyRoG0gCDLJ9hIv63tp+zSmRugrkE6oSBWwA==
X-Gm-Gg: Acq92OHEDvWBCx0p8iAl1NwU2h6soJa/bagktauozHRl3luc1l2D+IsD3a6ms0YHd5Y
	caX9yZ5jka4SYxzje8MyFImYj0iAUmRt1I12e9O3BHgq7jzmA06DRQWW2qs0VPvXA9D1xM5KOa4
	AZ0ns8HvvDayw7ZyNBYFhixS9g168W5qw7n5mlmdh80kLk5T2vos5RqdUGCqb5Ry1WcWEwECC7J
	Dn2IsiqhwEipjSbqVtytKD8sTUMyPT2u1kUv6ERQhzXUejoLWbchRc13dGqkZNqG341npJGGA+x
	F0gj5fewJD9o+toAJkXjsH0nvtvNR9sNb3HlVVPV9AwrkjD0/LLCzI8DSsmZ3NqZw/Lr7TQW4Mo
	YHXg/LTSTnkb0b5yCXuGG4it8wBup3Mw/Sd9cLHWgFbDuU7NxzF4hftkNvbb15SyTfL6i3G28hy
	Ystd92vYNhOIztFhW8+qt10XJaV2qgk0YVf3G0TsGivW1B85hQJ3eeMVbCdjBQrzmQgjcGppLYC
	41/moQ2
X-Received: by 2002:a05:6a20:7f8f:b0:398:a659:eb0 with SMTP id adf61e73a8af0-3afb1112a37mr8021299637.34.1778753587701;
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
Date: Thu, 14 May 2026 18:12:50 +0800
Message-ID: <20260514101254.2749300-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031308_469686_CFB5D7D1 
X-CRM114-Status: GOOD (  10.92  )
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

GPIO lines 59 and 61 are named BT_KILL_1V8_L and WIFI_KILL_1V8_L in the
hardware design. Add them to the gpio-line-names property to make the
names available to users and developers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 3c8b4c2f6f23..b7387075cb87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -727,9 +727,9 @@ &pio {
 			  "SD_DATA1",
 			  "",
 			  "",
+			  "BT_KILL_1V8_L",
 			  "",
-			  "",
-			  "",
+			  "WIFI_KILL_1V8_L",
 			  "",
 			  "PCIE_WAKE_ODL",
 			  "PCIE_RST_L",
-- 
2.54.0.563.g4f69b47b94-goog


