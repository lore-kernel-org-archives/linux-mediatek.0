Return-Path: <SRS0=8pCq=PM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A05C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 15:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC0060EDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Oct 2021 15:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DC0060EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxEl4WsWIuOvXI7rPTVOw0BhRSPV7f/vEV4b31Bpfls=; b=NDpbVj2uUYzcIy
	CekXHLi7QXwNESY4CnzAIoF62Exl6HPVhpPpU8lwNPu2ObEzPy0hF30NqopJDtqsJ1BEVnRw3h8w3
	VX6jvPGIm4zdDEgrrqqe1lv3Cz8j+KKI01vvzbCWKE9qngk++MAxHv5Q0v7ivH2mP8k0filTnFT+k
	YgISbXheo6VNFPCHm9sKPOSaovs+12Ond999zTHk4zyJl1jMAexdH5y5vijpPPTMehx8NN6ghSWb3
	+nWyp38cwXRDweqH2MOQdK4DUFhbB3chEfvnx/7WxNB26hsQYwF7h6XEvvs1/tRDSeC+JdY+78EP2
	J+42PtPUqYMeT10LPlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefXr-00EBCA-Us; Sun, 24 Oct 2021 15:36:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefXo-00EBAh-Fc
 for linux-mediatek@lists.infradead.org; Sun, 24 Oct 2021 15:36:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso10214246wmc.1
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Oct 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uo+KZSKbMpCYD2HnQVmUgWBUvnOq/cWI0Zv67K4qsag=;
 b=yu5Z4gfoU+YC7zzBlq9uJ6PXvotAkI9fzmpdOOfZJqkYYQUBQ7/Z/MTdSwgi4nd5jb
 B3dyMlOYGV88bSwN1GoOONZ0UT/2ZqC5ShpiUsJKxBtW6vnCE00UhsZcr8Urk7ytx0/S
 NDdcZXNGmOLXHRjfF6zjYBygT8MkmkWhD/CCxddf844M0hv+4uUkNr4d9WJOAdXOWNI2
 sWAOU5teuRpYkPKTVpSLWSPndpLuaaAaVlhoAbz63sJx/c/IzZtD7mXjtv9bDca89bA5
 1GNLXAbJJLnvKiOAtAE6++GUirONvnRdY8bSlswlBmlY14qE8e7wRWCPqV9F5H+NviO1
 C9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uo+KZSKbMpCYD2HnQVmUgWBUvnOq/cWI0Zv67K4qsag=;
 b=xJjjp72sLi3cjBykmCaw+uDKMJ3djejeds77tlfTcHrWKkos7ZK4p1v56o0CDEzE6o
 kQw56R/UpOCiKtNM0nX5lIz9rB9gUDTsfQb9ekD4mz0bsCTxq95Tx6kNO1w7DhBrpIUZ
 hJm6RQFvNXiSoO4+6mjTsS0KiQrp/w77DibPyDab0DFgZMpxh0bY32cuvsjBg0XXXsWY
 8sIY0kb+lB1zYHj6U2USdDtO9FGDLcrpkbZtMYHtHfljlau82ExJQoANkwxPixZCDp18
 QU6a4LEbHyBl3kLG4RBtwettGPOkpolNvM09/EZEYLlp1WYhP9IITK0PjREwRi1f7HRs
 7EXQ==
X-Gm-Message-State: AOAM530nOMALwIoJKDEJopyMjBQ7JmWlQ3S8MPEKnt8eW2aowb3Ac0wM
 h22Kb39HPwn6kr6CvybzmyqH4g==
X-Google-Smtp-Source: ABdhPJwwN33lxeowWbuondAurMoTKsZYNPHjpTT6hvtmBIMTKVjY9pcuRTU0VfDorky8HCqiHArLDA==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr43354530wmd.96.1635089778344; 
 Sun, 24 Oct 2021 08:36:18 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id w7sm7605993wrm.64.2021.10.24.08.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:36:18 -0700 (PDT)
Date: Sun, 24 Oct 2021 17:36:17 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211024153617.inkbrjzqjp4mspyh@blmsp>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-3-msp@baylibre.com>
 <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_083620_600379_FE086486 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, Oct 22, 2021 at 06:19:13PM -0500, Rob Herring wrote:
> On Thu, 21 Oct 2021 11:27:02 +0200, Markus Schneider-Pargmann wrote:
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >     Changes v4 -> v5:
> >     - Removed "status" in the example
> >     - Remove edp_tx compatible.
> >     - Rename dp_tx compatible to dp-tx.
> > 
> >  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> But can't be applied without the dependent header (or remove the 
> dependency).

Ok, thank you Rob. Maybe I will remove the dependency.

Thanks,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
