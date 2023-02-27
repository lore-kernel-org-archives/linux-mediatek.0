Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C4C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFdbUl+sYIQgnR7y3RfQ5RiA+9IP39LqLOl/aV9q3zI=; b=q9JT7ezVSzqSSOOkxmrqDNufVH
	pb6FGMVmtgQFypWeTQujRB/li0aktk39bCKLvVdKNPGf5fCFYRISfCHUcrhpLpB/UF5Iv4yiyF8i1
	8rBhhZRsZ5UnMzdPpB+KEVVbmc98Ng6YyhqxQKV9NaHxGrimlAyMQjXF75NJeqOIOEW9Ach84ZO6O
	WUcPlt2U/3RYNpqjlCOzqpNKgEkB2bph1Zdj7fmI3WoALcRuFoUKeJhM9GjfaUtaQpAkfA8mtZFX1
	eGNfw8md+y8YByDqMJL5n/wvRZVInnutGD9bprtGzy1QYEPCALqB6IxOBHNsfoaMC3dnRwdltIdGF
	DY4pvfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdw4-009req-8P; Mon, 27 Feb 2023 13:53:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdvu-009rbZ-Pe; Mon, 27 Feb 2023 13:52:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z2so6722259plf.12;
        Mon, 27 Feb 2023 05:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFdbUl+sYIQgnR7y3RfQ5RiA+9IP39LqLOl/aV9q3zI=;
        b=EFzKKKAkCXggSiJtbusq0EjhbQls/15WMHchEJtsAXtQZv6S8jM2EOzCvxSZmKedLF
         9hC0a2bQRNjcJqTHaJeXS0oRaKpyYPli6Q77Da5dc9MUuLHsaJspvEaJu8Yr9Pfx2GdS
         5Pwwun7dsIiw1dAGpVat1fo4n6mqs8KGujVGZewSP7A0im+2h807SiaEdGJckMwiZreN
         egy5h+84pB0n5uIiPYRxSl+BMJxHDP91ClundBtQQVnNnbZKK+JTw9KqE+DCROPMRlbR
         iF8cQcgq4cO058Y0Jf/12U58OPFTY0V/koRyabAgOuNmTjX4EZf/zOQ81EdJSMLx+Vzn
         wHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFdbUl+sYIQgnR7y3RfQ5RiA+9IP39LqLOl/aV9q3zI=;
        b=RSnxdPiRdLvL0EMWF/8PAzlkYVIU7z25TCnpH5ud86V3i7r8E1AROsmAdNu6Iq2Mj1
         ETxazDhFjgIbffaqpwIhGlqpvb9Rs9zAZAUdBLkRTFrJ/gnbF/h3/Lp+aGB7xAobs4GY
         MX3CG06CauSTv1D6HRXhfyJRBo+Q5kD0OgcKcbfuaI5EIUHHkTAup6epkP1knCWxQ5gC
         edi5Rkt6z6jMqw3r5QCL1PZGYvncJQWsYsV3vAvT8EMWcBYYlR/Bga8HaJ+h4TrFsRab
         Rqdq1tsGLE+ukazepE4TG5Of+vmiWJhhUJUzt/vLY7NxejHij3hOyDa60x1PzrFQIoTU
         o2cw==
X-Gm-Message-State: AO0yUKXJgeg62LJzsehmXXWS8xO6bBl+A6RUmoNOpA7FgpT9RbPD9N45
	dxTrkHo/CHD/w3I06ObOhh8=
X-Google-Smtp-Source: AK7set83IcOdxqMc3dSgY9xvLVXeXFCRBH+C6k4sHnlfwetrp7xrZQdP+3UsQYEDeXn1Sor/ZC4lEg==
X-Received: by 2002:a17:90b:3148:b0:237:c5cc:15bf with SMTP id ip8-20020a17090b314800b00237c5cc15bfmr8389013pjb.13.1677505968711;
        Mon, 27 Feb 2023 05:52:48 -0800 (PST)
Received: from localhost.localdomain ([103.116.245.58])
        by smtp.gmail.com with ESMTPSA id j191-20020a6380c8000000b004fb681ea0e1sm4115425pgd.84.2023.02.27.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:52:48 -0800 (PST)
From: void0red <void0red@gmail.com>
To: lorenzo.bianconi@redhat.com
Cc: angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	void0red@gmail.com
Subject: [PATCH v2] wifi: mt76: add a check of vzalloc in mt7615_coredump_work
Date: Mon, 27 Feb 2023 21:52:41 +0800
Message-Id: <20230227135241.947052-1-void0red@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <Y/yxGMvBbMGiehC6@lore-desk>
References: <Y/yxGMvBbMGiehC6@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_055250_854175_A2C7BED9 
X-CRM114-Status: UNSURE (   9.15  )
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

From: Kang Chen <void0red@gmail.com>

vzalloc may fails, dump might be null and will cause
illegal address access later.

Fixes: d2bf7959d9c0 ("mt76: mt7663: introduce coredump support")
Signed-off-by: Kang Chen <void0red@gmail.com>
---
v2 -> v1: add Fixes tag

 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index a95602473..73d84c301 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2367,6 +2367,9 @@ void mt7615_coredump_work(struct work_struct *work)
 	}
 
 	dump = vzalloc(MT76_CONNAC_COREDUMP_SZ);
+	if (!dump)
+		return;
+
 	data = dump;
 
 	while (true) {
-- 
2.34.1


