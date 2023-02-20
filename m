Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4B3C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SduiDOmDaa/CpvCGXGhdJnlhddEXL9liaYZbEyV9zm0=; b=js3R5tZpaRQMCo5Y8ancofnYUY
	TIJIqDnBWMZWeVZ8FxNTeOGLxPFfu1emwYXx2KIIpSMnfeUkXsur8it4E85AezojgM0QJco50R0P6
	maY7h7LeuBTao+Yzacw2DlEoPhV4IpsPULxPXJWzYTGBiC2avk9jXfx5BaIYPv4lu1BGR8qN02rlU
	d8MnMd0TL3FUVrbwBsqHXz9q72Ccrr4KbxY4ZbZfo29Zgl08uS9dGRYTmgxXFjeqNlY9Ze9Xh4EDh
	LUmIvWxXk6o9Z2l69Pn2ooG+CZGNuqU318s2MmzweCOxCWRZFroE8UYSCKY+TzYUy/RNiMbLpXKCp
	rSYtSQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2qD-003YYO-9W; Mon, 20 Feb 2023 09:52:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2q9-003YXB-TF
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 09:52:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F5BEB80B30;
	Mon, 20 Feb 2023 09:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD77C433D2;
	Mon, 20 Feb 2023 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676886726;
	bh=kRufBzngI+V7eIAi9Js4QnJARPazNYOkzWxa19IWQAw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LyNLpxVEbbFOKQgJ3s0+BNGmUDG7cIJe+6xnhPZp0NPdCuzKGz9AjTvdN2m0MYT5Q
	 1PRv0H5Xtqn/xhFh9B5gvQNVFoZAG6t/wfUEjf9Hc8RfRYqZDZ2FR/JOf++ULa4sDc
	 q/PDVY53K5R/yVpBVzL+cVw7ybRnBXyZKO1BIpNWVihlKi1Brj/iqkw3vOQjFnRvHd
	 MB9tit65TnOcYzwu7eZnBFfaA0PmmvfVBEpB9Ocmcq0hVsfJYNudHJa6151eLfteUq
	 HiJaVBv5k123goh6y0IFB2lY9gnmhIj+r1XQ7Cwg8Uo5KUXm2N0kF9VbKgFsZDgSHi
	 oDqDKx6suCS5w==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: fix radiotap bitfield
References: <c5289bc85b268fca577420fae74cc4f06b544798.1676623066.git.ryder.lee@mediatek.com>
Date: Mon, 20 Feb 2023 11:51:58 +0200
In-Reply-To: <c5289bc85b268fca577420fae74cc4f06b544798.1676623066.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Sat, 18 Feb 2023 01:46:54 +0800")
Message-ID: <871qmk4qbl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_015210_237587_9A7F6762 
X-CRM114-Status: UNSURE (   7.95  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> The 11be generation's radiotap bitfields were wrongly copy-and-pasted
> from 11ax driver, so fix them accordingly.
>
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> change since v2 - revise commit message.

Thanks, much better now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

