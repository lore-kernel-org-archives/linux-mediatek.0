Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE13C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X8ArrYQvPtogXJ8IfDEzZSrudueHfBQMTpL4jQbHrM=; b=diVijgXNglzb9c
	ZY5ybNmP7pKjQQt/wXk7pwa+1Falz+e8OiubYTJqC1GeqIHmNVXDSPORGIzvGqeP4zEzROF3/+fba
	5r/gmKTFjLJtQvQwQ458W+cTFtBId+cGjcs31/vr9xhPNimvjPlBZ6Lj4oN3/Dce7N1sj8y0p0qLi
	058H6Heac9etYDyaz3EdgUZfOpMNEy5WBebQhU1FGnSRWLlO0zR4wXeU7vTN6ZNvLnP5etQiGlRBD
	COuPMBp5hkZbuFwhaCzDrxoVAdOvU+wxfzNtbw3hE9wmfpiFkIpxnNwHWRPosO+XdOMe/iAsfq0zh
	huKNxqEUdFcc2XuHHDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmjo-00GWXm-SY; Fri, 22 Apr 2022 06:25:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmWz-00GQES-LM; Fri, 22 Apr 2022 06:12:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00122B82974;
 Fri, 22 Apr 2022 06:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8884BC385A0;
 Fri, 22 Apr 2022 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650607954;
 bh=sQ993ibhAeZKDcNyaBxUh8xxW2w0Mr0D59fXMweNxDo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=MO2Y585mR5sjxallnGbTxLm7lumX8vaQRJ1VQ77iUu+P4Lv4T6D9/Ra2zZZXIZP4H
 /9kITjFvEp3MuTorG+KCGgZgqyuxJEs+mats6svXnewEo/I3CG6U5nybxQTqbc/6vT
 v7wn5/fR9gBsCVYQNW1ck7iOwRlVdKTvKMwPPwAOcTnMQx1qU3GWBBdPr0C/rTFEuZ
 VuX+91k4L/1K4/GgRe8wz2tsXi6HLDCSSFPdH+4eFodyOQGPWGXOIM58GFHMMH6FaX
 xjZY/NAo1Q1ElIgWRaoh8aK0ZSjnRbsXQKNBR0fkkC3OHmnuL15oqqjzT5UVYcMIIr
 Oq6UNsKnGi4ZA==
From: Kalle Valo <kvalo@kernel.org>
To: Yunbo Yu <yuyunbo519@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] =?utf-8?B?bXQ3Nu+8mm10NzYwM++8mg==?= move
 spin_lock_bh() to spin_lock()
References: <20220422060723.424862-1-yuyunbo519@gmail.com>
Date: Fri, 22 Apr 2022 09:12:28 +0300
In-Reply-To: <20220422060723.424862-1-yuyunbo519@gmail.com> (Yunbo Yu's
 message of "Fri, 22 Apr 2022 14:07:23 +0800")
Message-ID: <87y1zxmysz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_231237_922140_4EE0C733 
X-CRM114-Status: UNSURE (   8.84  )
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

Yunbo Yu <yuyunbo519@gmail.com> writes:

> It is unnecessary to call spin_lock_bh(), for you are already in a tasklet.
>
> Signed-off-by: Yunbo Yu <yuyunbo519@gmail.com>

Why do you use unicode character "=EF=BC=9A"[1] as colon in the title?
After all recent news about left-to-right trickery all special
characters make me suspicious.

https://www.fileformat.info/info/unicode/char/ff1a/index.htm

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
