Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04019C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CDC36112F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CDC36112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XIBBXGe6Xtn3VAgib4HR0BYWDUhDXP68C6RH+dHdnB8=; b=hGLCPNGrByOgsqOg020F5w2Y0
	qHu/njd/iYAsDFU0PdA8UqS1JFNH2IEVowg+eOeohMvypJlBn0PF3YRlf6ZccOA5jIN5Fe5dpJaCD
	Jr4J+tFCwX4S7qCoVmyZ8WstSDr8+4cR39uIG0SM20DGyzon4zoKL96rjMVRSpTIST4ob58rz1gKR
	qtxe3MUqbJmb/zqFG/gdWaU/IL3yEEb/IAAezea+jxIsrzQtteKDL4yyZjLFRs0wpqFeOgcm8vIIW
	pKZfvP5DcvOf575/spL37Gj+ItEgX8/vHNvgvS+X6gOkU+P5K9g6dZ067aGIi9eKkeWRy4Uu5uUwf
	DKNGEaq/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leaWS-003qTM-GK; Thu, 06 May 2021 09:42:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVe-003qKk-K4
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 09:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WGLMaIjJ/59GAV1ofZhUU7K8F2hooQOdMuE41Fq9fiw=; b=Qj/Mwrcjc3B3BU03wrZUVu1bcX
 cWrZshkgKMAdqJ17E/Yz7vp7cWkgkEAlY14QWzuOBkeK/OKN4YWL0PDIm8U32khh0qfkwesiRG6jC
 VgwLbeY6DOSXRcPJdo5AH4QB8h2VzqGY55nRpfQ9jGIPg8HGNnc8iUFyrPD7xaRs9E8ENSCsfGYXr
 GySuX917w9t8EUF3UeXx7dSJ0RKBVWyTPnfbJ8THeGvt5Fke7Ur22VebDX1CHbTbLv1xmTZ5GL9rz
 Ymh7mbSY/Lw7gTHStTdZF4PdffkmPup1/Q+yjrn/Pr1C14R5Bh1XX6T20rwoGEERq5TfvmuF44BRT
 u82ZEkIA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVc-005uym-6N
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 09:41:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t18so4880245wry.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGLMaIjJ/59GAV1ofZhUU7K8F2hooQOdMuE41Fq9fiw=;
 b=RkMnsD6KvMi6ZHCsPL8Dnl+4tGuWsXTN0tNVSraD1ZobCZPyShwIr47yrOkmMSQ1YE
 Dbw4UZHC5UpyoSn/gIIW1Ah18Rj9PgOMgz3EcHWBiEuVkdEpttBAnDiMoUtgv5XBIMLQ
 GMvKu7m3Z2D2J5OnzQd4sraDUcwPY83/P/UxzsGnowrwefRRd71b2s7c6YyPqM17BPlL
 JwE7IZI5WMOy+CcJE6XsolcQwzhQOt0DyQqkhxg5WUiYQ4xZwBmxrcsbi7OUhdx14BLe
 DZUW4sxnIOOFW2HnydnhO6RCGjz8Qr6z1ZclNx0bdPzpwnKNhgtgIoEKGqz7vAJ38iSC
 sqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGLMaIjJ/59GAV1ofZhUU7K8F2hooQOdMuE41Fq9fiw=;
 b=gkfLZQAdGs3OJ1ggFInOS/2nlqs3/btaDr0QOjr7DDk8WMW43X4q3EBqnI4qmT28MZ
 HDH7cT6Eb/SVRbC/roahh5LO7YxNm509yWB0hxlvbOdHwnlWvFWZuXqlR8qWfaVWq7WS
 D2q9zBJ/VkTdHe2J3zUctET6VON/JF6jHK8u06GNj6JQd6bo0WtpJCtWtsSXk0BIBtwj
 6hOWV53MsPEYu1/ctEmAJhyuDUbqXz03Z2sutPxgsmRxPrHyzdVexZrtrR9dPaEr45/Z
 AE7WUy8VSKD8Yf6pSdRSMy9X8PtiZ5tIFBVkbhy9r3jjqESqUJAm6ddZw00Wo5m+xNPC
 9gcQ==
X-Gm-Message-State: AOAM533z57Up78God+p07PTqVtRr9gpsNHqV317G3WPFnbig/60f+vxW
 5i40j0EZB5yPhJAbQSnV4HTcOw==
X-Google-Smtp-Source: ABdhPJwfEmWX/6FYzIU3H4cSjuIgImGG9IfqUxLnFTDYk1RcDZyq0ZieLpUOw1Km6YShmQ444UtqXg==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3802633wrr.324.1620294086330; 
 Thu, 06 May 2021 02:41:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:2492:c5b6:6c3f:6de4])
 by smtp.gmail.com with ESMTPSA id y14sm3360421wrs.64.2021.05.06.02.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:41:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 2/3] mfd: mt6397: keys: use named IRQs instead of index
Date: Thu,  6 May 2021 11:41:14 +0200
Message-Id: <20210506094116.638527-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506094116.638527-1-mkorpershoek@baylibre.com>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_024128_246431_194DC987 
X-CRM114-Status: GOOD (  11.08  )
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

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Note: The keys_resources are not part of the device-tree bindings so
this won't break any DT schemas.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index a83fbc486d26..5818e0c328c9 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -46,13 +46,13 @@ static const struct resource mt6397_rtc_resources[] = {
 };
 
 static const struct resource mt6323_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_PWRKEY),
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
 };
 
 static const struct resource mt6397_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
-	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
 };
 
 static const struct resource mt6323_pwrc_resources[] = {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
