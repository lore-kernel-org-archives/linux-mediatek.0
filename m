Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE6EC54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01QHWsVdZjjASko5mGiYaotM+I5zdNagtdeFs/E2Ckw=; b=Pe2RTxKQTN3BfUsp2IcUHnEggX
	De849UKhc602r9YhxXfjSe/UnYYgpuASDTHoFpBX9W6hAb/8hztfPyGURVXHZVKYo5v94PsbA1xhn
	FoXaHhZE+gj0I3iPuEjxzraitbc6Mo4FoW/Tn0/DNwRIzWrxGgyoG8Sum2Qxr6Xpz8YCKX6CS24tF
	HXjLmvY31oDA51zj6a3nEaoin9Wsk4Qip0EmYW/abN1ehTuMWOC7ejeblq+unMhq1At6XF5hJP5wM
	Ow4PQSWh93hsBELWMfEMnlU2hRANzC5Bpn8xT/JdqisXKcbphEOggKEWoBK/5ISIHY2iCDUUSVjMs
	r0tIybZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PGd-00GbnN-1X;
	Tue, 21 Nov 2023 11:50:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PGa-00GbmU-1G
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 11:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A296616C4;
	Tue, 21 Nov 2023 11:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700CAC433C7;
	Tue, 21 Nov 2023 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700567403;
	bh=TctL7ube5UouPXuNkuXmxJ9dst6jjdEmdZ8tTRazoOY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GeyDXz5Raso7UvKamvDSPVf2gXeu/HV0DEtApSwItxC/BGDzGclV8+4HAVJiJwy0F
	 Ong1awnNfpcY/cIXr7cxDEntQbKqWK9idtmP6dwuSUYUNfkbU7TWBPTe1zj1ThI1yO
	 zsudFhsAN+sbTHhoJTAjjZND3AnW8VDpgfUNyiwm+YalH4kkjecqkhKMZaq2hM85pq
	 veAQ0ek8AuVTbrCjG7qSGy1gyKC2f+Cu/Gu2FxsleAZeX/yQ5WsLfSU3bvRcsYjs4Q
	 sGs1HRXgviGPAsvgpMY4/xyOIb6VgE8Ud9A2FAbU0uK8bgGLO3C2uhxC07P9lGfx6v
	 gOjfZScGSucbQ==
From: Kalle Valo <kvalo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo@kernel.org>,  <deren.wu@mediatek.com>,
  <Sean.Wang@mediatek.com>,  <Soul.Huang@mediatek.com>,
  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,
  <km.lin@mediatek.com>,  <robin.chiu@mediatek.com>,
  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,
  <Quan.Zhou@mediatek.com>,  <Ryder.Lee@mediatek.com>,
  <Shayne.Chen@mediatek.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/3] wifi: mt76: mt7921: series with CLC patches
References: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
Date: Tue, 21 Nov 2023 13:49:58 +0200
In-Reply-To: <20231120111212.4478-1-mingyen.hsieh@mediatek.com> (Mingyen
	Hsieh's message of "Mon, 20 Nov 2023 19:12:09 +0800")
Message-ID: <878r6r8gwp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035008_479463_949A9951 
X-CRM114-Status: UNSURE (   6.48  )
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

Mingyen Hsieh <mingyen.hsieh@mediatek.com> writes:

> From: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
>
> Sync internal mt7921 patches for CLC.
>
> ---
>
> Ming Yen Hsieh (3):
>   wifi: mt76: mt7921: fix country count limitation for CLC
>   wifi: mt76: mt7921: fix CLC command timeout when suspend/resume
>   wifi: mt76: mt7921: fix wrong 6Ghz power type

v2 missing from subject. Please carefully read the wiki link below.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

