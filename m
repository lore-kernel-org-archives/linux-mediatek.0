Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB4DD111A8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=; b=BGZhQsENUql3qGfDD8J9YiT2pN
	KAj1NZz02MnwgZaaUG6/9dgCIfyqHVHXA+QHSUtoHZYk4v+Vr2m2Ik4LsVFNnF5KMzNOEMRt8nNap
	THs/2S9WryEa0LN16lQlhwSkv0soxRyR6B6QEldnLbKum3pju/n+L6jl5UxWebpydJung8k+IIRUr
	+8CcVneGypAToZB2knFf1juo8OmwUFBrfCdlYvyyBRXP3dYBCGJKJLlTqgeitk+bydat7BRJ1l0Z1
	4hjH4QAkLXn25x9hwlDFydiIDO9QsBXHcUlEWfdUpXy9WgIvW6xeF5GfSSHFRwtPykasn7DkevM/Z
	Hnu7XnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pl-00000003MKG-0AXG;
	Mon, 01 Dec 2025 10:45:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pf-00000003MFa-3AgA
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso21577485e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585946; x=1765190746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=;
        b=UYAdZrWGck5SqjZnKDwHD642DYqU+VJZpi8OoSVjCgoA6afkT80DL7VnvdAVgggVzv
         DI6oHzWeoAzLET6G6IBHp3FWdQRlYiFqK8rfltHuFZAV0yr1514RV2rpu4q0OBs2eEzU
         znz1K14ZP9jy7l9JsGdBk6WjT1mGhLJg5UZ1TdYggfOAiFEaH+Xz8hLiR97hKojW2+d1
         xUIwHNAl6iEm75i/VUPXrCgsjAg3exyvV2A4V8raKQqOcjfrQ3z89eaSH0q8nJbsA9gl
         NzExwfWRs/KbbBxAr8VvqAvPVSGZIyXiilFQtZey4KqeeqjBI+gNvbVNPeAY5lyehJa2
         cM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585946; x=1765190746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=;
        b=hap8naoah9059iFuglbb/POXIJMRoI5GnepQQxZCNgWUJQjJMZxJKqjirLJCCAXebm
         TJk9E5dK0c3UgeZVOQjISTsrzb8YZV/g62y98OI0xF4TnLUCv/iu5pnDkQdEj9BUd9DH
         uvE23/fygQKm6wTrSxpaOLTv4smxJNLfkVDt4Vl2i407qLLkURc8sRWzOlFM6CdPAOu+
         w0Lzjn4HNLJ6NcrJb8e4q/kfzhlZ/o7ewJy+5yPZeB9eNZdykXcIJGiJmA1fCSFB37mp
         EG8K/wEht4OzV2h0b10vQeqIAwsxqxbuBO84OwjIjCFF5r+E2jPy97vo4DrTW48q1Wil
         htlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHq3pnFDFFls/ENcPdSf6AnMlinI+UXln2coM1wemARYZBlSpJnrbanjLgB7pD3gWRNGS5z6LVQU7Ry9reZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzobBLePulLctYr2j38v8s/XIWWOegKzolnya4+Qn8avvr7VQn1
	rJcTp1CFNKt5SxYLP1OC9G454+lJIgYsMvm6EJ+j2DFWrL/NOfgVc8qf
X-Gm-Gg: ASbGnctIBQD/LpeTDJ0yZ489azYMAUCElj4W1rixoN1+HE0tOWXtR8sJPEnXwC1kA8c
	LI9tKBbsXOQ+icxA3bR6T6hIVldhvZUxNNlV0200wexXThPyOB0HXm6kyYIqix1TLX2n29ph+64
	6les3hdOsiaR5PIyQhc2rdLV0O8uyFrdbzo1ugcO0kd/pb2AWYIKmVSQcZTaf9VhpnoCxitHjrA
	1pDQwI3Ls8F6INj0bKRt7s9Xt1L97JBgBO0BaEsfBf92dAGMz2e961cyOSPv902vMjpDdqc945r
	auBtdCwl3xYcxMSHpvpu8EJRabESZW8NfulSagdlJRa+pzXwKhPNKe0grrorxpBblu1ZZA7vxMo
	0xYRa/H7KnS4tO0HkERjLsYDJpHG1KqHYrUXAun2BVCshpfTreYrB6uNv41++h3Uvq42P4euIYR
	43xXRRst+9/W7JE+jSrGS1RK/bFw==
X-Google-Smtp-Source: AGHT+IEOXXUIrMivLgZSl60uiNX4yUHLTdTE+ZPG3CdRF6KMSnG1uLC22eyTbR/Tq36BGJVswlCeDg==
X-Received: by 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr408394335e9.22.1764585945795;
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:45:17 +0100
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v3-1-07f9af7341fd@gmail.com>
References: <20251201-review-v3-0-07f9af7341fd@gmail.com>
In-Reply-To: <20251201-review-v3-0-07f9af7341fd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=968;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=e+eXP31aXqYuHfqQ4ChdLqp8avfL3ewikrQxBy7BDg8=;
 b=7bNTbOK4r/NgZeFKYX1i7o9YFptwPZEoE0LRJ7HZzNvAZqmeDOUbmdMZB/SswLMppISOcDsW5
 DuvgNJUd7cpAeAWNmDrMxqS0hp9FFRrfWLvfVhzCGvmt6PXiPUg6tlF
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024549_988384_A0CF7B6B 
X-CRM114-Status: UNSURE (   9.04  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- none
Changes in v3:
- Added missing Acked-by from Krzysztof
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


