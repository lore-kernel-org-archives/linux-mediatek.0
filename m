Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37059C47DAF
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jan 2024 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c37txM5AQBeipFKlwo48dwCVCZGCUaCC40m8RvSfo3M=; b=3SOLw+naJQJ+etJ/2uxlKoQuW6
	F+tiYmLI3wjII93TqSPPXmyWjB0BraaNdgABwtfjE97kxjqXt0lMsfcapqdgNd5my8uiFGJycBVjx
	eYRLKKuYq4Fj7R3tUHEAscdEZWlw3Yu7kzZ55gr7h8EJiYia/vBrmh6vDlgeeOXQG8Hjo6jo3V8Qe
	ltDByUCYcRNQsao7wNaFgvLFcSfIG9nIffTIbtPtZQlyrRtQA2JT9yT4dejRG9lWkjl528VB/kBMv
	SfHFfoCI1By2ngC3alkZiinPfu3krDHXgs4Y8GfOZzka9WqlUtWuwnfanjfAA0sPQlgsCQq4+MaSr
	Fm52inpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRb99-009lgc-0j;
	Sun, 21 Jan 2024 16:58:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRb92-009lfo-24;
	Sun, 21 Jan 2024 16:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=c37txM5AQBeipFKlwo48dwCVCZGCUaCC40m8RvSfo3M=; b=Kz
	nw0K80g2wZux006JZCCdff6hpb+mbikxpe0BJ47nr3Ub3l4+FNQjrjZ9Qkq9xxLa+bv07C+l6P7YM
	1H1mAl5X/KyV+M3X6Iscfv7nk3jyRleaH3PLEYzZTGp3Lu4KdnYrefSdKidAP2dIjfLJfgZxPd8B4
	3FWUkaTEl6k5q2Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rRb8q-005f8u-VZ; Sun, 21 Jan 2024 17:57:52 +0100
Date: Sun, 21 Jan 2024 17:57:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Praveenkumar I <ipkumar@codeaurora.org>,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH 5/8] clk: qcom: support for duplicate freq in RCG2 freq
 table
Message-ID: <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_085804_678907_FC3D4404 
X-CRM114-Status: GOOD (  20.34  )
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

On Sun, Jan 21, 2024 at 08:42:34PM +0800, Ziyang Huang wrote:
> From: Praveenkumar I <ipkumar@codeaurora.org>
> 
> Currently RCG code looks up the frequency table during set
> rate and return the first available frequency greater than
> requested rate. If CLK_SET_RATE_PARENT flag is set then the
> set_rate request will go to its parent otherwise the clock
> framework will configure pre-div, m and n according to the
> returned frequency table entry. In this case, it is assuming
> that parent clock will run in the same frequency with which
> pre-div, m and n has been derived. But it may be possible
> that the parent clock supports multiple frequency and the
> same frequency can be derived with different pre-div, m and
> n values depending upon current frequency.  Also, the same
> frequency can be derived from different parent sources and
> currently there is no option for having duplicate
> frequencies in frequency table and choosing the best one
> according to current rate.
> 
> Now this patch adds the support for having duplicate
> frequencies in frequency table. During set rate, it will
> compare the actual rate for each entry with requested rate
> and will select the best entry in which the difference will
> be less.
> 
> The existing functionality won’t be affected with this code
> change since this code change will hit only if frequency
> table has duplicate values.

A good commit message for a change!

> 
> Change-Id: I97d9e1b55d8f3ee095f6f01729af527ba90e50e5
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> (cherry picked from commit 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2)
> Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>
> 
> Change-Id: If10193fc79a3c1375ab73597813745ff1f4df0ad
> 
> Pick from https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/6dfb368bae130bee58e00ddf8330b55066e1c8c5
> 
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>

Please clean up these tags. These Change-ID tags are meaningless in
mainline. 775e7d3b69ffc97afb5bd5a6c9c423f2f4d8a0b2 is not in mainline
either. The picked from might be interesting, but please put it into
the body of the commit message, not mixed in with the tags.

Who actually wrote this patch? The first Signed-off-by: is from
Abhishek Sahu. But you have a From of Praveenkumar I ?

    Andrew

---
pw-bot: cr

