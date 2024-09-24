Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93408CF9C71
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 06:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq1eeBVCVo8skENTGGXSVFjvxg6ebjriCPrvVo2SiL0=; b=Dwl/Q5LsGQh9Cux9Rr3AqfvDVu
	wce+f6gon/ZC1CTaiIMgPtOlhIMBqRxg62Jxr1tpBbBex63LviGBoe4qMCu2OK4dr9dpTfizN3v03
	dDGfj7pRZA+19gr92WeTelPHDAP8h0F89GZpqSO2YrSh9U0EovSg8GxmzIN/bfx7KovXX3rNrQAWX
	LYhJdrw49XN+KyuaWXv5kL6gcHKkipltBUh75IJMhpgGaDULhhSEZyf4sYxNFJq3DZ2402lTUtgqT
	rQwMSCWlI7gKX4aqkMfaPzLtKqAOH+WUoTaWyYVmkHIab+mEIbXuj1iehFbeiWLUWdpclMaM+XcH0
	xsfXSzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz4z-00000001GCA-23Nf;
	Tue, 24 Sep 2024 06:31:21 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz1V-00000001FYC-2yEt
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 06:27:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7163489149eso4171707a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727159264; x=1727764064; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq1eeBVCVo8skENTGGXSVFjvxg6ebjriCPrvVo2SiL0=;
        b=qr/G5Pim61711dJZOC+tu+wYT0nbmtehAEbzMF/Ait+6GdHVfn30BVM+iMZakfT1ZV
         HnYIO1+A2B3GjqMuYQDo6sPCnie01PfKWOb4IGO/u7N/okcQYnpeTrAM976rJsYgZAM8
         AS+ZXPf2bzC5Y3BUkH1Ay65GFeUv31ThLCnMeN2zZ1DooI0ypq4tjDN8OAsKq9Z3FzZt
         qRrz02JQ+GAisrGXWUDC/VWYF5GqZ7mci6vUMHkaXOxxHni4VZMFL0awrwutw3mo+PBK
         qaq/bMfqScMVhDgAT4OkNthbg+hqcxulv8z4hgx0c34QFOIwd7qqqrEF1Rv+EREhen7Q
         2SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727159264; x=1727764064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq1eeBVCVo8skENTGGXSVFjvxg6ebjriCPrvVo2SiL0=;
        b=lTUlazH5mmcZDlRWxb8I/8Q5LNxe8T3MsvSSTthzkCfmClI8o8EnoccmzqQ+dnNBwe
         h/b80SEXle00k9Xg/LeJuhnH546Sk6B/7NhbINVNHy+yPBFCt9kDBXiNZPfPxNW+PsMD
         0/PrMn6FxNpZDVN4LVqQfmIKUuN6755/ThFLtSWmVnZKK16n8SyGKM2HxTjbz+vPRxGS
         K17SVoEz0Vn2BqXIPKNoFtVFMb7N40s4sd70FuRkxw0q7mFHngnHQRpe8GZ4Cdlo3mok
         +zHchqTrTPrkuIfIJvihw+y9lU5pqpK5TbV2nSptWKyElwKw6NIpZjj46WXvHUGOMJzO
         v5QA==
X-Forwarded-Encrypted: i=1; AJvYcCWgEwyQt5E1aodrpCKAdbTo/zdOtK6K0TCtnaOD3WoJGyW0DABjrZkzew6/dz9G4GF3uOQJ059e2omeHDtXMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3nh3u2rFW5m6aNy3RR+JVnmn/FCmDcybSRZNrFKkUGjTw/pU
	RXS1/hqK50PXl576avwktFEPuCpndICo1Po9LBSS93O6z2jmuYeBJltBbO+ep3DJWt4shmCHmO5
	V9cFwOty8aUH71fAsFTGZQ4JwgFYtZVlQOnq1xQ==
X-Google-Smtp-Source: AGHT+IHPN9LFslQTM1gMYN4tKKonS0hsjh0tam1Zi62PvgetLTo885uAHaByvQOqprrT+VS/gMQK9GARTq8LGeXeZ6c=
X-Received: by 2002:a05:6a21:9217:b0:1cf:3461:2970 with SMTP id
 adf61e73a8af0-1d30a9bf6dfmr20527541637.41.1727159264301; Mon, 23 Sep 2024
 23:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240918111826.863596-1-linyunsheng@huawei.com>
 <20240918111826.863596-3-linyunsheng@huawei.com> <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
 <894a3c2c-22f9-45b9-a82b-de7320066b42@kernel.org> <cdfecd37-31d7-42d2-a8d8-92008285b42e@huawei.com>
 <0e8c7a7a-0e2a-42ec-adbc-b29f6a514517@kernel.org> <CAC_iWj+3JvPY2oqVOdu0T1Wt6-ukoy=dLc72u1f55yY23uOTbA@mail.gmail.com>
 <2c5ccfff-6ab4-4aea-bff6-3679ff72cc9a@huawei.com> <20240923175226.GC9634@ziepe.ca>
In-Reply-To: <20240923175226.GC9634@ziepe.ca>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 24 Sep 2024 09:27:07 +0300
Message-ID: <CAC_iWjLmWtN51eLnnuPtL5vzTBQF2v43zyoV1+AZqUmuSD1DGg@mail.gmail.com>
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, Jesper Dangaard Brouer <hawk@kernel.org>, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, liuyonglong@huawei.com, 
	fanghaiqing@huawei.com, zhangkun09@huawei.com, 
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck <alexander.duyck@gmail.com>, 
	IOMMU <iommu@lists.linux.dev>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	bpf@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_232745_773351_CF5C4C33 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Jason,

On Mon, 23 Sept 2024 at 20:52, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Sep 20, 2024 at 02:14:02PM +0800, Yunsheng Lin wrote:
>
> > I am not sure what dose the API that allows netdev to "give" struct device
> > to page_pool look like or how to implement the API yet, but the obvious way
> > to stall the calling of device_del() is to wait for the inflight
> > page to
>
> It is not device_del() you need to stall, but the remove() function of
> the device driver.
>
> Once all drivers have been unbound the DMA API can be reconfigured and
> all existing DMA mappings must be concluded before this happens,
> otherwise there will be problems.
>
> So, stalling something like unregister_netdevice() would be a better
> target - though stalling forever on driver unbind would not be
> acceptable.

TBH, I have doubts that even stalling it for small amounts of time is
going to disrupt userspace and people are going to yell at us.
I am gonna repeat myself here, but I think keeping a list of the
inflight SKBs that we need to unmap when the interface goes down, is
the most complex, but less disruptive solution

Thanks
/Ilias
>
> Jason

