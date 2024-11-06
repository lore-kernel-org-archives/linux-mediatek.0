Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8716FD44D51
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=; b=JGwe4L0fg2MMMhV6hITE5rgaYV
	Ok9k/su2JVi0SDNM8K99MShfHNixqflU+KYwHlkc55uNmquxCMkaam/f/ghsgRud5fGUSWUacCM6t
	/ZFqt6WbFymRgJ/YgTJaWpYGsVXcpih77nmXm45Cg3sbXu8yfEoQz27SkneLC1KDTIczyutBqtwWh
	1j4RmuA06/N7HlLJ+/M4DllGGoDSlqbU+siR0ZE5Aj2fMfydck3/heUP2+KkbAfbcbY0Ets9zKTqk
	q3BcQAX73zjxhoaeKHpNzuNFaXib1kvJE2bWwDnmv9Iylo/7BTIUKEaE71CCfcGpdRyF3KjGXq5om
	OKYenuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eUo-00000002ycR-1fUm;
	Wed, 06 Nov 2024 11:46:46 +0000
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dZt-00000002nqx-2lmo
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Nov 2024 10:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730890075; x=1731149275;
	bh=9FbpAsg3o7PfFDuCF41WcBi9lk55h04DLXJFlfqA0BE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=sxsclCJegFRL6x4xkC5mrgqX0ejLFv9tv7vLYtkBjZsBQNV2k8rc9Pg5LVlrCRPgP
	 DMXkRIRLPirrQLw/MPoOBmR+xZiB8tNRGNkedeb2pElaKarIF6e0fMY6PlpFf6tuxj
	 c5ACyhW7/v50RhFxlekVQskzsOQwo+vFlHoKalmyiVDAqKX6vBH3TdD3ww9QIhVOoM
	 YlwiYEBPPB8bTLZ14feBfTjDJsQHglLtVIKm1SXl/mbgGjd7vRWuwefqdjd5TKpqOF
	 MHLqMadkPLWCzQvrKogK/5DqHb+fFPWzGWyATb2VROJtzFabLg6lPQK/6Unh689xgD
	 QsczlP9DlXxcw==
Date: Wed, 06 Nov 2024 10:47:51 +0000
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
Message-ID: <20241106104738.195968-2-y.oudjana@protonmail.com>
In-Reply-To: <20241106104738.195968-1-y.oudjana@protonmail.com>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 2270a8af62230626aa0eba89eb49248f2a8f9a91
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_024758_206092_26A62C0B 
X-CRM114-Status: UNSURE (   7.81  )
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

Clear the IRQ enable bit of WDT_MODE before asserting software reset
in order to make TOPRGU issue a system reset signal instead of an IRQ.

Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index c35f85ce8d69c..e2d7a57d6ea2e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt=
_dev,
 {
 =09struct mtk_wdt_dev *mtk_wdt =3D watchdog_get_drvdata(wdt_dev);
 =09void __iomem *wdt_base;
+=09u32 reg;
=20
 =09wdt_base =3D mtk_wdt->wdt_base;
=20
+=09/* Enable reset in order to issue a system reset instead of an IRQ */
+=09reg =3D readl(wdt_base + WDT_MODE);
+=09reg &=3D ~WDT_MODE_IRQ_EN;
+=09writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+
 =09while (1) {
 =09=09writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
 =09=09mdelay(5);
--=20
2.47.0



