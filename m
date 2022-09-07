Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CAEC38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBoAdOOqHg698a41OFCFI1H43Fnb2GXfxi7yfUgqy9k=; b=OYWf8vyUe3jubcUrc3vGIFrENx
	t5lCmfB3yZDzaXw5vly0aXQFddLJtwBbgM4rcfdkLd4xQ/Be82B7VKPtdqDmagdfj8vnqQXw0FjL6
	c2mhzFj9zy2JbWPI+gp0Zk/9ngH6eXN30jbfDngny/R38YAIyVU9Re3/bBtBqwIqW5BVxrmSumigf
	38NgUmoL/Z4Edc4jRY8yluvns9bSsh2qsyAtQZ6Er7oDJI0BcROGrxLJPw1P7hia8px61TgAukk+t
	C4MDStWuyx16WfsTgdO7eljNuwN4Cis3eIkMeUGhUJXMLy+GP99DRAcQ0ZUMFs9nrD3UhziMT2rs3
	54H4ErsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVuHe-0069jy-G8; Wed, 07 Sep 2022 12:35:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVuHa-0069gb-Dh
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 12:35:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 786E9B81CA8;
	Wed,  7 Sep 2022 12:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6908C433C1;
	Wed,  7 Sep 2022 12:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662554150;
	bh=fXkjPb8jUgsIkfg1aYljnoRc0RfGzWHnE/2su0nDKS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxdSGXMS7IqnSocdzqv9bPHa6ZmQ0tk7qXQxDzSNDPgrSNJBR60sGgO4xAj7VQA4s
	 ec3TbO7Ug1uTETmchPq3AgNCwf0v3CieiSqVU6bPrvs5h7cy8t9Ck5ao4Q7c5phyeb
	 +gEKZeDc1vlaoKfudxmiIB7NQex2xjDx8+cU8ErI=
Date: Wed, 7 Sep 2022 14:35:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: chen zhang <chenzhang@kylinos.cn>
Cc: chunfeng.yun@mediatek.com, chenzhang_0901@163.com,
	linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: mtu3: Fix spelling typo in comments
Message-ID: <YxiQIx5AEGDnLzlX@kroah.com>
References: <20220907051436.51703-1-chenzhang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907051436.51703-1-chenzhang@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_053554_638250_1A1AA8D2 
X-CRM114-Status: UNSURE (   7.92  )
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

On Wed, Sep 07, 2022 at 01:14:36PM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>

What is "k2ci"?

Please follow the Documentation/process/researcher-guidelines.rst rules
when you use tools like this.

thanks,

greg k-h

