Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E450C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmTEDsiknyJ2AHHNtzLnzlFsGABYFBktriYd5ocudH8=; b=rcODuS4Htf8TBx
	6W7L4q8ffcwBkcT5EV+M70UARs9s6pA1737/ndlHvA0DvbL6IdW4fRcZbmi9cT0LZsE4NH7lVOWOM
	vI70qDbjlaR6MRVT2mc/oRMHT1OL2j9DNZtH/xYJWSGa1odKPUj/4aiQVy1EQen2lmvc+FuiBE6oD
	BjKLEI6EuB2LGUZY/bFigiuDdbum5hZehtL+Ly5Myw8QYsJCs/pVlGKoesVeNMOE/PXvaoQENgvgP
	q9C3q+vJ3X/cEVjZRVJVoeeb9kp6BBurhk6p49xFJJz5edymF5dWXtofiEFVGjVj1lmWdEtNz+XNA
	YljweY834nYggiyPfqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKmB-002pp2-2b; Thu, 09 Jun 2022 16:12:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKm2-002plR-FX
	for linux-mediatek@lists.infradead.org; Thu, 09 Jun 2022 16:12:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id v14so6818495wra.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jun 2022 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ChRG0KIYJMedQ4f2yC6bVNs8GdwBtDapUrzg7nKkys0=;
        b=CKmrwiUrOU9h70UP2P7kjzM9gYsPPlap/tfoIFKC4YLIKDPUcdy6FrZfRNxmtRhHF9
         rjWpQSJbVXpwnHLlHB66DK0zxkohNjpoHKB0MgKQdcVyFUwDclHUFH3uHgVy8H/rm0NV
         9SklHSST56yPstDrNS7fR98++/43tpAZHdA5nOuuqAjGwiiUsYZqvfNgsmpyXxc89BfL
         TROcQk9KRgq1kuEBNmIK0tzum9TJSdfoNaAkkWOhxHmhJlNp/ux0SPoYbuZx6lGrYPB9
         r9u0bu+kVxn/zUtd8ETpXDkrfzmf0BHiqjiQ3yook620V2wUNPkUSwvZdV4/v8vsi0uW
         +cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ChRG0KIYJMedQ4f2yC6bVNs8GdwBtDapUrzg7nKkys0=;
        b=gHJxkrAk7QwmfYUo/wHMLQU5OWo5oWFo3pqzskSsiW4h8NtUVfLM0vujGEXy7NWcBD
         qIf0gu6eK3benFXUC5URgPLlGlBZw8I8XFSKYCNvN1mZ4qc+TbmGS7NKa52VSZ/S9YPy
         DfbolEhbs85jMLrqoFeKobn03id3GF72JDTheeE/l+jhF6gGKR7oJQFXHCAAfu42jsIY
         SsUZIzadx8QUJMlS3t5MHxCB/WYpnrED0jlrgbKchez6WACQBT2TSouzn4/z1hFOZwL6
         nkCzrRFDJHPwxAzOAf1oLlUM5tnTcXClaqz2Ylstsq/tkA04sIvm2a+zK/KNlr4Yac3L
         Hnjw==
X-Gm-Message-State: AOAM533LkhRdXy1K24+oFwFQhzDTNoAwB04BDtwuq5Y2nbrFg2FiDIJf
	FI1129BXGlGY7nb+RrkX5sW5bw==
X-Google-Smtp-Source: ABdhPJyN0EMGgDYiCDR0QuKsfGPudsUAuMjjiZvGNSnBJHONwJ3trgJHUZ2xULhavI+BcDBHI9HhqA==
X-Received: by 2002:adf:d1c4:0:b0:210:1935:3dd8 with SMTP id b4-20020adfd1c4000000b0021019353dd8mr39406969wrd.229.1654791158912;
        Thu, 09 Jun 2022 09:12:38 -0700 (PDT)
Received: from blmsp (dynamic-046-114-004-246.46.114.pool.telefonica.de. [46.114.4.246])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d4643000000b002103a7c5c91sm24014567wrs.43.2022.06.09.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 09:12:38 -0700 (PDT)
Date: Thu, 9 Jun 2022 18:12:36 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: power: Add MT8365 power domains
Message-ID: <20220609161236.b72x5hkvd5do6o2d@blmsp>
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220605212200.GA3539140-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605212200.GA3539140-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_091242_593961_4EABC9B5 
X-CRM114-Status: GOOD (  16.93  )
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

On Sun, Jun 05, 2022 at 04:22:00PM -0500, Rob Herring wrote:
> On Mon, May 30, 2022 at 10:42:11PM +0200, Fabien Parent wrote:
> > Add power domains dt-bindings for MT8365.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > ---
> >  .../power/mediatek,power-controller.yaml      |  2 ++
> >  include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> >  create mode 100644 include/dt-bindings/power/mt8365-power.h
> > 
> > diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > index 135c6f722091..2c6d3e4246b2 100644
> > --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > @@ -29,6 +29,7 @@ properties:
> >        - mediatek,mt8186-power-controller
> >        - mediatek,mt8192-power-controller
> >        - mediatek,mt8195-power-controller
> > +      - mediatek,mt8365-power-controller
> >  
> >    '#power-domain-cells':
> >      const: 1
> > @@ -67,6 +68,7 @@ patternProperties:
> >                "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
> >                "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> >                "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> > +              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
> >          maxItems: 1
> >  
> >        clocks:
> > diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
> > new file mode 100644
> > index 000000000000..4f50997a13b4
> > --- /dev/null
> > +++ b/include/dt-bindings/power/mt8365-power.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Dual license please.

Thanks Rob, fixed for v2.
> 
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
