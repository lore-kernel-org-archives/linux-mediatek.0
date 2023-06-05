Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56022C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 13:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYKK5WNMfEjOGjyNV4BV3FvblimxrGOB2o0YYjGZMoc=; b=Ou/GsFawyc+q6NHryiQw5YoH/z
	4klrcgoFeVUoQzxkhjM/R/kb4a3DlhJkZW7ZwIxKqWTV43yQimY+P4GXv1ytZDSxgKzdNHwvcW1AW
	5KLmkpqwwGtZ11m07jDulDMg+xaUyMF5V1UuRc3+ExHhBulFp5/DAkqW8Ywls5MMrlzpSt/nEOMk4
	HnqwrzGf1QEbsjZfrXhWZ+yQkQ0tLd/938C+ijLZgx7fNoVu3z7n9LsxC4NbTf+R/jJ9MU20w6IhH
	Q+EDfwvgJHGof3lni0aWGx5OQnQJGsmGdQcZZL8bRtmAjpr3/bQJ+hhsa0UDrSl0hiyKkGMN2ydXj
	vWzmraHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AXM-00FfSt-1r;
	Mon, 05 Jun 2023 13:46:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AXK-00FfQI-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 13:46:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so48314935e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jun 2023 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685972773; x=1688564773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYKK5WNMfEjOGjyNV4BV3FvblimxrGOB2o0YYjGZMoc=;
        b=o14Lr3M7upHuE04It/xjCa/cGiFZydRy2hUwTK9XlH2YrDGpqVeV30TZrLGhiki0vJ
         yGrI8dACugq0IEvTWfhms4gs7Y+7zu3vZuYNML6zZKk9F4bMY1ZYjnJfxp15iqvO1Ast
         /pH9IYZGG2eW6ljMvGK8/1MjKS9hMqGeKd9dXX8BiPb30VjeWHO4EAaZd64KNX18Hvzi
         FL5jPdrgXYRRrkoAWgL7GFtjIbkZ8b6w3kqgu+LvsMoOM+s3VtjAEYaGM8ALMdzdy+e9
         lYSsqb4b83Eo6wG8Y/ladavWs1TvECsSxmVly/haTUzpQuFU/8bP1AtRUMoIHunMjAOl
         kmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685972773; x=1688564773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYKK5WNMfEjOGjyNV4BV3FvblimxrGOB2o0YYjGZMoc=;
        b=QJQCZeYkWc2zkegpZ6Jj72QggLk1g5ml5WEJzs/NXMUHrrQpBiLSK3efgvYHVoe1D4
         J5178R7bhNH48EN435zOCqyAQCTVTkfia8iTyx8DlMA6t+ZgNT4+MkNRbOW3uU0O7tam
         mTM45m4aSNCKfgUfSsHIBBSNDNfwu/UkuKApKqMmBGp2vAd1xqmVG5ZmIVGKstoe3wPx
         T3/xfnuGzq/szMAOubO9LejhL4W53PpOHcbXvSDA0o+NlUXq2ArvN2bOc6dmprWVfeyv
         GWkD9WePiJiO+YC7GNswPAQsE2HpChJYvlysy039Pb1m7gqnqQbm0AJqbQMAnxiD45a8
         ndqA==
X-Gm-Message-State: AC+VfDxme+yonfWJ2xzYldpVzYqlz+lgYvtl0AeThFXSaBCZ8lq/j0sD
	+sJmJtiyhPmDkSjkBXkXui+QCg==
X-Google-Smtp-Source: ACHHUZ6pe5WzdC0oeZHm5ttRdAIOIatHBO9NbMz+Wi/TXtcIHPM0H3CJ2RQWxyznNcTYqcUoUr/Bgg==
X-Received: by 2002:a1c:f70a:0:b0:3f6:da2:bc86 with SMTP id v10-20020a1cf70a000000b003f60da2bc86mr7668207wmh.7.1685972773675;
        Mon, 05 Jun 2023 06:46:13 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0acb00b003f72d7dc66esm7682965wmr.13.2023.06.05.06.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 06:46:13 -0700 (PDT)
Message-ID: <0e7cc4cf-68da-207d-03b5-f9bd065f7940@baylibre.com>
Date: Mon, 5 Jun 2023 15:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] mmc: mtk-sd: reduce CIT for better performance
Content-Language: en-US
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230605121442.23622-1-wenbin.mei@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230605121442.23622-1-wenbin.mei@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_064618_455304_3ED3E2AC 
X-CRM114-Status: GOOD (  11.08  )
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

On 05/06/2023 14:14, Wenbin Mei wrote:
> CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
> SEND_QUEUE_STATUS(CMD13) polling.
> Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
> frequency to get the actual time.
> The default value 0x1000 that corresponds to 150us for MediaTek SoCs, let's
> decrease it to 0x40 that corresponds to 2.35us, which can improve the
> performance of some eMMC devices.

Hi,

- Can you add the version change log and the link to the previous
patch version (at least) please ?

- On which board(s) did you test this patch please ?

-- 
Regards,
Alexandre


