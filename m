Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615B2C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yezHjwgPoaOH6sKFBjWOYwIIAgJfYYzFB6mHvxAdSns=; b=JH7hwmX5gGgDi7IG1G66tzovjG
	gRQLCZ6wZdbodhy4Jx6cz35i/3LTlHJt4takpwT/4u6RRzpghkt9FfDFtQ+jfvESxqW/iE9Vw12t4
	oOvIBDkpV4o7BFY3XR41tMBxyLGkNv0oAHmo0g/grDS04kRCECJSt8RYIFbt3kvwmVX9S43GMoUdv
	YnVVmoU/bQzgRFpvrXbu4U/rIf6/r+YNH10oGsVtC2j733AnyBTH2fDSGIXvhqEQy8c/HLL6pwUAi
	UspDzN5iNf7c8ZFCemeZ40wJxwZPQ1xNfzCEtPaiv+3kwPa0O+0BuXlNh8aHcvSInA5jAB/3yZOPc
	c+SS0YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnZK-000gvX-ER; Mon, 25 Jul 2022 02:11:38 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnZI-000gue-5b
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 02:11:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id t17so3750524lfk.0
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Jul 2022 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yezHjwgPoaOH6sKFBjWOYwIIAgJfYYzFB6mHvxAdSns=;
        b=Yr7Kf0kP1c1AudVOG7DafT3nig3V/eJCouHxXsPNRqTS9417uaWRbOXTVR6dv0f+O6
         5rOOIo1uf6PKwT/aRtTOraTiBoE+SsZOkBz3HOrmjooRvSYfFhiIYzOp++ifFEXDyfXF
         ZBB58mG/xhASR3zPVdKrc6ZR9DHr8Ycx0OQ0jOuDSd71H7ZBBTMwqIv1ErYMetA4oZUC
         hM/eshEUDjaQ1El9f5Vm6IXob1Q3bdTTxKAkg9vclEdIZaga3M1Vp6iNqLpnYpRxM6bd
         Hw974KufOsTZ5RlA++J1ztouUT76B4r8ZnZ+QGBuVWQudCeDNNE3U3QE5LIufMWCTEO4
         nPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yezHjwgPoaOH6sKFBjWOYwIIAgJfYYzFB6mHvxAdSns=;
        b=ZoRru/YADs7BYsFoUiiEze1WRlR8bJFsrDcmko1YIBjnCiQBclgCRTZpisR9yHfhVS
         32Ljk8iPwjAACzctp8PzEpduuUJo7n+It4q5xaBABIGy9F75GVNHwqgAvfyoKmr2eTFK
         LJfQ7LbdmqfgksHG4pSglc3aQ6hhTsRwEHsP1LWJTSgaV83Df63G1kmNnja1z1ukuFYq
         4nZhcTBAMosjGFReMP5022rwxHG3Aym8yLVaV0CaE8lTcpqZULzg1uDfpFWbd7W6O23c
         DXRIhW3KdXrVYFxRfOWp0Qt//ojpq65JEM21ueQY/7Tk47lYsHzeXOIu5Wrxnlg7NR3K
         JwXQ==
X-Gm-Message-State: AJIora+fysi/qZ9aa6Aa2lqWVWAQciC8XLp6byF6CLnwe/9uIPtuk2hk
	fIaYpfnkCOJiU/9Gz3bldOdT27b5cCuoFPlv5w==
X-Google-Smtp-Source: AGRyM1v1d0TKvlXD00AW4RAezRiyl0Jz+66+KOzoApRSsoxmBnebxvzlAZUkGI/prNqeAvW49t+9y60EsIuVRufmmaI=
X-Received: by 2002:a05:6512:e83:b0:489:e7de:56ea with SMTP id
 bi3-20020a0565120e8300b00489e7de56eamr4284325lfb.591.1658715092412; Sun, 24
 Jul 2022 19:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220721065833.26887-1-peter.wang@mediatek.com> <2f66f4ba-f0d5-6b8a-cc3b-fa896a302d60@acm.org>
In-Reply-To: <2f66f4ba-f0d5-6b8a-cc3b-fa896a302d60@acm.org>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Mon, 25 Jul 2022 10:11:20 +0800
Message-ID: <CAGaU9a8w3U8P_uivpqzuyWaw4FAWOTogrT2R-t_THaz65keVzQ@mail.gmail.com>
Subject: Re: [PATCH v3] scsi: ufs: correct ufshcd_shutdown flow
To: Bart Van Assche <bvanassche@acm.org>
Cc: peter.wang@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>, 
	linux-scsi@vger.kernel.org, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Avri Altman <avri.altman@wdc.com>, 
	alim.akhtar@samsung.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_191136_249967_0F399F57 
X-CRM114-Status: GOOD (  11.31  )
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

On Sat, Jul 23, 2022 at 5:15 AM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 7/20/22 23:58, peter.wang@mediatek.com wrote:
> > Both ufshcd_shtdown and ufshcd_wl_shutdown could run concurrently.
> > And it have race condition when ufshcd_wl_shutdown on-going and
> > clock/power turn off by ufshcd_shutdown.
> >
> > The normal case:
> > ufshcd_wl_shutdown -> ufshcd_shtdown
> > ufshcd_shtdown should turn off clock/power.
> >
> > The abnormal case:
> > ufshcd_shtdown -> ufshcd_wl_shutdown
>
> How can this happen since device_shutdown() iterates over devices in the
> opposite order in which these have been created?
>

Is it possible for more than one initiator to invoke
kernel_power_off() at the same time?

In this case, the order of device shutdown is not promised anymore
because devices_kset is manipulated simultaneously by multiple
initiators in device_shutdown().

> Thanks,
>
> Bart.

