Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E168EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C+hthcK4e0GPQ21oHQhtItjoS8sY4z6yYC3Zwm/JPHs=; b=KZsdP1b7q40D7bFnndb8H0uxJL
	W3wjHy9O3UsSbPBx4NGCbVIDn+kJin/1O3ChpF7iRmk7mekF4+YP1hgnQOtjmYzkUyFid3EUuB3/a
	R4wlLH7kEnubHD9KyFQvtC6msnpx5nscgu6Lj0LTVzESy4HMwj6UrJ8X4j0M33qR3VxxN5jPLXu8a
	gicS6rHyEVa7EAMZdSz3zIaeeFVqOkeqB+gYC75nDECMTcS2lCWnKC5aAdrhXZWHhANYEyUgMq2Fs
	uYz6SDVF2hPalPWI4ZvqzqZ94SJXAkgijKIVnqI/9aIiz194IenF3SSy7gtCybtHgyrNmhrwnWKLb
	/SLMsjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LRj-009e9g-6w; Fri, 17 Jun 2022 23:32:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LRY-009e66-12; Fri, 17 Jun 2022 23:32:01 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE5D2660172C;
	Sat, 18 Jun 2022 00:31:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655508716;
	bh=7wdR9GvFJ2bRNSzgrHreRp4aQnYXr82CkaIfrcIiHjg=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8LbSG0W5fF0m/cSGiv8xa0mqAZWTpbMvxYMD+7BSbtVKTdbrvoUtaQDDXzk9qFt7
	 fMM1UNhnfH9do5G/E98ALoY3I4NZ44MS/4FZ/IfXRhIISn10CY2ZVnslNsWw8YdPMG
	 33frzXAIMwX1To78f+RkByZBhCGCzMKB2BbCmlaF6fvG5XBIZh6Bbg7nB8HZ5/DRWz
	 xLwCOVDNEhIcFOV/D63AAroGoqCbADVEy44ANEL3PEpoO7TeJolA8Db4f+FL6Eccsz
	 aCRPOwS2JPZpEGGP0DEiqvzQT05sDIbyhYeWCT15Bc29+eBklYb3R/RUHnzm5qgarT
	 wPd6KS4pdsT1Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] dtbs_check warning fixes for idle-states nodes in mt8192.dtsi
Date: Fri, 17 Jun 2022 19:31:48 -0400
Message-Id: <20220617233150.2466344-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_163200_322718_9AB7CCB7 
X-CRM114-Status: UNSURE (   6.09  )
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


A couple of simple changes to get rid of dtbs_check warnings on
idle-states nodes in mt8192.dtsi.


Nícolas F. R. A. Prado (2):
  arm64: dts: mt8192: Fix idle-states nodes naming scheme
  arm64: dts: mt8192: Fix idle-states entry-method

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.36.1


