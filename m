Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A7C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+EyzJscg4VpJjU66cXo33wSaPO1c5T2jdLer+vEbsw=; b=qy8PobEe8J3YSu2I2UiDRBA2ZR
	axM9/IFvBQDmiJbjKES5F4aCwvmC1n1mi7mCJiquAOUWf400PZ6cBJBelb5lBc+ptHms/EpRa6AWv
	Y1AnVoScbRqIfbA2ODLrJSETm+xCKa3nwGf9BkkVhbU64OwN78BcCB3FBrDcr/TZHErfZs2k3kRxB
	7kpYJnERQgiZLqNLR+RxlUznDVG9kTqAqFa41FgOR/BekQrZdv0pLpNi63WvA+6ykxJHiS5jiV4JN
	zA4b80WXM/fpOF6CNoO6ghC6epo+kpoSef3MMCqqIvnMhpjeXXw7ZmuAcIoM7e/lIIdgprE9HCszx
	TC0YGRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfpm-00DJ8Q-Ht; Wed, 27 Jul 2022 12:08:14 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfpk-00DJ6B-4T
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 12:08:13 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6E933865C;
	Wed, 27 Jul 2022 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658923690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+EyzJscg4VpJjU66cXo33wSaPO1c5T2jdLer+vEbsw=;
	b=phkAUvtrEaJzhXVspDR3xbFHwnPuPF6hRWG6wXCiXyiYnx++zrEcr+I8/BW5pGgeD7GfJ9
	ATTvr70Hiwhr046SR20q3nQ2OCwJ39kowKTYcVvTKDu8m7DSpyBl3+3rVdZsUPPu/tCA2y
	6L/r45fdixv4ZSjLKpd1nGkjiniVPo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658923690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+EyzJscg4VpJjU66cXo33wSaPO1c5T2jdLer+vEbsw=;
	b=WsrR5yGL3KARAxekQE3TpX1xe+494uIZcY/zfMzV/Q/Amis0en1bFets9ndhOEK4lXlMby
	IUvcFC1dl5xfplAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6603E13A8E;
	Wed, 27 Jul 2022 12:08:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 34NDF6oq4WJnFQAAMHmgww
	(envelope-from <jdelvare@suse.de>); Wed, 27 Jul 2022 12:08:10 +0000
Date: Wed, 27 Jul 2022 14:08:09 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Liam
 Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <20220727140809.0951b72d@endymion.delvare>
In-Reply-To: <YuEpGTD/DbC1T9Z0@sirena.org.uk>
References: <20220727132637.76d6073f@endymion.delvare>
	<YuEpGTD/DbC1T9Z0@sirena.org.uk>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_050812_356706_CEEFC14A 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, 27 Jul 2022 13:01:29 +0100, Mark Brown wrote:
> On Wed, Jul 27, 2022 at 01:26:37PM +0200, Jean Delvare wrote:
> 
> > This assumes that the mt6380 driver can be used without OF support.
> > However, I can't find any in-tree piece of code instantiating the
> > "mt6380-regulator" platform device by name. So unless there's an
> > out-of-tree user, a better fix would be to remove mt6380_platform_ids
> > and make the driver depend on OF. Chenglin, would that be OK with
> > you?  
> 
> It's helpful to keep the build coverage high.

OF does not depend on the architecture, anyone can enable it. So I
can't see any problem of coverage with making drivers depend on OF.

-- 
Jean Delvare
SUSE L3 Support

