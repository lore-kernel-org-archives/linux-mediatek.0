Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8390606A33C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=005Dp6Qh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWWVxvis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=; b=005Dp6QhjXb5pZ
	50Ex3y6I+OxuPv3bP4Ag8nSSsq14IYrS43+AqAcXm6gHYWMLhiyC3qYPb0xcuPHB9bwDVqjgRmzuH
	fv3Q0yBqEBGoBsBorUDljJ31iKylxONHA+8EJPRU5F6AvRY6F1MbWNXav1Dd2sVWNYEKTPMlOSC+0
	H40dPA29IFuHn9Q4vb932mFBp5/IKDA3iWx1QHbSp/RNHmZNi0AHLa6Nhwb5tXt13oYG56LjnSLOb
	QXJEPA41PKpOU09mgtSfBuKbn+jhwik9BHdaxchpLzduWSjh6eg4fGd1BJAD4/t+D/N5SNzwYHvI8
	4Yt3t20ezho3VtRvnYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gT-0000000AgGh-1pAJ;
	Thu, 05 Nov 2026 21:07:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gN-0000000AgC4-3aRS
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so1919146a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 13:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912858; x=1794517658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=DWWVxvisHJB75ieyhbdqhIngUeb4toDq61pzzezLMWbemzJHEtQ/yWMow5IWk+GUAu
         fzgBve6rPo3iFJSRA6HZFg0KRilN3wWdRGEgyHF45W3lLHmRJH2MhZsR+x4IoK/NpCuL
         x5prJCxdfBH2gpUOv75M52KGoxXLLJza4Gdcr2Gr0z4MbkhsYW7rMuL1wZ2f14vguSa/
         ro0SqC1ICWwRKO5YIRyAZWm7pqD0P6dJnvAxPil1mKc4eSUB4Veu50skq6+NQRFL5oI1
         oD+Lzwo5KvmXmopLU9427bB6UALwNOUhYDUtQq85xarA0aDF0aY0GBVMIWakRn9hmVWS
         6tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912858; x=1794517658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VS8ybXF4DCq5tAk5+ls9haIcLFew0SWRjbxVZMJULQI=;
        b=gwo41C6DDSKArk7KLZcb9S+3iocHI5yO2FdsaDQDQZi7FOfwscDJX56AdQKKZLyUFP
         vFG2B3CRq7GoOu4vFHQ6QZ2eN7iw0WylBh5ogTypIG8Gqq3dA6oyF5+jGvFzTAxuqxd8
         ScKQyJkVursJBM7AKJj670RpQgeYtVtcbQUojW/cKhEGvI/FvyPyxFJmR1TpXHCnhnv9
         VoYjmVV4FeZ7DGOOmz7RAVz2QwoKCiGV2Ti6wYWyuozQAqq2mislmXBk5E3d+aikM5LC
         bMOh4PcWKw7WRHD+y9fHAYSZFQix45sk0RJHls1A7x85QucwQ6wzyjLMG1cPOeVMKM6s
         Dutw==
X-Forwarded-Encrypted: i=1; AKwUvBwMEdq9SsZVVaOgJW+yf3tAUEBxBfAqtc+aCwNQvAICcwSnVvMje/zcogY2z0H7vYdi+wWbMLqFEOEjR4qBiQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8T0aIKYXqd5T3n/jun3PiWVidMiHKkNNzIjkI/VS7PFxY6saX6
	YZB1WTRv9oTJXHoMXQK2yh0u2eUXTxc+OZ885uyqEXrn8XUlzFwq5B8r
X-Gm-Gg: AYBFou1HRjZDIYZiKffr6tbS7XOgyXPIXWFJtZq8RMMPBjzsbsnwP9jKhk6Ve9sWzpB
	Z8NxI5yP8lDwGBMvz22aIpzZSX+BKbpDU01jy+3pwVDMMuNPoDzpSo3IY7b09Re1D48OtYq2ysu
	q3uJhc1JrM/seX+gP9wpZpJ0EbMhO8ZbagZrB7fW15PjJqxQ9BrlGQNGF3ZaSvvS3W0KGXhNXld
	+qF42eUfTiQLuZ8P3oWDwsh1a8Q5DZiCnSSp57UBHXPJvrgXHixGDDlWta9S0MIkXe54Ic9RNz9
	L8y5wXFYEoxrkjMkyMqRX7DIFtDOEbywwJLVmBxk2YZhw5Zwoj7ZriPThBpJgFgQnP2hdAQDe5P
	yfGLYNrdf39V2x/0fSc5ha0e+EgLJUlFpQblRSXpAGp38O9o+z6aIUw6kiYmO6g02Q1qqhjPrRX
	WrmFyIhE2T0WMKIYCepQQcq2NhtVJcFu4NavNdkUOvOZGsHlvY07DAWcyFvR4fktH3eZUPEfds1
	3qM0qG0KP4vKry6KbZtN4QRxHLamF8eUcsfeeKuK7xMpfbWSKUnrQNP9TuarJfXZONwe1hg4UoJ
	p7AwLBizfVFSWMGrzVEzZaTRDvHVNRQjz4beJq/x7Z6siPmFyA==
X-Received: by 2002:a05:6402:13d2:b0:6b5:63b7:5738 with SMTP id 4fb4d7f45d1cf-6b5977ddcf6mr294137a12.10.1793912857834;
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:37 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: serial: mediatek,uart: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:00 +0300
Message-ID: <20261105210622.523747-3-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130739_905217_739B938D 
X-CRM114-Status: UNSURE (   9.50  )
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

Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
8100) SoC. It works with the existing driver through the
mediatek,mt6577-uart fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..a3969cfdea7e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
               - mediatek,mt6893-uart
+              - mediatek,mt6895-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart
               - mediatek,mt7629-uart
-- 
2.56.0


