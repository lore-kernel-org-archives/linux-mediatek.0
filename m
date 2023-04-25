Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D7C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/D1JJY2efd4MnhHjjsGtT2ihX1VwbDlUSIIDF4L4q84=; b=hCySeKF5C7tqzn
	aflo/OKrevRSIG/K6PJGlMYZQg45Og1Me++8Fl3/2zBozmKMajGdkEFH0+47e5kVyknvOY3x5lhAm
	8ZC1D5QuRP9I3rI/t7wf5u2eWG06jKDjz1wAtc3765KfcMuuRbFqA2DpsL1cnnkTaIdKAG7Ni8KjL
	QyhZYrcpPBqOMW5jNNtWCX7iE7kgglwfCNMGEuN8C5fnMCBHazCr9eJMGMHWfapJ0Bte2xwH3oFSD
	bW+yvu0OcoytOB/NTKbI3bmq5Gs9wGZrIWqfL80ZdcnPrej3T55PxBNfkbg4PDwLTCSWgyhO1zp32
	q8xn4r3TkMXeci+2bn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE63-000WLk-0z;
	Tue, 25 Apr 2023 08:32:23 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4R-000V5S-1z;
	Tue, 25 Apr 2023 08:30:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94eff00bcdaso991435866b.1;
        Tue, 25 Apr 2023 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411442; x=1685003442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/D1JJY2efd4MnhHjjsGtT2ihX1VwbDlUSIIDF4L4q84=;
        b=MdGnAaVBAbp6NdQd8eUgROd9+A35ntfLrjaupUxW4um9PlATT9SpQ0suUF7e65UZsy
         FmMSaZ+k6228RiadOeUTPmhfleMuTqOat/hleVMHN02HFqCIt3uahp0+ud3oP02/T7It
         2seYADYIbk6ri5luYeAJB8k/qV+yA452jzabz4MMx76vpNfHa0INEs19a3TCOWrj57Gg
         hoP5Gwk8sOpq0H4TT6cNJV62yuQ/pa2b7Al2RDlV5ziDniAuF8CY/CpW+2IC3mXC6cr+
         8K7PubBfFZNmLl/lbyMIfG2i0RcH5kc3hE6V3xWq8GgWQCRq6sY+SVVeb12xuu2Oba+0
         /r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411442; x=1685003442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/D1JJY2efd4MnhHjjsGtT2ihX1VwbDlUSIIDF4L4q84=;
        b=dOsKYaHH/Ws/BG4R8ZlI5gSf6ctzuh39t6bS42baGaJQoLxddbHOw+Ax45rF/BZLUI
         tnmztW3B8QZs4236CahZDq7sKhRq2+ux+nxwpN2OAcqbfYMq9UmI1etCqjjZpA1jp5GE
         uY0we/kJkIQ/3nvQu0p4moWQBBqjT5ENBVCC9GGd4ECUwINbXEoudtRNQIOHN+2JANIm
         qLVFEHM0gwA/1ANotzAyjXJQaHI2nkF99VH2glIZFzgvznYh62jrX/F/Qo2M4SJYW8Gk
         Y6LGpakul41DsAsDLkjVmunYwp+Xuv526sn1aUz6E8F26ZfcH27tXKWRRKEnQGgIKFqs
         aS5A==
X-Gm-Message-State: AAQBX9fgu2spytJM8tx+mqwOq8mm7DCWMg0DdwWLbgtaY4mdMnvxUQoN
	djqAf553bylTwB57NT7L9c0TlPCZ2ivaP8h6
X-Google-Smtp-Source: AKy350Z2cHq6TTjVjeqLcsqKIeyLyBvveCOJGizdgwy5K3mli08J4kAj0H3irh4zvu/MRjz2pdZDkg==
X-Received: by 2002:a17:906:8a44:b0:94f:553:6fd6 with SMTP id gx4-20020a1709068a4400b0094f05536fd6mr12551081ejc.24.1682411442106;
        Tue, 25 Apr 2023 01:30:42 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:41 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 20/24] net: dsa: mt7530: set interrupt register only for MT7530
Date: Tue, 25 Apr 2023 11:29:29 +0300
Message-Id: <20230425082933.84654-21-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013043_677564_60B60049 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Setting this register related to interrupts is only needed for the MT7530
switch. Make an exclusive check to ensure this.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index bdd3f63fe1ef..651c5803706b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2034,7 +2034,7 @@ mt7530_setup_irq(struct mt7530_priv *priv)
 	}
 
 	/* This register must be set for MT7530 to properly fire interrupts */
-	if (priv->id != ID_MT7531)
+	if (priv->id == ID_MT7530 || priv->id == ID_MT7621)
 		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
 
 	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
-- 
2.37.2


