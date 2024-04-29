Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99FDC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MVhRe8G79LvDZ3usBPXPwC4vS3hYNB2ai5wwNsHxlg=; b=oiuwrUpwzbsBIel1kI6O2S5Mnx
	CITL9U3OU7FPugTJbK2Uu9KHlHj0HxJgifohUWZI3dRvXiUkfQALaQypGFsv1Gmj1aFkscjxT+yyO
	Vg5Ut1DlmqS73/Ct95LO2xv2tSrhHcZ+ev27DsPcaGV7Cv2sJpFo10Af06UJ1O2oVQKi4bQp/seEr
	gjhf/JjeYGxOjMIyeGHuEOOipWAdUh4TSdO5EeL4PGaYC9uFQU7x/9q0jYl5HVMKLC6YBjM3WyU9B
	f1KSXzXCLzbmkBicjmlshMi3evZd65EOLO1iUsTWaoRa42X44SC1exl7TrJhY0qErgbkwccwo5qsv
	kb7I4MFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QUs-00000002nN4-1mc6;
	Mon, 29 Apr 2024 12:52:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1QUo-00000002nLL-2Bt1;
	Mon, 29 Apr 2024 12:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=8MVhRe8G79LvDZ3usBPXPwC4vS3hYNB2ai5wwNsHxlg=; b=bO
	SOhH5dd3HJ9bdS2W3InhsYvFumXuNOIk210c0R7CGcAgdwia7ZQxS9U0T712J6f1SPW58SvZViFcx
	ulqo6nmkewY4g4yX8DmOHv2Iv0O99FpDG0QgzmavM2LzMihf1rHVSymgIbymFO1vvqVbdn7xbVoe2
	KZ8dKQyEGyQhN7I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s1QUZ-00EFfK-WE; Mon, 29 Apr 2024 14:52:24 +0200
Date: Mon, 29 Apr 2024 14:52:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: do not set MT7530_P5_DIS
 when PHY muxing is being used
Message-ID: <b0368cc8-927c-45ec-8adb-253c141943e2@lunn.ch>
References: <20240428-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v2-1-bb7c37d293f8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240428-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v2-1-bb7c37d293f8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_055238_584758_4951C235 
X-CRM114-Status: GOOD (  13.02  )
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

On Sun, Apr 28, 2024 at 12:19:58PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> DSA initalises the ds->num_ports amount of ports in
> dsa_switch_touch_ports(). When the PHY muxing feature is in use, port 5
> won't be defined in the device tree. Because of this, the type member of
> the dsa_port structure for this port will be assigned DSA_PORT_TYPE_UNUSED.
> The dsa_port_setup() function calls ds->ops->port_disable() when the port
> type is DSA_PORT_TYPE_UNUSED.
> 
> The MT7530_P5_DIS bit is unset in mt7530_setup() when PHY muxing is being
> used. mt7530_port_disable() which is assigned to ds->ops->port_disable() is
> called afterwards. Currently, mt7530_port_disable() sets MT7530_P5_DIS
> which breaks network connectivity when PHY muxing is being used.
> 
> Therefore, do not set MT7530_P5_DIS when PHY muxing is being used.
> 
> Fixes: 377174c5760c ("net: dsa: mt7530: move MT753X_MTRAP operations for MT7530")
> Reported-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


