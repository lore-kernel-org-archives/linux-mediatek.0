Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5CCC11F67
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:40:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1FC61449
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 09:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1FC61449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T4hTk6DQwJ+ni0hgffG5TydQQuN0MrOKKj6FeiHAxIw=; b=4ytZYbGWR+w9k/
	Hx0gs0Z5kb46Bvzl39hWpGCW/9wDtRzpCNpcaFpAu1hJud3Pt9rj3HVyIeavznVqb8RfmryFvOwh3
	Z7yAXNKoWQ8jTU8kjPSwu9Ht5iUTDZyE7VIucNkL2iH1TntYT52U2T7f8S5gZJe5euxKnJ/IqIRNh
	Q3kye6AXSfvQye2VRHzWJMa8hvwhe1UPN9INS16fCRQ2LwtL+AVW7WL+8djAtcfFkQnHSnR9uHcbu
	bf8tbetvZkPya+wjy3tbhANLjOfOb5Gl5cXkekjKcwVqAQwp5H56PFv1U+Y6WTDsd2EjKz9hyPqMl
	irZlj+QWHsPxVuiF5xYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lytBf-00GmoX-Kc; Thu, 01 Jul 2021 09:40:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lytBR-00GmkJ-Nl; Thu, 01 Jul 2021 09:40:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6A0131F43DC5
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 0/3] Misc bug fixes in mtk power domain driver
Date: Thu,  1 Jul 2021 11:40:21 +0200
Message-Id: <20210701094024.1273759-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_024033_940869_C448E776 
X-CRM114-Status: GOOD (  11.51  )
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


This series, originally sent by Bilal Wasim [1], initially broke my
display in mainline (no gpu driver). The problem was not in the series
itself, and, after [2], this series works as expected. I was able to go
to the UI with and without the imgtec gpu driver on my Acer Chromebook
R13 (elm). Hence I rebased on top of mainline and resend it to take into
account for next merge window.

Best regards,
  Enric

[1] https://yhbt.net/lore/all/20210216165926.46bbafc7@a-VirtualBox/T/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210625062448.3462177-1-enric.balletbo@collabora.com/


Bilal Wasim (3):
  soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
  soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD
  arm64: dts: mediatek: mt8173: Add domain supply for mfg_async

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
 drivers/soc/mediatek/mt8173-pm-domains.h     | 1 +
 drivers/soc/mediatek/mtk-pm-domains.h        | 2 +-
 5 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
