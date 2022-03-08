Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C57C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TG+ljtrMYpU0ta5PH7fGKlFJcC6Q6oYdWGryzi+mEQI=; b=hye4XzmNV72pyC
	w5kBWkw9pr/15Q4N+sDjRhNG0xMRLcT+kp4iK8DMetSug/inepUEc1IW6pb1SHq+vrm5Cnx5HMviU
	1HSSOqPw9DP9dAa9i6sO2VyjcDkxl1MkfPh2MGlVuAzWZnQMYZAErJS6Vw543WjY3Y7IpGL6boCrE
	6BSkyNTdMDezycBxKVUFH8i5/i/2+pzIY8UcUE2Zr8RSbS5pd16wl3H7MmJtogn/RuYPqr5na+uNI
	hANXhU0KqXyP4YUSxby73I4qSSi/+0Kbf8zwbtF4Ll+PH8cSr86D7A9TRH5LievFXeevwXemFjNiC
	DaECOjKSIAXn5eTqAhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWwP-003npv-3t; Tue, 08 Mar 2022 10:19:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnG-003k6Y-8D
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id e2so16606966pls.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loBNgvfdq/vh+q5b0xP2M4wY6ZA7RodjlaGOVqoQIgQ=;
 b=FT0q3vmjV4Ofixirx3vGOE4K1bSUTlVNj1zkmWaEB3EX6y7v5tGukfnLjgf/JM4mYu
 6HuQCZsYE/huFip+v5Ygfg+JBp7K5XS+cyFGhVfOCY4WJ09FItpUmUbz29q/U6oyX/LU
 VF3wg4h072C1MLIQjKushAzg7cYYjWfEhnqIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loBNgvfdq/vh+q5b0xP2M4wY6ZA7RodjlaGOVqoQIgQ=;
 b=AHHwHKbdNA3IQuhA0r64bOucCojkWWZgkq9TkBDsRFQ5Hpd2AhZrfqzCTCMUR/Zvah
 5GoS7APcIFi39zzmJGg2uTPNt/0MPrulPoGc1+q0Q8TZY9URkpXup3G6NvZSBAfuieVJ
 Nnz6hpyuQ2UESa5flFrE2uLsE3vvcBJm1EZkxmtjE0g376l+lS27HdYQDpxVbsB1WP1y
 xbw0ghEl86mZZEp73Hyg1UUryWxEt2NCK7Tqk58dD1tSXH5DXqBSxn6bc90GX46wimKp
 yALkajihxa2wET16/FBVTDWompN6qLjS0wet7ElivjRa31+3v4EvNJq2QSI/5v4ndDr/
 EVRA==
X-Gm-Message-State: AOAM531N3oEOsMYKTpLh7LLV0ZhQLJK4DgNH3wzqvehsVMYhHXnLhoGD
 jwId1FU/MyLwhk5kopn12DVAk76NkV/uNA==
X-Google-Smtp-Source: ABdhPJwF0uYyAvVJHLAKSPzAGWaO6LHCugVgwokBaJgUvBSb8BHs7+KBcJM96IyJnQmOWL8xCiZEuQ==
X-Received: by 2002:a17:902:bcc6:b0:151:f36d:2658 with SMTP id
 o6-20020a170902bcc600b00151f36d2658mr6808467pls.125.1646734212808; 
 Tue, 08 Mar 2022 02:10:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 04/11] pinctrl: mediatek: paris: Fix pingroup pin config
 state readback
Date: Tue,  8 Mar 2022 18:09:49 +0800
Message-Id: <20220308100956.2750295-5-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021014_317987_0F147A66 
X-CRM114-Status: GOOD (  14.27  )
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

mtk_pconf_group_get(), used to read back pingroup pin config state,
simply returns a set of configs saved from a previous invocation of
mtk_pconf_group_set(). This is an unfiltered, unvalidated set passed
in from the pinconf core, which does not match the current hardware
state.

Since the driver library is designed to have one pin per group, pass
through mtk_pconf_group_get() to mtk_pinconf_get(), to read back the
current pin config state of the only pin in the group.

Also drop the assignment of pin config state to the group.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index c668191933a0..3bda1aac650b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -732,10 +732,10 @@ static int mtk_pconf_group_get(struct pinctrl_dev *pctldev, unsigned group,
 			       unsigned long *config)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	struct mtk_pinctrl_group *grp = &hw->groups[group];
 
-	*config = hw->groups[group].config;
-
-	return 0;
+	 /* One pin per group only */
+	return mtk_pinconf_get(pctldev, grp->pin, config);
 }
 
 static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
@@ -751,8 +751,6 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 				      pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
 			return ret;
-
-		grp->config = configs[i];
 	}
 
 	return 0;
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
