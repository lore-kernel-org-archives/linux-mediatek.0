Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDACC433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED35F207DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccnmoNpD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1f2Jtl85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED35F207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zlerw2WRHNQu07IYX8rwBsj2d/GUJxOv7XyGZOuGi8o=; b=ccnmoNpDnfGuXCLR5uPvpD+bA1
	UH8L3gWo5a7Mk636YiX2fYVWXgTT3hQlvbQEs4TWES3OBjk9p05l3rUJ9A2oc/9op3EWpaKqFASfW
	VYMQyx2saSqh6qMB0haAzZwfw6J8P4QQlYi/DisRn7O4gkaNVt9/UNFSFGkxDsoQsdYBbXsSVqO3v
	P05m4DYM4LZ8YvgxV6hHM6dDn6PH9GDwKHjygIah/v3EDf/TsG0o4LBwq8c+2mPIPyoabbbOx64+g
	dOIw2vufr0a6Rs96i8D9MTGjMVsHapFnd15IwQRebcV5UeXX6QwqWiyyTWxHmCvSRbVHy0IXuvCcZ
	O/tDl3tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEZj-0006gy-Pe; Sun, 18 Oct 2020 19:42:39 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUEZb-0006fQ-Cu
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 19:42:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id d81so8290859wmc.1
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKz/glIDgqXLsKwUH5mAwh9re1kJ1vMgTO8yUCSmg/4=;
 b=1f2Jtl85s/SyDOvTb1ZgqX2X2g3djWqoR7b7ydmDzDFSbYe6UYbXVbs1Gv7yAbg7gX
 cRme3fyaWAxycWYUVGs/431BTGMbotzOkxZYU3VHMnt3nRtfslvezYF/NE2ZrrZk+fXK
 fdEH+OuxEQnjkLicXnRKJkYyIbKF4nTCCHcwC0aBCEpQygRZYcBZxnIzqdVY16ZEYJCl
 kL2Sdo2Jcsa5FYMPPIJGvUZ0GR1whh4BVgYnkmuKpBMgYVRuOSOupld+x8k60QEVCfxF
 4uubbd7N6bA5Xe9Y+jIhZPa6Z2YP7T3bdKAqa+s5j1v5vei5nPBwrnI9yKPH0vLTLxFG
 68zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKz/glIDgqXLsKwUH5mAwh9re1kJ1vMgTO8yUCSmg/4=;
 b=gfWSC5xDXAv+8BrA8cekt/OaRX5HkyeaEjFoHi2GUWMzfaVvAEX5WJFo+cQO0oYdak
 barqsztCUiSj0Isj2HUiOelBIZXM8O9+tfsNQ9J2X91Otx0ZVZM3UWjjSF9sEveCqY1t
 YqM7LvP+hhPsn7i884gfMO8zOokUGW4X5WxmA7mxn02+A4w/HrrtkXJs5BXu2u1eRVoC
 LkMsrzWrtWpsOuncSxVHT+j9W7mSrcDsDkU9iDkJpHKJU3rZR9Es0jzmpq+/CIM0WiEm
 YmCmyrgnX/k7XPimbYtu/K1iSwFGjswpNtwVffc55n6a5+mmD/Pbl6RC4V/CyGJwXGGU
 bmIw==
X-Gm-Message-State: AOAM530s75xI+BPZUi/e13KOfn0PhP0HCK3/gaieak5Wyp9WuD2VTYfq
 NKcNesczjEBchlqj9CMOwFRy8w==
X-Google-Smtp-Source: ABdhPJygp4zfPt0GTUPgI2ugSev36X1niFyJ+XGD4da4OhVKLzbK+lDKf86uxATNEWqg/QYtTRt9/A==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr14912567wmi.56.1603050150184; 
 Sun, 18 Oct 2020 12:42:30 -0700 (PDT)
Received: from localhost.localdomain (124.171.185.81.rev.sfr.net.
 [81.185.171.124])
 by smtp.gmail.com with ESMTPSA id l11sm14253674wro.89.2020.10.18.12.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 12:42:29 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
 value
Date: Sun, 18 Oct 2020 21:42:25 +0200
Message-Id: <20201018194225.3361182-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_154231_503637_A88E904D 
X-CRM114-Status: GOOD (  12.48  )
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
 robh+dt@kernel.org, bibby.hsieh@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The binding documentation says:
- #mbox-cells: Should be 2.
	<&phandle channel priority>
	phandle: Label name of a gce node.
	channel: Channel of mailbox. Be equal to the thread id of GCE.
	priority: Priority of GCE thread.

Fix the value of #mbox-cells.

Fixes: d3c306e31bc7 ("arm64: dts: add gce node for mt8183")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 102105871db2..9a3cf95676e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -352,7 +352,7 @@ gce: mailbox@10238000 {
 			compatible = "mediatek,mt8183-gce";
 			reg = <0 0x10238000 0 0x4000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
-			#mbox-cells = <3>;
+			#mbox-cells = <2>;
 			clocks = <&infracfg CLK_INFRA_GCE>;
 			clock-names = "gce";
 		};
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
