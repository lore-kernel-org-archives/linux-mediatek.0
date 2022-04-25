Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139CCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ockLxZIG3mJN5uiemQgMCtgV2+iPGbCNJutyAJaOmTk=; b=omW7Cjiy0Fa1Ao
	bndjwi58LY26u6WLG4H6v+pBEr3drF9Q+fdHk/iPTI+XA1R5FWPpdfM5Tqhz4GQKu55vE5xPcwHaD
	epHCyUaeKcVLGe4PgnrGjbEyVbyGO2pzl0YoBaFMtyEtAHTxDAjIT9YrZgoOrbp72H4GhJnhUjkZO
	ENL77xb+cucplU/56ENJXhBoHAAI+KRh3YsraQVhL5TN0T0R5egfKMOMohm3sXhwnUL53CwSIsugP
	FT8zGgi3mXBpmtO57dHXjRhX5zd754fdnwPHnwPAa3SqVDRh+sQUSdxqevUgnS0TZaxv7fl2aOYXm
	zsGQ5V0m5LRyl3JZN82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizYj-009tAE-Mm; Mon, 25 Apr 2022 14:19:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizYf-009t4W-Ap
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 14:19:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so12594727wma.3
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
 b=2wZ7xxmndjI9NQJiBzvZ+9oMRSULwSsVZpMGKupZt4eoKXKcTrRG9ejghP6/CpyUuf
 J6GPivos0E0L1129DN23cCqKBulz4lsYlAPrpGnZ6FtWBesfKQ3dmZq47aZhBsvw1W0d
 XOBMBfRyII3XmWBbe2KvNrz4IVvlkNYoXEwxqphQoEOgA6OTnO4rTn/yENtnTY1ubKc1
 f6I+t24EcPrzRxmScY8seonziTlLJu+Ax7/kIJh4kvduJFvqVQg+P0tFvxfZBQen24xq
 pDwZgEepmZLygNr3idt9hH87SHj3JDbcc1047POsgs6eSmd/o2pGeWIMpYfT+SKHYHVV
 Cgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZq4fC2Rak5UWYJ3VIIYdWjnbZR2sPVVIaexZnW1q/I=;
 b=A9zKIEaQV+ikf+W5bUhLlO8ziympvK++NdhXmleHDkIXt5t85VPHARuQ9W/BqI0NQC
 J7rKmZwhssEfBPDcEeVAvgDD+ywIW0V1Nx3mypgOODy1ryE8ETf+9Ll8CyxSxSesfxr1
 j5p7k79fqT1Drhlohw8NDcDw702OSq8+7mSmzlcJjGvRItkMQHWK4TOUlUqb0Jnbl49O
 dj/O5Ej5jHrjMtGntagP0J63YOeDmHpvLxGwJzgdrZPAGb4rZwUDsdzrfsEMrhmW2I6e
 O+6tMuYCV0F6PHI1gw/mrY4lxBRl6oJyo2j7AItEWQn24cw9/CesbA2NpmlVKEY5F8sX
 AZWg==
X-Gm-Message-State: AOAM531eeKgZ1XeJ4CbQ6desVfLZf6zpoRxeVUjfldzCvFPzUxANqN3Z
 y6XDygU2GTZ6ZbD7FZmeUy16Zw==
X-Google-Smtp-Source: ABdhPJwTt4DIcem5kvWlreKWpNVp5wVoIc2dUHMFQQOhMqjw6b7upbwNhmMWnsokCbGLHmVbmoRsdQ==
X-Received: by 2002:a05:600c:4f53:b0:392:e99:3002 with SMTP id
 m19-20020a05600c4f5300b003920e993002mr16952741wmq.35.1650896357823; 
 Mon, 25 Apr 2022 07:19:17 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:19:17 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 0/2] Input: mt6779-keypad - fix hw code logic and row/col
 selection
Date: Mon, 25 Apr 2022 16:19:12 +0200
Message-Id: <20220425141914.158959-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_071921_522430_DBFC45CC 
X-CRM114-Status: UNSURE (   8.19  )
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

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Mattijs Korpershoek (2):
  Input: mt6779-keypad - fix hardware code mapping
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)


base-commit: b243018eafeb69bf074ef013c54504632fd161ec
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
