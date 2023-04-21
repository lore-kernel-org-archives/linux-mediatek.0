Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A016BC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QL82S92PhjBdYfMxindC7dNu43LqusGvD9gOD5L3A2g=; b=hsGLjT+3dx3AGV
	U1UKsRSFh4JFtsS1WZXwUDEgnGAizK86/pZCk9l6dNYww6fnhh1fmkShOvlF+RrjphslNVtaml/f5
	7NktoczqOOSifb8aXJH7Uv1XrUhTUa5c7+H1KsZ25inRe2Wjp3yPn/ghTP9IkLLm9FO5ATANBCpWx
	9NqmVo8CaXGzN2u2gOkVtcXTTm2BGORGEPr+bhy+kXdKf1GUvrQw3OXp+q9jOodZG3dkBXDPBq4W/
	WKWssrwVhfvPWhFVPhrh6rqFhwLyfB0bvvWKRpAOe3x5jmeRdsj55XR4jL+nm8qLydz3saDDcbjJi
	NTgcCEI+5895ig1e92Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprvS-00B9SV-0j;
	Fri, 21 Apr 2023 14:39:50 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtE-00B7Sh-2Q;
	Fri, 21 Apr 2023 14:37:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94eee951c70so250062266b.3;
        Fri, 21 Apr 2023 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087852; x=1684679852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QL82S92PhjBdYfMxindC7dNu43LqusGvD9gOD5L3A2g=;
        b=bKD2PiaWlSQ8fki7UcZX0yKrc00KrG55tW4wCF3mwt+64q32ybCgNLbl1ad+5I5avz
         oGYmtQU12vKk7tUHMxqOgP+rPs0fOnOwCUKUlzVKB5c8FD85wUc0fLnzCwWAXEhIG8ZP
         USVps0ZH6DAcGtUD1LwBymYbYCWG3nriM0pcCfO2fmSOuzruQ1RaM6bUy1didxjJwPPZ
         sMclDWOM5wSOo6C14S5eoVBXT+JImitb+GV7pomFNjjcqT8wwH1W5GkgUi2iWgEwENq3
         e7k6JritmPMtrB/wkStkMxoxklPEmfSzTmEZIFGFUPMBdzoBBJCBnxeIKmoyVpbzoLpE
         f2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087852; x=1684679852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QL82S92PhjBdYfMxindC7dNu43LqusGvD9gOD5L3A2g=;
        b=jZB9VK9SMWItXeIs96g13qG0xhFtCAIZGCbzy5hCsACplrDDSnyp1d7jqFLG31IVOb
         TAXphnZU7R1Q1KTd0Ecj2EBP9Wdm1Emy2FXkIcX52T4DPUAk2QwtHpaeBhYKSu2jV4Rd
         i/6s3vZlLjwIdd6dv0V2e2V48j67b3zAhhmes1LJy1pXwlkAxJXGxOBX9hedbvZjYLht
         N+7lO0DSIxttf3giZfkw+AU7nsQWCcd0klJ+9wYcF80l5F222uCgs8+Gvke5PDFxv5VH
         mFH0ZfH4ItDWQ/ld8EKhMY6aC/V8z+3trEdShTRm4pkZdqX+fgUIVILBAsGftYcvj2j9
         UEcw==
X-Gm-Message-State: AAQBX9cI5QO7YAKdCVueheYio72JvmJM9Jw14KiVXyr7R6gHPxxFOlx7
	hvZuCxCOyrOtVijdEJyrn0U=
X-Google-Smtp-Source: AKy350Zz7vHaBqbcCW8whFHVzYvj2/PnK3KBZofM+qOcv70sDcdPH+IJR6ZEBIq25sled6qYWm94nA==
X-Received: by 2002:a17:906:10ce:b0:94f:5242:a03a with SMTP id v14-20020a17090610ce00b0094f5242a03amr3010132ejv.63.1682087852178;
        Fri, 21 Apr 2023 07:37:32 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:31 -0700 (PDT)
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
Subject: [RFC PATCH net-next 17/22] net: dsa: mt7530: fix port capabilities for MT7988
Date: Fri, 21 Apr 2023 17:36:43 +0300
Message-Id: <20230421143648.87889-18-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073732_807010_BFC5DFBB 
X-CRM114-Status: GOOD (  13.56  )
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

On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
Set the internal phy cases to '0 ... 3'.

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated.
There's no code that would change the bitmap beforehand. Remove it.

Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5466259fd99b..899fc52193e1 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2538,10 +2538,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 3: /* Internal phy */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
-- 
2.37.2


