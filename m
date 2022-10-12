Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3296C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7528efRqLyTgmWQDpcADWEjW1dGUkWsLB432zRR4kf4=; b=iW4OFEJuSzHrE73waiOBGOtuuC
	+nt0ZuWM9cJRwsOjtJno6hdegMJ1lDuHYT6feR29mbACXIo79gRusVXzbwZhUVtx5cTEVDWHYe0jc
	ziYBA8G+n7ej7L3r0Di6ukZx93SWCs3IVLgnEzVfkpbhsarcnSW0ZFi53u44aHFuAKiI/aJ7kkoBB
	tirxcjtLTIdXJ3HwbZ/gZiZKSlG7XFCPfB/6+ewXXo3HihRJOzLTlKfpbumrnmL7AZg2J0QDhXsaF
	9omkhRyc9cNoiXJc+eONxWa4jrEjPM4Kj4LE+6Io7g8uw/oYhOBV9BeQGyeiwuioCf64Y7KuQwR2i
	Vd2aRpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUaA-006tWO-1a; Wed, 12 Oct 2022 05:47:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiUa7-006tVq-9d
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 05:47:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF4C2B818F7;
	Wed, 12 Oct 2022 05:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C021C433C1;
	Wed, 12 Oct 2022 05:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665553620;
	bh=8jHj2mA5t2FOoahzh6jv0QBWos/VpumnAgdAN0iBecM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aJhe1slpXGllOxiah/e7qiNCdbGRmvmrtCuymgH9SxlfkDM44AvBKJX/StrHA+Ypf
	 6V1ZbHhFRMONx+NWfR+w9ZotmGRiRPAbZPV5E3axb6OVV3vYoVLgFnVJtrdlTllXwv
	 HdQCqULSy4cmJvuLHBEtq7jWd8ZbGQOAIViigtUVQXsF93IKb+s/6K6IDXN4AlnaTZ
	 N3r8ObGelu5NuF4MfXyuTf45cpbqs7395kgb+H57srLD1IoNDebPjyOB7eYIm50AmO
	 3/IJijsY3oluXqOCCB6gZYeDBp5N/+8nu9Hp4dSkmBJKX5IvHG8gAWRB0r3w7U6DsV
	 ApBGP3NvtJYPA==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo.bianconi@redhat.com>,  <Soul.Huang@mediatek.com>,  <YN.Chen@mediatek.com>,  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,  <Deren.Wu@mediatek.com>,  <km.lin@mediatek.com>,  <jenhao.yang@mediatek.com>,  <robin.chiu@mediatek.com>,  <Eddie.Chen@mediatek.com>,  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,  <ted.huang@mediatek.com>,  <Stella.Chang@mediatek.com>,  <Tom.Chou@mediatek.com>,  <steve.lee@mediatek.com>,  <jsiuda@google.com>,  <frankgor@google.com>,  <kuabhs@google.com>,  <druth@google.com>,  <abhishekpandit@google.com>,  <shawnku@google.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/7] wifi: mt76: connac: add mt76_connac_mcu_uni_set_chctx
References: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
Date: Wed, 12 Oct 2022 08:46:54 +0300
In-Reply-To: <8d784dba38cfb2183af2e4d9fc822a27ef34dcd2.1665533390.git.objelf@gmail.com>
	(sean wang's message of "Wed, 12 Oct 2022 08:16:15 +0800")
Message-ID: <87mta14mr5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_224703_511672_61E98A91 
X-CRM114-Status: UNSURE (   9.01  )
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

<sean.wang@mediatek.com> writes:

> From: Sean Wang <sean.wang@mediatek.com>
>
> add mt76_connac_mcu_uni_set_chctx to set up the channel context per BSS
> in the firmware
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

BTW a cover letter, with an overview what the patchset does, would be
nice. But no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

