Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2459AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=na2b+9PQwVkN9q4O0R0VRgk4/bLVI/N9xU6Q5sRddNA=; b=bJsL0F0UWr7PnH
	jOMXCU/yYtK9aD0whapq5xD+fxY7LWOTTVkOZ7VaDDa/+BUAUsjWQxeQBn5Mkw4MWefWsanDz3H1o
	Dy4rT9D6Q5wajSPTPHheAhBnoYVQxHzl9OmqlWxduioWJdWHSkv1TtN9+xVWY8Hab3UPJ4c7FN0I+
	zkmFwqYV6SqujNhzZMPHRKfaWyjyNjQqiceDpqEOJiPer18rkQp0FsJOsmo5zkW+IcHfnuzhXW6S7
	x9S7oY9O5w2ZxliAXoTpKYc++uSunHCmM4eviCalqKAvS5qes8PkC1+GmCIOELVrhoVoI6la+0yyq
	d7g2YHX+EodvyPz3ezYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkzZ-003QUx-Nr; Thu, 02 Jun 2022 13:36:01 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkzX-003QSi-9P; Thu, 02 Jun 2022 13:36:00 +0000
Received: by mail-oi1-f174.google.com with SMTP id k187so6573920oif.1;
        Thu, 02 Jun 2022 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1e7vrj+7vWIZv19NYkOjmP4n2WgkFN1YBD1LvqayGbs=;
        b=h53p2RYwVJ4tHT3gIQV8p3pfWxynb90HJAHmoEuU6i4pQtDb6DvEkT0+h6pe28TO0Q
         lp4+R9XFnMM6PtHeJ0IPs6SiVz40xMCL6bCn7NAhpFlw3hosThjvG4EEb8BGlV4ciyrk
         BRw/czYDchdDAv7e+M7/WbyFB8lQ4VuzZR0c83riGSRy+NyzZeTSpp5oIjbCeHPSaTEe
         mF/ZOUjtya/g6/NSjURQ6J1KMwuXXqQkavJWg0fIDuSLhh3jEI3wSpOCVQjhtBmFg5d+
         5mbUIUwz47yKh6Loh+Vgn2tfeGayGyNerktYaoTYgSOHRlBNLyJRLtRe8MxY7Be957lb
         z31Q==
X-Gm-Message-State: AOAM531aUm64sXgh/EFdbzH36mCndiZfyAj8DE/1bNg0ClzSmnGn/FiY
	DBKbQ3zQn0FgEH3KIxMZhw==
X-Google-Smtp-Source: ABdhPJw6a8FuQ9JaLsqEzJHEmn2bKk+7WmqtRJ9dxbKbk2AHD0Zmxl5oga/5I8UwAGxardvLDEfNEg==
X-Received: by 2002:a05:6808:bd1:b0:32e:431c:2c4f with SMTP id o17-20020a0568080bd100b0032e431c2c4fmr737749oik.269.1654176956472;
        Thu, 02 Jun 2022 06:35:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l16-20020a056820031000b0040ed6225457sm2196143ooe.47.2022.06.02.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:35:56 -0700 (PDT)
Received: (nullmailer pid 2162006 invoked by uid 1000);
	Thu, 02 Jun 2022 13:35:55 -0000
Date: Thu, 2 Jun 2022 08:35:55 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, trevor.wu@mediatek.com, tzungbi@google.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, julianbraha@gmail.com, Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com, aaronyu@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v5 20/20] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Message-ID: <20220602133555.GA2161972-robh@kernel.org>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
 <20220523132858.22166-21-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523132858.22166-21-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_063559_362662_FFA74B72 
X-CRM114-Status: UNSURE (   9.18  )
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

On Mon, 23 May 2022 21:28:58 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
