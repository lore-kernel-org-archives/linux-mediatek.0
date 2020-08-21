Return-Path: <SRS0=DMob=CA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC22C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 00:57:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F952067C
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2020 00:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CaVRfx+Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kSvRPjAx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="EqE8Zd5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F952067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8pBERK29t0rhKOhsv4iO6/hXc1i3QOf4+cLy4FT7upA=; b=CaVRfx+Q6valgunc7/kR0b0WN
	Wo7uuUC29hqbutNpruoum8m2MjxZOh6+uhQiybkAsw5AphX14AZPtHu2gCAQbDmMHYfpc0tWFSkm3
	nud4j5nV36Eudc3nCdCPuhZ910q+Ig7PLuiQOOxtqhAtCiZWgOTgNbZDCb+8McQrToZgRYIppoE3O
	k+O1O7IHXkCqBv0asOFi0RVHklDKQ1vzdZdRisAQp1NJBA7PglnjGLKz3ISNWaIgeAW/MrCayZiYz
	wd6Z3LQd/FIOhprulQxu0EXtox7HSiESzjD1QjFg+/c4L2EGDN3X+2n7MVrqAG154zjEvxz/thh5z
	wAjK+3tbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Hqp-0007QA-Pb; Sat, 22 Aug 2020 00:57:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Hqm-0007Pm-Qt; Sat, 22 Aug 2020 00:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=bVggNUCpCpR2RKntphSBxa4nDtjA5O6ebCHd6l3A6Lk=; b=kSvRPjAx6SB7fT4ikwAC+1kJcp
 wBjjfMXmkA9HNiMKv10P/q5FJsPs0K5laX+gOL00mz7rxnJYU1EzHT5ixOUvFvSMNIdYoyxsHtdnL
 01pF7d89ss2ynVAbYjNeAufUlJBHJs77kNBDy5w5AK13ZyhbBq4VL4/Y4pg+xQPopJ0wkdbQ++d2g
 GNFF/X3P1eGSLefDrpeuQVrWom6/n3IkhgEMdcoLtfO6qSKbIAgWFNYfGMDD1oq2Q+4pBQ8emZDSQ
 aAhv/GN0T1eIcf0KMXX7U4PHybZBXrrpBJdeiffTwbiM6keotJsID6HRbCAD5vDIBcexl8DWELMjl
 hcb9euVQ==;
Received: from mout.gmx.net ([212.227.17.21])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Hqh-0006sd-Ay; Sat, 22 Aug 2020 00:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598057845;
 bh=RKUSb1KT1trkVNW36+e3JD1DffRwh/W1OBUG1JuN6uA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EqE8Zd5b11VTxkx9uQu5m/ZijgUhXe5iEAkqCnwNtLLjH/etxsULk5iW09CiPWaey
 Az8uDAnYtk0THD/L7rvvkZu3m1VxHpImrt/yUld+WThPLkZ4J2Y7nBA+FkWn51b5NB
 AhNLDK3YtmxV1w5eMaW/qtVMCMV1th0lb3CiGyas=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.101] ([185.76.97.101]) by web-mail.gmx.net
 (3c-app-gmx-bs37.server.lan [172.19.170.89]) (via HTTP); Fri, 21 Aug 2020
 09:17:15 +0200
MIME-Version: 1.0
Message-ID: <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>, chunkuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Fri, 21 Aug 2020 09:17:15 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200819081752.4805-4-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:G4xmr717AcDMw6ju9c+MTAh1ENstXifUuqwYk2JTQndtKaX+h68KJhQwkJXqNtEhaI343
 d6puxE4NpPUj+poBeraf/qvlP8/zlGCK6Ny4BEOvyctzZ6JW5GK5gYOA2ouK05E3eS6AHof6QCyR
 HijgcCsdNhWCwFIt+hfPGBLFffWcDTSIulRfvsWGY+CqWp0ly5ETHWIjQTDnzwrGYlwUfeRHfoMe
 f2h68lhCDY3XrUEzaxP1W7UIznEzCAiQbhQklhh1HMZwjtEfuIwnkveAyPmmdHcUXfhatuW1pNPz
 ko=
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVI72efk3gQ=:/wM6dcT3Obvi6LtuuZNseG
 8S/L1OvGa+KY4H/encnmhhJUS5wFlrdhpfXmT+U7snPU1FRXhzUqoqmMUPYKwKRX3e/CJn4i9
 mOgfQ3UrY4CvHJu1sgigkE+3Is12Oxihv3TyjQW9PzmBKdGj4I+dB7HPzBhY2g6v4ZoW5mGY5
 P/DNXsT6NYoBwbwM7gFY74HSZX3Zv8yFU+FQ5oKhieuEszFyvqzM08wrvnbODtPxleL8gdm/i
 mlTapZ4nrOVgaARs/rW7jVvDL9UXmm+QDJU9OWfF1hF0X6oTg9HeeWccxIQQl2ng/c3BAk/1E
 rkmh/6jcSqNZNKtGQKp9qE3jgz/5+M2QUE/wGZSBW1397t5i5UnsN4Z8/mZgcbuiTbnGsR+Ij
 AUQ31ZPE4A3acypfZlTPy5A1nxFAZ5n8AMEQQOYyiGWHuB/Ljg/1JX0GHMbaKhX03+ZaZmxZ4
 iFCRS0FVjJ/MO0jajdb1AMph8+6UecQvkCD7+ZRxgWXPt87TYK3O5p1xWvdhPquhCKcPGgyxS
 VBhOj7K9jBfev+yekybM5x/i+lRSpnx9oWWJZ/qwsyaVEwrk/OiAAkTsPhLv+30908CP+bJsv
 UwyZqRaRo72hQZs9iHIU8bP2ABdh5Ai41D+5czUbKr6nbHlj56Y9VRunWSmA5Gz3s727UKajl
 CCSfwBCellSakWrR+muqMB5I4hA3eMO7t7ip3Uv41CQbQFoVB3+d1e9Ra5Vd43o2vsto=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_015735_568406_7B2B26B3 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> index 5223498502c4..edadb7a700f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(phy_provider);
>  	}
>
> +	if (hdmi_phy->conf->pll_default_off)
> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +
>  	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>  				   hdmi_phy->pll);
>  }

tried modifying mtk_hdmi_phy_power_on using the new flag to not enable tmds instead of enabling and later disabling it, but this does not work...

--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -62,7 +62,8 @@ static int mtk_hdmi_phy_power_on(struct phy *phy)
        if (ret < 0)
                return ret;

-       hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
+       if (!hdmi_phy->conf->pll_default_off)
+               hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
        return 0;
 }

@@ -184,8 +185,8 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
                return PTR_ERR(phy_provider);
        }

-       if (hdmi_phy->conf->pll_default_off)
-               hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+       //if (hdmi_phy->conf->pll_default_off)
+       //      hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);

        return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
                                   hdmi_phy->pll);


same problem as without this Patch (horizontally distorted image flickering on 1280x1024)

any idea CK Hu?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
