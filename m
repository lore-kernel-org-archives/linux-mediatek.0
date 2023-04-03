Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD711C76188
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb074UMY/EIA61XwS8Peh/ZfQoemGIZHTxdZd+AFRzg=; b=Mvfzjs6ddxrNi6wB6zJe8Qup1s
	yk/birfc8ASPcxmX/oltAh6CZM9Qzu7TbuBfreUadmf+stmLtxrHmi8+U4GoFb/oVN9kor6rSPh2d
	Q/PuZPm37vlcKD1ENaOcOREYZnau38nU8MGUqrkyz4AEVChImjIXULNZSTrizJBNhASbnXZGc7Ae1
	KpGcbp/lsj+sCAgeoDUW/W+hQQpPc2A9C7nv08FMgxgPemi0RRlCjQezQyP84BWu5u81dSHkhSqUK
	KlzJANHzQEUEUmHdGBX+rNSj36y01NRumC4GkacE/a4e5wrzoE7L8w1km0uaJ8H4DRVre+3PMy4VN
	AizND9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNT6-00G19s-0h;
	Mon, 03 Apr 2023 16:55:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNT2-00G195-2N;
	Mon, 03 Apr 2023 16:55:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FDA462200;
	Mon,  3 Apr 2023 16:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD493C433D2;
	Mon,  3 Apr 2023 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680540939;
	bh=wNT8ydu+B8w9w25TmpHLQXo6Alhe2pEtaNIpcppZAM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A4OiC/4ODVc+8OY11AoWncwc0JkGJP0q0Z342BCoyCPM60MhcCdsaL6ejo0x5HLsg
	 De1y3QVBrey7/5JD7mqd7eoQR9d2qI2RM8EQsTkkiwITfhQgF8SIMSFA0OaHUyGc/F
	 wPgZgQVj4VYWQRpuWWanoqYh75qJHRRoGDSrtyZ36wopROMG3sKq+7MPYeiNkIRPZU
	 /yQM7KKbsp50JqTTOHhc7S7QbZJ3+TZJefyALVOyyZxsbNvvst+Z6gthiXZbvDXn71
	 7Qwfl3x3qqM4LG4FIWEIlLM8zKKcnP/2r47dr2Dy7F2szP5Ih/lZPGwAlbrWlgHn/K
	 pV4o4Q0wwOMyA==
Received: by mail-lj1-f169.google.com with SMTP id e9so15773604ljq.4;
        Mon, 03 Apr 2023 09:55:39 -0700 (PDT)
X-Gm-Message-State: AAQBX9dA60veNoJOi0lF+F+Z1nFPtJ7IUXzVRZedX8ttg+FuXCaQz7ys
	ahslKHwmc0QLUlqsENUPOoOIyK0Ut6TCpk7tgg==
X-Google-Smtp-Source: AKy350Y+5hy4jyEO8jxFXi8A0r7pryHIZvCni5hB+ua3N03GejwOwyTLdV1DdzbNU7/xTYE8OOrN2qBWaJ6mluiW+DM=
X-Received: by 2002:a2e:90d7:0:b0:2a6:16b4:a554 with SMTP id
 o23-20020a2e90d7000000b002a616b4a554mr5084652ljg.3.1680540937720; Mon, 03 Apr
 2023 09:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <1680072203-10394-1-git-send-email-xinlei.lee@mediatek.com>
 <CAAOTY_-bgkkqnfshmdNz-NP7TqdqE9Qdf-PyEOc6iANPmY+bRw@mail.gmail.com> <06038e8711a9214ed020901722c96af5380bee99.camel@mediatek.com>
In-Reply-To: <06038e8711a9214ed020901722c96af5380bee99.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Apr 2023 00:55:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Qb_-mzHWwd8MdNrkWy1x3ATGg5SmBbmX4fzka=F3puA@mail.gmail.com>
Message-ID: <CAAOTY_-Qb_-mzHWwd8MdNrkWy1x3ATGg5SmBbmX4fzka=F3puA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: change the aux retries times when
 receiving AUX_DEFER
To: =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_095540_855916_D8AF266F 
X-CRM114-Status: GOOD (  32.95  )
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

Hi, Xinlei:

Xinlei Lee (=E6=9D=8E=E6=98=95=E7=A3=8A) <Xinlei.Lee@mediatek.com> =E6=96=
=BC 2023=E5=B9=B44=E6=9C=883=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=88=
5:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 2023-04-03 at 11:49 +0800, Chun-Kuang Hu wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Hi, Xinlei:
> >
> > <xinlei.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=8829=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:43=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > >
> > > DP 1.4a Section 2.8.7.1.5.6.1:
> > > A DP Source device shall retry at least seven times upon receiving
> > > AUX_DEFER before giving up the AUX transaction.
> > >
> > > The drm_dp_i2c_do_msg() function in the drm_dp_helper.c file will
> > > judge the status of the msg->reply parameter passed to aux_transfer
> > > ange-the-aux-retries-times-when-re.patchfor different processing.
> > >
> > > Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort
> > > driver")
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dp.c | 12 +++++-------
> > >  1 file changed, 5 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > index 1f94fcc144d3..767b71da31a4 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > @@ -806,10 +806,9 @@ static int
> > > mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
> > >  }
> > >
> > >  static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool
> > > is_read, u8 cmd,
> > > -                                 u32 addr, u8 *buf, size_t length)
> > > +                                 u32 addr, u8 *buf, size_t length,
> > > u8 *reply_cmd)
> > >  {
> > >         int ret;
> > > -       u32 reply_cmd;
> > >
> > >         if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
> > >                         (cmd =3D=3D DP_AUX_NATIVE_READ && !length)))
> > > @@ -841,10 +840,10 @@ static int mtk_dp_aux_do_transfer(struct
> > > mtk_dp *mtk_dp, bool is_read, u8 cmd,
> > >         /* Wait for feedback from sink device. */
> > >         ret =3D mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
> > >
> > > -       reply_cmd =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
> > > -                   AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
> > > +       *reply_cmd =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
> > > +                    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
> > >
> > > -       if (ret || reply_cmd) {
> > > +       if (ret) {
> > >                 u32 phy_status =3D mtk_dp_read(mtk_dp,
> > > MTK_DP_AUX_P0_3628) &
> > >                                  AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
> > >                 if (phy_status !=3D
> > > AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
> > > @@ -2070,7 +2069,7 @@ static ssize_t mtk_dp_aux_transfer(struct
> > > drm_dp_aux *mtk_aux,
> > >                 ret =3D mtk_dp_aux_do_transfer(mtk_dp, is_read,
> > > request,
> > >                                              msg->address +
> > > accessed_bytes,
> > >                                              msg->buffer +
> > > accessed_bytes,
> > > -                                            to_access);
> > > +                                            to_access, &msg-
> > > >reply);
> > >
> > >                 if (ret) {
> > >                         drm_info(mtk_dp->drm_dev,
> > > @@ -2080,7 +2079,6 @@ static ssize_t mtk_dp_aux_transfer(struct
> > > drm_dp_aux *mtk_aux,
> > >                 accessed_bytes +=3D to_access;
> > >         } while (accessed_bytes < msg->size);
> > >
> > > -       msg->reply =3D DP_AUX_NATIVE_REPLY_ACK |
> > > DP_AUX_I2C_REPLY_ACK;
> >
> > In your description, you just mention the retry count is 7 times, but
> > you does not mention you should change the reply. Why you modify
> > this?
> > And where is the 7 times retry?
> >
> > Regards,
> > Chun-Kuang.
> >
> > >         return msg->size;
> > >  err:
> > >         msg->reply =3D DP_AUX_NATIVE_REPLY_NACK |
> > > DP_AUX_I2C_REPLY_NACK;
> > > --
> > > 2.18.0
> > >
>
> Hi CK:
>
> Thanks for your review!
>
> This patch is to fix some DP sinks that return AUX_DEFER, and the dp
> driver does not handle it according to the specification. DP_v1.4a
> spec 2.8.1.2 describes that if the sink returns AUX_DEFER, DPTX may
> retry later:
>
> The logic before the modification is that reply_cmd returns ETIMEDOUT
> if it is not AUX_ACK after the read operation, without considering the
> retry operation when returning AUX_DEFER;
>
> The modified logic is to add parameters to mtk_dp_aux_do_transfer() to
> store the return value of the sink. In the dmr_dp_helper.c file,
> drm_dp_i2c_do_msg calls aux->transfer and then performs retry
> operation according to msg->reply. The 7 times specified in the spec
> are also in this function defined in (max_retries).

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Best Regards!
> xinlei

