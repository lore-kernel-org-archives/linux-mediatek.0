Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1778C3DA61
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPjn/dejE5xKUA2vRpLLsjcMdjSmG2kubF7cYuzThJ0=; b=DoU7eDe+jV8AiRXkRW+ryO3Ozs
	ae09P3jkgIHYpv463cqEmDNb9wML5orAMZCZMzMtNFqRE044Y5rd9OPdFa0G+3X8c2ZphahUwPU4x
	Us9UygafskRYD4OOibQnwV+EiHlNZBZetcy6P+/uwLGG7uMD8iyA7CPFmUSzUHRftq01nunceulHp
	W7QvbXAbsS+IwnVaQGvOy3710lDvG5dknIlfsEVpBKq9UOH78AW0O+JpI2tW7fk4NcDtIgdbN2Szl
	7pbpDVY5fUAFhivvGmt4c61+wsvpOgkyKUMn98ln7cjIRYlKvfxHa1Zs5C1ds9UYldjNiSfcKHJiN
	y/MDd9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWb3A-0000000FJ1k-2k42;
	Wed, 24 Jul 2024 12:24:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWb36-0000000FJ1A-44Xn
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 12:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721823889;
	bh=UVD2Yt3dsJrWL4IWAIKjqj8rXsBGJy+fgtZcpJxMWUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlU/Gld0klFYbgCRKZsWCRxzEGnD4J8kp8ZMSRl7eyb/4tUDymd233JP2YzxDCzK+
	 SZnJChXHYClbUzoQ6RJUKbRx1XliJU0FLjXM4+LSD8fZS5abF18bvsepPYjeMXz5vK
	 wTPEinZR6KZFBWwXGaxpSM1VxbChJ8Aa6MTNzOxYJ0fOQRhcmFRE0g+hW+g6t5aVzK
	 chtHhK664Bt30eKMU0OrxNtAhp0wrEPb6es+sc2NEJWkswcpT7sLJmI5/4wCEFuEyJ
	 WmV+PnyDmk8Yn6VCrdCmTFcB6xyvFqUsVfTRraFkY93fP5pOPq2lS6vt4FhsFUBE1N
	 3aonblASpSaeQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E73093781144;
	Wed, 24 Jul 2024 12:24:47 +0000 (UTC)
Date: Wed, 24 Jul 2024 08:24:45 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org,
	hailong.fan@mediatek.com,
	Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Wojciech Macek <wmacek@google.com>
Subject: Re: [PATCH] mediatek: Update mt8195 SOF firmware and sof-tplg
Message-ID: <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
References: <20240719022132.30990-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240719022132.30990-1-xiangzhi.tang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_052453_337649_B6A1EE67 
X-CRM114-Status: GOOD (  14.49  )
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

On Fri, Jul 19, 2024 at 10:21:32AM +0800, Xiangzhi Tang wrote:
> Update SOF version: sof/sof-mt8195.ri
> Release version: v0.4.2
> Remove sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>
> ---
>  WHENCE                                        |   3 +--
>  .../sof-mt8195-mt6359-rt1019-rt5682-dts.tplg  | Bin 20895 -> 0 bytes

Hi,

the firmware file you're removing here is used by the MT8195 Tomato machine:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/sof/mediatek/mt8195/mt8195.c?id=786c8248dbd33a5a7a07f7c6e55a7bfc68d2ca48#n575

So with the latest kernel and linux-firmware, Tomato doesn't have working sound.
I see there has been a patch a few months ago to change the topology used on
Tomato, but it hasn't been merged nor followed up:
https://lore.kernel.org/all/20240318183004.3976923-1-cujomalainey@chromium.org/#t

If the non-dts topology does indeed work for Tomato, I assume we'll see an
update to the patch updating the topology for tomato very soon to restore
functionality?

Thanks,
Nícolas

>  mediatek/sof/sof-mt8195.ri                    | Bin 173832 -> 100740 bytes
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  delete mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg

