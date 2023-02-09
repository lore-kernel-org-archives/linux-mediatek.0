Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B519BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIG7XVUrEvHxHM2W2SVN/mGj6ui8gtTwgh3+jRqlHdg=; b=CzkPWoLjtGVsNIr7c47xzZhJuo
	gsnjioa2YLCLcOCSLESPH1EJDEb+NX/tED6f5Pfbtl3EVxdv/tE3PYM7nL7GH6iJGLHMzT06E1bpr
	11/dYyeHLojFA+Fwf4eURCJZyyarGJ/35sQx6Pkbh4+W3R8iTTidniy3YsesqiMSbKmnFmMqpTJZU
	neYbeW/IfwoWphFCWRJbulEWLC00bQAvdHRRkAv4/OxDwmbZc3LzBExlRNa7QFcBtDkZ7/O9xg+DR
	8ZOxAftdAkFORpNj4qAQZLA4z+GBT9jRpmSTAeOfIR/jXl7FlKniZ6/HmD5EZcPWued7mWKOdwtYT
	m+8ijuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCCO-002vpC-Oa; Thu, 09 Feb 2023 19:03:12 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCCE-002vmD-BJ; Thu, 09 Feb 2023 19:03:03 +0000
Received: by mail-ot1-f54.google.com with SMTP id j6-20020a9d7686000000b0068d4ba9d141so844644otl.6;
        Thu, 09 Feb 2023 11:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIG7XVUrEvHxHM2W2SVN/mGj6ui8gtTwgh3+jRqlHdg=;
        b=xIBHPhziboIHUgacjdx/ZGJyV28WuDcHz+wliv+928VPMiINJUbrjxJJhNJUOKcddC
         8LHzX9k0hmdjbxan2osTpmHrKC6L3kQ/hit27VM6kEXb8547PqSC8EoNh55v1ce4rAEY
         aFMxAtkkUffaEAuusBGCuiTeJv3FBTECBZ5Oldku2mMUkkZJWRV9/uEP81w9gGN026T9
         s1UVlJ8G3+4ODRQtmgBvEYQd1qZX6Mvd4fW2hBoupRpCKEQJ27xXXCS18mMQSeVzVKUb
         JFV5SrzPlVE1q4qsjNYRsUjf/Auo1I/zvzFgYGyIKSkPUXgNkYwSMDd9yMLNtyufYKHe
         +7Ag==
X-Gm-Message-State: AO0yUKUZCXg/gJaOrtjH7i26wC5mXuTpPww7CW1a6EtlBpvevjB1onGk
	5rGyBkHqlQ1wq48tKOYUzA==
X-Google-Smtp-Source: AK7set890dZ1sGgTNR93HC0ONDrNKfdkvrQ0cgzhuVqPSxNlKEotCQrIOOY1TJCe6wzGYabR5mBGyw==
X-Received: by 2002:a9d:12cc:0:b0:68b:c490:5372 with SMTP id g70-20020a9d12cc000000b0068bc4905372mr7565476otg.22.1675969379619;
        Thu, 09 Feb 2023 11:02:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u4-20020a9d4d84000000b0068d752f1870sm1065872otk.5.2023.02.09.11.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 11:02:59 -0800 (PST)
Received: (nullmailer pid 639835 invoked by uid 1000);
	Thu, 09 Feb 2023 19:02:58 -0000
Date: Thu, 9 Feb 2023 13:02:58 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: remoteproc: mediatek: Improve the
 rpmsg subnode definition
Message-ID: <167596937758.639777.17645426181511229001.robh@kernel.org>
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
 <20230209074021.13936-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209074021.13936-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_110302_407685_BF9FF865 
X-CRM114-Status: GOOD (  10.32  )
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


On Thu, 09 Feb 2023 15:40:10 +0800, Tinghan Shen wrote:
> Improve the definition of the rpmsg subnode by
> assigning a distinct node name and adding the
> definition source of node properties.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 31 +++++++++----------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


