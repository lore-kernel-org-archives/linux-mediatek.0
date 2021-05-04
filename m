Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACA1C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:46:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC628613B3
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 05:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC628613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAOvHW4vNuaL/HjaKa2+yhRKCi1sm+oAWpInAT349Bw=; b=FHqM+SHbpnfLed
	XsSk8DZNY7T4fgFjnsCXJkPuxCg0yLNtYA0exFyFcZHmHnqGxv+uriOqq889q0qZ/Fco7S7p5lmBH
	sZCNFvlIn/QLcWsPt45MRwSX/Y9jx6TmfqJcIn1n8A4TVW6dHosR3LGgRVyHgEZuHhtcujyzD7MW2
	tnR8tJqbY/RX13Rf3F8wexJ7pOHQ39dW5OVE7rjkesKvlCF+3oRV2lAh1zO9jysZfHcownLkGAsMU
	y/SEDlsldTihkEAFpXX+7PnWZ9QT+V91d/NSDKKiuGOM071ooDRfShqb1V32H738vfB/NbgSQdcPS
	ACDpDIvGTyWVf9VlML2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldnt1-00FVeg-Tu; Tue, 04 May 2021 05:46:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnsz-00FVeJ-Dg
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 05:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=; b=Bt5BxXdV2xraeryD+4EQLi0GNC
 BXatVfklC3xbBrzPICe1Zz50p9cX5YU+cNVqAEZKTodni5YL5PwVLNTY3dDkNICsYfWCnCD3wwAZr
 whVpuiLcmRmJhNi7NCTBQvdeD+rRmIE6QoZSsrBGyzAfNe++0SvzDChALN4WHeDHh9ZWzsWRimKGM
 MW4E4T+sLydMrmX8ufZzc4ywR0GCXIz2Kz6tNoBNAytfjdCmzcvx55ZeKzHjkEXW396Oapdp8cK84
 dPWoJ3uRfuXkqm4ut2Tk1ZZnGo0WsDWK0a3UNX9FqL2zPT8oV54YiZFDFQD5oYdlIjR/oZ1a1dENz
 jZaFh8eg==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnsw-003i4O-Pt
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 05:46:20 +0000
Received: by mail-pg1-x536.google.com with SMTP id t22so5784325pgu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 22:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=;
 b=gnKIY3By1313xe3KI2MzJaEImpUN67oJ493K6SIizHHcdFT8s+tI+l63jcfiY+tbfx
 prf1DKp3+Q5VfwRSBu/A5kse+Lv/iD8UXwYNZcbdMb0Ino7l5Urqy+n+dxZkgjjzKglm
 bOG2zfjflgNvbpasC3EoVH1cU7yB6UoOhknUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3OaSiVF5MtL/VroYDmXFrkkWbMJTL0iUxMjRnNHvBY=;
 b=jice7Dx1OeWdg7m6S1G+gm26I901sIBIyWtYh23eR0oHYzcytudNH0NyuZ2NgHKaL4
 b7ZmjnsnFMz5U6ZnuX1YzrbHuKng3omc1SLeqes1MoPHkM0EaqN886oRktttLnCOhb2p
 shrKyef4CAmwH/iOhIP1lVBNCLv+a9NBuikyRfdW+19w2bBkTKbPsX1cnhmbowsNV66q
 4cfK/Wona0lpWaT8Ak+3xNgo0nJPhIsJgLS/YmfZPdvCGNRFAxlbU7nqYbx2LXGI98gs
 YlkFTsMm4l4hR/Jyq4KExNTw7TWZjIfVK3ToMXBRH/qBtB06uMoaPAEXT7H2MxpUM8Rv
 80ZQ==
X-Gm-Message-State: AOAM533mWGz22NupYeNIZdeFUPw9L+Xoxc++ri4kiWGKTXfjSwuQXXi7
 /MWGb6EA+N6SWhnq1PjVnvgxrQ==
X-Google-Smtp-Source: ABdhPJyAysLJfiaWYGW5sH5Dtp5sZypcC0nLxN7CWjNcj3jP9SuliBIkHoO3P7VeB69JgC6B2ubZKw==
X-Received: by 2002:a63:5245:: with SMTP id s5mr22167254pgl.234.1620107177329; 
 Mon, 03 May 2021 22:46:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bf4e:921c:69e1:5d86])
 by smtp.gmail.com with ESMTPSA id g21sm11512515pjl.28.2021.05.03.22.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 22:46:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: mt8183: add mediatek,gce-events in mutex
Date: Tue,  4 May 2021 13:46:11 +0800
Message-Id: <20210504054612.3585017-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_224618_844792_0EE7FF88 
X-CRM114-Status: UNSURE (   9.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mediatek,gce-events is read by mutex node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..cf22d71161e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
 			reg = <0 0x14016000 0 0x1000>;
 			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
+					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
 		};
 
 		larb0: larb@14017000 {
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
