Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50648C41513
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BVWzhm385pmpQxclrdIFUUD3T4d2Dvi7eurxunpAts=; b=C9oQkU/pq5Ryr69OtqLq1c3NGh
	rfGgBY0dyGmMk58OYJZbSxEHBxFmtfGRm50DXwTQKRNlsVXTnQlKRag4YvBtL0Ux/7IVlUgvDXrZk
	7yPM4WWYbnkjXjOdPYn/3O/8zXVif8Mj+QfRrEivaTyC9qxAS0cmtH1ekGGcnUPpVFxiNMvpG3aif
	Cwws/dEbaqFSvCSdfZXVxrrYEFagHhTh7uxLP1g283hD8fd0E9d/IYh7pIMZs2w/F8CgqLgEgwhQO
	qJs4xPjPr4tAf7o1s6Q8gH92JdZB4/bla6f2wnvYFeYFUk+UcKU0ROVPA40kyFV/mQv+svmhknd5o
	cUawKxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOtG-008SwP-0h;
	Tue, 25 Jul 2023 20:44:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOOtD-008Svm-1F;
	Tue, 25 Jul 2023 20:44:16 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65EAE6606EEE;
	Tue, 25 Jul 2023 21:44:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690317854;
	bh=l0QdiZLVFikXd6djh9oMfl+C2ChjeqPpqf7ac5R2fis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=it21CKyA7WekFPItXvp7zTV3pDdq7MTw11C+d6Is0wunsHAzgQejIaLMW1dys51cx
	 +OfSQ7YlmutsGoj53fpg/NrFVhxHMK34h8dJBprpBewiLkzYVFrv6FL44P9pehWXUq
	 KoxEtTIKIkHDt3tmM0EjxGGmrDM8b0etKHAWFyHf3oGkbKQ9l9p4IruVoUCtDavvbm
	 jPSTj2Yx2jLAbDstlibyw3qu+WxzlZfaw5oHtFeOZnQ63BAP1cB7zdy7PD5VoRIIOS
	 SR16Wuo4/DxpM8rSzTNHgsZsewEfLoGqqDYAfNuaB4Wmnru+cRqQ43MTGyLOFFsHJj
	 o8FxFs63Pw7UA==
Date: Tue, 25 Jul 2023 16:44:08 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 5/7] media: mediatek: vcodec: Read HW active status
 from syscon
Message-ID: <b5ba26b8-7c03-4ead-97ff-8ee3ae0efa26@notapiano>
References: <20230630151436.155586-1-nfraprado@collabora.com>
 <20230630151436.155586-6-nfraprado@collabora.com>
 <b5fd2dff-14a5-3ad8-9698-d1a50f4516fa@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5fd2dff-14a5-3ad8-9698-d1a50f4516fa@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_134415_581099_47604AD7 
X-CRM114-Status: GOOD (  25.04  )
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

On Tue, Jul 25, 2023 at 12:15:03PM +0200, Hans Verkuil wrote:
> Hi Nicolas,
> 
> On 30/06/2023 17:14, Nícolas F. R. A. Prado wrote:
> > Remove the requirement of a VDEC_SYS reg iospace for both MT8173 and
> > MT8183. To achieve that, rely on a vdecsys syscon to be passed through
> > the DT, and use it to directly read the VDEC_HW_ACTIVE bit during IRQ
> > handling to check whether the HW is active. Also update the VP8 stateful
> > decoder to use the syscon, if present, for writes to VDEC_SYS.
> > 
> > The old behavior is still present when reg-names aren't supplied, as
> > to keep backward compatibility.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> > Changes in v5:
> > - Added explicit linux/bitfield.h include for FIELD_GET(), following
> >   0day report
> > 
> > Changes in v4:
> > - Added new helper and updated VP8 stateful decoder to use it, so the
> >   syscon can also be used by mt8173
> > - Made handling cleaner
> > - Reworded commit
> > 
> > Changes in v3:
> > - Switched handling of VDEC_HW_ACTIVE to use a syscon instead of the
> >   'active' clock
> > - Reworded commit
> > - Removed changes to subdev part of driver, since they aren't used by
> >   MT8183
> > 
> >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 77 ++++++++++++++++---
> >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  1 +
> >  .../mediatek/vcodec/mtk_vcodec_util.c         | 15 ++++
> >  .../mediatek/vcodec/mtk_vcodec_util.h         |  2 +
> >  .../mediatek/vcodec/vdec/vdec_vp8_if.c        | 10 +--
> >  5 files changed, 87 insertions(+), 18 deletions(-)
> 
> This patch introduced this new smatch error:
> 
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
> 
> I think it is due to:
> 
> if (reg_num <= 0 || reg_num > NUM_MAX_VDEC_REG_BASE) {
> 
> in mtk_vcodec_get_reg_bases(): the '>' should probably be '>='.
> 
> Can you post a follow-up patch fixing this?

Hi Hans,

sorry about that, and thanks for noticing it.

I've just sent the fix:
https://lore.kernel.org/all/20230725204043.569799-1-nfraprado@collabora.com

Thanks,
Nícolas

