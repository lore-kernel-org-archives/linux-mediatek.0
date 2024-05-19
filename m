Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B1BC25B79
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJzQsvsL1/6Fsadk/3uxZSUhJhH3mZxPfX2NIOU9xQg=; b=ZdKP1yGgGZgdHjvEPGo4olvmqW
	wc4wfUTtl5WdgW60Ri7ojFcudkqLLHahRWh25VFO0X+/RLkNAGlrbY4zxgdPS6W5HKr38G6SIbKYz
	7W5U/g9UFGng2K1re32QRw+5ygqzfoHEDa3JA7PMOQRVNoB/nBx5HhvaECaPuEXgUlIr94+YCyadM
	AlgWHInC/wt+XHZF+qNgRfao0t5ffFDD/t0LGWBeqtsK83WO4585W1+A7jZNOXCUx1a8+XRcJvmQo
	TzWzmqNjEmsvapBau+lyFrmcIgAZFAItpa+2cvL1Ol3VQRcR3ZmiGlUvPJ9Gy4PtCvNIw8TtxpLL4
	2CLpcd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lVI-0000000CWrl-3Zeu;
	Sun, 19 May 2024 18:43:28 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUe-0000000CWNA-23tl
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so5247311fa.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144166; x=1716748966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJzQsvsL1/6Fsadk/3uxZSUhJhH3mZxPfX2NIOU9xQg=;
        b=eLx1dl9AGck0FZJD20f00C0bOrc7itRN+QUHkN2WLsiGKbEkQPoSzgIpR4FREhs4z7
         4GQWEYlvFkh78WiM5i0piOXeLbdUVulaAKRLucXO5XIULG4jojpd+03H6DDqCWd5qqRL
         UxXac52hcM3tJbQdVhLIZUsz0wM2B55Ob9puF0mc0Za3eRIe3E+jY82riNPKOcTF6Acg
         eVrwh08JZrNlg97K3UL8DW6QV+5mvHYzXZLte+eblVuV4+Qq6zZC+Ex5a9NCQbzNlBPN
         7CzM/TGKTZXG8NmAyiNHZLcFJ5NP10IhI2Ok/kWUqDwzGM1/Zz9AXiAqYWbvER8LqgPa
         a8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144166; x=1716748966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJzQsvsL1/6Fsadk/3uxZSUhJhH3mZxPfX2NIOU9xQg=;
        b=YXBraSG3sWgrStuEyGW3QA0JX3mGh+6wt9h+h3guFBTBzZNRTs/8ytBXp9xaqmV0aZ
         On72DCyYxQH4YaxE9xKBsl7uo8yQfZ+i3P0yqelSH/X24tbO1hgN6JdkARnxi4WNaBmb
         vOE43gBNiOly5nrAEEZDBAJBk6/XwvkPcgfYoDFweLinuTeYMCeI53Uo7fHmIMrFdjDp
         xbhN57+a6dTSqKnh58DyKihHbcBovHtjjC4UHtP4MlZwFDnEvyRxjx5uyn+JBxuXFv2N
         j0Urv5MQZWm6IKwMI3ypDKu3ISzo0Nd9wJg/HPVmoptrxyOM+WsBCUB2158wWcDn6CfH
         1cGw==
X-Forwarded-Encrypted: i=1; AJvYcCXtvEPmtiYd/83wNgcLSl9+5lJL32gAPIiz1TO4dakT2aD3t0VLmsMm3ACLceS6ec20Xxu4QnXkKupK2wPcIvxZLu/KG4tiPtvy0znYmM/Vowfm
X-Gm-Message-State: AOJu0Yzk1PRbkVH0uj6nr+VqfKOK8G5zolNCloPbONKX2gP+MyGkFft+
	FnO5rL7NBJ6yj2OxeapJ/D6AnLhLR/vp98raDoXZraxsHiJtzbqP0irgK7T08SY=
X-Google-Smtp-Source: AGHT+IEEBBwXOSZRHdGqRYoeDSt52xBh98K8OHuPaxav3A3RFKfuIQIZyvr9n42gPgHOBTx6hSh0jA==
X-Received: by 2002:a2e:8785:0:b0:2e2:802:7d5f with SMTP id 38308e7fff4ca-2e51fe532c5mr192904301fa.15.1716144166470;
        Sun, 19 May 2024 11:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:22 +0200
Subject: [PATCH 7/8] dt-bindings: mfd: syscon: Add APM poweroff mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-7-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RLGfUnNrbupCrUxJFM3mfX15wDi98tY0Qn5zbwzBgEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgWwKd/7X2YXGa1fvg1B2yhpgR0URstwon0T
 ibqvsQo7sCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIFgAKCRDBN2bmhouD
 1z+kEACKLaKdIgKLsEKmFBEJRKVlh3JHvjVLvRZ2e61dp865A987D1vfDvoId5UXWlE7fJrPqJI
 eN8SfHvUQ/kao824zFlfom9NTiPUoYyrUx1du0nf03s8sUKmRPlkMXhbG1+oJMBpIQysM2yKPhx
 82FSbafBwE74L33EHqWzI9yoelaCXjXRtyTD3yvtMRd/wCJL9Hxfl+R+oU3dZSbvxvh8zGGX+f+
 iN43ofFQOJuJ7uJqjxhCDJEjD4yUhU9PEaZZiMAPTZg1m91xysOKwE/2ShP2UtMhz1ASfmSDMNW
 w1yvqduPLvMqGUOvkvHbcu1UqL8jLIC8YeL4tn/+VTtdiDNDjP8NPS2xNMptsUzOmnn5+t2IyYT
 0BRn3YRg1H9zoPhoONugiqcaLxPIJuSyBMsf7ESRw/gKqVnK8X+gpVW0uYtijhGxoUI/e0bILzS
 Cl7+bcCOGJtndxePL5lhgBEkiU2Y2Xw8yKV/kkqXGJ+wNPS90gOjuoMPp7S1mKikgADLwV/gKnX
 TjJY//Qs16YNiN4cwbskpHHsM4DqSik7307MN8wmmGwxRUkVRDyXVzb1Ux/9DTxcOYpzC7EZH5n
 l4vcO9rLmy5mthJal9sjEqco/S5DDYFEHqBrhqtDveZYjQCTlbNw7SC0s4QIJCpzB8xk02FdQU3
 3fQw3ANM83b5BSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114248_714681_CAE8043A 
X-CRM114-Status: UNSURE (   8.36  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 70e3961bc96f..dd35e613d633 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -37,6 +37,8 @@ properties:
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


