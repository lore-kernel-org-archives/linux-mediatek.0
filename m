Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty7oNhTyANGm/T20Io2RTIOd8MheLR5mjQONYBUb9qY=; b=36KmFSa2AnO0B6
	YN/l9AD0aDKqkiSi/18OjaMuKMZGfJuq/ErD/vWqEZcpll1YXaLFu9NPryoiCfX52sKsB7zd8d9Yf
	lB1TFxLPhLoAt51hUFnl/6u3qt9oOdtqnvUpL8o7hNzspIS7PA6RM4Jy41zQmfFXBHkmOeOk6DtL3
	jLq919E6rCa1oDi7Oj4W2SAN0LMm5H+SwIgZ2lq3opbRYnbJDp/xpwVQGn+q0qBYQluIf6j/jI9RG
	eoeCKu5Fvym51I+Ml9grkIXKrW3tEHrGyqdol1fvGjkTfHHW1rHtzVeBc4ybiDfXic0y7wcxORyVv
	fdh9B8/RwnUqtV4VQulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nelzf-0031ds-Nm; Wed, 13 Apr 2022 23:01:47 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nelzd-0031cx-F3; Wed, 13 Apr 2022 23:01:46 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-d6ca46da48so3554640fac.12; 
 Wed, 13 Apr 2022 16:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=txH7G85u82ckvXFFVybqBGeBeoY60AwwcMxav7vAPMs=;
 b=CT7ACxIlnxHAD1Dt5qe1QuoAaDMfaXhYrkYlY+UtiQ9aj0vrZMjm2k+M9glyBCEmai
 LrC8TKeMIfponB5FExz93Bvzx916lTSH91sRVTVng2m2WPZDdyo+xaSMTB+ctjZwvANN
 x68UEaaH29Tl1j+t3rka7YNfK6MlJLCcsvMAsad9Tp5zwhI1vTqlNDe7NU4Ixq974CLd
 bH4P1Jq2aG2wqjMA+UOt7H1xnbCvXC3Zk7kvpssrUI3Yqj6m991jDUzAIsk0yVu0O7Et
 Iehso7oflYTFfaTuxZhFQoQXq2/fFHHzM3MgqkuFDzWkgUUDuWbYFj4WwR1T0M+4caOF
 4Mow==
X-Gm-Message-State: AOAM532YkGwRMU8K89OjLrKT5vUV6yZN7V7tzNEK6aAAbVQWYDVjYSyH
 ifEynx0kXlx+HiRHBEKljQ==
X-Google-Smtp-Source: ABdhPJz9YP5GQ32GssbCde5VKdgMKN/vXesquw2yfGhEokJ/UvibxuTxcDC4NAxtUYPVmqpjiv0C1Q==
X-Received: by 2002:a05:6870:d112:b0:e2:e609:f94c with SMTP id
 e18-20020a056870d11200b000e2e609f94cmr474150oac.126.1649890904328; 
 Wed, 13 Apr 2022 16:01:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 71-20020a9d084d000000b005e969b3f0b1sm146825oty.67.2022.04.13.16.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:01:44 -0700 (PDT)
Received: (nullmailer pid 4099653 invoked by uid 1000);
 Wed, 13 Apr 2022 23:01:43 -0000
Date: Wed, 13 Apr 2022 18:01:43 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-kernel@vger.kernel.org,
 ryder.lee@kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, chunfeng.yun@mediatek.com,
 Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 1/2] dt-bindings: pwrap: mediatek: Update pwrap
 document for mt8195
Message-ID: <YldWV4nLkXNVobXr@robh.at.kernel.org>
References: <20220411022724.11005-1-tinghan.shen@mediatek.com>
 <20220411022724.11005-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411022724.11005-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_160145_561773_91B619C7 
X-CRM114-Status: UNSURE (   9.96  )
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

On Mon, 11 Apr 2022 10:27:23 +0800, Tinghan Shen wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> Update pwrap document description for mt8195
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/pwrap.txt         | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
