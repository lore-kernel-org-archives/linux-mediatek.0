Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E0AF9D0C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2026 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RjF0GD0b/Nr0GjTW7ctDwC7y5+RIwaHZw6wuFOcwstc=; b=BJcegmT+2tor6C
	zt1AysOHWJMqRcgzOC4Cl8p+6rsoW9vsSkC7K4FTE2TzJ77RBC/w7JCgKre1Rn6ytzgU1BOApAJsy
	rRRrhsC3EpobHQEkJNQUd6OR0ng5wKU0XRcI8c2cOhdO+RuhFH/EOiVQcjjmY0LJ+q0ei6hWYASUz
	CW2CUCUIhfn3q5MsfzG8pWcyHF+H5H6rV8Y92V3w3bQdLamyTkN+MG0hKteNtMXsuRVa51H+5KYyW
	DIQkwv2bk9vzwdwf+oP01W0Kg2UX1VuwNtJ/Sf2BdpQvPUn+xCiL3ySEKUka5+6QnQAFUMQ+NKiMg
	Ynm7Q1mIrF9binb1F3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCw-0000000HFer-3Xf4;
	Tue, 14 Apr 2026 11:45:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcCt-0000000HFcL-2R29;
	Tue, 14 Apr 2026 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776167124;
	bh=aI+GsF4qLZxdAdL4+6dfOIL7e+YBWTxqXJ+gFC9fnX0=;
	h=From:Subject:Date:To:Cc:From;
	b=a3Ww08EN2FtM/L76S/PV5DUWhAUDxQKM1HZ19P2dsn7sC8tqFMLSFDAjwhhP4DSlB
	 BsM80pbeLSCFHNSAzXpXye3/A01brdEaZPAozqjOOVEo6cAZJ7uQrKAyO1OlsYNKcf
	 XoJ+zlkZ7N4wD0n9JHqJA+NzIF7YE2JbTQn7Gp/vR580bDLidO2VvpKKm4LYTBpHHv
	 oNRWcz2kJtAtLRuCms9KXYyqbsFcybUFsAP/16vLrEq5PgIV0t12Fl5a8k8MBWzJ9b
	 2ojnWFsd7yyW11xzqNC54OctYlC/sqLIxSC2bpipDtzVxsgMtt5r1GFFJLYtmzr8nH
	 vi1zezhZ2hnPA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0904D17E12E5;
	Tue, 14 Apr 2026 13:45:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360 PMIC regulator
 supply cleanup
Date: Tue, 14 Apr 2026 13:44:09 +0200
Message-Id: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrDIBBEf0X2uQtqLpT8SsmD2m26tBqrJgRC/
 r3SdN7OwJzZIVNiyjCIHRKtnHkOFdRFgHuaMBHyvTJoqXvZqgZ9eeGktJQYPTt0bzJhidjXtI2
 9drbTUMcx0YO3n/g2npzos1R/OUuwJhO62Xsugwi0Ffx/SBiP4wsNoZI5mQAAAA==
X-Change-ID: 20260413-mtk-g1200-pmic-cleanup-666643b85b52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776167122; l=1472;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=aI+GsF4qLZxdAdL4+6dfOIL7e+YBWTxqXJ+gFC9fnX0=;
 b=+Q4SR4LvyWtlRcvDWXR3m1Kwm9b2GQ/qVx5JIaActwhspyeGtCkrRFh9fmrQY+6FY0stzqrzF
 CtyJwFU+4oMAcDTfHBOPmAuR0Q1X+KySbiFCbym0eOxXoUupL5ZZ/np
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044527_799058_549E0565 
X-CRM114-Status: GOOD (  10.91  )
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

This series goal is to cleanup the power supplies of MT6315 and MT6360
PMIC regulators, that are either missing or incorrect in the Mediatek
Genio 1200-EVK board devicetree.

Patch 1 completes the MT6360 dt-bindings by adding the missing power
supply descriptions for its buck regulators, that already handled by
the mt6360 regulator driver.
Patch 2 adds for the board the MT6315 regulator supply properties, that
were added in the dt-bindings by [1].
Patch 3 adds for the board the MT6360 regulator supply properties and
fixes the existing one.

The series has been tested on Genio 1200-EVK board with a kernel based
on linux-next (tag: next-20260410).

[1]: https://lore.kernel.org/linux-mediatek/20260326081050.1115201-1-wenst@chromium.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      regulator: dt-bindings: mt6360: add buck regulator supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies

 .../bindings/regulator/mt6360-regulator.yaml       |  4 +++
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 32 +++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
---
base-commit: f244905cd8cff7a7249cd3dac8a366e02d61ad4f
change-id: 20260413-mtk-g1200-pmic-cleanup-666643b85b52

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


