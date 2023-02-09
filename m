Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4052C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urg+eaKblq3L8ne5lHKwBHgDVzOQbYqpVZVsI1JK9JU=; b=eqQmgWQRcOHvE/vchHSou79L2W
	4WPvjhikVNVb77VOe55+WVrowuyG1Z8qm1Q2wJisl53xi4Z575EiXiHH8ScPhtV6WXyRyCYMwMPGM
	tO6y5P8mZMSUwYU9+2d3VuJJIifbEtP46U2WimoY0ELJvrY/cd+uwzWeka9lav6H9hTgx6XS0UTOZ
	PfWSh/FtjTQCZQSdirQ4RAmwJeVQASwS2G6Qm3swRqZr4pNxHl1IiZQc0Wr2mHIonLV1w1VHIsPqJ
	OOt2MEh75mHX+0wiSr0dTp3ogDoShdoCkwljGjCqXFF43ugE8pt5yxd6iW0he+b2872OEuAXHJjju
	seA/MSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCF8-002wOo-Re; Thu, 09 Feb 2023 19:06:02 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCF5-002wNd-SY; Thu, 09 Feb 2023 19:06:01 +0000
Received: by mail-oo1-f51.google.com with SMTP id i21-20020a4ad395000000b00517895ed15dso315116oos.0;
        Thu, 09 Feb 2023 11:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urg+eaKblq3L8ne5lHKwBHgDVzOQbYqpVZVsI1JK9JU=;
        b=rf9z1nUbW3Z30/s38biptAgKP9dGtgPPazyP4VcOYZFJtlYtE7Z1PyrmFa/2lmEXS3
         /uQtqSV8RXgx3N33egsfi8eCGbbJF7OmG5i6P8J9ec6IL4NADGQasA0ff/hSsgJ8HW7P
         T4Qu80MXJ/Dc/VcxHHw/M8WPyuQeI7jRSfjoa8jN2Xe5J8KTWLV0j61d0SkhEOexvGqs
         uA5YyKYbBe+fu51IoIUKOrTZsmK87YxvyPmnP6Yx0VZ0YT4E1bmBXhyBa+owcmx5QbCU
         JNb1f/xY+Q4FhjihSl9dEWqJz/sTRDBw4VZk7bm2l6lfFejqSiLrq/BJPwByF60xar+T
         UQcQ==
X-Gm-Message-State: AO0yUKXqf5urN9rsqLPVXr3kyJU17yxXNl/uEbG+lrFmvVfQP8v8tAZT
	NY0H5TQ57OqzO5W7xJhZng==
X-Google-Smtp-Source: AK7set+X2fhODBsNXBrX5cbrghiX/x1jE483HtaRu+qBarbWD/hb6POuqdG0rL7h/UlsrX/sPKTFNQ==
X-Received: by 2002:a4a:e385:0:b0:519:b605:9d78 with SMTP id l5-20020a4ae385000000b00519b6059d78mr5794383oov.7.1675969556165;
        Thu, 09 Feb 2023 11:05:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w17-20020a9d6751000000b0067781a9292asm1089490otm.2.2023.02.09.11.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 11:05:55 -0800 (PST)
Received: (nullmailer pid 645960 invoked by uid 1000);
	Thu, 09 Feb 2023 19:05:55 -0000
Date: Thu, 9 Feb 2023 13:05:55 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 03/12] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Message-ID: <167596955460.645898.16236583347331840174.robh@kernel.org>
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
 <20230209074021.13936-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209074021.13936-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_110559_937520_A837A0BD 
X-CRM114-Status: GOOD (  11.49  )
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


On Thu, 09 Feb 2023 15:40:12 +0800, Tinghan Shen wrote:
> Extend the SCP binding to describe the MT8195 dual-core SCP.
> 
> Under different applications, the MT8195 SCP can be used as single-core
> or dual-core. This change keeps the single-core definition and
> adds new definitions for dual-core use case.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 145 +++++++++++++++++-
>  1 file changed, 141 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


