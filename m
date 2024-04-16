Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF755C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifuf640Z6/FimNFqL4hkDSH599Y93aDl+Foe2+I5K1M=; b=16mi3VBfLV3A4cISPlBRl/+HH4
	P47gi9EMy3r/4rv3EuAkCh0iRH2tEZgArHnzqsWCSa6t4Vj5zWgE0Ih47UtG/cRyvLU3ErEkOPrfD
	SH4WuMzns3GwOQ2QQOBYLlDnv1/0hVoJcI2MyUw5XhIz02sDkl9UnQolnZODopfyx4h8c9StMEG+j
	zsqmky30fiDDlgxt1RoIhlWwAzdB14lnNF7yQfmvn3NyyCDtALcuipwQh+KseKnFyIhT74Phr3Ob6
	ZqpttFafjMC2uXk+8i6YPDiu99rX8kz2hSMewXdx9sZrNvQNP2e4IITo+2MhEseSZ1qzEX+rB6T7m
	OtMj8fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl99-0000000Crf1-3tdA;
	Tue, 16 Apr 2024 15:54:59 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7p-0000000Cqi7-0gOs
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a53f131d9deso274385266b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282814; x=1713887614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifuf640Z6/FimNFqL4hkDSH599Y93aDl+Foe2+I5K1M=;
        b=yhrpMCyFZFOx/JDlc1alaP+UrybWZtna67ZwvYfiW5JgjWCd1J3s34EBPZHerFEv9n
         1rqFuJ4AQv3sPOL+GEmW2s5C0rsurjWZvyZ2Omt4M3MVHuE/piqPwCToRlYEtUMDFt0D
         hLbW0Io0R+SQfpRDMdsHBno/Upm0gCiCFUtLZhxW/xAqnVuLdrFPijwwYQ43TqEMkh41
         AjSoAPgusortDdwBSZKwj/0VQMRjr7g8A2fnG6J0RzbJuWOJmmeaXMw0PmYE5MbRN33t
         v9PFgnHbUtOCntYo4jNAdwvGQkt5G7kifS+voqviJV0A/Mt/T9sH/xm3Bu5zltAYMdFp
         Ceww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282814; x=1713887614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifuf640Z6/FimNFqL4hkDSH599Y93aDl+Foe2+I5K1M=;
        b=isV3upRPZ6AqAsNsVSt6vnMjaKd627KT5zJOovSt0wd2builj3Ter+cAWbqwVnlEpj
         PKO7zTsCTFptvBtmP5oDKYMDrFw6FJWGOv0zK+kfTygFV7e/3WcwTDdXgMJuNI/pzBxH
         zNZzY25NzrzGmXJVt4cGFd9Pmky4DlIlyGXuby/m0hwPnT0I9B51t+m68GhqvzLkeYGw
         KedaBzHjmJXlChvTCumg6BM6HOJMmd8AlZ0oPeYfoLr+hXzkTy/sRBxzrrDnu2eNd0Pr
         1o/H7s4yUfXBqRl1YofacYZeuO3Z8PpTzX9rtVXlvVorqCTP1nOax31ndRb7oZfl2bFv
         oVKA==
X-Forwarded-Encrypted: i=1; AJvYcCVNKw8GdnJugbsQQSrfOm6hhFa8O8w6JzvYZVdyVs4HssAGgjQ7RIT6jPMs61wcSSoPpbLOvHNBu15AzaEHVJ5OCh36qt4LTqrWkn7eGM0l8kT8
X-Gm-Message-State: AOJu0YxFKEf9JNuC7b+KunicY0AfRARpYfBcdlrV6V4WGGV551mp0IcG
	KBE8C0o0uH2Xn7Q7lVz8ihFmow9Ay1Ri2udmdEQET5ZW/UXfKDRPhtlAVAqnZ0k=
X-Google-Smtp-Source: AGHT+IHaZwy9kMAt3dKD7ztpcg+G2sCvDptU8sUFgX7EisaUHjQrn+WiEBG8Llcnlpd+7lOam/eEIQ==
X-Received: by 2002:a17:906:dac1:b0:a52:241b:b450 with SMTP id xi1-20020a170906dac100b00a52241bb450mr9001724ejb.36.1713282814553;
        Tue, 16 Apr 2024 08:53:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:11 +0200
Subject: [PATCH v2 10/18] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=S+M2sbOdQTSB1ypewlT6uUj7KW4lSf9df5J14puhNjs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qr2gWCpuTFBeOaj15ewJSHHZxXPSf9Bo4Qvkj
 gKnBTqaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURdCHD/
 0QuYwuZums7qlU9/2EkJLGzpJiVlEt1nFkpvD7T7ek4+rNdhFcUe/S272VOXZkgHDDPadRIeC7brk2
 KnBmDy50QVi8BYMTPhPPlkMSlyHkRSLPbysjL8WSRtk/Ubk4EHIVMEHbe7YgN3+d8fEJajI0JSC0oC
 a+s7NmIc6aYuEwB/S5ZMh3L+nul6XIOdxZLcLUWw9fSddAC0HUQaRkvn8z/dMICsjt6XUvHg8RJF/S
 3/9GHRcPJzH2CDKN85jR7ksFWw1AZUAHKTgte8YYiRsLT84HMn3FUStLwv5s8T6hCGGQ61/4ZYTQIR
 MajVritiKuoUAozQwLQ58752Sg0a4elRPKAc+EVzDYQXO4l5E8ZJ3fDlkkYfoTUhRS64OBzPzeQZio
 9/vfIOQao9C6A1HQ/Ceus0mMFZ9NPRX5xuMDSuvcJsBt5WQllOFXRnyOlIgblKP1ljZVShmQSI4zfi
 lJj1vHkrDOEtW14AaNg47zgXNba25RI4YB6y1RlPpaZtfMGR9/pQ38yIHr/Nv7g1S1ju3wT+BVkSH7
 HcM9tBOrMsIU+QxAsOkh8vbdwlYV/PiHzwM0zIVWDWl0V5Ergti+aqOtrTD9rikgy+N5sdgRehK+BJ
 OfKpnEmI0pZM3NDkscihBKQGcmKILC/Py40YmMMGrD1q5gkUZCucc7nfew2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085337_308189_7C924833 
X-CRM114-Status: UNSURE (   9.68  )
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

Document the display Data Path Read DMA on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 39dbb5c8bcf8..4cadb245d028 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1


