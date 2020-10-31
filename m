Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7923CC388F9
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 15:31:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD4B22282
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 15:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IzpuUxNY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nj1GEJsh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD4B22282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jceZPUYKzK1TZXxELKlPQilvzpSkGdN+GMOC61W0NN0=; b=IzpuUxNYUOG1PqjHJJKMWZmReL
	H9wwGtiFiXkC9fb9MZOasYa10joaI1y1UpNro5AAvlyuNT5sNQ61qucEHSNq6TlfE6Qt4kDXl58Es
	c82mlNQwtMqUe58IzL03XaZR6iOPSyQSKnJs/o8tbh/ZhpgVff2k25pPkS5wdaGc8nLeOYBl4Ppkk
	+sDFTCLmX6j1Jfr21ot/bXDcHP4Lv6UbMZM2NJ82LDfK3Scskn3fGsbKm5PBxx3/y885xqmFGdhih
	OWNyTmmniEpfILKywQtivi6nNWbMXrnUY8AwDtiZE84mq7AaNLrNAZlFSZw60tWjYC5gG/GNp4cEf
	Ryc6+i2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYsqO-0004GZ-W7; Sat, 31 Oct 2020 15:31:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYsqM-0004Fk-PS
 for linux-mediatek@lists.infradead.org; Sat, 31 Oct 2020 15:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604158260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=BRPS/M3iG4bxBoaR/bG+BCL+obGe/+2vovBN8FRsbKs=;
 b=Nj1GEJshmLEhhN7e0TK9PcocsLN3qVGVDlIA79H+bcZwPJd6gXsHrbW3RdJGwcs80mgzgE
 2D0IODlD5ejTNV29adGfyqa5MhEy9cUnwBwJ7f6oK36RN+bHXDbqlvpII0fp0T6xuirlT5
 8txcv/ZQNM4qVX3c3drWtoznBYvxN/I=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-cYrKDMSsO7mA5Wdxk3wQIQ-1; Sat, 31 Oct 2020 11:30:58 -0400
X-MC-Unique: cYrKDMSsO7mA5Wdxk3wQIQ-1
Received: by mail-oi1-f200.google.com with SMTP id p78so3899218oic.2
 for <linux-mediatek@lists.infradead.org>; Sat, 31 Oct 2020 08:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BRPS/M3iG4bxBoaR/bG+BCL+obGe/+2vovBN8FRsbKs=;
 b=Ist3lrevYN6UfrNg2Os5Ic3aIr7vm8s0pjE+LRiPgTjRhTJ8kvUAg3WVsCPyMOmZTX
 /yE5NWIdw5OuUZlyUoDZuYaxMKXPQLk3GW53WBLWf5v6EfYOJEr4Kbu3PJWcNyZfxjlr
 F1/m2C1Ajgqnt5uQzUmwQN2fJ2PYAhjC6sfXMe29jEtdL/Wryup+lwKF/Hg2m/L6kvJ7
 0u4XWBAKCX9zl2j+QpfXPM1gAZs0abbwAfplEdbCDrwloSqna0lq+pg0/K4iKYJ9RSFT
 35QZvNo3B21ImTloE2wA3dVkjsrJC24X+DB0blSKSyiWz/1Y4zCqFxqffUwzsQbzvHl9
 972g==
X-Gm-Message-State: AOAM5326CiHanBAT8WIPLJG/qjxgYLBrIXJGgYjCXeLKTYNWOjkn0AXq
 jwwIYg4h1Bs5f4tiB2BxdFO0C60b6pFHHUvFrgX0zChJwmkOoVkQDz0uGVE0O3v1912TNVhWA8k
 4SA//BDloc4bGTwS5iWOZk+qVSw+rDyvG
X-Received: by 2002:a05:6830:1254:: with SMTP id
 s20mr5548501otp.314.1604158257553; 
 Sat, 31 Oct 2020 08:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/IyisipqTEuMgkmCrVYr0MlG5l72Ah14nIj7NlV7mbGx+z3QpQCOjzufuvwyWdBRq1Rw7OA==
X-Received: by 2002:a05:6830:1254:: with SMTP id
 s20mr5548483otp.314.1604158257398; 
 Sat, 31 Oct 2020 08:30:57 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id g3sm2227839oif.26.2020.10.31.08.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:30:56 -0700 (PDT)
From: trix@redhat.com
To: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com
Subject: [PATCH] net: dsa: mt7530: remove unneeded semicolon
Date: Sat, 31 Oct 2020 08:30:47 -0700
Message-Id: <20201031153047.2147341-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_113102_873552_DC4E2E35 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index de7692b763d8..771f58f50d61 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -558,7 +558,7 @@ mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 		val |= 0x190000 << RG_COREPLL_SDM_PCW_S;
 		mt7530_write(priv, MT7531_PLLGP_CR0, val);
 		break;
-	};
+	}
 
 	/* Set feedback divide ratio update signal to high */
 	val = mt7530_read(priv, MT7531_PLLGP_CR0);
-- 
2.18.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
