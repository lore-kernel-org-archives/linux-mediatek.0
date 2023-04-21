Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85771C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIUfI9zYtHK2jC08JSP+sw+iUpDI1NVNrxb5eq8tcPY=; b=XCtPQ3HTbb5uia
	OlGfNhtdWNd99cXdkMDUcdXpgUcb00vgn/4mH0804QeC5dcpU8jvGlYoYGVPjjwkmH1BYwE+08tMY
	ipAzPthyENijEtEwgjDYLAcvUsoKseOnCPZD4CM08S8YzkLFISnn5CiZ6UFLQU++ZEbqVi9lHBhv4
	SBzz/qcQg6nUnJ8T7CH95Lf3FZyMQN1jfKeGhCR1JTL79R6SC3SFcVHl6KP/5b563M3l0mhsVXu67
	L0JWPOgHkf9GpQkfGo1lxNU8hrpLaNv6iVnlTh6Rx/Hxh0QH9ZmRC3etxE4gMy+PSlWKYU6QUlPor
	XZwLLm98l2Dl24wjUQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtz-00B8F4-2y;
	Fri, 21 Apr 2023 14:38:20 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsx-00B7NP-1b;
	Fri, 21 Apr 2023 14:37:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso2549535a12.3;
        Fri, 21 Apr 2023 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087835; x=1684679835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIUfI9zYtHK2jC08JSP+sw+iUpDI1NVNrxb5eq8tcPY=;
        b=EljJWrJfUjgKLFZf4IOQcisR2n+YvpKGILxQA0DY8LRAmGKjAkYxrBbV9zkWaEzEEZ
         ToBPIz31lbts9A6vbTHwyo2Qy1xfD+C+ZOxQHBmdmh9VggFiup2xf42NeV15y2/ZEZxz
         CFBeSREVfQk5ERVAUslmpDlkte6lEProXiA8Ysgf2iphfR4iFI3x4k9i6LS8xqNj43gw
         l51i+L6mswdX4zOPFozwD9GLu6Nci8Fpv4t57BW+80VWM4nygIVSjC8WmUnxvQwGeyVg
         H5IxkknOJ90pXzQ0w6PX0/AweMVWH8Z7YxNDwM+u0vX24vRWnU6L6z0QoKZtMtDhD9jn
         FWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087835; x=1684679835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIUfI9zYtHK2jC08JSP+sw+iUpDI1NVNrxb5eq8tcPY=;
        b=Y7Yk+SbhbStPJTXmbSyit/VjnUe4uRDvaPW+U2J86IZ2i8jxyJAOWAcNzvscH50dZB
         4ZpnkNA6hSwqno3u83zvkheT9dBAdZVY4XSOoEHOB4NdDKjJDy28yDG5iQkOYyAnutNw
         CHmiXp5SpNZu9yu+1EQhdq7F6RCMbM2YBn43e26ngE+ECcEyEC0obOYrOsiswRokwlvI
         U2ftYu6E/N3lVbx9p+IoUGbe6KKzHoH2DwV4uayhxQ2Chj98IDUEfMjg7FoPL7wLKM0m
         qaSaSxxySbHUGnRtAWiQd8013Rxa4ehPp9DrbhYC/JnIdam5xJf9AYQozKTlvxY0+kow
         FDDA==
X-Gm-Message-State: AAQBX9c1B9pGw4/rMkKkkEz+SuBHm0P1oqZXA+HCPxH6rrFl/gw4H/Au
	oFDdeIgjnWd78fOtDcHvm+o=
X-Google-Smtp-Source: AKy350at4m7vdCl2YFdYMq3ekSHRb756GOmIXElLgvBQAuem9vck2/IxIws8+YBBhwPfX8U3p0vQdg==
X-Received: by 2002:a17:906:5d0:b0:94e:ef09:544c with SMTP id t16-20020a17090605d000b0094eef09544cmr2370576ejt.10.1682087834761;
        Fri, 21 Apr 2023 07:37:14 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:14 -0700 (PDT)
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
Subject: [RFC PATCH net-next 09/22] net: dsa: mt7530: empty default case on mt7530_setup_port5()
Date: Fri, 21 Apr 2023 17:36:35 +0300
Message-Id: <20230421143648.87889-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073715_558676_21F52AA3 
X-CRM114-Status: GOOD (  12.00  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

On the first code path, priv->p5_intf_sel is either set to
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.

On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
mt7530_setup_port5() is run.

Empty the default case which will never run but is needed nonetheless to
handle all the remaining enumeration values.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2f670e512415..be143da94add 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -933,9 +933,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		val &= ~MHWTRAP_P5_DIS;
 		break;
 	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
+		break;
 	}
 
 	/* Setup RGMII settings */
@@ -965,7 +963,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.37.2


