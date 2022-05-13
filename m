Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD613C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lyWzApTWwqKkcyefS27YvH2Ths3YP9+OOzpB7B7t3Ak=; b=ww6PQqll45cfv0
	EAl/HB6SDn3lxhuGUyTKQ0D2ARWeNL8GteoWvyI2ry8j4xNmaE/981XJQmKu54FBzYUouoXB1q3lA
	E194slo4OLEev+aOZuyu1tcZlEIxWnjB6WjO1fpcnZA01ejLT7n/o5MqwF7q+FVJpNU9n3yODtYPS
	CLqNYnHAwFrDRO1IkhQZrrzOLyJFmMtGUyj/k89G73vKdyTvYQ3UqTLrcyZRbLwGvkuyRZfMwbEeY
	pa9i5L24uzGucS/evnXJ9SPnEyG7y92L6unLTdCemkpTwReWju65v+hm5+AfWYxXZxW51qMqYOilE
	EcFYXoO0eYjpXgCpYsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npX5l-00Gdl9-ML; Fri, 13 May 2022 15:20:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npX5j-00GdjN-6i
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 15:20:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id w4so11845345wrg.12
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
 b=Dz/TgheE2kSeXBPeznCYl+5Ffu99oqRAdGfjpKNzMd2xb5x3Eyfp257Vb01Av0iTJD
 SA8xNL4ghJZod04teSU8QYNC12/sQ0h08m6/HG9I6sJr8soW/ngrRjiaIgW7ApLvPtWu
 dDbH92Y16pL02ChfwxiY1iEZkcTXjYhvvphtwX+TtagLcctGLCU3v+Tlu8R3gTnxEeWQ
 LK950UHURpgod8cncO1kRtDZSq0Vv2TBE8SLI0njm3MVK16/uplc2Wfe8NwZ7Ibw4iZC
 7VRDtL642U3ybvcJ1hNXkuQy2L24VpipJj+DsC7cZ5uLlUu6uJDFGdsNiGd90ZYzp2qA
 5zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
 b=eecTn3roBFKtZ1ErQspUqt4flazhitZVA8NwnP2JT2Kf2LGl7CMvw0vfs3B7zMFZ3V
 UEYfconf0apNXU66GvuMgicFbJK4JGN9H6JxneK1arJ7gHBV+Boh90ykJdkSmF4aXmtf
 UcGn1LrOwBHQcw7DBSln6pmNbi25fLO8O8eAd1JA2n5X0abhA3QKVDfgL4MxVaDiZs8p
 r3NWI17aOt9kpRASZa6gpMVNgfDfpmqQv2MOSACSDzIEAtUc8CfSjcYvN2hoUjrKBbLm
 Tl92m4vCg51SN8hgjNIfhHB7sDqJ0UeEqUpzyQIve7edB/1Y5KoQD7UmXlHtmqtA/QRi
 6/HQ==
X-Gm-Message-State: AOAM532lOc5xxWjIrW1reTQnR5Wutj3tnQTxmvXftAOTPNxcaM4wT/D8
 gyxuZdamqqs6vvwxplPEbudaFw==
X-Google-Smtp-Source: ABdhPJxSz+4rACuf5SGMLZwOR56WI1iH59s/y3Xd/FVT14T2LZZfcFpcOvY4/3XaobZvZCLYVZfoxA==
X-Received: by 2002:a05:6000:15ce:b0:20c:57e0:60a0 with SMTP id
 y14-20020a05600015ce00b0020c57e060a0mr4701358wry.656.1652455229899; 
 Fri, 13 May 2022 08:20:29 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
 by smtp.gmail.com with ESMTPSA id
 l9-20020adfc789000000b0020cd8f1d25csm2590612wrg.8.2022.05.13.08.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:20:29 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH] MAINTAINERS: input: add mattijs for mt6779-keypad
Date: Fri, 13 May 2022 17:20:25 +0200
Message-Id: <20220513152025.2803478-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_082031_286266_DAEAE3B5 
X-CRM114-Status: UNSURE (   9.32  )
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

As stated in [1]:
Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Add a dedicated maintainer entry as well for the driver to make sure
that I can help with patch reviews.

[1] https://lore.kernel.org/r/20220421140255.2781505-1-mkorpershoek@baylibre.com
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5936f2d9d8ed..d092414ae7be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12139,6 +12139,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
 F:	drivers/media/platform/mtk-jpeg/
 
+MEDIATEK KEYPAD DRIVER
+M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+F:	drivers/input/keyboard/mt6779-keypad.c
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
