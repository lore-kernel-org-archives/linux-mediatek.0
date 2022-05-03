Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE96C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNBhl+cX0E65qANptEzRSf1kYzMDNxkp7T8q6OFJFGE=; b=ega79mstSBpvNB
	dCjB+asgbZfhySGU3qWvGGxVMuznywyG9lf8079i049O1vJ0Rt2MnKCKjLLTutnb69+JRIgXO0PdR
	moVYr73rX8UCisdIHwRjDyQ2OmPV9dm+OdBedT3rjgl0lKlEY4gBHajV0dHLBFp+vdEuDRHA1VwHx
	p7y3+G+SuCrf4VlaIUmrtKOELvVynCDak7/xQvu7EGj+ZgYHRIcAET4yloKKqDx7+IlJJeDZSlnTl
	Ld/UAyJgWjjFszoao9+nTWKWDQtFT4hcBU8fXubKRFfeQam7DGfbBC+1TKx2aXASvVixjxdnhL5Q+
	MogBfLteiKJyXHxHA8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlyDI-007ORZ-BL; Tue, 03 May 2022 19:29:36 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlyDG-007OQs-Na; Tue, 03 May 2022 19:29:35 +0000
Received: by mail-oi1-f180.google.com with SMTP id m25so5305802oih.2;
 Tue, 03 May 2022 12:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N6FBWOVMzK5yNDB3jrOFO2jTg3V4GRtMSkZ1a8GNUMQ=;
 b=yjXRKqJG1QrkZiCvYnx7YFXr/OSVu9oMQJbcpSekXufs1zQj5DvvOYs4ifwaJPCB4l
 U7NS46wJgO12I5nDnl409uIrHXsWfooT5a4+iSQbErTP1LXIy9e+8Xh1EWAm3FJF47Wo
 P7ncUI7y9XqmCL0i8pcRq4GvqFAtenoTFH4mlBPIT6IjQnURH9P56ZuGjS5U3LzXhg+K
 26IJkCAz9x5EAMfn16Y821pDDOB8qa2YGEbgp4X7e+5M/9AC3JIHisnuM1ZKle4+UYaa
 OnzQFrhr3P9EamFAaWrZPhsHK8SolXxGihiFZGy5uK4GfyEztoUGiamLHJssEkYHTKTB
 4IaQ==
X-Gm-Message-State: AOAM5318X2psI6NL/wWQ6mIAt6Zh7a3iin5yzpG6dNO2BzZWJlwRzEeK
 Vt9GCNA1cvBlB0gp/ViXIQ==
X-Google-Smtp-Source: ABdhPJwHStHNylKAW5q1CVdmc/nFF0J7q1+CmHjl7uJiGrks+Q8zBnDcOHfO7bLb+qwWjN1Rxd07PQ==
X-Received: by 2002:a05:6808:1a1d:b0:325:c812:496b with SMTP id
 bk29-20020a0568081a1d00b00325c812496bmr2515687oib.106.1651606172384; 
 Tue, 03 May 2022 12:29:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p203-20020acaf1d4000000b00325cda1ffacsm3617063oih.43.2022.05.03.12.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:29:32 -0700 (PDT)
Received: (nullmailer pid 4088847 invoked by uid 1000);
 Tue, 03 May 2022 19:29:31 -0000
Date: Tue, 3 May 2022 14:29:31 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 julianbraha@gmail.com, robh+dt@kernel.org, trevor.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 aaronyu@google.com, angelogioacchino.delregno@collabora.com,
 tzungbi@google.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Subject: Re: [v4 14/18] dt-bindings: mediatek: mt8186: add audio afe document
Message-ID: <YnGCmwNRZst+W5nb@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-15-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-15-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_122934_801873_57086F19 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

On Thu, 28 Apr 2022 17:33:51 +0800, Jiaxin Yu wrote:
> Add mt8186 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8186-afe-pcm.yaml        | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
