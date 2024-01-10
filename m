Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772BFC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM8oZRc7HGJQhFnnq2fjFzzX1PFqmCpd+99bkrv31tc=; b=11RiIo6tbnxncI1kuXbUIyG1zg
	gpJ6tglPdCru53CFU2t494yxlLusHEaULZle4mlHeOgc9OVkG+EC7YeX7oqT5ojbX1MV9RrO2nnnX
	UNMtOAA46SQCXw8oiHE+Jd0LRzSEV6jGAFbEUJBuNK/XF0MWVaIfahg/ZNffzG7OGC6A/YBrZblnS
	Mg/gCzhY3EhJrETMldhT9HzOvCl6RPNEr0n88sW9GjqvTtzCF93rUE0XPoQnYO/Yrdx8kGQFOsPJZ
	k/NNsDGt3+aHVP/TXphIVl27p+DuIaVPRsuZZco4uOBnZql44TlxU4JvvGxdzROojxoEAE3NPXDVH
	N0d5NIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVCy-00AvLS-1d;
	Wed, 10 Jan 2024 09:49:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVCv-00AvKZ-2K
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 09:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 966F761689;
	Wed, 10 Jan 2024 09:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D48C433F1;
	Wed, 10 Jan 2024 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704880148;
	bh=u4/mRWQFGYRhFE1WCHb571aho0C+PEsnid9U4Zq+ys8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mDhxxxTpY+pBz0/ETS0o53OssdStzHXes1XziXHhqEDtVGk/PM9lDpUUx38l5n1s+
	 G/z06jdNjC6Ugg6iDpG51+2qqMB4XN/EFNhZTM7vu7EuuEA2EY8lCrLsNOEuiCHd6t
	 ysf07vfcgMVs4qszaLdcIune0rkKXystda2hl84YGSJeRULCnmO863bKO2VfaTm8Tn
	 IrqVbDylOjM6ZBG6D7AsqH65xEv4iFEmPpOjDGFmIK/F/WHtY01jrYNCSQ6mS+6qzc
	 cG0nSpr5XgUelgYpaf2ivt9Q9u11QhqfBDynnqXh7tJoZ0cEa0duNuvvmRpJACsE+8
	 0zTSJka7hrcOA==
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
Subject: Re: [PATCH v2] wifi: mt76: mt7925: fix the wrong data type for scan
 command
References: <20240104113206.13252-1-mingyen.hsieh@mediatek.com>
Date: Wed, 10 Jan 2024 11:49:03 +0200
In-Reply-To: <20240104113206.13252-1-mingyen.hsieh@mediatek.com> (Mingyen
	Hsieh's message of "Thu, 4 Jan 2024 19:32:06 +0800")
Message-ID: <87y1cxy0vk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_014909_818228_6BB73605 
X-CRM114-Status: UNSURE (   7.63  )
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

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> For the member of 'struct scan_req_tlv', replace data type of
> func_mask_ext from 'u8' to '__le32'.
>
> Change-Id: Ib9fc1aadd1f1960b63d35f31f0a4655416884bf0
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

We don't use Change-Id tags in kernel.org.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

