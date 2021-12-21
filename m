Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6Phlq4XP0JL5Hv8z9DgAulmeTmrjKkdiTc1jYro0Is=; b=Mw3zudCDNNOGY0
	75famxkSth6NSx4W46AgnxoCyM1XOiN3rUikVOmh4QbCTzQ3whzO7hdd5wpTkgvTfy4AvpsQU7LuR
	LnFKYBYF/2SQn7ai2oQ8r4OcOyTTzgFX9musxJzkjUJstzTIw7J53Qyat8iYzHZauP9oxGYxQsdhs
	xXicVB5Ll8UbASkLnThzVgQETQ9hxCbQzIINDad1U8VfZG/pLImXt9LVs5/aFKi3VoHiWRk8sSD8U
	xA+ASTt69xvGSnSTeHOy6BhfpQJOhevV2glto9GsEsYqlHbyNuXIjxN8CEwsY6I0WpPmVTycYe0X6
	xxn3XS0zOcnKs7M0Ntvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzl7e-008Isa-61; Tue, 21 Dec 2021 19:48:30 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzl7R-008Iov-Rm; Tue, 21 Dec 2021 19:48:19 +0000
Received: by mail-qv1-f44.google.com with SMTP id kk22so319766qvb.0;
 Tue, 21 Dec 2021 11:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEEn7W+abTOSJCOoEABxlh4oQei3MK0PGB8mi7Ij2yQ=;
 b=eZAL/U9JQmSi9r4OQgDi5fLpqj6MGCCAlh41EX+rI9aVU8lgLEI+BnLzp6MeGaIrHL
 5E/6MNp6zNBmiU9tTqOBOZ3TEITTMOPyPreQqGieR8i1tEYPJ9S0n7MCeB8hcYfS0oZZ
 jK/TMxRAaaHVF0yiFliM/mAcb0TXEIyV/JqH5zlMR2qDp+9AgMfUWnHZRRY8KlmlIMo+
 ytLt9fkLy8iDbbxY7Etr3w2q19k6uTz4GdIlAkdoPY6InUXeUHhG8eambLMIi6y/xr/a
 KXcj5XF+IfR8QqSfXtg+1S5BLZeVqg6h9HFELNTYY9xWnatYe1njAr2qE8noDwaACiK9
 gtwA==
X-Gm-Message-State: AOAM532nmkJDE0NTWF/scBKSkRxGA7UJbcOAVfuJw4Ie0zUPeSqsXUt9
 Mnxw4GkKaD9dsrf7+V5Qbg==
X-Google-Smtp-Source: ABdhPJzgmDHlA9Zo+gFHuOAv5btwwZK7lHQ8X/OVnBRyRkKvS/dXMCrGDSok0rkg99yE4yk7Ag3u+w==
X-Received: by 2002:a05:6214:2345:: with SMTP id
 hu5mr4013203qvb.130.1640116096424; 
 Tue, 21 Dec 2021 11:48:16 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id h13sm18492494qtk.25.2021.12.21.11.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:48:15 -0800 (PST)
Received: (nullmailer pid 1635267 invoked by uid 1000);
 Tue, 21 Dec 2021 19:48:14 -0000
Date: Tue, 21 Dec 2021 15:48:14 -0400
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH next v2] dt-bindings: nvmem: convert mtk-efuse.txt to
 YAML schema
Message-ID: <YcIvfkynRGRqQR2X@robh.at.kernel.org>
References: <20211218081515.4971-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218081515.4971-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_114817_918882_56782807 
X-CRM114-Status: GOOD (  11.06  )
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

On Sat, 18 Dec 2021 16:15:15 +0800, Chunfeng Yun wrote:
> Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2:
>   1. remove description of subnodes which is covered by nvmem.yaml suggested by Rob
>   2. change the example which is commoner than mt8173's
> 
> ---
>  .../bindings/nvmem/mediatek,efuse.yaml        | 86 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ----------
>  2 files changed, 86 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
