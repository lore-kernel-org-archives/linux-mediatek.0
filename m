Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93F3C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y050b+bqDXjMFJ0FQAtLb9qk0gbyprIyKNchoQmXT8=; b=HdCj2183MaiCniFgFZOpPuvZs+
	8XagwS3O0qGDhT775FZJINMG2LEYCQnp91fZ+TUY5qRr8+VF+79vcBWkFS5ld35+eiOy1HUsJ6FS2
	Gi/wb/ywbd2gkCppOF6a9LQQJs/EQZU7G1LCATiLmC5FJdFBbJV/Bhb/YlZ9Y1X2YbymRMbD6h6GN
	i3XlXfxXfSIAyZL2eEhuN7A6jpYo18JVcchPtRGI+piKa/u6DY7osFtx1Uz2+mH8OJaynKZUOfC0z
	ljmCLhdVFBeN0gGzZBc1eg1maDDtnsmkZJlgESjILow1iQOCK11ceni82/TM41MMamPgzjBeByFNH
	yOhKlIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYVEu-0056I2-BV; Wed, 14 Sep 2022 16:27:52 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYVEn-00564Q-62; Wed, 14 Sep 2022 16:27:46 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1225219ee46so42435021fac.2;
        Wed, 14 Sep 2022 09:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0Y050b+bqDXjMFJ0FQAtLb9qk0gbyprIyKNchoQmXT8=;
        b=6cbvD9XiossrZcXYTb9aw7fmFaH4KaScUtX8nKOEUZ+e4FPAzl3Ohwlh9FVlr6XBjL
         0rWp+OgIqqApPrjrmsTWL0Nt7yvzmjqLb5D1p0hlvBVjSWnH7o+wZkGskUe9jAFlUfJ5
         buyr930XF1upsqu7ANOHInXKovTkbJ9fkqUxp4CK5V1MP9v/yxqQE3WlhNl6ND4Yq6yP
         /LL1X2I/eFDa0RK6Z4XWOr+JlWx2ieLyOUuHiUWXFjxghnXeRCQCisiiJFjEk8w9vAFS
         FMcCKN5hNuMQLgwikTLHwr/ej3NeYxPyo/X3YW1DWr1x6T/ETcKO+U3kXmSgMHUDjpCD
         WZFg==
X-Gm-Message-State: ACgBeo0TNKR4pjngh/cfc75Z0hSvndUUSTU2u6oYuhkn3/7MOIWDMfEZ
	ACggIxKMZZgInciVSvPsd0AK5M9X9Q==
X-Google-Smtp-Source: AA6agR5JPh3F/7WxyKo5hFzduVLue4pftUF2pPAoQkbx7N1C4y8oQD4shtXx254V59inZFs9XEpmlg==
X-Received: by 2002:a05:6808:140e:b0:344:d2fb:43fe with SMTP id w14-20020a056808140e00b00344d2fb43femr2244433oiv.112.1663172864306;
        Wed, 14 Sep 2022 09:27:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w35-20020a056830412300b00657a221eb71sm848607ott.65.2022.09.14.09.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:27:44 -0700 (PDT)
Received: (nullmailer pid 2502825 invoked by uid 1000);
	Wed, 14 Sep 2022 16:27:43 -0000
Date: Wed, 14 Sep 2022 11:27:43 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmitry.torokhov@gmail.com, linux-mediatek@lists.infradead.org, robh+dt@kernel.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, chen.zhong@mediatek.com
Subject: Re: [PATCH v2 2/2] dt-bindings: input: mediatek,pmic-keys: Add
 compatible for MT6331 keys
Message-ID: <20220914162743.GA2502746-robh@kernel.org>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
 <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_092745_269168_A7DBE47D 
X-CRM114-Status: UNSURE (   9.85  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 14 Sep 2022 12:30:21 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the keys found on MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

