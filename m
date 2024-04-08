Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A3CC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqkIuNm1JvEyePFpAR4YauObY1X7gZk96INkauNCo2k=; b=QunRmwKjjtQcg5
	QRlaj9q8EpHEfRRdbyVj4n6JpcbyMyx+VIbZUkfjWJ96CmOZpA29LxV67RFPgysLJgyStZxBVkOyz
	Bl1D7mesOsOn2xULi11Dho2VdAcFV5oG4c9prXRbmrn7WTPUu5QZp3LRxnkDhlzbnwzCmqvuiKHQf
	VYNoH4wsqCP0s2vNAN1Mkz+TX+Ro0dCbHCafs018+QTA/leG3P5vYahkh/upI6ReT7D+FrRPN6a86
	azvuOpf+01sabIsk6152eIY6FSlQpYEjGWEsTQ3dIa3PnZ3JPk0Qos0IHhBrHwy29KS2mU+gYNE7r
	kSuOLMvsZOZj+cExW9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtusa-0000000Geh3-2zug;
	Mon, 08 Apr 2024 19:42:08 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtusX-0000000Geet-18au;
	Mon, 08 Apr 2024 19:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1712604739; bh=zudAXqpn9mf3HFPDC+kTT1cgsGZk40aZNFOEPMKKCdQ=;
	h=From:Subject:Date:To:Cc;
	b=m4J8Ei+2+YMhlAzpnX3J616asokoPkpL7aBW6ieKHhjSLpFtokP3SR6nSwO6qD1MI
	 HrpTU6uraXs87OzuxZTVq9syQX06ffYGRIcjrXOkMR98ljYg5i3wZpAwsbo05fjj84
	 ZFRnRz92DhDV1dMMiRvxPCMRLUP3Du3RjnMzNxGw=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/2] Fix msm8974 apcs syscon compatible
Date: Mon, 08 Apr 2024 21:32:02 +0200
Message-Id: <20240408-msm8974-apcs-v1-0-90cb7368836e@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJGFGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwML3dziXAtLcxPdxILkYt0kc3Mz0zSzpMQkS0sloJaCotS0zAqwcdG
 xtbUA/bOByF4AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=zudAXqpn9mf3HFPDC+kTT1cgsGZk40aZNFOEPMKKCdQ=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmFEY5QnYa4UqJ3YQ50ncYaHeLlY7gISmJKDML+
 HxP5t4P97WJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZhRGOQAKCRBy2EO4nU3X
 VjGSEAC02drA53tQrn15NIkINyAsUiqu0R1lDucjuNd6OXkwSM8+DNRZR0kh6Cvu4vKpfBpM8F9
 6De0HGyqRYIV2beakDYuVkIvh5PJxJIM0mfrdECDsYb2oIVtbNgbMfllLJOWM0i7keP6JYeyZya
 JBq3qDjb4DHu1Bj1YWqVrgVgbGRQSoH08F79PXW3Db9IZcmWoN87zv2dX2uQ+k5RBVELvWSZaBn
 oCwtBZ+J06ifvTixxDFuk118PgXuz7E9/076UqQl9r8K9CkseUJl83rnw5ThM0Prfp/M5N+2R+m
 98CUl5Uhcvv9VkueBpMvPp7YgLWOCBn/+E4PzPKuBReVY/X5kvFuaLqSf3NIA0BlE6qbJyCiX5D
 X2r02xFjvfNxbw00qVZ8c2+uKWrLgRs4PJtHniNzjhEeOVFfdrlEJ92+EzClO0rIQuRG06n9/Dd
 AU/7oK25DQqepqC/mmdGHGIrT4UGXUVqxAZTyehFfkRVH3Iix7GYHQznxLVB0p/EvLBVweFL10I
 bTWfWda1bbE4Kui9RTkCV1TSTyLP5yUterrNPvqsfBSbeI8h3WDm+kc6URm8wb33R71MHUUNctw
 jBtYJ/nMl8XEieSE9mWgz7c4Z9X/OSZSJBs5alIdI4Na31gqmqAm558g3Rq/TlYsmFdhLIk7Xu+
 p0Bp1JlWWHth+Ig==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_124205_483478_30A05455 
X-CRM114-Status: UNSURE (   6.79  )
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

Finally fix a warning about the apcs-global syscon used on msm8974 that
has been around forever.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Luca Weiss (2):
      dt-bindings: mailbox: qcom: Add MSM8974 APCS compatible
      ARM: dts: qcom: msm8974: Use proper compatible for APCS syscon

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                            | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
change-id: 20240408-msm8974-apcs-b7765f6bab99

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


