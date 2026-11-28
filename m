Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1C606A32F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n0Ijf7y0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABlxDx16
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=; b=n0Ijf7y02kqJlM
	Y8rQKwsVszk7jkuAgD4fPTfRoKk1MaIG5ZnB9UaY3VLoMNdNLbyHEbVR6N30/CxnAg63acqEoLiHI
	SOTxcjiG42+3co4z1fu1RIMVv4JIt9tRs8chKjv9bCL/2H0hCZCH3+7HLLIY7Nbiq2r+bwX8tLG+A
	d5VsVJ7fbikhIk6KArH1RffgCcFzZmQVUVvMYzb9BUKzj2Qvgif076/dOOsZmaLjd1cefUOWQsWGL
	UzY95AOQIWz7EaIZre0n5Cr5BaqYg7wLDKQMxk5z5rtv+ptiWZqVhMV/JUSISicDhG5FX7znkPIJJ
	+7UEHGSII61TlNKhAYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDQ-00000000pNS-3Xlq;
	Sat, 28 Nov 2026 14:15:48 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDE-00000000pGM-2Nbx
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:37 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3282db206d3so7907439eec.0
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875336; x=1796480136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=ABlxDx16LiL6creFuZXFHWVRFpN9yw1RrYlRgsfOTMVGzRnNzNfyGDCl/Im7KpVdkT
         x/UIdp8espCFsZE9PvALke6EHIHPQ3+Nss4oOZ1dHJ40Y8t2532e/+UejHtmxHYFNsj+
         UPvX117cgChgDvU/5cFN8uE4LMYZ1LSb5F0N15cFF2Kihmhvh5iDUlMXBNCxKx92mgZf
         v4HS/ozlYSiy5Xc1OP2m+tYD0QB3a2dR8O3BRFW2EmT5mFWTm5s/VOgjAAS0byA67i1p
         JpxRCewkHFNyb6D8tm6+Cnc/t2P4BPVggwYOs1dUYpHaiXjg2qiBIi29rnU0jXD9Mzwl
         097A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875336; x=1796480136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=br8y1ax6OFKs5nz9DJGClVjlFiP1LYJ8/qThDtgJpY0=;
        b=gnqaETBKfhwWeq/o1atkSs8GNFt8iO05xRzUIqKDmRjyg7rs3SloMHuuWdAVI/Cac5
         Iko3egx7kpDLK7EqlrCYS0WRHyJ0kNXMolvvOuUqFGSZnWp2zTCzbJJYvwn2g9Vnp4mW
         em0lr/59eGbnqtnZxSBz4in5PLoZ7BDp/fJFvDVBPmNvlD77oyfiBHMRt98SBTQC374E
         gu5l27onLwuJxEgSE6BhI9zJfjY00dP2h4CP3GI1FK3vFhStxPNUIvxLQqETXmTSKP/Q
         q9SU0PYFAVRRxT469YGlNKyPqntcIwt9O9w0s9UGYhOpru8iZJrbhyC4Jn+VGvAh8fjF
         kiEg==
X-Forwarded-Encrypted: i=1; AL+hErEwPNHTALueNd5AMOyh1u0SnMO/n+5msHAOqdUWs3FcPSQ671lGcwi7vLOB6uiRP2zkZTRDghctzh4KJvd6+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z85cTCfVjMzp72/+WVvRnz0tjTMJrsPHNEKb/gfvH0YOTp9NjbA
	DVo9uU9KbzC0nkf2HZWV8rNRl3xMkyD2FraWqiycYiwv94BLwxBw4c3a
X-Gm-Gg: AZFdTZeQ7F97kabF1cTJYnk6LPICfVtg1zVkGV8hdoRGlf30Mwt+oNYeN6fdwyVznXr
	/PRJhvkuD6lw9thlEsbAUuaBtZo2L6tZIeytyVhRsmci07XYZr6D11VyJg/3u4U46sVR4meDSS2
	MRZcQBf7yy5Da9KcR067z+2WDFF0dTzgtTWjuto7copaYo8tqaG23OGlK+jR+gQa2Dsh89qGS8m
	56I4Jbx69iHe3L+4PGBgs2VEfQkt24b7PNYgtdA1Uxsdu6UFhjgOlrA/b4e8bvZC+nGcAOGKr8d
	glX+cO/oKZ7R4BUILXnSASblLJB3yPGuk3b5/9cBSE9QyYyBd56VRbJoGgY8jii5ICqNJDvWklE
	Pwx7qJxxJ+bCb8ubFfERqYhq5DNKNyht4p+wIFcH3Mjx6Xfm4Vi0O6FAKh8vMHcXBmGUNG99lpV
	OxYPgEK7+TCvfh82ZJjncGn1YPSj5Y425EE8PK15Mzc6oRRhyUtlhu8LANxfX+LyZCyWa9aXn16
	JrtEaPetEdFYOHB0TI46Y77aWlaZj0QblGo3JV/OInAGh1BDXWjfWV6QsYTkW2VDcx1rlR3IPuH
	RVeZg6wEylOwBbIViqXaCpjboZ7DwPeSyY8dhMRLgn++NXtuVqadj8hCw5yTVQsIeGSmxHeDU0J
	bdrtyRAbbVMcXcL+VGjAZ5dzqhXMZ
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr5532315eec.11.1795875335508;
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:35 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 4/6] dt-bindings: arm: mediatek: Add Google Tarkin
Date: Sat, 28 Nov 2026 19:44:28 +0530
Message-ID: <20261128141443.13065-5-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061536_605462_3A7034B1 
X-CRM114-Status: UNSURE (   9.02  )
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

Tarkin is a MT8189 based Chromebook from the Skywalker platform, sold by
ASUS as the CM1405 and CM1406.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5a4779d9b..700dc4293 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -390,6 +390,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - description: Google Tarkin (ASUS Chromebook CM1405, CM1406)
+        items:
+          - const: google,tarkin
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.46.0


