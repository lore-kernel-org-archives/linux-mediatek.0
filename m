Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DF0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZbEdfjZqlR9p7WZXBGcUNYD3oGjr/aaLxnnWBHvFoU=; b=ealFtINKJhPY33
	nWD+wmPV1HtawxvQ7ke8S7nIVImeYUI0DR1TC2yoDTyOCf+mo/kINQbsZSpMRFZAJQOFPh2yLSE4F
	J3aMlBT5F7C5GlvmOpFgGe/zn9UPp1fYvEAWQx93zppWb0zNVi4B0/sX3/ISJZutuI8AhPpdHtUar
	N8SIEj5JKahFP3Uzbcz5R7ojzXI3SEdHbc94GdNOZL2ON46s4DxIHsWGhh9mn3BtVkXPw8TD5nEUN
	kEdoYE/Nx5m/3VOUNfWoyNo/Qu1K4cMnBXrljQaUgmsk8QHNnBDhve/Ur3J1MchQaIZYlwBwSLIZe
	NSiCOezz4Jwolbhr0eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Sfn-000fB4-6Q; Wed, 12 Jan 2022 01:43:35 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Sfa-000f9e-Tt; Wed, 12 Jan 2022 01:43:24 +0000
Received: by mail-oi1-f175.google.com with SMTP id w188so1460363oiw.13;
 Tue, 11 Jan 2022 17:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/Tnb+6NC4NDoEen3QeGtmshX2VZpftcd33BR336ijw=;
 b=jcNNeOgZ6aY7Tugha4qcEFaBwszakiG1bha8Xh6V4fTp0RV+uLyqHSIbqB8aMKJtg6
 OCQQlYsJernetcdIpraiIQKd7VfCT4AqCQ2yBdnF4WBvTkmrJs9GyjS04uZN2mvL+urW
 knqH/5CzdMKgOS4tgezafCYi4/iuSmul7w6ANyzdLN0eaWtaeHAL9gxQGriILtsL5U70
 8NI1i64SGbW2/ZVWXbm7UBlnfY+AeJ2Zu3aFgKWy5wza9XFhqJxAVV+QXXpf9MeY9b/L
 WB9FjtYfQF5xBs3SkcLRLYFVx5JRGcGkUL5I1mBNhKvsco96siWDEnr0HJ20CBi8ulQN
 /q/A==
X-Gm-Message-State: AOAM531fw7aTt2BikYHgGLZK+v9Fu49K5A2XAsTixapTlI1+BMsgk3ZF
 ePlDCiw0EgDUtOb4n2BI7Q==
X-Google-Smtp-Source: ABdhPJzJTSFUtdEQLZAtLeh5H43ctftwk1Z0EICg9ZlaMpQR1Vk4Ah73GP2ShCBaFZnQGsqfer37hQ==
X-Received: by 2002:a05:6808:2113:: with SMTP id
 r19mr3759580oiw.118.1641951800511; 
 Tue, 11 Jan 2022 17:43:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r30sm91841otv.48.2022.01.11.17.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:43:19 -0800 (PST)
Received: (nullmailer pid 3887562 invoked by uid 1000);
 Wed, 12 Jan 2022 01:43:18 -0000
Date: Tue, 11 Jan 2022 19:43:18 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, daniel.baluta@nxp.com,
 trevor.wu@mediatek.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, cezary.rojewski@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106064847.15588-1-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174322_994708_12761D3E 
X-CRM114-Status: GOOD (  13.14  )
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

On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
> From: "YC Hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v3:
>   Fix patch v3 error : v3 only provide difference between v3 and v2.
> 
> Changes since v2:
>   Remove useless watchdog interrupt.
>   Add commit message more detail description.
> 
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
