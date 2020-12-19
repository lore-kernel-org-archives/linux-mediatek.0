Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6143AC4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 16:22:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1524823A79
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 16:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1524823A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JxyRjCTaZ1I5tv3yqEyamOus0LngpBVuxvnqRtYr0II=; b=SyTsjl0G+eA3WAGq4oJq3NraT3
	NkIPuhnRql6Wk2LrzMe0tWL97AqpA96T9QZ3Zl9Q2bCEdBErBjKGI0Rsr7PnmCZZqbKmzI2foWrcK
	ahFyFC5VDuliUAftiK7ZYrQa/vtykbeqjcbwH6IpzmNJE5AAUW6Q1E7GTIPjSzSXeLvVCK5E861HK
	sifNkaNsQ+uXyguoc9octeeTxQAwuHhm3pBKBkaNO3SjnwTMjFHcxTYIxrYx33Qw3shivWCRZNu0V
	ClSOmq5BcVmJrhsYZXn6FPqeGV4CH8crcfnZ/uU3R1OES6VwJvo33/SuR07yrgX4x2MWSP8AxaEW9
	ttiN35/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqezt-0003tB-H9; Sat, 19 Dec 2020 16:22:21 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqezr-0003sp-Lp
 for linux-mediatek@lists.infradead.org; Sat, 19 Dec 2020 16:22:20 +0000
Received: by mail-pj1-x102d.google.com with SMTP id n3so6058515pjm.1
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Dec 2020 08:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjbCgkEIEDGhLhqulvtGhFV7wVlyMteq8jjvPg/2kCE=;
 b=LuCiaHI3aldHOJhF/w9crLqtJzK/7zby9al4L1QAQGpVQefLl8HvODB5QgrWJn1GXZ
 sidNwm5BAD8OCHmh7BduF/iA9LRuCQ9PEooj04CqVxgvdRROA9I+JB9aSd1sPHm7cWyf
 +aDVxO4VZt01me4JYL/nPJmg2KL8m/ZG4KWxLP21YQxMpbi/4giHeZ7K4bRo5m0TM+6l
 UjBqE5fWPoj1imbEcp5053Pv3m0rQZlpj33DeaFAYKmn5psornhwNg/99Wq0IBugWlxM
 kmhPX7VaGGldyXWCGGU3OtvkMHHSxvq2lp/LGs1Dcq/QydpqWoeCBt3UO2j8iAvKJYDz
 AVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjbCgkEIEDGhLhqulvtGhFV7wVlyMteq8jjvPg/2kCE=;
 b=o7hRVAioqZBVPaMREKZSDDwH+S71Xzanw6M9+dHOyAo1TZbYCrScd0AUjjCBG6wAGB
 mwpVtSBz5VIl3NBNpuEaK+nIlV+pr1ZRnVMpUXFE6pKZ8hg7JQ+bIKS81kbll8ltDejn
 C2i+BJ9drVgV7HGLPZvXyrnSwHu/5lfR59N2v3Lsn00bqD9ZKeXGItEr5Wuntq86NyiE
 TmwxxDSGY2JTkie/zhPf0G3DVisNRfcbca7pbTwrRTYEkHVVbGOQapCV9jajHT7UP/5a
 chPlBvIbpX68+9bZIOVE/h+xLoA0FZzFVSHs/yCQCLz+SSIIPHbrE0KKP8AZ+1fsl2cA
 t8Lw==
X-Gm-Message-State: AOAM530QHShUZHO//nu2bhoEFTJMBuXaqSI4yDcGOWJKps7Ae9JoPoKz
 BIeEMl8sSmX0CvvBan9tGbA=
X-Google-Smtp-Source: ABdhPJxSLjlao9tVQOpE5WFOKS95jsuxtxFXDu+Kb0KvdxVZ4N/WzAb3+9+1H1Q5CJHNPkkFW/OYug==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr9356399pjb.25.1608394934961; 
 Sat, 19 Dec 2020 08:22:14 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.28.98])
 by smtp.gmail.com with ESMTPSA id p3sm10544446pjg.53.2020.12.19.08.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 08:22:14 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Date: Sun, 20 Dec 2020 00:21:53 +0800
Message-Id: <20201219162153.23126-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_112219_758400_6DF96591 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7621 is a SoC, so using "mediatek,mt7621" as its compatible is ambiguous.
Rename it to "mediatek,mt7621-gsw".

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 8 ++++----
 drivers/net/dsa/mt7530.c                             | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index 560369efad6c..a9c8492296b3 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -4,7 +4,7 @@ Mediatek MT7530 Ethernet switch
 Required properties:
 
 - compatible: may be compatible = "mediatek,mt7530"
-	or compatible = "mediatek,mt7621"
+	or compatible = "mediatek,mt7621-gsw"
 	or compatible = "mediatek,mt7531"
 - #address-cells: Must be 1.
 - #size-cells: Must be 0.
@@ -35,7 +35,7 @@ Required properties for the child nodes within ports container:
 	user ports.
 - phy-mode: String, the following values are acceptable for port labeled
 	"cpu":
-	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
+	If compatible mediatek,mt7530 or mediatek,mt7621-gsw is set,
 	must be either "trgmii" or "rgmii"
 	If compatible mediatek,mt7531 is set,
 	must be either "sgmii", "1000base-x" or "2500base-x"
@@ -168,7 +168,7 @@ Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
 		};
 
 		mt7530: switch@1f {
-			compatible = "mediatek,mt7621";
+			compatible = "mediatek,mt7621-gsw";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1f>;
@@ -251,7 +251,7 @@ Example 3: MT7621: Port 5 is connected to external PHY: Port 5 -> external PHY.
 		};
 
 		mt7530: switch@1f {
-			compatible = "mediatek,mt7621";
+			compatible = "mediatek,mt7621-gsw";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1f>;
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 55c8baa31e5d..347845d66671 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
 };
 
 static const struct of_device_id mt7530_of_match[] = {
-	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
+	{ .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
 	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
 	{ .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
 	{ /* sentinel */ },
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
