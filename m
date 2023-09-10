Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F0EE57CD
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Sep 2023 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNrhuYQBuxzhzFLIqX43W9NwW6xLgMQJ//uUlJYMMxc=; b=j0jUHxDKKetImzyRFv5PmQfL/u
	oe0wNNLvZAwhM5f76+oOd/zAZF8G8R3rgz4ScmoxGhw331iyFkIKm44pxk5RQpB3QLEf1g802QAZR
	BURK47KUHpKGl85wQZJNoLzaF6qlwgDzz8oSsoEGciP3K595TqdawSAEBq3MxyntwPamQ000SxFJg
	WMWPBszePwozlbj+YTbRuZHVVmY4Ztfuhzehdp7Dklqz0KXS8g/EK3a6W4DFYJHrcErwqLP5yO/GJ
	5r/RMa0hWS8WJGvRi686qgL3eHs0o5s4i5hOqrKkfJ70KYJf+pMagQ2Zz+6gVeLjV5v8jOkd1EtzN
	NIuNTK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfLhr-00GfyS-0D;
	Sun, 10 Sep 2023 14:46:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfLho-00GfxV-0t;
	Sun, 10 Sep 2023 14:46:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F58D60BA8;
	Sun, 10 Sep 2023 14:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD05DC433C7;
	Sun, 10 Sep 2023 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694357188;
	bh=VZHoP5kYcYyfcXZ35ny5LQtB1CmlcEONkuJdZApsAq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vu/5QLhIOYnS8xqIO7rbRBslzmsH30XEnbqEkTiQvcceTcRlz4YiFQavVfR247kjR
	 JpAYHKtSPEy+SiS15N2JUV80YG7S2wPKeiziU4XQl1eM+2WOdprtjPGqeTF9KxFaMV
	 07Zws+msdzu1Gdo/tcPT7keO+G5ozcsvyYKeikRGzdS0X0hsr+A5kv/Wf50j4e+S/p
	 zWXV2UEEmipgqyypJJyvlxDvZKSH2cT6UYRD/XryirZt4tqpvkMXBlYDYQTxJDtZEu
	 S+JOWjbguxbMJM9CrCh1SwuVGYG7vHkT0SApkJWybXTipOiMT6DxJ+8RO6wJEBpLia
	 998bfF+BySEQQ==
Date: Sun, 10 Sep 2023 16:46:22 +0200
From: Simon Horman <horms@kernel.org>
To: Hangyu Hua <hbh25y@gmail.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mw@semihalf.com, linux@armlinux.org.uk,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com, nelson.chang@mediatek.com,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] net: ethernet: bcmasp: fix possible OOB write in
 bcmasp_netfilt_get_all_active()
Message-ID: <20230910144622.GE775887@kernel.org>
References: <20230908061950.20287-1-hbh25y@gmail.com>
 <20230908061950.20287-2-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908061950.20287-2-hbh25y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_074632_362715_7E85D3F5 
X-CRM114-Status: UNSURE (   9.34  )
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

On Fri, Sep 08, 2023 at 02:19:48PM +0800, Hangyu Hua wrote:
> rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
> rule_cnt from user space. So rule_cnt needs to be check before using
> rule_locs to avoid OOB writing or NULL pointer dereference.
> 
> Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


