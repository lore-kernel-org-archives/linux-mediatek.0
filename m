Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F59C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkjZ5rbINOUac2whG3moPeIwSgXw+Ywm6rs4bOJgcHo=; b=k++wboprtVnGrW
	Zxb622Wzs8TK6tHlXlSPRS7AbHWhYIYo5t85nfGT0Dljv1OmEyh0aqY1NR7QrqOUJw2/Lgkc+NC7z
	X2/9W0Z1yEet60NNQRDu/dG4V6GvqiGFImGtrE0ykHuROBYIu+wGfWdrCVjuw7GDmQszn7X7ok/Mr
	KViVUoDYdgLKImptDRWFBmYrA8AbwVADz6Gb82NLvttPBM7ISOQHRZch/GklmAwsL2QIgkuN16/oJ
	iT7ai+oFLWEth9TN1lKF6HNFCc+YnDYpc2R2iumZArGGNWgbwh9oiD3dzBQjHX645wVmM4o5fxvYc
	Qh7HCuC1s17u1Q8cVzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7SlM-000h9G-2I; Wed, 12 Jan 2022 01:49:20 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Sl2-000guL-UM; Wed, 12 Jan 2022 01:49:02 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 r7-20020a05683001c700b005906f5b0969so902758ota.5; 
 Tue, 11 Jan 2022 17:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJKZUzOBI6Vo24287X8+wRGy/ESvzR2XScRXuUWLW0c=;
 b=NwFBNsbUAVyCyKOQMCGQSs1EWz6q5lAwuxvFp4HrIJN7jGuNvYzlgHtmE7o0y/GRVM
 J5p6yTLEyruRBkqI3j4jRVaTfrD1qX8oonOcSDqA6bJpMkBoMI1bzcU/vFT6Q8Y7jICH
 z+/J1ZgKG1N11Qkhu8wJ5jrGLl5bxvXGjp9VnOhtEETS3JU1dIC7VdPYZ73bgSi+RKYS
 8nE2QLYs2j2SnUr4+sSaCkk+QSqTx1kJmeTlAWINzSc5hyNG6L8XnX2NE5MNsPvRNhPl
 mIIz3Ygz/9FTS4UXLO+iq+uA3GCOMmAEeradLHA90fsRLkDMa7D/L/T2fe1TDwEqwZS0
 C7ow==
X-Gm-Message-State: AOAM532pZ3cVIXUBoJ3qiTAwt4kyZH0nvN5DPwQE1MWRBVUnHl5yNKIY
 zjRXRVVkS6kAO2P6G/vpNQ==
X-Google-Smtp-Source: ABdhPJxZVpceae6kFAyem51l5ODi7fPdybfjS305Va6Wt3Hz3NqJYY92UE8NPVoA8llkUbDBoq3mdQ==
X-Received: by 2002:a9d:5549:: with SMTP id h9mr5257588oti.36.1641952139623;
 Tue, 11 Jan 2022 17:48:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i16sm2030688oig.15.2022.01.11.17.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:48:58 -0800 (PST)
Received: (nullmailer pid 3896072 invoked by uid 1000);
 Wed, 12 Jan 2022 01:48:57 -0000
Date: Tue, 11 Jan 2022 19:48:57 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-pm@vger.kernel.org, YT Lee <yt.lee@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Angus Lin <Angus.Lin@mediatek.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@google.com>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v21 6/8] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
Message-ID: <Yd4ziRBDa2W34/Cn@robh.at.kernel.org>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-7-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107095200.4389-7-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174901_018418_7291EE98 
X-CRM114-Status: UNSURE (   9.60  )
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

On Fri, 07 Jan 2022 17:51:58 +0800, Roger Lu wrote:
> Add mt8192 svs compatible/resets in dt-bindings.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
