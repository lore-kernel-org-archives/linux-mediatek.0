Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46853C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EECE20718
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:09:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+PgVxxz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5m+bIRz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EECE20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L/Y4KaceGWyj9Y3nNhjnM1GXmn9iXnc1SHXvg22C3vg=; b=k+PgVxxzzKAuGn+Bps81n1eVWb
	O1G/Orqto8Y3YejBQ+53wsIiFM5f5Om8D9ZveKr0Oh+RPTzVrr6L0HhgeJq23CaKpGn2A7LS2rhXf
	jvg9KPAwk9C38m9IDWp7bpynlu8xTNTNpql+iAzq27QjrGIVDeR1IwWips3IXUTLxKlXfW1ypFfjg
	ey63h7DxtMalSt7sDRNAwOsRB8nJkpVYnoIWQsrTc7f8/NCMsSzBmWRVOshsati6M4jUPfZBXqWM5
	/af2SmU+9Mfgf7cyXp9DJYPlgTqNWR1xm7swVy+dSWNANITFI9/cZ8SuyQrPS7K1G4lo3P/0djwxK
	StcfYiTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTdo-0003H9-Nt; Sun, 29 Dec 2019 08:09:36 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTac-0000nA-EN; Sun, 29 Dec 2019 08:06:19 +0000
Received: by mail-pj1-x1041.google.com with SMTP id n59so6887737pjb.1;
 Sun, 29 Dec 2019 00:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R0cuAbci5uYQKV5oYgcIjNZXakTJ8cPiZU7xeuhf2xI=;
 b=m5m+bIRzpVxT2lC3WGernvIiSgoiTh4GSzfGJ4cxWeD8TuX4KSVlCIumOBF6bd5SnO
 F4wHJOwzIoL0KT2CyRuHa2Koarb6rxhmzSucn0o/LTP+pT5YIumStQ1D5pz2GvG4hKAX
 ckQ492UoFz+fZxyxH77wyvEXK6h1CI54OszXIz0n3aw/3i26R8MEAjX+nHHkJMWUCnCY
 JQZmgSGX0++STKSwGykPZwgP79ZU3W0BUQ7UoG8pYFLdRMxO6Bcx8E+tnTrRB/G4CPXL
 KV6Ny2RV5QWhE8o64tYrWRDwkiXsESJBpaaUAdOsC1abH/LRtTPP9z2b+v4mJHHS8Znb
 gOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R0cuAbci5uYQKV5oYgcIjNZXakTJ8cPiZU7xeuhf2xI=;
 b=MGlFMirR1I8n2efiVtVkj1Re4QLUCPnJz4GIXGt2SgdRI/1k2eACgS51m4KiEeAPU9
 M1MXMyRRPLuUpUL8qHE08yr2AjtkYShYFNhcIw4B4w8uyZsgBZrV+rehvta4gdDJQPO2
 8+ikJnK7cbIzxowvL2Ze5jSYW3uQNCzxRCmvSSuyIEduxZupTyj6dexbhQFDUxe8SL8A
 6Qf1ldAt9gs3qBauy5x6x95QF6OJn1aaYE5t3roMExCbiijHrsv5MZP14hK46NMAJwMq
 /Oiw9S8pMQE5lytjfLe6pqlmox6b/GLlQESDXzpm2PnNqM5TBQd1TZGtXu+aEoyvi4o4
 43ZA==
X-Gm-Message-State: APjAAAWUEDrMfCUhSFD1Qlhb+Ue8XkK6cHpdZnz7hlmYOxnP/WgOo5Pj
 g87H4kuU5idXbySH9/fJ134=
X-Google-Smtp-Source: APXvYqwBzBTDNYHJ0gM69+2QZwtTswZP7Da88QJfXDtLekK7yHdTvbLHKiFKwKnE1jw315fndAx/QQ==
X-Received: by 2002:a17:902:a58b:: with SMTP id
 az11mr61458821plb.147.1577606777982; 
 Sun, 29 Dec 2019 00:06:17 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id v143sm38690397pfc.71.2019.12.29.00.06.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:17 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 03/32] pwm: rcar: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:41 +0000
Message-Id: <20191229080610.7597-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000618_479722_95B67D02 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pwm/pwm-rcar.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 852eb2347954..7bd67f69db84 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -203,15 +203,13 @@ static const struct pwm_ops rcar_pwm_ops = {
 static int rcar_pwm_probe(struct platform_device *pdev)
 {
 	struct rcar_pwm_chip *rcar_pwm;
-	struct resource *res;
 	int ret;
 
 	rcar_pwm = devm_kzalloc(&pdev->dev, sizeof(*rcar_pwm), GFP_KERNEL);
 	if (rcar_pwm == NULL)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rcar_pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	rcar_pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rcar_pwm->base))
 		return PTR_ERR(rcar_pwm->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
