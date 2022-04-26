Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wVrFohZS8obqPFdaj73JbJpnvbhUj6PVnVYWuvNcmLo=; b=Gcfrx08h6FjXvu
	cdIsnKxhBHVOzLX2RO4D6qJBKWSw0Z+qrJSFyy3vK0O34MwjOgz1BxLoJir7muqcFXbvzbc59Bc/O
	YFlBFqlgKLzMOb1L63OlKD8F7W3HaJzCChH1I78xoH4dv8d2n/RBVMvPb7e5hyWZztfmiGek/IkuV
	uRYprp9Jb6gBmRD015JZSriXsmMuj2JxhgrsXVNfZ3O6mZbul2HgioXcFxLQfc2M766KUtn26KQuC
	+PKcdrPwZxF0BSRkQOj1/Sdd20vhV+cYmKH6uezutCn3i9UzEHKQwkeKu79nhC2LNue1Crtz8Q7fn
	vbfvtcy0KiVaL8HrPzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLbA-00EkjX-I3; Tue, 26 Apr 2022 13:51:24 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLZP-00Ek4c-Pt; Tue, 26 Apr 2022 13:49:44 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id B5E135FC22;
 Tue, 26 Apr 2022 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1650980973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dSlDPKAzzaq/bDB/Mgjeeep8HHzSjpH4wNIELJEgfLY=;
 b=LBiqkBfyO3csDUhz/CIEgnSBcuuuHGsWvMRPZhVFTXREB4nAuAtBCmuvSAmJMdixMLlfwF
 yJ+gxir5TiFHoD8FZhza5dtT3Ea4ieFA88Hr5yKcLVR4uVurPxRdpyOocrR8FOuA237Mg+
 Tl1ug0CnEWkG3QuboucXbgvJlRseWSs=
Received: from localhost.localdomain (fttx-pool-80.245.77.37.bambit.de
 [80.245.77.37])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 5D074360630;
 Tue, 26 Apr 2022 13:49:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [RFC v1 0/3] Add MT7531 switch to BPI-R2Pro Board
Date: Tue, 26 Apr 2022 15:49:21 +0200
Message-Id: <20220426134924.30372-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: a0cd959c-79df-41a0-9cf6-bfb567398990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064936_090876_5BB407D5 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The Rockchip-Board Bananapi-R2-Pro has a Mediatek MT7531 connected to
the GMAC0.
This series changes DSA driver where needed to work on the Board and
adds necessary Devicetree node.

Frank Wunderlich (3):
  net: dsa: mt753x: make reset optional
  net: dsa: mt753x: make CPU-Port dynamic
  arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro board

 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 49 +++++++++++++++++
 drivers/net/dsa/mt7530.c                      | 53 ++++++++++---------
 drivers/net/dsa/mt7530.h                      |  2 +-
 3 files changed, 78 insertions(+), 26 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
