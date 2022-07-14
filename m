Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F436C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 06:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNaIchxwrjuofnAS9ekr8IuKfXm3YW7Nam0UWOIcYYs=; b=CT31PC0FfJKrw09lQwrzToDaBk
	usc2lLAO857lK+o3r1ne2Mz2UCAcsfjMOmsK7IKMWEKtEp2PMkncSE3f6H/X8nmrXOWnIOTudaZAW
	7JMVGJeNZlnfXEY5D7yJJTtvZyzeYdSNx/g92jukR8mHFaYeD4Vb4GtK7PHqZ/332dUGuBrQUpXNp
	xsraRnfKbxN0ThzGYJTf/QKWY6O39mIlNi9LL5ki75BU/VCAo+TeqSw/rU0EyL6KtcDhC0UddFFyy
	ITm85+tav27pz/xJNUj+pEulwKlC8oIMz169svTNa1+gJpP3HIm9bdIWCfvyPsNwi9JJqWe/Wmrk8
	lTF0oHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBs1k-00BJAN-3u; Thu, 14 Jul 2022 06:08:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBs1h-00BJ8g-GT
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 06:08:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C827A614D4;
	Thu, 14 Jul 2022 06:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45C8C34114;
	Thu, 14 Jul 2022 06:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657778920;
	bh=o9lMKv613CrGGGygcthUdb4r6QPjw/LhZtoV5PD7a2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTQvcGYaPiqQUid3SIlQwBgz0x2usn1xBAD6Q9/9C6XDcMdw2H3olNWk9+VNhxbAq
	 a8YVCJvVJtzITAjcX2eE3anmQoJ1MWXJk0jZFPPxX0aSuYIepproHBOMGtE4okEohA
	 3hY91SEK4R9ATArIft3De4vnhpDGbtETslV4LrKY=
Date: Thu, 14 Jul 2022 08:08:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sean.wang@kernel.org
Cc: stable@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 5.15 2/5] Revert "mt76: mt7921e: fix possible probe
 failure after reboot"
Message-ID: <Ys+y5QuKqtTPBGd0@kroah.com>
References: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
 <c297b97b4af66777202652b29183397e671bc15d.1657764335.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c297b97b4af66777202652b29183397e671bc15d.1657764335.git.sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_230841_631718_EE9FCE8E 
X-CRM114-Status: GOOD (  11.38  )
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

On Wed, Jul 13, 2022 at 07:07:38PM -0700, sean.wang@kernel.org wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> This reverts commit 649178c0493e4080b2b226b0ef9fa2d834b1b412.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> There was mistake in
> 649178c0493e ("mt76: mt7921e: fix possible probe failure after reboot")
> that caused WiFi reset cannot work well as the reported issue
> "PROBLEM: [Stable v5.15.42+] [mt7921] Wake after suspend locks up system
> when mt7921-driver is used on a Lenovo ThinkPad E15 G3"
> in http://lists.infradead.org/pipermail/linux-mediatek/2022-June/042668.html
> So, we need to revert, fix and land it again on the stable tree from upstream.

Same questions here as on patch 1/5.

