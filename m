Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA05C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bo1b/bEqOS6KDD6qflz0mFStzeeE7aur/bUdV5C/8NA=; b=vx1FjDwVmz3p7kOJHRd7AXUINp
	9aBhH+0BuzIQDkrnsjEbOizAj5CJF0Hv5MJo6gkS7/VgWMGBpUDeKqFnVpwUW70HP75OYLkjKZx02
	Y8sLFoRhuJfzCeMA9C6QBkMBftNIbM9uK1XZkj5kyuY4cD+cp7FtKeTAfbk+Yhzcdfx9GuRH1SJfg
	i2cIqXkty8pBPtRgySzjL9Ev5+VHyGAb5wgrjOuLizdipmqbmBvOEvpTGlKxS7JSy6ySvWn4m38bx
	ct3MrCKW78X+5eV6wY5jcxDHnqysMrA2mCCDTXrF3gHEuwy9X+GHuHqoVjsNYTrpP/hyItwepGiUb
	PF9rPL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr0k-0054Vn-1N;
	Tue, 16 May 2023 09:30:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr0h-0054Tn-25
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 09:30:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30786c87cdaso10988230f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684229419; x=1686821419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bo1b/bEqOS6KDD6qflz0mFStzeeE7aur/bUdV5C/8NA=;
        b=vRap7UvFpv5ghKGfHsGU8Sx21psojIcztLgVIfwXWJknaFex0YDfYeBt8QdLUe6Gkb
         EG8UOIkceBXE/IjJcromhmhBBpTrow4u9OeNW6CAeY3KRZ0bFKuLVdpeY8nmc+myHUdO
         QhWgL+NzdeSPH23J+bAgDCGqdpH9wbSG5pqBuhWPpuqDrIYLKuRV8gn3+IdCXRGtPLeQ
         AjSm8pJWYkjp47srU3RKptYEqRNguW1H8a3RokeO9ozq+kjRsQBor8Gk7+nk3ni92ger
         /HYUENYA8FPWMde5Tv1gEz0Zud3qfusXGXJv1yXRj322ED7prIUFViaYje9qN9wwEY2a
         XwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229419; x=1686821419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo1b/bEqOS6KDD6qflz0mFStzeeE7aur/bUdV5C/8NA=;
        b=bTkFVU3WRxwUXsSy9WdWjva65hI8tCSmEa5WFCZ4SiV89eAtb0OwBlP5t6sDWzaWdy
         nZdD+79RWmhII10ApmMKeZatttWKhz95qCImlTEutT5AKcpqZwXAuimAafD4CEVYgrA/
         KTA5cHn2ETWtDWfMa4FlKrsqlyn7m+rWGB3j98hAGO984H7a5+LFKCQg9vXfAXi1bB2O
         MHZIL9U+20l1WIDo335fv5O6FfRjQe2rVWkSvbg3NVygqOx0nYFL3vcRpZBuT3TKbUSP
         l6xv22e3I5G1JPoUv28iOW/Cb39J3wpDPKElG3t9liIb2q6bVmjzSMK9u56ZWA9Q8PO5
         ElYg==
X-Gm-Message-State: AC+VfDzZSnQX6/sU5P17FUYBfapMTfvJ5Iar2iZAthgKVfA7RRQEOO5J
	WtpNdfA+cJAFjLrj0h9vPDMRIg==
X-Google-Smtp-Source: ACHHUZ7VHIunoibF7bQd4takm4fdk7SjKWAPNooKGJ2N2GmNNWqcstqBa8aSFOHr6/KgX4SlBiDTqQ==
X-Received: by 2002:adf:f2c3:0:b0:305:fbfb:c7d7 with SMTP id d3-20020adff2c3000000b00305fbfbc7d7mr29019988wrp.44.1684229419563;
        Tue, 16 May 2023 02:30:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d6704000000b002e5ff05765esm1928076wru.73.2023.05.16.02.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:30:18 -0700 (PDT)
Date: Tue, 16 May 2023 11:30:17 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski@linaro.org, robh@kernel.org, 
	chunkuang.hu@kernel.org, linux-mediatek@lists.infradead.org, 
	Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo <louis.kuo@mediatek.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-ID: <shthzc3zekvm2mrcch6vexsq5djpoxwupvdmmovhrz2ack3wxx@s4ptfhq7iwvi>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <b2nk4jw2hpy4ndoq4cojazkn6h3tra2zjffhiswb7aqryabf7q@mkbtzhzcbivv>
 <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54e6923c-729a-49de-8395-fbd0b8443aa8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_023023_685835_E4663F78 
X-CRM114-Status: GOOD (  37.00  )
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

On Mon, May 15, 2023 at 04:32:42PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/23 16:07, Julien Stephan ha scritto:
> > On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
> > > > +#define CSIxB_OFFSET		0x1000
> > >
> > > What if we grab two (or three?) iospaces from devicetree?
> > >
> > > - base (global)
> > > - csi_a
> > > - csi_b
> > >
> > > That would make it possible to maybe eventually extend this driver to more
> > > versions (older or newer) of the CSI PHY IP without putting fixes offsets
> > > inside of platform data structures and such.
> > >
> > Hi Angelo,
> > The register bank of the CSI port is divided into 2:
> > * from base address to base + 0x1000 (port A)
> > * from base + 0x1000 to base +0x2000 (port B)
> > Some CSI port can be configured in 4D1C mode (4 data + 1 clock) using
> > the whole register bank from base to base + 0x2000 or in 2D1C mode (2 data +
> > 1 clock) and use either port A or port B.
> >
> > For example  mt8365 has CSI0 that can be used either in 4D1C mode or in
> > 2 * 2D1C and CSI1 which can use only 4D1C mode
> >
> > 2D1C mode can not be tested and is not implemented in the driver so
> > I guess adding csi_a and csi_b reg value may be confusing?
> >
> > What do you think?
>
> Ok so we're talking about two data lanes per CSI port... it may still be
> beneficial to split the two register regions as
>
> reg-names = "csi-a", "csi-b"; (whoops, I actually used underscores before,
>                                and that was a mistake, sorry!)
>
> ....but that would be actually good only if we are expecting to get a CSI
> PHY in the future with four data lanes per port.
>
> If you do *not* expect at all such a CSI PHY, or you do *not* expect such
> a PHY to ever be compatible with this driver (read as: if you expect such
> a PHY to be literally completely different from this one), then it would
> not change much to have the registers split in two.
>
> Another case in which it would make sense is if we were to get a PHY that
> provides more than two CSI ports: in that case, we'd avoid platform data
> machinery to check the number of actual ports in the IP, as we would be
> just checking how many register regions we were given from the devicetree,
> meaning that if we got "csi-a", "csi-b", "csi-c", "csi-d", we have four
> ports.
>
> Besides, another thing to think about is... yes you cannot test nor implement
> 2D1C mode in your submission, but this doesn't mean that others won't ever be
> interested in this and that other people won't be actually implementing that;
> Providing them with the right initial driver structure will surely make things
> easier, encouraging other people from the community to spend their precious
> time on the topic.
>
Hi Angelo,
Ok, I see your point, but for future potential upgrade to support A/B
ports I was thinking of something else: adding independent nodes for csixA
and csixB such as:

csi0_rx: phy@11c10000 {
  reg = <0 0x11C10000 0 0x2000>;
  mediatek,mode = <4D1c>;
  ...
};

csi0a_rx: phy@11c10000 {
  reg = <0 0x11C10000 0 0x1000>;
  mediatek,mode = <2D1c>;
  ...
};
csi0b_rx: phy@11c11000 {
  reg = <0 0x11C11000 0 0x1000>;
  mediatek,mode = <2D1c>;
  ...
};

giving the correct register range. One thing I did not mention is that if
csi0_rx is used csi0a_rx and csi0b_rx cannot be used (they share same
physical lanes as csio_rx), but csi0a_rx and csi0b_rx can be used simultaneously.
So platform device will enable only the node(s) it needs and enabling
csi0_rx and csioa/b_rx will fail because they share the same register
region and map will fail and it does not have any sense because you
either have a camera using the whole port or sub port but you cannot have
both plugged in. What do you think about it?

> > > > +#define CSIxB_OFFSET		0x1000
Maybe moving this declaration in phy-mtk-mipi-csi-0-5-rx-reg.h would be
better?

Regards,
Julien
> Regards,
> Angelo
>

