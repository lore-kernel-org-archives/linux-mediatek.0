Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206ABC48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s3bGtiNlRsHrcXKTk9RvPlEL9pVcHOHPkU2yGNQQViY=; b=eFVJJc7nOjl2dHjddatI3anwE8
	cOSCl20G3GmPJslgY9iP8h08gpuBjyUKf63mtQOra8CcwwIa7v7cr5Psk+nlR9Sz5CMmMUA91sdpu
	DkDLnuJ2pE3ckTbfJAZnUEETyGqswU2zjkmmDjcCf9k9SEjNXxJLnEVblJzcJWxMjYlHighGvcrIU
	8fRhwiwe5fMedRoCudonBvMy9lJilRLV1sEhNafs3MiFJh6RmQ38d4cgOVnEmf3CV1nP7Sp8B1+Tg
	tq+28zqRTmz8Nu5Ri+soMg9vLp/12jtze9KTWND2xjascO3Oay+F+9sgioMNoIfoH7Ph2GTJTTxAL
	ZhA7Lrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6T-0000000FanV-2MjB;
	Thu, 15 Feb 2024 09:32:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY6N-0000000FaiN-0eQI;
	Thu, 15 Feb 2024 09:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707989539; x=1739525539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s3bGtiNlRsHrcXKTk9RvPlEL9pVcHOHPkU2yGNQQViY=;
  b=aTvTU+V8W3dqJOKNx1psmoJMB9d5L/u3RmJ2NQOMQc6cblJh9fJ/vY8M
   McdTxlxOP9aC1fXUMg3olNiDGjpP2NFnux1Qy9aRMKbS9oVLBA3iIikWL
   UG68bOcR48Rf6pQewpfWw9s/AiYZEZ5gHRy2+0cvGvLNXxgfhI0ZHK1qo
   wNbZt3vXNPWsN08BW0wl12/p+VFZybsjQ4E2bBtNg4d3tMueWqETfpuSy
   8rCDfGThVuhsacy9+ky3qu9d9tNku5PH3dMxm+bLC1QJKuTqJ65EcHdF6
   ooSa2Ewj2izovKd1fwfiOBjkHE5tPMVIO/N+HU+vvHsmrUlOKmtQAYgwU
   A==;
X-IronPort-AV: E=Sophos;i="6.06,161,1705359600"; 
   d="scan'208";a="35420058"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Feb 2024 10:32:16 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E6563280075;
	Thu, 15 Feb 2024 10:32:15 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/2] extcon-usb-gpio YAML conversion
Date: Thu, 15 Feb 2024 10:32:12 +0100
Message-Id: <20240215093214.796821-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_013219_608716_06250AC4 
X-CRM114-Status: GOOD (  11.25  )
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

Hi everyone,

it seems these two patches got missed from v4[1]. So v5 is a new version only
containing the patches not applied yet. The rebase also includes a slight
change to the mediatek patch.

Changes in v5:
* rebased to next-20240215

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230724103914.1779027-1-alexander.stein@ew.tq-group.com/

Alexander Stein (2):
  dt-bindings: extcon-usb-gpio: convert to DT schema format
  arm64: dts: mediatek: Replace deprecated extcon-usb-gpio
    id-gpio/vbus-gpio properties

 .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
 .../bindings/extcon/extcon-usb-gpio.yaml      | 51 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   |  4 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  2 +-
 4 files changed, 54 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml

-- 
2.34.1


