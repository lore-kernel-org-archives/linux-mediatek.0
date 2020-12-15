Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023C6C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 16:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B532078B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B532078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yey2dzKwWUBQ13zV4tU68VW+6Zq70cOHjZKSlJg9Yi0=; b=o4Xi3Gq1TNVCjTVIZfwDe2QEQ
	YMAj03QnN4imgloIJoZmwPYk08FH1GvdulF3PmPckLBkMzXnIw2zD+p1Nua/nR9xJ1yv1rAr1Ve0l
	C9Fru+NnNLeoK+btY3W15OauQqOhOKpJBL43I9gHkMUDNJun6TmOJWxXOI2TapB28YjPQe22NBfWK
	4nkVvTomaVqKGYCNcrG/oMsGP5VSlGF2RU3Y3h7wd0xX5yETNm+maFeadCok2lyhK+qjNBa53rgXI
	8O0d1Fyqz2yHhPxjPedXAjA3+yoPRF/UTl0N0gJ1Wl8f1BqAkV24Oth/oejdQAa/B8Iy8QW85wOZ0
	M6o9DT8+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpD4P-0000Sc-Es; Tue, 15 Dec 2020 16:21:01 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpD4L-0000Ri-KZ; Tue, 15 Dec 2020 16:20:58 +0000
Received: by mail-ot1-f66.google.com with SMTP id w3so19883418otp.13;
 Tue, 15 Dec 2020 08:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=34KtQrwQPQdUruOS7IGSVnCyYoZ5bhkan6tsIdf2DjA=;
 b=UAQdHirfjDtnRJFT3Ml4IMNnGdGxV877QbINxGnF6x0u5DNErRgrhsAB1AwcDf0caY
 mnD2KCHg15cB9y0z11MM/odQNtpFjaW0wWqpe3JocCbi1dFN8gieCpt/Le0wbClAAI+e
 5xyJX5rBRTCfID/2wGF0cdbm3YHfKgH5FUujulatdmX19eoqsyqkUXnAUk1DlNtlA7TY
 69FRk4vpCsNTmpxOF30wl+CWIC2Gesr/wfm/FQs4WpMIKS/6UHurT+E24kRztuN3ogm9
 Vms+ooFT0pIAWDPedzvkbrzSzpRPAlPqKv0exhUz85cBlJ7tKSPdKK3+5iljV3ruNlfj
 hhgg==
X-Gm-Message-State: AOAM5319wDxk3YeZjcvAuLlZTN4jIGxzg0bo986CT049WwE54aMP3Hyz
 /MLaIJ3ljArCC92llQwctw==
X-Google-Smtp-Source: ABdhPJyfBYjhmmyDBWsWA9jqIzDpzF3wFmtV6wV/5vM6bJ5lRmDO0ZaiwF6fL3eFbbxqacgg+LoBPw==
X-Received: by 2002:a9d:2941:: with SMTP id d59mr16101017otb.232.1608049256919; 
 Tue, 15 Dec 2020 08:20:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i24sm4783779oot.42.2020.12.15.08.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:20:56 -0800 (PST)
Received: (nullmailer pid 3962283 invoked by uid 1000);
 Tue, 15 Dec 2020 16:20:55 -0000
Date: Tue, 15 Dec 2020 10:20:55 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 01/17] dt-bindings: mediatek: add description for
 postmask
Message-ID: <20201215162055.GA3958446@robh.at.kernel.org>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_112057_690456_63B18377 
X-CRM114-Status: GOOD (  17.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 12, 2020 at 12:11:41PM +0800, Yongqiang Niu wrote:
> add description for postmask
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 5ca693a..1972fa7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -37,6 +37,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
>  	"mediatek,<chip>-disp-gamma" 		- gamma correction
>  	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
> +	"mediatek,<chip>-disp-postmask" 	- post mask

Needs a better explanation. What's the type? Constraints on the values?

>  	"mediatek,<chip>-disp-split" 		- split stream to two encoders
>  	"mediatek,<chip>-disp-ufoe"  		- data compression engine
>  	"mediatek,<chip>-dsi"        		- DSI controller, see mediatek,dsi.txt
> -- 
> 1.8.1.1.dirty
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
