Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C40C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAGSKJ4Dha/ZIAfZI+1H0/FLVbZeQzSqGgtEHuX/IJM=; b=Xrl6uY9nuCrtzY
	TJExeawC8vLU8EJn+r2N1B3qca8jV3ZzaSVtFZuSKO6lBzvfaL4jCrS9idDee511RQmtrMdq94KUj
	Gy8uqjoLoRsm/bnLF/uB8oKLEfTZqcZiSehe6Zeh2SugrzCJ8tQNNnhh5a4orF5GpImkg44rsKL2S
	czEZU5GFnzNXl6+uxhdE3e47wi9ZHxCoVaHZK562B2RDDHeYZIikvMrftSFiHegn4Ucw7cmgfinOD
	MG1N7IJWfIcIF1FVNUQOsgO+/RctH7bAzWE+/zka22ea5XQTmTtM22Y4oCW6l9I4HSGJhuR7URxNA
	ilYMbUjCNlQqzJ4BuEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE40-000UjU-3B;
	Tue, 25 Apr 2023 08:30:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3l-000UY5-0G;
	Tue, 25 Apr 2023 08:30:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bc07so9199333a12.2;
        Tue, 25 Apr 2023 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411397; x=1685003397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAGSKJ4Dha/ZIAfZI+1H0/FLVbZeQzSqGgtEHuX/IJM=;
        b=cnlFX8IxXuPwTO1yT4lwjyNQCZ058C6TnRaTTsJY6HLV3NeEX49ScZCKnXjzQwLE57
         /sPROHBOn+lw3cHYmXNX8qW0IerL4cuWmDi4qqWHlHnnPcXAs8iygdsfT/8UGXSpxyC4
         qL7KxlQ47l9rO4gNSRgdfbUa2rZv5v9UP8pCk+GtNoCmD6+H/6P7ZfInjBmD957Kmriy
         PPw4JTyoqCQ29eRqXIWhj+JxVrFPDXYyEh+B01uly5avMxiCrlaZ0cI/RTZdq4ENTYLS
         MVGFS8JkkQ9NBUxVEeSTmUUx3JUONPmAsUNBcNWlm/Wq40yKhfuNeEMw6fnJc2ryeFhn
         dfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411397; x=1685003397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAGSKJ4Dha/ZIAfZI+1H0/FLVbZeQzSqGgtEHuX/IJM=;
        b=R7vfG7cdLYjaW3Ci2IikSDGoxLbyBPcqnfmHsoFwNNig9/DOOWmqFWoxfaAHrhZaUR
         ZrL6HVx2VCkFuBzgoGkT773o+8SFM19HIaX2ekO2IkvpiEAuUx/gh2b+i3veTqBbrcEl
         zExMMnbuVWS73GkJ2XGuE4Jx2hXLPw/CdnrnzoZVqGR01yFT9G9TWzlFZJAR/Tw5a/LI
         964mfhA4i8wurhTT8uLJPnhCqORNn+D6fYCg+2sNtv7V9zPsVidHKMMyLbk1IzP1zXVf
         oWctXia2QlmYSymc706or/ZrA5qb8bbArCY6PKMzMN/uqZ7vpTBbaIHGY3RQEMtfI53M
         w4gQ==
X-Gm-Message-State: AAQBX9dSSrSrfPFpl+XJFNeDUq8Gt2fX72OkgBZbb2Nh5w7HgxZvvHlN
	HnvTCZADRB5CH+8OKRvBsks=
X-Google-Smtp-Source: AKy350ZqTfe8+1rkKQxwz2ZUF853VV4zr2Tiiz9s/Xjtv8sk7t9V91AYeRqoxxZOBC6CKpGEx/R1Qg==
X-Received: by 2002:a50:ee8c:0:b0:506:79ba:2492 with SMTP id f12-20020a50ee8c000000b0050679ba2492mr13873740edr.12.1682411397128;
        Tue, 25 Apr 2023 01:29:57 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:29:56 -0700 (PDT)
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
Subject: [PATCH net-next 02/24] net: dsa: mt7530: add missing @p5_interface to mt7530_priv description
Date: Tue, 25 Apr 2023 11:29:11 +0300
Message-Id: <20230425082933.84654-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013001_122743_75D87863 
X-CRM114-Status: GOOD (  11.30  )
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

Add the missing p5_interface field to the mt7530_priv description. Sort out
the description in the process.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 5084f48a8869..845f5dd16d83 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -746,7 +746,8 @@ struct mt753x_info {
  * @ports:		Holding the state among ports
  * @reg_mutex:		The lock for protecting among process accessing
  *			registers
- * @p6_interface	Holding the current port 6 interface
+ * @p6_interface:	Holding the current port 6 interface
+ * @p5_interface:	Holding the current port 5 interface
  * @p5_intf_sel:	Holding the current port 5 interface select
  * @irq:		IRQ number of the switch
  * @irq_domain:		IRQ domain of the switch irq_chip
-- 
2.37.2


