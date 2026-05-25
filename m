Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E3ACD5BC8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2026 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70qsCwf9afpWCUvc1LMjVT/dnIDgU93Yo47dLm8jd6I=; b=uBV6hzPkykXdY0
	CZUcEQruMkmNk+jjo6KiCpt1/Rq7d7/aH+EjhQ0hpCzEcllYNyjlJBdrKPluJc3N5hngrCGMGoPpP
	UU2gJcdiQ8o+GhTn2TniJquuOFj27hsJm1jeoY9RtmUn1wxCWXbG+DwJqwttQwuxmUaMEcXrbSxkd
	psRAC0ChqIyusrRLSFeOTZxb8Whk3Bw/DL779mgEK0RTMBybCCClW9kH5wg+mbxot3q2TnDspUaeq
	dRFdPKIQa+hY0ZD9yAFhJprTvth8m2zPryGjmN/Of5bmmvTxfCbtRrNBFiriUfDSop8FXqKnSF+Wk
	qCK+JB5g8QCrGZVJW/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSDo-0000000GuRr-1cLI;
	Mon, 25 May 2026 10:07:44 +0000
Received: from mxout4.routing.net ([134.0.28.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSDk-0000000GuQt-4Ayt;
	Mon, 25 May 2026 10:07:42 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 944BC1002AB;
	Mon, 25 May 2026 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1779703654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70qsCwf9afpWCUvc1LMjVT/dnIDgU93Yo47dLm8jd6I=;
	b=oqshXILgxKl5szWS9B8CTaI2deqmSKHQq24N83UF7FKc5BxA4INDd++SCroOx00dF4yL5d
	8gcFyAZZANuVfVkm7sz2NntRMu4FRyR2z56YYNdpgik3ogAAfGob9zdb+qoJPkU1LXirzg
	gB5/KhnguFA/vG+6uHZo7ECSfFCRBs8=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CD194360055;
	Mon, 25 May 2026 10:07:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 25 May 2026 12:07:33 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC net PATCH v1] net: pcs: pcs-mtk-lynxi: fix bpi-r3 serdes
 configuration
In-Reply-To: <20260409215509.si2dy63seo4iaspa@skbuf>
References: <20260409133344.129620-1-linux@fw-web.de>
 <20260409215509.si2dy63seo4iaspa@skbuf>
Message-ID: <64b40fbee19dc108752574419a38bcfc@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 4fca7f48-3824-442d-ac9d-7dba16a0e581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_030741_274894_C57A4897 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2026-04-09 23:55, schrieb Vladimir Oltean:
> On Thu, Apr 09, 2026 at 03:33:42PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Commit 8871389da151 introduces common pcs dts properties which writes
>> rx=normal,tx=normal polarity to register SGMSYS_QPHY_WRAP_CTRL of 
>> switch.
>> This is initialized with tx-bit set and so change inverts polarity
>> compared to before.
>> 
>> It looks like mt7531 has tx polarity inverted in hardware and set 
>> tx-bit
>> by default to restore the normal polarity.
>> 
>> Till this patch the register write was only called when 
>> mediatek,pnswap
>> property was set which cannot be done for switch because the fw-node 
>> param
>> was always NULL from switch driver in the mtk_pcs_lynxi_create call.
>> 
>> Do not configure switch side like it's done before.
>> 
>> Fixes: 8871389da151 ("net: pcs: pcs-mtk-lynxi: deprecate 
>> "mediatek,pnswap"")
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Hi,

just a gentle ping as i still not see this in torvalds/master.

regards Frank

