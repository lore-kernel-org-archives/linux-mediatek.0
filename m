Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E272EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QdJypCW0UuDMsne3jEHW30VIejQbPsslyYr5uuRVmd0=; b=aVLE0nSFp3T9JhyGOvipU12GSg
	kGcVOSO8zQoHUU27PyRc1FeBIpiKrkLfkIZ86TWVMmQ2MXWESt0BAp/df0evk+U4bXf38zoc+k94i
	wvWpXbPQZBcrqtH3r9LHoapRghLDrHr63C1Vhyz7229VJRZaZANzsHAj7cnD1suGuCW/eyhsyVHpt
	yib8Pa7CbPmPc2eOZRplOxrvSlvy3ctrtffd8/kFfUp6g3//iTMr+74PYxh91vw3jdQ3cUyn7VJaX
	2+VnFGBskvBDDRFWeqqY6DnKiOCHa8HhfzeyMAg5q+0Zo2O06JdlP+2JP9JHcC38t9MGmB0NFoKkB
	q0VUG0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LHV-009bKl-TL; Fri, 17 Jun 2022 23:21:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LHS-009bG9-K5
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 23:21:35 +0000
Received: by mail-pj1-x1029.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so8026078pjb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QdJypCW0UuDMsne3jEHW30VIejQbPsslyYr5uuRVmd0=;
        b=rKoF++nLIneka1QOKMgcZeIv/wUy/H28Ej2jEIjyQ8JlDyf4nxwek7iU1V8NRNUOqS
         yhVguY0CI1xW3nau4JfzdzDuCieg4hg+cSpbvT/2gMezxYerBkrGJd20qv5NYgopSBp1
         a+TU3Wn3CJbxhJTOZp9e8v2qmoL3oAOdClOxDhVR3ZfR6lSXMMTbmW1l5VLonrO/Oq/r
         0jbX+7axSfAvktxeAW6sbofDipEOYgMrCDPwTsti3wWOBphQNSS1vsiCK46PN2pBUMCh
         da3g+Gt4HptUZ2or650YEKyLcduX3BqkkyzJNYtuBCuBtbc5HVAibyPbU6S0lK+55IMC
         9OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QdJypCW0UuDMsne3jEHW30VIejQbPsslyYr5uuRVmd0=;
        b=ZYUtm3bWye1Rvc3BHzAbU+jjxfltL2PoeXQyEGVxOlFi/ZxEuCwIzggTg1gHrquXJH
         Bi46ZFsAyGyJyGhp41YtjpFsQCLGOl+9Kv2y7larLABfIZECwxs0oDSsNXMjLJhSL3qO
         4UbhHHj1jWJcfe3KkbOS574jswr0fQGNB9v6ZQBlBvBFbHvvptlMw09C/ByW7RhqOap0
         /QJZDQ+XONQ6hyiycW50ca2G69ek1W7ndtj5xe/44Z36so7P1LrNebCoe8HcjgUJQXc2
         MlsF6GJwZcd4AhNs9ibuz43uJx/sxvqdEa5o5IN0HcJMEDC8bT6Ru14lXCxYE10jJKFZ
         SzsA==
X-Gm-Message-State: AJIora92DERV/Fhe19fulkee9F3sZTXRXoYzaRYjYB1ZtNO3HUu6blpg
	QXtZpcG4gYng9YXjZZlprbk2jQ==
X-Google-Smtp-Source: AGRyM1ucPevf10WOCo3szS8jM2+bTtrtkki4IQTjHS3j2ZGUU1BghBpBqAUBSm1dcO9pBwaxbfPOvw==
X-Received: by 2002:a17:902:e78e:b0:163:caf2:2ef2 with SMTP id cp14-20020a170902e78e00b00163caf22ef2mr11764443plb.3.1655508090012;
        Fri, 17 Jun 2022 16:21:30 -0700 (PDT)
Received: from krzk-bin.. ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id j1-20020a170903028100b00164097a779fsm4065427plr.147.2022.06.17.16.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:21:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt7622-rfb1: remove wrong gpio-keys property
Date: Fri, 17 Jun 2022 16:21:24 -0700
Message-Id: <20220617232124.7022-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_162134_678789_C15ECB7D 
X-CRM114-Status: UNSURE (   8.36  )
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

gpio-keys (regular, not polling) does not use "poll-interval" property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v3:
1. Correct commit msg (Matthias)
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index c28da9323a9c..1a86857c9027 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -40,7 +40,6 @@ cpu@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		poll-interval = <100>;
 
 		key-factory {
 			label = "factory";
-- 
2.34.1


