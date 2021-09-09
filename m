Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 13:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1606109F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 13:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1606109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXAHOlXPJgROAGk98NcIlCMjLrmun4IPe7V8klvmXoE=; b=ie2oVXMjiNdHsv
	KKWfNA6ECG6OiNmg4ysQ9g9y7p21ieD/6wqI/1woCaUZv0jdl1TmIiI+dZxnIDrexqSznrIAUouF0
	dheVOxE7hK/QtOW+KNjIFozF+MVAFULxh85nLHYZDmKNXuGVORktXDZTD7xSpXe18Oug1wlpCmu7p
	KLnwveb5Q2o37NsoO7IIsAeSPOM/2rW4cUedPE9ocA3iSgf1m98Ae+1UIpO4m8nb9n3ckpYYGW+tM
	LkmHWUZddBfGqcbDsl2vor2tesynjTcOwVQ6NPnsNEVtWhmrhJmDMzNh11Ubp9tRH7i+knQfNxL3x
	u35HJ+/7BqGiL1e1mkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOKDD-009vH9-Fm; Thu, 09 Sep 2021 13:35:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOJQr-009YCO-Jr
 for linux-mediatek@lists.infradead.org; Thu, 09 Sep 2021 12:45:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d6so2371177wrc.11
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Sep 2021 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oYMbDn4U1+4evJCYYQyxBxoVUEu/0Aanoqc2NTU0X78=;
 b=jSyEr1e/ouH5V5fqUxa9TzSs8hVLwfNnhbQvAL0IRYRrVhrztimtIpDlwAjnGOr8Dj
 9ti7W5mhfsd4kzR5vQLdRSps7Ib424Uep62OVqgt4PN+E9ZLQnx5XW5rhGVRsVmJoyMZ
 BBum1IuLfiM3TE6hGYzM2gnE+X4k/x2x1OKkBVM3HJplyPUSoP+F+T3DZGaxXy58T4pF
 ji9wde3AXxJ6AE8MviX5YQ6/GQBYQtF+kw6molxOlkmNni3DQ+xRFp8GceozypDxtHVu
 8VkDIRYS/mR8BKCTumOPmzw8TytDMFoeWDyjUG/8RUlHWsq8rqkGXBePk/7WCUEGJ651
 9gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oYMbDn4U1+4evJCYYQyxBxoVUEu/0Aanoqc2NTU0X78=;
 b=A4/xsYuQjf8ILazx3lefdZ1odbdJcDg3XqG/y1Wd+kQq/PJIygBtpYNgksHA6jMy1s
 taSdGEFzxDke9lrH2fYZ1IWcNYXp5TicTugIb5+WYmmZcEUy8oY/XL97UyCaxUiIflP8
 +popfR4JQHDfnAIaCHPD8SWnNiS6os+iZHbnKhwJ6I/5qGH0ykZtQIe50A9QOfuZrJsA
 wqqNVw4pDS8RacJz8m2t9K4dycyIsAB3r6pCFFvKlVk2U6td2rK1/1d/YulPGUf4ywwV
 n8e5A6jKD6/wQuvbs5wKrSxz6UV188Ap0UCH1kKVEHPknl1rI86fYt2+yFQ9BLYmb+gS
 NchQ==
X-Gm-Message-State: AOAM531r3X1/bxNsW2Wvoj2eg+fXJ++QIr2qn2Fa/kio3zug+WD6hiyp
 E4Fde5LwXLqzs5/ImX6gpbqu8g==
X-Google-Smtp-Source: ABdhPJwfTKkMnQv69MeTaIcop8vh+adsmpIsEsvpqG9ZfCBFMbL515LBbo71hVU8IIcY2Fj9WdtYeg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr3414618wrn.261.1631191531743; 
 Thu, 09 Sep 2021 05:45:31 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id o12sm1532287wmr.2.2021.09.09.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 05:45:31 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:45:30 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 6/6] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210909124530.dthpwbhzsmxp6xfl@blmsp>
References: <20210906193529.718845-1-msp@baylibre.com>
 <20210906193529.718845-7-msp@baylibre.com>
 <YTZ8eds/IgpW/RBL@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTZ8eds/IgpW/RBL@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_054533_703148_D4B0B7EF 
X-CRM114-Status: GOOD (  22.11  )
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

Hi Sam,

On Mon, Sep 06, 2021 at 10:39:21PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> On Mon, Sep 06, 2021 at 09:35:29PM +0200, Markus Schneider-Pargmann wrote:
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes RFC -> v1:
> >     - Removed unused register definitions.
> >     - Replaced workqueue with threaded irq.
> >     - Removed connector code.
> >     - Move to atomic_* drm functions.
> >     - General cleanups of the code.
> >     - Remove unused select GENERIC_PHY.
> > 
> >  drivers/gpu/drm/mediatek/Kconfig      |    6 +
> >  drivers/gpu/drm/mediatek/Makefile     |    2 +
> >  drivers/gpu/drm/mediatek/mtk_dp.c     | 2881 +++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  580 +++++
> >  4 files changed, 3469 insertions(+)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > 
> 
> 
> > +
> > +static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset = drm_atomic_helper_bridge_reset,
> > +	.attach = mtk_dp_bridge_attach,
> > +	.detach = mtk_dp_bridge_detach,
> > +	.pre_enable = mtk_dp_bridge_pre_enable,
> Use the atomic variant here as pre_enable is deprecated.
> 
> > +	.atomic_enable = mtk_dp_bridge_atomic_enable,
> > +	.atomic_disable = mtk_dp_bridge_atomic_disable,
> > +	.post_disable = mtk_dp_bridge_post_disable,
> Use the atomic variant here as .post_disable is deprecated.

Thanks, I got rid of both pre_enable and post_disable as well now.

> 
> > +	.get_edid = mtk_dp_get_edid,
> > +	.detect = mtk_dp_bdg_detect,
> > +};
> 
> Everything else I skimmed looked fine. But it was a quick skim so..

Thanks for taking the time to have a look.

Best,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
