Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F4BCA9EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 22:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9259B21479
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 22:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXwDWsMQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8t/xfrU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9259B21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tX74UNl9IE0LhYEHyHI0jlzAaVAA5o0kYwxHB3u/Z1Q=; b=RXw
	DWsMQDTUMBU9DUvz6kqL/OX7cD6YhImnLvnex5jP/dijuz1AuLynQd/TAc7gyrXCeIcv0LlZkPrdt
	C0WjnyLkPVLO1ZwIo0ttVEeng63uXHPiVoy8ot5tNHATitaooNdNKDvT53n7KisvqohBb1SWD1vAG
	B9fYg9f+adrQ4ilPukFXO59SictIzsfYKYg4Q+VdEn3kxphA124LVxicAtWJo+z16lJhj1TBnC5fg
	rz3N5+UUYgWegdVyl1Htz5uGx3S1/7iynIFJagDriiTEUaICbQKj66derLumYYNBUVHXPH3ksysgK
	yRuWMcf8i19GsecpSrfcWfUtlLz/iwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPDpU-0005ta-EC; Mon, 28 Oct 2019 22:49:40 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPDpK-0005kA-8r; Mon, 28 Oct 2019 22:49:31 +0000
Received: by mail-pl1-x642.google.com with SMTP id t10so6455770plr.8;
 Mon, 28 Oct 2019 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/WZEAomVjJ+725DnvAAAnSxsbckEzTmInFHoxAcfrVY=;
 b=K8t/xfrUvO54cAT/K46akV/qEnLzS1/uU1SOkpoor14ttRwVYVkbpqoCY5VMK2fNbm
 fLMCv1GpohL5N99sSwz2m9BFR4OMmrhNGzqngucJyfv3KivEQnBBcbsKxtFirSMedw94
 RO/Q8sQN9KQCI0+BEWRQ92EZ7c16k4AS4hxkOPsqg5Yj3IABTTP+HYi+zR8TYVHuSuvz
 NVxJjGctiHx/EsFpxF338Y7LWtbWIcPmX7IwxPtVZBWApBsiJhDWpo2DNZ3PnDVPVEYP
 Ao8h+M0AsX0dyvTE2U3btXDFFGPBg95M55CK2iU+BUAMClOUHAMLI6Gk+46HaRWqiiLF
 ALzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/WZEAomVjJ+725DnvAAAnSxsbckEzTmInFHoxAcfrVY=;
 b=qhFU47bQucZ04JA0XEb1VJsBIDIlAK2Gz5Zs48GezOxqbHdh6FqPyhZH9jck7mL9Im
 qsyEgYfkKsnvVdjY2qAlufVigHD2bkIAjjPaXjzD7iCqTKOSLCppOfJfuLHHh85fB0NK
 jLv4F8PivHFP1SvszBBtg1/n2ITgXWx7WzeZGI158VDnpSrTTg1liE/s1DghFuTfVMh1
 1E9CDDZBo1pUQQ4ctL74CRRDUxMiRepCfHBJyrR88NAhTPMdM8QKiQmOLHPQYnaDjWfv
 06QElmQZ42nvhZTxfZGaM8F1R4pLFwnzk06IXKlj1r26TwqhnPXkhq5ouqmI4uAmYG+q
 TRnQ==
X-Gm-Message-State: APjAAAVpPBR/VthAYEUsyC4bMPpCx2S/Pl1yA0PMZtNIv+59iin+0eJ/
 63MExyi8oeSL8dtNTU0iCwY=
X-Google-Smtp-Source: APXvYqxvD/GJ2WH7xzUvuVqaFgUWlHwU3zy1adKIbAVvZLCucTrhXqRqBQTAZu58dPq3TSZFuaAi/Q==
X-Received: by 2002:a17:902:8345:: with SMTP id
 z5mr492355pln.113.1572302966574; 
 Mon, 28 Oct 2019 15:49:26 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:78fe])
 by smtp.gmail.com with ESMTPSA id y129sm13092345pgb.28.2019.10.28.15.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 15:49:25 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
Date: Mon, 28 Oct 2019 15:49:09 -0700
Message-Id: <20191028224909.1069-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_154930_314557_24252FF5 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: Tao Ren <rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tao Ren <rentao.bupt@gmail.com>

Increase the max number of GPIOs from default 512 to 1024 for ASPEED
platforms, because Facebook Yamp (AST2500) BMC platform has total 594
GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b7dbeb652cb1..57504f3365c7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1359,7 +1359,7 @@ config ARCH_NR_GPIO
 	int
 	default 2048 if ARCH_SOCFPGA
 	default 1024 if ARCH_BRCMSTB || ARCH_RENESAS || ARCH_TEGRA || \
-		ARCH_ZYNQ
+		ARCH_ZYNQ || ARCH_ASPEED
 	default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
 		SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
 	default 416 if ARCH_SUNXI
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
