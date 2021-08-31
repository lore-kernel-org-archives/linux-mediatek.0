Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA14C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B949D6108B
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B949D6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AXaql/ueisUV9hY0dTLnGf7CCZZzHUWQCEcZhn6MUU=; b=aUBK6uKyX/PGb3
	1vED4Ocnz6OQ5nfNnfZ2lT5sJEvawpHlPFD0RG6fM2Ef21LAQIDeivqL6Nbkg7gGTrCzzXQ1ij3vl
	olt0M5eOkeid7QB9vIVTiWSZNcww7ielkulTCEiRe/OH1+QDfA5hfxYGv/2CpvrbcTC4/ajNXSmvL
	uTZKAjkkFrXTFmlRGc099qtvl5CJ90IV2OhG8invFRMg1tbiD5lMOhk1zduYnBwAuLTfmSa1IW9ga
	2fbBpholSEYiZwjt76snMkWFcmLC0YbA/Km8c2MEO6MYFb6k9Ih0ugo7Gt/nnIqGKCqFmF2H1x25t
	7R+uOJZec1K1cZFpiwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL8sZ-002wuB-4i; Tue, 31 Aug 2021 18:53:03 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL8sV-002wsw-1D; Tue, 31 Aug 2021 18:53:00 +0000
Received: by mail-oi1-f174.google.com with SMTP id v2so408603oie.6;
 Tue, 31 Aug 2021 11:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GaISQQcUmH3yFJZK19hxSWvQKue1oPZpb+E7tciH02Y=;
 b=JoUoM1SrVkeXy6hmE3HymE7AI9RdlQ6pIUP67VDnlIVc79lz9wSmZdEkq9zKmCwG8J
 YO9aw3gqaDd1DsFZcPkk+C01dJPqSRXbTgDssTla95UtUmYzmoQGV386YNbCYFk+Z1Hz
 xKE0iNH96cLk8ACjG1HGjUYYzLmuCZ6C4qtx5Ythp7SRRgYJehZCHDQXIStmmr0eeHE/
 khgswTBi5YF5RtlsMSyOnaKD3Na7YJ3RGTMw5vj/48O/ihD8VHPwO9fmAiRGMmT+nr2M
 5iCCVS7eMS7iAhpfAof5EyjoMms/hTAe44F03KRsp5Uyh6BZl7y6Nzqmx0mWXnVrPZ2+
 TNWg==
X-Gm-Message-State: AOAM530NJtTY+OVGE7j/ufFNlDwQtL2kEoCuZdmkTkK4JNYglyngUPcb
 Ire/tVuUmezZN1DHMKJs3aLqYSaweQ==
X-Google-Smtp-Source: ABdhPJygcfOd/qjKOVhQVKqkAkEAqQWY71ZQpai34B/CzPJbh/oTSTdmC6yWvPldPEsDQdPHWvqTSw==
X-Received: by 2002:aca:d06:: with SMTP id 6mr4253337oin.105.1630435976319;
 Tue, 31 Aug 2021 11:52:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t1sm4027098otp.9.2021.08.31.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 11:52:55 -0700 (PDT)
Received: (nullmailer pid 466339 invoked by uid 1000);
 Tue, 31 Aug 2021 18:52:54 -0000
Date: Tue, 31 Aug 2021 13:52:54 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: mt8195: remove dependent headers in
 the example
Message-ID: <YS56hvQHAH/zD/dD@robh.at.kernel.org>
References: <20210831083956.9804-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210831083956.9804-1-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_115259_120375_B6C569E4 
X-CRM114-Status: GOOD (  11.99  )
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

On Tue, Aug 31, 2021 at 04:39:56PM +0800, Trevor Wu wrote:
> Drop the use of the defines including clock and power id, so that
> we can remove the headers which are not applied in the example.
> 
> Fixes: b5bac34fcfb4 ("dt-bindings: mediatek: mt8195: add audio afe document")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-afe-pcm.yaml        | 40 +++++++++----------
>  1 file changed, 19 insertions(+), 21 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

Please pick this up for 5.15-rc1 (or don't so I can).

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
