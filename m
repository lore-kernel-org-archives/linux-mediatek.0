Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7393AECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugcehkupr6FadWQBsCRjjGUCn0qbgaXtGD8Sxn8MIYY=; b=g0/5GSBYWhnaHdlcIgo3keibDJ
	y4l0Ou2Nw9m3QpM2Rgfh36/ot++CpFO8rZg1mtYRiQAIlg/gJJt0g39rP1p5afaguMe6XE6ghUfOP
	oIbPKOHLhbskFwVmHug2pms4XoOY9UjnxbvZHXYy4GLQJacncK20G9RvWSakoqyESXOYJvR3e1F1+
	LPipWjS7gB6npG6XMZKRFQl/omDZuVYEPy3SYoseSDFpLaMHistUP1LXCsph8IDdEWZtqFTRA9ncV
	GCM1KXq1hIqsfctsuZk/p4BoU4vs29y5gtrWhw14z3hVSgPfANiEjcLG98NdukzvBieGjovOaf1sn
	q9aF0Sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShRb-00Bfcr-Ge; Mon, 29 Aug 2022 16:16:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShLq-00Bcyz-Vd
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 16:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9AB80B81117;
	Mon, 29 Aug 2022 16:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECD2C433D7;
	Mon, 29 Aug 2022 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661789459;
	bh=JrmSmvfDj2tcyi69FrlJddBAl36LjWNQ2wBjUnlClnY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eDfXNib0z4pzREhM1o7QwKHkOpAjHwebsTyWCxRdHPgcErzc00IwgphqigeAgmoKH
	 gfoW6Gv/qxgGssc5nTSI+oCPaznEZhIxjLiiqttz99M9U+E73KXKNaEFLpjAS8g+dP
	 7TsDXh9rf+qJE4JF0n/MteCqZcUEEQpsETikwSwU4vzqn0e+TnGKknNFm1VTiWkbQi
	 WnAPNi7ZnT6je64zbzvrQc0wukVLLZrYL15V+d6PlubPfXR7wvDbF1zSXpaV442GZe
	 n2tXhFGTE3m5XduOWweDB4MF62r/gwk3P6Xe1mGyBSFq0J75d4KTlBhlD2DT8tB8Lu
	 wbpGmVjadZAmQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Deren Wu <Deren.Wu@mediatek.com>,  Johannes Berg <johannes@sipsolutions.net>,  Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Sean Wang <sean.wang@mediatek.com>,  Soul Huang <Soul.Huang@mediatek.com>,  YN Chen <YN.Chen@mediatek.com>,  Leon Yen <Leon.Yen@mediatek.com>,  Eric-SY Chang <Eric-SY.Chang@mediatek.com>,  KM Lin <km.lin@mediatek.com>,  Robin Chiu <robin.chiu@mediatek.com>,  CH Yeh <ch.yeh@mediatek.com>,  Posh Sun <posh.sun@mediatek.com>,  Stella Chang <Stella.Chang@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  linux-wireless <linux-wireless@vger.kernel.org>,  linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921e: fix crash in chip reset fail
References: <727eb5ffd3c7c805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com>
	<CAGp9LzoZkxONid2Kt-ykuQWiY1pTG6NGxho8FeLwMd9MdWd-rA@mail.gmail.com>
	<CAGp9Lzo+MxynP-Lwb8_eCX4w+EQ6FqZAU3w-OMpcj7x1N8xyyQ@mail.gmail.com>
Date: Mon, 29 Aug 2022 19:10:52 +0300
In-Reply-To: <CAGp9Lzo+MxynP-Lwb8_eCX4w+EQ6FqZAU3w-OMpcj7x1N8xyyQ@mail.gmail.com>
	(Sean Wang's message of "Fri, 26 Aug 2022 03:50:26 -0700")
Message-ID: <87wnarc9o3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_091103_214784_B5747182 
X-CRM114-Status: GOOD (  13.85  )
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

Sean Wang <sean.wang@kernel.org> writes:

> Kalle seemed not available this week, so I would like to look for help from you.
> If the patch looks good to you, could you help apply the patch to
> wireless-drivers.git because there are getting more users reporting
> the issue with the stable kernel such as [1]. I would like to backport
> it sooner once it appears in the Linus tree to solve the indefinite
> hang issue. Sorry for the hurry request, I knew you just sent the pull
> request one moment ago :(
>
> [1]
> https://lore.kernel.org/linux-wireless/VE1PR04MB64945C660A81D38F290E4A4BE59F9@VE1PR04MB6494.eurprd04.prod.outlook.com/T/

Johannes applied this now:

https://git.kernel.org/wireless/wireless/c/fa3fbe640378

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

