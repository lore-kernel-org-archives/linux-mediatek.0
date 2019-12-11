Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453F0C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170F92077B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHoUvk63";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lzubIgKw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 170F92077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Xf/K5OV4b+4CteYTqk7zdf9g5ajTYIqkxP/PyWX8Do=; b=fHoUvk63buyxCb0r4SMxTqgzJA
	ej/wB1Pl0ByCmzXKFc99uZTH7GE5OXNQZnhpO7woG8tZVB2xBdTbFbYhEhjRc600hVmMqz84+cEL1
	kZWNNhAbW9IDSUfliK91R6NWLBT0PgQCpJYmKrRj2ITMbZvhFsguWFwCpPY/Ha/4BjIrbWE+INC3a
	QqQn1NVH4kWP0ozMHvqFrHWkrRKYMZUrwCt0yEXaHk9HPXGGN+1nFsnlaHa6g9aqub7aRgm3Nc5Pz
	FJx3WzLkKlPa9Zj1sjLiV6WFjRVTfCIDoNjJNbcwm1UMewyibN8NIzM3qrA32304kx5ZjFdFarw7c
	5yx+1CIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if3Ho-0004dE-DH; Wed, 11 Dec 2019 14:48:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if3GO-00039e-JD
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 14:46:57 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191211144650euoutp01f8523b124fe984ad43a43ef5974d0ca0~fWGr0XuAG1952719527euoutp01E
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2019 14:46:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191211144650euoutp01f8523b124fe984ad43a43ef5974d0ca0~fWGr0XuAG1952719527euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576075611;
 bh=G6e9bRQSJqszd1aQwd52ZOX8/ksTctU4pV8j86XTo3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lzubIgKwZfy4HAX7lB01PSkFt3fBJBiHmnLe3JGi/tZ+mb/P15Ppr007AHVIkS1cp
 Ot6qG+dQYkjnLK/hM7Z6bo6DupRQXsNSk2UMyotVaW4i6a0Dc+mhI/sMIbfcy0+r2m
 yu8Opi5w15lTTHPwDYsqqm+fGrKSN0JaL0ynn1zY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191211144650eucas1p231d382044738e0fdbc83b784f98e5e90~fWGrO-Lbn0790307903eucas1p2r;
 Wed, 11 Dec 2019 14:46:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E2.2F.61286.A5101FD5; Wed, 11
 Dec 2019 14:46:50 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191211144649eucas1p2ec8ca5bec84c179a5cbf01a285e82837~fWGq4tLeb1014710147eucas1p2Q;
 Wed, 11 Dec 2019 14:46:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191211144649eusmtrp29e7ed2584f7d5ea7a929a28493ec9685~fWGq39SQt0169801698eusmtrp27;
 Wed, 11 Dec 2019 14:46:49 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-90-5df1015aeb85
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F0.AA.07950.95101FD5; Wed, 11
 Dec 2019 14:46:49 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191211144649eusmtip1a62ee86c383fc63f9046d4477260ebca~fWGqQL9vk0730007300eusmtip1M;
 Wed, 11 Dec 2019 14:46:49 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] ARM: dts: sun8i: a83t: Correct USB3503 GPIOs polarity
Date: Wed, 11 Dec 2019 15:46:37 +0100
Message-Id: <20191211144638.24676-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211144638.24676-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0iTURzl7nu6WnxN04uFwsrAMG0ZdOkhGf3xZUQSQWBZLf1Qcz7YnGZB
 Pps5LCsMx9Cs+ShfUzfRNPONo0TnHIhUSj6oFDTNwhdofn5W/51z7jm/87uXS2PSVsKdjopN
 4FSxCqWMFOMNPcu2gyFgPvSQZVGK+idWcVSnryFQb9ssjrJaC3GUUVxDIputlkLmiSECOZoL
 SOTIsAOkt7WKkLHsPoaqu0colJ7pj7TZZQSymLIotNxpE51i2OLFUYytHa8k2CbDCMWaK7JJ
 9vNQC8m2FVZRrKUkhc1834azj+orALtg9ggWh4hPhHPKqERO5RdwQxw5aj0anyu+PbFUJ0oF
 jbQOONGQOQJLJmdIHRDTUuY1gCuDU4RAfgHYMZ+1RRYANOZN4DpAb0ZmC6IF/RWAL0ufE/yo
 zcQ3gw+PSUYOdTO6zbEuTBWAqw/1OE8wph+DhRl2nHc5Mxdg2nou4DHOeMG5dzkUjyXMSWiZ
 6iOFBT1hZW07xjc7MQEwryOZnwOZIQp+mlsXCZ4zUN/RjQnYGU5b6ykB74HrTUUiIZAB4Fh/
 NSWQHAAd6XoguI7DLqud4BswxhvWNPsJciAsyjcB4co74PDMTl7GNuDThnxMkCXwgVYquPdD
 g9X0r7ZjYHDLwsKulUDhsZ4AmJ3bQz4Gnob/XS8AqABunEYdE8Gp5bFckq9aEaPWxEb4hsXF
 mMHGr+pds/58A34P3uwEDA1k2yUvGn+ESglFojo5phNAGpO5SKza2VCpJFyRfIdTxV1XaZSc
 uhPspnGZm8TfOBUqZSIUCVw0x8Vzqr+nItrJPRW0OLy+6OpU5UtZml05gefaz3tFhd9rV/bd
 4rZly6+FtCQFN0xPpVl0dhMVdyU6p8GDFDdflmPDziZrguR0igHZggKi9irvFq9ptcSAd+nV
 yn2y3kWtj8/bobGR/DhPx2GN60eTa9iHS0bVd/ev5vKzzvHPLk4GHXOxh4/7jOhkuDpSIT+A
 qdSKP5F+hSVRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7qRjB9jDVast7I49/g3i8XGGetZ
 LU7vf8di0b5vLotF8+L1bBbnz29gt9j0+BqrxeVdc9gsLjdfZLSYcX4fk8WiZa3MFmuP3GW3
 aGoxtmjrXMZqsXldO7vFz0PnmRwEPBZ/v8fsseHRalaPnbPusntsWtXJ5nHn2h42j/1z17B7
 bF5S79Fycj+LR9+WVYwenzfJBXBF6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GXcO25e0M9V8fjHRqYGxu0cXYwcHBICJhLv5mR3MXJxCAksZZS4
 NOMeWxcjJ1BcRuLktAZWCFtY4s+1LjaIok+MEt9+rGACSbAJGEp0vYVIiAhsYJQ48/4JC0iC
 WeAas8SyzdIgtrCAr8T+PUsZQWwWAVWJD3t72EFsXgFbic0vz0Jtk5dYveEAM8hFnAJ2ElMO
 VoKEhYBK7k06xDaBkW8BI8MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwMjZduznlh2MXe+C
 DzEKcDAq8fAu2P4+Vog1say4MvcQowQHs5II7/G2d7FCvCmJlVWpRfnxRaU5qcWHGE2BbprI
 LCWanA+M6rySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxzfysY
 lifYiR1q/Nn/p7Vduba9WTjLy0qsb3v+Cp5DmZKOS9c+Kny95GOA9830KOEb554cfGTKIX5+
 aWu14c5ztl/3/bpqOVtb1WLn6t7E4vJtqx7el3/HkdnCMvWcmdKOtyXN0w5uz7bS3GJqsCNQ
 2pXl02P3lv7Cv5fvT20+e/DTYtmgGfuVWIozEg21mIuKEwHzY67vsgIAAA==
X-CMS-MailID: 20191211144649eucas1p2ec8ca5bec84c179a5cbf01a285e82837
X-Msg-Generator: CA
X-RootMTR: 20191211144649eucas1p2ec8ca5bec84c179a5cbf01a285e82837
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191211144649eucas1p2ec8ca5bec84c179a5cbf01a285e82837
References: <20191211144638.24676-1-m.szyprowski@samsung.com>
 <CGME20191211144649eucas1p2ec8ca5bec84c179a5cbf01a285e82837@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_064652_892408_2CEBE52D 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Stefan Agner <stefan@agner.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Current USB3503 driver ignores GPIO polarity and always operates as if the
GPIO lines were flagged as ACTIVE_HIGH. Fix the polarity for the existing
USB3503 chip applications to match the chip specification and common
convention for naming the pins. The only pin, which has to be ACTIVE_LOW
is the reset pin. The remaining are ACTIVE_HIGH. This change allows later
to fix the USB3503 driver to properly use generic GPIO bindings and read
polarity from DT.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index fb928503ad45..d9be511f054f 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -101,7 +101,7 @@
 		initial-mode = <1>; /* initialize in HUB mode */
 		disabled-ports = <1>;
 		intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
-		reset-gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>; /* PE16 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
 		connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
 		refclk-frequency = <19200000>;
 	};
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
