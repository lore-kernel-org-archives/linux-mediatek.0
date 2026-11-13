Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB13606A8BC
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KSSUPUOW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7f1bETo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=; b=KSSUPUOW/S1Jag
	BQd2o2hmI87QmNODaqcjoearIZCFVucGaCOSLA7nY0Ma/BHOSeROfWUEVpkNKddz8uccCXhwBzeDc
	sJ/nnHTskG7DvjUqo9Ikr4SyEbpMxiAMeTJ77nS+nXnJxL56puRa7sHQixl79L0Zu4VoTZRNzSInW
	ulhyDBI329BwF0H2IF11+Uye0Cjq3fDHeoycoPb+UPmh2w03qiyAIHctX+QNjXKdNC9SxHuFI/F1Y
	4OzumMY/TFduNuPsCRoq59ErEI0OW+qGtJu3jixLzxEndPhFo7ZgY61BPC6jxpyxqPhTISyeHNR2i
	AK6kxehuSCRNPCkSRxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwcn-0000000E5ZB-3Q4d;
	Fri, 13 Nov 2026 19:07:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwck-0000000E5WE-062X
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c4697404c2bso227941366b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596864; x=1795201664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=b7f1bEToNvitVQ9iAroFBKsSh9U30TmoFe2YTTrCp6wIRM5N3gJ+Kxp138ndu5AiiW
         HIEvNvi4cZ7dn/uegt+dSHYEWWKckoGW8CGLYFY2umI4uKHXs9jxMyZSPdpW3SIZ4yF5
         zynkh5uWIuScvklTPH7xni7Wc/55swNyokniOeZ7g/KEEkKkBXTGLvV0qZARvCgIk5tI
         SLvFoT69aZrdeBORtL9/qdV5P2WH2PLO1Yee3XaEXHf1ax+KAfzGhOtfGg9imUeWcCM6
         wRPiwNRfFM/KHIv8CRdbtjK1kLA6o996XLgTr3Izowpp34WR/LfopA9vRlBqpy/iAGO4
         oyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596864; x=1795201664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=SfdXKDjalP4Gmdx+JisZ074mJ+zw1sIfyUmC604vMmpZ4/0XYFCytAOYVV6guel/2s
         j2Lq8eaC67PmOP0qvk+Mqy2EnycmOVwv/qzIMrvKRph7RuIuG+QAHAvKwRDNRVoeg1TJ
         3D49hWfHIbbYkwGbxtC48W2A54mVL2FM/xS/R/jzJmkkSUTcWB6GT6H+OoVuo1UwQ8iu
         un3L3bx68DizyCli6KyfGTwhLsxXrBPq3SHZ120IgAE8sKE2KXjtm8tnQxPIj0093ZRG
         kOsV+g3VSbzEHKT4qwgJsSxVc0hB9RBCBCbD9uZPDbJYZyZoTDNvWfHuRcZf+OI+rvUE
         1Whw==
X-Forwarded-Encrypted: i=1; AL+hErElR6kGAki9WWW/0RkaIH22TVzWrvK4YV2QXTTjSPNSgGexRn6uuGH1IY+f/Lxt9vRHh6jRbvXKoRjcDas2VA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+gorh9wNgeGQjdHLqu7sXqLuBq1VwKlKojuz2BB3vHaw2RVSE/
	e6D/wohvegbuyho+p6rzJ/Qh/WheVrZzDRL1d2+pvMqp+fHvu8hWXrLv
X-Gm-Gg: AYBFou0osEEFqB+8eCLVA1FC8hnupU7O+ThjlOu5wRybrxEYRL24LjpeXD7a/r0giGZ
	aEe83OxqhEsbnfV3DQ0ngTwD2tQLsLLg7ZqUL2N4WHKqbAqQkq7djrsBRJ0ZWc4Rwep/Y1z57T8
	xnb1pN1YqotphTAy1gbE/pzQw4rgOKcAmFE0NJzDc1+7UCSmBI3tku9lstpleFq+W+3Pm0jEU8J
	T+GmRnlYHg46PW3RdXQSqDbvfbtieCoS27ko2kMihvL5Sbw/TfWbBJaCkicAnDOrn4BXLtmyKVi
	7zp00ZijoxJgPDjuYLiC/ORIgUKFHuaHPS1HZTmhiXWBtys019xJ5QYr85gXCBop6VZpcsjB0c4
	ZNxjAujKiV7IqxwgRH7Fe3fnMvWe5lzCbchEFmyPDEiSqRDbHPxI1vJwHYU87/RqGAHE9lzW80F
	jAZVstJAqmMmyMExVrbd3s0amzBTSXolzvTMQnUIrOBkFGHek/reRIu4BCXj2FzuWrCweqeTu/N
	iYfJfutkNE8Tt0a49kzF0kjLB7Pcnfa5vVMhswbZ95FHuTy+f+M5A0ZedRwY/oxQH6FUhrvXj85
	sJynGkYhzZZSk/Ee/3+r5hLbA9y8glkI4djsc9TUONRpMnrYnRu7GAMTGkFoYA1r
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr310340266b.16.1794596864130;
        Fri, 13 Nov 2026 11:07:44 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:57 +0300
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-1-4ab0aa9fa391@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110746_090338_AD3A2EB3 
X-CRM114-Status: UNSURE (   9.30  )
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

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


