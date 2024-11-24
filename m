Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF29E668A0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Nov 2024 06:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eao5vtdjXpGzaX9vbIhJVBXo0TRZVVbOkh7Dg9iYbr0=; b=mgcFyh3755paiHTVMEo48RfJ5K
	8L00+pXP2fjVOhTwKylddQ0uFE/Y20A4UdTDcfKg6TVKqtXR1NQyDiwle8nBTwaPoEPj7L3Xr7Fr0
	uapAOOyq420gNQEDGmBBqqP/MgueGsheXfkbjHhDA08pw/FqCRPXje+3kRU9vFJaEf01Tdk+l/kHz
	DKbnYR5wZwC1EKFHJx3ktC8cZNV4/QSI1MLfYFYE5B3zj69OvfJiCSh1/oEf5dWjoUmKG5iYKUbgM
	68Aj2L/MrN6NlJecDd5J1Kuke4b2r3qEEyQhZhNK99u12IjlPhfZ1NqHu4rPn2rygHodwz0JuAarm
	tykFGfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF5ru-00000005Lu4-1z75;
	Sun, 24 Nov 2024 06:13:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF5qw-00000005Lmz-3iLd;
	Sun, 24 Nov 2024 06:12:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC9C4581;
	Sun, 24 Nov 2024 07:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732428708;
	bh=B83l0SEiWv+6jdMr62dgC5qObjxKWmfUpCeu4JzKH+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gwez3x7Ci7s62mg6glT8BrBJ1hX/Y5lCRXf18R2xDvm5CkQdb1tu8cqfEDKbBIgpH
	 +CILQu6nfdTyaA27+ATbrbnTdbXNe413uopKH5zPORpWipJjq2iNm2xZtaaLD2LAQ0
	 L24/BAvt91/tJyu7kTYaODTaA0Zuv1jv5BMDrj9o=
Date: Sun, 24 Nov 2024 08:11:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Message-ID: <20241124061159.GD19381@pendragon.ideasonboard.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
 <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
 <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_221215_063835_E9C87B40 
X-CRM114-Status: GOOD (  21.77  )
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

On Fri, Nov 22, 2024 at 09:28:53AM +0000, CK Hu (胡俊光) wrote:
> On Fri, 2024-11-22 at 10:16 +0100, Julien Stephan wrote:
> > Le ven. 22 nov. 2024 à 08:54, CK Hu (胡俊光) a écrit :
> > > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > > >
> > > >
> > > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > >
> > > > This driver provides a path to bypass the SoC ISP so that image data
> > > > coming from the SENINF can go directly into memory without any image
> > > > processing. This allows the use of an external ISP.
> > > >
> > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > [Paul Elder fix irq locking]
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > > > +                                  bool enable, bool pak_en)
> > > > +{
> > > > +       if (enable)
> > > > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_dev);
> > >
> > > Directly call mtk_camsv30_cmos_vf_hw_enable().
> > > This has discussed in previous version [1].
> > >
> > > [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com/
> >
> > Hi CK,
> >
> > I forgot about that discussion sorry :/
> > I guess you want me to completely remove the  mtk_cam_hw_functions struct?
> > In that case, what do you prefer:
> > - keep mtk_camsv30_hw.c and put signatures in mtkcamsv30_hw.h and
> > include mtk_camsv30_hw.h in mtk_camsv_video.c
> > - rename mtk_camsv30_hw.c to mtk_camsv_hw.c (and all functions) and
> > put signatures in mtk_camsv_hw.h
> 
> I prefer the second one.

If we drop the indirection (which I think is a good idea until we get a
second hardware generation supported by the same driver) I would also go
for the latter.

> > > > +       else
> > > > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_dev);
> > > > +}
> > > > +
> > > >

-- 
Regards,

Laurent Pinchart

