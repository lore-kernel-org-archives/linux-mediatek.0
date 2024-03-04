Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85038C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8kgPSPPna4dH0M7/iKm18ndZucV70SQX7/2NEYylsI=; b=mgleDPkccwoys9asBJ3tcKk9n6
	tFyrbqo88UfdlunT0rT7oivQOMdRI+1HEIwu4PttPWa1OGbPe1nItmBYYLLNVjZlVvITc/v/59aL1
	SoiK/JE4d/DemCT4pBfWzQYhPKj9QL6IfVdZxtBuJRLzTMZipQSJlyM5n2uw5VU0srDih+grmC4IB
	hoZqwkwLeBP98yNeTmtbKZfVc1zp8Nr964CDxd11f5FoKM+Roaw5buYHMzsXzqIOcNoxgMEbO6pDX
	PxnFLtBW6+7gL7jHujnsnFmKjBByzJIGCkBUFbzTfo6pK6eFBGfxvtPwfpfyujXYyxVDAOxUTjd5I
	EY5r507Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5b3-00000008cp1-0GsN;
	Mon, 04 Mar 2024 10:31:01 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5LJ-00000008YZV-0sT4
	for linux-mediatek@bombadil.infradead.org;
	Mon, 04 Mar 2024 10:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G8kgPSPPna4dH0M7/iKm18ndZucV70SQX7/2NEYylsI=; b=GgjcgOOSwv+EoAAdSX2oYzbH4M
	USMRu9Y2PvcAzvYBqTMlaIRq+2V7A+e9SM5eXP5MKpQlfue+jl4nqG7UpH/hROrwZ/JVd3SWPpVln
	+boi24QHN9JYaCLT3hSzGWp22TqgxrUa5h4vWYuQ3ClXXsS0IFP3oSWxysS4OeJyfwDZ1cYwjd/h9
	UTWQo4ZsOlpDEb+o5BbgfCEbJJgMDFLhSgp/kMz6UYa4i/ry9BvVHbdxNzqstYqmk9EwHJpOO2dLW
	Jm073KDuGiTRgBhOR/fAK1cCFklXxp7mRZaaDEywnWiD/94jZ4/5XN6qOX9d9/ciJ81p6cmJ38Okx
	0SZe0Vbg==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5LE-00000004nCW-3ueD
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 10:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547272;
	bh=fO4QOmuGpd5S3/fWHE1SIGqcoOK/JVkcDRqNODPX8fM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMILeHO6fe5rz95BKQAkxO4SzVLGYXzRFTmcjdkoxkUbZ0jmvmShvl+GCbL4Uo79A
	 p+VSJVIKfTb/1u88X9EQzug3RUaeCR7LYWNnG44WcUqib6NQcv6Z59SVImV8jiPVUn
	 cpl95A0absYXAPxA9SPQCx657WwGOZMgJoe1Bj8eRjfT1I6Ll5Gwh5JQVlQ/EJ9+6J
	 Jhv8jzi+InyHmL8MyFNzzGzHfM5fMpL0124mJbWVoEjSHCVUZpSttNScbTwRY6AW0y
	 waXqwYqF/gP/W7v+hnN+xPDfHnWWnDPi+dm52P+HnDWKBQeWwtEuzsJtLDsqChkdLC
	 RLr4A/pOYTn3g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7DBE8378143B;
	Mon,  4 Mar 2024 10:14:32 +0000 (UTC)
Message-ID: <ad1b0ac6-4922-480b-a8be-dd5b8c85435f@collabora.com>
Date: Mon, 4 Mar 2024 11:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for reviewing MT2701 / MT7622 AFE clocks (audio_mrgif_pd)
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Daniel Golle <daniel@makrotopia.org>
References: <CACna6rwNdQcJQLjM25J+pTv1kNQ1y8GqPo7eAwq6ky8x-5D-BA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CACna6rwNdQcJQLjM25J+pTv1kNQ1y8GqPo7eAwq6ky8x-5D-BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101441_959352_7B4F1EBB 
X-CRM114-Status: GOOD (  12.77  )
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

Il 01/03/24 13:26, Rafał Miłecki ha scritto:
> Hi,
> 
> I wanted to ask for some help regarding AFE binding.
> 
> According to the mediatek,mt2701-audio.yaml the last AFE clock should
> be "audio_mrgif_pd" ("audio merge interface pd"). That clock is
> missing in the mt7622.dtsi.
> 
> There is no Linux driver for that AFE (or I didn't find it) so I can't
> verify if that clock is needed.
> 
> Could you verify that and ideally send a Documentation / arch PATCH
> maybe? I'd really appreciate that.
> 

I personally can't help with that as I have no docs for mt7622.

Daniel, or someone from MediaTek may be able to help though!

Cheers,
Angelo

