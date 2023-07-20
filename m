Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KjNhZCS5Ih96I9bAacZuqvFr9UPsBlbZ9B2cRl79QI=; b=StHE111TytgKNs/TYbIkzGM7vu
	XogXYzMD2BzZjsW0cCwlszNdQLPj50qQA/of1NQNA+XAppLbvbOaPYCW0mIu8d0zoAUh2+j6l0sNM
	KxcmSn6pM04+9A5yV0gvMGW5C8h9NEcL5xUG2+jblNvZHOhX4dGBui6wU86esyeXquJHyzlrKYDcz
	1CF5eZ4pa6vcu3IIPBWXD4PYLNEcEAOd+FSBP596yOEqUQ6rZTZze3eGhPQIIt1VshyZSETcsVGTA
	nO8CV03g5i6AVUFUmGSx2Q7eSL42br74phANoXYMbIXxT5oKWcy+SurZDwgWxwdIoUfoAV5wrRWXI
	KGFl7amA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUAZ-00BJl9-01;
	Thu, 20 Jul 2023 13:58:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUAV-00BJk9-3C
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 13:58:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3143798f542so717249f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689861489; x=1690466289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KjNhZCS5Ih96I9bAacZuqvFr9UPsBlbZ9B2cRl79QI=;
        b=MgUMJiXasfQ3Ozh+7C8FYKynZyNNkQhjpHoEx17vOyDhn+jnpTMXtAtKBBRDywoyJZ
         K3Ii8cUsGzBTrQUD4oIk5q9gJjKIPsaJ/iWytBSrIlp8/Zh4jtbAfwvyMgnNS68bLGtc
         4X+ttDW0mCnHCyIRWv9dGljI0vbLDoDcQaqn+kK78OKU0FiiMlv8Ry1IzMBZ1Zyd8EeF
         V0w5nW0n6xAKwdOgszxeHlnybYmfaTe322Xk8KMxNGq8Sk57sgfq0M8RnY/8ej2vfyE1
         a8oh6yYj6e2G+8eczinpn0SpJ97ywOD0N41C5L+KwYHxptNRzWvzc9miiOx/svlkAW/9
         /1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689861489; x=1690466289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KjNhZCS5Ih96I9bAacZuqvFr9UPsBlbZ9B2cRl79QI=;
        b=AnCnzjkc3jIbfAunz9//5ZBU4xD3zx3QKL520nz64BM6U121IDSMP3yZ+dHf1dQYSO
         ciS1VVOa1G9dwDVXKESgjUxSeTp/7iiAHzxZRsaveeSNITTy/U8Ni2R5HMKPhLqp4azT
         LY5TAczJySfuah2RVAfoGZz5kKCLiRp0OqV0sq6u+stKScLSa3ljhGYGaNexmaV38EJh
         rPnRm5RtFqwsC632g7pI35+WV2TN6W0o+LhCYsJUYXHnT+4wkJ6bmbZLW0EEV/RtPg26
         5c816jXdePhFWkFje7oJxvyWPYlKfOoPW6SW8SDcmP8+zm2sGpYkof/tbybQlisAAORT
         i7Ww==
X-Gm-Message-State: ABy/qLbi6/vLSAOguZZRfLwgYd8oLpUjI1NK/xy6l8biJLgkAJzVl97L
	0eQ+jtA9zBE+Swi5SrTDd0pTAg==
X-Google-Smtp-Source: APBJJlFG9cyOubbOROpvzag6IpZ7+gawUh0kbE6UP3Vgh8NySRsEiGPb78RC8ywPhOF3DSTCEkpT3g==
X-Received: by 2002:a05:6000:194f:b0:315:8fc0:915e with SMTP id e15-20020a056000194f00b003158fc0915emr1945057wry.56.1689861489726;
        Thu, 20 Jul 2023 06:58:09 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe7ca000000b003143add4396sm1434471wrn.22.2023.07.20.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 06:58:09 -0700 (PDT)
Message-ID: <65a7fc52-5438-3c9d-cd1b-cf8a83986c88@baylibre.com>
Date: Thu, 20 Jul 2023 15:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 08/11] drm/mediatek: dp: Move PHY registration to new
 function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_065812_026630_287CBDA2 
X-CRM114-Status: UNSURE (   7.93  )
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

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for eDP, move the PHY registration
> code to a new mtk_dp_register_phy() function for better readability.
> 
> This commit brings no functional changes.

-- 
Regards,
Alexandre

