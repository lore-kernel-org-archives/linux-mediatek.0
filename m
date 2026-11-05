Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC9C606A330
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MB0iEi0p;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOBBefG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=; b=MB0iEi0pEmjVBO
	A31tAwz0F4auQ0lwJaUdEDMp0D/Rkduy3BOgQQpmeMxlrK7LwhRyazzvVT7f5oV9zZESGqHnikLu3
	UR9mvwqxWrha4W1I48CFexS4LgXR3eYeWYwiLOwiSR2Z+HX800wpGmk2br5Vnodx2u5m1sv93u8YI
	qA+RQDbpMxkbRb5ci85ZGT5h905ehSb8+QPuvBIXY5Wpat19UToXVJEecDVFsg9e68gvY3nddR4C7
	rBuO1CLVRvVlfBNHjUoy7LjG+AReF646tiSJwcomf4FN5ple2+/B6V4erqKdnkdHAHCMb8KumcIy6
	mJ3FN0ILDkeYsPBbT5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gW-0000000AgKC-06on;
	Thu, 05 Nov 2026 21:07:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gQ-0000000AgDX-27wJ
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso183903a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 13:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912861; x=1794517661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=DOBBefG2LMqbUoIMDtHtG4B65QeF/b6nvgULevZ1OodAlQ5PEJhqSmLUEATs9FbYjY
         4Sz3WtpYSKM2ftW3asCZj+JY9O3+JLhx99XYEShJjALwIQT47plZ8gK+auztOJmmgpYM
         w4WdB/MP5Wbz8tBeA3tXX2pEZJD+S2J0niLBQa2jVdVDT/JGzZS7QZCuf+4MfOY9TUNo
         yHq8tVqFufBK/De5aOsArUtKaA6EjFYXAOk3/P/1w4XVJcAbfmc5bkaal8U0Ae3M880p
         lNrP8mHsoLUcQN1nNeKeLJiRkiohgsX56iWZw/wCk2+o9mWVlgQ3MYTd1zQYr7atPRfU
         UQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912861; x=1794517661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=LGVVppYxTbLWMIG0oHv65/P51jnPor/Y+j0A237OVE3Rqa5g3afJoVwW7ZT/gU4GB7
         i1dhkmRa2edDIBfpXH6QU/ednKHJUFQzxmwwqyjfYhXfJdmmtROXhJX4B5/qGKLxJD21
         HgRiSGKr/TMnGcxDGpFgFqWhYbc5GO4BiuRRVDeW4vWXXQnJK1RA6TDpGXWa7oRwEtmh
         u/NNKMkV5+X21tMdN/vQol1iwGUA0/d1TJWmjxDgPDgZ0Oc5aposkZ9o7MLlnUixIKzy
         VLO3B1sIletooTEHVDW9mjjEfFjA98WDgk6bkiHkp725aFuzBGzJ9FgPecMlYUAn8MzH
         3i/w==
X-Forwarded-Encrypted: i=1; AKwUvByYaTMxWuDKEzBAE0ypmN+1xk3aZjUvfrtVTvI2dwLZguF5S8z7fcBUlzxXmRCz832+cLZaW8KdJRtyEvzVJw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/V5T8wP77lgXqtMU1wC9w1hbjcJJAMHjPsW7ve5OFNDziqKy6e
	6cyDmnsfyVe443gggP8idNnQ8AnwLSmSL3qOBhBHDHAaGaw6TjRr3tId
X-Gm-Gg: AYBFou3ouywb7i+YEVeLmfwifgNrkEDTyp19p3w11jUTS+nrFUMY64/WaQF7uOmLV0L
	eVWtGNaHJ0O1qzZFKkLNfWHUrWRGVhLU2WWmu5+AZvZZ78fHpPZosIEoeolWjNUYRpKPrwFKQOv
	8+TrpVHaWri1g6H7zomOaU7xS7PP0WW/GB/kZtgheknTAAUDDcKIw+VO1xzN/26OrS1XMf6tSTM
	ZiRuKuWIdeDTLrCncZfBXnvTi+YkE4ARSEQo/0nF2GEqEIkfvEtH0rqoYIV3IXUg0G5jMOEVhzV
	9mKUl/Ec3Yyt9/DvuFDwm6oflceHMR0fDUVNcFKyIU2rJ85l8c0hu1sHaOihKowO34xsPNm+QuE
	vxPzFhMIaAGMWvWxeD77ekKO1BmbBk0eOSdWAc3+qVZ8q1ZNiRYAnBhRsMiFpousjkrF9xWSrMy
	DyIv59PnuPddLegUfq8PSXaz5ZaSFTgwwgChYl0PURJ0BfaebbR33f0By8CHv9rnHQKSDXcxTMe
	uN0Bo82RX0jD3rb9SDlVSIf45SYGJEh49mN4cim3XonPSCCTSHzxbRPDfj8SsgWhu6wvUniKxdm
	OPBTGKZexbf2b6XIuuomAfKd33r1vt6/9u9qUrfwTiuZBn0dSA==
X-Received: by 2002:a05:6402:1d55:b0:6b3:d0a0:3a2d with SMTP id 4fb4d7f45d1cf-6b5975296a1mr338144a12.1.1793912860655;
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:01 +0300
Message-ID: <20261105210622.523747-4-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130742_665659_2186CABF 
X-CRM114-Status: UNSURE (   8.78  )
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
(Dimensity 8100) SoC, which uses mediatek,mt6589-wdt as its fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c27..cac7d9ae98dd 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
+              - mediatek,mt6895-wdt
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
-- 
2.56.0


