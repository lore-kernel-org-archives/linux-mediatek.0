Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26223C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wXQkcMf7K3vGWL79rv8fwtNhHLraJL7yxtnHKTEIGkc=; b=xiyeIhTYjtaSfsxBL1bjHXKn6A
	0QBGsIBj++ujz4ftmhxXILGgdgjNz/uPHltnUEBGFqCGdXCEcaG2bvkqfhARFQhHNPsx7uhwu0QQa
	4rpq56izFS1AP/DZmfPbMi4sdZkhZ49YvVilIYktr0TyjHpNfr2LdxdjGshAkBPdfA9y7TyHRdm8C
	45/5yZGXnUk4MZu3Ihfef3ooGMrifv+A6Q/crv7pAi0XqvaW8bZiqWVKOhLzOUkhL/No+r386N7+T
	rHlxB0svwssYrNwFsQPsNBpGxE30X2yhQLb27Mea/Zjl/BBEImgzJSV6MyMftHg7wGCFqRppk7f0+
	WXmKZ7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqbu-00000000Lse-1j6V;
	Thu, 13 Jun 2024 19:59:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqbq-00000000Lr1-1HtR;
	Thu, 13 Jun 2024 19:59:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a6f1c4800easo191295366b.3;
        Thu, 13 Jun 2024 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308782; x=1718913582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXQkcMf7K3vGWL79rv8fwtNhHLraJL7yxtnHKTEIGkc=;
        b=DtP3LsMG4Ys0oAVCCyGH+8/SdqL/La0vNsHFYC/jnENUbwRYuZ+OttbBf6cKrCdMhX
         vpCxbMjEg2aoVeHp14EGmcT7hzxOWQnxXtJRdDdXN7ttX3s6UAgaIYpO0aqsfxPJjyEh
         fTmOvt8mIfms4chyLBMHsVKEbH6MaiOuyglZ8G+8FTqo1juQGFnuqroS/K/tKN7szJA4
         t4OiC1cv43FE69TZHXuegYtUEBGDU+xQo1aLkOr/k33/KIqJtroar4af7SB4G3jwZzJB
         ClcyWICvX7txBHrG0mvQ3GufCa5gicHx7IjjmVSVA8hM0QRRVS6DoYs1ZkpACvyuhL4h
         ly+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308782; x=1718913582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXQkcMf7K3vGWL79rv8fwtNhHLraJL7yxtnHKTEIGkc=;
        b=pKrF9zyPDNUuUNxMKbQ+KoVmAE6dfBJxxQ/aQgYURmi/EbOPSMQ5mlHemmNNvXgKoo
         jFG89ZxrfAPP/aB6smCGRRr+eTLDerkOnDimb+/dzLYQnynqaPRYvw0YDRSvd1CVoaaG
         xN5o0AKvvVavEzrO83FBUlflhgWQN2zlugctg75ZvE17kDAIokyq/i7V8CeXD4YafvUA
         CJSAve81ewe9iT49Db0Z1bPi5SDyDXO9G2DlnKII10UDtzhnjzdcj+skP9Zctrf2kgl5
         KoWCL72/tshKFlDFRw3cNs7AMWxH+8wlmmAtHfX7pF2Z+S095PfsKqJuzsoNSsBf+rch
         2f9A==
X-Forwarded-Encrypted: i=1; AJvYcCWeQp4ipoC1k+X1sYpMQZy0hk6Bnzi+6CCV7xZeP6iU5yObz6sSAMuhYRqH7nQNUoEkbGffWw7PMHx6MhSQzgD8Mk9HBYXVbxaNsP8VgkQTeqfj812dz7SqePokX6zkk0JxxnNqXhapbkdBJijNuwwioC9LfB8aamI=
X-Gm-Message-State: AOJu0YyGvUxzn9E0JE8U8oFQKSXhLiRIXRbmEtnQ6/rfDtgl44pkj0wo
	/4JhtxndTHbnmxaIgWuu7VFj6rn0yxzLWjVnt3ABFcNZqUj/K6pz
X-Google-Smtp-Source: AGHT+IGbxi3EbzRk8sT09GB9OWN57JJRVnLDOjooOUhZQZIgX/n3AQVHTxSPIlOPZ+EnJIp4nwp3fw==
X-Received: by 2002:a17:906:af08:b0:a6e:f91e:efd0 with SMTP id a640c23a62f3a-a6f60dc56d7mr45513366b.56.1718308782338;
        Thu, 13 Jun 2024 12:59:42 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c858sm103092566b.206.2024.06.13.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:59:41 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: nvmem: mediatek: efuse: add support for MT7988
Date: Thu, 13 Jun 2024 21:59:32 +0200
Message-Id: <20240613195933.31089-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_125946_380308_43C3A693 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Add compatible for MT7988 SoC.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index a773101d8538..32b8c1eb4e80 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7623-efuse
               - mediatek,mt7981-efuse
               - mediatek,mt7986-efuse
+              - mediatek,mt7988-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
               - mediatek,mt8186-efuse
-- 
2.35.3


