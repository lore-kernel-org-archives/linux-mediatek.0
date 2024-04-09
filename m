Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C748EC67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJmnxoz+cMpgq0WmNUJv1TqkP9ZYN8EAwfDEGZy9D1Q=; b=SQMC+wP2ipNeew8s2pOaYqezSW
	B830QRKz4N0uQbxMEy4uDile2CGf8YwQNySUSkjJ5EOwRjjNGbT5NctLGGy0rK0+VWWcMXhN8cZ8I
	sA0DdEbvMJkXxhPSyQhv4bZGHx//Qq6BGmDnyOzAqk98mTqgY2LLnbbmtKUNFdbsEgIR9YAcwoJog
	C5J2QPSrOd4lsBHyzs6JMVckHxgShwXWY7m/t8a7oP+wwx7m6zB8MijXGFl8pHjbIDdIIOeXKlmRk
	ZvNPYN5X14P4lNlnbzY6zj6Mhujtxyd1BicM0KRD/jrPUTps08xwtpmkYYTa2VyqSvoTY/Y2cTxlz
	5Il20rIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIL5-00000003mdf-24gO;
	Tue, 09 Apr 2024 20:45:07 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruIL2-00000003mcY-2zhn
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 20:45:05 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e44f82ff9cso8035ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712695503; x=1713300303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJmnxoz+cMpgq0WmNUJv1TqkP9ZYN8EAwfDEGZy9D1Q=;
        b=Pk0zAu1XbDeNFOUZz87VGCPYDNvK9HcFwLXbojpZNZC5/E3KGPiFeyq9UZQm9NA8zc
         mqdm6EDlc6ClTr9KECTelSYTTjSHz4cFz2FPTfa8nZuSNaotQxifGD2hsOHPLguKwcJf
         kugA72QXSGx6OwMM03LGPpTupqC2kzHK98eJoz9XD1CvxuhnvLuJTe3Qfz6mRN4Q+LWP
         HQGYMSUG2S1Pe7qaQ+FGnVYv44Y9OBI1MC03PNbwhmiLALlCD9MCiX67kGtW5rcIMqI2
         jhUVjA9xuFDCmz710hUueuno3n9aspotZKaqzp2mdrat9jy14H9zFFhIMHIR4xmepAW1
         m54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712695503; x=1713300303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJmnxoz+cMpgq0WmNUJv1TqkP9ZYN8EAwfDEGZy9D1Q=;
        b=YkJpBJOa69hH1ogYpKIgfSY+6LimDQLYwHeOjMbk3oKSFXVXRZGGIzZQuiufNA+qML
         euqfjyjoZl271hk5z/3SWerLf59D7u/YOUOeXq5vpxv6LXg2xcgsgxq4IGAlxPoFNyNP
         Gz281hhCGa16xE2uO1hVZXqz4gwAUds9YbB4Gm7f2W/fbF3QffZ4D/BYnTGNVm+9QCBx
         0015om33UFUv7Q1afXjc29RdkdFAFBIagoEM9aJAQhlQp3o1VqfKUmHuwhyZM9Ge85Vb
         A3NCNvVl0jnVGvPwCvRITDUHYYjxSlMXpAzsXsScRZvpD9LQQzpnVlwaEFLeQCWAyooK
         deJA==
X-Forwarded-Encrypted: i=1; AJvYcCUzJhptN/3znZYgCn8DhjlhWWIbYMRiwWsGoFegr2AeeGuhGtd/dt802CGOvQbp7HRSuBEi5Ai9AS0fbkPtOnJdFdQ3aZpDuDcitmf2SGmeKqHM
X-Gm-Message-State: AOJu0YxtD2YrKHdFKaX7pnstauNYQmMQSx7f66kDEFvYar26ALk76vRq
	Aogn978xoWB7D8oLQq3WB+gPVsTkTsc+XqDmr7Whebh0XIdE/L5DoiqQv4S47sTTuiq5vOnCwd5
	mxGQv
X-Google-Smtp-Source: AGHT+IFa8r1jmAE3TF87p+ZjYjOxHmi2FAw+CssDTLHycGO9qMsOeroqMfRmi0AE4GzvGCr8R3G/6Q==
X-Received: by 2002:a17:902:dad1:b0:1e3:e1fe:d43e with SMTP id q17-20020a170902dad100b001e3e1fed43emr6535plx.11.1712695502499;
        Tue, 09 Apr 2024 13:45:02 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902f1ca00b001e2a7ed52d0sm9389391plc.239.2024.04.09.13.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:45:01 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:44:58 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] scsi: ufs: mediatek: fix module autoloading
Message-ID: <ZhWoytLROIi6GP7s@google.com>
References: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_134504_789897_5A1EBBEF 
X-CRM114-Status: UNSURE (   8.09  )
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

On 04/09/2024, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Cc: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

