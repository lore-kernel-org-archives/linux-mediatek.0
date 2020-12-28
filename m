Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5282C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 17:02:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D522065C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 17:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D522065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ozb18obbmzN/cvJk1IFMVNSTILoIJr5tcpC1qFRO9Js=; b=x7oO6hAZ52xTJKITNVEjLh6vT
	MSHe1G73hnZD6k4wUjynPBBe2AYTSKO+Sq3zehzZyJnDFoGpRvbwWfPAt9lcoh0zxs/29CkKjrpom
	GB9PfsiOBX+fBUDZk2mTmue1C/xiM1JRZhkKZEaY1a8aA4B4qGaytwbH2b8fBukS3fyo5zF7RmwsR
	CKy8+BEfJaUC/kJCr0yBM1uyZLrIwrWp026+8cXzQuH4/62/NotOLjKrV6Z7bUyja27VJk7b0totA
	M9p/Jd/nzLVncOjBP3WFo0nMan0cy2bdGlfz8SRaH00T5XZCTcGMsKxoBso48NAMQe4fjFGPezO8q
	cStw1ol/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvur-0001VA-IA; Mon, 28 Dec 2020 17:02:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvup-0001Ti-DE; Mon, 28 Dec 2020 17:02:40 +0000
X-UUID: 27499b5d32694c6797824599962f303a-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MKcGaDmRcVBvqDrJbkq1CbbgmmDaPv8lVjeRUC8j44s=; 
 b=uabjDfIplXpYFkdbBNisq5KG98ovAvMLn0LMZbeVIBM8qPNo2Z+M3Bkrm+p7/MPnUmHNixg9wm7KMbPkBtDl76bnFOapQ7asYZ/acVAmBxhK8VXxjP0WF6rw0+mtkaLjDXoeVkOxTxYxNUftRJtYB21FI07+7qAYEuEdn8yluQQ=;
X-UUID: 27499b5d32694c6797824599962f303a-20201228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jerry-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1611815029; Mon, 28 Dec 2020 09:02:26 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 09:03:32 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 01:02:22 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 01:03:30 +0800
Message-ID: <1609174942.3068.9.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 01:02:22 +0800
In-Reply-To: <1605182733.28992.12.camel@mtksdccf07>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org>
 <1593526253.29676.28.camel@mtksdccf07>
 <20200630171912.GE1212092@chromium.org>
 <1605095509.28992.7.camel@mtksdccf07>
 <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
 <1605182733.28992.12.camel@mtksdccf07>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CB3A893A9AB6C3BBF7C61ED52F91BA0A7C48437C37AB22DA5155F362C3E85E02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_120239_578932_3AFA7875 
X-CRM114-Status: GOOD (  41.25  )
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

On Thu, 2020-11-12 at 20:05 +0800, Jerry-ch Chen wrote:
> Hi Tomasz,
> 
> On Thu, 2020-11-12 at 13:26 +0900, Tomasz Figa wrote:
> > On Wed, Nov 11, 2020 at 8:51 PM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2020-07-01 at 01:19 +0800, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> > > > > Hi Tomasz,
> > > > >
> > > > > On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > > > > > Hi Jerry,
> > > > > >
> > > > > > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > > > > > Hi Jerry,
> > > > > > >
> > > > > > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Hi Laurent, Tomasz, Matthias,
> > > > > > > >
> > > > > > > > gentle ping for this patch set,
> > > > > > > > If no new comments, I would like to send a newer version.
> > > > > > > >
> > > > > > >
> > > > > > > Sorry, I still haven't had a chance to look at the series, so feel
> > > > > > > free to send a new version and I will take a look at the new one.
> > > > > > >
> > > > > >
> > > > > > Finally found some time to review the series. Again sorry for the delay
> > > > > > and thanks for your patience.
> > > > > >
> > > > > > Some general comments:
> > > > > > 1) The metadata format FourCC should be added in a separate patch,
> > > > > > together with documentation for it.
> > > > > > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > > > > > a header under include/uapi/linux.
> > > > > >
> > > > > > Please also check my replies to particular patches for further comments.
> > > > > >
> > > > > > Best regards,
> > > > > > Tomasz
> > > > >
> > > > > Appreciate for your reply,
> > > > >
> > > > > So far, I've locally created an uapi header:
> > > > > include/uapi/linux/mtk_fd_40.h
> > > > > which provides some values, control ids, and the definitions of
> > > > > structures that would be needed by user of mtk_fd_40 driver.
> > > > > In addition, I also provide a MACRO as example in comments that can
> > > > > extract the struct member with bit length and offset
> > > > > definitions(eliminate the bit-fields).
> > > > >
> > > > > Also, I would like to rename struct fd_user_output with struct
> > > > > mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
> > > >
> > > > The change sounds good to me.
> > > >
> > > > > I will add them in a separate patch in next version.
> > > > >
> > > >
> > > > Okay.
> > > >
> > > > > I am still working on the documentation, which might be
> > > > > Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> > > > > Refering the other pixfmt-*.rst files, I will try to provide the
> > > > > flat-table of the metadata with the structure of the mtk_fd_hw_result.
> > > > >
> > > >
> > > > Sounds good to me.
> > > >
> > > > > I am confusing that should I remain the name with -40 in the tail of rst
> > > > > file?
> > > >
> > > > The header and documentation file names should match the driver name.  I
> > > > just noticed there is some inconsistency in the naming, though. The
> > > > driver seems to be located under drivers/media/platform/mtk-isp/fd, but
> > > > the driver name in the platform driver struct and as reported by
> > > > VIDIOC_QUERYCAP seems to be "mtk-fd-4.0".
> > >
> > > > Since we have many mtk-* drivers in the tree currently, I think it might
> > > > make sense to consolidate them under drivers/media/platform/mediatek,
> > > > similarly to drivers/media/platform/qcom or /rockchip. But it could be
> > > > done later, as a follow-up.
> > > >
> > > > My suggestion would be to place the driver under
> > > > drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
> > > > symbol to include the _40 suffix.
> > > >
> > > > What do you think?
> > > >
> > >
> > > I Appreciate your comments,
> > > Sorry for the late reply.
> > >
> > > Would it be possible for me to replace the driver as drivers/media/platform/mtk_fd/mtk-fd-40?(Just like mtk-isp/isp_50)
> > >
> > 
> > I'm not a big fan of duplicating "mtk fd" in the path. How about just
> > making it drivers/media/platform/mtk-fd-40?
> > 
> 
> Ok, I will make it drivers/media/platform/mtk-fd-40,
> and also rename the related Kconfig symbol to include the _40 suffix.
> 
> Thanks and Best Regards,
> Jerry.
> 
> > Best regards,
> > Tomasz
> 


I've finish the document of FD driver, describing the structure of the
mtk_fd_hw_result. Could I send the new version of the driver? would the
folder path replacement must be included in the new version?

Thanks and Best Regards,
Jerry
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
