Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F92EC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=; b=XkvWO+QcXi5kZFgrCBpcxUuYZ2
	GMBEQKUO1H5qYTElWUy3mIeAKPw861kp5p8VezEFV6l6it0aNE6/RRqwP1MlaTSn7Y79leDN0UEzR
	h/yxGtpSkg9LKvKSA4UCqVfB5bXvrUkH0Q/jeo16p5SpeKYSYugV4Jn8xC8k70B/MWIGcituPmx+R
	t3Ch8p3S5RAeQqoV6GSoVpq/u53g49JdFpbC7zMhPXY+4iauSNFMhlWoOqyYJDq9WD9pZ0pMQ4GEc
	Rapyp2uqoWRSQN0Rte5xcv28tnYQMgKqZzHGubY4BKTn4iRMzr0f99cHetAFMtTyTRq6feH5w5PgH
	aH2KzkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJke-008V16-07;
	Fri, 31 Mar 2023 18:45:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJkb-008V0b-37
	for linux-mediatek@bombadil.infradead.org;
	Fri, 31 Mar 2023 18:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=; b=PLVzS6jDntUv7EU09lqaQI9KM1
	66spm9lnAKf162rnV94dAkxg05HRssQY5ZcqfpqA66nGxgtfU1r5bg2RtFBsN9dJzpHaiuOGnsA5F
	d+ezh+u744S865DHAwhJqztubma5jMYlMZcYddhAPD6tIMVGDdY0Wzr1rzkiOM6JYuEV/aQtNd7ST
	tQTIkuEuSQbqwoVyUvnq1pms/ydjKWvCmLjSpS7M6OXdRk8QChqyi6a+/10mX7ors3M4r0FON0xU2
	w2HJNxnGRXJ+XZkniBTVNDiKlUQC6pk0jWNRwCSgCdmIMRzw84zpwYauo8zNfYxdAPH4VdtXyIw35
	CRmhQJzA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyo-007kGb-1d
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:56:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v6-20020a05600c470600b003f034269c96so4169994wmo.4
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=1WiWu83YTDyzTUyd/W70MoO7qX35QRUxIBM/DuF/wjsQs/ITxt8Yl7XFlGAqOrm1ok
         ZWOxvDjyhXuiwqu3szeEKR+a0CuWrXppOELyzzwxkeGLeUubf/t05OsicTxWhcCxpTil
         hccAwdEl8OspkbPjNqY9HAhJnfDs0ajpSHmGWKG93/QJeeTxHDsT7XkJiyUp4Z4HWTYk
         FTRVFTkQyQvtqk0zErEm5BubuoakiODUrO0xJK+fWFswY7HtJuln3Cv0Tj8UPdGuqhsd
         xDTVEh+IEeiTijnGmQVbyNSn0t94oiER9Kb988JLpJ7ZNkFCap8dNxAN7bjfEnB15YDI
         HmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQKBxaJfTtZgFEarsLsGgbh5GyaHaFrFFoVYkzh/dE=;
        b=MbJqottwjabrh/+tTs49HxZzIXyqP1B7gqn1n5rCexaCep7he89KXtA7hHuQbEO3sU
         JSRdaTCcwqBork/fKyUDU3YZFLvNSP0Lj1W1f8kvB8zzTg4r4FetZdNtSIM5+9TWjRHM
         MkFfHbT3EWA/Kd6LEI5MLKBegcrldu32WI25FWph7ZJSj25gaNApIH3N3l2jzU7QpJj8
         6LFNoIEGmtkHLRgQndMLcKgI1kMURuHbGT3+8B/idhLxI1J1eEEZ+ql/5+kdG7LtTdJB
         S0i2OK1yGZ4ex7/nO54j0dlXEXsq3jpphTFLDcyZ5VK4G/vrvV2T9J8C1K0EJL0XNKNg
         8d8A==
X-Gm-Message-State: AO0yUKUyJCYyJX4V6Vb9iFyaltM2fbcu9lc3OZcesy6qA270Xk00DJsu
	iJwKHCYuE6uBx6VkdlJ6evquLWWn0TXlymE7zWk=
X-Google-Smtp-Source: AK7set/2D/l2ZFdo55JHgf8O4RcAGsB67PsU8O9ue5Szm1z5ZozwaDHbixBnEFGZHAzA784oyzt41Q==
X-Received: by 2002:a05:600c:2254:b0:3df:e41f:8396 with SMTP id a20-20020a05600c225400b003dfe41f8396mr20536017wmm.37.1680285340382;
        Fri, 31 Mar 2023 10:55:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:40 -0700 (PDT)
From: amergnat@baylibre.com
Date: Fri, 31 Mar 2023 19:54:50 +0200
Subject: [PATCH v4 06/11] arm64: dts: mediatek: set vmc regulator as always
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-6-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UFEGO3EPfGZzJN25PtdCGUGHY0eT4OfvboZf+
 +B9lQf2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURUhyD/
 4m79Sfb36DHmtlwAKTlZFD6nfbVFS+2Ggip4saKhmYeLvKgD2PrzNlQON/R0RcFL+xZjLNrBZ+Fn6P
 iEqh+lCO6BpRmWJvhgYMF0gGd6Lr2AzbjpBT8TIpAN1YLmWydvnGqsBOPt+3UoeNOWz88XISB2DsFk
 CAQyKrvpEM88hCaxWKQEL27qHKi5WEMmMtzQfgW1eNSBUnMPaMAPyEDIDj6x0+YZ8uByep4HFlv46Q
 jcpQvqFZ2a4Hv8SPyLeKZ5AOpeAzlmdx5dF/FwhQuLDxXMdivJVM7OD7SgFzSKqnFjyl+vP64Wn/AU
 +h2anbG6bCCVFm4ljSZKxvQt9TzLxxYTDAU/r0TXWtnIF5wYPPnpNnPbA4iK+fC9oouTPwvbnBvc1i
 pN8KR8eV5NrzR6OING65eLLr/wxPgFvL8blbzU0gPOGCgGEub2WP1VUcHuuB+XCJc0hCc3v1CrC4dW
 N0quJbr2lO7gZNHhdPBUu7+RAm/cJVfG3Mbh35EqPi+2zLCbO5OIXZFdRExPsSxFFzIlbkbZNA53zE
 TSuOYh2b3qXy9Xh66PFHOu6xP3MPZr7RXMDPfYxcYVQjRCfBRMOuqE9aF9aZMcKMMdeaM6JkoLckFv
 ayQf8qx/mVqfUAy+0jP07TVxljlDB1i33FLzRWYolSWPAIn8Pqcgh/WT0EQw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_185602_739056_02318672 
X-CRM114-Status: UNSURE (   9.78  )
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


