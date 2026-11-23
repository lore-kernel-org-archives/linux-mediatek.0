Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E481606A32D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p1DEYNl7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Fr6r/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=; b=p1DEYNl7PgBim3
	gg1qwYlIXsIzy78qMldvjAqDqELtQg+8roCjZ3iJJl7J29ZtKiSHmIzkGl/vThFTseKG4r8l3jPGU
	BbPCTx3tigLlGHJpTObwTVqasx1+102/F9sNuYj/8EBHoyoBAzSyjJ40hnz5kuk/IS8cmEhbCNeII
	3/e/AOqzUEQSYd/hkusahcIveaJ62mTPckcNwrJN64x+s81KY03KgfZMfqZF1kk5GkjnYdd/guZqN
	4FbpzMDNxTd0n0LJ7F7qW7OmoTDTHYVgnmEBasANi4yzaqBYEHLT/fcREdwy9rL/tQC09gaIliWYu
	F2DdhDxkLwwrCV4PPaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS5F-000000037Dq-486T;
	Mon, 23 Nov 2026 11:19:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4l-000000036ma-0pTX
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c516a574bffso169800766b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432749; x=1796037549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=L8Fr6r/vLoj/v28P0dvAnwMFkWZkfZzTDvYY0k27j3EAkng0DEUievRXgK85tfHTcu
         yXJiTCY3o6gyUvYTAHi8YxiwnZdvSHBiPNm/JSkuL/ezDfdTOLNidc3yVT5k2VS83Z5w
         T7fOramX1CcVb3Ssraem+3Ud3CzDIHpZUVEvy3yHDVYGBeLdmdvLY/ZHplhNPI8s4Il3
         rlmiJPcmF+3FSy595EjJVX15m79jTmG7FqNsOHHuA8oBRiDGHBj4ZTVdlO6bLy8e/FGx
         18jvhCFYXuQ5Q+JQdrvt+OhhJ/I5Iog3rmxu4vk7fSdCKPo7+fysop43bt1Learh18mU
         YgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOrxHtiCHWTIaFRLN9a3XE1Ecmglqu0IREj6XPQBmDM=;
        b=qsOyJuiwGk2lCSTffAExKa0C+JGBwYM3ytXq2H17lCbN2k02gHkVY1Llo0Rla59VvH
         Gdzkc4EYk/DSZI7Z7a8LPisO6mHXn0ZqLk4FuuSAyr5Tk5CYCA7GikKBrIcQoMXdhFiN
         oRNVvu4BPdJeBB3NirIVk7rdnl+5a2OQM9dal20eZ/Cvbr8LbRe/T5onX+SPwOP8/hXW
         /y5CXKpc7ZWdoOqo//v+NT9YjG6oUjQXJg9jkxJ4BextlY8i8RAgiNjVBKOZBLo0lA7K
         s3tEzfvNqO6Ev71gHK8Qq2pXEGoXVWZJhD3oQnzCg+k2WSYax06e2jV1ncdglyDfIxOa
         9jbw==
X-Forwarded-Encrypted: i=1; AL+hErHVQMzY+cMgAXXx5mPziQ2sDRqqKBthl64LU74YoMib/zy/7gzZ6lUpmzL6z+f2z/Ynf2ZjGRBl8rHqOpL0AQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z82Gcn93KrFjqqZL6kmqOhQM1O2zBfX1dDHpZ+fpRh61Idn7hos
	nWNq+/y4Ki21ujlW9uwsn3k1ujeyGRSupYVvC1Va+ndntCd0iNo7hRNe
X-Gm-Gg: AZFdTZfoxBiWjOxji5auUpaWjUTJDlLqlO2mvn3wJAlCwMHM+K0D+2BzoBM6L4QjgL3
	9OZn1rco2XZ2FNQsd6ALcfwdf8Enkc7f58laxeTdoM0Se7SkUNzrhuZTi2dxW9wbrx5wweTV2Lp
	jnIfKlo933u+WlfRy83kVb6qYds7mPa09Ntnl1EimMMVKEWRr8BWhv5IMj3kIphp2uBRO0IBWwp
	B7JDVkdg2TvYBLY2grPlb0+EevunB1jRzRUPFakT07ETAnvumsDj13Gi9YzdWHxbBjNMD5GILTf
	VwMRctcAMRg1VNhlDtFdN7nG/IIM4U/NWbDtLuG7knzBEen5WMtSFthhINhfApJmYuwEASzYD/h
	Jk10nkT+CCcsU+ElKbzGYvl/h3Xc13tYX+sBbRXsNgb84NWv+mLJk/njZKOTzjW3CuyOGv2PQd4
	0umycd6UHBi1NEiz4WNGBQQfTlAyR42CghZ3qUS8DXdAD/7nZoR78Tv3UWkL0Rn7B7mrcMNbWSI
	/2YH9JdEJHqA0U8jU12t0OuoHju1nFNVbTS0IKbNqBRUx282sUY6vmR+zah2tfmTdIA2FFxuh/L
	HmSVa4dyv85/8T/E6+Kb30Q/vmLo0fAPHuy0voHICVcuRj8WGXA+tOcXbu0hyLVZvA==
X-Received: by 2002:a17:907:84c:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c513acb5be4mr952960766b.48.1795432749405;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:37 +0300
Subject: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031911_259317_96DE7302 
X-CRM114-Status: GOOD (  10.34  )
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

Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its registers are the same as on MT6779, so it works
with the existing driver through the mediatek,mt6779-keypad fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 9f0da1240187..9a1369c9ff4c 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt6572-keypad
               - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
+              - mediatek,mt6895-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad

-- 
2.56.0


