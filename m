Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE32C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quDJROYZau1xv6HdG0MK6L0Z5Z+WN4DnzD83c5yx90g=; b=S0SClhwllVMvGM8Im0skyjp2Pl
	GdWhLWmNrrMRNmSyWb2Ai9XHJXA+E6KjUoedDTo+giSTUdXyf74wQpR2hfDhav7iPESBhBWtDyK0V
	2rZv52x9pca2keTDsd+6BmBcmgRiGALnDZYP7iFfq46Hdd/uhoXHcR8eCD4U9qakFM6FivWTH/uyO
	sL0mB6CUJ2tG2sPfGvdOyZ8nmq2OCOB+Q8Sj2oFsKbux/ir7FazRB/1IqZ+4FniTCSFiQPQBi/yI1
	7ErXuY6tXrG5USkXdkGcqkO3sfD3WhUrV+Mq1ybUkbYE3znsv6CQebJSk5t4fUx+zyp6uo3G7RcN8
	rznyUKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1oY-006a7h-1z;
	Sat, 25 Mar 2023 11:12:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1oW-006a5r-0S
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 11:12:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id b20so17459217edd.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Mar 2023 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quDJROYZau1xv6HdG0MK6L0Z5Z+WN4DnzD83c5yx90g=;
        b=JZR7cNi438VpAia1Q2EpjsXEkAiziqTnN3CHCXewKfg5fnaf53lztCnJGu5kIqL386
         38rsE8mwuspJWwtBBWSMoIJKu++wyUGnYnC98rUNwrYbBKSPhgR5mwN36OBz4bbdb0+j
         PzMHlYNr5tl3Xefwjt95Ux+sr/5kwz5IfphblIKdNcZInm5c+myHTxmO+PP7xD6dM7t+
         3wmihgEZxvgWX/IvSVLcIyCg4eTpXKTr8+QvJBvzG/X9kqk3pWSt3O5k1rRo2vcuAUbh
         BbKjx0oXDbIPILGEvU72wpLifLCiyBXKhcxh8AxHwtBp2ORr0hzogkMruPbXTcR03/Hk
         6xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quDJROYZau1xv6HdG0MK6L0Z5Z+WN4DnzD83c5yx90g=;
        b=q4hdTA31cufPG/PFheTU9RMP6odckh9wXPdJheZb0faPcJ+OgWTqKxedqbLL5GgTOF
         O/PxSraKHtdV4tuqgyOesmLHHnvlij6JTutkNjnFxBkhk66lT+jXKNipDOzu/URMeBL4
         IQQh2SZeNPiXgyNboZji6ZojKeybFOGSEoWCsHUPIJBMZhYvYw0UDDjmUWOj4Zwk0zwI
         CGA/PyDutC6uUbYBtndKTkirYQaumtJ95Crrx+YtA9GxJwukF9xGNHuw4VAzmLwvuXCz
         XETi4heB65nmavbnqK/mZ6ykKVqxLuB74psihHRw97ZdqyNn3tdr4aKzw1PYKjnrzmGb
         AQ1w==
X-Gm-Message-State: AAQBX9doiM2bGalFRaGfsYXc7k5Gf1WkKI27CEwDFsnG6oDk/oAwLS9P
	kJooV0Fc+Gjtha1A4k/6/5UYgA==
X-Google-Smtp-Source: AKy350bsE9lPQhYt7qH3o7Tk/Mup0e6CsrJLPYxBN1MNaWWiU2oMlVwSlMpylKH/yC8pTtsEs3LbgA==
X-Received: by 2002:a17:906:9485:b0:933:c052:a277 with SMTP id t5-20020a170906948500b00933c052a277mr5978078ejx.12.1679742714202;
        Sat, 25 Mar 2023 04:11:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id qb16-20020a1709077e9000b0093f3d41b9ebsm840671ejc.220.2023.03.25.04.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:11:53 -0700 (PDT)
Message-ID: <bedbda17-57e2-725a-2469-ddc6917448fb@linaro.org>
Date: Sat, 25 Mar 2023 12:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 07/18] dt-bindings: mailbox: mediatek,gce-mailbox: Add
 compatible for MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-8-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_041200_184811_5BFF970A 
X-CRM114-Status: UNSURE (   9.46  )
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

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MT6795 Helio X10 SoC which: this SoC
> can use MT8173 bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


