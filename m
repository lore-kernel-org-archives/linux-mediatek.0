Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC75DC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F2F6101C
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F2F6101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7id6pPf9wCnjeJNJgDZJ8OG5kaPjL+5ceV1s2hHmNlA=; b=oJpCYdUleXV+SB
	0OrSPrk1DsOLhBNZqZu8m009UQxFJVSe9k47Vclkd3CWHLtkC+bYu4Ki6xrZyE1IjwafSBSxUmwdl
	PwRr5ZZdmBuLJpAkGYy5APkTYHsHb3AwZcrnkPk5ZA4v04Mj/apmdASrnxCBFAvI5aGjX2UQomlu9
	4hla6kWI3DwZum8wS6oJUdoKjL5vEo8dwIcaTnRZZ3tXwpCD7Sr83Sg2AetZFWN2fPdnsdssdzH37
	cOl5OkcpafwDrEogJw7+dZ4J2oJ19xrmP+0zubJzwpK38vJ6EPpQf3XEjXmVft3J/oK42SP7Jk3kL
	iKsTWQp+qtr2VW9357Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKtHE-000zJV-4D; Tue, 31 Aug 2021 02:13:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKtGx-000zI9-GR; Tue, 31 Aug 2021 02:13:16 +0000
X-UUID: 2953ff9d6553409f817a9b2b2c23a2be-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7tascPvOthSxQD1QmSeZtZkJQgMJzP/J0cS3J0bcoUU=; 
 b=pOgL/wlGe+KsicWXeuve6+Ueyk0qKu5kauuw7NPdMUQP+bhc+ZTqFobj98t2whRlwuUNFDd9FZUkejsYeYfj2u5LnExscCToE1J1ES9o45sKTB5wUr3kqlwK8o3pYTpcaTa+zTxb0qTyelgOPglEWtJ/jLWTAgTfecSx5zDYhys=;
X-UUID: 2953ff9d6553409f817a9b2b2c23a2be-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 616965063; Mon, 30 Aug 2021 19:13:08 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 19:13:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 10:13:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 10:13:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
Subject: [PATCH] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
Date: Tue, 31 Aug 2021 10:13:03 +0800
Message-ID: <20210831021303.5230-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_191312_999362_BB7B2DB6 
X-CRM114-Status: GOOD (  12.08  )
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

randconfig builds show the warning below,

WARNING: unmet direct dependencies detected for SND_SOC_MT6359
   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
   Selected by [y]:
   - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y]

Add a dependency to avoid it.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index cf567a89f421..f6bf0f9c91e3 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -197,7 +197,7 @@ config SND_SOC_MT8195
 config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
 	depends on I2C
-	depends on SND_SOC_MT8195
+	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
