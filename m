Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B77607466C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KEDUw/AP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOre1/GN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=; b=KEDUw/APdkit6/
	zUaVdZ6TnNKhwqxl4ODxItsempkjsNB4fC5hYS7DWsnT7YUEMv/9d/RMS+GseCTdtDBBKZMKj/Nah
	K3q7zgL1rv7J5VqDsZ+MIoMKCeTNyeovNFFx5qDmLaAuSeerZ49UW3AqFkd0j+mH3mcC6zpAqa4Iv
	VXhAlCZRlYxCXbEVasVI8Ci6ADOpm0SP6AZYCP7GFAbLb45IJgv6nTnAqz+TK9GlYyV+pKZ1bQAdE
	HatPyReSXKldruvhKp4okJwBAE925nMqcjGeXpZUTsVJI5oCpig+5+faIjSrRpKixXdOA4RRkQOxv
	I2gf4CUiFikhtXvBPtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEu-0000000HKqz-3CYi;
	Mon, 02 Nov 2026 16:50:32 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEs-0000000HKoc-0dSa
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 16:50:31 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-84abe8ecec8so1367019a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638229; x=1794243029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=wOre1/GNIwYmY/zboCvDmLiVZ+Fw8shKL0J9QfK8cWCP0zZ2gLy6+1Syiz4TZcdPIr
         ze8DkHEiGaHW0laLQPReW4IUjFyPBhgGBT2GGlDW818u/KbF3aBC1R2VHAvfWVwWTzO4
         6k38Z04NEQy+5E+z+xKMTSveo2d1L6ZiqEliRF424S979IVgwY71Mmy14RrtRqOMyNHx
         4pjuO3fa0xhQjchdDyu62aL5jqifLarMJzOC/l++hjFY0r7jcIO6OGJ4eYFcogxhrggp
         7MnXaTPgvwOX2EFYVsy5flHC/SdAjBxP3uC4A/TooNoQGazgrDkhtxSjZvuKpaJAv5hg
         rHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638229; x=1794243029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=QhxyXv0ojkYuuopAgZMhmyJ3dat74plsQ7iVcJ5/RQ1faOXSCKA48TpL7n+jRhrdol
         HVOWBdsgI2zwuH27fk0y9I5EHPXZwwev23lz5MtK9/hVMXmGfTy6IBoy10KF4CRFcU1Y
         a99XVaFssDKBhu0Q9xHkWIGpgsZp1r95LZh3BQPZ+0UgmRf5iSZ+RsCah5xVF43iI8v0
         XEaVQJZmJ0hkvwliaq/JlCoFeWut7NB7gK45UmIuknAESuEoDgU9FBUmxWLXTAm/BYYc
         nBSofyeGcRTXkgQIaa6SV4u0fUtHGtt9Ho5TtW7I9YdNDHNIX9ELsLoLPVyX9B8I1j5t
         dQiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbqlaaQ20U7DpgAcmZNZLoVOZVDT1J2AUvW/dyg08dA4t5/Am6COgpMpmzRbuzBPLAN9UzuMNQQlxYMuMTBg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLs/c122pE85jrvb+EinzSII1qE/8IIIITu2kgAFQ7XsEL8nOji
	KXQurb9zMc1K3BiGeU4NHJeitsvZUwCo7PJB5m67LDwdQ08YZUM6Pbaq
X-Gm-Gg: AYBFou37Kmq7Jo9Jov5VcIk5m1j3kMGyoaS8cPYzez8cFQjZMq+Q8CaGy2P2mH+4pQq
	yLextSExw53FY5WEC5FN+XlarqIZMdKdnPtLnv1TDb76fKJvhWG9S70n0XxNdMf6MgpOUFL4D50
	vqxTnt7tSfGKySg+CqFh6AcjIMnZum+r1LEgpFJHiJq/voLClSMDpYX1+nhvhuJPSPcaJjHhhyC
	y4K2p+tV9nxN5GcKXtvoCL3JPcfxovT3SaHjyzcdYXs8f2JpBQ+Kqqf18mAjOrbdP4KcEfSL615
	7Y1quyShJNHDICxMCXa3cv1ndS3a7iCbJACFOw/f7s1NdzAs4yuZB8+8ejwtm9j4FZW7FYKeRgU
	/Zs+8XF+bBy2FESLeNRP4DSGY0bHeZELK33dfLwrPW/bdjy9xLSBDqjOkYjemB6xiwvTT03NHT1
	AVXKIGoMZ+VyyMhkG7P49bj+9+NFrIHCGKeHcaR9QhJrTsiylqOFnd8A8nWoNV+AFxp1WWGCe+a
	yRFPoc/n5twrnw1XyjyBg5pZ8vyIw4m1BHA1fgw50e8KOFDMYX2B4r1CfT6h5U6XscI17TZh77E
	dLIskNFAzsaJ5w4ZePaAgYeU92iG6emN5wzTmgmCEcb/gxPC3hMo7n/dDK6LMcn3q/lRwQWD9gN
	G7MBFrvT9BxZjE6Pa9as=
X-Received: by 2002:a05:6830:4487:b0:843:b6f8:de3f with SMTP id 46e09a7af769-85d365529d5mr7247305a34.18.1793638229426;
        Mon, 02 Nov 2026 08:50:29 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:28 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:21 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's 32 kHz output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-1-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=1237;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3CyHV7hxEQyK84ACcArH+5qoJrY2fIpfuKy4fIAGdtU=;
 b=0Wf1b+8NmB4OEOpczcJRUHMeGyBxsbhLHqpUCilWHGZgwVqtkqscNpMc02ashPTcWUbtr4lgH
 WpE9hQMgNpfD6tqblyH80VYcqOYLALDE/Fh5XCg6akXUTVKecaowEVt
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085030_200888_4B70F2F9 
X-CRM114-Status: UNSURE (   9.55  )
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

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0


