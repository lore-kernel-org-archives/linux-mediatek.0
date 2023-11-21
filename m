Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6471EC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBwKTbSIDqUja5T6bhGoS9fGieFpoERNoqYbij8U3/g=; b=sgGkVyegGbHvPpizKvDyRuOZQ9
	9yDv1sip7t2B1RKn+FXAL+9GEsPCy+NfAa+wf4nt7foLFe0LXuViLa9x9/29cTchAufB2OWIu1KKS
	3Esjg5DavInUIBBmS2m6Uzlu/Fm/0Zsc3LpBgEaMsMxEdSiQ1zYk/mpQm1p5fV4jL+GkHqoaAY1UE
	UvWNrR8A5+s+lbVMaaypxSyDjc4/zYbtWlpdHMpWi6Hf/QVJa+0X4UvOdUEN92Pe9CBybplNklFRl
	hmRy4tAt+QASRu8rHdO6J51rDx4gHyagn4j1mGvqct0HakFb0y06XHms3JJ/jb/v8+xKRn0Yp8iSQ
	pDKlgjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QBW-00Gjju-1S;
	Tue, 21 Nov 2023 12:48:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QBT-00GjjZ-22
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 12:48:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E890361910;
	Tue, 21 Nov 2023 12:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9146AC433C9;
	Tue, 21 Nov 2023 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700570934;
	bh=FeCtxbqlbC8xnrWkzJX683N7ngIDxVlLlLEvOhQvDdc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BhHj4Otq6Fz0bwX1UDVigzCodM/cZhflcYVltMJkPeFUwbpATfGcrsQjxMGM3hUi8
	 44IxcX02y/ItdSdnu3zD1/AsGDGEskcc78um3f3ABni4wrH2H6Qt5KtVQ7ztjE6/d5
	 W3+Aqg96TShucaQyIQY5WmJWLl6uC85Cf0xy8D2tER+zvF1qWHBPiDYwiK4X3jthqu
	 7KU8j0WMcWMDb2bXz6/OGC7giXRCS8VpLVuEESZzowQ+v1Vb2kOw2BwdTeT/6mbHtE
	 3gN2adDQ5G3fdPQAQ1WV/dL761w2h6K5lvGz6uVmqx/VmIctYealFjfiHWXOLzE33k
	 FzgmJmqPehp6w==
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
Subject: Re: [PATCH v3 1/3] wifi: mt76: mt7921: fix country count limitation
 for CLC
References: <20231120123940.5788-1-mingyen.hsieh@mediatek.com>
	<20231120123940.5788-2-mingyen.hsieh@mediatek.com>
Date: Tue, 21 Nov 2023 14:48:49 +0200
In-Reply-To: <20231120123940.5788-2-mingyen.hsieh@mediatek.com> (Mingyen
	Hsieh's message of "Mon, 20 Nov 2023 20:39:38 +0800")
Message-ID: <87v89v6zm6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_044855_715462_7376F6F5 
X-CRM114-Status: GOOD (  10.17  )
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

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> Due to the increase in the number of power tables on CLC, the variable
> nr_country is no longer sufficient to represent the total quantity.
> Therefore, we have switched to calculating the length of clc buf to
> obtain the correct power table. Additionally, the version number has
> been incremented to 1.
>
> Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> v2:
>   - Convert type of buf_len from "__le16" to "u16".

Like in v2 this should be after "---" line.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

