Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE9C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 11:23:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41AB6124C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 11:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A41AB6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LrnTWdkyyvvf7tvzD/ZlKjp1gCjUBlULHOEVge1yYUc=; b=ZEOG4mqLgkgY7WDDumgZzKOYm
	ARqgsuUej4TgKSb4mxmA+kufmVpfXQ1uU7HMAmgMZQ7O0+OTiRKcqTDwKY5uQ2S/UbnX3uyfsEXUH
	UHX06ufHWOjWuS08h4ENjMqyD6rYqxRu+T3ONLuVeOKEwNQ4P9rcrE14xUPQoxNreU7cCl6mib6HH
	3VdEmE0RD7UUSfMCSaXURgZfXNA6v3fACP5ozGEMGXM6zuD1L5MJzbrchb8xnsDJVrnjGWrSD9dTS
	Uo+iT/YLdAQ5Lc+G2lEvTnhzsbwz96GLjIjRLxK53eOLgwB3NPkQQnqWigol0TxSN6DPH3kTz2L0n
	posTXhj7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lixou-000XET-Az; Tue, 18 May 2021 11:23:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixoY-000XBC-3p
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 11:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oaLFELdmsSuj6jGUpLjdC3C6Wd7IWhp+KmWoppj+Ots=; b=0e8KI1fUcqnqRXqYodxurIfK67
 W2npht8nBkP24DMzOEpnjkEnq2ntvuyjE30minTPG8GN+E4ZGglYkYfTfM66XHGcIsQVYf0XoZg6F
 Syyop61YMnKr0rRRvSQmMBQUamhOKp/lWNVXLTXJHa2wAlSnsws+U0L++QriXxtRJpGGOITJ7Fpdd
 1s3hwabasJM75pZPgtJC9jau4TFkeLZpmXL+miqcQLh3ADZ4iaZx948Up28gOVmyl+p2XBgeJ1Vm9
 BYEQFWLIxRJJW4ldsY8cj36sQmbVEv66KjhFzc0aJX4hXsGbYv1FVssclhPAW1J21yAB527gzai0m
 /he4+MLg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixoT-00EbC6-RM
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 11:23:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1378999wmc.1
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oaLFELdmsSuj6jGUpLjdC3C6Wd7IWhp+KmWoppj+Ots=;
 b=VKSM0kO2iOln9CQUfzNDIsaTFKxbenOaoUvS60FBMhhB5nYExLkbpuY82iCC+ohbQX
 F7cHamO4ub1tlhjaLWntbt8A677LWvQxZWIWTWuKA2x6L9yFn+IFCd43RLTbl4mW3RhI
 whmFtFv3pH0pvFuKOKFL8HveAo1pQPXXjIB1/x54gENVkwDGlwCPT4H94WN3/B4dm0V0
 U8iT7kCQ+m1pxzgvAYMYqIVbvl/I5vB22MaaAJnGZdczQh01NYNY6deiijmc6zJNcgcb
 4fx66hXYMQzIfDyZ9mVjCtIh7T/bpJkidlDjcaiFvK1kVRsDxzK59s29Y7sfTYt7fpcu
 AObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oaLFELdmsSuj6jGUpLjdC3C6Wd7IWhp+KmWoppj+Ots=;
 b=lppfC82B/8sSXxr4eUkn5Vl7jwsC/PfLpbva/kjo5/3EcWRz5jHdGg1ZT8DG9Zu2aa
 sz5c8a0ucYFCy/xG3LcIjU0xxW8w/6aE3lYa0A15wdCdVqcXrU9aMGyjr39W3pzyeyE2
 oH4BVwXEVhTpLAPiHGxAB2dpdP6hTeIi6WHzz4e9Y220bBGAWeJEUv4jO2hXi0dBLXRC
 t1S2Usd4I2xnxGWVlD+shGOb2jQuXN76CrA7Sqw4gnIPNk2bwPm409aLKrMqJW5ha7me
 /sLhDjsqKkUCP9357WME4zSVVJ9su59fkl9tMzYYgfswlVRi43MZ8UNVsgAC7T7BhhlO
 Nxsw==
X-Gm-Message-State: AOAM53129dOEuf6ksT+MjjMWjayhuN8GOvhW3rdikrAjVPVbzI+QOgWy
 HMMDauDR4+01GHBkuO2t3qbAng==
X-Google-Smtp-Source: ABdhPJzl2Utkm0LkpJMg42RFFaMV0xPUsR/PlhE1Hxe69g5OBNLG/XNR5HueBpJgHnFR0O56vHEiXg==
X-Received: by 2002:a05:600c:4a23:: with SMTP id
 c35mr4408392wmp.130.1621336980047; 
 Tue, 18 May 2021 04:23:00 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id y20sm2881337wmi.0.2021.05.18.04.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 04:22:59 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: rng: mediatek: add mt8365 to mtk rng binding
Date: Tue, 18 May 2021 13:22:50 +0200
Message-Id: <20210518112250.2146819-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518112250.2146819-1-fparent@baylibre.com>
References: <20210518112250.2146819-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_042301_890687_0D6E29D7 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add RNG binding for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index d9731f0ae47d..ccff10b27f73 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -20,6 +20,9 @@ properties:
       - items:
           - const: mediatek,mt7629-rng
           - const: mediatek,mt7623-rng
+      - items:
+          - const: mediatek,mt8365-rng
+          - const: mediatek,mt7623-rng
       - items:
           - const: mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
