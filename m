Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 19:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2071F61212
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 19:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2071F61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dse8VSZZUh4peLRUqIvW1RN+VaqLqqA/3vvSwJ4aeF4=; b=X0ZcrPwntXULhG
	QQcHgzXV3+wikueLoS23krr9NB33FRDH8QyrnfnlqzB/6GoIFINW8EAWcSYd7xz/vwV9FHWu+zDsN
	8zxfe74JHSWNtLdL0NsOe9JInSA3OLD9jrdrCUEHAtYOIQjwK8v0CbIwlPOs6EeMFGwY4f5rkvahq
	at9LnBxdx/duFi3T4fUEKH6AzEekssK9A7yOrfqSdpMEn5kKXgkAYbvFTPlQBVEUy1SqfH0NWHZGx
	REw5dAWbgp1FZiznsfBC4zKxAlT49PnpAY2sg8JcuAgtdfwtB3yN0eOU8flU0BrjhdhtFiQVwsBkx
	SykqT9dB6IuofIT5xNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdH2Q-005dUg-6u; Wed, 20 Oct 2021 19:14:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdH2C-005dRO-9T
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 19:13:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id u18so449065wrg.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 Oct 2021 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AJTtdODY5XsT1WlkimPK22rBfKzbxdKR4VylNcGjTYI=;
 b=XT2i6L6NXo101KmD1VesqNx6rOK+iBPwUmMpYmGxFAJONhE12xnN6HApLNylQCgGyV
 qM5/aPiGzRY9EgjgVU7d2GugzgBVdBU72ZivoxcJa61YOkmmIS2FV6afYk9fztegrFnr
 htGdMPeswfO2wesm4yVvFr7DZdNpPQ1vdOuLO0P0k5ja9S4yt8hjJqFn4GuDiRC7WjGW
 tL3OB1uT9g27oQAJe9fZ+q94l6qhNx9i2CP/eA80p2EyUcDRQQUAfyHbZWjschewf1Zs
 S9Uf6joxKEXCVGjx/3at3ckfDQFue6oUtDaJjnxTDxWOLX/zwSlsLJIv7IxEmnCl++5c
 jg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AJTtdODY5XsT1WlkimPK22rBfKzbxdKR4VylNcGjTYI=;
 b=rW6JmOqcjVx61M945qUTlAFnjuZ7Q427Vf2ykes1fPX8xvNNY1fhl1noGTUIZ7hLoi
 YWAIj+EXNAO0LrQyxEuBpW8n0p/gXeMEt9hizQlkyfX24yCu/3zYn4irnnVziYNrSPF5
 uNZks7phUjGh/SFyKFMe+USN7IecCNU4EUyAoVNtJFL4BTyLd8aMAWvt7hQkcX5tAvM9
 fIYp4IXlpscxk8DPPIIpWVAdHy3+pASttTK1ep9ID9AkhFJ3OXFy6Ti+Aq4KTKuyvVcG
 VWYLwCnX/wWiH8HfJGFebbM7Q0BtMEpQEemWk1hIiLUEocPbrGgcNEmD/XZo35caQCsO
 boZg==
X-Gm-Message-State: AOAM532zCWuZfmwmob9ep/jqVd/OS1Z8lju5dbCTeDpoaVSFFW7QnuR8
 EvrOlOkcv1jyWhmvuf+kujDc6A==
X-Google-Smtp-Source: ABdhPJym3jQAKD5Xd56d6VcAvqIhipKJtFKNrtzYGJYNIM+xQMkQ3kC4a5hCTE1AXwyEluUcYvkNcg==
X-Received: by 2002:adf:e80a:: with SMTP id o10mr1298709wrm.322.1634757230857; 
 Wed, 20 Oct 2021 12:13:50 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id e9sm2777665wrn.2.2021.10.20.12.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:13:49 -0700 (PDT)
Date: Wed, 20 Oct 2021 21:13:48 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Message-ID: <20211020191348.yb3eu7lp4urzx75j@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
 <YWTMdewWCNCZy+UE@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YWTMdewWCNCZy+UE@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_121356_348227_508ED6AE 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Rob,

On Mon, Oct 11, 2021 at 06:44:53PM -0500, Rob Herring wrote:
> On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> > DP_INTF is a similar functional block to mediatek,dpi but is different
> > in that it serves the DisplayPort controller on mediatek SoCs and uses
> > different clocks. Therefore this patch creates a new binding file for
> > this functional block.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v3 -> v4:
> >     - Fixed clock names in the example as the clock patch series is merged into
> >       next now
> >     - Add missing ports decleration to the example
> > 
> >     Changes v1 -> v2:
> >     - Move the devicetree binding from mediatek,dpi into its own binding file.
> > 
> >  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks a lot for reviewing. However I am going to recombine dpintf with
dpi as Chun-Kuang helped me realize that the fdp clock is a parent of
the pixel clock and therefore not a different clock. In the end the
clocks are the same now for both dpi and dpintf, so no need for a
separate document.

Best,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
