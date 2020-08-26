Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF17C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 09:19:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD3F206FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 09:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zfz23N0Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQFo15B+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD3F206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1MWQbhQV9aC+OVzLZZpAwQLKwqYBcIDZb/Iu/DF6fVk=; b=zfz23N0Y4hGAYovtlbFUPTcfa
	wn5aZANzgP3mQipuS3hJg/6cBf9vC0Fsf1oKTepn6cyrSfEU1w/Kduy/4A1PvY/8wYnXlCB+UcNQ4
	bgXwTNiZ4agSDEoNZwvExwcMwivrW0R7UFJrCIgMa4EwMNgYjrK3zcKbUASckgBsrqHtrZlyIP0Or
	Zqgr4PeCHzNSUf3w78lL2T3vUzjdgD98aSlcJD6rpP4ke3OBWEgVCdSEZxroZugTXybibkUGfmJbh
	A5zN9mqWy1TIacxrBjGYmclymNTpMYlLK2yyhghHWzZ/0vEvF95Ikn4W74KFsStv+5B4A918rqyaU
	+H2mvZ+KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kArau-0004Wv-UY; Wed, 26 Aug 2020 09:19:48 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kArar-0004VN-BC
 for linux-mediatek@lists.infradead.org; Wed, 26 Aug 2020 09:19:46 +0000
Received: by mail-ot1-x343.google.com with SMTP id x24so953551otp.3
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZhkQxNLw77frpz6ZMdHyemforQJCP3lk4DGDC08wQk=;
 b=SQFo15B+++qeSPzHZf2QXnMtumb0EW49HHCk4BopK4PnC5U07MD1/tISq37ka7/WrU
 d0eQqlPHSmALWhupGDYFc80znGHBtRopb7r9iCO41v1ug9FPvzWfeIyaVbj35wY1WXe6
 PcOc3mMXNt1FuByQMrYJh89OMZA1uiRBQRFF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZhkQxNLw77frpz6ZMdHyemforQJCP3lk4DGDC08wQk=;
 b=KAtOij0on8kZDzoOR0WxVWIev/A7U8u8ga5ujHFBNEJeijEdh0CQpwC5ORxR3IQnuD
 Sn/lq2yQmTlCZCMo/rRyYc3FWZrng7GEAy3vRBZLsVyH/LcpaUZFSl3pZ/zOF252/SGy
 EVKaAvVucCp0myhCGyt4iaZoE4Q9WNu/Jttvn87BdwNWTfvNXYZiUTtiQXDlPjmtnaoA
 /6JSAxQn2CcexqdkAb3mL1Lv3zli2dZloC2jy3Gc1DM4MzPMlO1GfnRsobpL5LrLe3p5
 tDDNegEfjl3tVpQxW/vtcmT1AEyJpZJThm+v9Ammy4rpTGBjZsM/q75abzrMM2JbFzsS
 Av5w==
X-Gm-Message-State: AOAM530oZuoxXTgshla5AJcnIKS4vt9sO7CtB28fmhSD2xDXLIxAEnBo
 QsgqYDjE+FyrjDOGSx5jocSjgEJVOInMsA==
X-Google-Smtp-Source: ABdhPJzFhIY4Tm6Jd+if2LQQZaRL3KuAfMw7iEMxwrCFpgOxB+JF31xUwgRI1Qzsx2Dr1T3Hd1hNzA==
X-Received: by 2002:a9d:7597:: with SMTP id s23mr1207902otk.342.1598433581758; 
 Wed, 26 Aug 2020 02:19:41 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171])
 by smtp.gmail.com with ESMTPSA id b10sm385244oiy.7.2020.08.26.02.19.40
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 02:19:40 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id k4so941421oik.2
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 02:19:40 -0700 (PDT)
X-Received: by 2002:a05:6808:482:: with SMTP id
 z2mr3200722oid.94.1598433579877; 
 Wed, 26 Aug 2020 02:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200821103608.2310097-4-acourbot@chromium.org>
 <202008212314.jscpXSEF%lkp@intel.com>
In-Reply-To: <202008212314.jscpXSEF%lkp@intel.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Aug 2020 18:19:29 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXD1RpGGCOb+7=cUUNOymbtgiDGvG_+S4DtsTU49-ORKA@mail.gmail.com>
Message-ID: <CAPBb6MXD1RpGGCOb+7=cUUNOymbtgiDGvG_+S4DtsTU49-ORKA@mail.gmail.com>
Subject: Re: [PATCH v4 03/17] media: mtk-vcodec: add SCP firmware ops
To: kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_051945_401512_A2C4D16E 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, kbuild-all@lists.01.org,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Aug 22, 2020 at 12:14 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Alexandre,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on robh/for-next v5.9-rc1 next-20200821]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Alexandre-Courbot/media-mtk-vcodec-venc-support-for-MT8183/20200821-184118
> base:   git://linuxtv.org/media_tree.git master
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "scp_get_venc_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_ipi_send" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_put" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_vdec_hw_capa" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_ipi_register" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_mapping_dm_addr" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "scp_get_rproc" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> >> ERROR: modpost: "rproc_boot" [drivers/media/platform/mtk-vcodec/mtk-vcodec-common.ko] undefined!
> ERROR: modpost: "__delay" [drivers/net/phy/mdio-cavium.ko] undefined!

This issue should be fixed by the following patch, sent to the
remoteproc tree:

https://lkml.org/lkml/2020/8/21/489

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
