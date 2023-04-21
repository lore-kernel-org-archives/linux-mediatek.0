Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B271EC77B7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ky+vCKIfIiAses7wm+VhQnJsA7JRQIkV7aT9O8NnSM4=; b=tf3twdk/SSJjf7
	rdobPcRCCeXKPWaAjvlY3LJCYEmKMEiP7PzB5Ak77xq1JQf7h2aKjE6sjF3H49l+t1l/uYPzD0mKE
	AziuSIvZsVcuvSwHC1ixd4GfIS1ZjjXJLnFRe0DhYrc1XC+XNBcux7Dw9meViRFq08CrnwOtLO5HN
	mrQwP2LaRvx6x2iD/bi1JPuB65uO0ZzgUR5L2aOx413ZE5ke0YlmlMc7rOlsBvQkV/TkGzbsRsHm9
	Ze3DP+N4UrzyxUNd6dq4NbSDHreHSDIt1acZnFvrnOw7D68onUiAGYtz8S2xByysDhBgP9hnIsGuD
	eWJwUITueaZ+htoVGTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsx-00B7Ty-1r;
	Fri, 21 Apr 2023 14:37:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsj-00B7Me-2A;
	Fri, 21 Apr 2023 14:37:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-504e232fe47so3055603a12.2;
        Fri, 21 Apr 2023 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087819; x=1684679819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ky+vCKIfIiAses7wm+VhQnJsA7JRQIkV7aT9O8NnSM4=;
        b=JkNU3RYgFoSLMWgh/VBkhcwU7mLl8IiDCifX8wVnqze/zgB1CeEZGvERps4u1RBZFE
         M2R2OUPNjjEvXJA3Or//um/W0YjpmqUvwXxpNRpjytT3INQY8bnvf/3ZUe3Lsfu78XHt
         0mNJXEdZkn3HLmOF+KmUiyEnYe6x9SVznI7dKN3bunN5qweRKS/o+0VQ7LaWs9HI7Raj
         4TJD7/iRte+KdeyzVWCPvwSfhB28YqkxaJyHGTZzAs9DLFGqWShrI/ZYXCYzGdRij/LS
         Hx+7I4uLHvYorXR7XYC691xbyxAlqgpNmoY/78A5bmf5Xd7HTSxjS2JMeblqwtxXZDU/
         5dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087819; x=1684679819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky+vCKIfIiAses7wm+VhQnJsA7JRQIkV7aT9O8NnSM4=;
        b=lFnUPUHXB9Ju/vslLPTU/7+KmyUbcBgeG9Ettvs/DVbe4p271IkDslXlxQJ2WsclYh
         fE5mGrV8o2DBj5GAIE+HZ0VkkSvWCKiufyIDV3sFhB/7WWYOrHPT4l44bvIBgNdGRfzN
         22xEOkmVCymPW531i7ZqkdHBJsDCEKwI8FjqYisN/n3Vtdcaq/Ifczr+GDqmfhYBTQtr
         G9TXiKw/Xh7u6mfKbCtM702+E6esJF57cCZAiZ40Z/ydglFLK8ay7nE4/GUdU+bOBSZm
         Yd610+GKjig3a6dB59jR7BWk7bEXU/ACQlKoebsU/OSRgefvxWpZ3spK+rFQmVNBX87K
         jHEQ==
X-Gm-Message-State: AAQBX9fTL1PNFvlOPNtc/UQ+SZqY9FEn2p74vUVZkjzNuSKpT3E60+Vr
	zmtWJgE5a8rqyLjEl3OVCFg=
X-Google-Smtp-Source: AKy350ZHGVK6DhQPdnGjNA5o+ZJP/s1xmVPUOGC6O2Hiw050NMaMz7fy8HuE7hXWqtji8iXZX9EFwg==
X-Received: by 2002:a17:906:114c:b0:94f:3312:3daf with SMTP id i12-20020a170906114c00b0094f33123dafmr2160291eja.66.1682087819307;
        Fri, 21 Apr 2023 07:36:59 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:36:59 -0700 (PDT)
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
Subject: [RFC PATCH net-next 02/22] net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
Date: Fri, 21 Apr 2023 17:36:28 +0300
Message-Id: <20230421143648.87889-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073701_713236_EBD05351 
X-CRM114-Status: GOOD (  11.67  )
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

Use the p5_interface_select enumeration as the data type for the
p5_intf_sel field. This ensures p5_intf_sel can only take the values
defined in the p5_interface_select enumeration.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 845f5dd16d83..703f8a528317 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -674,13 +674,13 @@ struct mt7530_port {
 };
 
 /* Port 5 interface select definitions */
-enum p5_interface_select {
-	P5_DISABLED = 0,
+typedef enum {
+	P5_DISABLED,
 	P5_INTF_SEL_PHY_P0,
 	P5_INTF_SEL_PHY_P4,
 	P5_INTF_SEL_GMAC5,
 	P5_INTF_SEL_GMAC5_SGMII,
-};
+} p5_interface_select;
 
 struct mt7530_priv;
 
@@ -768,7 +768,7 @@ struct mt7530_priv {
 	bool			mcm;
 	phy_interface_t		p6_interface;
 	phy_interface_t		p5_interface;
-	unsigned int		p5_intf_sel;
+	p5_interface_select	p5_intf_sel;
 	u8			mirror_rx;
 	u8			mirror_tx;
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
-- 
2.37.2


