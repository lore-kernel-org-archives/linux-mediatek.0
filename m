Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C33C4829D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JX4j9RnBKgSuymNFyXd63pbAcg6Ek7H0n0T5RTJyQUg=; b=dVWkE9mnfdKpBYJCJVC5h5zRqF
	KKeekTbkcXt0pOco7oQdfKZ5fEgR9c2WYfofuchoLWTAv3YSnMYt7DZYfrB81q0jLWz4rl1DcT5j0
	Pi2kWbns/Qt8KDIkx4OzXhMlUEkwKam8MT/OAQuBojqKPXBEVpNKIlE7Np8GSjJvaaQA0oRLQtpg0
	R0A5aFVQKhOGzYOVxbsfn2aYbsKWkedYRtSyCxctxyTcNYUQgQsFqrhiK5bT4nn0Al2x/9LWiVTA9
	1Z0jXCD88HNOUW+2yVRAn59PMB0XyU8yvj3YMNZHE22iETqpKr+AdMeG+3Jh4lPesa3hT5qzGjOmG
	qSMQ5slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNQK-000000086Xm-0gMY;
	Tue, 06 Feb 2024 15:31:48 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNQF-000000086Wp-2tfI;
	Tue, 06 Feb 2024 15:31:45 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rXNQ4-0000nG-2R;
	Tue, 06 Feb 2024 15:31:32 +0000
Date: Tue, 6 Feb 2024 15:31:21 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek,mt7988-xfi-tphy: add
 new bindings
Message-ID: <ZcJQyaTotW_bCWGU@makrotopia.org>
References: <3251ac3db1a739e0c18ded0a824edae981c1e2df.1707153425.git.daniel@makrotopia.org>
 <31d2c56a-5108-4265-a267-6733e1ba328e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31d2c56a-5108-4265-a267-6733e1ba328e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_073143_750801_C2DE79E8 
X-CRM114-Status: GOOD (  19.39  )
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

Hi Krzysztof,

On Tue, Feb 06, 2024 at 11:53:55AM +0100, Krzysztof Kozlowski wrote:
> On 05/02/2024 18:28, Daniel Golle wrote:
> > Add bindings for the MediaTek XFI Ethernet SerDes T-PHY found in the
> > MediaTek MT7988 SoC which can operate at various interfaces modes:
> > 
> > via USXGMII PCS:
> >  * USXGMII
> >  * 10GBase-R
> >  * 5GBase-R
> > 
> > via LynxI SGMII PCS:
> >  * 2500Base-X
> >  * 1000Base-X
> >  * Cisco SGMII (MAC side)
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v2: unify filename and compatible as requested
> 
> Several comments, from me and Rob, were ignored. Please respond to them.

I'm sorry if I have missed something. I just checked again on
patchwork, just in case I would have missed an email reply to this or
any of the preceding posts of this patch as part of the old series
going to netdev.

Comments you have made which I have addressed:
 - removed $nodename
 - use compatible as filename

And the only thing I found that I didn't either fix or reply to is this:
> Can you explain what is this issue and errata about (except performance)?

Not overwriting that (undocumented) value in that (undocumented)
register results in 10GBase-R having performance issues according to a
commit in MediaTek's SDK, see here:

https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/a500d94cd%5E%21/#F0

Maybe Bc or SkyLake of MediaTek (added to Cc) can explain this in more
detail?


What I did miss was Rob's comment at the very bottom of this reply:
> What is PEXTP?

I can again only answer by referencing to MediaTek's SDK sources:

https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/21.02/files/target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_sgmii.c#96

Here this reset is called XFI_PEXTP0_GRST.

I personally find that name confusing (as this PHY has nothing to do with
_P_ci _EX_press) and have tried to get rid of it where it isn't either part
of official documentation or already merged drivers (like Sam's clock driver).

If there have been any other issues with this patch which I'm not aware
of, please point them out to me.


Thank you


Best regards


Daniel

