Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11757C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVC6NdLm0L3ucwtGOCnWCELaaJDwYCGwaAeMotNTwX0=; b=WJxHDMIsp/3HVc
	qHrjM72uBc0iYfdPLsA3dE2dciL8rSikY/AbiqqospIKsMzEIq6fTP7I2pWEEbN81ZwUgFfGUVNXk
	br6rq/uvc9TZJXMsdMhx+unBQDmFltQsQK7+sGZhhmZHweJX1O7NOJxH6NWRW+M0adhjo05ERyse5
	Y0CIC1mQWByMSsnGjOLHR9LSRyfM3f7XEylrSxC3tOUf7ffBtiPAvFEE6co2xJ52h84+tY8qyK+60
	RAgQ8qIdi10JriquN7/acyVcn0k7ZxdwqAI0qaO+ewfi1wkQd+xoRuwPoHj58n5usN/+NS2E5H3s7
	SZYwOJ12S6MyIMSZg0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nld1B-002hkI-75; Mon, 02 May 2022 20:51:41 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nld19-002hje-8B; Mon, 02 May 2022 20:51:40 +0000
Received: by mail-oi1-f179.google.com with SMTP id z8so16407780oix.3;
 Mon, 02 May 2022 13:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5VWOZBbGOn80V6+f0/v6r7Ed2zi/W6IJwHO0n/X/0CM=;
 b=I5RDTj/qFv2zY7zEKaO1nvTQoYCpZexnGzesklgW9aP5MwwoVKrH2d0xWeDBhXB0mr
 OkxFnPTylz9uISO9ycIQvrbxPI1R175U2FI+XLQibT1s2nisF8jMeSWJ6Vo3ekh4ZuUZ
 wYFUJPo86rHCiBwfjkQOxz9/3UhfNM1j+WHzUQyKzQD0c2aX6lSf3aDPqdrcLO8qavcJ
 0QFuG15R8sQVVc12nUJi9YcNvFp5yYkE1fe7MLHOAVknyM3sWn3iL3jGp9SlUjdVphxr
 PFwldUQ3O7vRkye1kZoQyYDvQLy0ycKCRzHc2ecmbz0SN4prKt6qOS3Z0kKP9fcoTlK8
 1amw==
X-Gm-Message-State: AOAM532QOvl/yA665XpAOyf1pkhsj+r4wmdiYF+izOwnn/bTWv1PrPZz
 kq1Mp6wyqLEfsTJ4SqkOcw==
X-Google-Smtp-Source: ABdhPJyXVR6zBCbrp43TECq40H17+JMBGJm+PLHpua414oDvr57OG2kHM5NGu2sfxfcCyvq1GpTuuQ==
X-Received: by 2002:a05:6808:1a04:b0:325:9646:43b0 with SMTP id
 bk4-20020a0568081a0400b00325964643b0mr455345oib.175.1651524698003; 
 Mon, 02 May 2022 13:51:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s1-20020a4ae541000000b0035eb4e5a6c8sm4276006oot.30.2022.05.02.13.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 13:51:37 -0700 (PDT)
Received: (nullmailer pid 1725493 invoked by uid 1000);
 Mon, 02 May 2022 20:51:36 -0000
Date: Mon, 2 May 2022 15:51:36 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mt8186
 compatible name
Message-ID: <YnBEWI3aVryi06pH@robh.at.kernel.org>
References: <20220422023909.6584-1-tinghan.shen@mediatek.com>
 <20220422023909.6584-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422023909.6584-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_135139_326126_F2CF26A7 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, 22 Apr 2022 10:39:08 +0800, Tinghan Shen wrote:
> Add compatible name for MediaTek MT8186 SoC ADSP mailbox.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk,adsp-mbox.yaml         | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
