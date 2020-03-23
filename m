Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85141C4332B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 22:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49DF620753
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 22:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gO0SgScg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49DF620753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gS6PSUpW+7DkOEtRmi1cdjhVXpqIz3fdWB09qHyVKCo=; b=gO0SgScgsqSQud
	CNB+Rc0rUlgn100LYczS06EnmqMpKfz6mMICypOdUTQpI++4/1VnkvubxT9LfyrolKZ+KEICmtDSJ
	S4bYluGDgNRFq6SkW+tmYFB6LsB6oZ8fJJokeYMDyCCCBG/cHA9iEyexW+Hoi39UkZ9hBYbl/IUV2
	/oBfaxIpOm6fRdPEHtjdUSRpWFkNRdak7QG6wJ7amZ31ZqiSeGqIXqfEckZjjMNECPB2Lo0Zn2qJ6
	aGTP75UxhD7aGtBfk9Ni/JY3iXK0As9U21q33k4Yj/gvo8bSCecnr/7KMcyQXAu+Frn6v989+mmD0
	o2e6qNaTtUoduDWKNDLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGV8J-0007bc-Lk; Mon, 23 Mar 2020 22:01:19 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGV8F-0007az-HS; Mon, 23 Mar 2020 22:01:16 +0000
Received: by mail-io1-f68.google.com with SMTP id e20so15671780ios.12;
 Mon, 23 Mar 2020 15:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=moatfj5jRXvxhlq8xo+ssOSqLVqKCjMat/spioxEHRQ=;
 b=UhrdpBqKtRGTBIlEdAOmI0ErzBZzL0ocXR5kAQh7KTwt/sYliqZcSS/teRcVUSvJhh
 ib0v1CFArg5X8x3bhc3DIWzTfhUM43Dd+Q69gai18ps9oe/QcgvOcHGP34NlBUdgzM7x
 nX+TrntFOslF/ZjHwmeiFuKW4gsmFO4LLNwKL7eSlUY1VnvbPrXBEH+dSbE/0RH576BP
 FLaoL8S8O4SmRYIcCdpDtwqvt++0XrawFSs3ir5SeGikJl4sl1yd/7zxTp8v/pZ5BcLR
 IicWSeH5e1U3s0UeWZM5oNZd9pvMjdZEAD+QcAcUVrODAdlflWJd+6ih2dv8wVSmmtmS
 2z7A==
X-Gm-Message-State: ANhLgQ26AJjAyIYmZCL3Nc/iQ7Ac0e1qo2XxAUhPpx3ZFWDhhmou7f0f
 XibY5DJDvJf9zaLWQdd28w==
X-Google-Smtp-Source: ADFU+vs3cAIQeBmF64VbdwUuHkyB7YPqQzyPHXQtO+XeMGCPFEMA01amQdtzhjE6hL2OYktO6iZcHA==
X-Received: by 2002:a5d:9f4f:: with SMTP id u15mr20642459iot.87.1585000874691; 
 Mon, 23 Mar 2020 15:01:14 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p70sm5645056ilk.53.2020.03.23.15.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:01:14 -0700 (PDT)
Received: (nullmailer pid 11664 invoked by uid 1000);
 Mon, 23 Mar 2020 22:01:12 -0000
Date: Mon, 23 Mar 2020 16:01:12 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: mediatek: get mipitx
 calibration data from nvmem
Message-ID: <20200323220112.GA11622@bogus>
References: <20200311074032.119481-1-jitao.shi@mediatek.com>
 <20200311074032.119481-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311074032.119481-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_150115_575967_E8A81FA5 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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
 Jitao Shi <jitao.shi@mediatek.com>, bibby.hsieh@mediatek.com,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Mar 2020 15:40:30 +0800, Jitao Shi wrote:
> Add properties to get get mipitx calibration data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
