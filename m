Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC27BC41513
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcWOvKjaH9VWKVfBKzGMg6R3MCBCRcDLPHcl7oHFM04=; b=y+O3pe/gyG0H4pA81Fp5lxQNoe
	EXwEwz/7WwODBBzycfpMbK9kZbXAjJXJX6fUAP+mcwDvfbqbdLAoNRF+ruAj78q55tGAEknlQu5Rk
	BygNgdVJcTHYFZwziR9mMEO0ZfehHcsmcdTvuzQoXyxp8kgWM3t4Pdy5UV+SXsIP5+8wKh1h+t63m
	zkJRAnxiXpfjVNaccsArfbl+a6h+7E4mO6Z4LdR56AvkvJaahqrCRwHNxOR6h4smTcEYRu4C72dXb
	14wDgxwQHYgZBUB05jaCvjKlTwCzprXE9QrYlbP5WXyeslY+yC2a2+r2gfPUJHvCwNC8lsOQQ6qpB
	cnqhuGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBU3-0000000AeIe-1T5v;
	Mon, 17 Jun 2024 12:29:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTy-0000000AeFp-2CCe;
	Mon, 17 Jun 2024 12:29:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-705fff50de2so636336b3a.1;
        Mon, 17 Jun 2024 05:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718627350; x=1719232150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcWOvKjaH9VWKVfBKzGMg6R3MCBCRcDLPHcl7oHFM04=;
        b=h/QrUYoiPQtL0gnKz4Yun/eiFdcpIUFpiuVByoJGdIszwu1RW5lopsXiczFBsNUDT7
         rxDHnwaLnEC7ZipBazkWSO4tOc+p8wmmNR1leqlPIOE2OxLcTLsbPsXe3Vg+gBieGGuU
         /OHpRc7xCP6oDETAfIzF8bNV7gZMjXuVN0J6/CwcBI4HBxb6pYtmk1MQxnSyIyQqbLaM
         FFs85aspfyWQmkyxP4kWbdGaAo0wuELOdh0iyJ2BgOiXpEd3MFszICvdNpAlHzfqF6Hb
         sTRLM/EFULTFkKYMHj2Cu3RPSWAA705P3ZTGnS2TNW2yqc4XINdYzqlIPpEIgilU1AhH
         LSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627350; x=1719232150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcWOvKjaH9VWKVfBKzGMg6R3MCBCRcDLPHcl7oHFM04=;
        b=hKn3NS1xuCkplzn3UNU8FOOXsONdp9EmLPJo/pJRWg295hsoOWIewrAA0KIKzhL2iN
         P7ODplGLkIz/ivqxkokH0RSSCJuZCV2KwK/Q+MoMo91g55TCq6BVuDnxWM3u9LJXAyx+
         rNqo1yslnM7n4nCshElAFXaXAjc91ffWR1LLE+16wq9jMJPT3TjYQVvlLWnXqCkUYm69
         zCoqTB2T0m57XAzMtvxrkH4KifE+DhklfahzuZJ7kmOS31wwUc/HGDyyyIaIaFJV4zZq
         e3tn6M9/UFVYcA+1rHcx/9X4bCK3QyyFwJ42F65FF0mz93K6CYaFtroIjB36/8v874/I
         47FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdnXOpPCZ94tJkV1jGRXkMwat/gTzTyZ5E457bmKh6Jo7jionzbJmi/qIeXm5BpzKs/wfDXF40xsw6YfaaSF8DMHPH8Kukq31zwndO8LavAV7/OGC9kkNTKuzJ9n9HVudNy+0EXOR/dw5YGdb3K8PHFK1OZp4zABI=
X-Gm-Message-State: AOJu0YxOXu2oy3IhzpiVcjQ/0USwqRngltgAFczBUYHQWnKQOnEEdiol
	W3pAddoYmdD+FCDbODbifrWfNX0VFA+gYjBOsBH/EjQmavWvPO/l
X-Google-Smtp-Source: AGHT+IHs34JMMxUSWDdC9PVQ+jTFt1dLMIoOHcoE7HAc4QSMWJG3bWQkzm3dwwcsmhdR6Vmh2T9e0g==
X-Received: by 2002:a05:6a20:a123:b0:1b6:5b3a:9a4c with SMTP id adf61e73a8af0-1bae7d81c8bmr15214725637.2.1718627349711;
        Mon, 17 Jun 2024 05:29:09 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-705ccb3bf1csm7210162b3a.137.2024.06.17.05.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:29:09 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Date: Mon, 17 Jun 2024 17:58:26 +0530
Subject: [PATCH v2 3/3] dt-bindings: mfd: mt6397: Add reference for
 mediatek,mt6358-sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-mt6358-v2-3-5d9f0e99941e@gmail.com>
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
In-Reply-To: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Kartik Agarwala <agarwala.kartik@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=agarwala.kartik@gmail.com; h=from:subject:message-id;
 bh=kTwLRzuHZ4rQxBNiRcGhOk8o7CrdHie54ZwZ+nRp6Ns=;
 b=owEBbQKS/ZANAwAKAXiEk+OPlULqAcsmYgBmcCvzz6KRHv41QQjOaa6CrJR8ssn/l0qpihn7K
 50tAMYY05GJAjMEAAEKAB0WIQSJkbnrkCGnamD0k/R4hJPjj5VC6gUCZnAr8wAKCRB4hJPjj5VC
 6liwEACPYyQ52WObSkBjIepDcdHpTXzMZUkawClG3gPNK3TJ/JcAR0YECJfhtzxVM+3n6y7QEi7
 EmxJr/o8H1VnbI9Y/zDuDo+6kGRz1noZiy9x5Vm82vs4KunuVsbgz52y+7SosdFW0LsSD8CF45n
 D/AgUy1kVAtZFS/PpXQOKbMr9VZ+prOJ4mmduw28LgiHc9vQtrwJceotJ5nBskqEQOSACNpVzhE
 52Z3QrcM7GP7iUwvici8hBZ6GAEfHzRI2+iSlvayO6d6BbX3r9FHDtlfYjVWVMLEVBJTiYpTpNQ
 twQNE8aFAm9YdhqbiIcYVohbScUAL667JjiaLpP13gqyztm9lrYGN8C0PWnIJzfgbqE/zgCVDPM
 c2ibDYHvEElRBDklvQ670w97PWHAOagoIAdVGYP4E712mQfs8awIcBQ9xjzaQGaEj7RHTDdzDPT
 ERD6zUbVbuS5LraNSliGBn3JuUY5FrqCYJ0Or/lz1xA9hBicUQvwEFoBs4nBVfL9B9plPC+1X44
 MnNvv9prYA4/w0+ED+DUQRn78OG6t8Ns824nvFbjOOzdeak6okc/98my9k0e9LrXs20KZw6tYQN
 By7ClnMVTqO4p5Tx9NqMwAZHiWU+b0Oi8BZAfeyUVoqk7wJev5BH6gpRqKCbyy1UV2zRawt4MNm
 30e/T8iXMJKO+uA==
X-Developer-Key: i=agarwala.kartik@gmail.com; a=openpgp;
 fpr=8991B9EB9021A76A60F493F4788493E38F9542EA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_052910_606652_ADC755A1 
X-CRM114-Status: UNSURE (   9.26  )
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

Add reference for mediatek,mt6358-sound
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 10540aa7a..cf7fcc402 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -48,6 +48,7 @@ Optional subnodes:
 - codec
 	Required properties:
 		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
+	see ../sound/mediatek,mt6358.yaml
 - clk
 	Required properties:
 		- compatible: "mediatek,mt6397-clk"

-- 
2.34.1


