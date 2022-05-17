Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C33BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbsO26MP6Z43ICSrlFD81KW3/kezloUdL+XLjU8iYe0=; b=fgrT1w4jOVEHxv
	93oX2A4aRGNB36vAO23LcCITeM2KjayjuajOXbsPXtmPZ9VGmF05HzAPlYSe2rT+ISv5rwWJ0iKyf
	828lFzZRmlJjuFMb3N0e6NZW8OlWDgYn5Wye9vjRfplOst95LfbY4i3h0Zg9eNzS4lBcr17uNny5X
	QVnZNRZrkD5n5wqdEjV3J6BKDnVkv9bL1q5aOSAyOoPbJj+8yXjCSDwkRlBBB4giV7HvwKSTx0LyV
	mfqB4NpCx7opB8R49SrUHxGw/UOm7QfTtZ2giK2gmchgFeNxuZ6KKI0y7juHig6f2QB+ofZgRmSc2
	UUsuy3gZd6TOZWetPQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr1OT-00F7NZ-Fx; Tue, 17 May 2022 17:54:01 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr1OR-00F7MA-1i; Tue, 17 May 2022 17:54:00 +0000
Received: by mail-oi1-f173.google.com with SMTP id e189so23200252oia.8;
 Tue, 17 May 2022 10:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YsDesghEDI/0tS5NHJX5qsEzOQ4O5WyEDYrAlt3mmLs=;
 b=XyYXYgdwQlaTe6jxqrEe4I1rDil6NLw8pvIcadjcAKKaebBnXDJY79lbiCeE2Dtjq9
 6OIRLYRw+MT3vte0UMSfNfRgLz5j+Sx4Q9VaRYp1iJxgPgHI46Yg2WCPOuwj2AVH9VqB
 F6TIkNmAPIXTt4bC0a/kdUGwMFHfEH8NsOyeQcwdilE0Yz4KFLnFdeOsaUVkeGBORZX7
 1maXKQ0yuNgAbxM6bB4jb5iJMzeGjh4/5nejgff5eFTJW9RGOZU3WzdJO5oxqAdFJcwT
 iOEFRyQyfvgQVIrLBk+ZsKfPBFAfiNhoH5O8U8FRO4BKsnR6Hs2GCMesl2iKGgJDOJ94
 9D3A==
X-Gm-Message-State: AOAM530Sb3sounhMJuxEhgCDm905GjFoyoeETiwroh2RCiwH1yl0W82m
 /lN3Wel97+6bk9iTKRZW4g==
X-Google-Smtp-Source: ABdhPJwljlblhzDw8zaW7HVqTSFpVeLgpJoxWDJdz7BuwXhztpSN+kRl6+3UUY5tJXYbETz/hauMvQ==
X-Received: by 2002:a05:6808:1302:b0:326:dbcf:a2d0 with SMTP id
 y2-20020a056808130200b00326dbcfa2d0mr16468689oiv.106.1652810034896; 
 Tue, 17 May 2022 10:53:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05683019c900b0060603221276sm60670otp.70.2022.05.17.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 10:53:54 -0700 (PDT)
Received: (nullmailer pid 1316050 invoked by uid 1000);
 Tue, 17 May 2022 17:53:52 -0000
Date: Tue, 17 May 2022 12:53:52 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: drinkcat@chromium.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 cellopoint.kai@gmail.com, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, randy.wu@mediatek.com, 
 xiandong.wang@mediatek.com, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 allen-kh.cheng@mediatek.com, 
 daoyuan huang <daoyuan.huang@mediatek.com>, pihsun@chromium.org,
 hsinyi@google.com, jason-jh.lin@mediatek.com, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, river.cheng@mediatek.com, 
 roy-cw.yeh@mediatek.com, tfiga@chromium.org, devicetree@vger.kernel.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v15 1/3] dt-binding: mediatek: add bindings for MediaTek
 MDP3 components
Message-ID: <20220517175352.GA1315998-robh@kernel.org>
References: <20220512092306.6895-1-moudy.ho@mediatek.com>
 <20220512092306.6895-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512092306.6895-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_105359_127313_C79A982F 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, 12 May 2022 17:23:04 +0800, Moudy Ho wrote:
> This patch adds DT binding documents for Media Data Path 3 (MDP3)
> a unit in multimedia system combined with several components and
> used for scaling and color format convert.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 85 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rsz.yaml     | 65 ++++++++++++++
>  .../bindings/media/mediatek,mdp3-wrot.yaml    | 70 +++++++++++++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml | 58 +++++++++++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  | 71 ++++++++++++++++
>  5 files changed, 349 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
