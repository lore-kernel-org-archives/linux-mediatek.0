Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58426C00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:17:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B7C2151B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 19:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZmzdzt+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B7C2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rFFRn1ASPglz6uAVVCWG0JxJ0cyqJ1LgbAB8qEldGEM=; b=rZmzdzt+vUeUtGnVO6FvOZ0YX
	natZekiutF2eBgCMhJOKWEvN0uv0Ux2TtjD5YL9iOVDAuPG3Hk5PIst/rtUVShlsCqUn4n0r+5giO
	J5/JFga0o3yfkeTB9natsFTCmURTn9LCN7mBaRBNT8Tt2yZO5jqIC12QD0HoJkgWdqs9xiqs+ZrG3
	Tsg1IY8JoY9phgWIULS5n+76TRIbxzTG2iPhKbiwYhQXbpsz4Fgl60J0zFfAzqIRlbv01dxwRB8js
	aJV6nDTj1RWQVdnzzVZtAMnviAR0X0NPHI+N4q0OZxT3ezVvUvQ6E+9aE47/5URdguG0xpI3QRfQs
	fzFxtwcxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZu6-0002RE-Cx; Fri, 30 Oct 2020 19:17:38 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZu3-0002QH-Ua; Fri, 30 Oct 2020 19:17:36 +0000
Received: by mail-ot1-f66.google.com with SMTP id h62so6524775oth.9;
 Fri, 30 Oct 2020 12:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EdL9baVv630hTUqWo6OvHJipP30+abrcAYUdSdJVn1o=;
 b=lDD+z5hkSqiYuAjAGOjFtgkE9B4zotIROOi8AAWt4v39md4tSCsExbbDqt5ZuP2jyK
 2WNXp07tNu5zPHR9q69zgcbA59fR176EDAuI9vp+2PhD/hzPa2QzLGbbw2GYpiAE05w1
 Fh65mScX4wEUz5gFqUOYZItka0HWeFqKXuyXJU444WmdVdDMhgyMkMq/yBCKLpFPZPfQ
 Vcn4E9nHWyJoDAIakY/E8dVL4R/ufNEZoF/QTWKkAk7YY/P5IoyLZLm0JV0iHupQp+ks
 F42wxbMdYcioP8VIwNaAdGkdqioHoF6bR7AH+WeLNALqQyH0J3Z/XQtjNf4YcWPb3u/s
 qz8A==
X-Gm-Message-State: AOAM532eZtmnNjr2vWuvbDEQhryBGsaHnqazZXTYGbzwEI8uA+KA1Ifr
 LLgDn/Qvqm3M0Jkgcj609w==
X-Google-Smtp-Source: ABdhPJygR1SjnNx0pgftEfYieev15JjQRggZxKmOPg0emitnERRGW8bHgSTq1z6YGe70Flv8U3k20g==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr2776914otg.236.1604085455157; 
 Fri, 30 Oct 2020 12:17:35 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q8sm1461462otf.7.2020.10.30.12.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 12:17:34 -0700 (PDT)
Received: (nullmailer pid 4172199 invoked by uid 1000);
 Fri, 30 Oct 2020 19:17:33 -0000
Date: Fri, 30 Oct 2020 14:17:33 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm64: dts: mediatek: Add
 mt8167-pumpkin board
Message-ID: <20201030191733.GA4172169@bogus>
References: <20201027194816.1227654-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027194816.1227654-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_151736_002531_F9EB0E10 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Oct 2020 20:48:13 +0100, Fabien Parent wrote:
> Add binding documentation for the MT8167 Pumpkin board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
