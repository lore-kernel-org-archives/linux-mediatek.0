Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=; b=vlSK4S2KrRG/YgcTlzS8ovHxvj
	lCJ/mDekHo4SWRUrpPG21Tkd/PHJ2gvowSQuxFDNXiKEClxIqVCPzvVI/TN1t3pLyO/g7IX1xoow4
	x5QopLdlDRo0xKbKRIgEEC3ngwZJjZl9/bU8OOiyGiR5sbcxpOJibRWUJOFqAyuRtzDUHZ+KJRa+B
	hka0jFluGqmP8HkGkHpZ1aZ5OVqrM3kXWtx7dizy+9oNsVS3We8Kq4Ztdgd9Qo21m5KZfW+SJxrPg
	Q4Pe0piKLALXd7wqyVK46z6GpF58RT4NUqQ5uz4bVcun4ZPUCscEVN3W88YUgot9ZP1vVnYK7BGyj
	NuuN0hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHd9-00Agv5-6G; Thu, 09 Mar 2023 14:52:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWx-00Ae9w-2V
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=; b=SN+liYtYWkz1zGD5lnuBq5CnOc
	7pZP+sm4oVwszO9UjDcxBEfTwI/2ISQxgLw128bQ5veCclWcvVo/f1eXA1ElGGQDZYd0CJrtxN4wv
	2N2ifMt+ccKtbvzFnIpn+i8Xp/7f65Bn6esBp9NXeTMBEXSVCCNhZdF+E8RY+nFf2JMpUYZ/W+P0q
	oHbyXESE9mMCeHkR7Jdr62FPPDxIULKlZimdD85o6z2uAalYtDZ5w0oV57nw5jRgr7PUJ2HYwe6ju
	ce/mDYQazwcbRZOz2PsidTAF1R8SYMmLZ1m2m3vqKbSDCnlYvADLfka4JCyZpW+vt+xVbzewYLTes
	EHofyJpA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAl-0008VF-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso3723828wmq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=;
        b=7N7405SRRIId6Fw9WiPQgwLQVdf8pBao4SjQy4WjpeDtFbYOlj1zaSVkYButa1kbc5
         3R5RoGJY7oYCD5pgDTSSWb8JOvKBIOS8hwAv6ZpeMDc555SqmuE3O9wIIMaDRUoavKcY
         jmvNjQYpmDsAWn46qMoLNchn5Umbgzcy+bUzTfgkZEOnqgJEJuh/Soa9eBTXyIounf8v
         lRon0sAiJiOyEVOQvah6GySvSz1w9ot1MpCQ8I/q6bZOploCxsOMmC/zTOnfw8RYulO8
         uhDwcOWMZNtYvMO4kLHCH/U1IrhmOymyLU1AIPx9sYox8GXwVy35gP8w+e6dDbj433Zx
         QUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y0EgOYSdMDz3+KorrQ0r3k6K66g6XiX6jBZImtrVOE=;
        b=6osFdJkjr2nHUQhzTODdtghpWjpldX2vcZ5kK678ZQ7dVdgWda0DClgi3Dw9c+qCLn
         2zuHQFUhaQm8fztbbqJBaByDAlZK84vcDfu0Wd8Nepzu2sJG0Xcn5LBfl/krSmZnzAqu
         p2tjle3P0GKQApepGyPnd/0TFDTm4rWMSwKTo/eT6/Rih41Hi41JJghfSG91dCuaBcL6
         qVi9O8BRbclLfDSmtpJ0pWI9ckuFXQADFWgG67eXpNpL6BYWKaYCA93rjHTmWYFrfOMH
         fDW8Ykmd48uoC9a4moNNCePsGJIAYfvHDkRbsGUbe6Cfq9LzM1pAunwh9fAsWWjz/Sql
         3xvQ==
X-Gm-Message-State: AO0yUKXjvHSB/PcTqyOBYtbucxmB2LVqywE+VtyRrgq67cn5DyjU3dHc
	nsN9L4eRlTFQbOfZ+vALpUVZ2w==
X-Google-Smtp-Source: AK7set+9KAEqvfkzyPxOe24xna17NfixCHnFQT1MzH0SsBzNDwwIU8NvgfCPuEJSgKKoNJIlQbqsKw==
X-Received: by 2002:a05:600c:4509:b0:3eb:3c76:c241 with SMTP id t9-20020a05600c450900b003eb3c76c241mr19333471wmo.13.1678371788034;
        Thu, 09 Mar 2023 06:23:08 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:59 +0100
Subject: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0pXneIWCTN50mIGf1jyLG4V31thLbsARL6qKXISFL2g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+xfM/cZ2Igd63sOwyiQObtBeytnZiIiEDXquP
 icSKEGeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURbr7D/
 4g3s/MVLsDH/3hXDBWmGYtJJhkxZNvV99ygtDkG/1d07uedV8fDZC1xWkFzzQdTXGtHD7DvP4UP/qP
 5fWoD7es0JAbByTDpeOzLp91dk14rgxRxlnCpROWB8ELu8KpvgsEknBlDAAn4gF2MOFGuApXNCMF36
 qhJR2HV1xBXmAKf5w+9sfGys6a/gGEJ7PBduVWaOo0LPtD4ml72Eb2VSRjeP3IkTqB3Qv2R78IdTpL
 OQi160kpwpKFzFkg27rshPSre9WkKfxA1Xilsh7LdcxHCWOh7R9Azq6HXYkjFasqv91sxXsOA9awvZ
 szc4mNAlvbT2PuIjeXL5Sa6gfIeKxRopFfw86DraLV7ORN4J9m3mq2mxUpgEcRIfVGOO6S6F5NS7LO
 pgbgvxclOWGcElkO0RuwiNYDKjZ/hjPfaYJvR2sBHt35csV2ySWw/evGi6M4x7ow+qL5UxrhhL056O
 Pj391MDejNNLPRKEDjTxsJk5gXECD2GaosO2SIuPneuevFav627LA9mTtm7ChW+yx9CqpdR61pcipg
 Ux4yIHqdgEofk8tvOahsTlnUKggEx1Xmvzi+wvpXfl0mCDAaoomfsmsCFMtxqHgcnWN9RaQDZQr+uJ
 UlW2q749LwKncbuiEdySOlmmyV541tw8J0wwzFSYRN8i5R/pBBsivBrMqGsw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142311_563854_5ACF20A6 
X-CRM114-Status: UNSURE (   8.93  )
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

Display Data Path Read DMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 0882ae86e6c4..3bc914785976 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
b4 0.10.1

