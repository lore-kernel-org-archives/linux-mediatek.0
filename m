Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943FC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAJKlhfbMyQplK7V4LBuMFmDWCWyf09orv4Khsn/h98=; b=07dPVw4dkVJROYWrXpG1VYoTog
	/QpDmKkSlv9mqJ6iskckM7pV8+5P4Fj+69q0svHR7IfbTEmf7EdWLuso9rS3EFK7Smzp0YV1V8Vi8
	K+OLqNiZXjh961FYud70s7ahB3o9NJwhH6pfwGkDVNFcWh+T6KhWpq9z10LOlB38/FyljHOd9ai2r
	BeiwAnDAtcOY8beAOYRP6umt2mBLb8Ss4EoUmBqLFkZPR6x5WeiYLaSDsiOUbE01UPF5Q0lfCvbAc
	qqJg34MJclHLXfL+R9vILWYJm1u5LiUxSKYTRh/OzqFfomOoQc85E5ik/cd5SKDR4Oc8oRTFJadEO
	XVh07wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XUT-001ym7-34;
	Tue, 06 Jun 2023 14:16:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XUQ-001yhj-1X
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 14:16:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so62738865e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686061000; x=1688653000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAJKlhfbMyQplK7V4LBuMFmDWCWyf09orv4Khsn/h98=;
        b=XfFyRZl/3Xcv+ZlIQWO8b2KyQGwvgjlpV14sRbB7Gx10qhwk2YwL5LAWI1H7aloUnH
         8OCFAoU/U0+YyecuPdVId5oenqhLBYFnKWxTDW3cIG8KRw0YtEglJocHgvPl+DlprJ+1
         4qECqhWp+9ipUXQnBO6czIozAqgra4rBXy8tBBJaLl8aIK4WsuIe2hgR6XYaCD6CNYHo
         CCTLWCKlx/BEEbtgh054sTkykGanAlzBaBy1/QXPkVLUZRMVSuF5/kG3r5KSb64OWNeX
         PU3QThvUEU2g14NDHdxtojuc+i4cLVzI3tM1Z0MLHpAS+y0SlvJhZkEm8SpHP/40dvJa
         5Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061000; x=1688653000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAJKlhfbMyQplK7V4LBuMFmDWCWyf09orv4Khsn/h98=;
        b=EbyvC9HeMAjOIAgq9jfcd+3klF6zb7zH+Tf48czP0pVyjhaQ0+gHUP548NYFHtcPbF
         gdmLrhyqbt85Lwh1EZMY7MFgNJCScuZ6aSEtkuYX4kZLpvHfLx5PCj2RgRPl5sEi5Tx1
         XsUfDWtTZuXH8Ka5FfkYWko29vu8NA2rhMOhlhm/TVKH7O5rsmKH4BlkyJIARrSQQocF
         EqSmbL0c6j4XccoAmfPjzNfpsAizUPT4IaWLPJ7E17wiY0RzoRJwStk+QzvEe5QiReW3
         0DkgWWkuAU8tFy2MgZwRTDEDU8qE/ADmYree6kUH8JlEoD+Y5TdPrbKAOq2jKpxtEfuh
         PBbg==
X-Gm-Message-State: AC+VfDxggTcmsJxsAClR+ZQfmdJIaTvhqoFqeduxpSOxhzII7yyK3rgx
	AJYFs7H610axN9qIFccsSz7Cgg==
X-Google-Smtp-Source: ACHHUZ4B+HMXMA37SveRg95J8RPbhX92Kzuddi7nlYWzpXsyavm7U7yYxf7JFrAAtLM2rTtQfbDpPg==
X-Received: by 2002:a05:600c:b49:b0:3f7:8fd5:567 with SMTP id k9-20020a05600c0b4900b003f78fd50567mr2601919wmr.2.1686061000705;
        Tue, 06 Jun 2023 07:16:40 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y24-20020a7bcd98000000b003f42314832fsm14077795wmj.18.2023.06.06.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:16:40 -0700 (PDT)
Message-ID: <e925728b-ae6b-6347-20f9-2510f046d598@baylibre.com>
Date: Tue, 6 Jun 2023 16:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 5/7] iommu/mediatek: Add MT8188 IOMMU Support
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230602090227.7264-1-yong.wu@mediatek.com>
 <20230602090227.7264-6-yong.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230602090227.7264-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_071650_514543_715240B9 
X-CRM114-Status: UNSURE (   7.34  )
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

On 02/06/2023 11:02, Yong Wu wrote:
> MT8188 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the other
> is for vpp. and 1 INFRA IOMMU.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


