Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5JrFNsrdURrynIRcNZ5G8lGyEvwaVaUcx1O/DPUMCE=; b=JSx2MB3j19b1LHuIsyz5noLqkR
	RiBSGjiZNVOHGWSmBhRJ/W8DAmliI23WSN11HxmMIM6o2QImWVqIeLI6scT35cPNR8LD9X0RBILwc
	s7hM2XguSNyA0AnhVZhgjsAH2EDEpM48D954uSeWzh54WhLw4I0epVDDphCpx6kJqwDzZZrew8sTS
	nc9TTqr3hbGGwLR4ABSGXPxXNbO/+qLQwQ8VXOaR8fDpL8Jua4fyU/ctxoTy+/0ljEk+GIqaXl3Kp
	s3sR3YacOd57C9DG0RHEI0mCR5abAWrCQq39qiP3HJ8JXhnt41bLA0dOEcpwzE/b2QCdVECfFMBer
	y2PH9foQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LQa-008rjT-A1; Mon, 04 Jul 2022 12:43:48 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8LQY-008rhh-7b
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 12:43:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id c12so824822lff.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C5JrFNsrdURrynIRcNZ5G8lGyEvwaVaUcx1O/DPUMCE=;
        b=JjPXbMtWA9vv8tvadTWpTLKLbjayx2W7t+ABNkO1YA/UxRrfamtA/YmMlUg/w2z2js
         9udkArH5j8quI+j9Ql9xioaDARBfnPc0bEstZ2hMmTc2oviNnO5Soa1ce6lbmehPpKcV
         t4WXObEOkimkLSUmqXqbmbyKyK6P2OZtEQOIgV6zzzvvPWBdDPv31Ntw7RKeklOIfsLm
         Q6slfXgeFvKe6nV+Pnl1YdcRKqaI17NX3rM9akGSpDb4OIBJ8+9swkD2L5skjWRB8gfM
         7t6Lyaq4VaKxmGciBoLo6Ih+p7rJ0zUG6vjTd6FF+NUc89vbXdbsqvg4fdnCXXwha4Sp
         QuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C5JrFNsrdURrynIRcNZ5G8lGyEvwaVaUcx1O/DPUMCE=;
        b=VkNlXXANOBTIklzqmsein/k3WFTIOpM3L9n19rWrtJeNYTnTZufKGzSmv0ijhHAs1H
         TsPGf2YDPBx/fi3jTZlG5e8c3+XQ3yg+LIstToQtdpE4AmcJ7i/xAP1KOeSTfG9A9u4S
         1BWZ4A65qMGG8/1Ln/fzNWbyhzJxnEY2kw9hAzWcV5HLxW2wuN4ldEEGNvLonGjuqfd7
         LVrhM/eBO/njRR4s0zrzW4omQB+nU5VzRoimK2LaxFGvum8ZBXLnyyE18qnH6o4NnyVD
         k5ekSP6LOiTKR7XnRySTlqdhTiS2bS4DCdk8UoqWR5wiV+lA7c6vdPlsxCgYdd6L6OPc
         gCQA==
X-Gm-Message-State: AJIora8WZ8fEDBHOSnnd7THiH8zAXidQe6JWRVGYvJFJNGdQaYGrWahS
	XgXKB+u+mXCBOiv5Cr8QyAO1XA==
X-Google-Smtp-Source: AGRyM1vteyLrUKmrJEdE96gqsOwiHpBoFFKT52joX+DoYuA8q+pmgAV06t9T0wuyGgrz7nqwUaAwiw==
X-Received: by 2002:a19:4316:0:b0:481:484c:404c with SMTP id q22-20020a194316000000b00481484c404cmr16640237lfa.559.1656938622879;
        Mon, 04 Jul 2022 05:43:42 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bj16-20020a2eaa90000000b0025d254180d7sm284672ljb.113.2022.07.04.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 05:43:42 -0700 (PDT)
Message-ID: <8c2e1b9e-9fbb-2593-912f-0893529748ed@linaro.org>
Date: Mon, 4 Jul 2022 14:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
 <20220704101321.44835-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704101321.44835-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_054346_350154_2356CBE0 
X-CRM114-Status: GOOD (  10.74  )
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

On 04/07/2022 12:13, AngeloGioacchino Del Regno wrote:
> Document board compatibles for the MT8195 Cherry platform's
> Tomato Chromebooks, at the time of writing composed of four
> revisions (r1, r2, r3-r4).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Note for Krzysztof:
> 
> I had to add the model number to the description in here, but I
> wasn't sure whether I should've kept your Reviewed-by tag or not.
> 
> Since I was in doubt, I decided to not keep it just to be on the safe side.

These were trivial changes, so keep the tag. Anyway no problem:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

