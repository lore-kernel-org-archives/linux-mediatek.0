Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF00CF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3I/LHRTPLqJJONKYwwXQsldQo/OPnYwvoagC0qSu+YY=; b=k9yPixTN4jpW79towfy7xHO0nj
	LHDEd5qZRknVPYBXx7/guJjVNbcVS+cFz6lpSwwX+MMlxkdQSPLJV8KcQot3g3g8rpm6rQ08RmPS5
	wc3S/4mXOPp2i3vZepzxMTTyTlg31dKhr7XJ7rag0Sk2iPXirDeQ/KMSQn5uOXEWxVdOrvGJ0LEg9
	n7nPIDWmhcc+lYVwu5Cleddz87dnKa/bJ0m2c60/gphrSdH3IMkTAjRiFt9QT9C6RCT8/iNUpDjau
	xS/Y08OWy8UrIzV7YkbKSf+gSSIPQb/7YXuow0tc8JepJ0wQLfyZfm8znCmCnSCvEjS6Se4AemleH
	3mKu/ARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03yA-000000036cZ-2K0J;
	Sun, 13 Oct 2024 19:09:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03ko-000000034bS-0SRW;
	Sun, 13 Oct 2024 18:55:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a991fedbd04so357449766b.3;
        Sun, 13 Oct 2024 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845744; x=1729450544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I/LHRTPLqJJONKYwwXQsldQo/OPnYwvoagC0qSu+YY=;
        b=WstSTWlBjdU5EEBUow/qWivSG9IwrUjnM9R89i2+E46CuKmDXYFl7IiTV37qxmOvMg
         lyf82yAqtGsbk0NehWGPGJelJpLd2cP8UtiC1QBbENKBoljpC8DYJuy/FLwm+3gtzMI8
         11Xmn5BF0axGVb58cAXBJDM0LEgBWVrSzlsGg1fTatWWy2/UnRNo2TulTSWnEYbepUex
         yO+Fis2QbBKVCC/q44vd5mJlLRgIfs32hI0JnUST0DDV4CHneOCoBY4oNXHGuzHRkYMD
         ZpVEHGCr+bBxtQse3otCYibv2F0OznjMbUFjgy0FZaxcu9aecFg9q5FmXJ8o18y5zl5U
         WaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845744; x=1729450544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I/LHRTPLqJJONKYwwXQsldQo/OPnYwvoagC0qSu+YY=;
        b=NwJceU+ge+v5Bs9FIH/4Rv3Uzhx+XqH0eVWIjqNZHYiGYWOAy4x6kuFfKdNdXwUU2C
         eMuF3xZ0yEzoXc5pCrFaYyVH0d6m+40eO49B9J0RTGlcOw5BXUqM9IkNp339qGTTaYQQ
         1kUVgMN/neWT9LSauFPVWlyGY7zkHuZ7iEcqgJpGMy5TY6QnBG4S7DPvg8Zebqq6LmjB
         mRMUGNyr5nBMo7vRb1/D9ZN5yZt4n468HNJfOwr3+6dZ+tVfjPuMT+U6YSe+CWj1X16x
         pZKZ5j/UUJvsTPcPLY9aC4t7LWJmxbNcGY6uVO2GxMPfdABS0cl+Cfqd1phUQusRj+eX
         8jGA==
X-Forwarded-Encrypted: i=1; AJvYcCVP6roOZRyCqXErC9YW+OdpEITecSypj7vcnvqeFEChdcPhAm/I7iYFgPFw9d1TcIuoz7AaAtk8OtEdwP27v2g=@lists.infradead.org, AJvYcCXUAqcxTXcju9TBOia1BjixYjlqKHMlAsksYf5oY7dyLkET9Eyx5ZJMVSc8fR/M8UH5B5t+wAor8F3VJqHZ20ZW@lists.infradead.org
X-Gm-Message-State: AOJu0YyZa4x4gInA43AhwE8LtkXPDO9EsHrhGVndSrxScRssJAig+TeC
	W4EULoCp0PvthfGYf6mJ4aWVHeA/drjEqd9Kr+v084Sj8aI3CyLQ
X-Google-Smtp-Source: AGHT+IEK/qY7kO3EuTXV/jRfrEbLu6Bs8uGBQ+icVQCx2B6S9pRxxPh+utvTvacXCNe8KWGJaLv35w==
X-Received: by 2002:a05:6402:26d1:b0:5c5:da5e:68e with SMTP id 4fb4d7f45d1cf-5c95ac09876mr10710253a12.3.1728845744129;
        Sun, 13 Oct 2024 11:55:44 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:43 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 09/12] netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
Date: Sun, 13 Oct 2024 20:55:05 +0200
Message-ID: <20241013185509.4430-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115546_166953_F9E7B66E 
X-CRM114-Status: GOOD (  10.91  )
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

Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
the bridge-fastpath.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index bb15aa55e6fb..6719a810e9b5 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -421,7 +421,8 @@ static int nft_flow_offload_validate(const struct nft_ctx *ctx,
 
 	if (ctx->family != NFPROTO_IPV4 &&
 	    ctx->family != NFPROTO_IPV6 &&
-	    ctx->family != NFPROTO_INET)
+	    ctx->family != NFPROTO_INET &&
+	    ctx->family != NFPROTO_BRIDGE)
 		return -EOPNOTSUPP;
 
 	return nft_chain_validate_hooks(ctx->chain, hook_mask);
-- 
2.45.2


