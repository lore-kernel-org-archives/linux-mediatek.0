Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212ED60A5BE3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KuXoPkiS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po17BGze
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=; b=KuXoPkiSEG2OmF
	wMdB99m461L8zoFb7bU8RK4Kx8ka46NJGpcFPvn+kw4p3q0EMFutYppuz1/5HtPVyB8p2I6bGemnD
	8PvQVNvAS9qdRXbBiGPrcyA8L1n1uCpmCmVX88zbQQV54hR9qgPVlhJql+Vr4zZyrzWi3J3TMZqOC
	nxx5Wy4nYwtkncxotStYzTSGQcEFc8hVzy+Nzz6rGhhAUGavUiucOzrm+8DE+rq0aUdCGz4/SqXnL
	ssG/Qp2auyKmzePO4csBFd2N9a0te82/vgHhyn+ksDKFf1dSkdFQstK/LfCs2daqfNjNwM5xVHnvT
	8awnB5rUyWbO5mMa8j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvZ-00000007OBc-3D29;
	Wed, 11 Nov 2026 18:20:09 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvS-00000007O6X-1WCu
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:03 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 46e09a7af769-853d57a81easo781610a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421201; x=1795026001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=Po17BGzev8Tugnr3GhBI4yTWhQn/JvsXTLNHAYs7vO6DeUX04YGoarmXfVaw8/Gb0k
         LkXCDqPYCPJ98rHCl2ml58TSm6cTgttD3P24wNyk8Pyp/zB+QqUoelP0hJ6vxmNd+5GF
         E+MMxRL7xBMZo9JMjWCYtjuK24Q0WznxQie4J+wqFpyk9Xx/79bYey7CCDdpQuD8Uyuy
         r2PX7F0S8p8gQuoWlLStGFhlUlQPzls4kynnJBAFvS8va72hu3Lq4ehjeoW+ibjFn6xB
         2/4axroTSG3olviCLTbihvltbYuhgNjreqtYhwcsX5R+ZNC9wexjnApCuc79LgVY8CQf
         PsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421201; x=1795026001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m/VREGa9z/FqTFoaBxjG4HTMPo9NTrNhMinLMVIAr8=;
        b=OuSbdcH/HskBd2450dRxP1gxa4xTJLWB8sucDV7smFR/6VqTLGLjH62WlW9g9RhDov
         KZtQ+iv4UfMHzxshKWTC0r2bH2CM4XyqN80pYpEOiXF/vrkMSce7mxwsruckMTl0nKfu
         kcYt2oyzDWSOuuY1LN+kQws/uylLiQRS2yx1b1o3AZZ9u+F0IhCtg9q7gk6z2eLz4Lpe
         vTMXIyzvp4vt3eXgaHkCP0SZadtIN5EMUm1UN+U/E2nSmrknemULyREsPj2lmc2vogTt
         5nHkHrJeJ3e67WexaHnH4YpZZrc1H36BepV3q8uCzE9bMyvV/PgIq2eHBFwHErv8wMti
         0Wpw==
X-Forwarded-Encrypted: i=1; AL+hErGJ20d51VG9ZVNXYfuiOuzVy7REgBzJ+VI1WC2dmHAyx3AOG5AbKWh0duE3h0zzZiZdeTw32DQb74rOc5sgOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/hssB/qBiMTeg5+VbCC5r0AX3H2BY/zG9ITtM9LlytonpihWcz
	ej9FjCibTTXRLwd4GiWgbFU2klM+FoOS8+21sEVV1JjAWDNpKAYuJMCi
X-Gm-Gg: AYBFou3B4PtPaf+ZMSHW7iKH8iPA3p3KoVS3c7TZmKEmzcqxofAzeUV1G4kIBpyWUNW
	z5YvyIJIewJnGzP8PkAAFVpRwgJ743PKy5+aJ3bTVZ20FhRqAPliO5NDUmG8EFUo4OqD5FaqpNT
	F5LuHRhsXYa7R7bQ3zf13qAhojFsmKUo8hI4uCrLEhcJirh6L0akxoIWiKLXhZLovG97PBmr9Oq
	sDkJL1EjHueWrgxBmTwm3UuJP9vM6ggewKnmCZJX8+6cWp3VB0bWBNxONAQsQ0dONVZ7kw6SN80
	sfKFV/6fsg9ON1eTOKC4E1HsyWIXrTZ/FxzRyZYgWdhsIsHjGEtcgPPOvYtvshQe9GOMHkX//R8
	eyR1bjIbMNG0fWlQ+z/LWSEXsnJa/qNuSDxx2rSa7Du0hX2f8HaTeY3vBQjC46FjYbVc8Ckpq1E
	YVlPkRT5fE2ydLah0go9WhokK9+0jhcWwdu/mikLmsSTjjrdvZPN7fUFaUToqfM86doT5Tt86VE
	5uWUSy9t+ahXvb+B1WaKNa/2ZyQSKebdcn6T0o9SMxrSi6V1uBNT6juQHXSuY24gljnkruzp/Po
	A2TyW+6T9DapYbcsTXOqyydO3/OY2ACDhdM4BemgEgGsEakZRVmxQea/VZTd+wKwMg58HAJ5wIM
	wcGmm+V5s/MDgq8Nm1Ww=
X-Received: by 2002:a05:6830:82f5:b0:81f:138e:77a0 with SMTP id 46e09a7af769-860f29becb1mr2821997a34.24.1794421201164;
        Wed, 11 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:00 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:50 -0600
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT8173 Amazon suez
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-1-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=812;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=q/RYeDFXlfWlE6oZcVVafzIBFTm9F3BkNBjT9jB33RE=;
 b=x1Et7idrLHXZV+S4OxZLI4XDrcm2EokNWm4td8JQSrDbabjEZZh8QQe1wekR71n/tjIyRyHZ5
 J5k1ccNSbhvDk86usV1plzGF6cGevU4Gd2qKFkZP1KKaNdYAsVILbN4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102002_414142_3B7FA61B 
X-CRM114-Status: UNSURE (   8.92  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an entry for the MT8173 based Amazon Fire HD 10 (2017) tablet,
codename suez.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..26f096587631 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,7 @@ properties:
           - const: mediatek,mt8173
       - items:
           - enum:
+              - amazon,suez
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)

-- 
2.56.0


