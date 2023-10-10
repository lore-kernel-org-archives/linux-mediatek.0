Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8796ECD80B7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hRT2SJvh76ItidEme0pVqcc7N97rm2ZUS1fSYhtaag=; b=vlIl5H8EUMbTICejMvhgGCsiqZ
	akCWwvodMSdFv1g94U3t8noU+nf1NhWiu8yfyJWEhvfuP96f/tQ0rgV2lPyh/mIMPmA0lkSu1LHvI
	UoZEZMiqDwc4VRDz2Qbu6mcjBB4u39sdg1wIySaIG0u3C1fPaixkLY8L177gdZFPLLBqmIJ+fRu+p
	0RIts2c/Z3iBpiWUKTwLY7yZBWDZrpzwZHXLApMrYtqI128913SCFXlyhllBuNhonLhe7d6n6tVcA
	TptGl/v86PyWdMKX+XcgHDqD/VRH04AIxDRdlp96wwz9mu92utIzvVjl70/ZUjWfjnj9i9PyD2jej
	mSTg+W0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBgJ-00DJX7-0s;
	Tue, 10 Oct 2023 12:17:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBgF-00DJW4-1x
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 12:17:44 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bdcade7fbso952647366b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Oct 2023 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696940261; x=1697545061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hRT2SJvh76ItidEme0pVqcc7N97rm2ZUS1fSYhtaag=;
        b=kzw0IjXG2wyh6jzb2kh6EkrUa015lQfsLMmlkuX5tkagqQ6w368o5zZpMRAT8hh/zH
         xnQp6ujvOGWyc1O/++n0wTFSJDZp9HigN7ykBHN1HlJkdUGekMUBvYgREJkrJLL3maxo
         0hl5cY6TXQ6QvmclcJIFMgVpbmRynQJxcycTzQcGZtbkV7uRexTnZRdxdBiIsrIB40Py
         B3oXhlcgbCI0vW5eAWD5j9qInOe7RthH6out59Jna8CJ6QbZZ3pHCkGiqFZM48XxfKAT
         fGEXUZ6XMSQM74n9H3SjJEwDi/55b5RuN1hrPp/+6cVJiRbto2qZ435DAD/xrwenTCn6
         BEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940261; x=1697545061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hRT2SJvh76ItidEme0pVqcc7N97rm2ZUS1fSYhtaag=;
        b=qmzsMGJSDIbkPC412C5BzFJfKhJsrqSrsNJeFNPObKzISKXkNyvXIWNQHExnFCWynd
         B0JQp6YgpEhqcs0psBLowBg0rWtI7hr57FjbdL0V+QGkbDt8+oEk4ZHNj6sx/eMFc87H
         UqHuKzYkfuqnHd+b6+Px34G+z5F4A8ZuLFBJ6atoWau3HnzpSd8fzVCdoIaVjOoX/7Sk
         s9Pz8GLBvAzuHBBGPoK3rIi5xyUlHqWVFS0EaSz3ji65oqfGlsUQFRUvmO+2LtxC6i3u
         XsVmpSf+RuiCOp3kit7fvrLxTs2KemXGrONyiz71dF5N2jp6OBWn7oc+UVAv++scKESc
         eQrw==
X-Gm-Message-State: AOJu0YyP7qrJvVRF+21ozsxgkEQ5bE/lJIhwiHLSFqyTaBmg8i6HQrcJ
	UKGxItknenB5MOEdAzfnD3uxwg==
X-Google-Smtp-Source: AGHT+IE+V2cLrQpGWVua2yJmj70qAuFvQv3wkupweNiqkbOavf527f0ImxH5CbIZPFmvrxP11OS20A==
X-Received: by 2002:a17:906:5193:b0:9ae:5848:3f8e with SMTP id y19-20020a170906519300b009ae58483f8emr17053067ejk.49.1696940261458;
        Tue, 10 Oct 2023 05:17:41 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709062a5000b0099315454e76sm8293803eje.211.2023.10.10.05.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:17:41 -0700 (PDT)
Message-ID: <3500ad51-b220-41f7-926f-bb5b9d415698@baylibre.com>
Date: Tue, 10 Oct 2023 14:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: platform: mtk-mdp3: Use devicetree phandle
 to retrieve SCP
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mchehab@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
 u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org
References: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
 <20231005104905.120544-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231005104905.120544-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_051743_672439_57DF9170 
X-CRM114-Status: UNSURE (   8.08  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 05/10/2023 12:49, AngeloGioacchino Del Regno wrote:
> Instead of walking the entire parent node for something that has the 
> right compatible, use the scp_get() function provided by the MediaTek 
> SCP remoteproc driver to retrieve a handle to mtk_scp through the 
> devicetree "mediatek,scp" (phandle) property. In case of multi-core SCP, 
> this also allows to select a specific core.

-- 
Regards,
Alexandre

