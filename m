Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EF1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:24:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FD720B1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 16:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Lc0GNC7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uDnGJdlH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86FD720B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6IWO3LkrJ0fptF65PXCr8BTU4wCQv4gi8UJAYqP8tBI=; b=0Lc0GNC7b2rMOCXqRr4XH/dOxB
	DQvuhVuuwTuG7hLJLLlCYx3jm6MX/dmCpq28O+aFHCymPw+zgYbMxxzfPIsxW5FJ2eVT5t0VxVLCf
	f2PJqEzyVc/A/GW+rM6/4KgU0YvxAruNi27OYKpF+ZTRx5E8pIpRkRRn+LypZUjKJcfD4IxAOm53S
	yOij7RCmGSdvaFUG82sqnalUCLYtZTQ6/UXL2soH6JYBA+05dwWMnTwqoVOwm11nxDQ4RyaQCqSZF
	k7fktxkT37mxieZHkdJlQgLoVi8KV26WTPbpKwRdtoPIcw4oTPEswOWV9PnzEaSO1sdTm12S7ttHA
	EUgZ4otQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSjZk-0007SW-P3; Wed, 14 Oct 2020 16:24:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSjZi-0007Qz-29
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 16:24:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id f21so146641wml.3
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2020 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xc8G40tYgwiAv2ESHx43A45xg26ysJOM3AkOz4ZNqWQ=;
 b=uDnGJdlHYhAtlRZpVONEODX3++/Ye9xPj0H33vq+HUBiS0ct0tDokrtZHJBow4ddKS
 V8VQW405k64jZXK44pwP2zQdwHaOi2X9GRZok3aCHox6TuVL0z8BSE8ax0uR3TvNbEew
 DTzrWJ6CBPbtoYlyQJKn94j6lWdIFqlbwTlrR9WBGPgdZU34+r+O1u93lBi5g1eDmpLp
 0rfOVUO86wtKQfuGPV5PeDNBuE43MwBdVtFEf2294FDBZrEmc4zP2VnA+IOCCzAFp8XO
 YtxmDNm5Id5MsaZnzWT4NUoPe8DuPPsM+gAKYqFQb3EhU/EAI7UC2JLPrbyfUvu4Ilm/
 xJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xc8G40tYgwiAv2ESHx43A45xg26ysJOM3AkOz4ZNqWQ=;
 b=K93lG+qg/YG8dq8g8sZN32C0z8QVqX7eK1IFqbcPgQ1bvWgGI+aiwTYI+HdNqvHbVi
 OXmID41uOKZFB5OmCcWpXao0QYyAmHK72Qo/Z080liCkv5Po1KN9zJ1vo0hfTmN5spCm
 PA0S/U+vfFpoMxUGmxHxwnHoOqEidE6X9EJQSAkbYxBpgsIfc5iab6CmF8kLxw2ZJAOL
 I6RulMZCH+rdbU6Vco2PW/YvYYhPGWgWa4Ld/SoiF9q/WrYao7tTj306GeycwfP62kAP
 43iM093rqmVE5BlWP5XOUhfp++H9TgHQbf+fLJWvk1x8v6PXf/lclaHjbly0OiK/iVEv
 Gz4Q==
X-Gm-Message-State: AOAM533Hmeis83pV8eTWh1g72YyUkFt2ajdnIudbmnuagoWf6e8C3nS4
 arIprh8YScCDDyHfnHauWs/XtQ==
X-Google-Smtp-Source: ABdhPJw7WdycnwRe7GUnyPOwfkfjcJNVjTEjNUQ7ks7X5h2H2zkzq/jAlBVaMGWa8NIFu9oDLiwFRA==
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr272353wmh.26.1602692664144;
 Wed, 14 Oct 2020 09:24:24 -0700 (PDT)
Received: from localhost.localdomain (138.165.185.81.rev.sfr.net.
 [81.185.165.138])
 by smtp.gmail.com with ESMTPSA id x21sm206227wmi.3.2020.10.14.09.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 09:24:23 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8516: rename usb phy
Date: Wed, 14 Oct 2020 18:24:03 +0200
Message-Id: <20201014162404.1312544-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_122426_203396_A548BBEC 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The USB phy node is named usb0_phy but there is only one phy with
2 ports on MT8516. Rename the phy to make it more obvious it can
also support the usb1 node.
The usb1 node will be added in a follow-up commit.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 2 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 943c426e9aaf..50049b6c1ba7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -455,7 +455,7 @@ usb0: usb@11100000 {
 			status = "disabled";
 		};
 
-		usb0_phy: usb@11110000 {
+		usb_phy: usb@11110000 {
 			compatible = "mediatek,generic-tphy-v1";
 			reg = <0 0x11110000 0 0x800>;
 			#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index dfceffe6950a..8bad8faf35d2 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -195,7 +195,7 @@ usb_con: connector {
 	};
 };
 
-&usb0_phy {
+&usb_phy {
 	status = "okay";
 };
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
