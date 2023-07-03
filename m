Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B9FC3063F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClB7gvShhov3U8/aEH59xbQhu3Q5KIIEFTdvqCVHyt8=; b=gfgFIO4rmD5QyopXWXi5E85nUy
	Fr/2SaNPXYe9JAE2K0xOOPnS9eolpfgi31RxH1Bd82T6eDhnJU51YGwmuAlQT4WmActblHfbGQRhB
	HQNX+Wz7pZ9pkw+YElszCTMwhfgUZOhUB5BOcK/2IVFJu2X3LqfeTG+m4pJ3Mzt79WOozOO7YgEYT
	ucIWjexxLYXz3ggj1GDrJLS3uceVgngIC0SRWmpINP8+XBtfwIotpYGZsuizWjtHOg8b6yLggzfij
	/E1jN8oSDEoGbfeUUirHq02RigRFN+Gd36AeD2is6d0rFg1I0shLsyXv3GJwHiBU5sYxMUcI53Gu7
	rFsRHQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNJF-00B6RC-1z;
	Mon, 03 Jul 2023 17:25:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGNJC-00B6QE-0q;
	Mon, 03 Jul 2023 17:25:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0AA360FFC;
	Mon,  3 Jul 2023 17:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19CEC433C7;
	Mon,  3 Jul 2023 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688405152;
	bh=rYNHyEKxVBivZJaI/Nsw/8pEmEkG38XoEZOgA3+Gx5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HRhH09xDcmyQdwdg+w9B4k0qFdh5qm8B20+2qPbVM/j6cBNpwATBWA29920ipsdqB
	 F7J6ZGI3CQDbI6idwFIgjtEfSilmVr17LolUgwKXZ4iVZtE/opYl7ICfUIT8st5Hiv
	 UxbpHaA7dWmEdwwciJmm+4gyUYba6rSUEZSepH3nxzXch2fsPbVSzaYGe0r4rI5wGM
	 Ym039RUrohqsYMxJCMpB3liziGDbDIggIi4ViVYy8fZk//93aQZ1c2OmH4npo4biPW
	 Z139jMJ6PzTzBE2Rk/CxIz4mMINsMFtO1wKBzZeV7eNjfUppPND0kRaiNMIHRjo8Sy
	 N44lUtKIfK3tQ==
Message-ID: <31db0e5d-4b6d-9b2e-90cc-87a15d500b2e@kernel.org>
Date: Mon, 3 Jul 2023 11:25:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
Cc: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, Yisen Zhuang
 <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan Lemon <jonathan.lemon@gmail.com>
References: <20230612130256.4572-1-linyunsheng@huawei.com>
 <20230612130256.4572-5-linyunsheng@huawei.com>
 <20230614101954.30112d6e@kernel.org>
 <8c544cd9-00a3-2f17-bd04-13ca99136750@huawei.com>
 <20230615095100.35c5eb10@kernel.org>
 <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com>
 <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com>
 <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com>
 <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <47b79e77-461b-8fe9-41fb-b69a6b205ef2@kernel.org>
 <CANn89iJLAnnvFfkmJbQ=ZFMwaqiYDOTD3-P+NpkEMzP9aKV-ig@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CANn89iJLAnnvFfkmJbQ=ZFMwaqiYDOTD3-P+NpkEMzP9aKV-ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_102554_380326_B8474DE2 
X-CRM114-Status: GOOD (  10.15  )
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

On 7/3/23 11:15 AM, Eric Dumazet wrote:
> On Mon, Jul 3, 2023 at 4:45 PM David Ahern <dsahern@kernel.org> wrote:
> 
>> That is my expectation. The tcpdump is just an easy example of accessing
>> the skb page frags. skb_copy_and_csum_bits used by icmp is another
>> example that can walk frags wanting access to device memory. You did not
>> cause a panic or trip a WARN_ON for example with the tcpdump?
>>
> 
> ICMP packets do not land on the queues having devmem buffers, for
> obvious reasons.

I was not referring to ICMP packets coming in to the nic, but rather an
icmp getting triggered during stack processing.

> 
> Only chosen TCP flows are steered to these queues.

of course.

