Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA9DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF2964FB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF2964FB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E2fcoJxAG13rnga4fgn0/dXY3ZjJsRm9tTs4/zZeP5s=; b=Mr3sr63v4lWCJbhZcXpYeRRZR
	J991DxUiFDmdH+SPxk9R5H3vwoqeRdVUMo6KwfofMezhxSvDGgkBKTZsgfhZdgUzHiQk6/0rrl2V1
	VYBJXOSE1PjwfOeBu2Gid6ArNvDloatVcL64MEvUNwfxzGIGEiddHmUG2Q0C3kbtTdFPcnCgG5apa
	truIv82Mj2AG7efTOV4jb/a6hFxj6ROv6al+5v3+e4E8ZKiBl9SjhLinly4TkrAIvrYyg7cn4c4Pj
	D/uppYNkQMnMOQB+jfm1ea2LmvxjnIfsQSz0OKmGQHIELZnrlYR7NheBSNA0lOUMU6PknIIZYtQYf
	oFmzMm3mA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjE5-00Bh0g-5H; Fri, 12 Mar 2021 14:57:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjD6-00BghB-58; Fri, 12 Mar 2021 14:56:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D2C64FDD;
 Fri, 12 Mar 2021 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560974;
 bh=ifVjIRBycLednUeFJybHn/MpoBYTnrWvaqMZFuw5nk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YIhIdSMV4J4FGbGrJ7PBVLkPjHllhez3mjcmjY+l8HYB50TIWR0JWEaTe3WG+zXe+
 X6JYe/UV019NtfDLULRVAlszt5MvsudRyJDCv/e+fR9azaPszucIHYXKRyVKIW2uHx
 liCYf2dBDNkCUrJK/N63VW4R0PH/XqHiNDcVsNkNyWYfR7tDSYIx0yP6phKfiZAze9
 8mTGGe+w3kkI3X+UVLBrjnSYZG6U0yJXzsauSUjiAv8l1OnePcW8Ck02SzzOiT+wsd
 DZGYfdNZ6ZAll7KMyl8QSzLbGheT7PuLRtQY1trHHTgi6scuER/ke5bpUZPGwww9ns
 qP7QGxoOjZe+Q==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 5/7] arm: dts: mt6323: Drop OF compatible
Date: Fri, 12 Mar 2021 15:55:43 +0100
Message-Id: <20210312145545.26050-5-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145616_504597_B0C0AC88 
X-CRM114-Status: UNSURE (   8.65  )
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

The regulator framework does not need compatible, it's acutall
superfluous. Drop it from the DT.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm/boot/dts/mt6323.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt6323.dtsi b/arch/arm/boot/dts/mt6323.dtsi
index 7fda40ab5fe83..d37f118a663a9 100644
--- a/arch/arm/boot/dts/mt6323.dtsi
+++ b/arch/arm/boot/dts/mt6323.dtsi
@@ -21,9 +21,7 @@ mt6323_leds: leds {
 			status = "disabled";
 		};
 
-		mt6323regulator: mt6323regulator{
-			compatible = "mediatek,mt6323-regulator";
-
+		mt6323regulator {
 			mt6323_vproc_reg: buck_vproc{
 				regulator-name = "vproc";
 				regulator-min-microvolt = < 700000>;
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
