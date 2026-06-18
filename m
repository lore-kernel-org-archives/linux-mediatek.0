Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DD5CD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 03:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=; b=g5WvW29gAMXEAbpr/ds988k0/q
	un1ylzxIlOlVmBiB7R6/yBwVDUrkYrs5oRLUOl/XDfwp5NNj3Ic07TPJ9qC0g4fLLug+J7yDvqzBp
	gos8eIP++OFaEfPposonM5QmRCdbaEVTnKYE+pfHT8E8vBztvQvruDYc+lxMI8TeOGKuXc0+YbXM+
	VO0YoNbP18A8UpAIrdJSgqu4kaVYBtGRCTjYRkC0ILFthWlR20OxTSPh1opLCUNaEsbQrFkkdwse8
	hgXwbDcSvDBSQVCiEPH1PW+0BQRtShDzuzQWr3kjdpoBqu5aJRUCh+YBlSaUwSF2Y40xCiHTBqSRp
	SHrM3xHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CR-00000000YJW-05Lb;
	Thu, 18 Jun 2026 03:13:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CO-00000000YIJ-2nRv
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 03:13:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84236f9b638so152708b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 20:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781752427; x=1782357227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=;
        b=Au7XKgiMcSmHb2PiI4VQKjsdfOBp0uKydS7sXsZoTkwM3xbRdTCfFVCXqTICiYQy/a
         iUZgJXUC07CPUrRbtqmjgkRVY3YP3kdUbVI9p54eb8HVTUFANFd++SghkXc8N4pHgnAg
         sYltc55ZLvAvPL5VYQW2iNUTWOOOeU0xHMEBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752427; x=1782357227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=;
        b=kD5HZS8tI5VBjXf/COI7YD6jXMNgfRIY3S0S0GVKqT6zUDTSGGh/gVjiPyrfyg34C9
         YXC8HER3RFOHt9FjeJTTscyObzVHLJLh/343NTPfI7CCpYmE3yRO4f6Oq+aKl2tEUj+M
         6pGn/03DlZl1GAHM2pMxRLJkvSk50rlrp4ZFs176QfUTFXHJZhkapgKqMvAO8bySqqtE
         soyxOzkuu33CqO8tD7iBJsw+p3JgOUJ0TGWRQ+YSZTs7rFuz9f7z83wUrR1UwuZUpGrs
         uetjbAY9ji0H5ENx2XeH//VHslUZIYgzH+kxPPZKthyDbP1QSnNT8LYkqn8jTfQZvk27
         rgcw==
X-Forwarded-Encrypted: i=1; AFNElJ/vMQPzEpYobiBfjEngC16CcPNFJS4C5PnrN8KqXk0FN00SX98X0Fxrvnw9947MgJa80L0p3Yy0LyFZxpjU6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM2L9Itf3pklmChNii0jo2v0VDDae5LSWZo5vjD5BHO4kIDROI
	h4kri6FDq3T0IsBEULk/BWHdaHeV7Y7MsX2lNfSbZVzia/04xtACTIWN/H43TnRUjg==
X-Gm-Gg: AfdE7cnJBZSaCSaUoJ/TENkDfUV8sHkceD42ntisSHNXaosex+j65wWyo79QhZrTUZ8
	ycU/3AEZV51NrfmVixGgLrG6gLUrcrxAqQ77DnX+ftYdgBqK08XioV6vxuRiIA39s7m+7m2vUyB
	qrk2H4TnQVOKPrEOp2oSwaiJmZSvQCJ7BaJEyI+TfTm/HpPWa0AJ+hnWGJx5P3XLOnmjyQOboGg
	FR1yjibePse4o6IgccrAKZat4UEZQXM9BaWL0dnnEK2+3ErzlV85eVT5/2TU3DJqHsMGZgo0DHd
	lduBpMXu4yaO+uaNIg3FtbL5W2/QNxN6PRQ56Oa+ljYM4IfcKCVCrXvhHRIsyqpaaJwnC6q1RUu
	Zndjt3cLxE5spKYW2WbPl6l28IZ5HB7PltSUaxHVt3Woig1MtE9EranMb4qmEaXsC+Ku7HGinwg
	Sfh2Amp6LqdlejkDiwYj9vSjqXpfeTnN9R+gug+UPrdnP/R9gszNX+VSK56Jdc/8jZMr28vez08
	G8=
X-Received: by 2002:a05:6a00:84d:b0:842:1ffc:55b5 with SMTP id d2e1a72fcca58-8453b1959a3mr1855321b3a.26.1781752427130;
        Wed, 17 Jun 2026 20:13:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b046911sm17548232b3a.53.2026.06.17.20.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:13:46 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Date: Thu, 18 Jun 2026 12:13:20 +0900
Message-ID: <20260618031338.1011410-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201348_745993_CD0DE77C 
X-CRM114-Status: UNSURE (   6.08  )
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

This fixes several teardown issues:

     INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
     __cancel_work_timer+0x3f4/0x460
     cancel_work_sync+0x1c/0x2c
     btmtksdio_flush+0x2c/0x40
     hci_dev_open_sync+0x10c4/0x2190
     [..]

close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
In addition btmtksdio_txrx_work() re-enables interrupts regardless of
close/flush being executed on another CPU.

v3 -> v4:
- fix commit message linter warnings/errors (tabs, subject line over 80
  chars).

Sergey Senozhatsky (2):
  Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope

 drivers/bluetooth/btmtksdio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

--
2.54.0.1189.g8c84645362-goog


