Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJIEXYbr/Hf54nIeaF2YLXDyEYCiNl8fRmI3BB/EvYc=; b=ORInkbuB68iQuZ
	F5cPS/xh+GY8Uus2e5IO3BmKxMZDdH5EQUrujz46UryXjnANwGLl64RVnfbYnbV5/dgbvY2PCBNH2
	QXemdM+xg7XYFbO8HQRs/3K72m0o2xkxHUDLYTW4pWCShVVfx+4GQP6kzus0pcrFL+oiqqJKhgNkI
	wDomCwkJzin7A+kEu6OFU+zcT9IZFgzUunqPpgu78vzcR2PjR7jyvAmjM76vzpWV5TqfI7iA78kdx
	mawXgT6MbfjLjuzXd0pOz8vk8jEdSzqNPDC18QA+18GW0d2tjsiY34hiUaan7vTYG1Q0p+AViLmFw
	mdHTSkebf928c1/Pyx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhnU9-00GkIa-Gn; Fri, 22 Apr 2022 07:13:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhnTv-00GkEB-4E; Fri, 22 Apr 2022 07:13:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1F3D61ED5;
 Fri, 22 Apr 2022 07:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0732C385A0;
 Fri, 22 Apr 2022 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650611610;
 bh=2eP5N2am4/TObX0OiEiogWXKWvfr8XKlaOBXPQ079Jg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ZKi7veBzeQJLN31agqjva9zjBCjEydINToeZWCJvlJZ1ivwGPyMAhDztg8spzo+iO
 kI4s9RHZuEqg4FceSlNiEnfh0sT8jFX8FgLDYsQbLks5Pp+VTBAN/mY5sbxXQaibwy
 diTKXcZxTM5Tc+Y2ohQG3O7LDwEQhMVJ4A5VN03Gspm8zEGHWQe4Fzx1Cd3QZMEz3c
 VwvPq77RwGFkRDgvbrf1+/ZbUdYQG0MKyvNWEIUZBCkxwGGoZTQFHrrUwoaUvmQz+g
 cT2A4a/KAegxLhPkN6QdUiJfuFL0/I0RZgJrZ+JnYMRc/Sigc/637GAF4mkYj7ItNG
 yvtnf+XY4cAog==
From: Kalle Valo <kvalo@kernel.org>
To: yunbo yu <yuyunbo519@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] =?utf-8?B?bXQ3Nu+8mm10NzYwM++8mg==?= move
 spin_lock_bh() to spin_lock()
References: <20220422060723.424862-1-yuyunbo519@gmail.com>
 <87y1zxmysz.fsf@kernel.org>
 <CAD55h6Z0GfEMu25_1PXavRA9SGJ2zZC4-y=6Bo5+Fz=99J6_mg@mail.gmail.com>
Date: Fri, 22 Apr 2022 10:13:24 +0300
In-Reply-To: <CAD55h6Z0GfEMu25_1PXavRA9SGJ2zZC4-y=6Bo5+Fz=99J6_mg@mail.gmail.com>
 (yunbo yu's message of "Fri, 22 Apr 2022 14:27:22 +0800")
Message-ID: <87o80tmvzf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_001331_246811_2A14181B 
X-CRM114-Status: UNSURE (   8.05  )
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

yunbo yu <yuyunbo519@gmail.com> writes:

> Thanks for the tip! I will make the patch v2

Another tip for you, please don't use HTML :)

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#do_not_send_html_mail

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
