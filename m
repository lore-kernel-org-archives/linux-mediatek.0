Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C004CC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aeLpY9djXSpdgH4Ae7n5MB3zE0D3lzBJjJWuWYn4B9M=; b=A6yT7fZB3FBSch0uJp5bdD3diR
	rD+58mWeBQUuYsZ+8J+2x/2oyx/RTD01RVQM2nT/1CNC/ZcXta2mv67nKGEg4TZEAM2LmHHzIEQ3M
	jIDIAhR3vg5ZPEMrfO7r4cn80OOsNkPF4r1qw0cZ9CT2YIhW4EMbM7IsKilOavt95XbZxY2kgCRBX
	5cprBqYX46dQb/r9fcHv5ccFh/+4aIvL2PzsD+MhlMGPSVxveyblO9o0Di+o7U7onoPULBSkkPtX/
	ydCvlYndNVWXrzJDduse9HD5oL1efyYXbq5d96CKLyD22J0kp3SkfK0BTTtXb/emHUaecqulLctJ3
	JYR9jkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNUP-005F5z-0A;
	Tue, 05 Sep 2023 04:16:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNUM-005F5T-1h;
	Tue, 05 Sep 2023 04:16:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-26d5970cd28so1103258a91.2;
        Mon, 04 Sep 2023 21:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693887388; x=1694492188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeLpY9djXSpdgH4Ae7n5MB3zE0D3lzBJjJWuWYn4B9M=;
        b=nCCGEUCIQah4wgPS7v3XARnKmp1vTtxNjaOygzUpvy5XcLmT04oK6IOGmBQ8T1H94v
         7Il3l0cKg4gTQJ4MN1WCC3fol75AjexuPmciJZ006c+OssAzRL4/QQmv8Kpb+1udNg3Y
         Jz335UWBgD2rPlmvnt79WFw//bQF2oKkmY080VWjjLH+iRP2IRv+6EoqujOT8QwX+/JT
         XLH15qosHAIrDrDPk2+PMqvoDy3MRiaKDcMINQkyVFHvbWilxhMoQci5S+Jjro915tiX
         XqL50b4Thgbrfl307RULPRcw+Q3bwjBayM5Oejsk7t8DrnKPabnJwytQ8PhdITww+G8R
         Qp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693887388; x=1694492188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeLpY9djXSpdgH4Ae7n5MB3zE0D3lzBJjJWuWYn4B9M=;
        b=PV0BHMWu+8qdR1vXtADre1eIDLQBOWeBVsn99Ti9FnAlb9sGjRXH7VB8mONr2wSdtp
         8ODU4Ygj+llDqmPvpPvHcVlMwrWe6piYbjSGdsTIlef15+16McwTTwPocN1U7nQKkxax
         e+T9QDbreGgY5aX3D5Bea/U97a6s06V35Z97bs5WBvCSzD11Kc49DMOEdLe3mK3R+ezz
         tH2VVWzWzPazePvFvMDc00vbYyodK5WouPC6h3GgNs399tiyL3A8ypoAkFI4v2Ak5RNF
         4QbJduPJ3vZx9g3qfjJ6tZn2SP2JhfJf6b7TwgGy1EqH1CA8cMMWYLqfrJnykZNa8iB2
         uNFg==
X-Gm-Message-State: AOJu0YwA2MUZqSpW4os6e8D7rZm5JvbVdHGZ4VMz7z70dHFQIJCj2HqU
	gbYWhV8cmHKtWGmEa8Zcg48=
X-Google-Smtp-Source: AGHT+IGHKwLSesdv+VTDY2ZVcovQ2Vrs0ifGMuVs4J32gJ4Kms/n3HDyIZqhULXtcu+bbYFqI4HShQ==
X-Received: by 2002:a17:90a:788e:b0:26d:20ef:1d32 with SMTP id x14-20020a17090a788e00b0026d20ef1d32mr8899654pjk.38.1693887387618;
        Mon, 04 Sep 2023 21:16:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a40d:5ac2:3458:cc95:7315:1247])
        by smtp.gmail.com with ESMTPSA id oj3-20020a17090b4d8300b002639c4f81cesm9719984pjb.3.2023.09.04.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 21:16:27 -0700 (PDT)
From: Shubh <shubhisroking@gmail.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shubh <shubhisroking@gmail.com>
Subject: [PATCH] net: dsa: mt7530: refactor deprecated strncpy
Date: Tue,  5 Sep 2023 09:46:14 +0530
Message-ID: <20230905041614.14272-1-shubhisroking@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_211630_569941_8FEA880B 
X-CRM114-Status: GOOD (  10.88  )
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

Prefer `strscpy_pad` to `strncpy`.

Signed-off-by: Shubh <shubhisroking@gmail.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 035a34b50..ee19475ec 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -836,7 +836,7 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++)
-		strncpy(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
+		strscpy_pad(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
 			ETH_GSTRING_LEN);
 }
 
-- 
2.42.0


