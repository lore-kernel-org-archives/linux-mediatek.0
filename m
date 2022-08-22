Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86F0C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2wwJ2mTutwgF6hH2FEyJ9DkgEp0KGkH49PFoZsFmEw=; b=AzX3NAY7VdDESFdP92Wp+VRXnO
	KzGq3opBY1FoORefu2wkrKVhQe/EpCSVqlB4Cr2LV9uTehXreTGenXfH+4n5Fyhhg8EwqLuLZI29H
	5cg7tIPWKq4N9pLhl9KM6LoSFLpAKkPNOzpM/5fzMxOhPLEjh5iuNYKtI5t/5V7RMgtZYc6baB6cU
	J/k5k0dZd3S5wJIZprisNieUWnOfsR6VbiMbDL8kao54qQyDLhBzK3DPm3bltDGN3uxrQyHiD3EsK
	EDWN1TaJOWsqWhPwKQIm1vebzny5ZUeSmV7yXLDsu3+W0AVywOatkfzkfmGi1YC9VmPVPyfN9+lHJ
	P9dCIihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7Pf-009wYw-Kj; Mon, 22 Aug 2022 13:24:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7PM-009w6o-4s; Mon, 22 Aug 2022 13:24:01 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5AC056600015;
	Mon, 22 Aug 2022 14:23:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661174635;
	bh=UWbfv/xp8Lk8ZUHhil0GHBm6jDjKPoDOB/7CHnZRRRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq83uFV+QSihfQTDt7FEavpyBX/VxM6/UOHzdLT8d6pkw7k5Y2lHtZJmun5vXOwls
	 L3LRRTqee/6f1tWjvVI7UUSu1splKLhhoejOsFAvIndDyZ1WrYubEbP7Hpmx2xrINd
	 nqocg17Nrpzgrg/ZoDiyNX16AbWNikAqsOXyV7ckD9b+8oj0r+51yqH5mUieAiPJH0
	 P3RPQ2PHGtGMdEu+q1AGGzCQ2gdgsGKiPJr+m8QHCyeOO5CJsNyr9b81gv45N35w1H
	 TnNiHYinvQypJjoUoEEz4MjVX8ZF1Hhfle14tDNi8QhWIYUxgFlnvgDa4fuPiltG1m
	 56oOwr547m/rg==
Date: Mon, 22 Aug 2022 09:23:50 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220822132350.tw73ph6nnvti6h5i@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-2-git-send-email-xinlei.lee@mediatek.com>
 <20220819185400.aokd53xln6rmc3xk@notapiano>
 <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49fcb1b354199b56279ecf1ccb90d48361de796d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_062400_443700_62F06311 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, Aug 22, 2022 at 08:50:45PM +0800, xinlei.lee wrote:
[..]
> Hi Nícolas:
> 
> Thanks for your careful review.
> I will correct it in the next version:
> 1. Modify key nouns in the description;
> 2. Modify the label of jitao to Co-developed-by;

To be clear, you shouldn't change jitao's signed-off-by to a co-developed-by,
but add a co-developed-by. If you check the link I sent earlier [1], it should
be clear that you should have something like

Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Thanks,
Nícolas

> 3. Macro definition address lowercase problem and function naming.
> 
> If there are no other questions, I will send out the second edition in
> the near future.
> 
> Best Regards!
> xinlei
> 

