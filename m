Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E2CD98DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=; b=F5HPdnZHEQBUFdlQsI1BNib6QC
	7be2JWWoIsCDKLcsK/NiNYbetQPJsgrtCQNGjxQuAZnCCSBd96pnjuCDJkb70zJZ0eO+Vq/WV9MNn
	bDSomcHlXOcVrvhF6ILcfigmcTLjxZnJIY3q2wrySjLuha+5hOor8jccjZ33xdW4FjnVui1+pWfM4
	AY5d0Uu4gSfjadQj2U/C5yUXdZUQZMLiLedxU87nSXdoTyMJAj1pszu2XNkVjmc6qydSQODcJPvle
	rst1ERueOnevrbFpDEzagGsB/0hClZAbvWn+vx2ywRy+PEVEfsYg9Veuz4X8fe3S9/3YJIjLxBpXn
	S3KENiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0a-0000000Edzh-345F;
	Mon, 15 Jun 2026 17:22:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0Y-0000000Edz0-27sS
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 17:21:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso27053545e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544116; x=1782148916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=S5aRJ9lJs4DS+mHZxm7TGxOEPpRSN6H+SIHdDYZLwmOIG6QflncVFbKiTHfLxu05Or
         zERLrGffBeXxlbzBokhWW4/iq8JyrDvxo4Txk451V4MI7jwLRbqbUSaizf29hoiG2CTf
         jofAiWdbImOxMLRsQDOj8/9KYeZsRUTDX7nVEyqZES1yLC6+ni0V8f6M6R37401oQkO/
         M7ojej5XBGvVX1XDmGuOe1n7EGMtm3ieudLlGTEEUqmBK6VsfHfruD66yZIEufYVGwZG
         HZ67Z6VYTEmLK1ziE+2p02Z/nMG7onTFUGjuin0C3xxiR6y7qcHs3HTCh7PVHBdechTD
         GeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544116; x=1782148916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=aijjMkWddjrteHDPfQgvW6lhk03zI5YKMfQD4nUICpGFmsPGoU9nAeBmHJdZfmhk/G
         O6Fe/GYf22FeWPm+qjjusaRf8THNIjr+PLlhYoqCtv35CM3rV6+/TunaMDL6g8+xAgAS
         jc8lqEOoyENdoisbDDPO2sHmYuPyA8xDYloSbF2WoU2tMzSZtZIkNkOL5M3ezxXsisRv
         PJkZ8FTZypR+vas4aE129JAowwwMEyUGUeAd+AxxBV6IqDi0HhRVKqBbfybIpQ+KD4Rm
         N6kc++YYeKa6hIDF7d+15so/Hu+o05swK241MZdkgDzWKeYl7zDH0HeDb+EmmbP70Jqv
         3rtA==
X-Gm-Message-State: AOJu0YwnXAP2m3KamqrcibbuzxBrm111hccpo1mnKBbhm159itJ+aW/K
	bQVFSk0hrfjq2epfJ9K2oDFcVytUnfRdQcgwOwzmZD6uEHymW8dJdOksem6zZRCD
X-Gm-Gg: Acq92OG9uvn8sYoN6GwgNt8Yx3Jfq6bLmso1oT4TTkFnYWlb8bkOYuILvDRrhvqcMEI
	TQLZemHk4ve/Y6U+jhHNor2IbfP96Y2W6aa+WnCKrKqIofZLFlg0+9Q+LNw7uFDTcqgPY4dEjuY
	KTrfiLitdR9X8ggLsB/ZwAuDCe1b752Z4jv5dXXPRbhiMGj7H4YFLYJMbabe1LOZRcHrqn+kXj1
	4xr/hNVCSxsBbkvmJxcjSD3TCbeInWsDcDkR82/OyBZqLQ8s/abVmGzDV9QkLvQdOKwVQQrDQXW
	UXsaRuMPu+fk2cu0nSSiF5bixAVoflzbWL1REBa+b72OezhzKVDEvIFpBtpN3QYM1JE+4jrzf+w
	Z+SNa6g/e9bTMcvbe6bRUiKSpQfKr7mjXWAlAt+XgumVREqd17p2aTGbMU9u0QOVb5N9dwCc2Dn
	ZpOuBmslqkkLOD5IhJ
X-Received: by 2002:a05:600d:8496:20b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-4922ffaedfbmr1209555e9.22.1781544116287;
        Mon, 15 Jun 2026 10:21:56 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm6870805e9.15.2026.06.15.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:21:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Mon, 15 Jun 2026 19:21:00 +0200
Message-ID: <20260615172105.3758-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_102158_571222_1E44CFB2 
X-CRM114-Status: GOOD (  10.99  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0


