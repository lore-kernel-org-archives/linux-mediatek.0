Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D2AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 09:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrJA1wmEzlkWZ69WKrs6mIsPDzL8DfCHLcTOjGfg6I4=; b=Ev39+mPmZIOXkbJrItGboDo9G3
	dbgK/r4OY+0XF7qKIDrRIPICZpMdKDRKtNokWkFFJMVfsfB10Tix6hfiIhEprSuz+O/CGOyF460BV
	sLd+CrsgDCLSMAA7XVOk6QIzE68HnImU/4eDSvjxcx1sFaZ9cK2XnDC3b9c3miEZTLa6sn5r1t+TL
	zeb98eE+/73C9ISpcrSxCBBvQTV7HQZwUo+0NHvbW3wkWJ4KsZyRA4k1UdzlFXQpok3ujatjB/dta
	+8Uvi+V7vAuAfyWLrktCS+ZwWccw0msWq6T3wD5f2bmBXeA/6OjZUCQa0OmcCWQQierHfzScAkvHG
	D3cXut4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hys-00GqHx-0w;
	Wed, 31 May 2023 09:18:58 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hyq-00GqGN-14
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 09:18:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30789a4c537so3870759f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524732; x=1688116732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrJA1wmEzlkWZ69WKrs6mIsPDzL8DfCHLcTOjGfg6I4=;
        b=bd9uC8GB+3PDY+D4IIrbCZqNEUVwTIUTV3DdWmWHgvO+aVjzWp3wDu/vlefKMZI+t3
         o/y9+1sHoqFCkMsh452VKfK/k+EW3T6D9CtczGNhEYjwGXww4OaKqrpXFStM6O9S2huv
         RUK2/e8QIoGSJhSTpIZOKiGnVU2sVimTfWbtpUDjYn7dkuixFoJ/liRbsUYi3oVS7rHP
         bQrU4bL/fSWNyeX2qZlkGl9YfrS5qGlGKBB5hxOojwV6/vYJ72op3fDlX0rfG6M74In/
         ti5u40JdMnOlKTqSnjL+6yPL1KRBuAqETCWlVM74blLv/RqTRVeZMF97dIGg8Sp4C6S1
         h84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524732; x=1688116732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrJA1wmEzlkWZ69WKrs6mIsPDzL8DfCHLcTOjGfg6I4=;
        b=AuqEuJbGymCNFjG7dCmcpD+aubVyuUlnBZBSOx6Q8Xp/ETusJnb1s+ubq8m86s5/Lo
         v/YTFv4TC8L73uUKLIu98ttdLpFvQ5GxbWPOnGFkchI86HnVnfl+oujLLm4CuHkc0MF2
         TUEcpuz8fs3e0prEMF5Bj/M4MBYvvxpiCTuAOgmP39WiZwGJqnEq8aLPG0aSGxCgtgOB
         xPNYusJ+sZF6mWspgKWVmzaPZnhOEPi6S1COvWPujcCeAKgtEW4z7fmLUWDoYbbIP9/e
         T7YZkCQeb4yK8Hv0Y6Tld+y4DJFqK7eUWFy78+LDWggQWXqqrA83CG6F/x4qUqcRjMjt
         jlFg==
X-Gm-Message-State: AC+VfDw5R3KhsbDLfFE6FXTPCBQIKNCcN/PLqV1OJtax5ts8XUyFyA+/
	RjmX8cdvNTuswpRXBpe1Ayuoxw==
X-Google-Smtp-Source: ACHHUZ7lAAwrKpK9TRhDn+eecpnGOlf2Rzd8NfNRAS064a3cbEl3TUU1UqGLbZuvQvX9QWl2mu2DTA==
X-Received: by 2002:adf:f088:0:b0:307:a77c:c170 with SMTP id n8-20020adff088000000b00307a77cc170mr3426526wro.2.1685524732559;
        Wed, 31 May 2023 02:18:52 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020a5d4f8d000000b0030ae69920c9sm6063518wru.53.2023.05.31.02.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:18:52 -0700 (PDT)
Message-ID: <ebeb1d26-f42f-a57a-f6fb-ae764649f3c2@baylibre.com>
Date: Wed, 31 May 2023 11:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] soc: mediatek: SVS: Fix MT8192 GPU node name
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230531063532.2240038-1-wenst@chromium.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230531063532.2240038-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_021856_365994_E076731B 
X-CRM114-Status: UNSURE (   8.06  )
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

On 31/05/2023 08:35, Chen-Yu Tsai wrote:
> Device tree node names should be generic. The planned device node name
> for the GPU, according to the bindings and posted DT changes, is "gpu",
> not "mali".
> 
> Fix the GPU node name in the SVS driver to follow.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


