Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A81DC352A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMmd3kLwQyhE5ofdcfycINcA+8R6j65sW2cAZ8RvgP8=; b=154mJldb6yYfCt
	6LPIkId8WH5qzwJVKhMbr2Iwxjf+eCey4/qtHAyOEBJj59ByRff43JUYw4rlX8Fo8e9yX+wWKZBlO
	9DWHMflpqORgoaiJeV4OB+bcAQwCNILyZgHk7EcnYAPQZys8nPjLY3N040TPoJs0QIddWv0qO15mI
	/Rda71Fc37uGzBfNW40N2xl7BxjP4DsA2yVPBiKqT51bd/LWfviJvPO4MHueSAW2IN1sCbvQ6VXZV
	QRPIwhaNDH8ZQhUffGIT7z5VSF6qnH2FLLlYE5qYMujuIU8g+MQB1fao1JK8o+B+Pd0wbU+bK5xTf
	glBehuIVDf8ktf1O2bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1UbG-003vBC-EE; Sat, 03 Dec 2022 15:38:46 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1UbD-003v9t-O8
	for linux-mediatek@lists.infradead.org; Sat, 03 Dec 2022 15:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1670081900;
	bh=LMmd3kLwQyhE5ofdcfycINcA+8R6j65sW2cAZ8RvgP8=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=bqkH3cy7I5nD16FJL67QN9OnJi1/HiisQsO2Nr5JJuNqwRrpJ4I8xm7UfPjFINDwu
	 XdSziYkiJbnltu0eX6MJgS+92u+AnJX99EHPrmAZdI5DtVFaHVUQ6n54CA2A6FmGvy
	 p9WzdxhJOR3vL5nLcUbxM//qO27VWRuzx2FUoBzPzOCkiyrf4r4BU+c1KTOU6OTySm
	 uDRYZRhGvYL9yNdu3u0E2qYWOHrggrZpzV+W2fL4JfezHt3r/Z9Y9QdnsDZDvBzvnK
	 djTKzenaZqENJy7hh4V1n2hYtUg/M5Jux3UlBPCTcrI8GdOdjx1191UJtlPoTZLAOR
	 qUziySCcwtKDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.153.36]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1oqWF13QyG-01205a; Sat, 03
 Dec 2022 16:38:19 +0100
Date: Sat, 03 Dec 2022 16:38:15 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 netdev@vger.kernel.org
CC: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 sujuan.chen@mediatek.com, lorenzo.bianconi@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next=5D_net=3A_mtk=5Feth=5Fsoc=3A_e?= =?US-ASCII?Q?nable_flow_offload_support_fot_MT7986_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
References: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
Message-ID: <70E22A48-DEE2-403A-975F-AD7D418B78CA@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+wZMhqeLkJBVWC0oqLGK1e28b9LF9DIas5xyT+HVlpCGrluW6oR
 siY9gVpJSWc9mbqkI/d/jEmyYBObU2pU3IbGcygpx9h3M9HfxGRk+6/Ye039ywRlf4eiIgQ
 FPfQ4rYuINQB/GTPOng3YMtQX0s+R68ddQWlWL46mI45wq4GnC6i+QYtWJkdyL4ZGa5XW/Y
 mKMmdQfOM+8hC/br2sJ5g==
UI-OutboundReport: notjunk:1;M01:P0:Gup6pCVehY4=;v3OaVv/4gGIF6XUeZ/hh2yBlxsQ
 emvgEbo1cxfFaEpZr8EEptnxirpGfdc3JKw4TTB188uDTqNel4pWfpiPAfq7qFyHwAnbbxPEJ
 kwrJeis5IS9jN9/aW0GECmpDKmUmYkjxtaXmNFjKR+b7OPet3Y0fiix/2QWkaL7LQg3OYMsD+
 hgOuuQLtQRmzrz3UJqNpniLErmf6VYCj2DScP/HHz6Ow54tYW/kRflUONPs/vzTbG2dKx2ipm
 sVaB49RR9FCl2yI/fhn4v8ESCkTZkdsLQLzO/v+HknnlyjsmX+gSTQoShjc8+BCYt5Wpi81lZ
 0ngii+3ztWIkpVhw659e53Xojce4Z3LJo/AY1IHcqjThvjtg3LMNiIJ39bkWYIwL2GYR0OMHD
 T28LrGW3wZVQ50ZiqXUKgqTOxRoRBAjz8TS3Uz7BxUkZ0N1sKzm7xbGkO9Ne/WghzHdPzVP5w
 pKXiUEcwmz+6LTl9x7K3JJBy7X9GEnh4xaGQ2LKRhuJLFk41CBotfOo2qhjWs4d6yf4jeh92N
 /ZLJlfI9pBFfTAi5j6KGjjBsjMU7+Anop9B0vjAEsDyAwOpX815EsfJyMw85fx1Bnp2RwvFYX
 OBPRlQpL12EcOFgyKewp9OmF/rp7z5356IQgsNACFji0VzoJ7IcBkFBDDoTKJpLm/cO4USUme
 MmX7WeQcPxF6kgWtWW5iObvNnD14tVncztUGn1Lkf6UzpQfRZCsn9bfw14a9wmCQnvVsq+FkD
 UyWqfUvH1LZHvqjBQ8vSOclJCByGRPYysPQfuZ0R6sXdA77XGgxqCEWOnYjdt5PqW/qEJNXR/
 8jxcNH4nufWUavE3qKPmVVtOQUP4Jy2965thC94JNfpOYuYrsbqkU97uiAlz8F1gaij3yyZHy
 Jwu/lN558R+rrE9/WY2O3ur549XUYa6GHPdHQAwDuclBFPaR81ekWUqaQmBg0l05Y1rLDrOu/
 ScMmOw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_073844_184324_A7F7DC9D 
X-CRM114-Status: UNSURE (   3.78  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

thanks for the Patch, i only noticed a typo in Subject (s/fot/for/)=2E
regards Frank

