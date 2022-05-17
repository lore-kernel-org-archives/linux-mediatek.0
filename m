Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5aph3PIiFHpiGuvmKFvj4ZH6tPeBtuA5mYLJz5yPjU=; b=onawVD2iaFt5jx
	Q5bUTlSF6V19KnUBE4BYDOdD22pMYbt+l36lkUdrG8WIGIPD4e6gQQZ9w5HNoMldF7atubSu0cKKY
	mnNqxRvLF+rpFrC8Ih//hV6E8snBJx4C91Z2bgFipjd1ZOUlzudOWAha47Hfu7ou0vG4+yLmMMvtq
	5GDKkDYwI/e4kSAxiMc4rzA0YsrzxdhYyK5Tpy9aoAiUua2oq2icyrnXRJOJjNvGspvBHE6U3wtPm
	KiU97H7lE5TuXy/qXy2Cwd2hbVdps1wu7FP/CUWNCNQq/6438z3p65nmvz8VK80Ew5ACIYjA0bR6b
	Q9FsQhzSpTykDvXg7STA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr1US-00F8Nk-U9; Tue, 17 May 2022 18:00:12 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr1UH-00F8Ku-Qm; Tue, 17 May 2022 18:00:03 +0000
Received: by mail-oi1-f176.google.com with SMTP id e189so23223827oia.8;
 Tue, 17 May 2022 11:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l7jwPeZVluBx37sWW9p9486vXPERkHZmYslmM7IERC4=;
 b=3L9wMn08ECo+aBJZUiXR3o6cHytWgG/f5cgyJgXrbp596vfblLkAr+yMlrWOhxCrrk
 EtmW4UQSXPQu5C7iCLPX00PakT4W1BEuatgeA6SXsAcGjKk0fHiQlVTNtQSqK5doFnzQ
 Ls7QIlAU634+/w0a8MKuftTKkG0opZoHYh9+MWvtyI+pS8O2wvQs14N0LMthgiaYGcjF
 lMwzqdSnkRic7zEVjQFYtGouVHNh3oZpMrDq7Ma5FXcJRHdMHzKERzAr8veqBto9q5gx
 v+itzy994e7B0HcvW9rExvCEjL/JfatFjgsV9AFsvn0/MaPdwtAt575JL6Qn/JgDe4SH
 bpJQ==
X-Gm-Message-State: AOAM531iCY6q9bgNU/64X10EDYUIWpGqPFfJu8cTPsP7mPKrIXGAixhC
 MprrSj3IitVEdNoYN1bo9w==
X-Google-Smtp-Source: ABdhPJx4RCb0btBoBhki2+B8BgBEyjjkwfHWi2cScgsuArwHCQwCh02D1YsNTXiRT5shZKje2MpLpA==
X-Received: by 2002:aca:1108:0:b0:328:ef13:311c with SMTP id
 8-20020aca1108000000b00328ef13311cmr6474612oir.220.1652810400759; 
 Tue, 17 May 2022 11:00:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i204-20020acab8d5000000b00326414c1bb7sm63836oif.35.2022.05.17.10.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 11:00:00 -0700 (PDT)
Received: (nullmailer pid 1327168 invoked by uid 1000);
 Tue, 17 May 2022 17:59:58 -0000
Date: Tue, 17 May 2022 12:59:58 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: thermal: Add binding document for
 mt6873 thermal controller
Message-ID: <20220517175958.GA1321687-robh@kernel.org>
References: <20220512122433.1399802-1-abailon@baylibre.com>
 <20220512122433.1399802-3-abailon@baylibre.com>
 <546ddbd4-927d-2e28-6e82-a67b4584a17f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <546ddbd4-927d-2e28-6e82-a67b4584a17f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_110001_932592_8A48BD48 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: devicetree@vger.kernel.org, amitk@kernel.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, krzk+dt@kernel.org, ben.tseng@mediatek.com,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 04:25:51PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2022 14:24, Alexandre Bailon wrote:
> > From: Michael Kao <michael.kao@mediatek.com>
> > 
> > This patch adds binding document for mt6873 thermal controller.
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > 
> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> > ---
> >  .../thermal/mediatek-thermal-lvts.yaml        | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> > new file mode 100644
> > index 000000000000..69ffe7b14c21
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 
> filename: vendor,device
> so something like mediatek,mt6873-lvts.yaml or
> mediatek,mt6873-lvts-thermal.yaml
> 
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek SoC LVTS thermal controller (DTS) binding
> 
> s/(DTS) binding//
> (unless DTS means something related to hardware)
> 
> > +
> > +maintainers:
> > +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> > +  - Ben Tseng <ben.tseng@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6873-lvts
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lvts_clk
> 
> Skip "_clk" suffix, so just lvts.

Or drop altogether. There's generally no good name when there's only one 
entry so folks just make up 'clk', 'phy', 'rst', etc. or $block for the 
name.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
