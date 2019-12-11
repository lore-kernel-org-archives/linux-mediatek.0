Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE89AC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3731214AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lglBM8tT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oUC90SXC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3731214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Xf/K5OV4b+4CteYTqk7zdf9g5ajTYIqkxP/PyWX8Do=; b=lglBM8tTVlOPNhdZqqOIBYY88J
	pa9YPjCeZwVQpw2Htt5uLXMQZ4sMQGbnN0Pp9zelgO+wXVm+sOvIMyZXgoie2MpcCvNXQgFVaRw5+
	8hVuex0BSdiPzxMOHgRNsJ/cutg54EQouhdm+fDAQlM0qZ4lKqGb0hd+5k7H2TnpCeMmXQw6L/4rt
	AHD0gp8maHztNpiiK8XRb9kkWbId5RsRh7KwpnS8YgoXyqXFiJd2f9/AjEEEWuJeWnr7MPpiBLxuj
	xMSXV1hOjGdM0Nz0MgQ6ad3vEf482DJdWqKyzRrxzzTgqrMLwH4RPsw501Iz/oAIN4jeojBhRzKoq
	DxRKlmdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if3MI-00082p-BS; Wed, 11 Dec 2019 14:52:58 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if3Lk-0007Tq-Vv
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 14:52:27 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191211145223euoutp01ac154e87952993fa468d1d45db8da21d~fWLhf6pSO2200822008euoutp01h
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2019 14:52:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191211145223euoutp01ac154e87952993fa468d1d45db8da21d~fWLhf6pSO2200822008euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576075943;
 bh=G6e9bRQSJqszd1aQwd52ZOX8/ksTctU4pV8j86XTo3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oUC90SXCFVcOLJV8pritfcW+PZOoU6c+WfmaCARp6Tiel1SxYgqDUyHvMCl+pzosB
 1GQ+q0DQ8z0CKz/vrnl5khSWo4sXDpbBNeOWWKcv4DFia2aZrmKfXhpjqoqDyQedZh
 hUURUH1j8MZgbKU1VRcJVMhEsxxRbPjoXtHaTPdM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191211145222eucas1p2d6430e07a3ef5d59d68f1fbe612cf0c1~fWLg7Vwo92757227572eucas1p2D;
 Wed, 11 Dec 2019 14:52:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 47.F9.60679.6A201FD5; Wed, 11
 Dec 2019 14:52:22 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f~fWLgd3r6x1209212092eucas1p1P;
 Wed, 11 Dec 2019 14:52:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191211145222eusmtrp29491b3876f290c709fbbe27d17c8d7c1~fWLgc2eWW0452204522eusmtrp2A;
 Wed, 11 Dec 2019 14:52:22 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-62-5df102a61dd7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.7B.07950.6A201FD5; Wed, 11
 Dec 2019 14:52:22 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191211145221eusmtip15e0632ba3893c653ea497e46b0dc3a7c~fWLfn9mX51278512785eusmtip1O;
 Wed, 11 Dec 2019 14:52:21 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] ARM: dts: sun8i: a83t: Correct USB3503 GPIOs polarity
Date: Wed, 11 Dec 2019 15:52:17 +0100
Message-Id: <20191211145217.25025-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211145054.24835-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSa0gUURjl7szOjIsb4yp5U1HaXlikmYVXKlEIHOhHRYRgiW45qKmr7Khl
 JJpvJx9ZmYsmiYaWz1W39ZGorY8lNM0USVLxQWCCj1B8pGnujtm/893vfOec7+NSmKxbbEOF
 KKNYlVIRJickuK5no/90meiX3xn+yXnUP7OJozp1rRj1ti/gKK2tCEdJpbUEGhjQkOjFVrkI
 1c+MiNFQyysCDSUNAqQeaBOhkrIUDFV3jZMoMdkVpWaUiVFDTRqJNvQDIk8LpnRtAmM005Vi
 prlgnGTqKzIIZmyklWDai6pIpuFNPJP8qR1nsrUVgFmut78m8ZVcDGTDQmJYlbNHgCR4wuAW
 mSN5MLNeJ0oAjRQPzChIn4Pbf/IJHkgoGf0WQN7QD4RiBcCUrjGRUCwD2DiWiPGAMo3kFgYI
 7+UA9s1l4PsTlVMpmFGXoF0gP8+bdK3oKgA3s9QmFkb/xqBupJwwsizpq/DxTg4wYpw+BkvX
 NWIjltKX4LC2BwgJHWClpsOkakZ7QH61xiQE6WkSpi2lYQLpMszTGHMYsSWcM2hJAdvBnebX
 ImEgCcCp/mpSKDIBHEpU71lcgJ2GQbFxO4x2hLUtzsKiXnCw56AAD8Bv8xZGMrYLn+ny904h
 hempMkHjOCww1Oy7fvzydS8ZAzcWq/cOnAvgu5Ii7ClwKPjvVQxABbBmo7nwIJY7q2TvO3GK
 cC5aGeR0NyK8Hux+rt5tw0oTaNm6owc0BeTm0uLGRT+ZWBHDxYbrAaQwuZXUkLrgJ5MGKmIf
 sqoIf1V0GMvpgS2Fy62lriU//WR0kCKKDWXZSFb1ryuizGwSQL6b46NVaBiFNzoLOyy0ddeH
 h5YiO+L8lUfi/UmHMNJ9dMnTt3hS+7zge3fmIVn84flOe378qNrRK86/e/WKj/f4WnaozsIn
 2b4vYtK28+bLWfPugA9Fs2OuWXY/zO7dykt2J5q26dZCwuU9R3p/vh2yNcumN/ZwVqeidOnt
 J+Q4F6xwOYmpOMVf+1GqIFgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7rLmD7GGuxbLWZx7vFvFouNM9az
 Wpze/47Fon3fXBaL5sXr2SzOn9/AbjHlz3Imi02Pr7FaXN41h83icvNFRosZ5/cxWSxa1sps
 sfbIXXaLphZji7bOZawWm9e1s1v8PHSeyUHQY/H3e8weGx6tZvXYOesuu8emVZ1sHneu7WHz
 2D93DbvH5iX1Hi0n97N49G1ZxejxeZNcAFeUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWe
 obF5rJWRqZK+nU1Kak5mWWqRvl2CXsa94+YF/VwVj39sZGpg3M7RxcjBISFgIjFxdkIXIxeH
 kMBSRok1X3sYuxg5geIyEienNbBC2MISf651sYHYQgKfGCXWz/UEsdkEDCW63oLEuThEBDYw
 Spx5/4QFxGEWaGKRmDrrMRNIlbCAr8T+PUvBprIIqEos/rEBbCqvgK3ElS3HoLbJS6zecIAZ
 xOYUsJPo+raOBWKbrcSn221sExj5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMom3H
 fm7Zwdj1LvgQowAHoxIP74Lt72OFWBPLiitzDzFKcDArifAeb3sXK8SbklhZlVqUH19UmpNa
 fIjRFOioicxSosn5wAjPK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
 KdXA6Lz8/uLv/+7KrHX1D+1eUBe14N2tqA0TtdbKa3zW+8Ar7/GjSOHjbbfnNha81hwmZ8+z
 nroteCq2OLSeWy1x7fUXGx4U6zPtFm74eNv/7GKbSet55s34ocQrvWvz/0cBByZWHvwnVPzi
 ZIPM+va9p6YH65xsnGfk8OOVR0CLfYmVjtG2P7dYDimxFGckGmoxFxUnAgCVn2aYuAIAAA==
X-CMS-MailID: 20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f
X-Msg-Generator: CA
X-RootMTR: 20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f
References: <20191211145054.24835-1-m.szyprowski@samsung.com>
 <CGME20191211145222eucas1p1d761af59e04017ddadbdbd1cceb59b1f@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_065225_163386_220CF6ED 
X-CRM114-Status: GOOD (  13.75  )
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
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>,
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
