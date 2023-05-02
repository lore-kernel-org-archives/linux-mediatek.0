Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF10C77B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r72bqexG+rME9xqJaabiEonH/iTgj+QfgYgCEcVdbw=; b=2PhetOEBavDCji
	+f1orP/1oQx0ZbJDqEdmOx9a6TzuJh0qLHRNOBMp4d1JipFXFjr1M9xE9QmSfuh1mE0JKO6fdkqqR
	bdo7OoB5RUo+J01m8Gh7dB0REwaKdPjWOyvFp+jG1NwIyGNoY+oxpeICSIUfC6bfBYFUEY28i/XlJ
	E/Y5YYhem9MRIOOjNVUp1kdsIvQEUH0LFeurrVYnDEshRG/jpiljK77s0dp+DctEv8zGbHEjnOIuv
	0VdpInqJfjBNq9jXSJAhubyFUk0nRjoOQ6WDYuHr4cR8GoFDw28DTJeG/vzUiohaOssJIQBNgtCpH
	l8tk9O3KVWOAH/HOAb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptxGO-002eOr-1J;
	Tue, 02 May 2023 21:10:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptxGK-002eND-1s;
	Tue, 02 May 2023 21:10:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so5578629a12.2;
        Tue, 02 May 2023 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683061814; x=1685653814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r72bqexG+rME9xqJaabiEonH/iTgj+QfgYgCEcVdbw=;
        b=iTmt2cczFrVTgTBlIcDC+ivG4rOlFKXY3C/sYC8MCqxdInz15UUcN8qInwnS9oqEMV
         B5PSiQT27+5zArADX0mvbTB4NSAIblLOQX9cOW2KThSAyShhq4tzLSGS09NEwkrr4HFU
         gLR1lFXfuzfh9eTr0picITSeW3tPlXi1/ZsNMezovvGnSKSkPVz3Am2zA28RSuyKPa9L
         z8LLp4f/dtkk8nwtquS3gC6K4pJCUFna3lwgIm+Dk1ywDyVBDkyySkpk8t1r6Nc5wdMe
         ZlJxctTxGMN1Y3w5301bahtdC65gZuosH2z7u9SjUuu7laDbCPBtTtwo8lcI/SQfUzZ9
         1utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683061814; x=1685653814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r72bqexG+rME9xqJaabiEonH/iTgj+QfgYgCEcVdbw=;
        b=ktjrfsvOjdh+b3+hCCAqR3cNYGRN/pNEeze0nSDIH+AgqQhJQDwzL97MHlee39sqlh
         Y5huk3liQIawHdnw/s8ungwDMLq8ebozRRLyxKnrvAXIRItl4t2Z7d74/8MMbPWioXbj
         0IXskFpesKG8mI6IYB0DDTCVtk6pi/HsuQvhrdFJ19aY6yMSE8wBj45MQmPl6nD2OiOI
         TAcklw879HRrvNQQJely/UPniBklTeVQN8F4qjpXrrJljE/2cgqTTMrzmF8weHroZn/P
         xsKXf2eCTA78DMYI9p+/vWcj0S4fDc1os8Bt69m+j6Lshb7brgQPJ1z34DHy9rvcGbXd
         Kvig==
X-Gm-Message-State: AC+VfDz4d7YF6VxObYjJKdu8ncGOzze8OoMTVaDblMeyG1mLh/PfzDvO
	KOE8QU8kFNHRY64+N0wNXpc=
X-Google-Smtp-Source: ACHHUZ4yvHziWGRT6Cgp5/TQI9ylFHVVk5ToXA3uzoqZOuswJi79HLre8X3Wo3N1vdkK6mynoKBsVA==
X-Received: by 2002:a05:6402:10d7:b0:50b:cc52:3fd3 with SMTP id p23-20020a05640210d700b0050bcc523fd3mr3961480edu.41.1683061814545;
        Tue, 02 May 2023 14:10:14 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id a24-20020a50ff18000000b0050bd19ec39bsm1178620edu.83.2023.05.02.14.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 14:10:14 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v3 net 2/2] net: dsa: mt7530: fix network connectivity with multiple CPU ports
Date: Wed,  3 May 2023 00:09:47 +0300
Message-Id: <20230502210947.6815-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502210947.6815-1-arinc.unal@arinc9.com>
References: <20230502210947.6815-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_141016_622759_F5980294 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On mt753x_cpu_port_enable() there's code that enables flooding for the CPU
port only. Since mt753x_cpu_port_enable() runs twice when both CPU ports
are enabled, port 6 becomes the only port to forward the frames to. But
port 5 is the active port, so no frames received from the user ports will
be forwarded to port 5 which breaks network connectivity.

Every bit of the BC_FFP, UNM_FFP, and UNU_FFP bits represents a port. Fix
this issue by setting the bit that corresponds to the CPU port without
overwriting the other bits.

Clear the bits beforehand only for the MT7531 switch. According to the
documents MT7621 Giga Switch Programming Guide v0.3 and MT7531 Reference
Manual for Development Board v1.0, after reset, the BC_FFP, UNM_FFP, and
UNU_FFP bits are set to 1 for MT7531, 0 for MT7530.

The commit 5e5502e012b8 ("net: dsa: mt7530: fix roaming from DSA user
ports") silently changed the method to set the bits on the MT7530_MFC.
Instead of clearing the relevant bits before mt7530_cpu_port_enable()
which runs under a for loop, the commit started doing it on
mt7530_cpu_port_enable().

Back then, this didn't really matter as only a single CPU port could be
used since the CPU port number was hardcoded. The driver was later changed
with commit 1f9a6abecf53 ("net: dsa: mt7530: get cpu-port via dp->cpu_dp
instead of constant") to retrieve the CPU port via dp->cpu_dp. With that,
this silent change became an issue for when using multiple CPU ports.

Fixes: 5e5502e012b8 ("net: dsa: mt7530: fix roaming from DSA user ports")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

v3: Remove my tested-by tag as Florian pointed out it's implied with my
signed-off-by tag.

v2: Add the fixes tag and information about the commit that caused this
issue.

---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7d9f9563dbda..9bc54e1348cb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1002,9 +1002,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Disable flooding by default */
-	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
-		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+	/* Enable flooding on the CPU port */
+	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
+		   UNU_FFP(BIT(port)));
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
@@ -2367,6 +2367,10 @@ mt7531_setup_common(struct dsa_switch *ds)
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
+	/* Disable flooding on all ports */
+	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
+		     UNU_FFP_MASK);
+
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
 		/* Disable forwarding by default on all ports */
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
-- 
2.39.2


