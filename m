Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB92AC77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sx7QT+CfbRJuf7ipyvzI9VLyvr32Uv9zIwCFOCdllC4=; b=o1Bfg2v2FFqEnl
	MN6C1+x4jMicX6gd2/RXin9x6y6RHI+CHfRbYDaZDCnE9NRaASv1GmbflJ2nPZE4DZc948U/eSrbv
	M17UGqmWiMbVyLviZrGVpTr+ZSbOfKaTmLY3kgIWxpp8/vRqGAe7lxsx47Dcsap+zKqnY6bgueUN4
	pZUY9nAd0PQEsk5I6r5YsRC3fknaJtQQRjDc2sclmmH4oBQMCKaKJNoHO6Fq9lN3SA1EyU/LkQOzl
	tLwESxRcwgmyMqWiQDONIG6hGyO6YJHpscBVeIgs70EH3i73Y7aTl5j2mtYhD2MgF6YaTE77WO6Oq
	y8h2958I7D7xKuRCdL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprss-00B7Qw-0d;
	Fri, 21 Apr 2023 14:37:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsh-00B7MI-14;
	Fri, 21 Apr 2023 14:37:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-506bfe81303so2882074a12.1;
        Fri, 21 Apr 2023 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087817; x=1684679817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx7QT+CfbRJuf7ipyvzI9VLyvr32Uv9zIwCFOCdllC4=;
        b=KqBupMCSod70Y958ehISGx6H0Hk58VkXRikprYBBIiecgLGS2MTLleCo9SvhmvEkKU
         jz8vsoBNeqrXcrN/Scju08aE8xCnHKNyPIlAli3EUe30khELo6b869qwOPDjJMGW4WSb
         Ok5wOYo8sXFwMCJsD50BKU1ISbchY0wIMPXyYBM6hn1lAWrZF9oLi24Y3npmGA6fKixt
         oP0dEmwcIby2+JVIyKO8PB1MREpqZ6FTmn6woSIsssN1H6QdVXY3MirHpdu/heK45XNT
         MHqCbJpAG+37GRfLIlTGePKQysSzWtbNtOQoec9KNjm5OpmtW43wlpJa3WZCZ85114/Y
         LxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087817; x=1684679817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx7QT+CfbRJuf7ipyvzI9VLyvr32Uv9zIwCFOCdllC4=;
        b=AUgEruWc31LAEHWVC3f9mitRt4aaXYGuLcweDjnlLy+Cncd17B+ghtSlRi51cDfouS
         HVRB86tA5/3FMfbZ/Jjvr0Bq0pCDEktvvhGSVz57gT2c/w58nuFsdgF7snPhMQgxfnIs
         WrwXICVfie3p7hocRQIkd065T81+7pwPEyaAeqESgaiws6on+UWz50WpaorEgpjiV58U
         FF2QR3CFlTC5rtjAg0pzy0Rt4Zl32DTzXydans7uCgTwV72VJLY8wGEIyjk9cTqFqgup
         kZHRl3HzgfggtV/D1wpFirK9lwzZYB0HLXZy7m4g8WGJmWYbJ5hr+9scl3ObtZrCCyBa
         q6Gg==
X-Gm-Message-State: AAQBX9cUdGKJH52fjtbe5zWXy9hvv6OAr8e5d2RqX8IpGGhjA76JkDl0
	MUkW4ZUftJLIKdw0/tBvbxA=
X-Google-Smtp-Source: AKy350bB4/HdrT8woCCbxfnAVBekFnXUuEGFqFUKrXHi90jUUFu7MVJKe0mP9T5GsJvC/eqr454dDg==
X-Received: by 2002:a17:907:9503:b0:92c:8e4a:1a42 with SMTP id ew3-20020a170907950300b0092c8e4a1a42mr2100787ejc.32.1682087817083;
        Fri, 21 Apr 2023 07:36:57 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:36:56 -0700 (PDT)
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
Subject: [RFC PATCH net-next 01/22] net: dsa: mt7530: add missing @p5_interface to mt7530_priv description
Date: Fri, 21 Apr 2023 17:36:27 +0300
Message-Id: <20230421143648.87889-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073659_365962_3C36CCE5 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the missing p5_interface field to the mt7530_priv description. Sort out
the description in the process.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


