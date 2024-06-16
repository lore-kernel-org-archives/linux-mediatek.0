Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8D9C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=; b=s2Ux+KCZvHtPYWGccdjcvOl8SZ
	dzn4Etx6x7cvggvamTPaNJhMPze/6wAbbvKUvXOGGbVSCXB4X36/DTTgTd8peLRmsMBgku/wnWw6g
	nOVZbxL9FIAxYV22fWSjDjhx9ZJoC0IBkXh44VVORCLLd1PQykevBJClNdRCYZ7YaRdNs5hOs6WoT
	7vd/hNM2XoH+uwPs4ROhPrDodQiV+j6i2zGbEOXokU+RXM7B0Wu+l4d9MYKS/AFUbeUktHbWdt86S
	wfjOTsNdDqRanKWctJcdvl7MjB87rmJWWASzx+KmdVwPaxf3rTmleesYidyo3K25nn9USb41ymjO5
	wsS+49mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpoG-00000007akz-0AJM;
	Sun, 16 Jun 2024 13:20:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnP-00000007aD8-2tpz
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57cad4475e0so6424562a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543986; x=1719148786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=;
        b=deAiFh2UUWjXnjAHcx5RpDIxGjt0Lq1OArnatM7FTQXdOKKW3L4c5otsVC0C21fmOD
         +yRpQP1IO3b2rSOV7Jicy8EtiZZ9h+Z9ELyUsyM80Qn73P/qVpOPSPC1kmJBxiLqddf1
         rT01OQOZhkSqouwJ6cBGUw8LjDyJTk7gpYgk+Zg/fu24sAfOFvnJkFpLrF2xsZNspNAT
         +7To2YIXRsAravYbTEsj+xTOjVuFUVnIRzKkgIxqAukW4/jVe0sKOu5+Rlq6xj+g+ovq
         KOX2TsDEVE9aZQXajVIjgIzUlL+txJzJFsG2SlESY7oSLPHdHRqowC1lgFVGut+4jtzs
         w7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543986; x=1719148786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59XlO8N85CHKMZTE14dutfLqTOocIO6QaYNJIqLDR0E=;
        b=r3No3J7/9+puhHM4SJzsew2/Zsv7zoSx5tuVlcdouFHgxuMlrWJdJJiXMj4aNl82nc
         EbvvqR+mA8Tyf8F3MSRAdsXRaEZKE0+yn+HrmBuiADiyDlZLLdXAYUUMhJOAaysJlnmR
         uhS4WJ26Mog9qdTXRL37MdaIjCTHCY+HNX8Ia5AzBoJn1jzx7/+xieB3Gk46B8sYrjQm
         OUXrmJsekViRbSacj1DWHoFCpqi5XxLh76PtD/hXgjQJEkJiUqE6P/S6t+3BVbQsi7mQ
         oCjF6C+1IXmlWRMePVUFL0irqpHS88LBDNBinKmRF8R4SEyg1P7BZ+Lhsz9M/9LVhjWe
         El+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK2k96rLhOmHlBc71DBUz7BgtIaPf7BBzyRsNdZJbFGKsqGs3WVOHrsd9zFYbtL05ONddMaaLQUoT4gf4mWECWT9vAT7qhzCPbrbgyS7wew53A
X-Gm-Message-State: AOJu0Yxg8pI65G+vOsk7BP6ygoZF+e6rdKq6wj4Q5mP/U1LXzalfczS4
	i9SIyY0wbE3asWzLYfX89+hWD1XvOp/ppH6QJ/AUPAdLV/ITjOkWqVgN1WSPh7haWzEXTJlLhU7
	I
X-Google-Smtp-Source: AGHT+IH9u76WeDG3eOiV7luLeppMMIooUwFkUFTuoY0slKOmXnYuhfgrO3dbY2fhWktwljJZ7lGNaw==
X-Received: by 2002:a50:bac2:0:b0:57c:70b4:7ac with SMTP id 4fb4d7f45d1cf-57cbd8f1751mr5555044a12.15.1718543986242;
        Sun, 16 Jun 2024 06:19:46 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 16 Jun 2024 15:19:27 +0200
Subject: [PATCH v2 7/7] dt-bindings: mfd: syscon: Add APM poweroff mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-7-571b5850174a@linaro.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lJ28Y3M24JoUrkT0kfRU9mVaVheUptQt841EFO3wEWg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZj4ZbHwKVi5k4X3fOKFTh6iG71Wc9FEkgu9
 BVwcMkc0GWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mYwAKCRDBN2bmhouD
 16UkD/9aWHedSRSAu/MQBnkJNIZDzJAn/m8m53L7ouUBr4rLJafFHjvUX5yVm6vLUVtB5GQLg3d
 dn71OMvDG03cQU+3OFAY62l9RxNsWeerDto6k9CPN8HkMubrdZDM8VTWHFuF7Let01WJxUSoLJa
 YZxW2eIYh8K95Ob00fUJ5OpEz+aEsQOvgGggWETwYKVGiS/8gisoKurr/6UyGj8JxfNVeN3BB3s
 z/hS3cRlZSlFaL9srRvkDpJyuiOH2WDXmnTNFwUJrdcMFntXSRk74KAJIN3ag1kgrHFBh3mSp1e
 kKDyacV24jcCEl6Fxu5Ew+75NayxeLtu1z1fmpoa/AogjP/WmB0QhoqTc7K+LLtn5bxJDovSIxa
 sUMmZXE0ZRchoUchtVnQR0m+qDgb165ljTWq/CrMTTRCjmEbzOrEYpDuMPylPwom226N7HHfCog
 KWXYnGSEqF3URWvWDI+gL4y0Kki/AT0oKfMII4g+29hiupI18/gGVAKRv9vGUEuYFhFxP9Y/aYs
 YCqUvaSABgbpvS3y3d3t25Yq74uLftYhdSPJghBkoyyG9Oa2pSGhfNsNhTHlx/A5Q2KjGPykuP8
 B3Avj9TwacD7hDPnW2z1nJLTa+d12BpX1iVPlLVw6DJPPTrawfDID9A2UgYlcsGRQnE4yyAGmyb
 jZdxnLBn7yOaevA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061947_860191_0ADE4187 
X-CRM114-Status: UNSURE (   7.78  )
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

Add compatible for an already used syscon poweroff/mailbox block in APM.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index d4e9533cf3fe..70e3a4465b4f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -41,6 +41,8 @@ select:
           - amlogic,meson8b-analog-top
           - amlogic,meson8-pmu
           - amlogic,meson8b-pmu
+          - apm,merlin-poweroff-mailbox
+          - apm,mustang-poweroff-mailbox
           - apm,xgene-csw
           - apm,xgene-efuse
           - apm,xgene-mcb
@@ -133,6 +135,8 @@ properties:
           - amlogic,meson8b-analog-top
           - amlogic,meson8-pmu
           - amlogic,meson8b-pmu
+          - apm,merlin-poweroff-mailbox
+          - apm,mustang-poweroff-mailbox
           - apm,xgene-csw
           - apm,xgene-efuse
           - apm,xgene-mcb

-- 
2.43.0


