Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC68C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3VZh9QaGUrHXsEit+Ninsbb+shqEDxPJrQI+PFn0PCQ=; b=GbN2GYKK5YMGwA
	yDO+5BNW/sbvgo1cdl6PdXixaW8cOqPFsPZu3JER+3NBeAYuYli6gXafoFk6QbubalhuBEKLxnoZN
	AOcbfaTsDdPpb6F6qoVUigIbGaOqfvQMRcSPwTDgEij5rqr45NWr14iF56DCAVPjqxCwwTGKRnolo
	yBehfwiInFwfF6Rz2P9Ow4grxXXboo4d59ZUqVRn2kDHIKAbZLe/iCOdNuZt9bFCL13wIhumXm/G9
	9Br4S5QVY9vaxH7X9TKuw6IXq2bThVhB7O5CdvudQVAULnq9RVnPfkGIeh0fGCNm87EdwoBOkJDX4
	vqp34k6GzMQecEWmgjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njKsM-00ESHF-Q8; Tue, 26 Apr 2022 13:05:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njKkz-00EOhG-JO
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 12:57:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k2so4920818wrd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfCMVq1S6gm4GOhj5i7iFzEdFjObyfzkJ5gxl6qupp8=;
 b=jvjMZ+opru9KXy8+E0R/AUv6yAKn2a6A8ERvBEy4gjlspmyMOP82VUGT9SgtvM0dRA
 yCMsYJ3hJTCtbciObQMMZdpRJTfoGaVUmOAZH+qp66HwShj4HodftvtBJrS35fwgo5Z0
 ofo1Xz1LSE69ov+X8QgzHhN6hha8dSVku5omWRFuiksopusuc2xlcuietBGK7DqDVfLp
 DiYjDPxN7Nuh5suHupTei82DjWsr98EtbbAeeT2IAyTKYOm7iCjoyV+O5ec1dADkSU9E
 QIvlGnKlCJR+5etlc6oi9J5xT34mzVIOw8UrupkH56BOHYcZubZ9XEWWKLfB1xeUeklB
 NSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfCMVq1S6gm4GOhj5i7iFzEdFjObyfzkJ5gxl6qupp8=;
 b=61VGt2ulpH97BJET61Hp5RFVFpfhl+iyrbDuQ8xoX2qPrpe/+a4lT10DdSWZf4m9VK
 Xp3H2q4G7q4hn6JePD5+9KvKHOk9Ql/8qyAyldOXMAi0+r8a67SE7pLz4r6R5Fq6rvO0
 cOyDD4jcYCCHeE2yNQ9bynRmBS9P055hA2rcrpVswYByQQDoHGgxp9jDksFtRA776Es/
 GncSW+sQ0h+rHKQmJm1s2BxblsEqIazKX/xKd7SIp+qdJJY6oxpuglnWXm2X2+WugDdW
 2cWEb0XK6IrpAqxLAURuw95pfTXVFSnttkR1N7kAt3PqO2i3ydGSCmdLYWUGh3m7JTFR
 AZMw==
X-Gm-Message-State: AOAM530ZXI3go+322c+dZKE0+NfSWsyf6WXqm277vIq9JDxTzZL/nmkF
 mW6BJVyOErJk+Nz4stLxYHkorA==
X-Google-Smtp-Source: ABdhPJwZgVn/PbNaQMdyC0fSdHiJ/8dQDWK+MoRT9HtNWAky3m1A7R0Z6zQxbTNn2Ffhv4OI6EmneQ==
X-Received: by 2002:a05:6000:1a8b:b0:20a:aaf7:75e8 with SMTP id
 f11-20020a0560001a8b00b0020aaaf775e8mr17692637wry.66.1650977843929; 
 Tue, 26 Apr 2022 05:57:23 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:3df2:df58:a205:f150])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b00393f01c8f00sm3235261wmq.47.2022.04.26.05.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 05:57:23 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Youngmin Han <Youngmin.Han@geappliances.com>
Subject: [PATCH] pinctrl: mediatek: mt8365: fix IES control pins
Date: Tue, 26 Apr 2022 14:57:14 +0200
Message-Id: <20220426125714.298907-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_055729_681517_E657CD07 
X-CRM114-Status: GOOD (  10.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

IES26 (BIT 16 of IES1_CFG_ADDR) controls the following pads:

- PAD_I2S_DATA_IN (GPIO114)
- PAD_I2S_LRCK (GPIO115)
- PAD_I2S_BCK (GPIO116)

The pinctrl table is wrong since it lists pins 114 to 112.

Update the table with the correct values.

Fixes: e94d8b6fb83a ("pinctrl: mediatek: add support for mt8365 SoC")
Reported-by: Youngmin Han <Youngmin.Han@geappliances.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index 727c65221aef..57f37a294063 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -259,7 +259,7 @@ static const struct mtk_pin_ies_smt_set mt8365_ies_set[] = {
 	MTK_PIN_IES_SMT_SPEC(104, 104, 0x420, 13),
 	MTK_PIN_IES_SMT_SPEC(105, 109, 0x420, 14),
 	MTK_PIN_IES_SMT_SPEC(110, 113, 0x420, 15),
-	MTK_PIN_IES_SMT_SPEC(114, 112, 0x420, 16),
+	MTK_PIN_IES_SMT_SPEC(114, 116, 0x420, 16),
 	MTK_PIN_IES_SMT_SPEC(117, 119, 0x420, 17),
 	MTK_PIN_IES_SMT_SPEC(120, 122, 0x420, 18),
 	MTK_PIN_IES_SMT_SPEC(123, 125, 0x420, 19),
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
