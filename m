Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3817C4451C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=; b=Ou5BRx25P49Dap6ewtF1LcmKRW
	AEZYzyvMQfEvm7B4aNIXrv1+kejFgJWqrqNSJcneDSIvzj5dtA+57w1zUR0lB8aVLpkfocp8xFWVF
	e/d5IFBd02B6JynDvXHaIlZVKyMhyKX0UXBlQh70Ui+3ps+bYKyFNaDW6dFjn7KC5KcCR7Y/J/ogW
	KIHro2lImbw00nwF6fdazht8S4rOUCFGLWTltaecUocAWDpfXkijXWmIQLOei7uEuhk/pRN031eOv
	BvD4WeKPeyrg1P9x9DlAZJ0tkSeKqYHIZvjt3rZSN7Bh2U7eGqpCzV4/xSwB1W1rqaZ1B5+ZdPIvf
	SjVytXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldV-00000002lJC-2rWG;
	Fri, 17 Jul 2026 16:42:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldO-00000002lD7-38EO
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:41:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c15ba5b151dso630774666b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306517; x=1784911317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=Qk3tOF1Ih2vEUVR75a+F3nN3Zk2sssGTD1vSAPNnCfeTVbYVqiw24t2lJtzgY4xe0Y
         RlSHIsKW3V45XoHNWxtmT1o+C071oHw0+qb1VQOQ9o52uSNz1ea9o0EELm6SvZWv+5OO
         W1cGdghAhtQyMLZv8cLW6pobnNvlkghTC7c15iiTkWh67Cx2AInYaAb/w1oUbN1+VhEH
         eU3zRYOVxpWZV4M4xzKkp19ox5vdLMdvEv3eAs2FhZ3xfU6OwzZ9zob6pvneWu7hhsjR
         DqZGipFERtI/XQUHQWbJQjgLx0UD9pUMEK1QdWbwN4trbwiNQdLQwY4fbEnJiV1Yl17J
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306517; x=1784911317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=j+kh5z7zoHKnWJYifPmErTZZNu0rWDeiawqa/O4R2fYZydyvcV50/sbhbteYhDq7/g
         zyEtitlRIkykJMie1QlqvD7epMpWmCKJYSJNVXdWvN5C0Oj9LxXEUrya1FhxXASmYUoE
         H/WHkaWH8/hGOCwoMVIGY9/+2RI38NIu6WAUstNfPoY+AgFWGJvSuGWuTE24Gvdfm9O6
         Sa8ow7b6/jyO9J6NAI3faynR+2VuMMimMpJljCY7wzDJD/NKW5fMUbK2j49xjJCVsuwr
         PZm+pS6S+6rNS5NbTc9+7AMdostTR4Aw0LOHg+WCQwKPdzKIBt4xj9VqQK6o2BxS7T/S
         +TpQ==
X-Gm-Message-State: AOJu0YwuKTiPylEVCaCKszNSNhqgy/fl0wQq84VyueTl/EBqgM5/I+oF
	oYViwRNZZMuyOBUvlXdZSp1Fl/3VkLB1hyyLXBtXCUJ6zEO5097aTVdjf6b8UAvi
X-Gm-Gg: AfdE7cmb6C7KldwnTi+WHLr8DYx7YsJga2SNFZ1hAzsIgsQFItl4E5Dkc3RB0KtePLm
	Cn0D11rogZYJ+5/HyBFRZw/+zp01mQTMT/ICmT/szkYrcP3aoGe+Uijm/9pNiDpqyjwlQE3+NVz
	iM88hg2pS5CEv9PgMELcOSpxpDkbMLkPEYLqwVUJ3XTMLW8RHxy5kaDXZFE8IoqaDJwfcSfSpoj
	Vtd3wd/o0/FiSxd42i4UMGgACQQpp7NKnkE+t+UDiJqqw2/qHS/j2C+Qaa9iIznm5SrQ31P3MTQ
	hENcxcvVheCdFm4VFxbAuPktLwuPlaRAVXV3maaqtZdBrl5advSZTHAsVEpaZWt7DCdVT6ZupNf
	dyn0MapEIiNF6QVO9Yf1oBAVLXgVidBQS9TNdSEh+9i3gYVkdKHgRW9/LE+tXh1EvIOMx5iwwcw
	==
X-Received: by 2002:a17:906:eec1:b0:c16:2a6d:86da with SMTP id a640c23a62f3a-c16b48533ddmr153955566b.54.1784306516701;
        Fri, 17 Jul 2026 09:41:56 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:56 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Fri, 17 Jul 2026 18:39:14 +0200
Message-ID: <20260717163959.714561-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094158_805224_B5BFFB8D 
X-CRM114-Status: UNSURE (   9.55  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and their order is different
from mt6589. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


