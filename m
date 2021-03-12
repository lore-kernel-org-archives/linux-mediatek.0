Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5D8C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59D364FD6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59D364FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KhZtKsAaDysmjvfahKazUTzhDrpBg0fq4JcEOAXIFx0=; b=o+c0bpsIe9OHxasA2FlNatmct
	cT8j/hruXJqQPWPJM3I6kNS/JkEqJ6T0KYxFB8U3wrUuQQlS5Z1qRzPTgbz89Dq9KjDYnVgviY68B
	xxImGJnLaXelHMd0JU8nNPdd9VJmmtaQ0kdIP2nSjxvfoB4BWIEsJpW1LYt1fz3J0TGsayQTJg6hP
	zuCB3oDF8xFFIk7mx0FgkMta6tBI8TRVfxObReBWHkT4kvJaLJQPjmNWnAhoJYQMzaBUI2Tx+SR7N
	tJGALXWQuZYOFzVzDyM+fOt3Z/rBrVfagjtiotWBhhzbI2I+Yq9++ps7EvBYHdtXfG0AsxDaHmYDB
	hwOl0GJ6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjEK-00BhBT-Ps; Fri, 12 Mar 2021 14:57:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjD8-00Bghp-QM; Fri, 12 Mar 2021 14:56:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DAD464FF9;
 Fri, 12 Mar 2021 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560977;
 bh=EeQot5X//FjuQTal9q/g0ToHWZJHUtbmbREqHYseiwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BrglqvdGLnT4e90Qla4OmZ5HdXHMJnRu9g4LanqFOzGayG1/hP6Q5NMsG01EYLmMj
 2iZOI5992QrM3G442A7hefaSW9W+CwKGfgb+uDywhsw5K0eCAPuDHdb60wvEX0zY88
 z88hDXffg58KzrectbLRthOqKaZuYP3id8kolp7uDKDAkOBvfPQGmv24ztFw3UQDna
 Rn0HIlvXdqLj8eqBZJ0v3WlsJOQis13pTGcbqykGrZ2vF6jj/5E+TsCm/O3ymXWaEa
 Qn/gn/FNXQjsIo41XGh9NSmZjCRLR/O0zLfgHQ5AaB7JhG917elCjeWvP7KxHUc4MI
 edZ82S9Sr7yIg==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 6/7] arm64: dts: mt6358: Drop compatible for regulators
Date: Fri, 12 Mar 2021 15:55:44 +0100
Message-Id: <20210312145545.26050-6-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145619_935070_613BE501 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Matthias Brugger <mbrugger@suse.com>

The regulator framework does not need compatible, it's actually
superfluous. Drop it from the DT.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index fa159b20379e4..e423feac0bc2e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -15,9 +15,7 @@ mt6358codec: mt6358codec {
 			compatible = "mediatek,mt6358-sound";
 		};
 
-		mt6358regulator: mt6358regulator {
-			compatible = "mediatek,mt6358-regulator";
-
+		mt6358regulator {
 			mt6358_vdram1_reg: buck_vdram1 {
 				regulator-name = "vdram1";
 				regulator-min-microvolt = <500000>;
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
