Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wbhg0BPBXIMXV/utzPc3dgXX4yVOfDOcoxaMEBqYSQU=; b=dN/pTARjMAhiiSye8giTISjaAF
	p2SjKG/bHk1lR1sXJ1cW8pAs3Y2nzJA5YOyeD1YNROyPQX3EXSGYGGM1qr1nRD+QHLesqnNk/kOPt
	cTSvUZfbBb/kJiHN0gkNvwkO3s/hdhKmpdMWx3OQExjvIQqeNwsizu0O7ZMuBHAgX46iAj11Yl7dX
	dKjlsz65/1wf5uYIoZjV1CfnZQTtxkFOf3ykBAaUOJ3AsPCsfVEfYk8xqk0AuwGZGwGqI68wWljZV
	+d47+42SzpPFjns/kr9af3gl/Vgl8Tg1JI0ryD5O/GUtUAs6LVrVFHJ1WD7eGrUDCZcM8MGv0/F+j
	H4i790QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uNB-00GBFb-0x;
	Tue, 14 Nov 2023 14:26:37 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uN8-00GBFF-2Q
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Nov 2023 14:26:36 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-586b512ba0aso2544457eaf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Nov 2023 06:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971992; x=1700576792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wbhg0BPBXIMXV/utzPc3dgXX4yVOfDOcoxaMEBqYSQU=;
        b=vUWBakRs4uZfQykNUg8EZQ9sp9xaENq5ceDD92YnbLYvY/un8PfnRyFBP5Nso0xIuB
         64Npf7Rbat/w04AMvkmCpgpBIQj0rMeAm7pjUodOew8hraX2SezuNKYwmdRgeItI9Sqa
         PEIuftAzZb7FldvXOHEuWrTcRLXkiZgxxhQBKXmfvjz7L9CsFSbCvSZOMvmFDC5x4w7U
         iN3qu7uNAEd6JsTXMubX0MJZnV9q7jDNuwjZfcedyWfJ6udUe/7PN3FAnRGUItQf4RSh
         LikzXBodoQiUzgGAYjH84p9lt7YlEFfhGIT43w2PS4H/c4p+o1nCC41Oj/GwlPLHtFnF
         sbrg==
X-Gm-Message-State: AOJu0Yyjc9DbC1QONYEvTFd3c3nOQi7VDN70quy/5Rt4sbLwRa/M54Sq
	c17gH/ZBRFjI6KidO8A3pg==
X-Google-Smtp-Source: AGHT+IE517eoCvtFdUcomMYLUYPuuU933NHOiNNabpUdzmxOfzf9ICKde+iqWcic42bRdEYddt76Eg==
X-Received: by 2002:a4a:621c:0:b0:57b:de27:28ed with SMTP id x28-20020a4a621c000000b0057bde2728edmr8486285ooc.6.1699971991821;
        Tue, 14 Nov 2023 06:26:31 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p68-20020a4a4847000000b0058a42b24dfdsm265176ooa.23.2023.11.14.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:26:31 -0800 (PST)
Received: (nullmailer pid 1700938 invoked by uid 1000);
	Tue, 14 Nov 2023 14:26:30 -0000
Date: Tue, 14 Nov 2023 08:26:30 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Julien Stephan <jstephan@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: media: Add bindings for THine
 THP7312 ISP
Message-ID: <169997198956.1700885.10242516873039673598.robh@kernel.org>
References: <20231112004544.24877-1-laurent.pinchart@ideasonboard.com>
 <20231112004544.24877-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112004544.24877-2-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_062634_814752_3C6704F7 
X-CRM114-Status: GOOD (  14.28  )
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


On Sun, 12 Nov 2023 02:45:42 +0200, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The THP7312 is an external ISP from THine. Add DT bindings for it.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes since v5:
> 
> - Make relative schema path absolute
> - Add missing $ in pattern properties
> - Set maximum value for sensor node's reg property
> - Drop support for sensor regulators
> - Add Laurent Pinchart as co-maintainer
> 
> Changes since v4:
> 
> - Add bus-type property
> 
> Changes since v2:
> 
> - Drop description of reg property
> - Improve thine,boot-mode property documentation
> - Making thine,boot-mode property optional
> - Don't use underscores in supplies names
> ---
>  .../bindings/media/i2c/thine,thp7312.yaml     | 224 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


