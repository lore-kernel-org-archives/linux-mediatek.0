Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2775ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pzyxbJayro/M9TXsSXTdNd+d231RQYEZs5oZ2uJtWY=; b=PosrCIu6WAb/4HPPg4AMNs/IX8
	rt+szhLYFtylx0wGqh/oWd+Crypp7mDKmdcIkxk5Q7v6rlDY5mEtyku987iLGcxyt7O5J3/ZgXmu4
	g5nl2G6x6DYjzgrGyqqsFFohukz2In1HmRyyldquevfDB6Nb26eIpOTcNunkUoTDdBOX0BrCIoa/c
	2P0XRojRpsDmwdvKo1VcwjZOl56nef+o3arC72ilD7yXYtWY9ZgMIacYxSLyL/VcJ8uUyWMRLuBw6
	jVZREhDPqQ3wMHdSxejWSb2bnRbARQ4qPT1GNVztZOJAywxQy4InHzRNm2pQzqjpoqLEo52ja8qs7
	cnONlzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDX9-00Ei1T-Do; Fri, 16 Sep 2022 15:45:39 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZDWw-00EhwU-CF; Fri, 16 Sep 2022 15:45:27 +0000
Received: by mail-oo1-f44.google.com with SMTP id u19-20020a4a9e93000000b004757198549cso2627315ook.0;
        Fri, 16 Sep 2022 08:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=8pzyxbJayro/M9TXsSXTdNd+d231RQYEZs5oZ2uJtWY=;
        b=eosu3c34iR8MugSWWNm+tK5oAu5H+TyYfLVaqmFC0+hJg7GyPloxRI4WLTZyHP6FCK
         Q4Oipt6ejVPPE47amVknSNwXA7Bl7MaURYiEE2nr7vb7bH7g2kbj+MO9RpYBOSPY8tHm
         JVMyoPuswyND64yT8hoZrKBV4rD6k27AsKHAgZDHnVTpkVfGB4mH6GS802Bsso3mPJpm
         hibiAcXtRoOdMRG9MwIJuFY1JZBxoqrTg4US8ZLGxgtu4ifpeSV2R+gwPDoLvklAUCG5
         uERzo/drvZaY4+FVCh3511QM8pNEaij1wnfiWlJGX19B62qLmi9RsyHgMUSrRDvxpx28
         VBWQ==
X-Gm-Message-State: ACrzQf2T1XfPj0tk45UmYkvAdltfydKxS67V4nGsVux/3PZt+Dx7lzUj
	CJOGGAEsTgFiQPTfRem1lPnquTfC2g==
X-Google-Smtp-Source: AMsMyM73orFT+ANpDhz6RWdVQqbQwjKW9DoX1c3Ywrbtrb5xiRCpmy9Zxe/Maf7Qkhx3MiTY94hN/w==
X-Received: by 2002:a4a:a9c2:0:b0:467:f2d3:f21a with SMTP id h2-20020a4aa9c2000000b00467f2d3f21amr2327219oon.47.1663343123769;
        Fri, 16 Sep 2022 08:45:23 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d3-20020a9d5e03000000b00636d4e8d480sm10030896oti.19.2022.09.16.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:45:23 -0700 (PDT)
Received: (nullmailer pid 2038375 invoked by uid 1000);
	Fri, 16 Sep 2022 15:45:22 -0000
Date: Fri, 16 Sep 2022 10:45:22 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, houlong.wei@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mediatek: mmsys: Reference to
 mediatek,gce-mailbox.yaml
Message-ID: <20220916154522.GA2035736-robh@kernel.org>
References: <20220916080742.26851-1-angelogioacchino.delregno@collabora.com>
 <20220916080742.26851-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916080742.26851-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_084526_446932_C6B05ED8 
X-CRM114-Status: UNSURE (   7.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 16, 2022 at 10:07:42AM +0200, AngeloGioacchino Del Regno wrote:
> The GCE mailbox documentation was converted to DT schema: replace
> mtk-gce.txt references to mediatek,gce-mailbox.yaml

Just squash this into patch 1.

Rob

