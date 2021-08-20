Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADDC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 02:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1467860FC1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 02:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1467860FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CLun/NETd7GmdYGTncUb2t02fFrWOeiiSeJ6tj4r6L4=; b=0pLAgNpf9gNcES
	w/uq7O6RQHg6wBVlRB4cJPooz3nbuAgPcoY4zmjDISGPyFmnrQJAqiK1eDwYAWQ/+a13ChrylOYze
	uZZK+aGs2u5Kz5NrBkRJz3xjY/N7FaaUBNCXcxyuRKO25cUohTFk+dXyOfYvfSLtMCQ69Q0opVFUf
	5Pagq0v9tj5OGIIqg1tkIOOHvO3PF/UPpLUYDpFxvzgW2Idu4Bk2aVX/5c4MIUMW16FmQXbNPGu/D
	jxIAZM7DyvcNOOTAluPQ2tw5lOvJIHCFTm72+5rBXjk+Vg2/heevC7OkrI6nn4g6ZzW3H/3UpUuHb
	sJ+KqWKa8ZBF9J6FGCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGuTf-009vfR-0v; Fri, 20 Aug 2021 02:41:51 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGuTS-009vdY-Ar; Fri, 20 Aug 2021 02:41:39 +0000
Received: by mail-qt1-x832.google.com with SMTP id e3so180418qth.9;
 Thu, 19 Aug 2021 19:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=akxppNyvMUVOj38GQ4Wx+WMqn0jMaFXZloIDjRROmGQ=;
 b=EUWolll8jwQmPwG9g8Rv7x8uSp+vnUXFDAOf6ozcbIKh2cFFzNtKCinnb3CyOQY85Y
 Sj809DrgSN6OF7+XHPwTezdYOs6OwObsEI0Vps2kyjEIlm0lowLGqG8QYn3AwPjwYNSr
 Dnmjz0x5Pi0fvGUyA+/OgLxvEfC1NMC7S3bPtAl4YlEAVsh+/Jaz71Cly/GHSA7MCMD2
 6XB9ZAA8fDqw92qV0m3Pp9+8OrAY1FALXPm6YauSLVXY798JJXHD8pTX1byGrkcFrz0h
 eGLQFVqknP1/yDd+Pj0ayWI28z1WqkhM8SZcTNyGrDRisHLWmCy2ZYsoTKVmCiSTs6js
 pE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=akxppNyvMUVOj38GQ4Wx+WMqn0jMaFXZloIDjRROmGQ=;
 b=Tok8tr26MdHahWwyQURMjbqtlB7d5A/EYrk6toM3LGyLg6EYqTjI8qnBckNsKPqMJo
 5MieUU2j7XTohGdTLp31D0t3CsZ+B4LMK/fvY0aRx3zl06xR8iItW6ol2/84ANG/ibUy
 CVZCo1ozWDGApXw8JcswFUG/f4dS2DnwRl7CD5oEZsftJc+dlk1VWTzvKinEXjq+A1/s
 qThXL6OzUBvYQc1UqUiqjiiah40GbS88ywgMUx5qHU9LGWLjd+FfHgqLCmKELjrhZg2B
 N9dKreaoCnliKjYJqo8ijpqW6572z0tdPOR7nIXbABJ5YKchl+nWgo03IeyE+GWQTJVB
 QX5g==
X-Gm-Message-State: AOAM532PVsI2ySfHoIXim2dfl/2PyiAEm5qGMZqaPqAoeCMu1PndKy5H
 SfRPo2fRaBoydhprnDE0W/4=
X-Google-Smtp-Source: ABdhPJw55p0SderdnAvRWE7UB9+ez6UViRUo1ZKxTA36IVrUYYRcwg3vnE6JRTkGM9yP8EmG3j0Rrg==
X-Received: by 2002:ac8:7155:: with SMTP id h21mr15656644qtp.231.1629427296579; 
 Thu, 19 Aug 2021 19:41:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j127sm2500131qkf.20.2021.08.19.19.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:41:36 -0700 (PDT)
From: jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 jing yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] net:wireless:mt76: fix boolreturn.cocci warnings
Date: Thu, 19 Aug 2021 19:41:17 -0700
Message-Id: <20210820024117.11688-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_194138_433650_21B0C2F0 
X-CRM114-Status: GOOD (  11.14  )
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

./drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:172:8-9:WARNING:
return of 0/1 in function 'mt7663_usb_sdio_tx_status_data' with return
type bool

Return statements in functions returning bool should use true/false
instead of 1/0.

Generated by: scripts/coccinelle/misc/boolreturn.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
index 996d48c..bd2939e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
@@ -169,7 +169,7 @@ bool mt7663_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update)
 	mt7615_mac_sta_poll(dev);
 	mt7615_mutex_release(dev);
 
-	return 0;
+	return false;
 }
 EXPORT_SYMBOL_GPL(mt7663_usb_sdio_tx_status_data);
 
-- 
1.8.3.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
