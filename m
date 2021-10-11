Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FBDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 12:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02D260E9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 12:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A02D260E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8miAQRDZBFqsGqYI2N8sj/nTrQFfljBcF2QYK5didpQ=; b=G7PPxGtFz3311E
	tvbOGyFW36TfhSnVXJZtp6WnCrmbFU8X+QEF7Js4949QF2L1KAScW6SGuKJS12ShvpqoR6X1jOu8N
	DwIQo/H0H8uHEokqmuD9jiGpLpDoYEm3xn6pSviyFnCqBwVfmGI/1AigZPewzn+7/GOH3LF30DkIS
	jB+rEyasbO/SXpZ6zWiU4dmhEuWvoKxNynqUUEgtkAfyWq7SnPhNzvqZIw7ujWkt0Mnur0xmzS4gd
	KwafreITraPwJCZX24TCypm/OT5cYFdj0cbX5n5u/HNKcvpv5e7/NP8CFIL5LYOeAyldcGAcaZ3dm
	DazSm8XhDGyq6wHBYJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZuo8-009Q6N-Nb; Mon, 11 Oct 2021 12:53:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZunw-009Q2j-54; Mon, 11 Oct 2021 12:53:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id BD6041F42DB2
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 "kernelci.org bot" <bot@kernelci.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
Subject: [PATCH] arm64: defconfig: enable regulator to fix mt8173 regression
Date: Mon, 11 Oct 2021 15:53:01 +0300
Message-Id: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_055320_371923_AD8B01C9 
X-CRM114-Status: UNSURE (   8.77  )
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

A regression was introduced on some mediatek boards starting with
v5.15-rc1 in commit 109fd20601e2b ("arm64: dts: mediatek: mt8173:
Add domain supply for mfg_async") which effectively changed the
regulator from the always-on dummy to DA9211 without explicitely
enabling it, causing failures like the these caught by KernelCI
on Hana Chromebooks [1]:

mtk-power-controller 10006000.syscon:power-controller: supply domain not found, using dummy regulator
mtu3 11271000.usb: supply vbus not found, using dummy regulator
xhci-mtk 11270000.usb: supply vbus not found, using dummy regulator

There might be another bug linking these power domains in the
mediatek PM driver, but that is a separate issue wich needs
addressing, for now just fix the obvious regression due to the
new regulator requirement.

[1] https://github.com/kernelci/kernelci-project/issues/66
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
Suggested-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 156d96afbbfc..4901cc1213bb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -616,6 +616,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
+CONFIG_REGULATOR_DA9211=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
