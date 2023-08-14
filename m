Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F1EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=637jQ8Nw98v/B8wWPqy37ozPM5D7eNmC1LOonGu/66g=; b=SsUYx0yWBCr4ii31lqbdv28Nv3
	PYa1T5dZfm/gv13C931ft3Svd+kxOyEFKTX7RB8+3wr8jQ9rZwP+gCJDOf3Z282xf6I+X8C3U4pEb
	77HyiURGN6U7vwV4PhF98erywVr8hN70tGZzhI32LsaqJMLz+AAS+LPAsAYBUVhkk3E4d0Eq2kOrP
	jdofq4VpkQN77AMkcQrJhsyCBxatGm38cy7Ool/O6wNkGTVf+qIwhoGxLjeZlZPY9x4ub+4dY+aDy
	SUrxCVjUEszn8Fa9vT+tF5aSlOm9XeLmIq1d4SdxSRGMLx9039m1uxn39mq6Yc8ZWiNSsLustmARL
	IOJgjRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTDF-00GYai-23;
	Mon, 14 Aug 2023 08:46:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVTD8-00GYZz-1E;
	Mon, 14 Aug 2023 08:46:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55A6763064;
	Mon, 14 Aug 2023 08:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9824C433C7;
	Mon, 14 Aug 2023 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692002760;
	bh=B3y8EHsDG3ckVBJqhMu+4wNcutKVET22OPIzB3BHlZ0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IAwz4csbyfvh6Sc60rY3F4KQBQhcpuI6oJ+2qyYb1X2EbPWPD3nk515LAGsCCsdua
	 /RrfgQ8LZe60yxmHXmLqV2iNhQXTZt2yJNHTUAdt5j2LnL1x91+2f5crAXVuXr7I+M
	 4yclnHX6puLJ4n3dhyx6fFlKoAJrUyCEJEOmcFpwYcb5oz6hDBAECRGUtxHoU2pTIO
	 MFGXP339tDE3ExQFau5AQwyOMqlNhNAVCuVXJbJGJti/5BtYxFL5HOtTmPoxvb3ZI5
	 /6NUgd6v072+ZFgYjyLs9xp0kxcFYsd108Ld5M+KyiFrmZ+S1cmRAt8Vy6EnHsgF6C
	 14tNDLeY82NTw==
Message-ID: <cceef8a4-6f38-bfd4-4f77-5dffa558b287@kernel.org>
Date: Mon, 14 Aug 2023 10:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: hawk@kernel.org, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "jiawenwu@trustnetic.com" <jiawenwu@trustnetic.com>, "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>, "yang.lee@linux.alibaba.com" <yang.lee@linux.alibaba.com>, "error27@gmail.com" <error27@gmail.com>, "linyunsheng@huawei.com" <linyunsheng@huawei.com>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>, "longli@microsoft.com" <longli@microsoft.com>, "shradhagupta@linux.microsoft.com" <shradhagupta@linux.microsoft.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "michael.chan@broadcom.com" <michael.chan@broadcom.com>, "richardcochran@gmail.com" <richardcochran@gmail.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>, "salil.mehta@huawei.com" <salil.mehta@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "nbd@nbd.name" <nbd@nbd.name>, "john@phrozen.org" <john@phrozen.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "Mark-MC.Lee@mediatek.com" <Mark-MC.Lee@mediatek.com>, "lorenzo@kernel.org" <lorenzo@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "saeedm@nvidia.com" <saeedm@nvidia.com>, "leon@kernel.org" <leon@kernel.org>, "gerhard@engleder-embedded.com" <gerhard@engleder-embedded.com>, "maciej.fijalkowski@intel.com" <maciej.fijalkowski@intel.com>, "alexanderduyck@fb.com" <alexanderduyck@fb.com>, "wei.fang@nxp.com" <wei.fang@nxp.com>, "shenwei.wang@nxp.com" <shenwei.wang@nxp.com>, "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>, "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "horatiu.vultur@microchip.com" <horatiu.vultur@microchip.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "simon.horman@corigine.com" <simon.horman@corigine.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, "aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "mw@semihalf.com" <mw@semihalf.com>, Sunil Kovvuri Goutham <sgoutham@marvell.com>, Geethasowjanya Akula <gakula@marvell.com>, Subbaraya Sundeep Bhatta <sbhatta@marvell.com>, Hariprasad Kelam <hkelam@marvell.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "jgross@suse.com" <jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>, "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>, "kvalo@kernel.org" <kvalo@kernel.org>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
 "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@google.com" <sdf@google.com>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>
Subject: Re: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
Content-Language: en-US
To: Ratheesh Kannoth <rkannoth@marvell.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
 <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
 <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <MWHPR1801MB1918230E007D7B2C5A768B37D317A@MWHPR1801MB1918.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_014602_532106_4EF9D078 
X-CRM114-Status: GOOD (  15.34  )
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



On 14/08/2023 10.05, Ratheesh Kannoth wrote:
>> From: Johannes Berg <johannes@sipsolutions.net>
>> Subject: [EXT] Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
>>> Please find discussion at
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_l
>>>
>> I'm not the one who's going to apply this, but honestly, I don't think that will
>> work as a commit message for such a change ...
>> Sure, link to it by all means, but also summarize it and make sense of it for
>> the commit message?
> 
> Why do you think it will not work ?. There is a long discussion about pros and cons of different approaches by
> Page pool maintainers in the discussion link.  However I  summarize it here, as commit message, it will
> Lead to some more questions by reviewers.
> 

I agree with Johannes, this commit message is too thin.

It makes sense to give a summary of the discussion, because it show us
(page_pool maintainers) what you concluded for the discussion.

Further more, you also send another patch:
  - "[PATCH net-next] page_pool: Set page pool size"
  - 
https://lore.kernel.org/all/20230809021920.913324-1-rkannoth@marvell.com/

That patch solves the issue for your driver marvell/octeontx2 and I like
than change.

Why did you conclude that PP core should also change?

--Jesper
(p.s. Cc/To list have gotten excessive with 89 recipients)




