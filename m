Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EDCA5FFE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 06:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=; b=V32aZ5GAe4kwxSek0KyMpzXaQ6
	LzX4vq/1m9fXUJdoPdLzpewmLc0aX5hHS7fQBUnPLfIJXvlpnGtqUdD4YA2fN1diG7eDzPgnOHC4c
	yW9vPMy7A34SIRVqSJ+COimszFpgc646h3DBzdurUS1TvS9ajZBxWYje34ySydZ7QmtEUOJWticgw
	+ZCbg/zmb5fb43lH0BFAVyKM5H847hfwdjm58xFCQM3K7D4hXLzN+lGBYZdWfrD7/zCHbaKJf0Aym
	h0GjRRbU0OtHsVX3maU0MaDIxCT3srFCmDK07tf9hwBunM0v+e2qj3z94kRlox322SwGApW6U8hWj
	JKo5CGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt8-0000000090b-4684;
	Tue, 06 Oct 2026 06:42:59 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt6-000000008yr-0yvh
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 06:42:57 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-35120d43ecaso3584866eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268976; x=1791873776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=FKBcNmz1q2OWYstpNc5DBvtiK+EQapXRdDWSvtPWAk2nlfjnkTOUlszfJps3SkzLdi
         OtidBj0zV0rxGHmoPlTeZ1fmme8hEby8cARNdT/yuBPkfciwABYc3D+j0SMyweivI2xG
         /2+Xz2YHuW1wtgbj6dWkIr89hOhao1JQeLK6rzEqO/vR0bAK4mW/wHMYp6VLYbjketsA
         u5d1pmkdAShbGYPJWVHxQffZyzINHywjPDgrf+BeLpGM7BnInU3vjwWTW0soh4rm23+V
         XAB82GsQGpZQMpUxt5UsQsSobpLM5aX45jgeLhSpFDY4ec6TzKboMBj4H6qiTJCa530Y
         xFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268976; x=1791873776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=03uhcnOhtjB46eoI/wO6kfCpOJBQ+HMQhaLsAlTooH+m71Gy/HsnKhlRKmRnWj7Gf2
         LaPeGKfUcEoPx+ZQB3VtBHJdLRv+ZJ8yfJglW9vBWFWqMd1mVSVF15w+oLCJQNrWYX6j
         kTmUdI0a8FtGdnOu3NNIe0arZFWLOAr3LRsWrvpkomZ9zHjowI5+SnocXA97lI/SOujA
         cO2sF7xACncmgqLMCb3u3MOCUKP8139VvnAa3JILjVKub6ixNaWtCMcS0hdClfVuWSEb
         8QVn3N4iqRnLSThk1wr7oW96g1tHundbdh+dHEbUss7ckcEQbnu6JpDavZ/t8HKKVFPr
         Eb/A==
X-Forwarded-Encrypted: i=1; AKwUvBwlutqHozfaccCzBQHt3MMYpwpN/Ih7aRdZZlEJsxvbjPWrzEbu+mTYkEixLHZW263X8wFFlKqvjz+c7FnmtQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLOXZn2Yy5EuSRxYMeaXir+6z601kgJx4gLmogPUlBUGjlLcrtO
	Go4uBlQDDUJtTlu3wT1bqrBAJQjqUUgFBpHwztugFFM5BY44P/ThWdVa
X-Gm-Gg: AYBFou0eNVFYTxAAaVNpZo2ZxQPJgO4UhIzWohxPWkwNqV1Dhb85Z+fw5EKBvNo2Odo
	YQOzni6+gUXWhK5Y9N0vgQazcNr7RJxKJNeDbLnr/8gkPPcCDHIKyrxRP1cpO6HnNbYwEeF3OJH
	fblXDKfT2mRPcGIhTkINv9bExwdyz+Wx19LUKEb3I8ORFpPw+283SoOAfL2IvEl/fiTBHS+cYnf
	yZSLK1BGaAzrQsRODynXvLERHjdQ88EsHQGeN4gE4n+0cbT0kO0QK21X4Dv8FfOkQZi0BTSC3cN
	4J+qUTDB1hpsrOfyyzvvepQ1oLrASWV1MaOl8BguV6f5AYQH87nbJUrljUvYvvw7gQI+FSN9urX
	/FgANWLbVtrLljlAXgA35hLVYN6WLTmMigcJ/KGUhbX1jhXqc7q32O2T+rjrhfctT+3o5qF3hq+
	EAiww2mGD3pCEntb8xPIIBgZUw+IPTd3vu8hUeylIzU3xp43x7JXeNRMbIkEGjjfV8fhCmWiK7N
	1WVTAkb
X-Received: by 2002:a05:693c:20cb:10b0:34a:c4e6:27c with SMTP id 5a478bee46e88-3514e2a5347mr444919eec.18.1791268975568;
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:23 +0800
Subject: [PATCH 1/2] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_234256_284956_99E61FE4 
X-CRM114-Status: GOOD (  11.28  )
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

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..aa94a398ae05 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,9 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
+#define CLK_TOP_NR_CLK			110
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.55.0


