Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C6AC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60E964E13
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 23:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60E964E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+KwjXrX8p6M7bf6/gaEzVNaDc+U5wRw9uvulDtOuW1c=; b=A1UWojUiJTv65EA6bls6U3bJ8
	AGuQ1THk7IOJsf7YsykXGozHXoGmFACClF0QSs1/K/0Fu0llGTpXtb82g+4aOxD/4O2MLZ1NEU2F0
	98uDsxvxn/xZc6w7pFdtOkTI1RuHyqPbGUbJHRrXoMbTlof9f2eEdlV/BjIu7rDxTc6RUch9iIOrf
	t769APYSP0bVZGKG58IGb1vjrMMq8VpxvPVEtqMynADE31RA7+iJWxt5rYirX73EXeVt1jblOc3uw
	OvKNPbAco/F+9FVgO8Qzvmu9d0qOX4OBNqAABQFuFZrjDjDNCCWxINjmLk9q/nJ7T8SaW3fU1GcGB
	epPTl64EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6MPK-0006SC-0x; Sun, 31 Jan 2021 23:45:30 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6MPG-0006RE-Su
 for linux-mediatek@lists.infradead.org; Sun, 31 Jan 2021 23:45:28 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id E2F87455893;
 Mon,  1 Feb 2021 01:45:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1612136725; bh=ziNv5yTQEvgB8g+LyxeI2jLANRQPqirJDaJkZ244bEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jkb+Au6QGgbGi/uX3WrJXQjXueoz1/n4WoHitYCS5WbkJ8juZAGvbpf3SxJ9zkFO0
 3xdNtISuxS5WMU45keLc2+gtplfiSQ4aMK8JnuM8ofXYNucq+hRPJzI7NUm/9y5r0K
 fAh7zzW+JiX2Uv4voNKNomANYXUsBgk4L91nAv+Y=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id C40CF455847;
 Mon,  1 Feb 2021 01:45:25 +0200 (EET)
Received: from localhost.localdomain (unknown [165.231.161.4])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 1ABDD1BE00BA;
 Mon,  1 Feb 2021 01:45:25 +0200 (EET)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Subject: [PATCH 3/3] watchdog: mtk_wdt: declare compatibility with mt6577
Date: Mon,  1 Feb 2021 02:44:25 +0300
Message-Id: <20210131234425.9773-4-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210131234425.9773-1-arzamas-16@mail.ee>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6N1mkpY3ejOljFu/QXjfGwcxrjRNQJ6b9qflkAE76Hb7NCeCfEAJVBS0gR8FQAnNog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_184527_074804_C0293F36 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Boris Lysov <arzamas-16@mail.ee>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support binding the mt6577 watchdog from OF.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 0ab3cbcf0d93..a6abb4e12fce 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -334,6 +334,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
+	{ .compatible = "mediatek,mt6577-wdt" },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ /* sentinel */ }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
