Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A40D3C938
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 03:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=; b=vTNwI7Y4lsS214vM6FwuEbEmMC
	yKC/XWSS7s1mu+lqfwbkeqAplf7lts62INsHT05TXRQnwTQNYz60flt6TOw+EImxDJAWW+/bePlEo
	K6vpwGozaD6d5J04kDbNmQ57ThMUUwhb1mzvuAg5Do3TeRIrYO1m8r6ugb8fDzsKva7c2j5dc0VnN
	LCZeyqHQpbmFS61SaskKQU46bM/KAYDKi5awYnEH6jGrS45ktiw4BlvHzBppIkr3SXIJJ7v9BnsZk
	Qvp/WM1BN6m6z6Me3QTO2zOj7tm2QiFAQEG5kUdSs6VmqOiKEBo9HjZeg9Y3ZYqug7TzsMcbvG5gR
	SmWdl7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2imC-00000005w0f-3pJa;
	Mon, 21 Oct 2024 03:08:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2igE-00000005ut4-0rje
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 03:02:03 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c804409b0so3536035ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729479721; x=1730084521; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=;
        b=oNe0aAQLv/4DsZgtU2/xGp8L+JVgaojj33jHF6nvKgbd8oTs+ZyGuS32DjwglWQxVr
         qzBh0uuB69v+fKGn07RVjll9Yf8SrstzKUSPX6uBYn/vYjVNHghHWa9YXs5dAM44bRuH
         +gl3uVxp18VuLPYmSoNK5Wt85Hcq4zm6VJCcgsqgbcEYYtRGhOIaYLrFm8kF1RDI8zL0
         GUnLbZlRyowiOJeT+6LSxDVB87zeYGA/WezrHfNwOYJk36qaWT5z/poHqNax4aKGXcUy
         KlmRFIGzRrzPKM8BGRN+9GE5Y4RQYcmd8mVCOonlWjRDI8fejcNqUH54OdleoE9yPgy/
         wPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479721; x=1730084521;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwvmpL8qKj3SLwmzOmr8dF0fJatg9G7HpxkdxZupeyM=;
        b=Gax6mmIxK/Po+K/QveTKNzLwqMqI1VZNEeQnsIsnWQwXnC+Kr85qdTRjeSd06jUngV
         mT8WA+RUqFIsU5e1f1w4OhqXZrWt/7X1XTE5rq1ndKwdyMUblG2k+kQaV2rc+w5/x6zR
         iJpr5QH+DMlM8hfGPS2blaaOoJgFaQYVFpDVuyc7GS78cBdJdziI596nZP+mJlLqC+Ng
         ln+ov6oEQ9HhW9D6sdqUU2ua5aQA7GTRy7n8Ze1NVIlwO9k0L9NPdiyUrnlfngtssb9O
         ILfx6JeHgVZDfvBHQcv6Se/pCBT6Q1Xm70fzey3Cv0LPWuDxslHvj6jfn9b78Fh5fWO8
         s7lw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Z6cpE3GePhSTeR7CTtfvNWqJCAXlsSKOGBfLrd/RnK+P8sJG5RSw76FMx1QSVRSuhmKeMgMTBL/fhw7rMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvmZrGZJtDndBNftXXV3D0BeWJdATDTBLXRnAxxJYXrlqoU88Z
	dznpMTr63/9vI6FvhlSIigH9504etm6seRBXAi4bAj69jDywarIOUQJWpoqwJ3c=
X-Google-Smtp-Source: AGHT+IHbWlSXkhTf+Zn+HTAPr4tp/WE5z2N/4rjBqzeFRCPxylG6iEA0iZI+/xW79NLFCM34qxB4fw==
X-Received: by 2002:a05:6a20:3941:b0:1d4:f5e4:6a9a with SMTP id adf61e73a8af0-1d92c592a15mr5971583637.12.1729479721426;
        Sun, 20 Oct 2024 20:02:01 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313fb5sm1815601b3a.7.2024.10.20.20.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 20:02:01 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Mon, 21 Oct 2024 10:59:38 +0800
Message-Id: <20241021025938.676-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_200202_275198_32A13934 
X-CRM114-Status: UNSURE (   9.60  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 943837f20377..13e464dac1be 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1


