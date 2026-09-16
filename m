Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3D4C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 04:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=; b=n0gcFdGalx3Vh35Nrj1em+0H9f
	prIygjR85Yu9EY0DjqTS77JO1ZPeroXNOEMf+ctnjIrwmkf23PNgh1EeY60ChEwUd8PdpOUyOTo9w
	kM0KArYYESkVbKDvdTMZLY4d7IK2J2HyjmukezTqDWHV2PVO8f1d2U4/TmPIrVFprRbEsg62kMhHr
	ONEJWQt9AsPD3m1SUzm6/mBza52nwHKeSrM4YgGZBQOJK9bCUzIz7pVRtWLhddinfWS3r87zcNwDd
	aTYfmXREKVt3eZgutycXme4nFOsttfOJ6pqIIOXAlPLx7FWiJrmcAXJpeSSE4Vm3WhQzrCAVyZP8X
	m2GKQ0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gof-00000008HPa-1Qtr;
	Wed, 16 Sep 2026 04:00:13 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6god-00000008HOr-201a
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 04:00:12 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso335740a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 21:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531211; x=1790136011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=NqJfHN/JPKofvfKI/cp397JElb2JWinLsAyZEoWIvdwsdgYrrNkTm3fbfgr2rYLPN+
         4S7KMPB/jO8jNioVJ0r9p0BFqAIXehHZjnFCu7X5syYFVdDox8ckLAw/+98YWMFgWU25
         BXN3kp5bXCB94AJhfYC3hxs/4Bp5BNFIe7NWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531211; x=1790136011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=P9IHYjRb13L1ejZS74Kmaj+BJhvQYowyelyUGNNVBrkaJcH5TG24G/6INzN5PQsnI6
         mutAvVIcIdkJ/M3myX744ORk89mOuPy7hM5h7OUvHEpINbJ6SvisiPM13OTsfN0ZyfND
         0vv6eQNhHVR6lTFLUpgva+OUpG9ZfWFfY/ZLEbJOsWI8joKL8RnkWjdhd47HwYvkhqTO
         1oczfWrqAGG6z+OgaxuKErGtjWAw7VWk+kUrfIHcp9yPsqvKh6wQ86tz3AKtfBp65MrT
         wMY9/Mb4i7HIRk2LhNddqXOnBsbvVSiGfNHPmgIaimC6QWfkFjrU6CSsadCPP/6KK/o7
         5Jxw==
X-Forwarded-Encrypted: i=1; AKwUvBz6dDmlityvQSVCd4AGG7kc/9pfatsIOJvil+8Sz1rAD48Y/QG6uPXp1hyLqrL5kFynuKd1rzJLKTZxhcKxew==@lists.infradead.org
X-Gm-Message-State: AFuF++kj7CChRNwwpIYY3KTavvNw5mybStd8qI8kZRV7BgAdDWfRvQAF
	IV8ArJcx9yNW+DOcLeb5GXYfXI3Vy/H3dmUgIgZiXhjTo80nVrk0WFL2tXM+4Tzpng==
X-Gm-Gg: AYBFou1IKxMS7fLD1ThunVUS9VBFRbOznn5qoXGPPYP5PSqWpYAvGpyDpMn6mfWOyYa
	CO1dXRC/Q/bwfKf/lQGZ8raPoO6Wp4GM+hj1FmjNKqsc40234brQ/6wd1xZp3v0XXMQy1PgJQ/5
	XOJy3lL1bLUPIgRXq0W8WC01jb6klL+G0wSs6gQa41abkq3EAITi4t0K5yow2Sx9DqWBS/eUHU0
	E005ZDFc2E17haAt4CdzmmooSa26FgSzQC4UYwZo5bfjWGjdXBrlfGvgvdS9mU5pgdyD4REMePn
	FS4sgcnu6OfgOA7cP2Nw51C3UDa0RS+7xdgIpqj0zyRTcWWvM9iOxB3CJ/xwlLyPnyltbCYe0CQ
	m/kfZvrLQfafrPrPhRxLh1sgqjb2Jc0Iw/NBaZ3uXj/7TuY3n7+hKq3w5eCOTWzAwRL1G9KPknt
	3SI6uhnxDpe5S3PjYYb/W5CR5WHl2ofuKouVpKs1MUq6PVElv3nUdSgfmEkADoTxzL2JXyTHwpF
	ykwpwLCHfK5tSx6ouWR77phgsIZX8dyEmC2rMQrjr1yfaNgWJZv6TNnfGLgmz239IWM
X-Received: by 2002:a17:90b:4ecf:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39e1e49a802mr2704118a91.16.1789531210421;
        Tue, 15 Sep 2026 21:00:10 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 1/2] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 16 Sep 2026 11:59:51 +0800
Message-ID: <20260916035953.3111607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_210011_572256_9E49E531 
X-CRM114-Status: GOOD (  14.07  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b78dbedfeca8..e75ed4bd458f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.1032.g73a4cd73de-goog


