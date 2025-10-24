Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC7CCD1A5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Oct 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=; b=iEqJZg3XKRq9RgsXNStvJoBNec
	RCcRdUx4sh9/jTZMsBCFW4c/90gBnoTLAfkURS/99viXhk+DnSkZWgBzy+UINjDVzSbWMwLIvYG5T
	QPZFG0j/j39gjDli9BXmvN6qVmRAhd9O+oEAaSnCvi5IWPmeI7fqI7cgNTU+0jIL+GV9ql0mpDr0Q
	cDle5qYkfjvOnPOlO9oML33tOj5F5m94PDUfqdcH59mxHCkpTejKBw561il1mYUj1bH4AAOiCM6ZA
	3WtOCp564Ko3jGccmdIxK+7AvEAwRtDdhmakaZjqjVTc5DChHMc8Amm0lPGAN+TNPOr7COsqLR/hE
	6AoFNZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFtX-00000009BKK-0OA3;
	Fri, 24 Oct 2025 11:23:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFtV-00000009BJY-02cf
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Oct 2025 11:23:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so6275715e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Oct 2025 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761305019; x=1761909819; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=dThp1oiZAxZTOC+aDhH+ILjZipIkDjA+fUmJX355SkvwCsTom2vYY7sqq+rOhywJiv
         TnVz1PlKsaMqHbn9tSFEMV90v4HJ68Rx3Zp/Yg37KnzIyQwR5FbnY14n/BtfqHQZ1YTS
         mwpgIrwKEJ2h01pG6VNuShLW+noXj344q3rN/Fg9Werjd0ezRTF2l2plWcoZ4uPiOyFn
         /L7VUW5w+LOALPw7TS1rm4+D+Zn65jsWxqmXNpLuMHPovwBEsK8rzGXxCTOqVBXEQfjS
         COXMiIXWLma11s4lI1dolYaq/FtbkepQ2c+DkQOoNCl2CEvaL9MkQAX3HkV8t9NPH5+M
         KC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305019; x=1761909819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=RBfPdzBt5JtWtOtMMLoLgAPfNKogDggibtPWC6IVCNJyZPP+cKdI8HY9BrDRbHtjx+
         e5LN7FWG2ixJtkDrrF3neBDyKK/b0xxexYqBEL0+TESebNz3fDPPGk5eMezO1r2/lAyz
         I+TTS0EoEyb4kjP0NwVNZ0xD6A876rerU6n791VOWvlRIPMdoenQjvFzdunYbhr3fDIj
         HjBQH/QepE6NClNX8g+9bp0ERzjQ1BQVw5phS/Be24v0EApMvcULE658aUL4TtTn/Juv
         LZk9nx0w0g/caitxKAB/NzX8xczkhm2DxpThmcpoT6q2ucAwz1YDc9NmIpcFbfYEIR6C
         etyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SWSSV/EdXPw2kTXdvxOWEXvt3YRO8egQz1OXvVODBmzcJNxQGjBdP2UceipOyXGnKXM1evFRis3ANATXfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbARpaGEN9200gjbWHU79FLEOSyFwZge+3k88jesOXrtvxEvVn
	SUYc4nLiXTXZzYiJ9I/81MlNHaEbi2Ny+FoI/aPV+EhCx+dCYkqTdnh0/oLdr4b0Msk=
X-Gm-Gg: ASbGnctAf3DzIicOFDWYI0J6r8HYglpkEMtBpqpO9MLE/LGctLlc0cllVgOjZGppHtz
	kD65EJ6vsrhB+zDTCfmBzAE8VvBLtupj19HMPXI24st9GSv2e1tErpaCsTwmAT1k5kVKF73KG9+
	/JolAVEP9REIHEaWIHcRCq3ZwzXKQuXvENShoATudHVcaQ1L1aMHrVCTt0XBYYvwpkR+squVLB9
	Zdhgs5IUvl17eE8Agj5+rHSy8zSihz+uN6/bMCrMAYkR3U8BNKA7i5YKbOb9hZ4BoDZ7gLf58Mc
	s1eaPPPkPkUzoI95YEvWv55I6UlHSycZFzu+WRsFkET36o/kZV5YnQG29GgRYqeysIH0O/LVzow
	D1owWi6vFWNFlZ1kMQ+KgmqQzRolAl14GVhrJnU7jwQWOL9ZUhJfF1PY6rdXVZeVEPvW/Z7NKC/
	Wm40JDMyY9JD8CU5gR
X-Google-Smtp-Source: AGHT+IExQzOyk4omzvi9Zz7XZjs/LOOnvxM4yvkC9gtz1IfMXQ9aSiPVkXwgXIxJvNBEVGrXMNkh3g==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr22219100f8f.33.1761305018812;
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898ec1dfsm8923611f8f.43.2025.10.24.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:23:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a copy and paste bug in probe()
Message-ID: <aPtht6y5DRokn9zv@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_042341_211403_8AC8C36A 
X-CRM114-Status: GOOD (  12.50  )
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

This code has a copy and paste bug where it accidentally checks "if (err)"
instead of checking if "xsi_rsts" is NULL.  Also, as a free bonus, I
changed the allocation from kzalloc() to  kcalloc() which is a kernel
hardening measure to protect against integer overflows.

Fixes: 5863b4e065e2 ("net: airoha: Add airoha_eth_soc_data struct")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..d0ef64a87396 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2985,11 +2985,11 @@ static int airoha_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	xsi_rsts = devm_kzalloc(eth->dev,
-				eth->soc->num_xsi_rsts * sizeof(*xsi_rsts),
+	xsi_rsts = devm_kcalloc(eth->dev,
+				eth->soc->num_xsi_rsts, sizeof(*xsi_rsts),
 				GFP_KERNEL);
-	if (err)
-		return err;
+	if (!xsi_rsts)
+		return -ENOMEM;
 
 	eth->xsi_rsts = xsi_rsts;
 	for (i = 0; i < eth->soc->num_xsi_rsts; i++)
-- 
2.51.0


