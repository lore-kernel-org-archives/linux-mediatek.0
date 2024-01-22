Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62AC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 19:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSz9MgcaBEj1PDlX4xVuO8K29ToCXliySSzjMUOEVTU=; b=F0QTw0qiuzjf7CZEn7R47skFx2
	07yflPBIq1hv6OsM3Oj7MPpdEvLzqEw5FrlSEouCA9DF84w9FMQqWgVDW99t7AiDSQJylNeDtuUZ3
	cKl//rReqsoFwUM8oK/AjF4Ov+Y0+lomCQt8EBN6LDVe73qMpL3xZPWjgcs6kju84jD8muJsEfykE
	LHrGd3sq1irZqeYeGHKbRUIRIHZRS0QFbjluZ0irbug1KGiaB0r7KWOUcncA/eDZVwBNRcdG6Qe+1
	ICp/ASEPJrOmRzWREzx+82vGbA9rYiA05EVXtRfjh8pp3JBML1SDREKkfpaugnlUO64lRxSKuzgCJ
	VDXeQq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0Ca-00DliG-0n;
	Mon, 22 Jan 2024 19:43:24 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0C7-00DlEK-1h;
	Mon, 22 Jan 2024 19:42:57 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso791134366b.0;
        Mon, 22 Jan 2024 11:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705952574; x=1706557374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSz9MgcaBEj1PDlX4xVuO8K29ToCXliySSzjMUOEVTU=;
        b=dnHsrg2oYu2juBpeBlTCKt/1GEafnd7R2kgXQETiKhOcxECFF0twrlZ43FWALZPsYk
         yglAJc86M1O6p4Mw+eIYu0ez88yIZuPaUfwwRKPzHARfvNOGmeqYzzR60Zjui9P/n6k0
         I4COsnKaHPdN+MVJ8+EB9Kd1Pnx+KqlnNsjfITwUy6VaQabc2qx4D+Asm4iyoF0IuVKc
         Ca0NCCc07ClrFqXFd9c6w/SwHX3GWmUk7EpdX5qZVzbclorIlgjaP0EG/UkosWwo+zf1
         mym75UsVisH9Mn4f2m7U10B+ZTU0Kxnbi4BUiKRO4wcczbnzx0VOSGaanOo9PeAuOyRy
         FftQ==
X-Gm-Message-State: AOJu0YyKedD3IlqMXM2v67TtrVIkZXMWnrR5hgeetIsdZoP+Y1GlEudu
	riZVI0RW2wuhXmoyvJ5DuBmCnGKYUeFAW/2GvEGxQRv03rEEpc+R
X-Google-Smtp-Source: AGHT+IFQFCGpmLYtrnRwSCjHHeNf9K+eWlAMbY6MH7qysKYu0OOCBDzmRNRSH/REALQ1FNXviTDUFQ==
X-Received: by 2002:a17:906:3a92:b0:a29:32bf:9c8 with SMTP id y18-20020a1709063a9200b00a2932bf09c8mr4714272ejd.39.1705952574020;
        Mon, 22 Jan 2024 11:42:54 -0800 (PST)
Received: from gmail.com (fwdproxy-cln-009.fbsv.net. [2a03:2880:31ff:9::face:b00c])
        by smtp.gmail.com with ESMTPSA id ca23-20020a170906a3d700b00a2bd01c2349sm13594158ejb.169.2024.01.22.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:42:53 -0800 (PST)
Date: Mon, 22 Jan 2024 11:42:51 -0800
From: Breno Leitao <leitao@debian.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: kuba@kernel.org, davem@davemloft.net, abeni@redhat.com,
	edumazet@google.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>, dsahern@kernel.org,
	weiwan@google.com,
	"open list:LYNX PCS MODULE" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 03/22] net: fill in MODULE_DESCRIPTION()s for
 PCS Layer
Message-ID: <Za7FO7yBZ1a2KQ3B@gmail.com>
References: <20240122184543.2501493-1-leitao@debian.org>
 <20240122184543.2501493-4-leitao@debian.org>
 <52e39a1b-c551-4eea-9606-62be0cbad39f@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e39a1b-c551-4eea-9606-62be0cbad39f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_114255_599435_4B0F76D0 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, Jan 22, 2024 at 08:33:31PM +0100, Andrew Lunn wrote:
> On Mon, Jan 22, 2024 at 10:45:24AM -0800, Breno Leitao wrote:
> > W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> > Add descriptions to the LynxI PCS MediaTek's SoC.
> 
> That patch now does more than that.
> 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  drivers/net/pcs/pcs-lynx.c      | 1 +
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
> >  drivers/net/pcs/pcs-xpcs.c      | 1 +
> >  3 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> > index dc3962b2aa6b..d51d09beaab3 100644
> > --- a/drivers/net/pcs/pcs-lynx.c
> > +++ b/drivers/net/pcs/pcs-lynx.c
> > @@ -398,4 +398,5 @@ void lynx_pcs_destroy(struct phylink_pcs *pcs)
> >  }
> >  EXPORT_SYMBOL(lynx_pcs_destroy);
> >  
> > +MODULE_DESCRIPTION("MediaTek SGMII library for Lynx PCS");
> 
> pcs-lynx is for NXP hardware, not MediaTek.

Thanks. I will update!

