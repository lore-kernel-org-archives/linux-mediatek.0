Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734A6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:21:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F51B20672
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 14:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWu/7604";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GVVje8vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F51B20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pTcanY1mTCmbXl+p7HyiiXuK92ScnaykWXE/UUB14f0=; b=iWu/76049B2AQpu6Kr4SsV6NN
	mhTYd/Lr1bEDUFsRkUSTXdTAhqMUuQP23d+scAs8GE4xWgRW8el938jdcYl6+uI14RCDEGlJwJ/1d
	E58fDoIuR9fqh+yCenZ24uHlkd7OZWHlkAEhY9P37BTi5YQt8RMfzkVmSOvjpmYbsYOY+/BZ4kBn3
	NgNey6GwHMF3uJ4tZQnvkqo+QxDqQ+itWDekOdXSNttYz990U703Ayl8WcaUUxEXyoWH8lA/J0yz9
	imnEcSWQuSAolUu0+fjKDV8BpQilyNR04pSzz5P5GrRbFQASpPidXSzlKPUCtN9LJ/qu8c+GoyLqr
	Vb2duBIMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqH8F-0002L9-4C; Tue, 30 Jun 2020 14:21:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqH8C-0002K7-Ag; Tue, 30 Jun 2020 14:21:05 +0000
X-UUID: 49d4f14ee8c34161850c60608a55e44b-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cxMnMMWUcVlBq3TyW4cE97CM4bI+Rge6V0CEfuXLJSs=; 
 b=GVVje8vy47V91iiWKK/nPY7B2b5015LBDU7sMrA53GVdlYsnxBIBsng+47QeeH+E5YQ2UwykS2bVR74JAbiU6Qvl4E7sXk5xBzTKlEIvdulUP8f/DoAgZxL1twSFEpQmLLnDwDth+Vnucv2Nsa++zvlnmbQG9mr13iQhTFmRvTY=;
X-UUID: 49d4f14ee8c34161850c60608a55e44b-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jerry-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 118298364; Tue, 30 Jun 2020 06:20:50 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 07:10:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 22:10:50 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 22:10:50 +0800
Message-ID: <1593526253.29676.28.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 30 Jun 2020 22:10:53 +0800
In-Reply-To: <20200521183825.GB249683@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?=
 <Sean.Cheng@mediatek.com>, "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?=
 <christie.yu@mediatek.com>, jerry-ch.chen@mediatek.com,
 HansVerkuil <hverkuil@xs4all.nl>,
 Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?=
 <jungo.lin@mediatek.com>, Sj
 Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?=
 <Frederic.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > Hi Jerry,
> > 
> > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Laurent, Tomasz, Matthias,
> > >
> > > gentle ping for this patch set,
> > > If no new comments, I would like to send a newer version.
> > >
> > 
> > Sorry, I still haven't had a chance to look at the series, so feel
> > free to send a new version and I will take a look at the new one.
> > 
> 
> Finally found some time to review the series. Again sorry for the delay
> and thanks for your patience.
> 
> Some general comments:
> 1) The metadata format FourCC should be added in a separate patch,
> together with documentation for it.
> 2) Control IDs, structs used by the userspace, etc. should be defined in
> a header under include/uapi/linux.
> 
> Please also check my replies to particular patches for further comments.
> 
> Best regards,
> Tomasz

Appreciate for your reply,

So far, I've locally created an uapi header:
include/uapi/linux/mtk_fd_40.h
which provides some values, control ids, and the definitions of
structures that would be needed by user of mtk_fd_40 driver.
In addition, I also provide a MACRO as example in comments that can
extract the struct member with bit length and offset
definitions(eliminate the bit-fields).

Also, I would like to rename struct fd_user_output with struct
mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
I will add them in a separate patch in next version.

I am still working on the documentation, which might be
Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
Refering the other pixfmt-*.rst files, I will try to provide the
flat-table of the metadata with the structure of the mtk_fd_hw_result.

I am confusing that should I remain the name with -40 in the tail of rst
file?
Since I think the layout of metadata might be different in the future
mtk fd drivers. Maybe they create a new one or should they update the
rst file when they are upstreaming?

Other comments are almost fixed, I will inform you by this mail thread
as soon as I finish the documentation of fd metadata format.

Sorry for the late response,
Thanks and Best Regards,
Jerry
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
