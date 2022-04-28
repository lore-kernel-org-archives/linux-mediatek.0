Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD56AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrXtck34W6Yc5jZs6o0kcVSlpe3+8+s769MwD55w6Ac=; b=PMZrYJGJpKJbwb
	2HySw9TOGCvvqIQ5ogbbxBtAXltqyaITh7rZJiY2us58MdKxg2Q+8X9W7g8BQLq5f1Bj94jDqlGJW
	2krcJhKiGJqMiZNYolHhTHhmx3Vpqk0u23of+J20MaIBswNmaocR8ABGf6XsZCtCYxxD3TGkjTZdr
	ug9Ay1LGiKdAV8SNGFIfXBNDZp2H+QFCkNC8+7ubN+f8umj629ORIex7xDi/GiaDVOxVmT77oNkZZ
	QP9/SVapj3I4AtFF9XMSQOhhGR9tKwgfREw2cbUqzQ7KNRnAJnvHinC7mNaT6AydOiEMaOLbaxNJ2
	adY4GRWwZNdCl5sMRiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk36m-006mCg-KP; Thu, 28 Apr 2022 12:18:56 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk36E-006lqa-RH; Thu, 28 Apr 2022 12:18:24 +0000
Received: by mail-oi1-f178.google.com with SMTP id e189so5105963oia.8;
 Thu, 28 Apr 2022 05:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AvrAp2pIkyvrhsFnFXmihXOHIOjqivUkysQhFCJ6/TY=;
 b=Dbelosw05Zg4aDcwp9EHYXBZQ/EDttBDb4ddAwQIxgPSx2yRYJycQ2OiFHjWbcGE7a
 LCgSaFzPPWqfkqCyO6y8AB5YYHZk+Qfuoc0ea1Hv12AKCjM6Anc+Ge0KPlTviAhy8neO
 A+Juh69sG0C/KxWbpns5JElEJ/emngQQc8e1WJ/Vrv+pi+PeRh7oyuwCta67L1O9Z8if
 FSpXuvHzLyRq9vdzB5VZ+XsOMWCFz5pAYatmhDbEZDU1uVPJPm81SVyL6KVvQZf4ZGDQ
 klSYevo9GV4LFnbe5VdmIBLfHzB/vK1fHxmzAKw8MbbpeJeVjeokP+eQizzJ5EQSzVQp
 ZHjg==
X-Gm-Message-State: AOAM533LbI+1VVaxvX9wxDn0C8h8AqFsWWWcznEa4HLyxD+lQCpGoT/D
 q0fp48ZInaaFKn/TEToFXQ==
X-Google-Smtp-Source: ABdhPJz5RdYfwKUkJdq1T6ujFTPXJ1ox1QGJz4/fi/sFX1cbTyqNh8f7bmsrs3RFEOL8ECJg0cOobg==
X-Received: by 2002:a05:6808:10d4:b0:325:20c3:557f with SMTP id
 s20-20020a05680810d400b0032520c3557fmr10474972ois.39.1651148280653; 
 Thu, 28 Apr 2022 05:18:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056870381200b000d6c86ea98dsm1778714oal.1.2022.04.28.05.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:18:00 -0700 (PDT)
Received: (nullmailer pid 1999484 invoked by uid 1000);
 Thu, 28 Apr 2022 12:17:57 -0000
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: tzungbi@google.com, linux-mediatek@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 julianbraha@gmail.com, trevor.wu@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, aaronyu@google.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20220428093355.16172-19-jiaxin.yu@mediatek.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-19-jiaxin.yu@mediatek.com>
Subject: Re: [v4 18/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Date: Thu, 28 Apr 2022 07:17:57 -0500
Message-Id: <1651148277.911772.1999483.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_051822_925962_041E1B91 
X-CRM114-Status: UNSURE (   9.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 28 Apr 2022 17:33:55 +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml:30:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml:40:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
