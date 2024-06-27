Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0171C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pocliNAoVNTjwAmPI4SdlGncSkrq4T1ZnfC3MYG3nM=; b=h5v4Bn4kAMHTzCB7hpVthASkwk
	UkbECSKN9kO59gbat5ozCQMqZ0t45sGq3VVjlrtVCUgRxa2Yun7077b4WdbW1w3TDqGbQgHt+9aKI
	+47EYpy6NTU+GZzd3VaSSyVrMOOlTF78Pns+KrqQ1GoswFWdPy819zFjPLhUopXm9l1WwAA6/toHN
	4x2SHw1XDvB9z5xKI3AeZRPMZqzQGa2pLCFk+YYbGfCPlEFJu+4NDFkFsyr3MkFumEcgOHi2A+wlB
	tEyteq/AFtMgVeUUdt4r3YkxGJzjim8TQs1dDkJQ7ectIbpIt1fKwUElAsTeeTS5YVhOvRGAkfLPW
	MgZlYzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmR6-00000009xL7-40F3;
	Thu, 27 Jun 2024 10:33:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQg-00000009xAF-3tNe
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:32:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so16043655e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484357; x=1720089157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pocliNAoVNTjwAmPI4SdlGncSkrq4T1ZnfC3MYG3nM=;
        b=Tz13oZ60R6UQVwC0KUwMmcY5Pono09Dk9neIxV05fq/H3X8VvcYm6YaJQvRfP44pIK
         bW0fGSpyUu4Ec3PgBjEXDr/dDu1N/4YglgqLMucCyw65H8YDBkdlit93n3Z6YhOd+M8B
         jl5XYKsxYYnDyZ+yJMNYW6afcTV9uWiMLLI2tzYOp/STz5bzcKaybdVWKi2h3sjIvyHj
         nBJwhjXKl5dxKCRxm3Vl5sG330+43A2tim5yCeVByCCWD/mWcQR/QDV15HDqQ1nAY0mE
         jVN3cPVj1TU/MseflfHCMLmhzqDJDl4D3UUYDBKF9b+wFdI7tWvnzXiALbGE1DV3MKcT
         YCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484357; x=1720089157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pocliNAoVNTjwAmPI4SdlGncSkrq4T1ZnfC3MYG3nM=;
        b=VPxt6Bt173tn65Fku6EvR8dfbAgUenQ6IGMNBXBy5eigDVSQAvbDaYkHrcNRZpP65g
         rdlgJ9UP6RpX08qGszktnO5wtDTcFU/EswoKFyIcVL2tmZ5zm0+rt8Ukijs3m67FY31M
         BisRaNl40uo+DII5npkzhzBD+hqDDlR0KGBpLt1AtI2JPGyaqqGccfe5oz3KCJFCi4dI
         rOYxbvmTndrFTkgsS1YMb0/lPMMXWctMlRdu1JQtIJBCi5JZs/SaRpJSvrmRZeZSC5Id
         OeROpw5gyQ7CyDhZ8FQ4/mY6/9GDonVXitbqsJamMIgShYckGdJVF/ALP12RRAieY8WY
         nCRg==
X-Forwarded-Encrypted: i=1; AJvYcCXKeY3tmGmCZYrEV2Yo8Dm+AHsAmueT5AcIfY/5nA0ow1GbANvTo+VdpRGH7bLcOnZFe/od/NkpdrpsKRdVltwpcLqzK6ZpLcGpWH80DXLFRjxS
X-Gm-Message-State: AOJu0YxTUgwdakXj5Wm2y0GzafYCSrrP39fXN421sDpCvogV88CgjsKU
	iKWBt0lEZp6jaADBY1R814b5+JzP5ZDBAbltcLqGNoWp7iEuKP/Wut4l5QPq5xI=
X-Google-Smtp-Source: AGHT+IGzsKQ645okLvBapJa1IPZvlBlt1QswcG6XLfpau6Jwa+Z4YLVVxe1f2AvIV7KeLFUfMZXx0A==
X-Received: by 2002:a05:6000:178a:b0:360:7887:31ae with SMTP id ffacd0b85a97d-366e95d37d3mr12440454f8f.54.1719484357309;
        Thu, 27 Jun 2024 03:32:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 12:32:17 +0200
Subject: [PATCH v4 1/7] dt-bindings: mfd: syscon: Drop hwlocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-1-dc6699a9f3e4@linaro.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Zb33PnEyoq7JgdCVFQY8c3fsqudJzBtmqbZshBBoQTU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+73BMgXoynDW3Ud4fMi0zPipmaTcLImpE92
 Fx4eYJBxjeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/uwAKCRDBN2bmhouD
 16o9D/wL/sfLuiHFTg9X1nKfJ4SjKti2z2aIxrrkHixYzPqk9OVt2u06E9hv1CcjXD08OnHa/S8
 zof6DtwKy0pQAL7ssRH6yo3KB1aM+LSoTChO0a3m5zI9OSz44GP0n1bc8dpRIffi0+kBFnZ2gPh
 d427I1oayBlX8Ytb6j5fzKvFWZ89Q0wAq3wNTOdeX17aok/YxCUp3pq+DunObpZofs4X9J1GQpR
 Fhz7daq8HedFR/r2gmliyhKtZwGgkk7bMQjW0cQhNWdtg5YvK3gcNQfsPI8XztqXzTAKI4OXIwp
 NP+yh/adub7xzF89QnjAsmKIlcSrZVEBxcY9iA0JtnavLamYgxgdTWIDL/pHfGTW0SQxh70kMQE
 Gg7AA8gi10NL32yzcJHz2nKaCP7HLka3B2dJ71ZW4R3/gIsk5Cn2jUFWspjeOqCgWYgbg515RG8
 ECXerrLy8VdPq9DoNazpg+0FT7BP4n0iA0oqgp5DuIWzGn4p5Zj+ANpb0s6leGzXNsM8ogHQsl6
 z5z53Olh/1BP1fWeUOKo/XcEkjYdOuHNpK92ISrwXnspc8uEd36gCKfe4/xD8p8Vz8316gKYdVF
 B/+zrB1if+/LOi7wcfxS6zEaCfiedcpPsbjae2j9LRi52rX8mkcaB/KilcsHrNAXmt9XPwH9Ra9
 GfQ9OLSIrbXNWig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033239_070065_AC15AF9B 
X-CRM114-Status: UNSURE (   7.80  )
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

Apparently there is no in-tree DTS syscon node having hwlocks, so drop
the property to simplify the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 993460c3cfe1..cc1e9fec5cc7 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -143,11 +143,6 @@ properties:
   resets:
     maxItems: 1
 
-  hwlocks:
-    maxItems: 1
-    description:
-      Reference to a phandle of a hardware spinlock provider node.
-
 required:
   - compatible
   - reg

-- 
2.43.0


