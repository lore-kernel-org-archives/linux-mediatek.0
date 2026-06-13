Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC7ACD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=; b=elQaSamuArJZ6zMfr32YIIUI7G
	S3V4kZE4Np052QIh65q86Y+aT1oJ7D/hkZPulP19Nvtxo7UdGHPG0gbwyDQxnXOyXR1wM66+GXW7E
	erpEJ73jbqUIFzL8fKDCG0U8h3DmH6RZDOAHS6sgWsangM3Sjgf83CHmQELY4RGS3n/tOtuDzw4HX
	G2GusYkJV6PrVxBnoZYYi8NZiEpY4dAMpEP0OV7hLIDMJVEWBia8Em9rzztT/78iP/TQQfoaBRoG1
	U7bjmN7O0Oc2fQqiTJ7GxVe5HBYmn42piCreerwBsQh8xOMXxcXY/DuoqjZqx9MjKKxD8qsZYkokm
	woR2XE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWln-0000000CZdO-4Bzl;
	Sat, 13 Jun 2026 22:24:04 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWlj-0000000CZcd-1kE5
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:24:02 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-137335bc3caso2432460c88.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781389438; x=1781994238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=mGuMzWZWTGGaPkXl6Lushlo/0289/Q7wdBYPUgVI3826x8KbUhBMLz/ohPzjisLFDf
         5LNM2ErPu2mvz23iFbG+WOoLcxSzVLMPqqvC4T0Q8azzqW+DplencRSbZ4qL7sOIU8Ls
         O4/Z8m+8LCxrUqPbxeUUpn3qmM0719hb5dVcUc4YbpHjH2srSxjdPAdJI/nHWZwJb+qB
         bTRNYfQHbXnf9FZUzXCat6EwPqd29BW/famwL2JhxVZdHfGsx+x9fk1pIomcUCR54E7H
         AGAL5s7UIVVEsDBxSNqsQFw9TMSKxh85A+mR6HA6Jjnlf44XZ6135hHHsrWanr6fl57m
         efyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781389438; x=1781994238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=H5pl7ouItAPyShtHcI1rjFOMp/CMwCkYiOt3kILJR+AzDwgQ8lV9gq6cVBXcM8ZGKr
         /bO8SdKBtarmEF2mHQQ3nsh4ycWgohDbBtxLhjgiIKM0v2ZjxlX0LIK2uQLP8Rc/PuHq
         W7wmXHTARe7Dd9wVU6BEvzJgqPtW9Yey25SIE1h3bjspJ/2DylLtKXRJNnVy3ReUJUZy
         S1+oXM5bmo4MUrWIainmlUnvwkeOfAxH4L0L8Sb0fiW/uMkjdw4Oj3k/9qGUYLaU/GKn
         hpvH9XHEAtgM0EJxAMK1T0SIzkdErpybsbFd3DUmeF/HeCmpQA8xO4YdyfgNM0orJH8a
         +giA==
X-Forwarded-Encrypted: i=1; AFNElJ+A4aUDWPeJNzdnrvmGPeDpaGRuD3bYqM8cQOS6wjPhcNxHFf/Q8oDHUQh1lV3b8adTxOa3hppMLxKrfN4lzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP0XhX1uJfV9dwSVGWY57lThis1Vte5hiv3kAi+bgmUkjraGVs
	SA8AozJgvMtd//pttly5RAfBw19AcYKt//zbs7yM0RquQaPYEwiZBdFr
X-Gm-Gg: Acq92OF3Vt9Qqzo9foY1sqvwN2Kq+8XMKGHow+/ZKk/+7YcRE1OsDBNgbnYOiSr39zm
	V1Fje6wV7VKCYF4csv3Q8GmqhLFTdEb0c9oWIrRwq4u/8HsRgPnw/dYsGzu/I8OEPH1LeeGdUoP
	PU7179pFzIFYvD4vYVed4K20+B0rsrloT18aY04uhpm/RqwGysE7nmRX01Ldug2Be7IdmlnJ5mB
	f3wScxPSym2YKJQzfd31esrgn072v/raaP2X5IBiew30NGl8b22lqEIhkhdj2Veg9OQJBwK1PFG
	JevRMUNePuHS6wueHnoWZLO+HomMJFjcTXzDGV/T0+eRywbr4EZTvpsGL/czNxjlpbSSVn1tOE1
	YE1LutbGIinpZUVKXoYz4qY53ai9LrSEdW70QO8QhBG6/AAc8oniEe7Op29+Qnmn54grPnOt06s
	z2SZMID+8aIP4E/G2WJg05ieJafVJcsM3JT90a8RHIVC+MGrw2msrcinN3bUj/U4ml17afkMSCK
	DlMvkTZxLmupB59AsVqrQm/Qi9vhFnSJuFixjxm2GW9dEfI7ZZfil/BAvMLVKHiWbszZ9mDnnQM
	YFEStNa9vFHWRJ1T6w==
X-Received: by 2002:a05:7300:dc88:b0:304:b93a:5107 with SMTP id 5a478bee46e88-3082004ba43mr4735033eec.21.1781389438357;
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm8811701eec.30.2026.06.13.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] [media] mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Sat, 13 Jun 2026 15:23:46 -0700
Message-ID: <20260613222349.102397-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_152359_459377_438213B2 
X-CRM114-Status: GOOD (  10.83  )
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

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


