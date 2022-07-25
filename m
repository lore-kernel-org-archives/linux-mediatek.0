Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5441C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 23:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkLhNlQIA442mAFMLRl9TvrN+jhf4sjCHKPfdWKMsyc=; b=an7oCHel9nWcPZfK2Om9LDONV7
	qO9X+sN2t8F3gS1yBY9NQd3fcbA6qFKTjbxsGi0npUfo4Dby0d4U9v7IXKJ/SFDt8XKTBn4/FFtkM
	CcfPSf/M/036z3NiMIVATMHQIVaEz1t0iYis/h7d+ZHczDeUhXo10jCgUgxPX5vkd2fwY6CiNDqwx
	TWLXQ0CxS03tI9IqLtBZzHWlOrATCk6Ya73G1ZbuJBbMiLE577Vd7L0TVlHj2M9ON6y0UqZVSJC+7
	PDlvHvy98n0t5+5N3mN+mpsF2ZyljI+P7saX9A3vbTfgZSmZIt9SOIPQxiX/feUsWgFW6Q3xcP70Y
	F6/5oVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG7b5-004Lml-Tr; Mon, 25 Jul 2022 23:34:47 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG7aD-004Kjk-Ui; Mon, 25 Jul 2022 23:33:55 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10dc6e9f500so10815387fac.4;
        Mon, 25 Jul 2022 16:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KkLhNlQIA442mAFMLRl9TvrN+jhf4sjCHKPfdWKMsyc=;
        b=P2iIFbSfMV1/PYd1NuyMpIxe5tLqKkTIkx6AgvDkUYf4+yGR/g2085nh7O+Co2Gao1
         k/JQwtzAhtVfguFyhUQ6XY5+U2m8ZUrxIM8Wkv9oH7BSyRdN+e1c2+RVk2gKF6YrlDnT
         lcm+XO3GXKJuTBpGj3ojVRWb+nZoPgSVQpQvpQS576b8+dz5suyvmwoy6x8WiP86hauV
         +3v9rCfZenVM47jgB7iOW8nnzW0SvegVKqEyrqYL1/sZBcYuL1rGNwFh93bMUMXV36Yo
         rKn08tCPqJL7fJBzzDXe+0mpokhz43elBboU0HLkYMQ7+mPEHjV+cGIcQoHZXCwiqT7/
         Dn1A==
X-Gm-Message-State: AJIora/9r8XLNK0aVNm9LJ9g5fV321GYZjC7n9cAcCsT8C5o9t54nn1l
	ie/IMsbpfJZmLAFmQyKuTQ==
X-Google-Smtp-Source: AGRyM1vDjAj9b/AAZtMINpd77bbnwU7eigj7GQ3astAXeGxYeIqiKr+TDVJ3DvFn+JGhsHSlVWYQUQ==
X-Received: by 2002:a05:6870:61cc:b0:10d:8a9e:4ebc with SMTP id b12-20020a05687061cc00b0010d8a9e4ebcmr14270694oah.155.1658792032961;
        Mon, 25 Jul 2022 16:33:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b8-20020a056830310800b0061ca5495cc2sm5553067ots.30.2022.07.25.16.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:33:52 -0700 (PDT)
Received: (nullmailer pid 2965916 invoked by uid 1000);
	Mon, 25 Jul 2022 23:33:50 -0000
Date: Mon, 25 Jul 2022 17:33:50 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: mt8186: Add and use
 drive-strength-microamp
Message-ID: <20220725233350.GA2965857-robh@kernel.org>
References: <20220725110702.11362-1-allen-kh.cheng@mediatek.com>
 <20220725110702.11362-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725110702.11362-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_163354_028108_3B5B8628 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon, 25 Jul 2022 19:07:02 +0800, Allen-KH Cheng wrote:
> Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> drive-strength-microamp instead of mediatek,drive-strength-adv.
> 
> Similarly to the mt8192 and mt8195, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
> 
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      | 29 ++-----------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

