Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9705C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:08:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672BB613C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 672BB613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+qTsaapPgJuxMMHPP37mK24vj3pWhuNHJSeW40F9Fuk=; b=goNRqHj79hzWuDJJNBGmAZULV/
	zlSC8ZwouCmPr3tVFZnh+AVRKStq8vzOy3m8bAVbJEJL3/0hFPICVXCDVywVwqsK9p3vRc2G0dfpk
	1sitdM7T+5DcEfEP3x6FEH7EpdFVznbObA8vUcRFZbk0Mle3md/o280IjIxoYvZBW6t4A4WI0cP3D
	711nR9jJT22X+Qf7zIMQSWsBX+DoVXWtx84dPZqKzgtO5Whanm0u6h5vXrYXlt+DU+LGoDBEc+wW5
	xFCtUi42rol5myzlmy6PUp/XBAEmEiVxRRZEjgZtekV5GoSa5P8Bb1w3gED7kg9hNovv1xsgnut6q
	Z5UAjyhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVWR-000Y3h-3i; Mon, 05 Apr 2021 20:08:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVWM-000Y0s-Qp
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:08:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so6137716wmf.5
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzJH7Fk4Fc61upKjMDDFY31BpQ2CJ0Y/l0pKp7AosC0=;
 b=mODRn7zvxl0fGW6yidpUQBRF97c/OL+PBw/eoFfwBcpqF5W6k26SYTHEjDXBWxi2bT
 TYQyvSBlDlFu6LSvRqq+gQjAU9sJUS1Zn6f2p1Tr9SysGLQ4OHC7YzjwSFZfzKxq2Wv4
 7Mm7oIyndndB6lp2nFL1eEkyv1MSQo/Va3rEgZ1FORGHaDQPTLWNbWjjBpZH1xwjp3dh
 BV3cygGjErNUadI2ZyLGiFNdNDcSXX6n4WEFDdMsDIF4NhrJvoeWbby2EUzII+U6wFZV
 Sbwb1vq8Iu9eDwYQruPqUY99gvUvcY9/uPRlPEWwU+UoglD0GmSdPuNw36McAhos1TXr
 jdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzJH7Fk4Fc61upKjMDDFY31BpQ2CJ0Y/l0pKp7AosC0=;
 b=in+O88qJdAVZsxej6T9ln1DwxSMQa+v6i3DVbjTpGvRyh7SSnpBw3MNHxrc+ZdDcHC
 wGOpiEm8veWMdwBm8kEw3ty6fJ3uPkwMODfledpqX/V37KKeOdhzpaGGBHepwenoGeVD
 gRHIiU1kxs7K0eX/YCMxxGx6pZkL4jjaSUefOfTgXMeOrGy6KlR0rLuMujGQTLkW0kdt
 Zp45ryetVVfGrSFRNiEhcgpVL79AuzHlnRV3q5AOkQ4NtAJICyksBDRp9Q38L+HDAlPu
 DIMdchY9FhmIh8Ey+3ysUl1wTli3aKX0eYSfz1ExoXuVOCTCgmcma+PFAIW7eqKavRhk
 XnoQ==
X-Gm-Message-State: AOAM530scffLN7Azxhz1Ol/t7JEDnevj5KwC7HoIxaCq+ff/OsGwVpKR
 PNRp7uIqz6ApUV02LU+ksRdaUA==
X-Google-Smtp-Source: ABdhPJxjoSeWcA1NNDsqV2aXCmphXzWc6o535OR+3DoQcmV5mwnWNxuP21QvzdZfY/H1pw/6atiHKg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr717892wmc.6.1617653305072;
 Mon, 05 Apr 2021 13:08:25 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id v185sm609420wmb.25.2021.04.05.13.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:08:24 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8167: add mmsys node
Date: Mon,  5 Apr 2021 22:08:17 +0200
Message-Id: <20210405200821.2203458-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210827_423644_CBB644F6 
X-CRM114-Status: UNSURE (   8.64  )
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

Add node for MMSYS.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 156fbdad01fb..9d765034dfb0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -125,5 +125,11 @@ pio: pinctrl@1000b000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		mmsys: mmsys@14000000 {
+			compatible = "mediatek,mt8167-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
