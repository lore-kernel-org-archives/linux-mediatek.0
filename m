Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94676C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499CA61268
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 499CA61268
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tp8cgsxfCeNoEoCR08bF4bzO4z0VP8K/Wnbh4eNq99I=; b=AtU5I1R0vZgoUp
	gyHHreOSM1V+qQcwiOFmxTPveHK8s3Qi1wpbRe2rAbZZNjFvemmkhRhSTOJ/pA6gUHHC27z/qkL8f
	j4FH5i2fJjzI7vvdlZwo7mo/QbaSuXgafvsL6vGAF1gqH2nOHbcMf0rXwgI7z8c8a2jgPEIVzXyeh
	o4yIbQOq7LmRSWztJs312cGrAl34J6lkueEQOTKq7/xnvTovf57d/NBMUjz7HdHeq3dhBIljODlpP
	+HHgMAVoIf6RjpUG4o06J1MnrL8zr4rMl4YSDJXt2SXGab9QRXQLS6jzFVabh+jAUZY96uJNVhM16
	TxifSHkYcVe0KqQSYQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmuhN-000vxo-PJ; Tue, 16 Nov 2021 09:24:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmuhD-000vtj-Gc
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 09:24:09 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so1746601pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Nov 2021 01:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=owaydA/9dfzXygkoQ9b5wC+OlGrAMOC9LEkh/lAzv5I=;
 b=QMKycX4ZEQaoqQ026VxDUHwe+VqargI4Q56Ls7vof5Ssrt3G/nOSh2dyyoY6Cw02WF
 iFzhEy4rRt7z1+q0UupwntE3f0SNtv/+2FFKLmpIe9QX6rPKknymUxkADWNvKQ7UfQoc
 1I+c/UYXvuoyS+f9aI27LrnNpGTn7VKPJ8jKnYU2ns2Bw6y6Flc8J9w3nG/EkE/0nBxQ
 1+dMPFwBSyZHN3e+ZgOKTxa/qv2dqzO5wdeh7W8mVlHoAVUajMA1qeQ5HmOsWq9+NqOU
 iYO/LWu6lF15XzeRug5Q37kFz1sFMP942j6nzvnuqZqElH7Gy8dqO6Rusxak5WLORwOX
 nZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=owaydA/9dfzXygkoQ9b5wC+OlGrAMOC9LEkh/lAzv5I=;
 b=dtIKMBVbJMB0ahCKkEFOYMCw02pyES83uwYip+3q6M/RA+AyV4u8VHLuLAWeta15Za
 HVfw1rJ0HFDKfmfMhSFpDsEbt7pHqlv+Zq9u3UUuiXqBYFemYDgMTC7G3TpgYBLypL7x
 e0xuTo7iuwVEYW+1XK2AG0pCKSHNFuV4lzRg24oo1S8k/MvfNT/H7Gjzr3UsCCofVvm9
 sQ0E9xfyVbUWJfkmbX1gm94yo7iROzNMStO+ztY2KVSR74dnj3GWJexaMMHfa7uTtyjy
 nEpNnycaa5fXd24m0B133yqqgGzFcHQ7xktp19YSDIqdU365msR9ezsSBMC9BVMGxegh
 wLUg==
X-Gm-Message-State: AOAM5321AV3sxyrmdSndZoMBWSaSVeZf6AboMHU2gxbfQfRWtFEeV7rh
 vckznmBafpixyIudFxKhJBMc9A==
X-Google-Smtp-Source: ABdhPJw4Q0VPOvcNLCMaHO78tfO9Z0o0vrEmI1ogL6v9qranzZOGcmxPrHs+6HbKgj/geyrRdmBzNA==
X-Received: by 2002:a17:90a:9907:: with SMTP id
 b7mr71543402pjp.137.1637054646807; 
 Tue, 16 Nov 2021 01:24:06 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:f590:685a:7893:90be])
 by smtp.gmail.com with ESMTPSA id d2sm12436413pfu.203.2021.11.16.01.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:24:06 -0800 (PST)
Date: Tue, 16 Nov 2021 17:24:01 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v10, 11/19] media: mtk-vcodec: Generalize power and clock
 on/off interfaces
Message-ID: <YZN4se+Ihm2H20GG@google.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
 <20211111041500.17363-12-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111041500.17363-12-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_012407_754684_5A1389FC 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 11, 2021 at 12:14:52PM +0800, Yunfei Dong wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
[...]
> +void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int hw_idx)
>  {
[...]
> +
> +	if (dev->subdev_dev[hw_idx])
> +		return dev->subdev_dev[hw_idx];
> +
> +	node = dev->subdev_node[hw_idx];
> +	if (!node) {
> +		mtk_v4l2_err("Get lat node fail:%d", hw_idx);
> +		return NULL;
> +	}
> +
> +	hw_pdev = of_find_device_by_node(node);
> +	of_node_put(node);

Raised the question in [v10,06/19] media: mtk-vcodec: Manage multi hardware information[1], is the reference count borrowed from mtk_vcodec_subdev_device_check?  If so, it needs comments for documentation.

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20211111041500.17363-7-yunfei.dong@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
