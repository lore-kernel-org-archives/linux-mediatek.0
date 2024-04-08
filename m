Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD733C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TolEHnRB3vUYGE7q62u3J6sD3cnRbmk3MB12lZBzsxM=; b=jlZYCT/U2dpLYCKxTxqkChml05
	8oiCSJRNQyK93yrrNl1ZeflBYerF2jyBx4JZNL2/rWLw1HhH0kFwLyXYnWPBgS4t+/TYfVbl7+FY0
	mvYCljne1ph/OBbQ9WP/VLq4T8rm5lkhbK2QYrvUG8aES/BosxBc5jSHJMKTR28f6DASSX8y/qixl
	k3z8Yax43LKrxoCSomyKl+1sFEEbHJ574/FQsbB4O2FrQL1q3cWwut+Sp8/jRe/KUtEfKzrqw2Dfs
	2O8iwk60eGcjEgOQB0A8iIXXShA36nYYS05b9eC0sspOfCeFRg9KpsZZtA6ZpnufXZs9gGxKimZVj
	Di3mNeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtusf-0000000GeiU-1Lg5;
	Mon, 08 Apr 2024 19:42:13 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtusX-0000000Geev-1Zgf;
	Mon, 08 Apr 2024 19:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1712604740; bh=Nccis8rsaBck9fRu/CatUT+VUUebOHkgbYvovF4nZ3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=yh4zZlrKcOKUuruJ745llOOpJYWzwqF4t/9fnDiVVtnYCBuRkEBqfWCmlSJk7rZrr
	 nBhM0f2gzyeLSRJuV1Zqm34CwCZt92AmCiTF48jgVWJqfnbKvWUKDwYYHGq04lGM5F
	 EE2M5du0JBaWy7cO2ejiny7TgoaTdR5HTO+OdcMc=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 08 Apr 2024 21:32:03 +0200
Subject: [PATCH 1/2] dt-bindings: mailbox: qcom: Add MSM8974 APCS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-msm8974-apcs-v1-1-90cb7368836e@z3ntu.xyz>
References: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
In-Reply-To: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Nccis8rsaBck9fRu/CatUT+VUUebOHkgbYvovF4nZ3U=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmFEZBBjwtSDCjmjKAyEKXtgGVDOEURN04C83op
 6/LDnF0F9aJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZhRGQQAKCRBy2EO4nU3X
 VuAzEACygPzVZE1hC/n2HuL3hKa08RRERS3Cw63C6cudFU/KgwykUNDTCjhAPQP9OEPrv8tQJwS
 eYs5ViRgJaUh9wcxGWwU6g/3KBW6H0LSrIe9NK0TTol7pJiJyCoFFEfC6Y17GwsH1c4E+sNbk9H
 06gWTlrZv2Nu0bozdqBIgfkvnZe86FcX4OcUO8RDvf2exVnwl4lFNQ8SpLNtPKgT5kdOPmkZkb+
 S1PRhq4C85u0loESma6nUAYsm/yq2I4MgKJGF7hekxAJ2NbQwc5oAJzQnMMaeQDGNosS7bLgX4M
 52JUusXAwadT31d3kwgCYzIMJvBp2X7Ro146iV5btDd8o4AqlAixnSr6Uxik00/3myafvblX+gK
 fznvJUd1FzxIOg6WCj+qgv3t3R8cIt6Jy0o+riJxzdO8mZuLy/Sbfi1LqhUwSR2HYng422LEVTW
 N46XMZZz54fYOcIrOIajcTnvmplbjpWAqm1+xjyNV9rGReOmuDZBaLqGv7z15elm6iKg/Crwgbw
 eiSYhRAWDoyQVrT/N0LB2sTVZ1+I+uuDDnwrSYm7OuhCy+U4gpHGJjmi4opwShEWr87hn/2vxtt
 ct/AZmLoLcB2COSEyN8o7ACyxQCsxeSXsi1o6J2i4R55rjLHoyCb+klZetSmSYp1Il//LjNIzH2
 3sh9YlOER06qeoQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_124205_679467_A7312947 
X-CRM114-Status: UNSURE (   7.30  )
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

Add compatible for the Qualcomm MSM8974 APCS block.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 79eb523b8436..982c741e6225 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -30,6 +30,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - qcom,msm8974-apcs-kpss-global
               - qcom,msm8976-apcs-kpss-global
           - const: qcom,msm8994-apcs-kpss-global
           - const: syscon

-- 
2.44.0


