Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CBD3DEA9
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9sWnJNzzK8cz6mWjiYLnap+djwdnuCdC0aTaZNVwVY=; b=OOB9oxgxAKX5yYX6psMy9hOtSl
	CPqOYVzXro1ZNDI0G1/fk0lI94Atfw/ACURl9qcf+SKdxQ29oX3rp+2BI+FD2Ta+w2r0J/mVm5Kcp
	cOwJwpzIXBWBtNC0ivyjI7sVZVIPTmS4Lyf53grO8tFgE00EWiSGbn75J9rufasESMLtD9hsVLKr4
	EvzQaaWImH0yAeO9BVEm9uZlVnVHIoQSCufrIbwXHfv+NlNeszClvgBGvp+DUQYXY75Nsu8O6Cmtp
	grbacZU0vBdq0Psy9iq7eBL5KgHd0Ktt4j+pvPzNYgRv1KXBD+6DWL3H5e/Ovjg9mSkvwPibG1IJ0
	lxmpmIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1rVi-00000001btF-39Qx;
	Fri, 18 Oct 2024 18:15:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1rT5-00000001bf5-0vwH;
	Fri, 18 Oct 2024 18:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O9sWnJNzzK8cz6mWjiYLnap+djwdnuCdC0aTaZNVwVY=; b=n86KVqm/rAxMZMHPXdcML51M+H
	fj0bl/qbB/ta6DNYewTfa3Hg6Snbc15BhSxnbe1jlu8ZHYWz6ioRipq4RTKAewDm4h5wcA+/jGjwl
	3UoaCk77jrGo9zsEc940d7fWYWp1GHhkUvY7TkmDF0s5+QGkPaJ+ex3dhNUhWvs9xgjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t1rSs-00AYZJ-6o; Fri, 18 Oct 2024 20:12:42 +0200
Date: Fri, 18 Oct 2024 20:12:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: wojackbb@gmail.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	johan@kernel.org
Subject: Re: [PATCH 1/2] [net,v3] net: wwan: t7xx: add
 PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Message-ID: <f1cf17d9-b4b8-4519-82ea-c44bbd52c2c5@lunn.ch>
References: <20241018075304.23658-1-wojackbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018075304.23658-1-wojackbb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_111255_277184_25D126AC 
X-CRM114-Status: UNSURE (   3.90  )
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


    Andrew

---
pw-bot: cr

