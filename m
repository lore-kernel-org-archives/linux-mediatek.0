Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C872ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbq4/4T4JjPGUfth20drkaf18DSxlzxy1kFL2s5Skkk=; b=Embs0N8Hmy43MtX9avhwaHppIE
	ozXa3kQ/xXoIa+fnAaz3dTZzu4uMLf62o+vBnrA1FRbQJv+JitH6ZcKqgBt1l/f6RxyCpohMUCgP2
	vdutnfJUQnLgug9MePwkz7V773Gst6oED0xjm9Q9bOdo5MxxHVOkYC1ww+IjqZ3E3M3Gtn5QjIIjc
	C79vWQh5Liakr8LCBdbAcMuCHuCiMH++9DJB32Z3N3Cdc5TErEX0SkntUqVPqgpjnc7BGVGa3F135
	z+Xigd/36WNkShL3L5osWwp0SdqOO3uPYcE3LyBpEujSE/1smq4lUSQUcPX9oHsvQcJ7+2eTOxbBZ
	yxQyb4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYP6r-00EYE1-2X; Wed, 14 Sep 2022 09:55:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYP1j-00EU4D-2V
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 09:49:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id k9so24859758wri.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bbq4/4T4JjPGUfth20drkaf18DSxlzxy1kFL2s5Skkk=;
        b=ExcJVlbc0ZagiH+Rt7hA0bIVbTU/NxhHDjFnmOG97vfk7AfET8oP8YY+6s84+Q+Kob
         AJ5rZVaCR4FSyyotJ+Um7fBWBWoMhnq6QmyyFF+rO62RqwDs2N4Cn46ksL+KGnpwh78j
         S9EN8XhjlqB4zz8tP/9vhz/LY6UjBPfju8CSPIQ4BAqdnZkjw88ejZd09ya3aFzcPlFx
         1+nPK7TEXW2EAEnjLYIuPT+P98eFpC+AhVnQvUCuPinG4F1UA1iUwSzMXBNZ6rOAIuA5
         rt96dfG3b4g5SHEDUERGZ840y1RY/kPx0dSau+lT3vebZafJpjfn+RBOIRHaCUGx6/1o
         JI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bbq4/4T4JjPGUfth20drkaf18DSxlzxy1kFL2s5Skkk=;
        b=X6ZyWfoTY4wPRJ5VMHOyGX1PzOY7Tg3ZQ9aGAc7WZa3XmrrfHwztHSXZ5rxMKFEFux
         xyJFPckMC6GyIwvJCG1YQIzfVVIcBbRw9OGw6rZ9CJxwctfRS2uKAzmGbawJU9QgVVdI
         S6DSd2l+IkPsr1Q7bTRtWReyxlga1YkR3l/4WIKITHfzyE9Jdt+XV40DzHl5aC92SB2O
         2BreXmjt+ZqjuDVvNKXqVnsvi5IZcDXusA0RkOJn7jfPrI5aIqjuSSaAXJTNjOLA+6rD
         u/MXkqf8iXqjVn5Vlv8vazfI/vX2YLcDR4CCiQ6qlOoWPpVoxqRbpPRC6ys1Cfhz35NX
         x2zg==
X-Gm-Message-State: ACgBeo0RoF8uXXEFsgMt75q/Hcf0b1M6C31MDRqBNfuoZZA+BEXr1Khd
	bXn6qO0WaKjXy5nBW1xanIXdSg==
X-Google-Smtp-Source: AA6agR44NE7mkRWSZbkSxz7tUVdtOhV3Q3E9t0A41MbdOWdyWfvzOmpa8UdB3Zu6U/6tZw10e5zx/A==
X-Received: by 2002:adf:e199:0:b0:228:60f6:f775 with SMTP id az25-20020adfe199000000b0022860f6f775mr20581130wrb.478.1663148987482;
        Wed, 14 Sep 2022 02:49:47 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe4cc000000b00228c8ed21c8sm13192128wrm.17.2022.09.14.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 02:49:47 -0700 (PDT)
Date: Wed, 14 Sep 2022 10:49:42 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, will@kernel.org,
	robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, agross@kernel.org,
	bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
	matthias.bgg@gmail.com, heiko@sntech.de, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	thierry.reding@gmail.com, sricharan@codeaurora.org,
	yong.wu@mediatek.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	tglx@linutronix.de, shameerali.kolothum.thodi@huawei.com,
	thunder.leizhen@huawei.com, christophe.jaillet@wanadoo.fr,
	yangyingliang@huawei.com, jon@solid-run.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 4/5] iommu: Regulate errno in ->attach_dev callback
 functions
Message-ID: <YyGjtsB2Yq4fQICS@myrica>
References: <20220913082448.31120-1-nicolinc@nvidia.com>
 <20220913082448.31120-5-nicolinc@nvidia.com>
 <YyB3F/o3RfymqiFW@myrica>
 <YyGaqsXSDMn8R12R@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyGaqsXSDMn8R12R@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_024951_279942_32218E9C 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Sep 14, 2022 at 06:11:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 13, 2022 at 01:27:03PM +0100, Jean-Philippe Brucker wrote:
> > I think in the future it will be too easy to forget about the constrained
> > return value of attach() while modifying some other part of the driver,
> > and let an external helper return EINVAL. So I'd rather not propagate ret
> > from outside of viommu_domain_attach() and finalise().
> 
> Fortunately, if -EINVAL is wrongly returned it only creates an
> inefficiency, not a functional problem. So we do not need to be
> precise here.

Ah fair. In that case the attach_dev() documentation should indicate that
EINVAL is a hint, so that callers don't rely on it (currently words "must"
and "exclusively" indicate that returning EINVAL for anything other than
device-domain incompatibility is unacceptable). The virtio-iommu
implementation may well return EINVAL from the virtio stack or from the
host response.

Thanks,
Jean

> 
> > Since we can't guarantee that APIs like virtio or ida won't ever return
> > EINVAL, we should set all return values:
> 
> I dislike this alot, it squashes all return codes to try to optimize
> an obscure failure path :(
> 
> Jason

