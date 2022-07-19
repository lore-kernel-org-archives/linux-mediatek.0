Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F87C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQkGZ2bUCaXoPh/D/Jj4IPkCDd93zpdb0jFOJ4x+L1k=; b=30z9x8ODhwyrQLpS85oZNMkIeX
	ZCAGryvzgoSLfnNLRo3sGXjz7enLmQ/baTXwrkR0qTr9dXALUC72o4V37i0SBMEsKNO1hs5W6DiEd
	kfeFNWdHz5C+tkhOjsH18z4nmMmNhwngjUxl20qR/N8ifnnyVK0VfqK4Q2/dDrg6k0dPTIEzk2p5C
	VicFQRduC42rNiwZWB8PeyYky8JnBS3doSJ/U5ZN7KtEymo6YR6HQSt14p7nHF5twLgiQ+I7d9Vp/
	ZNofBI6zwNo1kvemeqERCC5McnLEf3Dnh84wK3k+lUNKd6TEYpST8qC57IKLSlqaazcOMoGcnd5oh
	Tzzuieew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnNt-009Fl7-RK; Tue, 19 Jul 2022 13:35:33 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnNg-009FaR-R7; Tue, 19 Jul 2022 13:35:22 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94DEA347EB;
	Tue, 19 Jul 2022 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1658237713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQkGZ2bUCaXoPh/D/Jj4IPkCDd93zpdb0jFOJ4x+L1k=;
	b=RXpYSGlmRcef3l7YiwRFdAApPwXNCGsn0BDGq8RMYOlXFurF0+ck6ho6rGcVbsWtc/fUP6
	De4sOP94LDSs7rGW7/DXiKXGZ3iMCVaCS8xrKMTqCvGXTFpvP8npNoI8fDTvetmmD0jubo
	mc2b6WY+Bg2Qby9yeLCG9cnhEe+PPKo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5975513A72;
	Tue, 19 Jul 2022 13:35:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id I8ALFRGz1mLrXQAAMHmgww
	(envelope-from <mkoutny@suse.com>); Tue, 19 Jul 2022 13:35:13 +0000
Date: Tue, 19 Jul 2022 15:35:12 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Jing-Ting Wu <jing-ting.wu@mediatek.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shakeel Butt <shakeelb@google.com>, wsd_upstream@mediatek.com,
	lixiong.liu@mediatek.com, wenju.xu@mediatek.com,
	jonathan.jmchen@mediatek.com
Subject: Re: [Bug] race condition at rebind_subsystems()
Message-ID: <20220719133512.GD897@blackbody.suse.cz>
References: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
 <20220715115938.GA8646@blackbody.suse.cz>
 <YtGaP+e35DZYSQf0@slm.duckdns.org>
 <d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_063521_047326_4194B369 
X-CRM114-Status: UNSURE (   9.71  )
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

On Mon, Jul 18, 2022 at 03:44:21PM +0800, Jing-Ting Wu <jing-ting.wu@mediatek.com> wrote:
> Accroding your description, is the following patch corrent?

Yes, this is what I meant (i.e. grace period before invalidating the
removed rstat_css_node).

> If the patch is correct, we will add this patch to our stability test.
> And we will continue to observe whether the problem is solved.

It'd be great to have such confirmation.

Thanks,
Michal

