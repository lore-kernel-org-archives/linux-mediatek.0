Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5614BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 23:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5QWmdstjySLbKfcmqyX02J86rXcZbfWApyl8wFXr08=; b=drojJ/VsvUU7Gh
	6vsyvaxr5odtWq3zuw5y+TUvF0BVd24BKEHJVrnXVxsHxRHlH0TnM2V1kkt6Rxk8yUd8Nxnt04Up9
	K/XUYkLuQlx6bOQ/Nm+1HCdvoBoeT779FzyOPf5sXBub5eUqPKjctnhCkR/xt/zmS8rk5Dlqrgraa
	/ZK6aPDxihgjrZ53DcBp3yxoUNQB9UJXp6c97jByaTp4vco4uv0kysG7I6+Rtb7PwKjCSUnACuDEU
	u0lhYn35zTgRrhkv1wfU2/VLnk9dVqyHwINOKfNzEQ59mJGU0CUWUeJdN+A5c49l32zuDA+046yae
	fAFHhdKREkZtEe+HMi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF2lo-00DpdA-Hf; Tue, 01 Feb 2022 23:41:08 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2ld-00DpaQ-2j; Tue, 01 Feb 2022 23:40:58 +0000
Received: by mail-oi1-f178.google.com with SMTP id q186so36547757oih.8;
 Tue, 01 Feb 2022 15:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ee57DHmj5dnuP+LBJd/K38nnzdPSCpMAb2DQvjNUIqo=;
 b=FU7MDItKXCwfSNT6UfYODjouXdI/VIfcfaPPQtI6eN2yCtVyHkjH+ad1fMOsauhIbV
 9CKxzhYZJ04fp9kbPBsxVuguP+225if37CI5v7BKlKYWWpXOhps/tSIrcOtYP3XX/ngJ
 d6vXcMOHZch+Oxc726oC/8v8sZ/JMkM2Xk9A5isox4Wa4DsyuOLzbpwoIfBep2u6+k8H
 Sj/ueWA3i1KhNp3r3bfGSHWZPZr7dBbUYBsft5GuO2DpCHIlXkZEB8+XKRMjsg06WA90
 6b2GrNvwNFNlqNEPmbXomYjB9j+sYScUApsTmW+Lw/vUAh024NjAhd+IMEvA9oU3nCFd
 D6CQ==
X-Gm-Message-State: AOAM530+o/0o8Rvb4qdyLLQRObBQZ2WT2PEHyBQQJ9/iELnZ80B6xY8N
 +jdXG/GJhklUPpb+nS8JS5jkOlQEsQ==
X-Google-Smtp-Source: ABdhPJzKGe8aH8cwKkyPsDTKRydI1q7bfkfX/247BTUn16n0WJN8xDEVsRoo0CVaEQQiea9VxzrldQ==
X-Received: by 2002:a54:4018:: with SMTP id x24mr2813412oie.222.1643758856152; 
 Tue, 01 Feb 2022 15:40:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r8sm17915906oia.19.2022.02.01.15.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:40:55 -0800 (PST)
Received: (nullmailer pid 981764 invoked by uid 1000);
 Tue, 01 Feb 2022 23:40:54 -0000
Date: Tue, 1 Feb 2022 17:40:54 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Cc: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Nishanth Menon <nm@ti.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Boichat <drinkcat@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Angus Lin <Angus.Lin@mediatek.com>
Subject: Re: [PATCH v22 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Message-ID: <YfnFBirxSnCqRDem@robh.at.kernel.org>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127033956.24585-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_154057_167332_72613F39 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, 27 Jan 2022 11:39:50 +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
