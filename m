Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3386DC433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 21:38:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F9D20825
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 21:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wQP0MGZK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="uKnp0/oM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F9D20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hna9ngT8/Y7QigmHl1e7LGpJSYBK+tGor+sYolFRB2k=; b=wQP0MGZK353rlB5vRh1qTRM9A
	HhchOc4uUDQNpgTc33oqr7czshPtj7SisSXgETk4oVDsgxL1Hc+83rp4wyzoNwvdzmIBggaYWKbM4
	oaU2MhS22G+sAYCK62hOWBZAM/+8HtpOkVgaEjBGwEidmG+4e1Xvab00fwzutMKgMz7rd67vJ9Ins
	SK4eMsxmjdUEynotxB9ZzTpNjPsY5ex/GLenBQi7/t7Iw6bmCQFv6qP7UQfS5M1UftBBlAR/G0LCT
	fvHTwOwEgVtiyho5XZFKYPy8z5Cl23oaDsr9mkQGfCEpjme3WHtU+zub67cpfzByc83lWdVuhEcJq
	aQZzzI+eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyMR5-0003RQ-Fs; Wed, 22 Jul 2020 21:37:59 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyMR2-0003Qz-VT
 for linux-mediatek@lists.infradead.org; Wed, 22 Jul 2020 21:37:57 +0000
Received: by mail-ej1-x643.google.com with SMTP id lx13so3966194ejb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2020 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWgYgasEBFnUWZrjUIWCT1ojhoXmHViVids8XouBfF0=;
 b=uKnp0/oMCDGRjqyDy2WeNxgylKXxzNzln91iOTWtrAY0VYBVVVUWR1a2EfiAWWtVI8
 v1OTjF2EtY//278Z3fijbZK10+VYbawKLLic1Tmqqx4KjxoOOVVxqRVCATg3fSsUwyIb
 t7ofZ237jokeyQS0kvVe8ttokaX/ENSuFdaBLzoFq0ffHLbb1Qt50lRhVoVuQTy/RAfw
 gCstJ/1HvSf9HXfW2bRdIF9IdfjCNoOIysvFfD+ErbnSJBQsyzBiiqspHylw1B902uUn
 kP/G0c5UmM8v3kwz48wUIXJOFO84/LWDmMOkdm81g5MlCllVjOUoJ0nt+189Woji0qUu
 ZbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWgYgasEBFnUWZrjUIWCT1ojhoXmHViVids8XouBfF0=;
 b=EETB/7PmjW4X8GNs/lUBdP0Xr72fCMzGO8TJvRPwj+qM3FrTOqpSOJgiUnUj23mRdu
 agcyyDMPcFQtsG9+46FIcdiRrXMJGuJ7mKK3XCXKc3rYt/AVgHA41KSExX4Xw6kRiUCu
 XsqCmdgnFZMbGBUAgcnp+gEk5T+buOHtBRd6qA4DEM4oDJCMzxTSQ4zITCwdmL1X7Zov
 ELLj1jVjlTRLFPZknjpXrJ2lXBC9fDvxSb9QLcTANU6xD1BH7GlXWtZWvFEbgARNXHVB
 QOwWBsH61At48RWm495SArhE3mmw0dJXW4JHjrShMe0/cFIjsDfZUbY+WaPhkeNB0+Tf
 eOFQ==
X-Gm-Message-State: AOAM533t6NIkxdo06wymEExs7kGNHUdw/4pLdRJCeFDuLYkq7HCWBS+Y
 VXqV77GibrXfDVRJocpMv92C0ivWlK+yI2StLXy68A==
X-Google-Smtp-Source: ABdhPJwkLqIgPTCoHB5608wXZ6psHWtmwseZ6NAUWiauk9X2myp5Pu+p9JJt2O56dimXRhUyOo/xKJKH0O+d6MEgH78=
X-Received: by 2002:a17:907:10d4:: with SMTP id
 rv20mr1497544ejb.413.1595453875110; 
 Wed, 22 Jul 2020 14:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-3-acourbot@chromium.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 22 Jul 2020 18:37:43 -0300
Message-ID: <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To: Alexandre Courbot <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_173757_043776_107DBF25 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index b6b5dde6abd8..7aef0a4fe207 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -19,7 +19,9 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> -- mediatek,vpu : the node of video processor unit
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the noode of the SCP unit, if using SCP.
>

This interface doesn't enforce the fact only one of the two
should be present, but not both (which is the case, right?).

I hope I'm not bikeshedding here, but from an interface POV,
would it be cleaner to just have a single mediatek,coprocessor
property, and then use of_device_is_compatible
to distinguish VPU from SCP type?

Moreover, I'd argue you don't need a dt-binding change
and should just keep the current mediatek-vpu property,
and then rely on of_device_is_compatible.

Regards,
Ezequiel

>
>  Example:
> --
> 2.27.0.383.g050319c2ae-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
