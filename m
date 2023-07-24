Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE4C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvqRTgPMkZyyUJ/eYLri/dywvbqF1gq/yURWmZL7/6A=; b=L6ZAnoot2uukKYKRO5wMqvJovP
	YTPmx62fFRVxt6Fhci9KL08ru12fRk9QFFR9YqG4I2tbVPvTET3EU9L0Asw6MSq+t5Kgkm6lI+Hdp
	mpTNZzYogTDH98AIeJ7NDwvt35Mg+IhLwyzdFtjvUUl+DJFRfZLfwN8MYsfLjgieCklfilgzx/6z4
	W/ENwZ+gmBhHYhiE2H+4oMtub/8NAU+xwtVNqOxqYN8z8YtCQfpVctInMB6cYwlKxu+/n8VKxabZo
	mIG0WJBmej8r7Rb6e7gAxu62/+GhM65HwiZucVERe2m7dBnvPlaZf/RIpdjkicVAe3FSWY9PeOB/S
	jVrk/LTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyQl-004sgH-2I;
	Mon, 24 Jul 2023 16:29:07 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyQi-004sfL-2C
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 16:29:06 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-63cfd6e3835so7242356d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1690216142; x=1690820942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvqRTgPMkZyyUJ/eYLri/dywvbqF1gq/yURWmZL7/6A=;
        b=JTxlLwpY4B+RxCOA0IT7t0KJtuxqOdUcLBueZqYEwWOGw9vBGNalO2vfSLeha3sDww
         n23Q2fVF4XLsfCIJ7N2XehDqaKBLbFDRIYGVwcF+/T7FO8WCJIaZAFVHoCu1+ADDppdF
         J9P/yTyeIu5AmCy7TmwinJWEhwXoPIvY6iS4xyJbx11IBdrOHgxK1FhlslIywkd4rYkp
         okaSM9B557rsg+oZkzb0HeYzVvEpn2XAqbqS5qz2+aMG/7oTJ1rGBYMonxeaOuyrzZNF
         ondYg2tvzr8bwYJY2FCAZSKUQnd5qWVtvwL/Mlli9wvr3A4647ZiN6lPyW1GLHxw+hpU
         9CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690216142; x=1690820942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvqRTgPMkZyyUJ/eYLri/dywvbqF1gq/yURWmZL7/6A=;
        b=QxgcD7i7TqdhDGkuLAUiS7zDKIqpZsnjbF0cxwFNApzSMLtK+RcugRWejosQUO2qWj
         2Nw4XTi2uW2D1qJLD9ZanbF4jy7Co27wb6eohvey9PQvbrHcgXZhox6jyAE4HJlQ8XSG
         Q+Fz6V8sSpIcyGgp19fAReP62Lf+T5CIycRxhTiu4YFp0t4byr08eCrCznyxaYUZ+wT9
         YJpewtKj4ftS0x/oBU+t55hIEIHmbpXdT689EH8UbMDqKO6O9H8ZcthJhnkoDLy5jrgm
         tnQva2aiv0RVT9xtuShrj2E1Ey+SxJv88EAmjO/2s57FGbRJhiRw5v7daZ3gNLWk6fcU
         OF6w==
X-Gm-Message-State: ABy/qLaTY78AXrxLOahZZIB0SUsUsUyl+8a1Ngs7AioQ1cn1vKhfWj+4
	AdvJLVxcDP9Bl3uR2R7tdR+0aw==
X-Google-Smtp-Source: APBJJlEqioDGur2hWJN/oBxGPx39JbASLwLrWEnz70ekshKDJ87a6G6epx0cyhvpPQhxk2uV+XsBHg==
X-Received: by 2002:a0c:de0a:0:b0:63c:ee13:5adb with SMTP id t10-20020a0cde0a000000b0063cee135adbmr268559qvk.47.1690216141736;
        Mon, 24 Jul 2023 09:29:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id r12-20020a0ccc0c000000b0063003786840sm3659258qvk.99.2023.07.24.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:29:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qNyQd-000K2X-UT;
	Mon, 24 Jul 2023 13:28:59 -0300
Date: Mon, 24 Jul 2023 13:28:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>, brouer@redhat.com,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Hari Ramakrishnan <rharix@google.com>,
	David Ahern <dsahern@kernel.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
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
	Jonathan Lemon <jonathan.lemon@gmail.com>, logang@deltatee.com,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Message-ID: <ZL6my550xedf/L0Z@ziepe.ca>
References: <20230711133915.03482fdc@kernel.org>
 <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <ZK6kOBl4EgyYPtaD@ziepe.ca>
 <CAHS8izNuda2DXKTFAov64F7J2_BbMPaqJg1NuMpWpqGA20+S_Q@mail.gmail.com>
 <143a7ca4-e695-db98-9488-84cf8b78cf86@amd.com>
 <CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com>
 <ZLFv2PIgdeH8gKmh@ziepe.ca>
 <CAHS8izNMB-H3w0CE9kj6hT5q_F6_XJy_X_HtZwmisOEDhp31yg@mail.gmail.com>
 <a2569132-393e-0149-f76c-f6de282e1c96@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2569132-393e-0149-f76c-f6de282e1c96@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_092904_884576_47BC1653 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, Jul 24, 2023 at 04:56:27PM +0200, Jesper Dangaard Brouer wrote:

> These massive throughput numbers are important, because they *exceed*
> the physical host RAM/DIMM memory speeds.

That's right, this HW is all designed to use the high memory bandwidth
of the parallel GPUs. The CPU must not be involved in the data
movement.

If you look at the reference block diagrams for a DGX-H100 you can see
that the each GPU is directly wired to a 400Gb/s NIC, and there is
even software that allows the GPU to directly operate its attached
NIC interface.

Each of the 8 GPUs in the block diagram has 800 Gb/s full duplex RDMA,
and 7200 Gb/sec full duplex on the nvlink interconnect directly
connected to it.

The GPU is the center of all the interconnect in these systems.

Jason

