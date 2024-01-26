Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DAFC47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+cDUpkRwZoCkGrsowLN1EeXEXa9KYx2yEQLWfgGSS0g=; b=mFmHq3SSW9UlKJ4b4zkFm84mgf
	aQgDickJ81eLa+QQNfLBplhKNokMPSgOFNU3obiT/IjU74yt/gycY2DpoccGurFwQCEunjNVtu3LR
	t95IDoM6CG6kaj2xyTOvaqewQetaX6xCwGe/EO/jX6ds+5z9BQNSriVJrVTdSXTTon/EzzMB85yEX
	47r5VVzZzAbI7Ib5J+KttrIUdTCA0FLB705zSSShVFWLAHXWWmhbRVhU5EM7X1oQ0QW3Y/qKGUIfG
	G81m8NI9aXFlEnDvJS5+5R7hOHoPjwTXuE6vxdTf3LEB+oNrFe++FriKovY3iWugWKkGaClBIYz2X
	jveu6/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEl-00000003aVt-3L3I;
	Fri, 26 Jan 2024 09:10:59 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEb-00000003aQv-2682;
	Fri, 26 Jan 2024 09:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=+cDUpkRwZoCkGrsowLN1EeXEXa9KYx2yEQLWfgGSS0g=; b=EBsO9U80tIz2vVWWhX2O2mkFeo
	W1/pNVUwN8m3YVj860izyitoW9TWdbGmhX/sequIUI5EJG8xKexT9iLopnmTSCvVA5DrNtluIyiXd
	9lCzil/59/i6zAbwa61oL50g5l7EtILCaP2mdOzt4epvtqYCS7M21MPiZFOfejEdycryxS8RB8DIE
	/VRdBMe7vyWo0mNERPbc77P2yHwW2v5WqMtnTyi5VOq7vAnbr/KIXEdTU9eNXEYh8ifZRxCsCtnlg
	4f6ZPk/ZGc+ALAb5CUedtTS/Jig6vEH3qOKW4TPm3FqFm3DmA/SUGxsVjx4xC3+lazDNCslNYbGih
	Yn5kBbXw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1rTIEX-000Gf6-In; Fri, 26 Jan 2024 10:10:45 +0100
Received: from [87.49.42.9] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <esben@geanix.com>)
	id 1rTIEW-0004KL-6V; Fri, 26 Jan 2024 10:10:44 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	"Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] net: stmmac: dwmac-imx: Time Based Scheduling support
Date: Fri, 26 Jan 2024 10:10:40 +0100
Message-ID: <cover.1706256158.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011049_564789_4217E6EE 
X-CRM114-Status: UNSURE (   7.74  )
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

This small patch series allows using TBS support of the i.MX Ethernet QOS
controller for etf qdisc offload.
It achieves this in a similar manner that it is done in dwmac-intel.c,
dwmac-mediatek.c and stmmac_pci.c.

Changes since v1:

- Simplified for loop by starting at index 1.
- Fixed problem with indentation.


Esben Haabendal (2):
  net: stmmac: do not clear TBS enable bit on link up/down
  net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 2 files changed, 7 insertions(+)

-- 
2.43.0


