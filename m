Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483560A3823
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NmuZ8YZI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xIoBe2kv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=; b=NmuZ8YZIWsV22C
	4hW86Tk/mqp2NG1myHgiaqAeEB1D0T8Y/O+6sIWRSqKnO+3ZfrpXjUAtl0qNkXWNwCVLACOzq5Y20
	lBBcfsSTwz3BZ8tDfPw3H374Q0eVMcGNGVUigmuoDz4RKlBheG8s0OSmnkQbihIPUhMwnxfj1tXcF
	W8HmQ0nZbOTr+KW4dxn+KSDZR7Jy2dz6fo8Ie4FX1QMQW6CBx3xdh+Kef51xKwHhm7GS884LfzdLG
	kWX5AK58VLECuttJZvZItD2oTodc1RaBqMQaNIa9uN2dv6PkagMb+kqBf53R0x9TeHL5bj+4AD7ng
	v12UxGH8rYT8CZcePk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd0-0000000E5mn-2PFv;
	Fri, 13 Nov 2026 19:08:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcq-0000000E5aW-0sd9
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:53 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2607061a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596870; x=1795201670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=xIoBe2kvC5kUyFUOr/xqBA5aN1HZwwbbTQNZUp975SyRTRm0zulvB7tYJG3Bs2iyiA
         /rru693yGx8t7Gh64H5FSrSvY6MpFxUa6kaRSA4QoSD1tp14ZgJcicp1ft0cq0oObHPV
         yTiXcq2QsTvkyUJX6wA2NFW0rAxUjkB1NkvhrCIgkS0gdvxpi7dxNGKH9TigYXvK7K5k
         4LCD9Nv21PTSku0c6LIfxj14Gb1qT+i/W/QZ4IX0lcez2PLTYtpF8klSSJzu99Ii4vQA
         1HgGmLZx1QpsQxdTkdkKrQWgZAzQghjlVZ+vMEKc9LUKU4fWCBcYCBkjQlwmUfbUad7T
         jh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596870; x=1795201670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=Yev7vJS4Nvhc5mKViSFihb/emRSVawKc1kfAA3VBamZGAkEYWrSa+rJysFiGg/tbT7
         pMNLTM8Ypbtvz0DtQwYjgMRalPKz780mNGxKto5JeyrJzLFH0IAPR7D7/mhZxd503PNc
         Jzx2z78s23RhIJaiKqPAlxkxZP0WyPYrP/hDBbOhsC71ooi892wIC/ft115768nTGt0a
         XUXQSu09RynifbiyJ/BDcnzo9EPcb2PXXL1y0Jn9EG+ZJc08z5Gquh1z1jK04gZ+BMnz
         76YSGqDHecen/xoHL/P8NfPjytfWxNGhHZ5o8ZKP+uHwq0sZYxsEEfu5rpOqCW4DDSNY
         vhtw==
X-Forwarded-Encrypted: i=1; AL+hErGJ5oWD3Y+MFY15TYcVqvtjZOs7PJ41VMleBSx9EWg+ihOGRrFdjjZ6l42+tQuWwhwPdDCl7V55BfE8tdljbg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+M775/MVHo/KOTou4zUgNOKnYhm4R7KMTvX/nABcfPh2jwW1wq
	KBcPzliWxWgs3/H9uQemmQBqfWkZv0Z27LxNmOgp2axV8f7DUptLQvOZ
X-Gm-Gg: AYBFou1jIxwYTePRkZJTPlkktco9opR48zI1vKEapObzQI5BLyDED9i2TOjd9YxGjWB
	fxw+rk41AFHESAE2NBWVXDK0gJkErjOkXD81t+OlDttZhdsTj8kLOcWyPcWRGOeX4TAAh5pq7gI
	cgQ9RowepWV6tsWk5FyTaaStzMjtdLGOYLMege+uHyBr2t5s4kt/0EBBcDK0/PYZve7Tx6ue53k
	zwaRW6XnQ1KNoRzi4my5igVTXn1kT78t4Ewjqm9Q45p5SRjDMQZzQW1STSsls5CCZk+2u0W1/3C
	+NNmDfm/Fiik9X+t9B/Y3fxWiH7qIhpAxf/ZyzvoLhnQ6UrIKIvocpSdaWYZj4peo3ZIeO8eIpk
	ZoBOd6cxcMEaSMV/Nsqxf3HrHcOEs21ViwOcYc9p7zSzVuVFESb1w7o5E9/MTYi3xo2VegouFK/
	EOCmTQnJ8q4iyegjdAZNkdIzWt6lsBy/1sDnyeOSkxajEsFDEhm0esj6l/wqEw74Qw0AFkvO0AL
	oMnGplsb8snmlQv9Cr9UQhoZiAGjeIpShTkKUYtC9+ZkMwaqOpce1WEzgInvG5cyiT37JD6TkA0
	HXOXqqkzIQwmuz3M0OqKARtmPAdO35c7Omrs16jBtK1Mk6Zsc3OBJ6TWe8FS6jnb
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr389984566b.24.1794596870123;
        Fri, 13 Nov 2026 11:07:50 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:49 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:59 +0300
Subject: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110752_294851_D2628868 
X-CRM114-Status: UNSURE (   9.65  )
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
known yet.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8e8991ac95ea..d0a73b9c81d6 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6895-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8163-wdt

-- 
2.56.0


