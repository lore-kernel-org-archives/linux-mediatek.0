Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81446CD98E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=; b=AJk17z7DFDED0nRd5nolJxI5jq
	46qGIi/iYcGfXRqppkZsVXjF1nbztFB/AAuOb3AeV7QbJFz5pVc3X+D2luvIYA8CtVrBLOgNQxwGw
	K+SVIyhbXtE8InRRMH4Vdibmnus/Xpcj8c6oXBqsrdl29Sw8EADnX1Kxyi1wZiQ5A2JmshCDoCHKl
	sByO1krvhCYAFQt08Y7bNWGZrybMaVOYcQPfJRJKJ+iEor0TC3eHvX2yJsUSjxISYnO/TmV1XXQUA
	0LUwzF8proUcSiivCpnUgV7CWQlvH5Ej1lNi7vN0ErqtN2jbYchVr+38i5Zd3v59nPO8Ukfte+A4U
	Zcw8GlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQkN-0000000FZnc-2AxE;
	Tue, 16 Jun 2026 10:10:19 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQkK-0000000FZmJ-0XbN
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 10:10:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-842319576d5so2170090b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604615; x=1782209415; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=;
        b=b0orjZVRQcki2Yo8cd79rV2BBuW9bqmx/SN26QitDb5j7rXpwAFdiQt0ESFyL0P65n
         o101bn7wpbBLKamFDa1uajMCqPRAq3e05ZUiZ8KnFGj88H3qnQEmwoiz0DwZmxEZfWp/
         glyZRzN/At8BYUV0dN9ud14rf01PuX0iDlF1MSYthjfZPvimwAM0U6EDj2tkmhKWsxQs
         w5wUYBgboZ7JT84ghxhf4lbGpHwxY9usN6ws2+hRURLqIXhoULtuaTxFr5PaEvkfc5l9
         /JreX1GTpHNqmVlP/ZEkwBUQxbKISM+3HsRGpNA4Rmg4bk/8Res0HmQK8FYISBkBb/IX
         /nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604615; x=1782209415;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=;
        b=iJQSY98HWcYAQHPJCf/OFrIHVqpxve0iMScUHo+sgatSalygTAfGQBo01tZB6BaOKK
         cScK4UYIrrynbv+ql4YBGqga22dRDYseoP3fEVL1Y8EDqRyIb+zPlC56WquW2ulDdbiz
         GSmVkrvK1c87l4UY6eDjZqS3Z7ap8AmhSXT8otOIabCcGB1VGjlXL5fW4fHIlUQCa/82
         5hIYSYbAfVL12+FC7+rbr5z5ibjFgsFraAjYW47pVymon5IFfcdtKA6y0STAL16DufEL
         AblppPBYL1ps8TvZoHKNPjhoHtLHXipXtuRSm33Ia5kX3Vur3Ln6pekcOT2dkNMgxAYt
         w0+g==
X-Forwarded-Encrypted: i=1; AFNElJ8zlxVjDOBcjfDhbWMBq5IqpgxPsc3ybxLd4KhfiFEv6Bw8Fmx/u0x9xmA8O4mWQmsNNaOL0mo4uw7LpJJYOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5iRjMId1nUtImILcFQhhp/iOpmw346F6GGPUwWjwAlsyedI9j
	IyWJkNx1vvQauPAeQNBFPd7A20nbfUMP5/zxnQnoPvJzMm62mO6FHczx
X-Gm-Gg: Acq92OEvM5ud8K0Bure2QjNBGGL6KXnkVBxVwzTmr2ZFgPdBmWrqhrn4ikJFz+k0EXh
	tRmld0qQ/j3wtpwzwy1YZ7ITBzrERqxaTxT74m0wDMpiIEkyK0Zh/TzkIJp94vbeHt9V2KUOKac
	lZ6sIgwN8O3HRB0cPPuD/PqHqUURvr3kGEACrv782WVrSXVF62yP5e8iAV5jWAolmkqFjycuwIu
	E3bPslkbPXOjhoeWO5eOU512bFxGcTr8zaiCStfWcJQtTZy19K9h3zkgkySqeepRA+nwlQUyTph
	FBnDsW8Zh2vCno3PNjLSVsOyB7otaNS4XAKUjYcl1bFwqf/BWLzzLHvLgTGgi6oPFm10a9Wi/HY
	w2/mexuWdZJpS8tFx1ua2qbZmz9CQeR+tkr8uh3bcIDdib08zggBCuBf1efck8ytNYBcHno1LyQ
	G8hbZ2NXEJ4pU7j7av
X-Received: by 2002:a05:6a00:1151:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-84515556183mr2848320b3a.28.1781604615062;
        Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm12396943b3a.24.2026.06.16.03.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:10:14 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: fix foe_check_time allocation size
Date: Tue, 16 Jun 2026 17:49:03 +0800
Message-ID: <178160461057.2154221.15886112443159132305@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_031016_164315_8D8ABEF0 
X-CRM114-Status: UNSURE (   7.61  )
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

foe_check_time is declared as u16 pointer but was allocated with
only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).

When airoha_ppe_foe_verify_entry() is called with hash >= ppe_num_entries/2,
it writes beyond the allocated buffer, causing heap buffer overflow and
potential kernel crash.

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bcc..8fb8ecf909 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1578,7 +1578,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
-	ppe->foe_check_time = devm_kzalloc(eth->dev, ppe_num_entries,
+	ppe->foe_check_time = devm_kzalloc(eth->dev,
+					   ppe_num_entries * sizeof(*ppe->foe_check_time),
 					   GFP_KERNEL);
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
-- 
2.51.0



