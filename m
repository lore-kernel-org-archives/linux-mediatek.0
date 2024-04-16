Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F70C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=; b=289PedUxidSTYiA6Q49FX8omoc
	vs+kwQxAu/G1iLc1m0iP50RW8tv14curG/XHnIjdvyZHClxPN4Wu3csMkGfE3v1guR3YS2NzA+tvH
	ZMgdShKNZijcOUFwwrmKAU5PPrQuVSG3/OreKx0anlifeHPSGsbFBWamYY7LJTQqpI/X3ekAqjLn2
	bVZNJEHFvmMeFmSKJixtKmRYveTfnZ/ZoFhFrJxBAfPMV58doi1JAs/ECGxWS5o2xdXaEHxGOKzVM
	BrXTXd+TPWzLDI3rH4ucWA7ns+V+AMSXTmNWmJYbxs9dXZIRCiE2bNB1rZZFAk5j2MczxlZJAPVuK
	iA0GC2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl8v-0000000CrWN-0tEM;
	Tue, 16 Apr 2024 15:54:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7o-0000000Cqie-3Utr
	for linux-mediatek@bombadil.infradead.org;
	Tue, 16 Apr 2024 15:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=; b=mtjhyC9AR87zMcYWrN/hNp4UDP
	lWYa940AxrJOFCXhF0DG2Uujvw1WWskf9emwRrLJXGm0L4+s3WSdd66Xtd4ZfnwKPxwDoFuyt+bW1
	UdYcZ+iHkftVFzp+8drQEUjXYyU8FkeWdqIDiZDjcwwlXtwFSt3GWiML0SsLvQopkjXS08aEcG3Ue
	jrOCvqcYxb2kDW/4RgNN8/jMm8b/V8vxda41PN2aUdCLwtuS5uTOC7TfOHsa3he9Vh/ejupgvqFCG
	3W4ugxeZIH0pCZSx5apYt0TYYkg0Egtm+EAaN5i5q/dUkbTO8u2ydCs6ZKm/GjfakKECstCRusEwg
	7WCL/Npw==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7k-0000000B8a5-2WBq
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so4616642a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282811; x=1713887611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=;
        b=RF06xpWXtkuwr+v8I0AMWgEUnV/mJGx00DC//bqdUs+IO6bxigtvml0I/I04PsSqzC
         ns240f9Cx4tpSaP7+wUmGjQuN72IQEpej5HL4tSQX7U2LUMmboN3+5mT9s/9/KO+D/Pw
         OzJAqtBQHWQxNXzmmCQ/Tt0je0e7ZF0t/YY9F+4Dkw6TGAcgjKv8djc3mrNCt3WN+LZj
         t/zfdZArQVxcXoPuhXHeqIfA9xNMkNuzcZiygAIyZc9ZkHDJNJWR5X+l2PeO0hQDQwNu
         /Sz59wNVXwx7gkSQ2Tjg1idyx30R7HGy5YJXWsicfqEbfO2p8foSflDps2S3V1Rruvyn
         DmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282811; x=1713887611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlsoknBYQWG63sDwAb9jwt3WWTGlyxEUyggNRmjx7kM=;
        b=Oemi7UjhEwthbSqdLZCbbALPBwBL/Bp1ZXAuNsXhpXySEx+ml/RvKTrF+0cp7UYfvI
         ymd9junQcrv/uHYLR0S51W3MwFJ7VkoTfNuvrFZOvtCCJ2vPLRVfE/M9oLqNVVUfJVGD
         BUpzzr1xZBG/vK0vtvk50B6/nZ/CC3D+3T+Gt0EzyTwRNsAjf3UDdwvYaANuKKMPktwB
         oe925Yc3lHWT4I7zYLae6hfqPmMsqIAv8s1LzhU1sDK02CiNmsX0LNk9vW9gR0q+yiBQ
         N561XN/HKVTCvwA2Z/x31b5T/awI6CehpmmRT7GgCWPexs+6sD1RPlPDEHIJh4taoXXP
         1K/w==
X-Forwarded-Encrypted: i=1; AJvYcCW5J9DXk+7wCqGYxXNvBI6HkyQG0gMxJi37wFJH+z2JkGwnLIN8+JIH3rk+eJiQlrhVN00/LVlm5k89aSA1PCAJIlBC6FHvkQAxSiBiKJkW9vK9
X-Gm-Message-State: AOJu0Ywhuyzt02cX7v86ThVycqHqTB6/JZtFd9odZy+qf8U/m952UUYp
	+acnRh0UFIHF6SCX19huu4CkU2M+fHMLjb5jGCGBugV1FsXiZtdvXt8GVaJlqdI=
X-Google-Smtp-Source: AGHT+IGA5RRSl4A2IXLKdqCC8v2L1AFQuGr2B9Nnr9Br1rPnc/6ECo2w8uyg7/0Z75xZ472LbU6zfw==
X-Received: by 2002:a17:906:2a4e:b0:a51:dbf7:688d with SMTP id k14-20020a1709062a4e00b00a51dbf7688dmr7549912eje.74.1713282810826;
        Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:09 +0200
Subject: [PATCH v2 08/18] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-8-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=epD3N8w0jJEyk09IJE2WmrV9SFTYkbtEoVXZX4ZLDLc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qh6M0l8VmBY7ocshqa+6uo7JC8yIk9Ue62Bd+
 y9gsJDOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURSvSD/
 9PZbD63pq4febDhJFNmCj5B5acPQcLv/gCpAp99s2w9KioIW5GWsqXyPuedu/n4e9uCLdiI/IdAGOH
 ovoqBfzKu9Z2lsHBui/NWLvGxBECzLrVenhmmcvOnZw8FXpsqSMCtx1SXCMph6PZZybI8i/wyfsz1C
 L1Zt7Esgqaj2as95mbOj4VdcEk4wxFtGCsWDSgp8+4XXfwg0TnQrg2iMMFPFFlqNNaV60lhSLtirF0
 XaEXhJ9ssDgoo9eHyiErFwDQnIvP/xn1I+tf4sREFMd+UFyDy//PwPdJLC9zVIqm55z8l4hRahw7D4
 HrQe0QfgkFOfxloqambBH/8I4C3mw04e4bti5mA8rr8LGqJLxPbvJwvnRseF6RSuKyu/dIMCPsdgPO
 0CV7eN7iylz5KWgxt8mCOpA9BC/19D5H4e/FKJK912tjOAuO5WEYrf4ByzIemd2v7jsufUiE5+hWOi
 62db6yvM/RL7Vzb89SkhZLAUJSdID2Q6c2qxIr70Kam/JJ8XScBVTW1kuNP/tokRnRFmv1vcg9GANe
 oC6Q5z7XR5YLhVIZpeltJ3/hPoxhIImza+apacZf2LXGd0OrCIEF+f2YjY6VI6vULEULXkAT1UBW39
 mxRsafZLI2HQjJvJvKtAczF7AWLoTEeSYF0JlQfyRYqHpuftGEOUMmFLP/Mg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165332_859088_4561971E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the display Gamma on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c6641acd75d6..f447f4320e8b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
2.25.1


