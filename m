Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E2EC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E0161166
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0E0161166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDjU4IDUoLLEFCsfrUJ7z79jKSa7H3owNfsNzlYOw+U=; b=IR3h41yrjkq1mN6uymCK8pzxM
	RFirTd23Mp5mJoIRl66slULYqOCP5JoY/pofwsZb39DTRVDI5K/0EJVMsylQLWxAh/T1X1hs3EoOu
	0HXwnRh+CoP1V2iRdWMDEnXlAdbpQh9+VKZwLP+rshj6QGxm4wV1FI2EJq+5kHJWcTC5WJjada3/X
	7OVRd1W6ZR3VI5T87+x4S9ViHExi2LdbYCud50UR3hcROtgzPFURtqxVwgTD5goUwpUn6u1m4EO/O
	hUxehQs8e/HMrVIDcApZWqPz1h0fbEXZ4QwOazOGRdOCjhII3KCVF+vk+AjM5Qqap7PKhu8uJLv8i
	sQM96W5Dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjLR-00DGYe-IT; Wed, 14 Apr 2021 17:30:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKW-00DGQt-Da
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=; b=eJsrda/+YUPFEYcNxvWRrZsKAx
 khkfSkTNyH7+bwEK/irXl3AHtYGAO+zUyU1HQ3XXvgBdCmt8hm21FyElN6Z5w6tM/zt13scrdle2I
 gRQW72dtYeu52Wm/s7pxHQ3MmtoiRhvmdYgIe06w2Yhm1GFKvKOo4XYP3eFLQamkdfpe/eE4UJm8a
 +bjIPSiUFpbG5gAyNndyJjUwkLRNO1FSGps1Bfpu61hBpMaSevLt7FSof2y0ktfstvw8XC4bCV/4G
 uSAjJX06nWg0HMdKlWcrB47U2AniGJdQlDeILYD/I00PR2oBlCE/FKZwVLsBL6EP5gFeoG+BYusuZ
 fjeuxfoA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKS-007yaD-Sh
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id y2so10522089plg.5
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
 b=I+HzJNsWwPu+FB2uLUNEccOp0IOpNLd7gjigdfWKoW+DkwAVBGxH6GGl4TCfcMoszJ
 xRSSk+Z6mg9TI3va5vffbfIW6+DPVXdqsbzrAfZU4eQkN+wxC7jtCncWq/8r0rTElKO4
 o8YvKWheqTGhnCuUklNdzVElOTiQliz9cKSx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
 b=roRmtHiGpqEInR/wfKywutKBUypOe+8CnRxVp81Cwfhb7ekPgUkjF+ZfNgji7gQzVy
 gPykKchoK9iO2dpLY9n1BlPJOtBdjGJegh7bLto61ipdyH4RUfHbbKqyJjiEssUCGvkQ
 OWAnEzYL3NIYa0joy+De403RyLb/D/jFiy0qdhGS+9rEXfNvmpJnxk2A1HmhJ938e5oA
 rvUXm/vIrfajgHXpWR9bxRXIjM3birNd9jlgz6z+ChLmVPfWmJPN3rlohCYhIs+C3rXR
 6rL7k4ePLN+rZexwFRu6NE3VDjxbcwE3zxS8rghPaOI75fnWblWDxVfWj+KITBvatxQF
 ngPQ==
X-Gm-Message-State: AOAM531SXFImmPhbj1wp4uYsTkChSSmksSgpc+MkRQ5kc9bTYYu0kPo+
 ttxcs+9gB/GurrLu7NUUlkXCkA==
X-Google-Smtp-Source: ABdhPJyKkMkvbglTteDlYjGwaiEf42P1VA/e4pB2K1gUgp1BeKp2w9jFz51WnfyldOcx2B7bgOvJYg==
X-Received: by 2002:a17:902:ea89:b029:ea:c781:daad with SMTP id
 x9-20020a170902ea89b02900eac781daadmr23289889plb.62.1618421368025; 
 Wed, 14 Apr 2021 10:29:28 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 2/6] dt-binding: i2c: mt65xx: add vbus-supply property
Date: Thu, 15 Apr 2021 01:29:12 +0800
Message-Id: <20210414172916.2689361-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102928_932089_E214967B 
X-CRM114-Status: GOOD (  10.80  )
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

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
