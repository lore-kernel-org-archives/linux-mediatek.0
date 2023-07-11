Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486CFEB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csq2hP6IGrsJizVBuDWOWzciwuvySb83mfb1bAUQeAw=; b=KD/S9JWfhuIHwfOa9YlNWpszpS
	fVsBSyrG/w6kLM3Ts56UzNXzqhr7LGKMVaJ2JJxQlUFUtJ1XEerP2hSEiBjC1UrexOErbXMKzgIuJ
	+AQs/WbcPCCwqVwjzZeVO4FgwvqwYN+Gu5C+MW+9V17dCCZQKHnklUmECNGiJc0pFNR9FQ0xFv8tF
	xLNBRf7PuZfNnSIy4tsXcA2I0VhjxCGEIUJQMab5j5hMLIxVzU2hXebf4s+6QtjKiuCv8ykUK2dAz
	AJbwTVfj3X+UMTSmMVEt/voH/e+3iZlkc1hzFBIPE5qWxrotbSC9oRYh0LPoz0kvZomPUrUfDQ3iD
	+BgaUm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJITf-00Fgje-1H;
	Tue, 11 Jul 2023 18:52:47 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJITa-00FgiB-2V
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 18:52:45 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-76571dae5feso578513285a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jul 2023 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689101559; x=1691693559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csq2hP6IGrsJizVBuDWOWzciwuvySb83mfb1bAUQeAw=;
        b=O6yj1kfBmt/f46fGl5YF3ZVJn3iClEXfkHrq1NBwzA3zeFlPKxh61DLstld0JhkzXq
         h9GCIk46LJKP5FEMhlmgxGdR6DZHqGE8zkEPe0m8HwO3oYCvuIT+h216JZzEKzRT45VH
         fihme1JeEVJ5o7rLj+sp0HM+VyiPgOa+4UWUCJ8nczCJMAvSl0mDXfZE65/pQiDQgR46
         KXQ8MO1UkrrB/BNF3dM4Tr7JLFvYzyjqwWXAqiIjG0pmZzaxZyvvqaOWcuYKyh4LOvP4
         IvsRAbNbBcQCuYjr3QJF3eqkPZPCTeLSQBqYAlk4Rf6atATMuVoe1YiRvI7PbrsyIUPo
         WEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689101559; x=1691693559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csq2hP6IGrsJizVBuDWOWzciwuvySb83mfb1bAUQeAw=;
        b=J5DYt2DmzCAZ74P/qERc1FNBCLJN9geeFYVSaGDeVhc7kGN2K1cO43zHmsyFzMPjG/
         7/mGD1kl7MJd71JP7Uv9PVjnl3pkiVsV3/05rYu4VA7UMdOmCw0GgEj7DiKsliN1gP+Z
         2PXX3UaomInpbXkEuConM2c+oFzoFs0IYn/7wTFGg4oLeX2lkbMq1HVQ3wOd5R8D9wMd
         NEpmE+I4eQlf8t1Ii5f3NP1kipjia6kQ5b2YcoI8kCU2tqvM4GsmJYLUe8GqI9gy9qUY
         cFHRZuPO+r/SArSfrJnsifxBFotyfce0KO3dZlqEj7muxT4A5L4nqIXN5w8vQuaStvQg
         ZaEA==
X-Gm-Message-State: ABy/qLZfPISpRp4O1Iy6YEVACnWY92eXL/Wn4XQz7O0aayClql/x4vhn
	u9DRx0jbOHq5jHhydvRhhgZ13Q==
X-Google-Smtp-Source: APBJJlGz3e2wm1ItETv6Tpn24AKM42/GznMyImhnBUCl/FD/+Lt6lzms0CFX41BO0AXGLY19Tbl9Zw==
X-Received: by 2002:a05:620a:2904:b0:75d:5640:22e7 with SMTP id m4-20020a05620a290400b0075d564022e7mr22796538qkp.55.1689101558954;
        Tue, 11 Jul 2023 11:52:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a146300b00765ab6d3e81sm1269520qkl.122.2023.07.11.11.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:52:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qJITV-000JMj-F8;
	Tue, 11 Jul 2023 15:52:37 -0300
Date: Tue, 11 Jul 2023 15:52:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mina Almasry <almasrymina@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Eric Dumazet <edumazet@google.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jonathan Lemon <jonathan.lemon@gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <ZK2k9YQiXTtcGhp0@ziepe.ca>
References: <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca>
 <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org>
 <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
 <ZK2Gh2qGxlpZexCM@ziepe.ca>
 <20230711100636.63b0a88a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711100636.63b0a88a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_115243_189254_76F8ADA5 
X-CRM114-Status: GOOD (  14.55  )
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

On Tue, Jul 11, 2023 at 10:06:36AM -0700, Jakub Kicinski wrote:

> Now we're getting into our favorite argument and completely
> sidetracking the conversation, aren't we? :) And as usual 
> our ability to present facts is limited by various NDAs..

Yes, well, maybe I should stop taking the bait everytime you write
"proprietary" :)
 
> > We also have the roce support in the switch from all major
> > switch vendors.
> 
> By which you mean all major switch vendors should support basic RoCE
> requirements. But most vendors will try to put special features into
> their switches trying to make the full NIC + switch solution as sticky
> as possible.

Yep. At the high end open standards based ethernet has also notably
"failed" as well. Every switch vendor now offers their own proprietary
ecosystem on a whole bunch of different axis. They all present
"ethernet" toward the host but the host often needs to work in a
special way to really take full advantage of the proprietary fabric
behaviors.

> Last I checked every generation of HW from even a single vendor came out
> with a new congestion control algorithm and add-ons. 

Probably, but I don't really view this as an IB or roce issue.

Back in the day, there was "data center ethernet" which was a
standardization effort to try and tame some of these problems. roce
was imagined as an important workload over DCE, but the effort was
ethernet focused and generic. Sadly DCE and successor standard based
congestion mangement approaches did not work, or were "standardized"
in a way that had a big hole that needed to be filled with proprietary
algorithms. Eventualy the interest in standardization seems to have
waned and several of the big network operators seem to be valuing
their unique congestion management as a proprietary element. From a
vendor perspective this is has turned into an interop train
wreck. Sigh.

roce is just highly sensitive to loss - which is managed in ethernet
through congestion management. This is why you see roce and congestion
management so tightly linked, and perhaps in some deployments becomes
the motivating reason to look at congestion management.

However, TCP under congestion management is also very interesting and
is a motivation to deploy congestion management in its own right in
some cases.

Jason

