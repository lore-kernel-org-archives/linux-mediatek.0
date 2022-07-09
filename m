Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03D6C43334
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jul 2022 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Mime-Version:Message-Id:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18zwxTMww86cndEzpYub9pnZe0fDkNY6EnCvkW/t9JY=; b=NgxSDrYwJmRoGFryOktueWq1IR
	ZP7ZFg+jNwYY9/E5ZXi15Ir8P2v9rEvj1u8xZAXbEW8mCzRyEzaJ1Skvwsz9PdZ7ubAehFQmu8OXV
	S4knk2kaUcpOtCCeJeIv/uVUlLumRS0qsYCR6Wsvnh+Q/GISubwhjo/D55slI26vM08rYCNQRTWul
	0Pqe447m3/5F4RuYo6g4zz9jbikGbGFsCEyfRVQ35vAB1Nw09YmCh8SQt+yNXrUmcRUq8Rw9Bedfo
	dCVkqaEt61QMJIzVVjJaHGlCTnbKqAv6rLQU3yF0Qgj6xJCjM4VEUCQ5/Ckyx+KZR3K6Fjd1vEYNP
	4PuIfr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9y8Y-006RZ1-D3; Sat, 09 Jul 2022 00:15:54 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9y8N-006RWM-S3
	for linux-mediatek@lists.infradead.org; Sat, 09 Jul 2022 00:15:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-31cac89d87cso2333907b3.18
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Jul 2022 17:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=18zwxTMww86cndEzpYub9pnZe0fDkNY6EnCvkW/t9JY=;
        b=msxqFvaOZSoAWLO402a9iXoMeeEmvOcEg5VOhX+o22iSw24U+MJ7v5aJbXYhjOXEcs
         80KPM4xIH89KOQGhECF+FEZEs0ZImyjKLbt6Mjaj7LDHuEIKn4GysLo5nD9ujirYiRc4
         IgHy2nx/83FOn6x/5OM7PPbJlxmw2aA847iuBYirfRbTGllNigutmESrvh5uJ09m2Mkv
         l1GzyelrnzqNCsFX/zFW/lxNYJkZrXMfA3eK8aHziKCL6C/UMKfsCZEgFvs42zjW7YkW
         SV0eehnKB7Ka7Mco0HyzgpIJXij9SbnHq6hNPjgtpyS3thEq/3GvRWmlVHpnOUQJW1kd
         gVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=18zwxTMww86cndEzpYub9pnZe0fDkNY6EnCvkW/t9JY=;
        b=rJHyDLxZlWmEwOr65/QXKUeA+csJKvQwIXFyOs/qwnBKVvCyp2/KUxYgEIteFuU677
         LpVa1HCwied909e7mG9QIiZ23dvnmZcY7HcC4Vj2AXqCwy306PqD/hgyfYYL3efJlyyj
         UzcMDuTE1QWbcVtcA4p2z1t1BFMwGWIlAWMMLzSyAcZ7zY+Z5J1H3bVyA7Bpl1QokQV2
         j+D1Qg3io74Kxy4tJkn0UJW2FRiyY87aH2JvexOcapqz+ZR2z6WfP8WHDuSv2z66R7mf
         l+I7LZ7NfYW9GcXs9MNFWs6FdzjzUK12oPTiEPsd7FMUHOlfxrH4TCIC0RpczZaRpwJc
         d8vg==
X-Gm-Message-State: AJIora/K/lMpj/bs8lUVPIXQhK0UpmwbxMV/pxXtrysoeMY0aLEwyP9E
	4dCmbnLXuB4QthFdCtcGFoC8NK31dfC7vKAmew==
X-Google-Smtp-Source: AGRyM1sfR9BLCzjhQ7iB9/w8T0nTXqnCY8GM70POd4QwcuIQdsEQRKXzL/APCV3KaFIEOVcpID4t0hTXIVbShLssFQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a25:907:0:b0:66e:3f14:c463 with SMTP
 id 7-20020a250907000000b0066e3f14c463mr6447554ybj.243.1657325741218; Fri, 08
 Jul 2022 17:15:41 -0700 (PDT)
Date: Fri,  8 Jul 2022 17:15:27 -0700
Message-Id: <20220709001527.618593-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] mediatek: mt76: eeprom: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_171543_912800_12930794 
X-CRM114-Status: GOOD (  10.69  )
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

When building with Clang we encounter the following warning:
| drivers/net/wireless/mediatek/mt7601u/eeprom.c:193:5: error: format
| specifies type 'char' but the argument has type 'int' [-Werror,-Wformat]
| chan_bounds[idx].start + chan_bounds[idx].num - 1);

Variadic functions (printf-like) undergo default argument promotion.
Documentation/core-api/printk-formats.rst specifically recommends using
the promoted-to-type's format flag.

Moreover, C11 6.3.1.1 states:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
can represent all values of the original type ..., the value is
converted to an int; otherwise, it is converted to an unsigned int.
These are called the integer promotions.`

With this information in hand, we really should stop using `%hh[dxu]` or
`%h[dxu]` as they usually prompt Clang -Wformat warnings as well as go
against documented standard recommendations.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: produced warning with x86 allyesconfig.

 drivers/net/wireless/mediatek/mt7601u/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/eeprom.c b/drivers/net/wireless/mediatek/mt7601u/eeprom.c
index aa3b64902cf9..625bebe60538 100644
--- a/drivers/net/wireless/mediatek/mt7601u/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt7601u/eeprom.c
@@ -188,7 +188,7 @@ mt7601u_set_country_reg(struct mt7601u_dev *dev, u8 *eeprom)
 
 	if (idx != -1)
 		dev_info(dev->dev,
-			 "EEPROM country region %02hhx (channels %hhd-%hhd)\n",
+			 "EEPROM country region %02x (channels %d-%d)\n",
 			 val, chan_bounds[idx].start,
 			 chan_bounds[idx].start + chan_bounds[idx].num - 1);
 	else
-- 
2.37.0.rc0.161.g10f37bed90-goog


