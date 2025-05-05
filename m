Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B847C3ABB6
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=; b=dffEJcFbWjYMlE2odjw/3L4jLv
	yX72GvyvBhs5BJo38tXOCSCL0WWHf22/ustW/g0v0ZKr3/6r/tDC4GeIjVUlZI2OyD15UN3JjMZd8
	bIbdOKg14t0qVRa73AcQexdGDhsftDp/LqaxlCrakfLhe08ct9Bj81c6yBhoot+ShqgCo7TJDxIGY
	KC8S9d5V4wqzq6o8pEg2H+f2pW8IoD5hVgYysf6WGcxmt6+M6xraiKKHB2txdigh7ig8i6XjlX1rb
	Ph7iIRfjZY0jh45rA2emHKrWqDDlGvXYv7JHioQ5HaYVmaQI3fuuFBQbscTvzjDQ+68YhNcEHUzGz
	tKpRgdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtpk-000000078xO-0TpR;
	Mon, 05 May 2025 11:18:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtph-000000078wa-224i
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 11:18:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf257158fso22917985e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 May 2025 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443880; x=1747048680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=C7CzZ8Gmtum6Jp2/yUaKgo5JIsSUlGqeXUKKWLEOxF3kdVllPh+XIDibzUL3brB3C2
         Pm6SPAZRxK6gepH7ODdLjH33DhMCay3bhrtL65vmFPB2rx3jQvAxgJjpuRoVHLN4egxX
         u+xoJHWvLHtYW0HyadlVxFNSE70DEnCIS485uJJWy6xDSfG82p6ctZUEK14eDjvM9yJ6
         i+tbeN2Sy8GqbIrUMmJBBj1KTeDoDvRJbvMszm+V/QfHTavTtYDaJyvlZIoTbbn6JCig
         8J8JruisCxc5kk2IEB1CWjJKCao/KpJAahizhjAxe1X10xszGnzQccxJJ6D6dP0f4YeG
         o75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443880; x=1747048680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=c9XdYx6zcFpzeUd5xPQToC3nQ+G3mNIpuzb5NlMrxZAWVIiWhCYYerU7JfcTbYo+B+
         PrBJvqRLND0sNZouYsKHw8Mb807Vm57BBQuOlhXvIlSFBAHq+2pTDGTdt7yT5vocjSGG
         6b15+L6O0yPHqeu/g+sW+hhpc3mTC78r/PT4ZuOz2N6XjTZm+E/T3HMmgzfQGVXEJHdF
         hIR3R/TTitOgqzejZa6lN/OgDELzWMMg5uLzZooEkWLKWe83zwAGr7vGabrjwc3PbIBJ
         yeUvs8O3l0BQ0TZ36fQdg64iL+CN5wHxmDxzXktzC1xqCVn4sof1K6cZvg3+JvBazy0M
         o4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUheUcbY6wThGfVbOtqvAxAdrOZjErqIyU3NbEoPxVbtURe4sHqIvqvkDpHBQyAUNtYMBY/Zb00r9bfmaYu7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtzGRJt63NBFyy8Qg0FSKn7fo/8inyrnJO6x26gN5W2NTwhkty
	ercDdpqc6l5nSs5F19YcTi6IQsL9qrST+I42v1TlASvBs+zloplSki/O8JKIHdI=
X-Gm-Gg: ASbGncsJW+S+bkY5Cv0pcbKpFhSJAz/buLIOf4l3YOxq7onJni6sEsiS7u+V1J0Syum
	+0558gOOVKfsu2v4Ss3gG6ORb3euMTJpwBOcre9T5a03GftXOw+H/+G9/rMCVug4LbUtgiIzRjC
	bwS1PuseLp49kiddtx1jztE9XGfnRMTlNhqRZghEUahmnz/THes3OSWJq21DOWSG3OgVrLCtlEi
	7R/pmwjFtqUImmhJ1ZCD5uaw0LCEYmpMxz6fxDlRekGz3B3uc6HK4QGcJAjB4zDy6VCnlh0p48t
	hZUOYswFgBmsEt6PRR5NbKbvddFeuIrBWRN8rnGHCD84ubTsNJQQj8mpWDCcZ93OGXt2YKpXcBA
	=
X-Google-Smtp-Source: AGHT+IHtLeAYgDITpx3deW3jXAAdVKG9LHkQfNIbFqRoTGdWyF2rh3YZeh6jK1CDMoX4LIkyoL6r8w==
X-Received: by 2002:a05:600c:b96:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441c48be172mr62376775e9.10.1746443879877;
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a285c2sm129777475e9.32.2025.05.05.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Message-ID: <33708722-6986-40d2-92c8-38832467b857@linaro.org>
Date: Mon, 5 May 2025 13:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] MAINTAINERS: Add entry for newly added EcoNet
 platform.
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-8-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_041801_518927_B1155864 
X-CRM114-Status: UNSURE (   6.49  )
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
> Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   MAINTAINERS | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


