Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA5CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d012RvO8FEt4oNV/hdC2ORp0abycOdoKV3NqdL6MFLw=; b=Th1SjSOMthTBS365fvxT8dlwCw
	DUQHhUL+ZuWtt/cp+R/RGgSme6snRAeSb0cJsWvEhAM6emnFmv44rfyIfHNhAHqP74Svvj2bIK0KW
	hiXEjg2FXWSTE1gZX4WJELQCLhQaTJNB3Snhq2c0BypipR8vkjJHl0FhHmTYuyWAiYmQGf5Md5Nbf
	V00WvmFMV9BhL63c9nceUJACURFnCCc00QQXf0frmyteKEUGG47VAV6WyY81W0pFoKWXnLf78NNxm
	euLUDP1APU4enZ6sHSTu+oS9kp/XBu1ZeORXhQtQmaAlgr/KwpNbzI5ywQyApmVxZm+sEPLJImthy
	JcNDU0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnFk-00000000CCt-11Sr;
	Mon, 23 Sep 2024 17:53:40 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnEb-00000000C1J-2Jb4
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 17:52:32 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-45821ebb4e6so36845041cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1727113947; x=1727718747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d012RvO8FEt4oNV/hdC2ORp0abycOdoKV3NqdL6MFLw=;
        b=lXubrfge6+t3+8cyasHROWLpNKOhfTaaSzOunMLa/2/s6loixDZ0WHJVRcGBinFSOS
         sX4o8W7aCL387GHuZlNWDJnjKEPtEeQMlp8AHzx6EANdTt5EtJaFCmm3XcJu8T8C0fUG
         wS/UQSufn3WCeUXsaXihU55u7JqhpzZfjfobgupEZ/8oQuO85FQXJ5y8HMSswYY7nxNS
         J2kOkTiSypEe3pfeCmlMp8YVaJ2fmmX2n+MdAAndBE0V27ZiXx4Hi3ZrSLZlSjGT65zY
         atojlJZ+1CCzZ9dtHncVZViUgLTK4RVkzMRbUCjr4Vms3W6AlGDWu0q4eH8uiBeIxTJr
         +7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727113947; x=1727718747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d012RvO8FEt4oNV/hdC2ORp0abycOdoKV3NqdL6MFLw=;
        b=k8CQFWERsLCpMWbyHnMlNauiBmGgcJon7MUdDiN4mmxFB0DM/5LdMfcYBNZQAMlbdA
         +IHNGsqiCxj7ma5jwk0kaap8elGQm3ZnceOiX/mHHUiWOjgFwB5hMKXaW0s7Ihj0SIeQ
         EAsrcaHf7B1TaE6Y0jwsytlXf8bbovrwBPAK/YAc0Gfos8ZtC5lfzGy6V9uQFgLA3te1
         m7gbKdlNR60zeNQfbyO+fhQ7qO+OsLej85azOC5NvHnBpUPPxCTfXQ59MbHFC/YE4kAp
         zg7z9FAUYDO5S0JKncILkqe1ZC+mqKxewGlPnRUILFYZ3OqodtSXmCTze09BZEWNSzGM
         JxLw==
X-Forwarded-Encrypted: i=1; AJvYcCWwcO+7QtXBZqYTWTiti4UpEhaPd23BozL0R8ojSVSgQrg3yqTHZWARqd/aofI/pqt5qHZt+Wk5YpiOK6H/1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfDUAq36I56oRhBL79KV7WMd2NJirY3szc/oN5v5QGlYM2x9C9
	k9y8VzGC+E0PiDOv3RIPRK3poghFU4+SDX1XI1VDaUJxjTFgeV+yz06iPcnB6gc=
X-Google-Smtp-Source: AGHT+IHVrqHIowyi3PGsNMuzErMWdcwmU1SRIkTjY6Vp086kbtdmtvbVDAGc60f4mvoOr4wDyCS+5A==
X-Received: by 2002:a05:622a:107:b0:458:35f7:3950 with SMTP id d75a77b69052e-45b226f380cmr178883201cf.17.1727113947576;
        Mon, 23 Sep 2024 10:52:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b17888cdbsm49348071cf.49.2024.09.23.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 10:52:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1ssnEY-000LlC-32;
	Mon, 23 Sep 2024 14:52:26 -0300
Date: Mon, 23 Sep 2024 14:52:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, liuyonglong@huawei.com,
	fanghaiqing@huawei.com, zhangkun09@huawei.com,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Duyck <alexander.duyck@gmail.com>,
	IOMMU <iommu@lists.linux.dev>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Eric Dumazet <edumazet@google.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
Message-ID: <20240923175226.GC9634@ziepe.ca>
References: <20240918111826.863596-1-linyunsheng@huawei.com>
 <20240918111826.863596-3-linyunsheng@huawei.com>
 <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
 <894a3c2c-22f9-45b9-a82b-de7320066b42@kernel.org>
 <cdfecd37-31d7-42d2-a8d8-92008285b42e@huawei.com>
 <0e8c7a7a-0e2a-42ec-adbc-b29f6a514517@kernel.org>
 <CAC_iWj+3JvPY2oqVOdu0T1Wt6-ukoy=dLc72u1f55yY23uOTbA@mail.gmail.com>
 <2c5ccfff-6ab4-4aea-bff6-3679ff72cc9a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c5ccfff-6ab4-4aea-bff6-3679ff72cc9a@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_105229_801943_1B0D1C33 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Sep 20, 2024 at 02:14:02PM +0800, Yunsheng Lin wrote:

> I am not sure what dose the API that allows netdev to "give" struct device
> to page_pool look like or how to implement the API yet, but the obvious way
> to stall the calling of device_del() is to wait for the inflight
> page to

It is not device_del() you need to stall, but the remove() function of
the device driver.

Once all drivers have been unbound the DMA API can be reconfigured and
all existing DMA mappings must be concluded before this happens,
otherwise there will be problems.

So, stalling something like unregister_netdevice() would be a better
target - though stalling forever on driver unbind would not be
acceptable.

Jason

