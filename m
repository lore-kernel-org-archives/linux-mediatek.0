Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284BD4335E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=; b=VR6w1xUIXv7qFb89DsLklkzUCB
	77G/mu7FAHQx3RZ+6gDTN9zPquj59uZWWv/e3CP6+4yE1o4WpV/6aMydQu08L7f4wJgXjM0wwtxzJ
	t88AwlnN88mfm4P/iUnaupJEPVgqtlmVWfhSJ/TL10F8EAYhQ9RfJ7+QHusAoB27xvd/AQnrj+6g9
	AkzqZ6S4iAzmskwTupnkJz7UIIdi4KyM5AROa071qnx+R/3C5BViHOJWlm/lANYzfwefZNejPdnbl
	gtyveM03CQXXSDpbFCEyndnHWOFSF5IPSEUd3c/dBhOfuXJvTKMHmBeP5rxXvrxkD5VNFNiBxQ2b0
	Hp9H3mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuu-0000000HPS0-2MlU;
	Thu, 11 Dec 2025 23:17:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuo-0000000HPJo-3rJ3
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
	b=DeL0VAh9tNp+zk6lvTTicz1QWO4D1gV4wyrEIXuUmiOxWhEBpt72G27X2cSeme9tMRQQ8r
	/CgiJ8Nm69giKDgejhfB7wbr1/MI1R98My9FTZtcH/s3EhlFbD6c9q42Djc6LMT+6bDy6C
	IMosvBN5SwZaNUBfFkp4soTgOinXdhc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-QoPa-jkYMUq9SBoemt4L4g-1; Thu, 11 Dec 2025 18:17:38 -0500
X-MC-Unique: QoPa-jkYMUq9SBoemt4L4g-1
X-Mimecast-MFC-AGG-ID: QoPa-jkYMUq9SBoemt4L4g_1765495058
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b286006ffaso152877285a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495058; x=1766099858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGIhcNn4hSdtEtR/SXkjUWQp83NGU7A3xjzPvcHPB5M=;
        b=Yy8HjF6PPlBLa9FEVl6KQC0d7Fnp1LAb7iIQmr3O4c14YjCX4hbCDSrJgwvn/glN0M
         23mppw5WokVYAnij2kNFbDNaz5eesxJgMWoxUBrsLJP4h0cqeXWiBAC6pigdRckU2TS5
         FFE01If+Nbp8DfxRgPQ6lOzlvXYdNyuSZcvO6mQ+sLJqDhQJQvQ66feEMhyodLGgUXam
         OdvmFLGtFS27kSR1jyFpWljD5zkgwXxC0zvpJfvUBewN+iJtgEcwdPNg52ZVZFC9uoCQ
         FvyHBCmmb4hKzuqvtl/+ErXtSBwaV2iZG8b4cZ2Dt7n9iDpikXnhMn279sCuXWb13OMW
         KwqA==
X-Forwarded-Encrypted: i=1; AJvYcCWGc3R3Amy/RV1NSiCrI9zb8yeeJ4M5Gi1eVmbEMYnUpOCspE406LQnB8Cwwb4cEsV4APTcGfwxELZz2riDxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ8xu3JZk8exfrmkRvklnOBPNLKw/GiaLYkqgN9UdoAAvxt34m
	qcpGPFwivbM48E136BxJAD10BmZLOB/MZJSjYKUi2hgZYrDleJ0zAaoXdKXLYQFJaye7uOY418+
	603Kw/4AdKbNIX2KkMd4RaWne2oRddDuqoCDIX4i2hlxSJn7Ux9CM0HR3jALRO5kYEPs36Av0RQ
	==
X-Gm-Gg: AY/fxX7KX0v25vU7lrgSvlDznkCeW7FlUilSVK1rXmrI42xKqevNTW+eLaS5jvleVu/
	VvinB/WZYP78cp+2kvJjJzFXd0QQcEr3f7eSL85j4kWHUmN+J38KkLYprS5f461k5ve4CC0q/yJ
	VBsZ6qXva4m5slMGt27OQBw1Jq7Ztjq+QPgiSm2qtusD8z9HrO8i0aJuHgm7m5Ms2NALzDyHcE3
	35c3RAceeqGB4R6LZNw2EyERUipjfNnFW8nkM4YEEod8/zLC/PDj//oMlX+/O4/jTPZE/a3pImu
	1hjIWjunMmWq5tj3nmGw6DBJmvDr0Qu87NyRiFGf2nrDHrex0EHAYDTEb4JPdm9nQW7q5hUSwag
	sjrSglwHZTIicJi2oZYNh+/sQBaWBqATV4DrNZUxBcC7C4WQghiAZuA==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24778785a.61.1765495057879;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ6MyvatEvjXLdrucEm3djvv+DCSWYW1g1m07kDWXIN1ABKw8EYPVfgJJ5sUpqpKlTIcYAIw==
X-Received: by 2002:a05:620a:4143:b0:828:aff4:3c03 with SMTP id af79cd13be357-8bb3b358530mr24775285a.61.1765495057473;
        Thu, 11 Dec 2025 15:17:37 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:36 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:26 +0900
Subject: [PATCH v3 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-8-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Db9NFuUnQhQu9U41X5Z8TkxHRghSnvnQHsnP4RTW7s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tv/mBQ3J1ntD97t0PtZ/sXbDtX8XDgquXTd8ZR
 upqaUakdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRI7UMfyW7Kk4WyCmZJybt
 XVSS8SzsoeutV4+lLCYXcK7IPTTpxzxGho2HvrnXvlrEFdS08UIvr5StzpeJsWwOEuUlB2Zv/XN
 BlQ8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Ytg_mION535wM6ZwtDlfrOm31HBlQlA43h6iB8l8VM_1765495058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151743_258488_29CA4939 
X-CRM114-Status: GOOD (  13.71  )
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

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 29de2f7bdae8a31958e31b0a64281532fd76e64d..315ac97f52d8af6d3010dc87788575039c7a6b40 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1870,8 +1870,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1880,9 +1880,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
@@ -1897,7 +1897,10 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8, hdptx->hdmi_cfg.bpc);
+	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
+					  hdptx->hdmi_cfg.bpc);
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1927,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.52.0


