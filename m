Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59175C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnoWPE1jQ3kYm5s0XhMv2bhJOZqz4qyCDxQboi65+Mo=; b=M8lDVbg5SJlbs5a2tRAd6UIefg
	/Z51KPAloXpxsKZbYym4ZIOAHkBC/dfhiMlZgNwALsWh4X8FFmFtXS6mROoz5Ln/8BF0mXdSVnZ8a
	vy0GiX0ywf2bC+YiOlQg98451FgjbzRJB8faCmo5nDkqIy1YXrvy9KdjBsZk3HEH6hDn4kJgM9fYZ
	OZ5qtld0IAXuLtFr5j/l1FhkzxopgAToeSt6qR8Y5L9T6j5FlFcWNyrnef/lI+AVX3fsGGF6t4vuB
	MgojGRNgggjbNHZ4IpImOG5Z5X1ecs+kE8azwSUBpW0uDYQq2mb6T5Iw3p3GoVEcuP3+ezc0Z8NTp
	qHnYA1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkE1-002xhG-Tt; Tue, 03 Jan 2023 16:33:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCh98-001STg-CC; Tue, 03 Jan 2023 13:16:07 +0000
Received: by mail-ej1-x632.google.com with SMTP id tz12so73481969ejc.9;
        Tue, 03 Jan 2023 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NnoWPE1jQ3kYm5s0XhMv2bhJOZqz4qyCDxQboi65+Mo=;
        b=UVPg7nDcLHGMAlKprdPNpgabezsSufjZR4E62AZgq39xyQprvB5VqdG9vBkhqtebgE
         S8lOGYELvqj+RU6B5KVEs9bquQYKobh3in0rnI8lEI/rJ+czEiK4hbrtMmA4q5E/ir4o
         sEgbZSppvAYuxEvJzQttVIhPCxA/0a+nxpqMiLByU6lOwvDjJ2VhirGWBoO5zJOTLQpY
         knwwZh8kclvnuU7BpRIhnC1RupIEKmMhqXvUoyei7DTtCSSCa4dgukDfvevQM6PItaKu
         +iw4V9WS7eIgMu1Ncr0En28bpSdFK19XV9EZiCoelZDSnfPQwDXp8G8kBAo9nsGHWKKg
         U1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnoWPE1jQ3kYm5s0XhMv2bhJOZqz4qyCDxQboi65+Mo=;
        b=nuuvSEog5PmuqwOnK02xnZrv8kHvaNkVt3o9FhxNbbWHvcnqm7BRe5bwBRpLxRRtBC
         NYbMrB88QucbAuWCszf8kzD2tQ7hA2OHro/F7dVz/T7HnRsDk+XbCyMoHIEiBndPkGdN
         FgQ8TpRYA+IclXZzgknNLp3LEhL+3GXOwhu7bzl5BGlB83UTgDUjXjpAahWVHtDSLQm9
         xVV5vteGuU2gR/vANlBvU9muxUTuolYxQyHIFpWwQ37OUTUsmAdzuUpfpnbv0TIm/gf4
         pDQAtzHlsjufLr8wPEJ5+5/XuAnz1LQNhN80bGgqjzuXvLKvU+30YJKu+WxLRWLV1eFY
         KTCQ==
X-Gm-Message-State: AFqh2kopfNgL3S4FEPHH4uC7ZsI+LvmrDMxTnQIuKowrbT4w9LnlT37J
	AoI6VJ8Bj0udDgsZYUgi4aI=
X-Google-Smtp-Source: AMrXdXvgiqj2LSEPUaEw6z2sRd7nVp5kdlIihi8FpByYeNs/V+YRRvBDcz75iq0OtJOTq78Ige/l/g==
X-Received: by 2002:a17:906:19db:b0:7c0:8578:f4c0 with SMTP id h27-20020a17090619db00b007c08578f4c0mr34871936ejd.67.1672751759096;
        Tue, 03 Jan 2023 05:15:59 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id hk25-20020a170906c9d900b007c094d31f35sm13973542ejb.76.2023.01.03.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:15:58 -0800 (PST)
Date: Tue, 3 Jan 2023 15:15:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 06/12] net: mdio: mdio-bitbang: Separate
 C22 and C45 transactions
Message-ID: <20230103131555.5i4tj7sk72gmed5d@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-6-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-6-ddb37710e5a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_051602_503035_777D4C18 
X-CRM114-Status: GOOD (  18.37  )
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

On Wed, Dec 28, 2022 at 12:07:22AM +0100, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The bitbbanging bus driver can perform both C22 and C45 transfers.
> Create separate functions for each and register the C45 versions using
> the new driver API calls.
> 
> The SH Ethernet driver places wrappers around these functions. In
> order to not break boards which might be using C45, add similar
> wrappers for C45 operations.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Incomplete conversion, this breaks the build. Need to update all users
of the bitbang driver (also davinci_mdio). Something like the diff below
fixes that, but it leaves the davinci_mdio driver in a partially
converted state (if data->manual_mode is true, new API is used,
otherwise old API is used). So another patch to convert the other case
will likely be needed.

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 946b9753ccfb..23169e36a3d4 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -225,7 +225,7 @@ static int davinci_get_mdio_data(struct mdiobb_ctrl *ctrl)
 	return test_bit(MDIO_PIN, &reg);
 }
 
-static int davinci_mdiobb_read(struct mii_bus *bus, int phy, int reg)
+static int davinci_mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
 {
 	int ret;
 
@@ -233,7 +233,7 @@ static int davinci_mdiobb_read(struct mii_bus *bus, int phy, int reg)
 	if (ret < 0)
 		return ret;
 
-	ret = mdiobb_read(bus, phy, reg);
+	ret = mdiobb_read_c22(bus, phy, reg);
 
 	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
@@ -241,8 +241,8 @@ static int davinci_mdiobb_read(struct mii_bus *bus, int phy, int reg)
 	return ret;
 }
 
-static int davinci_mdiobb_write(struct mii_bus *bus, int phy, int reg,
-				u16 val)
+static int davinci_mdiobb_write_c22(struct mii_bus *bus, int phy, int reg,
+				    u16 val)
 {
 	int ret;
 
@@ -250,7 +250,41 @@ static int davinci_mdiobb_write(struct mii_bus *bus, int phy, int reg,
 	if (ret < 0)
 		return ret;
 
-	ret = mdiobb_write(bus, phy, reg, val);
+	ret = mdiobb_write_c22(bus, phy, reg, val);
+
+	pm_runtime_mark_last_busy(bus->parent);
+	pm_runtime_put_autosuspend(bus->parent);
+
+	return ret;
+}
+
+static int davinci_mdiobb_read_c45(struct mii_bus *bus, int phy, int devad,
+				   int reg)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bus->parent);
+	if (ret < 0)
+		return ret;
+
+	ret = mdiobb_read_c45(bus, phy, devad, reg);
+
+	pm_runtime_mark_last_busy(bus->parent);
+	pm_runtime_put_autosuspend(bus->parent);
+
+	return ret;
+}
+
+static int davinci_mdiobb_write_c45(struct mii_bus *bus, int phy, int devad,
+				    int reg, u16 val)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bus->parent);
+	if (ret < 0)
+		return ret;
+
+	ret = mdiobb_write_c45(bus, phy, devad, reg, val);
 
 	pm_runtime_mark_last_busy(bus->parent);
 	pm_runtime_put_autosuspend(bus->parent);
@@ -573,8 +607,10 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	data->bus->name		= dev_name(dev);
 
 	if (data->manual_mode) {
-		data->bus->read		= davinci_mdiobb_read;
-		data->bus->write	= davinci_mdiobb_write;
+		data->bus->read		= davinci_mdiobb_read_c22;
+		data->bus->write	= davinci_mdiobb_write_c22;
+		data->bus->read_c45	= davinci_mdiobb_read_c45;
+		data->bus->write_c45	= davinci_mdiobb_write_c45;
 		data->bus->reset	= davinci_mdiobb_reset;
 
 		dev_info(dev, "Configuring MDIO in manual mode\n");

