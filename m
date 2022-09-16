Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D08EECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJFbvtG064Loq4TIeZ7jEDH5p60tN++lMrDSKzUETn8=; b=XYEbiH1XyA7P0U+RuVT4MXEplY
	mSGQlLvB0d20Et2dkd8TjE0Vm6sUiCQSlsHJ0iUOnGzDgQPwjjiLoxdg80Zd9j2SX4Bg+bgEvG7sK
	GnTXG4JZK1Emjbqh5YH7EFkiC8WhuZaI8gpNfN/vh+KDaUhSSzmZXy1xljJFU1FMYdXUXDNclFLiP
	ANUG0Uxkpdayc0ZUZeOW4iDX1QSJN5sVrC/1eV+I5h+WIPvlP7zMu7rIcDKw7x8eqMJfr5duJRu2k
	HA1TJUj5rrzctsjFO1FkcACFIG71gffvwJKZYFkz0ax+CXAUvPin8n5Kf2nfXmJyyxs0+l3go2f2E
	42q2wK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7hT-00BiBf-GC; Fri, 16 Sep 2022 09:31:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7hR-00BiAR-Fd
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 09:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 29C71CE1D3D;
	Fri, 16 Sep 2022 09:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9954DC433C1;
	Fri, 16 Sep 2022 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663320709;
	bh=7UIk94apV2JSIdIma5XEPFCxVUCn/GILfJKzfsTJaio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs1QUPs+QAtV1YBowieVT20CQUENb6dMdn3sEnVjw9RYjeXcKo+ChmVyulmSRdFX9
	 jZ+jU6KR9jeDEFOKaEo4VOF+m2tSqOCex0IdDejhYNWE6oKLr95uNOnelggWoh1IRi
	 uqUiNhStkXvpiv+NqFQqiv76HsSIo8+qlQIUs8Og=
Date: Fri, 16 Sep 2022 11:32:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@mediatek.com
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Deren Wu <deren.wu@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH 5.18] wifi: mt76: mt7921e: fix crash in chip reset fail
Message-ID: <YyRCnmmwSRxqf2Ww@kroah.com>
References: <3bb8b13686a6d3f62c4094385b24e38ac769a158.1663219683.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bb8b13686a6d3f62c4094385b24e38ac769a158.1663219683.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_023153_712261_777F8A85 
X-CRM114-Status: UNSURE (   7.81  )
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

On Thu, Sep 15, 2022 at 01:32:10PM +0800, sean.wang@mediatek.com wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> commit fa3fbe64037839f448dc569212bafc5a495d8219 upstream.

5.18 is long end-of-life.  Remember you can see what kernels are active
on the front page of kernel.org

thanks,

greg k-h

