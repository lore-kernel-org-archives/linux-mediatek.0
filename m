Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D2606A88C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lco8C3Fs;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S5Uwd3Md
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=; b=lco8C3Fs1BPR1FFqJZBlzeU8/C
	tOosZRWFueb77D785fmDppli96zD8/p+oRLMq2dIsueO9a7hl8scHk4Z5qguOYxGWYzq0gBOAEVHa
	Gga/u8L1FiABpcacDjLGFrJG5OYI22Xr33I7c+cW37ybJWwzL2mGUN8zfRd+QutLIcWG0yxt8gAqd
	nfUF2trN7+qPUI6Of5mTXcBrt7Kt8pU8Qw4/pNq1vYZjutVpAprEZsU63ZhvVEn/GP9kaKE7LuIkT
	y5BBzJQ7eHKmYgBt154/AmoThebJkRJHQ6gnea+HcDtZNUBDBbTTFdcEhWNs6ao+boevueFQYMh1w
	TM0yRxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0LI-00000003O1A-3v9b;
	Mon, 16 Nov 2026 17:18:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0LG-00000003Nzs-0QIb
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 17:18:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso38799125e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794849484; x=1795454284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=S5Uwd3MdiZXmaP+Gq/3aH81x1D+00YSwK3Wsrgc5LvX3Qt7fPaeRpAdWyAe6qEdjT7
         apoxH9tkzqebvVU/KCbaniCnEwgb/08Rfi+98IjETi+XDkvtkbpv45g1W0SqeAAbeMAQ
         Zw1Ifs0ekMW/AC1PtVaaJWJi5oQVrY45kpVemWrAFhCbf90PpoetX9dDE2NEuFKS3kuI
         b7aRfgCiAEbuGXhzsfX5jnsv5Riw0b7bvxKnQlcQZMuDNqEEw4TaCnG0c0AL34wtDgE6
         tb3eOv3yTkNZSYWVeMw2zuTmcnQMglX7LWOTOdE6Ju5XEBEj9YWuDln4VNVrAv9s/6gS
         STBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849484; x=1795454284;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=wFDrJTz/uHrIfwLyolrov6ndBfedGGo3qgx3M7RySaLm+aSRfnZ/wgfQ5UdfpHKlOi
         lXplLpCW9llXBhOzXFp3+fSBJGNAycv0ohNIVukf73AJedK4OQanP3rQ0Qnpwwn8WHdO
         rsvAFo1R+J7Px+Vvg+SyLZfizsfqnKoYZ8PPYfy1opVHyl/0FRCdDzQqqyk+Ysnq/3u4
         dxQgafJ0XafJ4hL96mcSp4Muwj5CfwHieofk0j/t+rc3b7TYKeMb31BpIn3VKZYLpCHW
         tzjTUD1Du5kt1A+sZ06WW9shy+jtcB162w8oRUFwB6JEReUE43nDbByCEAkPoYaCfizj
         Tn7g==
X-Gm-Message-State: APuU4Z9GqbJlNvWpQ4QhXK1PUhoRB05VjxN8UNX4+Be+8o3VJsV+Hixx
	lgUjCfdcTlHjjvkhqt1hohSiw3AiRSXBIRXP/YLFc47Yx/uuJRUUbDTuh0SghmksfNc=
X-Gm-Gg: AYBFou02Xbz3pVVtSh3Jc9P4utIPPUllcZzjKtjnOaUyP+dcm+Kz5sKKml3XGmmChzO
	FE2p+1+yZP/WYv5d9iQ88Cmg7p/MUg69zVN4Rp+8p/XB+gTy7ujT3OxFwDo1HLAuFlzd4YGe/Qy
	LPFWd+oigmQdnRCfuPjuCrQ9wPRicHH/011Zm55ZqFkxstKJ2phZttYaJpvXMF9GCX1VWa9GMVf
	NZm3TZQb0+57OxBozpk/M99vzrZ+4Zpk6ohO5bCw1Tply+CCR2EB6ReVhYApJvoHThWHYKD5Iu7
	9EeHsMDzrtGsuj6CYvv+sSkOS2FHE19jqukzk8vEHp1Gh/vCGFdpvx3xIkZ5KAKXEIBkbaeTNJZ
	hr2iaFgwTvbhLz6FZckPUARZt2Z4KBtAv0oY/C51VhV4Yuk9r4g83Wx9d9bqXW9FDrTJvZJjgMG
	U4qjthVc6urS8l0fQcopsQDA6rI4sDb4wsoiZ5THy6NewMDiWFy/vvc19KvGqiA6HY+MEZWlKeb
	TeMLE5MseA08qybpRUyVlM0XwXRFB/SVBMAHquq0nAdgIlZu9D0HLWUDevukTI0y6YYgMpP7hnr
	h10FtSP2Z3ZpV5Qyplf1PggrlILfgzQCKcoYNvSZXjltESStJV0R+ShWA1m85DR2
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr134923375e9.11.1794849484047;
        Mon, 16 Nov 2026 09:18:04 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c255asm2418175e9.13.2026.11.16.09.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:18:03 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas?= F. R.
 A. Prado
 <nfraprado@collabora.com>
Subject: [PATCH RESEND] dt-bindings: serial: mediatek,uart: Add compatible for
 MT8196
Date: Mon, 16 Nov 2026 18:18:03 +0100
Message-ID: <87zev8wv90.fsf@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091806_154669_BB204D20 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a compatible string for the MediaTek MT8196 Chromebook SoC,
which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
This patch was posted in June 2025 as part of the "Add MT8196
compatibles to bindings" series [1]. The timer and i2c patches of that
series have been applied, but this one got lost and was never picked
up. Resending it unchanged, rebased on v7.4-rc1.

[1] https://lore.kernel.org/r/20250611110800.458164-1-angelogioacchino.delr=
egno@collabora.com

 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/=
Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..bf0b1df449ee 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -49,6 +49,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8196-uart
               - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
--=20
2.56.0


