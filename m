Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FFFC4829B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J3t/dCk69ENxLEtiFl6GrgXJweCO07ULmDgCmo0QZh4=; b=Mp/JUK4sFSH0A7
	iAgHGc7iqbsd+Q5XG9FYacljKkCddLI7O23miA+uVlPe0Z+Q20vTeNE6jp4UKSmD9kNdasYvrSU7j
	o6g2JE2A+nhVjjSBZ+zbzpYxvPoog07MVsVlm9GLUgM4NF/hilRGPbDmhhhpqfdVlhpZgNrCTxhJH
	DEs9DsJYMYCTfme2NBrV4c3RnPTrIhvYQ4fRMSno+4kRTO4vmOhZyjXE57mUB0eDXkC3/nT6MNU0q
	mlao1LM2aJBE0HQVMYQdZSrB7HfkKdV3cS4hC7MuW8ucDDc/EbdixYZDjc2oUMe7SUuZ1MGvMN/sV
	RaITHJQyzeMeXa0/RtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXUwy-00000009BxI-0qqe;
	Tue, 06 Feb 2024 23:34:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXUwt-00000009Bv8-0oIx
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 23:33:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a36126ee41eso4340466b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 15:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707262432; x=1707867232; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3t/dCk69ENxLEtiFl6GrgXJweCO07ULmDgCmo0QZh4=;
        b=n8K+fKZuvDU1/j9M4z+DOzJM5JKHHnAo2r2lcFjavu3C3/rHjarpp5d9R5jFvGP4D0
         uwK9VQ+mKG9SgQbOe3DRShw5FIynVH95r1pTl/53XQen9OY5f4QfqrV16hgiVB4thUlD
         AGJrsa8KyFqOpMlvlb7WaOW2ZJeDG86v2mMCSdRiGgX9+ftkemsRkQzZg/xRkaI9G6qN
         Upf41lQCWISapwa6u87m7Ub8ncIb7LbX7cNV/gmUNrUGXDnmsuKAbKUNY9VRtpZ4Ogaw
         r5XoW5tlm+R8ARYd/VSCUbVC0+NOBmo54Tyti5s7lCZIlcI/nB+VA/TGehpjiPj1EaYv
         2syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707262432; x=1707867232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3t/dCk69ENxLEtiFl6GrgXJweCO07ULmDgCmo0QZh4=;
        b=gP2xs+E2txUVMJ2aBYjf9DIxsZIUp3gvv2Vh+2XJrBmJh+5jPMAEquJs8Z/u0ktbqw
         G8rABdl1zzurVsRbQylidBjIUhxPQJCxRwmlTp4h7BRQSA27qLDgwBfsjKtefPPmyCH5
         AQlXmyOO9BUKxSQt1mnvmEc6A3/p9IvyhEpLQdj4+Lqmpq0LcZw+sbDFOP8flGLfROYe
         vO/4arR8z2SYBB1K1E6Ipyu6SaDJyrNx5hHq4q7HzABcRBxZOjjXodR7IGisJHJeixhN
         gZ5ucuv2RSIwzxObktV6rJwwlJYjzlZG/4Tglk30puD/6U10+UN+J8sNcfJ6fosUs5Xh
         9WBg==
X-Gm-Message-State: AOJu0Yz/ki1FFEVPoOZ0qRwa4gMX/FITtZG265Ef+kwz9gHjuNhjuxLs
	Zh0qvs2WTIWTRS63qk6XTIXPSbdb5DvUKptkO1giZyRuL4Oqeb3SgihggJiEjLw=
X-Google-Smtp-Source: AGHT+IHChQ4b8HUl5ZWL3mUPsNr4TOqpEOvJqMc5tmddRtG1OJQD1z/pv6D8ttNAMEN6b8MIDkzaUA==
X-Received: by 2002:a17:906:301b:b0:a38:2694:46f9 with SMTP id 27-20020a170906301b00b00a38269446f9mr2007544ejz.71.1707262432016;
        Tue, 06 Feb 2024 15:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSQTuvLi1jJ2nPud0S4+sepdTgNa2Nigx8K+PbWd4I4nELkynhotStbXMK3XK4l1oPPAlzspPSo7I5EUjyxzeYGtsOJ446PZEfG6TICWzDQKVYHF1VPjs7PKAps+L4kNOzIyuyGyaZ7Xc57+/I6qhT5nID5ty6ydEM5ssVOgApdNVxl7Y8rANft9+lA27/gn52HSi25F5H3Cz0zd0sbjeoZXTXww/rlOJRjY99QCdElgPMIIvVFP/E5NbmYqpuDPsC2safVHqDZfZM6h4SB8+s5jzhIjCBIQ0O9zHgiVMsg+ARJkCDHpEpFo/E1cQlddUr8/SbuUxuAW5f3uBoZ896CZHmM4frx0S/o60mN3K11X9oTCU39WxHPWOneUWS
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a36ed37683fsm72404ejc.215.2024.02.06.15.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 15:33:51 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC 0/2] spmi: Add multi master support
Date: Wed, 07 Feb 2024 01:33:41 +0200
Message-Id: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXBwmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIwNz3eKC3Ezd3NKcEiCZWFySWqRbXFpQkF9UomthbJRobmCSZG5umaQ
 E1F9QlJqWWQE2O1opyM1ZKba2FgBmdoGrcAAAAA==
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uUa/Ho3Wm4SxUj+BbGgsm/fyqzW+5eMAhtSXlwrvm0M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlwsHXBTBDUHkw22LNTcEGnFGBZ3ed0WbfJnF1y
 niQsAL7VQWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcLB1wAKCRAbX0TJAJUV
 VnnLD/9XlbcGQXYnjM2J4ynDwPwRpDPDYJJrZSrHKt8dkZozLK0uEUvFivSsgRF0Oa2MrJNyeh9
 i4ixNnZwvFa4jB5SFVFJuFvwgja1dJwPLwCzdqIm+voss5v9XYt254D+N5uuCxcVcrfHQAPE78m
 pTBy6rnrXPVYzDjp2jJByWbXPZwPp2GdCQeBGrffVWQOqVfpGQZuU1/MnuDOD/3Lwv6qukgVTHP
 PrXx012Ts341rhufybu/z9dKotXDjg0kRPL0gdhoxxLpn2/lD3Dt/k2GSnHGutcTft2VPTRIzV2
 IGBwztmXS/ACt2EqGFNqEYxnFwu16buKMsusbjPB0fd8pdhXCle+2yHTUGQ3lzcjeBk9i99o+cc
 BD+dQqVlRWmpvTSmibrAbpGQWdc41TuOW+YAmE443hK3g1/mPrX6GQqooXF15+PMgYshkU0vPNE
 xZmFp7ilYWRRH9MiuxZfELbYURWAyiFIRxYKhka6XvT1KFD018ttajfW1gqcgY4F1rCfuhIPobq
 5bvuBXl3cgQbH2baq5QmIVI0nu5EWjwtMoqIqcZR5xcrECQ4gRl1aLVM5k0iLwdpDdpdDWrLeRJ
 SfmhNv233g7TsVX9ZE+Zffge/GXh6lfbb7vw8vbVBqEw+a1AfFEF0tGmven58863MIMLeJapq84
 W2uCzVA1cmdE42A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_153355_452914_54FCBFCE 
X-CRM114-Status: UNSURE (   7.58  )
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

Newer SPMI controller (v7) found on Qualcomm platforms
provide support for multiple bus master. So add support
for multiple masters in both the generic framework and
the Qualcomm SPMI PMIC Arbiter driver.

Currently, the DT child nodes of the spmi controller node
are the slave devices connected to the bus. This patchset
proposes another layer of nodes in between. They would be
the master bus nodes. They will not be populated as separate
devices as they need to share register regions with the controller.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      spmi: Add support for multi-master
      spmi: pmic-arb: Add support for multi-master

 drivers/spmi/spmi-mtk-pmif.c |   6 +-
 drivers/spmi/spmi-pmic-arb.c | 711 +++++++++++++++++++++++++++----------------
 drivers/spmi/spmi.c          |  76 +++--
 include/linux/spmi.h         |  10 +-
 4 files changed, 506 insertions(+), 297 deletions(-)
---
base-commit: ac139fc7db67968e5061715508b5fc4aa7c40c56
change-id: 20240207-spmi-multi-master-support-832a704b779b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


