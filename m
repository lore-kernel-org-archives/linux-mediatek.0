Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C45C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNx2krEh3GR3v59eA5d/S4AlPBNoFLuljf92QUi2ejM=; b=GTMURz1U0j2ngEHe4/aTh65x5P
	IbFVLJN7gPAmBF/yHDhsR1SIb7Sn38r1mv1u6BkmpD8hwI4V7iXAvl+U1ez6iZ6G3P1PnhQlPMGvI
	NmC9CrqVDSzpK1IPnm97IRJG/yHEX9ycBpQ9W1NB2cGGl9h4Ln2yTbNZc003i7WHNJlkLMGS01DlM
	SZx5N3Bmk7kGZ5+aqqyPVrn96AiHwGmU+l0WrGVWaZlWGUTDvQ70eLI0zpDP2Yg5PuKsD+0b5olrH
	D1U0fR6sd+BefH7663kPYuSdwCZloVCDmttIPaM6cMnqHHmKB/mGUjhtVjDcF5bbZY1xNfaQYAufK
	lcQRYy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSbd-00HP0R-22;
	Wed, 29 Mar 2023 10:00:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRa9-00HCVF-11
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id r11so14831669wrr.12
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNx2krEh3GR3v59eA5d/S4AlPBNoFLuljf92QUi2ejM=;
        b=jPm9y4ljsawaBeFj5F7LMvDCBmvdtx6PlXEX8lqzGaeU2EISdGrvg16xrjEaxKbctm
         ZXpvLlrxFqEz/K4lL4+IDYYuJlGdqpamtKdL+0ZEKCZgi5VHi1yww/i5PaozgPmIVu9t
         u9opCPPXJWSPRgJVDrUj51wCqbwphc8jr83Zg2ajc1d5O5cF2QQCbNLRPE3hI075xkcB
         UPEYH9aadgtzLQJbdGXnGux9FqxX4TsqIFMYD6F8/zcO0TZ/L7TSvFMFVYOjMOkCL9OI
         DF5hviMX8ntTkZF3Qv1I6/AUpXqTovgmGZ/XHxo4m3J1pDzfvsDE2dytHJcdsmS0m335
         ShOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNx2krEh3GR3v59eA5d/S4AlPBNoFLuljf92QUi2ejM=;
        b=K0T1YP8ndStYD44oApbxdqDFPI5Yli6XPHWVOll8eD3TqqCr/yVaOHnduefjE3HMs/
         zSYSnagIEGwVqmyhzbTbIdNNzMui++aZGMO2jpgpJMqUgFf7Zm0g6I3FamZYDRk1QxeV
         9PZpuEPAb5BZMhoHt+8N6J7dXWEbhiP/yKYeet+4SDq9YhDZtpmrFaMBruh1wis+OqYQ
         WxOvwpSmIQ5g3RJXUweZl8vQUci9Yo8TYRj3+6DJrxThok17i/eCAco/gOQ1tRVRLlLt
         IFhlsQHMvO1K8qinoLgDTG/URN2itp67nL2nCrDHonhLLK9ft45yupL9xinyZdHFvssB
         XWsQ==
X-Gm-Message-State: AAQBX9cgQ00wp+oeJTwm5cyzrw/9FhfbVUioB29O6yho3bUYukHjbI6d
	vCw1TcAPwGGHnYgOZjmVjv58vA==
X-Google-Smtp-Source: AKy350aFRjNPuJXKKq4EDNBFTYSpZ6D99D0pqfq5XSz7GM1tk6SuQ0SbJ2SfqJYZiRp2Qalm7T710A==
X-Received: by 2002:adf:e345:0:b0:2cf:e436:f722 with SMTP id n5-20020adfe345000000b002cfe436f722mr12998147wrj.64.1680080096741;
        Wed, 29 Mar 2023 01:54:56 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:56 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 29 Mar 2023 10:54:24 +0200
Subject: [PATCH v3 03/17] arm64: dts: mediatek: Increase the size BL31
 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HPwc58g3z+L52Qm0m/2eTO5SapHSsiq1rcTGcyvoHu8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zbGOq1v5cJTzOx4VQqqVcFyWzaznM8GG7ojT63
 4kmPt+qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP82wAKCRArRkmdfjHURZVkD/
 9iniNBwUP4IUKNBTyOt9NBBNewNHRps9eKJnfOy5f4M4IvCGe+FQWglNA2qQcwhWd0QU6W19kFiWWf
 ZnKapDkcntJMvQ+UoCjOMSsx06L6xNyWiJh3gMRjBriWzBAc+3LmqqxUcGnR3Po/uRnEIyzJ5G5Hlw
 CvTXISp9PZR7uM3YlmJU4UGVSZLZ9FW1HTWVWryQI4RgzFDRQwGuRNgLni3E3Stq9BnbTMTLPYhmNh
 DFZn96kdgPqiyxtDX8NzcvVZm1+ZAE96+6Ak8qwz8jHBw+Y4d6mfyjvb/FLc61mNhNp/5NI5iARJ1i
 82R3r9/N2L0bnuZV1mwvoIjCl5h+YYgKyrUqlcY+ZZfw9cBYGsFRQnWVSzm4fUGUY59KcCI49dgzwU
 5S2amSdfUmgyXAM6yYvFEd2PInOBmT8RIOBfzScOrQUeMefOuY+I/GsXWaTa3FrHaCqe/6iHbwhxs+
 gco6rhMS3sDv2AWBboWYU8/6e+NH1PgQeyf+YP4MCORwSW5K8c5Zk/2kKXYRd9fMR6Xbgi4gUAJy3K
 44pxhNPzOJlY4Z1R9RHqvs9YE0ra2t4kUPuN3M2rhCR48FQFBq1HY/iR/d3ee5JvGkUPVuodWOoCtN
 HqEWEBVHwnDq7itKJsmjvEtwLE282wRfJScKpHgKXWghXdXwYsTqOV99/8pw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015501_376456_5F364F56 
X-CRM114-Status: GOOD (  13.06  )
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

From: Alexandre Bailon <abailon@baylibre.com>

The reserved size for BL31 is too small.
This has been highlighted by the MPU that now restrict access to BL31
memory to secure world only.
This increase the size of the reserved memory.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b68aee8f229f..fc7f6d8ae173 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -65,10 +65,10 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
 		bl31_secmon_reserved: secmon@43000000 {
 			no-map;
-			reg = <0 0x43000000 0 0x20000>;
+			reg = <0 0x43000000 0 0x30000>;
 		};
 
 		/* 12 MiB reserved for OP-TEE (BL32)

-- 
2.25.1


