Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1363ED58D72
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJcfd2JZIGszY8wfkMYIiru8TnxZiR/zeP3kapZllGo=; b=H9H5Izy/mMBkS4FiMo17sOOv9+
	5h8W8RY63gmitsw/DcgQxMiG9yIYMG0TVMg43T4KWnzSuGBog/UroMUyfXCtEOh403I2/n7aQ+rdb
	UbWWrnr4ngym3ObKyDKwqKveI6YlkvKB/3HWmrDUJ0NAPMwksPWQcDfi5QbACH/djzbbytyQkvWrB
	twZUgB2NdCLKH3fv1oUD4RtevjU+0VL+Th45ZwSYumU6a6hrNpDh7uqqOfPF0dpRp5RAdbVSdY2rf
	PCjDbwFe3BaeP9MPnQed3vcBRGrYxDmsh4HI5zHMcEnSDk8XvSLAxJ53uPvT2M4+9DSRsu7M+MUKB
	7PPCM+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFd1W-00000008lfx-0NXQ;
	Mon, 25 Nov 2024 17:37:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFd0Y-00000008laD-1vkR;
	Mon, 25 Nov 2024 17:36:23 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 361FA229;
	Mon, 25 Nov 2024 18:35:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732556159;
	bh=AvqfISnEDH0te3fGy14dfdBmQ7eZEZWEwQrKZrCufAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpXsQtcehsBKeIPR/t0GFL1Spk29mYTN2DpzDrvfrsaTG0tpx+FkcV46i1pex5m4C
	 n4vQIzzZo8rm67ISwhxBdD39v6oDN9F7inxwBcKLfS/9X68wZMsgYMdVUDuf2otj6y
	 h9kYCCM/Y+bznP0f2uQK9DAV0tsUu7c0e0NTNhKo=
Date: Mon, 25 Nov 2024 19:36:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241125173611.GS19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <d17dfb29f60bfa1889aa554ef16c9ddec272520d.camel@mediatek.com>
 <CAEHHSvbScBhn=6rSOApQ=K9JEpwL6JPpJnJy929mLXHhxQ=3FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvbScBhn=6rSOApQ=K9JEpwL6JPpJnJy929mLXHhxQ=3FQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_093622_639549_36C851DC 
X-CRM114-Status: GOOD (  26.05  )
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

On Mon, Nov 25, 2024 at 03:40:18PM +0100, Julien Stephan wrote:
> Le lun. 25 nov. 2024 à 09:14, CK Hu (胡俊光) <ck.hu@mediatek.com> a écrit :
> > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > >
> > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > >
> > > This driver provides a path to bypass the SoC ISP so that image data
> > > coming from the SENINF can go directly into memory without any image
> > > processing. This allows the use of an external ISP.
> > >
> > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > [Paul Elder fix irq locking]
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> >
> > [snip]
> >
> > > +static void mtk_camsv30_update_buffers_add(struct mtk_cam_dev *cam_dev,
> > > +                                          struct mtk_cam_dev_buffer *buf)
> > > +{
> > > +       mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_BASE_ADDR, buf->daddr);
> > > +}
> > > +
> >
> > [snip]
> >
> > > +static void mtk_camsv30_fbc_inc(struct mtk_cam_dev *cam_dev)
> > > +{
> > > +       unsigned int fbc_val;
> > > +
> > > +       if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
> >
> > I think this pm_runtime_resume_and_get() is not necessary.
> > mtk_camsv30_fbc_inc() is called only in mtk_cam_vb2_buf_queue().
> > But when buf_list is empty, mtk_camsv30_update_buffers_add() is called before this function.
> > But mtk_camsv30_update_buffers_add() does not call pm_runtime_resume_and_get() and it works normally.
> > So this function is not necessary to call pm_runtime_resume_and_get().
> 
> Hi CK,
> 
> This one is actually needed because .buf_queue can be called before
> .start_streaming in case a user requests to prepare buffers before
> streaming.
> But you are right, if a user requests to alloc buffer before streaming
> mtk_camsv_update_buffers_address will be called without pm. Streaming
> still works because in start streaming we call
> mtk_camsv_update_buffers_address again.
> So maybe I should put the pm stuff in mtk_cam_vb2_buf_queue ?

mtk_cam_vb2_buf_queue() should only touch the hardware if streaming has
been started, otherwise it shhould just put the buffers in a queue and
return immediately, and the initial hardware setup should be done when
starting streaming. There should be no need to handle runtime PM in this
function or in mtk_cam_vb2_buf_queue().

> > In other register setting function, please also check this pm function is necessary or not.
> >
> > Regards,
> > CK
> >
> > > +               dev_err(cam_dev->dev, "failed to get pm_runtime\n");
> > > +               return;
> > > +       }
> > > +
> > > +       fbc_val = mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
> > > +       fbc_val |= CAMSV_IMGO_FBC_RCNT_INC;
> > > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > > +       fbc_val &= ~CAMSV_IMGO_FBC_RCNT_INC;
> > > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > > +
> > > +       pm_runtime_put_autosuspend(cam_dev->dev);
> > > +}
> > > +

-- 
Regards,

Laurent Pinchart

