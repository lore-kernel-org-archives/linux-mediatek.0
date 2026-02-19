Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558A9C531E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=; b=Z/OllE4rfHVrCMOxNK5kQ23aqV
	MSg/UuQDwK4/FWHXXeLFrq/5y96XKUE5RQm+IU3EDDzIrFOVx35q+Uog/WIGVSFNpcZNer7i0IAKY
	NZq4/Q5iK3YLqwdjiwPwpYA9greYC4k+FcrpY/R7iqRNMMT2yUl3K/eCH5cOzpWPcYJkGHaAc4WXD
	TkBE23Z7DAMcLOXNB8YOSstbSoarUfEz7qU9eB9Gj2kjAD0P9ZU9HBpBGEEayR1UhnovktPdCvODQ
	Fz/yrsGf8JANI2aaDSe0LH+nNZ60LiqLnRkp7oZByYWXBysSl/h+iQWqMVqADrxqTIMQUHGHj4dTd
	F8fJvBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwD-0000000CETK-2rPN;
	Thu, 19 Feb 2026 22:56:01 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCw9-0000000CEKW-2CeN
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:59 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d4c1d2123dso1348214a34.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541755; x=1772146555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=;
        b=bWL3JfDdmJLm37Rhhg7Ud+WbBYgE3ogx4E1dyqPoPLqwrylO+WVX/QCNbvpb1W0hUA
         gqU2qsnSSiwFAt8f8jTseWANLAO83Rt+Ax7Uw8VGgRasHupoWVFghQ8dbiX53RYedjzE
         9bQk7gKg/zcy7oeA1idXMtVuKiX1BcxPgmmvixknUi5foiO4ho1QmYEgjZ9Nf/F1WCwG
         kSDfmIBXym+w78yUWaaJwM92elzBmO8OTwYGupc3MrUvpvKPicZKvscD+MzPPobSiCBF
         6ncwJV+NaQZ8TYuToeDESz6tavj/yFS4DOSrE0k2Q17gARkJ6U7DINWFW99gyN3S27xh
         2poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541755; x=1772146555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=081DBHJ9byQhuCIF18IP6rSG8pXIUMsZt7o8E3vwHTM=;
        b=tb03OxBVD4uwMfFmzF6I910XdjKF3SpAKcJVfoF/cClLRSgsK7qvj6Ye1Rt/leWKTF
         NFW7KptjXm5Q4nIfiXONuTivlITU9zjhvqOcSh+5fndJ9liJvHRcfwad4vG+wMhz/w4Y
         bOQeENHkTh4YawnmrgT/onUhrS2FaiftoxHK/q7vZP4JdcQUwexFM5D/aDf6+DyLngKA
         f3Ko8SbjeGyE4fn+fzvm+lewz5Vq8L7wG5/eH5pkT67kTatyVK9G/NT3Nbw5cx5exO/j
         cAC7g6xuwTGpoSUZjmwYcV1aEkPXX0i6BY5bektFzchBERywNqwehvFKIYRK7nMBXD/J
         44NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVku/mxAWkM54+Dq0JtxhSPV+lKm/8ayC3Sfd0A5yeKLo7G3Hd8OzLqoBED+YpjiNctQF1JLbU0Y1yaW9GvIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk89HFIOB78kbSCCP11DoTD5ZsX382CJxkiNa+sIAH6QhF0Js3
	iUU4wqPLwCYT1I45/AkgxwQKxf+QcJB42A8Eny+8nWHJFpV7Af2IUnOk/5X6K6V2UHc=
X-Gm-Gg: AZuq6aLlp3px5uzeLD6Aa0es0TjVIoCijNcFeJkhjTd3IeR3ofslSIUivJa2a48pu7/
	1VKh/VSoAJnqZ5aTXbPwGL4OimMaCAXHY0NbJMWRGY3pJTneQkscHxsvqfosumutZpb19nc3Wly
	G4Pie2Y0SFp0zHo1IVlcAEjjyApRU2OEZkIp+jTEJrHV0x1Eh1LKgytNwz9yAFQ4tBAsdFZWTgV
	yIeMio2LC8Ne29VhFd1NlM1ej+B5X8axyZ4umkpfEDcsyijQubtjvovW2Oubya5ghbuFeh3I951
	YKF5F4Aw7JoMn0DBqgVL0GcvikgO+KiMrv8XWrRTPDeGpprkN72iyq9kYYMa/NK9AS0qPkp6XnJ
	0JvytfD49+AhrpMutLwVUfdgzPDDfFpc8vHTf6TxRcxVIk5u4+yXU3OJvJ2pyvhswQ1rUQ3im0C
	Q1FJzlB3yFlO4lXsErU/nVhd95y476vKhmu51k
X-Received: by 2002:a05:6830:2a0a:b0:7c6:9eac:2385 with SMTP id 46e09a7af769-7d505db43admr4518064a34.5.1771541755291;
        Thu, 19 Feb 2026 14:55:55 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:54 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Feb 2026 16:55:29 -0600
Subject: [PATCH 1/2] arm64: dts: mediatek: mt6359: give regulators unique
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-1-ee0fcebfe1d9@baylibre.com>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=xXiKD4lBzQGOHXS63TgwS//+Jh77xLfimj0o5Ix5Ov8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TszZbjrmAd5pml3aXjip8WgoYU3VpfTDz+K
 O3loN2g4biJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU7AAKCRDCzCAB/wGP
 wJ4+B/0Q41N9GaCv2pSsvORzYWEFvNeBrjIpaCnJbMMNs9538cNjdcZIoKbtOvqDRlK3pdzRGkr
 qJiDG/+z/Y75ZYoEPAdNrsPbbEhZ168oPvvI7A1JYCtSfktpQD2VdDeNB5d2/olYEn1n/wzi43O
 WXECxwu5beRFL3NYDQ/fv5gcb1UVuLJXUNnn8eotmG8qNiTy1j4/+vMjloUvA2bgCwzrAPV8ak3
 r0pGlFN7aZdd2fZp0HVnl95LJr+3OCThwD31UttQ7FhZ69VYO6R9ct2/p5F6ryW37ySEQDsAHgz
 lkiUqoB+yFYfT0gz3RVpi0U9xl0Qxxx/U54FbRka77olKgMg
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145557_585619_B31A2F40 
X-CRM114-Status: GOOD (  11.71  )
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

Change the regulator-name properties to be unique for all regulators.
U-Boot cannot handle duplicate names.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 467d8a4c2aa7..45ad69ee49ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -205,7 +205,7 @@ mt6359_vrfck_ldo_reg: ldo_vrfck {
 				regulator-max-microvolt = <1700000>;
 			};
 			mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
-				regulator-name = "vrfck";
+				regulator-name = "vrfck_1";
 				regulator-min-microvolt = <1240000>;
 				regulator-max-microvolt = <1600000>;
 			};
@@ -227,7 +227,7 @@ mt6359_vemc_ldo_reg: ldo_vemc {
 				regulator-max-microvolt = <3300000>;
 			};
 			mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
-				regulator-name = "vemc";
+				regulator-name = "vemc_1";
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3300000>;
 			};

-- 
2.43.0


