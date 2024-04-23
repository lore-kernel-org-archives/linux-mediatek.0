Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41530C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=; b=FMopgtwB/7yUpUNL4cRwD4ownI
	T172cRStSXBCUBLZZ0p7DES0aPLnHC8jSEtHFsCLEUZpIRrppukswmDns2jnSAm0J+Il3YY/J6dcl
	RE+7y2rwuG2VeLeXBU6hUBd+4qvqtBkN5yhME2ydmZl0yqVZPif+VTmbxtLvPmA+1H/CZdLG5AhpW
	INprEl3J6oLXk7nLoIx+5pf4p8rgsjJlsGhcVOgNIxoyzlveCkiUOcW8soXOWyTRHjRJXyZy4TU1K
	4WaAq6BDs+T44oHkL7Rd+Up/pTlPepXfBlmHpeo5UiVaLG5Y2EL0OcbkAuXhONfYwhupinw7KbD+Z
	MYDYA03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJEh-00000000ndh-1nbK;
	Tue, 23 Apr 2024 16:43:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJEP-00000000naH-138g
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 16:42:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41a5b68eceeso17865965e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713890575; x=1714495375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=tToiVWbI2I5dazoGCYUGT8ZwGFsUhF0fV1/ZQ6dAtkzzxgYM5+3OjArxoxn7VPlI1J
         VQ6vzXbvSI1Tw8111RxvLiIMdHeejCes2Y9q/RtBQNvNJ9fLmq1nKKhuKCYfbVedVCnt
         biKGKu4SMaXL05csbdKdpH8m+KCeShfVxCdNJ9GXo6MFpJPiwvuYaLf/VhrDaMkGTxcj
         IySo2BF+UIlZPU8dz03glD6Hp/HbEyB2i63ZU4ZT8jgZGb0eSBVCmnCf3KOzQPohKwot
         mGKcvaAAhqazbpuyToY8nl5eRLOH6nDe4TvlJkmy1YVWg9t1mbd6oiT7Pges/6TUyL10
         w8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713890575; x=1714495375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
        b=gElUpy03PeZx4s5a6kEU4v39mwj/4BfmQtW80MNuuNw3XNfEAShAdKm6NteBUp73W0
         QZHMPXhAaVpjndP9myg5ksAKJbOTlNRbw+HDZVxeLx94IX+DoX/R8iTayzka0FSvD7jR
         8hVGpag2RUSz2PTF5sNplXVfYOlJHDXgIxKSmGiYrJug/mvER3WMGVSYM5QWiiBZ4TKn
         QTBK3pdaz8/3RP3uSG1wUiVc1bF3Rk8mSC/o/nAuwEAs75HzlGrLUaCBXZs0BZ7dZGVV
         FChJEa7v/r7m+p8cFNGiw6TZiliSC39PD0PVYu/eXpqATLAcrcAlFWqIm+JCExi66DzM
         etfA==
X-Forwarded-Encrypted: i=1; AJvYcCURNgcBzHTq/1Yngnz5KzdZKQbRs+CxyscUb9C7HKPQBc+fsyxpz7dPQKknvD7bOS7Kb8krvSitiHWeROp9T1GuE9lwh0UxKp/VJFx72qZfs9fR
X-Gm-Message-State: AOJu0Yy4Ft3s4nXLsGFrSv+P1bQ7IxH56F/Rsj/OSWFgxpoFFJZ9YqUY
	EPNkvoRvxDIm2GLTBDYhYZqm4a/lSQ40Bl/QAaPFuKY2HsewQB2bV1n8DmQwUYg=
X-Google-Smtp-Source: AGHT+IFrxYPbNd0JIn8yeAWouLUX4KO2HR4fWg0b0VJjkA0zy4qA+fxtUoj+497CZ/NN5m4uB+meNA==
X-Received: by 2002:a05:600c:1c9e:b0:418:a5fc:5a5b with SMTP id k30-20020a05600c1c9e00b00418a5fc5a5bmr10146720wms.36.1713890575406;
        Tue, 23 Apr 2024 09:42:55 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b004183e983d97sm20619705wmb.39.2024.04.23.09.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:42:54 -0700 (PDT)
Message-ID: <3f5c46bc-6fe8-45a4-8929-7b93b276478f@linaro.org>
Date: Tue, 23 Apr 2024 17:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/35] media: stk1160: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_094257_365712_77106AA2 
X-CRM114-Status: UNSURE (   7.95  )
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code.
> 
> Found by cocci:
> drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
> drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Show the commit log some love, then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For patches 16 through 19.

---
bod


