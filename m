Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7118EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeK6HQWOkE6erW/8t8XvbP/nXkU1GU8xBhJ8mesdBUw=; b=qt7/d0bPxt0xTFduVSizG6Bwiz
	s927+IP7CBICUio5X0gz6CwWXMYaNgAfA2wauN6pCm41jR4lh0AfLiJIE/UuS8/vhsV4W+6rm7fas
	HQ/sZaoSK5zm63+P6fJE+vqH/H/cjMQF+bfcAtH3WrCeW88dLCKPxBG3WGXr0Lh2q+MmYu4fFgymW
	PHYSnMAhR9SyvgqqdLu9ldQm+BzqMFrlDZFyTJbAp2/UDSm6OCjSMRiULgQ99o9j0VhBnttruY5ah
	ZHeLb0wyniXL+WtFKvWoZXm4ZRxc59fXC2w1fecIMe3gTIy3zMCd5du7h4BgcWDBROVb7oA/wqa3N
	6Ve+ptzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfegg-000LPp-1w;
	Mon, 11 Sep 2023 11:02:38 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfege-000LOb-1H
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:02:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so6967932e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430152; x=1695034952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeK6HQWOkE6erW/8t8XvbP/nXkU1GU8xBhJ8mesdBUw=;
        b=LpVY8uxtly3QNm9YPokJ2xn5x5kbeaXcxNBGZU3MWJIQRNfW7BidkA333dZjIGzmCv
         QCNIhRiQvqdQM4D7JYZ9T+mRPYfesQBL/R1tlX1HRW76Kp2CQo2kLfITTkP0jMWOkrGc
         oJQv/vBVAl2uosxUojPzOj7DCH/xuW6YFThoFmZtLy2mFX0PZUn4z59Aop2PYkp63xi/
         3bN7oOrkX6hTTZ17h5nrQo8jBI5+E/EDVzshYhkqDDi+lvSlTn9KwzWt09XamVAprqCd
         gY9zqCgRQhX3PzPO+AX6RpJD7b2fTXMbFfEk3EkzJSb7Pw6wWZ+jCm3jwk8MJGALjOrX
         Uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430152; x=1695034952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeK6HQWOkE6erW/8t8XvbP/nXkU1GU8xBhJ8mesdBUw=;
        b=Mt9DHLrijp1Zwg+J9V2WUiPibkuLCo8oSRyC7aaCqTmX1Q2kN1MGCKXlgnQWq9OLpp
         kPJfNj6ZIyZKq03ca8TMwNGYVfrKEuKnvLuhFvBYiGgo7/94Bm6HSUVHt8L0BvSbDH1H
         7VAV3NNvvYWuRro8F7y0nIC/W0kylCda3YRw16pwUA47I4R0iGoPW3izKyFMSzLGDQV7
         Feyslt4i4IvhC0aW7YkEH3VXNg7s3DOU2lfextCbVmPuLC+5BoXcCTUlRGgHwaVNRm86
         wvyJ+azWTYxJTZjm/dMxZemUBZFx/hJ5IcysHkcygYyJU/l6LgiLxuSAxHvzXdfuSQst
         e/Lg==
X-Gm-Message-State: AOJu0YyyixIDgx5uJI24MToH7HlD8O1mnUYJQgPc4p8gXBeA9U2FbvkC
	9XmGrQ973K+4lioUWGdQ4Rg7xA==
X-Google-Smtp-Source: AGHT+IEKKrXTCBCABNJdmP3x5+smqQBfXEnldaNpLWrHhAXFPqtMZ9mgYBI5HztaY0OQCZFgFLOtDg==
X-Received: by 2002:ac2:5bc8:0:b0:4fe:15b5:a5f9 with SMTP id u8-20020ac25bc8000000b004fe15b5a5f9mr6933428lfn.54.1694430152499;
        Mon, 11 Sep 2023 04:02:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id pk24-20020a170906d7b800b0098d2d219649sm5250690ejb.174.2023.09.11.04.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:02:31 -0700 (PDT)
Message-ID: <e833b9c1-23e3-f8ad-feec-000c053bd020@linaro.org>
Date: Mon, 11 Sep 2023 13:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [REBASE PATCH v5 01/17] docs: qcom: Add qualcomm minidump guide
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
 mathieu.poirier@linaro.org, catalin.marinas@arm.com, will@kernel.org,
 linus.walleij@linaro.org, andy.shevchenko@gmail.com, vigneshr@ti.com,
 nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
 alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-2-git-send-email-quic_mojha@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694429639-21484-2-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_040236_433360_20473231 
X-CRM114-Status: UNSURE (   7.48  )
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

On 11/09/2023 12:53, Mukesh Ojha wrote:
> Add the qualcomm minidump guide for the users which tries to cover
> the dependency, API use and the way to test and collect minidump
> on Qualcomm supported SoCs.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---

Please let us review your previous patch before sending new versions or
resends or rebases.

Best regards,
Krzysztof


