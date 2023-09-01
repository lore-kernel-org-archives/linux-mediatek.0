Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A8FCA0FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amJAeX0PF3D/+bGob3MIiFTCYx62mY0LwN6gAlQs6Nw=; b=I/Dyk9PJLh/MePNvYWvwMa043X
	HRs/qs9V0K/bbBsM3gih2uJpeYbPTwnwfm/HdVeBQZepeWx+DTQe4NwCFgZQNZg7xl7KI8LyjW+5I
	9ECJTMtjaVx9SamVf0Hm/psCrvjANDctryfiC9hT3irnmdGeLOCgKmt02HuSGGCHRGgMvvWicymH/
	poT8kfkCwiSxlvIni2CE7W8N+WAoXy3Z6ta7LFJblBsGaLDTr+d8zmGmvI4I/3IOYzXq4QjpQQHXz
	0CyYdc6C6RxYrFlSNCyBHzHu/8hJlN4KPNy3UGS/5/8oUyRAtP01nd8965cC7g83Xg8Od1S20NvPT
	3jUD8veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0xR-00GnU7-0e;
	Fri, 01 Sep 2023 10:00:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0xN-00GnT6-2x;
	Fri, 01 Sep 2023 10:00:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EA7B61275;
	Fri,  1 Sep 2023 10:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F05C433C7;
	Fri,  1 Sep 2023 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693562448;
	bh=BTGDfJTyzKP6h40J0iVNdbrEIIzNDkliCuw7WPVkb5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GjYcGy6rAAbtGbUDR7I52WYpGsvlouX3287Du4qRwGUtujJgItXyVUo03LxnQi5Fy
	 Hd2Y+78vjEwmV1kfQo4tbP/DEj+oFrfkM9Js/D/TKV/ezUgJt9x1ohGcEapPhhZVp5
	 ODKBGcYciLlfghU7NbDW7CAHkYWxuCf3pZNrp/aeuwQoUmcjtjLh8UY6SOhiEl7+ov
	 6dNuWjUyIhd2Mcu2Jl7e5We96gXmWiuO0lUKnuO3zoj240I7dAN/Z9WfbRGwrwFIbn
	 xgXP4Ga0NTOQtJngynxVK/rne/2C5StagKXXmHDvLURH0oC8VpzLZFi7t1rIfIKOj+
	 5/v5jlnl69P5A==
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 12:00:43 +0200
From: Michael Walle <mwalle@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 angelogioacchino.delregno@collabora.com, airlied@gmail.com,
 amergnat@baylibre.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
In-Reply-To: <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org>
 <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
Message-ID: <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_030049_997128_F1460B87 
X-CRM114-Status: GOOD (  14.19  )
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

Hi,

>> I was just curious if you know of any development for that (or 
>> similar)
>> in the kernel.
> 
> This is probably because support for this SoC began with Chromebooks,
> which have fixed and defined uses for the pipelines. I suspect that
> what you are working on is much more flexible.

Yes. that is correct.

> The driver should be made to allow dynamic selection of outputs, as
> is commonly seen with other drivers, but I don't know if that's on
> anyone's TODO list.

Do you have any pointers where to look at?

-michael

