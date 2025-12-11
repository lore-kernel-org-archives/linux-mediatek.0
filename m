Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ABDD43361
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=; b=cJXXGHeMWFsLx1SjFkeRgQMZZa
	q95hDlOEWXYl4tEKTpMstIn+B+Fzobix8Z9B6IGfCjDTNc1FPqdwkSaGH9AB0rHtWinKLTJRTeV/C
	sWRu5M1LhO56VkLoWflsAkDGBrvHORo7WYMfmA4UoifqJRlewP7O0AG7Ry/wMcqUSnvDYWT+frdUt
	xFGZyFFGX287BjBWditpawarjsYko/DImN0ttLVdexRLYQsKlWHPWsvDuM8GIDOWkKaKB63s+Na6U
	2cpzieXMSzVz45yzk4LCe/t2JgMY43oL/Qw+DOIN0Z25LqMo9J9Fv3AoouD6nxmOFZRIApbPcnGeg
	uDsoqvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpu3-0000000HOQy-3ftD;
	Thu, 11 Dec 2025 23:16:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTptz-0000000HOMa-3dJy
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
	b=EBdADGQVuZNw5Rv7jRxKktxqGSaTLh/Y8nR0vNicc8xgarY3vfYxgs2r9UDsBuWWZDx1+q
	5h+45LwnWBViIvY0y79d4gRCv35jy+cddMkKTPdaRRhki4w0+ZRqNjN6C3yBl8KmNIs7rA
	vlcIGjgbw2+zfDFH8HEg5tCnl4rwOX4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-L8BifX2oPNCYKvfaBbIaIw-1; Thu, 11 Dec 2025 18:16:49 -0500
X-MC-Unique: L8BifX2oPNCYKvfaBbIaIw-1
X-Mimecast-MFC-AGG-ID: L8BifX2oPNCYKvfaBbIaIw_1765495009
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1d8f56e24so147559185a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495009; x=1766099809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62m5HbFq/JRK/3hjm7asDbCu50y2AIWfiQ9w6RslKs4=;
        b=JduWbloiHDvP3l+ed7JMCtPJnZn7pGMd2piq7aB+TdTm1fuAw2B55SFYCGNYqY6ydq
         D50yEWx2yhacVXH72XNOOfZQeW1P/tyNRKmL8ia+JMhLptRiai7txeRhyIWIwzxwfqOl
         irkTL3N3ZkKRbvdCOZ/L4p8YzTg2l+8LlSbg9OrXKwn8y7QUi/UOdVN1zN4MJIPmRSSa
         dwaIosiPkmeLlT7OKGYoTVEuYccn6Igwm/44RXtUpR7wns43ggMqv89Sw53uXIQxX61w
         CKnkWiXeVSpw5B4kWSLLAYAHAW7AvW0L62ZotgcIaJxG1IKuNRcyOgLniAoM4ojRonft
         Oz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQfBQRHIqgU62mPaMxNI4IyGkKUGPMC4/PG0IL9rmisPIQRiFh0y6ZxJwJYcwM+Xsi8PZssFHd3KroF7HmGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxorac0lVH7DwxQm1FPY0oku1VTrE1S7G0vgo7iRfpiLHk56+tb
	omDQ137t2dc8fM/GBfJq7GWmrwTKz8qDC/N2ZrF8SpgUPbe3zsc04o9WhqXgx9GWLp0eLT+aZ9f
	7bl4FvWNmDdCCRsoVnR1Ks+L6+T2g3upRKschKMVz1dvvE57PN59FbXoV3OFirBJoIkESRPBnQA
	==
X-Gm-Gg: AY/fxX4Qgj7HczMOyieekMutzAMVAcQ8NYHqEmIzSq9CVokVyoQ6LCYwSJqaWS4HOBV
	llNWoaf3/5JkwzRtkyB8K36jMv2p4JdHnzTR6tWEjZ8qNEwNO4iyOeauRGuUnBReJ8FDISf04lf
	FmGChMaQi7bCsw7aNqqcC9X03jPD1DbjcPJYqqK0CqLMkpvsc/CI6+/NR+Lg1RvqQ/7nL1nBPQV
	GLSh2cxJyd15cdGhu6WMo9BMZYr7d3aQ5eEc7Tl5nh46WfbQJeK5PdvHlxPkimQkiXV94M+ezhX
	bR5wj2Ec6PjX9E/62c6sZgLV7k+7SATbTmiLoXzQbw7i2GA5NeUZaHoOoip7SkfVUF1OJ5/yoRr
	iIlLxrRM0O1kZTRRnbrtdtKfRYfPyksZDRKEkorOJwcOQi+4JiDuv0w==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34767685a.61.1765495009134;
        Thu, 11 Dec 2025 15:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzGfyg51QMkMX0nb0URo4omcvNBrodsNtcYzQ6shcsy/VZXilk5dO3Eb+B70Ty3ot1LOtMJA==
X-Received: by 2002:a05:620a:31a8:b0:8a9:be12:75cf with SMTP id af79cd13be357-8bb3a3888famr34762785a.61.1765495008710;
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:19 +0900
Subject: [PATCH v3 1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-1-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uyarQyJgmaEeLScoBV74B9PZPRT2iTzM/dIYFjpbgc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5OubvRVPFUzMfglqvZrm7+AqavlWs+rWrUvSgqu
 cN+ieikjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyTYKR4YrlqZuHA698WfRY
 zW9m18O8n8eYZ8/9E/SH62Giq+E3XgFGhj3SJ5lOVnSoTmeLZfR5ljSpR+/PukrH6l/eIWKHHy3
 JZAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bfXNLkDifQ0OIHOENxVTX8KCOH6MY2YkRf8X2dKScJ4_1765495009
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151651_976104_79307C72 
X-CRM114-Status: GOOD (  12.94  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 191c282246d96e3f6c5a8d17abe078892882bf44..d010fec15671d33cc363af79e9f1c3f26ecb3464 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -570,17 +570,20 @@ const struct phy_config *fsl_samsung_hdmi_phy_find_settings(struct fsl_samsung_h
 	return fract_div_phy;
 }
 
-static long fsl_samsung_hdmi_phy_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate, unsigned long *parent_rate)
+static int fsl_samsung_hdmi_phy_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	struct fsl_samsung_hdmi_phy *phy = to_fsl_samsung_hdmi_phy(hw);
-	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy, rate);
+	const struct phy_config *target_settings = fsl_samsung_hdmi_phy_find_settings(phy,
+										      req->rate);
 
 	if (target_settings == NULL)
 		return -EINVAL;
 
 	dev_dbg(phy->dev, "round_rate, closest rate = %u\n", target_settings->pixclk);
-	return target_settings->pixclk;
+	req->rate = target_settings->pixclk;
+
+	return 0;
 }
 
 static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
@@ -599,7 +602,7 @@ static int fsl_samsung_hdmi_phy_clk_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops phy_clk_ops = {
 	.recalc_rate = phy_clk_recalc_rate,
-	.round_rate = fsl_samsung_hdmi_phy_clk_round_rate,
+	.determine_rate = fsl_samsung_hdmi_phy_clk_determine_rate,
 	.set_rate = fsl_samsung_hdmi_phy_clk_set_rate,
 };
 

-- 
2.52.0


