Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75243C001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5qTe0YO8ZqB3VKwRihJas1gwrGZq8M70nX+lVeOtE4=; b=j8AcYPZ4VTtmW1WEH0HzyBxZw2
	yjUdEx0D3UyCqBDCpeXkNnkrplE3UEKzHRqv51bg+DgOCDJQ611ThBn/gv3ACKXe75VOlS+lpQD+i
	bDYga/WaqLGqsRGQNBxYy6/cYOzhoPcoPiFK26nOg3PmcYFvFlJwF/7RpY5zJ+aa+Jw9JzMFbxY3T
	qQGF4HR9npi2Cp25harNTrLYMA7tmnGYBSidc7wMAvUtRX2x5Ta9Zu7Kz8wdoo3ZNvnX3vu/HvN0k
	O8iK6W5VBUojeQNO3phnwyh0tXQVYRyJ6y5NA7GwtA5mYeiV771FfDETELl4e7+zRbKttN0kY9Bak
	1epTxt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU2F8-0070vk-2j;
	Thu, 10 Aug 2023 09:46:10 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU2F2-0070sf-2e;
	Thu, 10 Aug 2023 09:46:09 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44EE421852;
	Thu, 10 Aug 2023 09:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691660758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T5qTe0YO8ZqB3VKwRihJas1gwrGZq8M70nX+lVeOtE4=;
	b=ncg0wKhJKKECfLl1sFF4YhPUNlfV59io48guMoOonvWgTdJjVRfGbdT+1/bWhly/jpv7hx
	kIdLlCbqD7WfxmQ2H97bi6Z5frEgW1eDwSJCenXTxKr4sPNFcDpXOcQh97eaztbtVe1DRT
	jGXCmWWCnE6LF3DX1/qMszXsf+Qkxyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691660758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T5qTe0YO8ZqB3VKwRihJas1gwrGZq8M70nX+lVeOtE4=;
	b=z2fwfT5Fk/VdD3D/wapPZUHO8CNQLtNVsxwkSYm/8Ip/D4tiTihZOBGPtvem3ZPDvLmSn6
	O/i0ueJsxX0FexDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33164138E0;
	Thu, 10 Aug 2023 09:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4fbbC9ax1GSsCAAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 10 Aug 2023 09:45:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A36BCA076F; Thu, 10 Aug 2023 11:45:57 +0200 (CEST)
Date: Thu, 10 Aug 2023 11:45:57 +0200
From: Jan Kara <jack@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>, Haibo Li <haibo.li@mediatek.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Subject: Re: [PATCH] mm/filemap.c:fix update prev_pos after one read request
 done
Message-ID: <20230810094557.pesc4pnwuicrisqh@quack3>
References: <20230628110220.120134-1-haibo.li@mediatek.com>
 <20230809164446.uwxryhrfbjka2lio@quack3>
 <20230809114507.57282ff1dd14973f3964e669@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809114507.57282ff1dd14973f3964e669@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_024604_999009_E2738F0E 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed 09-08-23 11:45:07, Andrew Morton wrote:
> On Wed, 9 Aug 2023 18:44:46 +0200 Jan Kara <jack@suse.cz> wrote:
> 
> > Willy, any opinion? Andrew, can you pickup the patch if Willy doesn't
> > object?
> 
> I added it to mm.git on July 2.

Ah, sorry for the noise then. I should have checked that. Thanks!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

