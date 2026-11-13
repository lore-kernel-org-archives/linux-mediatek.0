Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9C606A8B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjSzApT+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQCQqA0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=; b=LjSzApT+WFzbEm
	P5GuOQgLsw3dp0gt7MUDCDGaZwuT6yLmb6z6WiM0Z3KhjgeGTyyY4TXToUp2bF6PS5oc2vuXyrb3I
	sWU81OixjjFCWTsEHLN8vwY1BMVQsT2plkp+/NafGd6zVDvh6X4on9NLLCL6g0wL0q4HojJlJL4qf
	D8HZWuu95J/+q8/gMJlQ9/pA+Pxgmv3k2EjvVozg+cK4+M/dOu0KOukiBFCadI73mEBvE9Rg5MUsT
	lJKIJJo5xNBRYoStcqUMwyp27yvt+7zEvytqav+RuVKVl5iXfMmgPx/QVKJqIbLjTWkC/5sgTnrUj
	o/ZFxHAtOp654sHCnvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd2-0000000E5qa-0urR;
	Fri, 13 Nov 2026 19:08:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcv-0000000E5hP-3WpO
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:01 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4697404c2bso227966566b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596876; x=1795201676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=vHQCQqA0wi++SFm6Hpi/+ZQ5xzPxz60R4g1d21vkuECiCsDoPLlZJqyuq+8KXswsos
         DaQgexPH9I4JfMVj6FTOOQvqphJIhn/F8LfB49Cve1/RRMqyHANo9Oy8RfbScFuwLtXO
         qYfdQllzlXn+z6xaeLxtWR5eKIrOHIbDhg9N77hZhk5cSJx00fNsDazUzMiHkeH/GJeH
         Y4Xj1DyudHwwyqQ8h6nfQ93G8YP4KU7nB0HzNVXA2/ZT6cMrYv6xeHR4BuKiNWrj4/No
         u97hyY366fTK86kfYuxgcZZpxaoXwdI8Y4ll2nQfVvnSCbPcgugQsxv8ekGkEodSeDdY
         nmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596876; x=1795201676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=Thpv91OVXuuu/ueCj8UQFrBT+Veo1UDYlBsX2fLvLZw+1ivrGdYfDSRY2/KgREIDdn
         1P5s9QcZ3X1/7iov/lu7Dq5GfowT1Va0/mau+3a3UGqIgOsoV84MlCTjm5eF6/TBbVtu
         TWAEsw86yI/B3m/IObt+y1O6PbuhnrZbrg9brAjyVaOqyLaq96L9JXdD/njnLmW/bRb1
         U35T/ePIW7izqopHox+WAJijoF/pTzXFG2iJfB8CRs9hpn6ltfkX0jAi4WeFSmc9zMx/
         b33a/1Qjn1zuoVzoqvvZno3rzH5eVMXJaMuPh6IzvXO8Sr+q1CYIFG/cdWeEtMyRXT9C
         XtpQ==
X-Forwarded-Encrypted: i=1; AL+hErFezLwGeTSSj3BBtyLs4H5gWe7IsQEah6/G6HJ2wMl/x25MqJSV++JWN89sexcQ0BkucESRZQlxByikJbyfvw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8fS0xPF8Bs/U9Y0F0QCW5K2OxAZz+ME1L+Fjq2bqm/5DY1mPkX
	8BeAeYFfoBx0WBsGAb60AbRo344iY0KIDvAqLsFuWUJCzpDq9lfxMrOM
X-Gm-Gg: AYBFou0LW2Pw91I6HI5uX0In1ylxneZYHKPw+Vo63XyuoE+stKb+begFxbJkp7HdyNE
	WfTtPV57SVCYKOCf2Zg0KfDxptOvfPbWisEQW86qlyje3MiFyHi0GvBDrXoUqAGRul+dHaRSeJK
	TA+taSEwRBl7SvBR8odndgLdYBHLvLhmZ9p0tHwThFbHKpQ2WanqyJQBaQ/wHK9Jwr7DgtGPXau
	0oHgT33sO2FSkexqCDgJl5NmoZ1Qd7mOP4/+YRahgJ6iPrVq9w4YUro00Zu81/9yse01H2RAGh5
	AyZfyOdsCCLlJ800NaDdASmIwnZdSUSPZHQ89C8IwpfLBiblaeLQC4Gj3XSgntx9zZsUC3Jgzcr
	3Po0JV0GsIJi4ynqxh5IFJb5FZ76+MiPT5P36SPuUKj/c+N4z49AKVvj1Z9uT/42UjQIM4A0pLR
	B0eoieqKVuf2cbxinnSAeqbgVvStaGI3bzKU8r4Qt91HMaWRMQ81iFzXUYs3BB5ymmHSvFGhtR0
	/MLnYjKJwvELDJSvIIXprAIFcl9nPuyD/zhKUugxa9m+jXulBdg2Zlm+Z0F9HvJ4Yxf6x5TXJ17
	HeuJqIkOoFoBRQNVOsh/p6fYlN+cnImKwMgmSIN2Bsf081/6h4fTHmL9oWM6v7aT
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr336353966b.32.1794596875807;
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:01 +0300
Subject: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_110757_889586_AFB0BF41 
X-CRM114-Status: UNSURE (   9.86  )
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

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0


