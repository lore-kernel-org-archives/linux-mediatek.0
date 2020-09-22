Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E334FC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:15:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99A91206B5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 23:15:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NP6rv4rf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99A91206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lQpueSq8swfbopvq1JrElQI7xfNSHojmfkvpBv6iCs8=; b=NP6rv4rfZSfc/HyFMCJFdgKT+
	RnbIFLV7j/yWJ0QtpkDWBqcoZ+fpQxcmeWfZ0eYCLH9Latl0fAaY1IfFT/7UoUM/sn3SB0f+ZBEmJ
	8NOY/6FfowpvAPqWGKihtQyLYNJSxnYPSL4LqtywtXeJ5u9ErdQcle/ROCsVavSDju//Pg1mn2iiG
	+htV6aN9sWE6XKVPpeWKQx+CH4Zwi5ZNIk4sBfpO6wnY3BmP53c3BibWM1zF4hW88se3FY3dFDNte
	akCTcl1kInSKPOkp3NBTrM0YyJyjsTeqwt3OPiVqwpfiL0tN/ZnQhtOftGndz99IaXGAVa2tVCO6N
	k1EuWy5cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKrVe-0003If-Bv; Tue, 22 Sep 2020 23:15:42 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKrVc-0003HU-4w
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 23:15:40 +0000
Received: by mail-io1-f67.google.com with SMTP id y74so21572469iof.12
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2020 16:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZTLIhHd8Y4Tf85s++I6uYziuQx8fHfBB7VVFQZPiv8M=;
 b=PjqBwDAOKaWG/QlPzgKQLCf2648ZPWYltrXpnOGB4LVe7Vfq56LG/C4KPQ+KxkMLm2
 uBuSGNmoyj0mUeZi9xrt89K6SP6u2o5bzFzIdh+QurzKL9r18qmik7iFRFlVYc4l1yfB
 WojJPXbpdnIt70zSp/ewoV+qHa7XNJCMNBsF0wsoLoD1Vk/F8eZApQ8sZSRAc5jxuKhV
 qzK+5BRnA6TDj8Ci/22ZTW7h5Xv8uW2+AFH/nscDnWQbxuPx64Efui4VuGKlo4H9JJvl
 QX7dhAXYrFERRbx/0KSH8q3sIysxL/19c6CDaQ2sEfbATVszfbqGhPSGJFRCukxBmExa
 XcFw==
X-Gm-Message-State: AOAM532Pmoy6MGxoKjfrgJhcWKoTglMdHgvpsLhTNIpcSTIbfIxPFwru
 b7HAdPiDkt4O4lnWi4hahQ==
X-Google-Smtp-Source: ABdhPJzhMLLx9e+HC1HqP5l/rc8bjuTK0s+ZE/buMcP93jRhpbAxNu4jYCqiuMQe9xq7prq/rR0USg==
X-Received: by 2002:a02:cdc5:: with SMTP id m5mr5911696jap.15.1600816539384;
 Tue, 22 Sep 2020 16:15:39 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id w13sm8041599iox.10.2020.09.22.16.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 16:15:38 -0700 (PDT)
Received: (nullmailer pid 3448302 invoked by uid 1000);
 Tue, 22 Sep 2020 23:15:36 -0000
Date: Tue, 22 Sep 2020 17:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: ufs-mediatek: Add mt8192-ufshci
 compatible string
Message-ID: <20200922231536.GA3448246@bogus>
References: <20200914050052.3974-1-stanley.chu@mediatek.com>
 <20200914050052.3974-3-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914050052.3974-3-stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_191540_213204_55DBBC29 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 vivek.gautam@codeaurora.org, linux-scsi@vger.kernel.org, kishon@ti.com,
 liwei213@huawei.com, arvin.wang@mediatek.com, chunfeng.yun@mediatek.com,
 yingjoe.chen@mediatek.com, peter.wang@mediatek.com, devicetree@vger.kernel.org,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 henryc.chen@mediatek.com, avri.altman@wdc.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, martin.petersen@oracle.com,
 kuohong.wang@mediatek.com, pedrom.sousa@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 14 Sep 2020 13:00:52 +0800, Stanley Chu wrote:
> Add "mediatek,mt8192-ufshci" compatible string to for MediaTek
> UFS host controller present on MT8192 chipsets.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/ufs/ufs-mediatek.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
