Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43129C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rU2rEuh2fF/AUhiTvEQmHXWDUbju8C9sKkmr3u6JBw=; b=tFJF+LyHojZaJM
	XsdjEpZs8SdTVu73VOnEoPjMa+ukg1xOftm8bsQYNRxLzADvNeLykJg+yCBow/0UBQNz9Pdt5KVgr
	/ZpT6M13Kaj5OlQ6BwhHgjHyCBtzhPX/0sHV9pq2EjEgcN5jiLbEaat2e3Z3n7iPPCO5UjT3lSrL1
	DvQsl95DWRkxaXQk4ep9JEmeJOk37P/y+hQuaZz0g7J9uYgVMzA24A3mfriCEYE5IpU7x2Ou4nYIN
	ZZQKjv80Q1k9NrbkTe3YOdF7tBqJ47gTWSjYjn97AeSuondMfZgbQ6DXs5qPlrJcWiV28SNqtVCD/
	LChK7fUxIUcpeGgidYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE45-000UmL-0X;
	Tue, 25 Apr 2023 08:30:21 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3q-000UZb-00;
	Tue, 25 Apr 2023 08:30:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50847469a7fso7915871a12.0;
        Tue, 25 Apr 2023 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411400; x=1685003400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rU2rEuh2fF/AUhiTvEQmHXWDUbju8C9sKkmr3u6JBw=;
        b=P/ECSuh6Fs+oMNsVuAbO7v2WqO2J8/Bs7A6vuJ7oPUFYjuhaSJXrnd6tw8ERYNodHv
         M4MKjb7+pE/aDSS8oa1OVS683xnnTg0sJRGEiI8ZMy2PLihmdJj6yXp4x6fmuoW3vgOP
         qSnVT4BHlhybLzJkfpBu2C32NqXDM9acUB2nhbNlx8/SjRa0IyQ9LsVWRHUgtbGHWUVk
         +Yc/M4qGMqoWP1Wr8DKjVfWzEzKXc0Eh66evGXDZ7F42OlCUzTNfKzT/7RTjMwUetU/m
         JatOPGsJKen2PS2Lo9I1mDQo/AtWmFYcYUXmWyiaAc7oIEMprE3PCRuaJzcV2vh24ZMl
         0iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411400; x=1685003400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rU2rEuh2fF/AUhiTvEQmHXWDUbju8C9sKkmr3u6JBw=;
        b=DC6v29kXxCRSnCiQ8UHcO8m0UBHbSOHh+8byqLrMLAtfQF3sBBBjz9HIKzY4tqUcw8
         cJBNnMuZzNa2h3gU1jN8og6kf0UonYumq2kNysjroKUanBlRmMGpPTZ97ljPEKDfPyD6
         rNc03kLKhwxh5arg1ukUE13KzWLGlOsfZv3eT31s7N1A9469j7EOQ2LGgsl82HjR39aA
         C16mkReVBGarOVxrUOQ64j4SpttrslIoHNdsCAKocsNxbMqZEMACcpGeA7y9jRxRoDsq
         l0UAdsTk4ip0tnLMAseuyMjrovmYuFWRn8BnOVIvgp1OtdR6ESJDHFCl1gEY3g5pKaZK
         6+Bg==
X-Gm-Message-State: AAQBX9e3yFk6p+Y+9/D1d9JqjUrV0DDDRnffRNj9J6U+GtclLQMiQuo7
	mYOmMBBqHD8V8AGy75gDaOk=
X-Google-Smtp-Source: AKy350bkcOtAPqPEVvCIw4dBxIjTwoE4qSLUO9+d/iejSLnws3XSgdmdmMCOCq8NCWekbY1afU7U0A==
X-Received: by 2002:aa7:de11:0:b0:506:b209:edb with SMTP id h17-20020aa7de11000000b00506b2090edbmr12731369edv.38.1682411399523;
        Tue, 25 Apr 2023 01:29:59 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:29:59 -0700 (PDT)
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
Subject: [PATCH net-next 03/24] net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
Date: Tue, 25 Apr 2023 11:29:12 +0300
Message-Id: <20230425082933.84654-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013006_040717_03464D44 
X-CRM114-Status: GOOD (  12.47  )
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

Use the p5_interface_select enumeration as the data type for the
p5_intf_sel field. This ensures p5_intf_sel can only take the values
defined in the p5_interface_select enumeration.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 845f5dd16d83..415d8ea07472 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -675,7 +675,7 @@ struct mt7530_port {
 
 /* Port 5 interface select definitions */
 enum p5_interface_select {
-	P5_DISABLED = 0,
+	P5_DISABLED,
 	P5_INTF_SEL_PHY_P0,
 	P5_INTF_SEL_PHY_P4,
 	P5_INTF_SEL_GMAC5,
@@ -768,7 +768,7 @@ struct mt7530_priv {
 	bool			mcm;
 	phy_interface_t		p6_interface;
 	phy_interface_t		p5_interface;
-	unsigned int		p5_intf_sel;
+	enum p5_interface_select p5_intf_sel;
 	u8			mirror_rx;
 	u8			mirror_tx;
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
-- 
2.37.2


