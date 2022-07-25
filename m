Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGQIfBSg21d8MaClj25+YrNibPoLqEzZ9tPdy7y2WU8=; b=eQ24GGTQg3n3UjEVZxrNIp/0W/
	z/sS8qpzbuvYtHVRVlczYj9kiNwP20s9sbitA+gtolZTw/dh14VVw7ilgr5uKtFo5YWmnVw8oAS/X
	b4uCWfDaUnZDuGGnlWN768OmtTpy4w+6/XSYOYWJx7xrVAi+dNbxeCUfIqXE0uwHtwDvI9MBjedrH
	w0LlIYWD4x94UEf+inuGtoi7Dqm4D+37qJ1OGFLbsBO8wBsGHlPTkQ/JTZpLvginKxha6ek+aqAik
	f71YZz882xwHkdVHWamlz+e3La5HOtwc9ulihW3qxXZwZ/exAM3OxrFwbyd2SCqYarzfanhiq0ZrE
	ruxL4r2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtPj-006pBg-EQ; Mon, 25 Jul 2022 08:26:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtOk-006oA9-OX
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:25:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id f65so9708619pgc.12
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGQIfBSg21d8MaClj25+YrNibPoLqEzZ9tPdy7y2WU8=;
        b=Z/44oLBpU67FazLoPRhw9EoDB7p9O0DopA+QnAhE/fO+Qa/QflytOcQ2fvgzPbSw5L
         WQVHStfPgywQj4rIX3JM/mPCAdddMBviY8QD+kdCGDjBpNpLFMDse95KCMVWKn4LUS4D
         OH2W9TecbxWviO8rlbZxq8KlL09VWh6Y3OOQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGQIfBSg21d8MaClj25+YrNibPoLqEzZ9tPdy7y2WU8=;
        b=Sh//7RrMJ0OKs1dWCED4aMTw9xvjKGnVxPzbiXO10gc6ZFXCIa8bqhhQUly9W90a4o
         asGgEcLRWDtlVQ3fvM6eGQWLUKLGGJVhHCilcErfUOrhYsSWCLS9iiyhq1iti6HfvmVw
         Gdt52LzndNZE59+UEpwHd1Fu1HFW60KY5hzGL9w/n4zCE9mNtWakl0RSLlnewiJs6ORW
         RlzvGvPegqbK/OyHwufJIxfXwooZ5AE//cf+n1FQi3odIu6xntC39yAFHhKb8vD6ghxy
         OqGEoDIFt87tcIhUr9W4t9QggGWe1JVfZ+07vHMv1u+5fshQxTG3bPDneS2JcLIyjSII
         9Vlg==
X-Gm-Message-State: AJIora+hfNS0NPSiCs7ynSCC8SHegiOFhLaHd9MvXaGu6Cm3eejL0z25
	7ZP1IFUmyOvuR+nTRhue3TMnbA==
X-Google-Smtp-Source: AGRyM1toZNSKvxgwGTAar8bhczeRFzgE/1q6uyg+lK8LTNMCbEYdUJJ8lpGmzEk3tpAOQilyUtm83A==
X-Received: by 2002:a63:9142:0:b0:412:b171:b6ac with SMTP id l63-20020a639142000000b00412b171b6acmr9876579pge.206.1658737501260;
        Mon, 25 Jul 2022 01:25:01 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7c:3b29:8e9c:93e3])
        by smtp.gmail.com with ESMTPSA id f21-20020a63f755000000b0041ab5647a0dsm4010394pgk.41.2022.07.25.01.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:25:00 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8173-oak: Switch to SMC watchdog
Date: Mon, 25 Jul 2022 16:24:47 +0800
Message-Id: <20220725082447.2613231-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_012506_846273_0E0B6196 
X-CRM114-Status: UNSURE (   8.89  )
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

Switch to SMC watchdog because we need direct control of HW watchdog
registers from kernel. The corresponding firmware was uploaded in
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index a2aef5aa67c1..2d1c776740a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -528,10 +528,8 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
 			};
 		};
 
-		watchdog: watchdog@10007000 {
-			compatible = "mediatek,mt8173-wdt",
-				     "mediatek,mt6589-wdt";
-			reg = <0 0x10007000 0 0x100>;
+		watchdog {
+			compatible = "arm,smc-wdt";
 		};
 
 		timer: timer@10008000 {
-- 
2.37.1.359.gd136c6c3e2-goog


