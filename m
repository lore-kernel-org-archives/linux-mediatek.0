Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4931C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljCyC7U0qPjAmj58JMjXm7YRxm8mySo00m5eEY/sQGI=; b=m3wGDTW/XyMhQv
	SrWjmhKJP0NVXGRXP6vqisL/WPEbbI7b/3eb1+WFzCtwW9vq4gdd+jiL61FGy89q8RR7Q0TW2qjqX
	Vym66zqRWS2hjvUuj7MG2h1x4adfIrYxUY8lsFcoNnqZXhzkN99wwCgqkLqUG2WQ+pnLliguNv8RK
	0dT9stUvXC6DECe5q9vl0+66n8LrFewobY713QelW+bG3k/5zOd2kp6YISVXdc+dC8XZupHh0O/ij
	guJUp+acnvKWLCjMYzaVY+BKpb2OGaTfUQYQiSHSNLD/E2XXpoXfONaZ7BQc2K0lYaVE0BzLW+K68
	DeO3V6BJLUaMl7gUtP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2n1-00FNJM-2z; Thu, 27 Jan 2022 11:18:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2ko-00FMMp-Bk
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 11:15:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id m14so3861347wrg.12
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Jan 2022 03:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
 b=YAjPQHn2jyReqNUQMXrw1ZayyBkZHfk+LHsA57oh0s+AisAvo0tKWI8P/KBeFkz+j8
 qwMKQlXRNDE6OBbqypYngIp1GgtcbBnRotElRJ9iYemRnoQm4dlNlm7uG/0UqjDwO6k3
 Fc2qEg2YXJz/BZXRKURbGqu4o/fo1jeR7fF/s3TnxSSB/z/xEt4/ypS22ansyQQKHR8P
 Hjre9Mo1g/347I3Z1ReqEE+9v/9opB93MNklB1e/EJR7e7jLtkbxoV12OnSufjBA/f/4
 qElFOVXmgJP01MYw6yZkTnMdLZvba3th0qupQXXF14tvGUehY/jX703yA2xwTNyWPYJp
 De0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KlQywLM4SRqpFvXyB5cSelAzc/97HjHZ8/iIFU/mpmM=;
 b=Cec4CzEXuvrDB+cq7y/AJoIHgOVaF38U7TlZPD8OoaPZMDI5blerbjYIjtVD/8ycGA
 GMagqv03RR92kVQGdGtMq5j+ymZ9wT5ZIlOqTqbC3AAdjQL98J0xwaTLuPVU5phCdSaE
 D/8XbhyhjhqTrSF2+GDDsdA5uq2UicxlSxVDAd7bjGoH5OkcF5XvcwozfcD8oD2lpBzp
 I+BXZQlsnifLXIwKGNcj3vF4MOKT+caZm78t8MLhQXc6xHhTjNrSc6nHn32sFVoBWmMJ
 ll1mJh6kytBVsgiUkZNkOjj/7yz8IIA56TLpYnc/q0wGO+GPse4Va68Eq1+TDAZW5w1L
 OoyA==
X-Gm-Message-State: AOAM531LA85bYpwaGeA+0phxG4zCznGYcpeQSc7Zrw91tUWPVdWgnNzS
 X2etL1gviyiduMlMycj1StjVc8B34olFBg==
X-Google-Smtp-Source: ABdhPJw+JjcilDSvB+7drez4412ivVAsEaAb4cKkUtfLWoOfBwIh3hzJFVfLRydnxEUIl87CwlU9lQ==
X-Received: by 2002:adf:e7cc:: with SMTP id e12mr2582361wrn.637.1643282149126; 
 Thu, 27 Jan 2022 03:15:49 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:7d3d:d638:46ec:78dd])
 by smtp.gmail.com with ESMTPSA id r7sm5956311wma.39.2022.01.27.03.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:15:48 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v20 3/3] arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m
Date: Thu, 27 Jan 2022 12:15:26 +0100
Message-Id: <20220127111526.3716689-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_031550_482650_57EC0E0D 
X-CRM114-Status: UNSURE (   9.29  )
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

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad support in defconfig.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..099a9e68711c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -390,6 +390,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_MT6779=m
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
