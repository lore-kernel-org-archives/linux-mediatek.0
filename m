Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D32C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjLqMc8NpJbLnT48m+MsTv3JPGTaqXfmRrPUyJi7IiU=; b=P9J+V+n71EudD5vV5vp8DhkrlH
	q+XNwdW9P/EXzIUn+pLqShKz0cknnqxoy5Rlgy6nuII+T3X+R7F+uosK9RVT9m7C+ywf9plmvs58a
	JYKMaDsL/2t/0ZGr8hzajVmXPWrnYr6usJlM0EDSuc+EgOJlNA4zVZhWFs5XTa4QR1XPAv81X8eVm
	P1b353CrB252XdzhQ/N9v1HCBrIdDKXge5lXIks94GsxDedp7jKDzSwPD65Xc+hGZNhTP8SA3ARj8
	orQBz6C2A0H3qFRpkOsOdmThT8OJXdhSX/b+FvIeBIF0HJTlENJOVZL4z9DWOe7X2J0hBZdWTd6uH
	5w77zTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL4q-006A3F-D7; Thu, 08 Sep 2022 17:12:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL4K-0069WT-D2; Thu, 08 Sep 2022 17:12:01 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 581D76601F99;
	Thu,  8 Sep 2022 18:11:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662657118;
	bh=VsIS3dSMx2WzTOtjQQmlSmAEX/x9faKlbCRiz+4NKNw=;
	h=From:To:Cc:Subject:Date:From;
	b=A1KrYxAOUiuEfd46COkVb6W0Kqr9Nu9YHu7+D7QGOeb+QgNwPVdIW/SgVgFBslfQj
	 yu+fEDL4nyJqGuCxUiLoxLn2mEPXn0pOg7p6ZhmCSTU4p4JYYSlB9NW2ZI8Ps1dL+z
	 VMUAjxVGbG5LwuPp/iUPN3Zq/DIjwWsE06RS9EqSWA482jx6n1EyZuv4yDY7WeaQZ8
	 BhFEsZ9Fx61mOHFIj6mJ0ty4I+fft5L3p0OTZw0oWSvcAkYGhCMnH9wfF5YbPqKz5u
	 P/AfW1kLKk3B7OdY6v7zz8Il68CJazVndWoP85wxRXKm85QSWni6PqB6jAp5yp213Z
	 tEH1s1o1Tm8Ww==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: mediatek: asurada: Enable internal display
Date: Thu,  8 Sep 2022 13:11:50 -0400
Message-Id: <20220908171153.670762-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101200_603457_38E56C93 
X-CRM114-Status: UNSURE (   7.53  )
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


This series adds and enables all components required to have a working
internal display on the Asurada platform.


Nícolas F. R. A. Prado (3):
  arm64: dts: mediatek: asurada: Add display regulators
  arm64: dts: mediatek: asurada: Add display backlight
  arm64: dts: mediatek: asurada: Enable internal display

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)

-- 
2.37.3


