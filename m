Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E68C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB8E6109E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 14:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB8E6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha2IPXJzIkaHQetZEvV/qh0XHfvhT8BOFMPzfOBjtyc=; b=NuEMOkvBWZkDHC
	kEHyew6RT75+cZzgVWUqhVycKrNSdsc5tRIo4/LjbqN+b/5e/i54RPfQW82dXL++vcGAjujQZllcu
	mfOgmbP+VO083lB9yNnWtQUu9Memfyqqu5P389PsyZGYJEQ1lw3SwFs4JTcQvieXCshIzbjKuzJnO
	zb/j8NGAW+yvADLyMR0hZ2OY3kIyH0uwprPYImVkIp6ORt/2nuQb3YzEyoXgR4mBqrzSMGIW4IcM/
	wcfdP9n0TD8SpuZW1S+fXmIh9ynMB4r0zxQfZ/+7QkzqMbnFoQrzh652g6eAY15bB1hhNC1Gr3yjq
	tNnlGiRHFTQvLAPwAd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1lb-003Sd8-UH; Thu, 14 Oct 2021 14:31:31 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1lL-003SXG-1q; Thu, 14 Oct 2021 14:31:16 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 o26-20020a4abe9a000000b002b74bffdef0so471208oop.12; 
 Thu, 14 Oct 2021 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4cNofa+G4dhjMSIDHBWRSxnSxUlK6Lt3DNvniT5Wl2Q=;
 b=EZdMUcc/M0fIzl/+cg6RogurqyZMCZ/0uP2QSGr892g3uyhQ+GwPWATeNM861LNQTq
 elGtSQwOFe5cVy1E7JRRTF9RbM0rU210QjaTdSj2mlTRHpiu5zdMxLNj3UGvzV+Kn06f
 p9Bpqx6YVBo6vTiabwj0eeIvgXB7cB33WWlEpKqi5SHjJPRX4HCYMjSo+BcJDTOiOh0k
 u2T6K/MYlgbFFwLjkhfrdhEvWLKNKcWjzHYK1lg2Lcq6jmjSonRDsihoLVD+10bd4VlR
 VSroOMdsI5V4sLAhwFTTb6HeRiSmWVN9TBUlMOEt2AFUXnjBScB7wfpx681RanyoMOFp
 lQ4g==
X-Gm-Message-State: AOAM530P7Ps/gdZquHJmt06DhAZ+S7BZ5qo+XSz10210s6jKvpIMa2vW
 Wrz37zh32JeDoQrfYPONtw==
X-Google-Smtp-Source: ABdhPJy9Rh4sKWGiPLtzJei6nJmXJAXjFDgOaH5xk78UYN7aJpCxe7aso4p9zzX06/Ktp2RSAaWvIA==
X-Received: by 2002:a4a:a38d:: with SMTP id s13mr4345196ool.60.1634221874182; 
 Thu, 14 Oct 2021 07:31:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e1sm664619oiw.16.2021.10.14.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 07:31:13 -0700 (PDT)
Received: (nullmailer pid 3295877 invoked by uid 1000);
 Thu, 14 Oct 2021 14:31:04 -0000
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@kernel.org>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211014075836.17681-2-sam.shih@mediatek.com>
References: <20211014075836.17681-1-sam.shih@mediatek.com>
 <20211014075836.17681-2-sam.shih@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pinctrl: update bindings for MT7986
 SoC
Date: Thu, 14 Oct 2021 09:31:04 -0500
Message-Id: <1634221864.165084.3295876.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_073115_126829_51157458 
X-CRM114-Status: GOOD (  15.34  )
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

On Thu, 14 Oct 2021 15:58:33 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v7 : updated pinctcl node binding description, and separate pinctrl
>      part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/
> 
> v6 : fixed yamllint warnings/errors v2
> v5 : fixed yamllint warnings/errors v1
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 364 ++++++++++++++++++
>  1 file changed, 364 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dts:52.36-57.15: ERROR (duplicate_node_names): /example-0/soc/pinctrl@1001f000/uart1-pins: Duplicate node name
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dt.yaml] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1540821

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
