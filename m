Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788D5C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1cMYk/QcVt3otQQPwi0GgSCciLFitAoAgl4SvI2FMI=; b=zhxvttfkA6JTFvw+I0VeG3TKQ9
	D7J7NqcnfKmb+k/vvOyxHq0D8JBjEhqnc58BFBnUkCc5BZlmBhK8JSQPf3DkNIoSdhHQiNYXfADOt
	kNeNY1IUkPd3acII2z82Onu+AT8BzP83JEftK1mNcKNAcaTy2vzItCUlrGvkQUmfLb5HIGkElQ4Fx
	aF93YrkZRPx3qqYJwl7n8fS+1cr38TOxfZwA4VkODSxnR0wd2iEn6dqKveC3qb4aqj5TLyqUTfPJh
	QNNcHxcZ7d+UV4wfjSRM8dL0co/Ffg3yKYOmNDuhDGCt7IE8Hkj60LSqrTndMWmU2Hyc/VBh5dNQ0
	+uOh1F+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVSB-0023Ih-VX; Fri, 28 Oct 2022 19:55:43 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVS0-0023E4-4f
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 19:55:33 +0000
Received: by mail-qt1-x833.google.com with SMTP id w29so4142399qtv.9
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1cMYk/QcVt3otQQPwi0GgSCciLFitAoAgl4SvI2FMI=;
        b=RDmn6xvys03Iyp3Ip+PslfwuepFFKQ+KpxzcW2yVmKdPlB3U3KDAuRdnp3EwitvHHc
         VwPBVa8Fudjz4iJkOvdowQy5lHxDm3jRXTr59Wl17UPXNHAMitx36DJ3zbC/BmwTyD52
         yaPAOSRUfP/xlPabt1DefEVa9lDKKycepmtJojOMnlPqe59GjGagShGtdTsDRpgxJcBA
         s2Tym3U+J+BTBUPaDa8AxZxzmT8XPs/Be3p3GMzHc6oPFg3VTXATJuJZKghnZhkOncCU
         SxQoXMuiU9xSRSfkOD0vEHIJUuSLrFjCdDnHEIlE6vYiOeLpkhPorS13jTkpKMU5xtMF
         y6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1cMYk/QcVt3otQQPwi0GgSCciLFitAoAgl4SvI2FMI=;
        b=q2tZr00FxBQHdVaNFJX2ZqarGPFGyBMeXLvsd9DgFFziFF2R0Fpru75/jPSVX9TSAG
         gimvsp2M6ZZJU4hhqvd2L0P4LtHNAbxpgTFOm9KtnD73bEmF09faLRAmY8FxZQSY+kL8
         yyl3w3MURDH22YUKXJbVsf14YEP8DkUCGBmy0fY8JqzA2WIhU29kzU5Ud7Aimp4OkAIl
         yqnNlL2PRHovOzdZLR6jEO21Y/+yeErzoGOs03HGs8Bo1w68XdRVvIuLNYe3VIZkE7U2
         8+882of8C6IDc2EGTLF+yhnPC4KVXbnZHQImu72aoFEit1N1YLw2ihFpYDNPfBmQT/lW
         I9+Q==
X-Gm-Message-State: ACrzQf31fOKk4zGCjJm3UXTFRVjOOJef7T+/hHHx2iC4nFBm2PjlBlEj
	B/uGIAmgVHvdW48mvkuqZGmhjA==
X-Google-Smtp-Source: AMsMyM7UmZZuftM3vBoeVqW3MDPKHX+uVi2DQLWsYOGwWOIJqd8CRjl22MSpLHUoiCpLIk1CyPHcjg==
X-Received: by 2002:ac8:58d2:0:b0:39d:ac0:b5da with SMTP id u18-20020ac858d2000000b0039d0ac0b5damr988334qta.631.1666986926468;
        Fri, 28 Oct 2022 12:55:26 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id d17-20020a05622a15d100b003434d3b5938sm2891298qty.2.2022.10.28.12.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:55:25 -0700 (PDT)
Message-ID: <bc7bd112-53f4-a372-d1ce-d3ca99928e8a@linaro.org>
Date: Fri, 28 Oct 2022 15:55:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 06/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Improve interrupts description
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-7-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_125532_210345_BF557CC0 
X-CRM114-Status: UNSURE (   7.47  )
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

On 28/10/2022 11:34, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Clarify the meaning of sysirq to avoid confusion.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


