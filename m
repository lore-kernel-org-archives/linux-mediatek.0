Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B07C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC976120D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAC976120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceKnm/CXR8ZmDgjPsyweqZAt0AE5+qFL4zqTVfcG2cY=; b=0qwu6V5qNQHGTG
	2VaMy+kqJT0lIjJ2r/i+3GKyu+BpiZZ7GTg68+KLiA+rIHGbZTtl/fV10UQk1TKEpiXeohqVhhOXW
	/k7WlPUWrMbOsYtisXosARBbxrJDvZ1i/UrtleQusSycuAHkwaZVu3mObgakVdYpxfRyCqIv8ncTM
	xRnnJF0mFxP9zJQE6LyB1y38qLM9R/0JlfmerV4pzzttPFWChTWtnvb0H66rV3zmflt8Mp6QhoYHK
	iqdzmog5QlU/2nMYmfOKZMEq4iqWD5NvmZ1la53/fgH3dkyr/PwHWs3j9OQUwi6UqhGXRs47AWxDk
	gfCFhErWgcaqvhqQksLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzjs-00Fh3u-W8; Mon, 08 Nov 2021 08:10:49 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzje-00Fh0q-Iv
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 08:10:35 +0000
Received: by mail-ua1-x934.google.com with SMTP id i6so29795880uae.6
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+1TTlc9xwZih44a5849v2x4l1vXCAR2nfrUVYgiR3c=;
 b=PmgnMxI87YGsl4UDOvad3MIkBRLFuSbvFbhEvWiqMEulobgpBUjzQ7qsNZFB7TrLfh
 q1Y11AwMECJi3upYjA/iXxZkMCON+W85LdpM5bE5WZj7r23xAr2HNJAqTnlNjQPFKpQh
 H/mrBZjX+BXA5BCvK35sRbvQ6mZP6u/Em4gxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+1TTlc9xwZih44a5849v2x4l1vXCAR2nfrUVYgiR3c=;
 b=VLirN3dqA1yaZTYt77xZMNlo9d1ACN1c0mbdReH46B+7N6w3T7/1v31oKhzeRuBOre
 h3tkx3A53kQmPHZ/NEEPpPiQPJCl501rKWbODeQI8C/gZ55t2OkbXjHoR6GDJCCFUWny
 WLL/dIuq/tJOLhhMv+HAF/yFG797ktqMLybmMZ+x9vKlmiULjuTgRWsFd/VTo2GTX6lr
 ehrlDWAdeZ+uIJjwVaUrVcZ4HpDjumvZcea+paCP7ikH5xfcSA6CERgPhvZRttkUM0JE
 WdVzN7bR6OTeFHo6eD6E0RIRaxzbyLAS9hld4cMGSKvZA6fEat3J4krqAY9pYj8S73l1
 tx7g==
X-Gm-Message-State: AOAM530zU/wphwCmIdDsu8xyz5Rmiwpv4OInNLRNlaG5P2dhgvzUK4J0
 iUbt2PAgvlM1mM6fSHtBId/5XQLmfgFhxPZY4DEJ0Q==
X-Google-Smtp-Source: ABdhPJypn5ldFm8d20a28vAsb9VgMeCgEt6OtSsBAo7c+Ifjy+KvBJxcPi60jxce+NO+Q0J7RZ8/XR0P2goqB+MHtQU=
X-Received: by 2002:ab0:3154:: with SMTP id e20mr90919214uam.14.1636359032861; 
 Mon, 08 Nov 2021 00:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20211108072711.1628566-1-hsinyi@chromium.org>
 <20211108072711.1628566-7-hsinyi@chromium.org>
In-Reply-To: <20211108072711.1628566-7-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 Nov 2021 16:10:21 +0800
Message-ID: <CAGXv+5GD7KU4i+P--6RShhMu32Rhf-g6SZF8SRDscc4XEG4QrQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_001034_648137_ECD097FC 
X-CRM114-Status: GOOD (  14.92  )
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

On Mon, Nov 8, 2021 at 3:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Add sku22 which uses different audio codec than previous kakadu board.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 99e7f8e294cd03..da5f9ecc1a9b37 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -161,8 +161,11 @@ properties:
>            - const: mediatek,mt8183
>        - description: Google Kakadu (ASUS Chromebook Detachable CM3)
>          items:
> -          - const: google,kakadu-rev3
> -          - const: google,kakadu-rev2
> +          - enum:
> +              - google,kakadu-rev2
> +              - google,kakadu-rev2-sku22
> +              - google,kakadu-rev3
> +              - google,kakadu-rev3-sku22
>            - const: google,kakadu
>            - const: mediatek,mt8183

This matches

    "google,kakadu-rev[23](-sku22)?", "google,kakadu", "mediatek,mt8183",

which isn't what you want. You want:

    "google,kakadu-rev3", "google,kakadu-rev2", "google,kakadu",
    "mediatek,mt8183"

or

    "google,kakadu-rev3-sku22", "google,kakadu-rev2-sku22", "google,kakadu",
    "mediatek,mt8183"

I think the following is closer, but I'm not sure if nesting "items" is valid.

items:
  - oneOf:
    - items:
      - const: google,kakadu-rev3-sku22
      - const: google,kakadu-rev2-sku22
    - items:
      - const: google,kakadu-rev3
      - const: google,kakadu-rev2
  - const: google,kakadu
  - const: mediatek,mt8183


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
