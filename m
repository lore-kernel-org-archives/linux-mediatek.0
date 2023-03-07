Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAA1C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWexxL308BH6z9moewgL9uYihCpYFK54dVeZ2PBn3f8=; b=coVH1ZMUFmanfDsPlsCGFzdT2l
	wmxJVjjLP5ET1+skwXES33tGiBagcMnGaU0Gg3DRc3lWeMUA/iEfTdnWMZbJ6pNrMkXKc61dxYBzJ
	gCl+reJfvLoNf9iOLvrC9gKEY2KzFkreAFN3wfT3zy5FyYe7dki5hXQsa0Ic/ADw5jKhxJnPCt0tS
	835cOwYUT+XbAyto2JRAQJtE4OmUBMpsogpUhVGrKlSmh7QPhCM4K9MZd5pefzOWUEmoKHhmD/kCc
	MXnSER7b4p9x0mu2nx4cHpjmHNqNn24DO+C1edFjQIHn2rvlSyZMz8Wh5uY8UVn7ZODZaVhVZeo57
	lVE/fQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcOr-0026kS-G8; Tue, 07 Mar 2023 18:51:01 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcOp-0026in-3h; Tue, 07 Mar 2023 18:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678215040; i=frank-w@public-files.de;
	bh=nWexxL308BH6z9moewgL9uYihCpYFK54dVeZ2PBn3f8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tIoGoyJqs2OkjReYZUq7R4DzCHsQfWQztFQt0KYgB3j4czOZiXbqyOTrzPbm6KFVZ
	 liwK94XYdcyqvarEYpALo+sYdLpNoDD9pVUn+Dh2f/9ygzrIXfdxNkH/lIy/5puhO9
	 2PJg2Bme9jBtXursaPmy8+5WeNnFNQPmT4C4sWL0ARLoOegq85fkCjDQ79meY4TSrq
	 HI+AL1OH3onxeqhHLrlfXUHOp2T/BpEUbuXY35JZhegNDwMbdjuzSq93wfFtFP1/+b
	 9L+vkQmVV3sgFqOxjxVubm0L4dOE6IilYta8ILPWjY1ohwOWSj5Bx/NsbHGkQ6gRL0
	 mh9l3rfxnbiYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:50:40 +0100
MIME-Version: 1.0
Message-ID: <trinity-19cb78f9-24ee-4cab-a24d-5c431d154e43-1678215039980@3c-app-gmx-bs16>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Alexander Couzens
 <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v12 09/18] net: ethernet: mtk_eth_soc: Fix link
 status for none-SGMII modes
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:50:40 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <1590fb0e69f6243ac6a961b16bf7ae7534f46949.1678201958.git.daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:76gtEPPKbw3oW5Vh9Br7sY/0upYihofaodLeF5Poo1oqibixMOcL2y0Fehhg3y1CanIwj
 i5ak/DrOGWMtDkAYTL930BJHMzxlrPSD2RbFOg1hZRZSQNQhey/uFIOTm3zkeR1tT5latxzmDT+R
 ornMPbIXSbhTma8tYRTXgrgq9yEciDBGKHnfKhUD4rF9mztF2FgFZj88rHLE0511TZGh4Q3XxDfh
 +RLVZaxpaN91URF6IUIDZ9pozauNCiX0MQ/ER24URfXEoXWLDYpb024n4rMKi5LvTM/hpuX4DO1B
 AI=
UI-OutboundReport: notjunk:1;M01:P0:oYTl1d60MWg=;C4x3bNHaagBMTR7qFsMFz764oFC
 jJLFXAfjjvaBoce70TTO7nh0M+WdDbscQzSasa9/SVoIR72+oR2P1GgL50WxyPdJv7GW3jgSE
 E0BDP8nKyWbC/fgxe09oIJvEUyrxiT9KYQ8r0wW4hVwz0maIvWO4MDymQ8XZpf4jqSmISLh7I
 LtwFvVINAheIPWzHwsDGpwnLrg+fVJnG2EFknNv2X74RfPTyjS2yr7sOm9TlGMFP1wudgMG2E
 +kvs20B3TwakSQUJkYPK7OWbRXk80KyKKYPAbGuhEc3g0S1poZZVKUOjl0aIAc13/xdW0J5F4
 fR2VS8+xWT00FOggTPtn2l9+56qDd3grvNKEqzrWPmgRf0pctgFChlJ7rKiRYsysC2uq+31j3
 m96NS+N0oukLakr9dG1gzJFtk+p9demgwiG9zrU/CpC93y0i2CQktk4BBPHNGBP6Mfj/r1B3Q
 AIfiFJ4OWoywMTZ24UWNgJeY5KnXT1BsdI/iXym4LhpHwD+KOCftR1UXY6OLPxoGYe5U6O63M
 mlZEyG5zqlx+FmopGHsSC28luN0cCQegFCzpmBC1F/FUEa2PODTQrj5NVYxqcLz7xujEjRBcO
 PJ2usGtkhRAKkRZ+zAejstj/9sG2Nc/hLY2fwFyIVoGLBBRjInZFeFElBXD4rJk2CFP48X5Uc
 gxyZLoFkcVG/rIhr2PylXTzTif/AUtcUPTkwT/+tDn3Ros7LXKmvmLqz2ukq7SnhwLhPK4Obs
 OrJRtP4FVmMOnhISR2Z+et3AuEKc+Xwmk06cxMSLQtDiOQDUTxSNF8JcRfcgxmCyrpU0VPwZf
 2r/3kTJb1FQ+1YQB21okVMcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105059_453510_69176AC3 
X-CRM114-Status: UNSURE (   9.83  )
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

> Gesendet: Dienstag, 07=2E M=C3=A4rz 2023 um 16:54 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
> Link partner advertised link modes are not reported by the SerDes
> hardware if not operating in SGMII mode=2E Hence we cannot use
> phylink_mii_c22_pcs_decode_state() in this case=2E
> Implement reporting link and an_complete only and use speed according to
> the interface mode=2E

Hi,

have tested Parts 1-12 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no =
2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

Thx Daniel for working on SFP support :)

regards Frank

