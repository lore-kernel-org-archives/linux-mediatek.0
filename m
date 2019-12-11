Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81918C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52BB92077B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCKrgp0F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EmnrUMMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52BB92077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=APw1D63dtlzF40hTPUEe9Jv9/heuMrInbyb33LAzSdY=; b=mCKrgp0F+L9/ffLILzqAc48ATM
	HNyYAhxBEHj9AQ7TYDNvncUmdLOFH1OgVCsc/Y9rpZspOfwDCc4EjZU3CbXOD9MLBnzc9q+we3ahr
	8eZHnPWjKJ1WW6vYlYvH64cDtSbp6xXTEgnhTS+k9+STuFMCwfL14Z9dnoyIx40jDLS+P47pY45Eu
	inbf3ftXDTrfcr9QVRDn05Ph4bKZXzm1qabXbSMgom3DdCTg7DojD7ec9fHkyK8EffN/lmqwms7vo
	rZIbQBfKg9xhjdYVyX1NDbcoFm3sHQvv5J5jozcWa23v+DvifL0gwqixZTSBh27T86hKl1rGxv1Lm
	n0cYJDog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if3HJ-00046A-8y; Wed, 11 Dec 2019 14:47:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if3GO-00039L-JD
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 14:46:57 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191211144649euoutp01343f1d69d6f495e00fbbba4a5cc2b4d6~fWGqZPuFz1705417054euoutp01X
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2019 14:46:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191211144649euoutp01343f1d69d6f495e00fbbba4a5cc2b4d6~fWGqZPuFz1705417054euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576075609;
 bh=6yPCbgLPq9lCGS66YYBtZYi6Uzkol1G5zMpyUCDGzKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EmnrUMMcH5XNif7pvCvVPYLVpnPabTH4EaVo4rgAbtalSKf7ITfDl9doCe2eAS8dN
 LWFT2sjmZUw1db9kdWvOnwqteKDmPJtzA1o4FUj4xviiKIFerULZzmNdAdgvclRfVP
 J4jeEIY9MnEYXwSJuExiCHBxWonGpcoAq4GCKS/4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191211144649eucas1p2304a23219d0b5fed15aa82ee8b2ab5a7~fWGqB0q0T2855628556eucas1p2Y;
 Wed, 11 Dec 2019 14:46:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3A.0E.60698.85101FD5; Wed, 11
 Dec 2019 14:46:49 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce~fWGpoDUOw3050630506eucas1p2K;
 Wed, 11 Dec 2019 14:46:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191211144648eusmtrp2d3ecab1613505b685bb325903dde0a11~fWGpnXy2A0169801698eusmtrp21;
 Wed, 11 Dec 2019 14:46:48 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-a1-5df10158cbdd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.9A.07950.85101FD5; Wed, 11
 Dec 2019 14:46:48 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191211144647eusmtip15998910aa904bd33dab89c66ced87407~fWGo9_zTD0944809448eusmtip1n;
 Wed, 11 Dec 2019 14:46:47 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] ARM: dts: exynos: Correct USB3503 GPIOs polarity
Date: Wed, 11 Dec 2019 15:46:35 +0100
Message-Id: <20191211144638.24676-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211144638.24676-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSaUiTYRzv2XtuNX2dgg8aGeuwAi/mh4e8CoJeiMIP9aFg6NI3tXTKpqYS
 ZM40LUvFcpmWU1Px2ppH3lfmCGUeSytQIQ1EwSNMyyzN+WZ9+53/Hzw8NCbpJpzoCGUsp1Iq
 IqWkCG/qXze7XQZf5Z5jhQCZZzZw9EqrJ9BA1yKO0juLcKQp1ZNoaMhAIePMOIEsrYUksmhG
 ANIOdQpQSfldDNX2TVIoJVWG0jLKCVRfl06h9d4hwSmGLf0+hbGG6WqCbSmYpFhjVQbJToy3
 k2xXUQ3F1pfdZlPfdeHsw4YqwK4YDwSKroh8Q7nIiHhO5eEfLApPKZsAMXV2CXey3wuSwbBN
 JhDSkPGGxvyXZCYQ0RKmEkDzWz1hNSTMNwDvb53kjRUAJ9pyBLuNmeHGv40KAEf6dRRPthtL
 T+Z36iTjBTMXMndSDkwNgBtZWtxKMMaMwSLNCG5N2TMs7DSU7DRw5gi0VM5iVixm/OBw5SDJ
 77nAakP3tk7TQsYf5vUkWu9AZpSCbe1G3KpD5gzMn7vAx+3hvKmB4vF+uNXyQsDnNQB+NtdS
 PHkAoCVFC/iUD3xjGiGshzDmONS3evDyaThteSbg79vAjwt2VhnbhrlN+Rgvi+G9NAmfPgoL
 THX/ZnuGRzEes3CpK5ngHygHwK2ObjIbuBT8HysGoAo4cnHqqDBOLVNyN93Viih1nDLMPSQ6
 ygi2/9XApmm1GXT+utoLGBpI94mLXy/JJYQiXp0Y1QsgjUkdxKa0RblEHKpITOJU0UGquEhO
 3QucaVzqKJaVzMklTJgilrvBcTGcatcV0EKnZEA1A5vl2MPnbJ10a7N5jw4dQ03XK2UJISsL
 16rPPncpFvqdb7j1wTXYfW1Pm6cmqWT1x5YbHtGx7t1aU+0xKaN8Ls0X5n+Zt91rdg1w+zSV
 8FjYEuv0e8kcFLg8cTHXx/lpgc7XXe6/8TOrok+nlLCawUbZizGfqYOFweMBm1p/Ka4OV3id
 wFRqxR9W36iMUwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7oRjB9jDe6uUrY49/g3i8XGGetZ
 LU7vf8di0b5vLotF8+L1bBbnz29gt9j0+BqrxeVdc9gsLjdfZLSYcX4fk8WiZa3MFmuP3GW3
 aGoxtmjrXMZqsXldO7vFz0PnmRwEPBZ/v8fsseHRalaPnbPusntsWtXJ5nHn2h42j/1z17B7
 bF5S79Fycj+LR9+WVYwenzfJBXBF6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GU0LbnDWLBOsKJxwhWmBsYLfF2MnBwSAiYSjy9sZeti5OIQEljK
 KPGv5xQbREJG4uS0BlYIW1jiz7UuqKJPjBInvlxlAkmwCRhKdL2FSIgIbGCUOPP+CQtIglng
 GrPEss3SILawgIfEvg2LwCaxCKhKXF7xnBnE5hWwlbiw4gzUNnmJ1RsOAMU5ODgF7CSmHKwE
 CQsBldybdIhtAiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHRs+3Yzy07GLveBR9i
 FOBgVOLhXbD9fawQa2JZcWXuIUYJDmYlEd7jbe9ihXhTEiurUovy44tKc1KLDzGaAt00kVlK
 NDkfGNl5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYvV3a5jn/
 l1IQu8GmPonp8MHrH6c84PnqM8G5dJ2Nh9jxRzMkDqysTr7kYMBUKseysKj77V61v7o9x6//
 OKoQxhAcXTctskgrdt+8TX+/ZOa4ZWVskXMXOLnYUc7V42jc7dB0xYWrF5llhR7lyDv7vd6o
 knVj9E+5WlFhz9vRLzi4BD+XcXEosRRnJBpqMRcVJwIA3Caj6rQCAAA=
X-CMS-MailID: 20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce
X-Msg-Generator: CA
X-RootMTR: 20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce
References: <20191211144638.24676-1-m.szyprowski@samsung.com>
 <CGME20191211144648eucas1p2065aac523ce190a5c0e6e2b5b11bd5ce@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_064652_863661_50D6EA77 
X-CRM114-Status: GOOD (  12.43  )
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
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts        | 2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ea55f377d17c..9c39e82e4ecb 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -267,7 +267,7 @@
 
 		intn-gpios = <&gpx3 0 GPIO_ACTIVE_HIGH>;
 		connect-gpios = <&gpx3 4 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpx3 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
 		initial-mode = <1>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d6c85efdb465..3eddf5dbcf7b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -154,7 +154,7 @@
 		compatible = "smsc,usb3503a";
 
 		reset-gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
-		connect-gpios = <&gpd1 7 GPIO_ACTIVE_LOW>;
+		connect-gpios = <&gpd1 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index e0db251e253f..4f9297ae0763 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -170,7 +170,7 @@
 
 		intn-gpios = <&gpx0 7 GPIO_ACTIVE_HIGH>;
 		connect-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpx1 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpx1 4 GPIO_ACTIVE_LOW>;
 		initial-mode = <1>;
 
 		clock-names = "refclk";
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
