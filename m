Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CA0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=; b=YgPzSCYP/0LFBj1yNb1EDwPNBc
	SdS1NGD00/DBWAhiDq9ZqMEnFecINNp31AvZaYyh3P5dORFgf2mdECkNsBqFg1fWqdPfeVGidFeav
	gjA3trTMvzhf8N1mY6AFgoRKcfsI62nRmarBJIC5qFJrTK8EPSIypqws+PfLgoTXPyRteMCTijopo
	wq9FFfbmS6Q6KVc5PE7rb0fBXhSasFjxbIbGnL+H11zgm3qx2KBKC1Iu8vnS3LBhUF+vtdbbKIVM2
	e8CY5VljAJhfE26J94vGAQknCcF1uPNH+0JzzXR5InIy6EOGis+XUDQzp7uZuCIig0MEuhth/xj8Y
	fe8HYb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmPE-00AN1D-0O;
	Fri, 07 Apr 2023 13:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmPB-00AN0L-0G
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 13:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=; b=mArBnnfY0b8H2BFNJ3I1IDOnq2
	EsfUOGZNSzM4ehlt8W3TiUgA5B6AIOMMsqnddKzOEHWfxHqggnezMQ79LrSIKOgqLFuSTkNcdFCUD
	MUGo8fCr1ra0Tu15XtjPE4n/tjcB58KAVlzxw4/JyuSAV+Gk0KInFqdpXdvax5O7cIAq5mcufXMnj
	CgxkLXnQMNGfaMYfwpo8rYw/Ijn8aEaeuAXbpWYXLu/qEXWRQz0vIrB+4mtWqB/ajX2HcHdQerUw8
	6YaEOOg76MxIqZBMNaGcvf19tydKZ2chCPt81n4do1Fa6z50SeGyPcOZAhRdPtnicxEL0Lw89UI4O
	PeVk6QEw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklh1-00B2wW-2G
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso790291wmb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872389; x=1683464389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=K2vzmWWospCRq76TbSi0+wZ0zMOAZOd66LLHAM+Se1ayJWZERPQSuBte/as9oVyjD3
         f8mwiVgf6KGir7oVhrBQqNKvF11/FNBcQ6mq8TiQuOU5a3AF/EkIFarwb6g+4tej2EeO
         hpwiu9aFwihF5ikzZhFHv9WR1XejjVR5P74yytQs49OYXl7LwXUCYxS4WheqY77H9q7E
         FPUZxnW5ZXZg+DCIEiHf/Qa0uA3kAF5YFK79uKBhxw41/97OcAO4HO7fHcGYjYIky7SB
         /VEJ9f1Oaq3fsA6OY58J5j1o7LZt9sRsSwJ+68pd4v/CzJ3rlPIJN/Ld7mDtJWt2ctw0
         +txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872389; x=1683464389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=pL90qHPh6GXNLMdS/EShiNam7pMsu0mGBxKTg2da/rVnGHlu0LJ+7qRtBdbloBKhbQ
         QtN5V5Nt0NTkR8Gv6pO8zvX9a+o5h1h/twiM5tfzocCyN64BT+GinFBCk8mMdvz7mYCk
         HKk6IeFwzfUzlosFq5FjSwiMUUN+4DImJoLq2zdNWHRmZtuaDb8jEQqIziRaptAiLvmW
         30dvMFpxS+Cx/T98O70OLYsyvoDV4RrC1o0Adn5rojFaFv08ZEyA1+b8b75HKbV4sD3w
         nb0wE2vFkD0hG8Iw33kPugoKJCDza88eSTAdwh+S78uXvsZEKB3sThjzcfXRg1/GZt7S
         yf7A==
X-Gm-Message-State: AAQBX9ein+4YsP3WQspcqEGMHgRjYs4H/aNZcRRibATM4iDHFS/ZnOij
	VozKTxc4tFHxKxPg9I/2zFVNqQ==
X-Google-Smtp-Source: AKy350bWd6lgb4gDck+DlVQj2J0iHuLZOOw26vgchmUPYoKgKSyc6rI/TX/f4fqvUU+b4kFoLaqAKQ==
X-Received: by 2002:a7b:c018:0:b0:3ee:775:c573 with SMTP id c24-20020a7bc018000000b003ee0775c573mr1193944wmb.20.1680872389150;
        Fri, 07 Apr 2023 05:59:49 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:48 -0700 (PDT)
From: amergnat@baylibre.com
Date: Fri, 07 Apr 2023 14:59:26 +0200
Subject: [PATCH v5 07/12] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uQmwTOCvAzVnfNhZj39MxdhTEW1pXL/YxThy6HLL1ww=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6rfi7KOma1wba+5EHCCCpE0+U968VihmrZRL3
 gq5NwieJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURWp8D/
 42YBkFy2+WquX3mRrxbZJ8Dac+sLIewP1YqIuM3q06ycYB8BIdJqrDBFJyyVjEwt0s09zwfjHT6+/e
 yddcPaWPc2NXga342qGRH40A/JxGRYvb9MJcfElPLvmzyIRlvbzqXuo1nnIgSXRZ1zqtqFz4sbc+un
 WBAsyBDKiJROyq2Ecqel3H61Y7LECl71uOaiD61eiUdHfLTTZx6wCXb83rjVHhZSHmICs24KFokAQc
 sTxyCNu8yUnzDtyCpVIlyUPDesu8ZSdhisNZN1oieipy2IMGJJS21UZYkt/rtLsBt4eFUVQyBw2/6z
 2NNlqyio4BMXNhZCa6mf62UJNQtJEHjmQl16o2XGWnpCLSfHxVR438KQUi3kZwl8SeSn4BeGXVCckK
 ItdROA8MG6H260+80QYf0MFHdDX+oISQOPI6WSNVBEzBs8TM05TAqylZ1Fe5lcn7cBnP6efeJpC5Sz
 XMyZPZhzo4IdICPYIJ4UIHp8lnxFHMSrah0nit6HYHV0OIQmcWmarsD6mJILDTZA2mV5CAHCu8vskW
 EQIqADAf7s661lVED4BlpPN6e4Kvz4sb+xk7n1OSv0nrC3KVSWOwfb6zXZWfqoeHLdRceEqnx8BcwL
 9DcDxtJbhqXmgu9akX/Ve6fJc7MbMUuxyiP4woh7oRRwKkYy3FN1adOcuEgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_135952_646758_2DF1E48D 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

From: Fabien Parent <fparent@baylibre.com>

MSDC1 IP block is powered by VMC. Make sure it is always on.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index cd920d09c3fe..1c36d8f19525 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -137,6 +137,11 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by MSDC1 */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


