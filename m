Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA74C3ABB6
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=; b=MNU8UVnpLiS3wayQ/neFesPyFp
	Lfr0Hf3yPIl92Cjg4keiqMnoCpDp6pgJBO5dDiKIxRvxJehfzgOfLx/gHLwqsetTPdH/+4a7TG1zA
	jss31XZG2XQteJO45T1yhnYz0neYeZkiWjS21MUXl8811k6w8koxsENZgfxuz+1f32BWNwlH9e9lM
	r2/u52tFK9BjBIAYevM4Sxe9GAeBKUZByiLrLLwRj+uS4gjd8lkAyAPyRlynMFGZVI1D1+KtqoW/U
	hkyJTmsu+r3VMzyrpc3kn3EoohS+E/ldwzOYnmnBgxM0HTgN/gbDrU6br/7wfwYysUxOK+UhcFqFk
	LvVCDDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtoo-000000078gJ-2hiC;
	Mon, 05 May 2025 11:17:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtom-000000078er-1rpd
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 11:17:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so35102445e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 May 2025 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443822; x=1747048622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=cQ5HgKwFBHnqV4aTk4rGj2YHBp8B9zJ8WdbStrbwaUG/UI670LYLyw7IVEDCGXeA0W
         6KApkw/DMQQBs2mFTtPDPK7EGs2czNQOu/+4lYNySbLgRha9NyhN1SxKe3asBO2JywR0
         a0xaIji474nZH55Rfcmsu26KM8yDRCRr6oNVwjcpbpv69TViMf8kf8RQ60kwuD0311YP
         j4HZpcQH6ivEisHvQPkhXr38HFqwo2Kq30vW+pWLxo8lah4WSGIcG1K352BO/T44lCsj
         MoM/MJkv7SpoRYK9YoSlcR59QSMQTLX5OZDDuZiUfSXW43PcZtOZKGkVmWLD5FkVdXQn
         a+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443822; x=1747048622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=oPxTbJpabTnWSegqY5qAk0m+aTz9sdT4MYhQ1EmVysEGOMS74MdufLWYHJ1KGTDo1C
         z/LNyRx2b99VRjPH7OxSwL2zPmGI2++CnrTVR8EMj5Qjkn0eQWnjXvcQkYbRC108+iT7
         kqSQG/t+m3xqsfU0A/NN5ftjRA1eYWL/wAH5X7CU7wI+u9GmRKRpX7p7WpNxlSWrcxan
         cTtca3bAdK/Ej5hTGE653hEQefkKyIZ0D5evpQcRBQzpG1vy4qRW2IMoVECYLWmEhTb/
         s+A1BH9kwudoPevpd8ypXdrggmnmpmk1xn7Bp+LyIIWi9wVYeuOn9Gtj9AkZuDd8TIIs
         MD9A==
X-Forwarded-Encrypted: i=1; AJvYcCWlHMNJVwdnrDDtxX1dCnI6wrj+HczJfkr7rlTldSosDLrDFfYdIBrlL9m4DHoixEqEZ2DBMzyRlh7FaZ91zg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7AHbRGvGp8oFak/tohDQ1tK20nxmiAC5dZZp+czb/3GE1m37A
	JX5Fx189rn6MTDKgOgiAnGZU1yYy2jTyLLnbevkVY+ijuuUcatRHHU4tdAJjkRs=
X-Gm-Gg: ASbGncuG7uFXwsOp5qEhKABxABP3ikjqTEfwiKn5XBxsDBtG6WQ8/4B2DrqQLUHaG9v
	DNU5tAa5L0nbtUuFfQp71iNhmqw9smx6z5LEGTqqDJOa2puwb0a6TUOP5a8mN4p65nYrpArFQnf
	GAefwpWgC3UNyqzZemh/FZQ206GVd7BGz6I7MF00cORjoeZLzkrbyvbPqKE0zwnT3XNvZ5ULtkv
	2yEbLAUWAiiMMzw08WFmLLqCoLnVBPGIB6EELYymJreDYaRl1nn4XzxRdW0btbQTqGF8fy7YSCL
	qJJXrPzXRFLnA92fT+BwkbmDMOMRa10l4XqAN2DNhC4YPAagZOyTmzSGktUII4jP0ycNTewmxP4
	=
X-Google-Smtp-Source: AGHT+IFXGyrq6AF4eSKBqMr0ZHG5ODbF+SMMKNV3Hl/UrsQRAKrSSv09aRoM2DkTJis6kpOovgBnAg==
X-Received: by 2002:a05:600c:83cd:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-441c48aa481mr62039405e9.6.1746443821195;
        Mon, 05 May 2025 04:17:01 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm177760595e9.28.2025.05.05.04.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:00 -0700 (PDT)
Message-ID: <9b93c67c-b163-4026-be7a-a8761a0f21f0@linaro.org>
Date: Mon, 5 May 2025 13:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-6-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_041704_499058_25D871FA 
X-CRM114-Status: UNSURE (   5.85  )
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

On 30/4/25 15:34, Caleb James DeLisle wrote:
> Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


