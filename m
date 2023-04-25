Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C67C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwmJNsQVa3Vng8gKvvvDPoERcEJfaY5DKNCyYTI03Sc=; b=1TYBTeUlS4giRHRsQgVVzEgDqi
	K72rJceIbauEAxH5ZFaDkPu0j1GOcSbR4V99/Dctk45jkDQihoaNaSpSNfyrEZyfi0bP5TxqN//NO
	ohA6DGCNyEs6pLpOXwPyZ+v93VyYqvrMInu30dUrXh6MFWR44yHGsm+ZT2LNIpCIIe90HiquJBsNN
	JkdmDOM7KbpL9TrCczGejDVg9xQcoOoFeXMBUacPY4Uoa0tATPIJXiGVuuQ/aG/Nw6fPZ1ollGi5o
	daErN6xzIcqDIPbJxlXXsp4Ec3dHcKcTDFpkSe3uuALn+Uw0K1Z8PdQwGT95GtZVB5zJVE7jTNqXp
	EcSQY5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prGxi-000yLk-0a;
	Tue, 25 Apr 2023 11:35:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prGxe-000yJb-0L
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 11:35:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso34564615e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682422547; x=1685014547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwmJNsQVa3Vng8gKvvvDPoERcEJfaY5DKNCyYTI03Sc=;
        b=VX3fhbquFA6+uaUkxCbdF8qhQPGlJ3GsF8c9PdpI+h0WOsnjXM1RCXEf4tonNaw+D3
         NsWHe+JKhcv9o6BPzOGB9v/5MbzbG9WdTwpTki6gon8SzMH2vIc+K/zIH00jL3Xs82M1
         CqLj9oIl+wbJtPwnLB8XwDdCR3O7Pk28Cxyt5JdB6/11mqcld+V0rRJyeOScTPy/7i2A
         suB5tHBIi2HqGQP0tY/aG05fpcsfCg3MH3dwayJEhazdhahcPB7lx82j0tu7AOKoxOZ4
         1IXtdVKzR3QaB50SzMWtaEEw/T6/cGGHtOzhrM2f7J429vodm3n1O2W8CNPBLA3FNobU
         fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682422547; x=1685014547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwmJNsQVa3Vng8gKvvvDPoERcEJfaY5DKNCyYTI03Sc=;
        b=RckgAGPa8qtYXRHFc5GRo9Z9+6ENxjhUGwuOP+maqP+DByRhRvD3Un+4wAGdHO3dyd
         xOBjp3sb03FvubEwfEciTP0v4acl1HJA8L2WsprBOJAzUcpaiIPS2LpPERKr5HnPVS19
         dq6KPgSQmKu5F6oktBLlMlBCKK5jm5es9YFMAu0Avkwi72ZjHnO8fU5Uu+xVxdlc0A2Z
         WdvJDe8K7WAjZ3aEdypYB1KODIVnkwV0VBqKA/0dDq1PlovuXjIyTQJ8gOSLAh74ydTx
         X9Orbhxfs67oBqbQh1VEsbC1Z1Jo2H9KFzoR1xVeF2B8MiC1mSARfH2iFlyFvIiyZyKE
         wCDw==
X-Gm-Message-State: AAQBX9cV2amFlk6ioFuLVcc8obqOHDZ4nx4iixBHD/yv+8HiMRx4uAJ9
	LiSlmF4/oMeZztHK6rHm6Cq4wQ==
X-Google-Smtp-Source: AKy350YYSFveOR4ot4iXXTyDs7vO3lTymAmSY5PrZlIY90fzb4Alo+fO49znGJgXFo2VctM6yQ5kbg==
X-Received: by 2002:adf:ef51:0:b0:2f8:6c01:3bfc with SMTP id c17-20020adfef51000000b002f86c013bfcmr11572765wrp.30.1682422547195;
        Tue, 25 Apr 2023 04:35:47 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z17-20020adfdf91000000b002d97529b3bbsm12825907wrl.96.2023.04.25.04.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 04:35:46 -0700 (PDT)
Message-ID: <5100ca4e-f3c4-b3a9-2379-aab6177d37cb@baylibre.com>
Date: Tue, 25 Apr 2023 13:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mediatek: Enable all MT8192 clocks by default
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20230421111125.2397368-1-wenst@chromium.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230421111125.2397368-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_043554_140388_C9D32E91 
X-CRM114-Status: GOOD (  10.60  )
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

On 21/04/2023 13:11, Chen-Yu Tsai wrote:
> Currently the base MT8192 clock drivers are enabled by default, but all
> the other clock drivers need to be enabled by hand. This is extremely
> confusing and inconvenient for end users. For the MT8192 platform to be
> useful, most if not all the clock drivers driving the hardware blocks
> need to be enabled.
> 
> Enable them by default whenever MT8192 base clock driver is enabled.
> 
> Signed-off-by: Chen-Yu Tsai<wenst@chromium.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


