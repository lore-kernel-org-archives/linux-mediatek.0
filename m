Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49451C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p4lyLWmbx5MywfcRK1F7JerrtdXLbKa1GPlzKaEhug=; b=HkCkPMkFRN+2sy
	Z0Yz6DzHNva11C0hoFpGeL+xD6lhCZqWPiq3BrZDDFGZDww3ih/J7iEYA283nSAb4vQyNCZNufdS+
	jvShgvUltKac0K7SbeCOqklwmuC25bSkbKE5KaJB6RkqrGhAO/96wpSx7sZm0kgZzppH6Zk09zPLf
	NJ+voXVtL5s52pt41WQIubnnyX0zIRvM/+E5NX18V8aZdj1cramDHWxtzOu5039C8a4cajow3cfdr
	NOR/m9gKIrESoMw9RrYMv6vMqC72Y6pop0Ja/mVbSyc7zKP9BOk8Or+cqG2ntxuTaEGdpA6XEn0ty
	e033GkwIqitQjCaHrpjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngvpd-006Slm-3q; Tue, 19 Apr 2022 21:56:21 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngvpR-006Sj3-Jl; Tue, 19 Apr 2022 21:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=XuyDMDgfjUWSnDEO3vbp5OM+VTMtqR7vlgj7konRGyw=; b=uQjWdcrQ3uLD3BETEeGb4ybGza
 lXqbcnNfSlHFtaKFS2aFTgySntHyvI/rcWPXxSSFpUwSeFKIlgtlu5+wRhUVBf5trEJ5j+Ad+yt6V
 4IQNtlXvmSGBGfGLPq2ZnYrqm15JqZWepORtampGy4l0tpTG1YgNmgRb3+6GMl1MgC+M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ngvpA-00GZuO-Io; Tue, 19 Apr 2022 23:55:52 +0200
Date: Tue, 19 Apr 2022 23:55:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: cgel.zte@gmail.com
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix error check return value
 of debugfs_create_dir()
Message-ID: <Yl8v6OcArfqmVYj/@lunn.ch>
References: <20220419015832.2562366-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419015832.2562366-1-lv.ruyi@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_145609_681712_769AB9E5 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 19, 2022 at 01:58:32AM +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> If an error occurs, debugfs_create_file() will return ERR_PTR(-ERROR),
> so use IS_ERR() to check it.

Please take a look at for example:

https://lkml.iu.edu/hypermail/linux/kernel/1901.2/06005.html
https://lkml.iu.edu/hypermail/linux/kernel/1901.2/06006.html
https://lkml.iu.edu/hypermail/linux/kernel/1901.2/05993.html

This is the author of debugfs remove exactly the sort of code you are
adding.

Please teach the Zeal Bot that such code is wrong, and you should be
submitting patches to actually remove testing the return values for
anything which starts with debugfs_

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
