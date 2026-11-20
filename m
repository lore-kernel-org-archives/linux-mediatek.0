Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17B3606A337
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMs2Wz2u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTEbP0Jm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=; b=hMs2Wz2uTbB83h
	MlM3wP+8qZ/hXuj8ftcSt6RWALPFAX3ZWADQeiZiIqtlIFJXx8nCjXLTDFzeiUZMdb3olIQGN8TTa
	gLtPd62kzgVSpwnJbZ/7ZWrbB8kSdejpBTFzblePbwOQGhsZ8j2vSNlUMvYWecZRFqGD2MPqSMU+a
	q5ouPMKt9uVnsTzl1hzUhIhgqifGmSCs2/B454AGUlh+4E6TFjPKcJ+I/u0FZSchBFf1ANboOH1Zq
	zvZX5DtAcvs7kniSMJJJ4j4ped1KzOBvmuFDVA3DNv1Eo4+PFW/TqicIQ+X0Q+Z7sBzXR95j81P1k
	CycZSuvMloP6MV7Q49hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoh-0000000FHrF-2iv2;
	Fri, 20 Nov 2026 14:42:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPof-0000000FHpF-0AIx
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f04e3bf46dso4225875ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 06:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185736; x=1795790536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=DTEbP0JmcOdFjq91IbKNm7z0HISjY8KnB7preyMT/6UzCU2QnoUT3PDsyaRuB9Q634
         EZoOpnf6oz5kcRfvo5h3gbpsRgR8/H0RJ90fYRrFVBz01hVF9ov1TG1Qege1Ms5kzkYT
         DIcwqR4aKyqy+owNXCqzGZNu3JGzL/3nRDAFgLReMu7/vWl/59Eaj+q/qcB8zyOUcGv6
         L6zLpmnj5NhXR5KWF+QBDFqFEGjE+LwwSJ23t9vsXUC1tsHP+Qri24S2o80m4nR4JV+4
         TNkR9nS/LA0yJFvlZxpGumrnhhewVTqMNw48JFsdf/sq2Jpp40kfrcKHwc5LW14Th5Ky
         X68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185736; x=1795790536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HT3eyIKbaAFdJAsBCyUUl9qOeHC7n7o5AOxtBcK4VMc=;
        b=XGh74rCSdYQrQTZwYQki7PCMNtR7xccpMLMwuan7ozEStSFS2/6ec5TXuTlLwANqen
         551we1OnCjl02KRsp03LmBFMIJAuJ9QiXv2dDE9rlTt160XMdFs2rqbMggPE5Fgoq/Fw
         IlfZvwqEBhXhLvqwbK4tGNcqD7TQWSWKI+X/Qge6R5ByLklNSb769PLThoXXoa0cF1KX
         cF25jZPJW9Op9EXFFf/5fxZUI5rukVXF+S07JnUUxTF6lceKy7qRfEGxFvhRqII4ftbX
         3zGTERE/zh9tJORYsEjLb3ZLHOD2/fROHL8lMVygqtuZq7bceAWB5uPxkqhjMqNkT3TI
         /bLw==
X-Forwarded-Encrypted: i=1; AL+hErFAVr9xXQnMK6FZrS6sJRyh5fkfl1k/qxH5GZqg/JLZi/koXGue5IBzU+NGNu7NXc6gFq16CUnfE5oJMml3Dg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/pQUh7DQdJhH50w3kI5IG1MYMQg6nrCD6jgZfVtjhxq7rfollm
	pznvx2KWX8vcoFteiW4Z34y/SSn+xlayyKyHlaI7DJuQNf1ERB6mTDWS
X-Gm-Gg: AZFdTZfszBDsyfboUZSjHpcpfrRyODoHNbmupbhVgALVPsn7Iujr+GViBH7IefbiN8w
	nUdgJeDFF84XcrjBzFqXfDK1CzHsWss3PoH5J63v0SQ377zSxDMfolik58tEfpgNBVUoAIp6UOx
	oe40DaSOgHG0aFjp1onZsU+UO0Q9ZlpM80lwdCoFhGAMhDYw3t5h1cksGqs+hW9aqWS3j8L8QUh
	GzSj3uBseXsOCuT76YlNkn6UPWFp7gXkiAi7Itq+P8QRFVM2xaj0PYUm4wfO2We4PW72KHHlEoA
	x4t49uNWNH6oV6ARSn/SI088G2zMGVbef4w/FaebcxIy7BloFigt8D7hSWdmknG/YN1tk5ZvxY5
	S5+6+aHxBfWzTd2agTAUiw/PrOHzktc62KsI5OxXEAaxtkAJMyUJYCy78ZDCHUFAlGBRPKxekrW
	EHTLDC3JpsBEcYfoPAjZEfZFYihfmsF4MujLVxgFYi48vDgHnrJT7Eq5ZFpvCKNlni/brQ4TMBe
	MGuk/q7tDY47RPjDKHc7Cefx5+ggTh58ab50uQBO5NEioganzFCLusYao39tpNwWYKjX6f3oCoU
	nO62ftxFvj/qz9tPxAKJj7jrlM1uo//Q4nM5yNd2BMUhWqIhlITxVNBGEY8=
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr3214938a91.58.1795185736231;
        Fri, 20 Nov 2026 06:42:16 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:45 +0800
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-2-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_064217_115070_4C237D9F 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index cff9a02e8302..ca325c21b9bb 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,6 +115,8 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.56.1


