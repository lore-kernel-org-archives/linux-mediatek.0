Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC7C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0fRd7AQCnA3X3+RakO5/Ng9OrGcZZGhMJjhAzs05zQ=; b=UIkcxgFCaFXAjt
	V8R7pGTjaHn6RcGD+yN+j/4VmRNWcJwPgfPo2M4+vg5Yu0ZdPqNq8R8n9pwo2D5/SPpa1zuUBRMC7
	SN30BC/l8mGKBiry0D4zXE6aqTv7QhU94q68RWc688f62+dk2SQDTR9/8fNv/Hrc/WFh4M6vSO3md
	MgX4ZkYQP+E2cPO8JjV5392AQ/kPUC6JPy/eGg6uqMoKWqxM9DdOoGOPLtRcUpcUnYdaXeyEVWI6B
	ayio0v1VGFW06RzQApwq1tOQCXs6M7FP076iHY11mU6iWqUiUdk/SvQFLyTDsIGWv2IbJNm6kUXO5
	9Hd+r76cbYCkEJ/pcCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQApB-000OJM-0f;
	Wed, 17 Jan 2024 18:39:41 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAp7-000OIL-0A;
	Wed, 17 Jan 2024 18:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1705516763; x=1706121563; i=frank-w@public-files.de;
	bh=OGTSWYYYIj8c+SD8nKzKyjhCGDqhkunykC0KNhW8ywg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=AJgXuF5k8HVQ523E71D9cfqi+mrPAr1Ry4u89Ofc9EUCXkQp8nVePmThzNwSutvJ
	 +kxSD/6pyyjK+FlsFtinRsq85BS9EiBgM7wsgtO8nTIiSw7/qiUKKm8+DSh7A36Qo
	 +DErHSq7W2O3ZIfJ18l3wRWo9RkvL4Xo5MSyrPOvOjTSLPhkLoKtYi+mYazdSomtv
	 rM5GvsORLSpTqgviOJ6PFnrt5rXlhFQrYCbnz4SHLb2ybwz4rS9wR7Ir8/De7p5iu
	 iSXMhAZZqQ0NN0RIDPsBlY79O1glgLFtJEN7JGk4C8bLNzGOTTRvSIDNdhZtzRqbD
	 qIxPZrwk3MTnyZhCsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from frank-G5 ([217.61.151.254]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1qy5Br44rZ-012HW0; Wed, 17
 Jan 2024 19:39:23 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/2] Add reset controller to mt7988 infracfg
Date: Wed, 17 Jan 2024 19:39:12 +0100
Message-Id: <20240117183914.62122-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ot4r7tklUz8MgmS9LTbACzre8iQs8Hx+z+di0RWtZbnRPLQYiGe
 tp1PvtXKeDhzaJROf+ij6+lmA+6H+pl3FOxzMBLK7SPSL8D6asAo39bpgigkHGo1ObaFwQU
 QaTvaZQHDsvd6jeZEeDvbY+JQa61Xb73xO7orc323X1a2PNPAmf8vEHbrKReNfduQhbYFuj
 ToYdMGed60GurzKf5UWZQ==
UI-OutboundReport: notjunk:1;M01:P0:TNCFqyXqnyM=;cQqBF/HRLDu+oXyy8j8R83GDoir
 gbD3D6ICYH1whKRxsZtyuJcpVYLadHrticqut6pDQYYGdnCuxLIVMcr5qcoA+hRl1gFuP2+FT
 7T6lz5zU+PDmCISN4nWKX/EyAq0e55oFWhwUHZCN4pohOio4fsJ3W73UcYLydm0nk4krnExM6
 VYewiT7xZi7rt9mMhhQFU84bZvIvbUNUDSEaqo899/4De58JWGW/x0fyWUXh9rndGZ8Cel61n
 QyULho6zjXygWDA3ZWaJMbWQ6cWqt+pCzJf6CpbZrTE05bMTwL+4lmfO30sv3E3Lg2jrGO733
 fynr6fBGeCVi3Btbgn60F32f/bq4+aWd5qYJSQqRCCg9zFaZJyMDLCqppq2pCWXn+/0Z0wa4L
 yTqDxqc3/IGKNvI3qe2QYBBXs+CtFwkaokfgUVHRCP0yETGKNLirMNGhImc73dB5G1EvPWYFF
 pGr/lJm2i95OrXwhkKZC0dGwYzXJHYtXhrcHtaWF4/Ct+ysma2Nv+CwEk5a2MP2jfHu+NZbfw
 7oKl4LJ/ekMzAJO4LnjmNCfbAIlybEzVSK6dgupRC654wlz0hCIPLOJvD43eHLCkluQuZO/HD
 TdiPWW0qByzycKRQgGuxjIq5EapuINyep9q6xi9NyF2tEMMU4qOK4RySAXqAo9908GmwwZy4B
 zaq0aHOemzwFvgXpqhl1tW/fOpLgBQ2WyToM4jBBjlyWrxo76zVqcpn15FkXllaaQioGmNYdy
 EcKhOTBeANZgqt3X5aWgY4d7izw15+a0ippy09zDLBGVe9f2tW90DRIXwTLlmfZtQxs8Gln2i
 cJYE0nbq6Xe7+Ux+kDrEzNVvJHhU5xMOzifKNVvOtvhp+PP210hHoLLIMBLuHuVCeYzu9lVsL
 lScfk9ijLw/waxF2wzO97wUC6Sf/ToXtD5PkgjDDQMVQ9kAOv0YMKolmYlFohdYeZ53Ckvtj1
 RiiUFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_103937_477090_016F5ECA 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

Patches are based on clk-next due to recently added mt7988 clock driver:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

changes:
 v3:
   - start resets on RST0 offset (LVTS is RST1)
   - rename offset constants with MT7988 prefix (else collision with reset=
.h)
 v2:
   - change value of constant to 0 from 9
   - add missing SoB and commit-message for binding-patch


Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 reset IDs
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 23 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  6 +++++
 2 files changed, 29 insertions(+)

=2D-
2.34.1


