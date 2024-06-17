Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663ACC27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0c70uBGLZzGUKjiSENYvaapfXGLn0HST7l2Ot3Fm0I=; b=XNbqiQ3eH8cHErDTs+A08Ap2ph
	kF1maYX0CK6eZV6Kwvvp/Dwa1OPW6igX4ZZyRR2fDw0ne8DsqR3qxRg6JpCHYiASeJhaSrrMB2DX6
	Zpnjxd83nrm+m8FsUSD/3ve7n4ESweiPpWjC9D/kGfNRHbi+4v8xN484GyFg38zZi0T+1goqCl4er
	TZMVLdkt3OSa5Y4sX//mlCK8Ok2Jr2kqhSiC60cPTSj+hEoRPnazKk4qOV8C5svp0vlGIpbCtjsxy
	+USOEdzteNmafbD08vE3D2HGdi/24wd+rue0Q0nRrxaIjd1+plmM73rezDUfVU7Ym1qCLylZiMWYZ
	UJsIjoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8gX-0000000A2m5-0Hot;
	Mon, 17 Jun 2024 09:29:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8gQ-0000000A2ko-04jD;
	Mon, 17 Jun 2024 09:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01A7D61085;
	Mon, 17 Jun 2024 09:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7837C2BD10;
	Mon, 17 Jun 2024 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718616588;
	bh=at9csQjhwS6i1s/d4XG/8Zpj8DRi4xJ/ag+5eIwgDXc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=E/mPGHpMeIKgElg+Cpbw7Fc4U13Fmjr/ou+tMopM8OI/rDuDdPcOl4diV6dshwHhQ
	 3sNv1Ke/lo5tm3ytKne5KNNO2Yd/NG5GnuCLOuBIioWeNHZSFi6d0iSOde+dXx/B6j
	 3whdRSvwmZH1N2Ue9vGwp3EaecJaqm5pKb/q6LtrvJI6tJpV93fkKvzL9+vkwzp6vx
	 8L8/gSlYRXdmAFPtQ01t2G0VPY93VsyiGdmB1XI/MsoVst8nV+XnNF86IcCpni81i9
	 xHSp07ojBZM0bm9x6EbEbQmOcqic7F7aUAtsulWym9myGefvcAHF9vMNFWTPJf/CQK
	 v1oZos6Ur+BYg==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-wireless@vger.kernel.org,  Felix Fietkau <nbd@nbd.name>,  Lorenzo
 Bianconi <lorenzo@kernel.org>,  Ryder Lee <ryder.lee@mediatek.com>,
  Shayne Chen <shayne.chen@mediatek.com>,  Sean Wang
 <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  netdev@vger.kernel.org,  horms@kernel.org,  kees@kernel.org,
  kuba@kernel.org,  Bo Jiao <Bo.Jiao@mediatek.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Alexander Couzens <lynxis@fe80.eu>,  Deren Wu
 <deren.wu@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Leon Yen <leon.yen@mediatek.com>,  Quan Zhou <quan.zhou@mediatek.com>,
  Ingo Rohloff <lundril@gmx.de>,  Sujuan Chen <sujuan.chen@mediatek.com>,
  StanleyYP Wang <StanleyYP.Wang@mediatek.com>,  Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  Peter Chiu <chui-hao.chiu@mediatek.com>,
  "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
  "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,  "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: un-embedd netdev from mt76_dev
References: <20240614115317.657700-1-leitao@debian.org>
	<87cyogkkju.fsf@kernel.org> <ZnAAT/a3DKnTgUoz@gmail.com>
Date: Mon, 17 Jun 2024 12:29:42 +0300
In-Reply-To: <ZnAAT/a3DKnTgUoz@gmail.com> (Breno Leitao's message of "Mon, 17
	Jun 2024 02:22:23 -0700")
Message-ID: <874j9rlxx5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_022953_645593_275FDBC9 
X-CRM114-Status: GOOD (  18.14  )
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

Breno Leitao <leitao@debian.org> writes:

> Hello Kalle,
>
> On Mon, Jun 17, 2024 at 12:03:49PM +0300, Kalle Valo wrote:
>> Breno Leitao <leitao@debian.org> writes:
>> 
>> > Embedding net_device into structures prohibits the usage of flexible
>> > arrays in the net_device structure. For more details, see the discussion
>> > at [1].
>> >
>> > Un-embed the net_devices from struct mt76_dev by converting them
>> > into pointers, and allocating them dynamically. Use the leverage
>> > alloc_netdev_dummy() to allocate the net_device object at
>> > mt76_dma_init().
>> >
>> > The free of the device occurs at mt76_dma_cleanup().
>> >
>> > Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
>> > Signed-off-by: Breno Leitao <leitao@debian.org>
>> > ---
>> >
>> > PS: Due to the lack of hardware, this patch was not tested on a real
>> > hardware, unfortunately.
>> >
>> > PS2: this is the last driver that is still using embedded netdevices.
>> 
>> Is this patch a dependency to other patches? I'm asking because it will
>> be _slow_ to get this patch to net-next via wireless trees. If there's
>> urgency then it's much better to take it directly to net-next (of course
>> with acks from Felix and Lorenzo).
>
> Since this is the last patch for the whole flexible netdev work, I would
> prefer to have it through net-next then, so, we finish the whole work
> sooner rather than later.

Ok, even though I hate dealing with conflicts between trees I still
think it's better to get this directly to net-next. I hate "hurry up!"
emails even more ;)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

