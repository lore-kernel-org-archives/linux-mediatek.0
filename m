Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6450AC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn5tnLFNpGNvBrf/K98/ZrzIzWDByL2/KUE+XN0e2lI=; b=fRJtboGcO67j1cPDXOF/A769vS
	u5mEk2FLVl6LSluz8T7wvB8EHiCwky1zEYhphoNg3n4jSugdtxlafPd2DsndUlfyCCIwolQezvTLw
	Md5hHCHRXSGdqwdga6Nmffzm1nO7bhJNmhX7WpjvtxJkJRkZkdWQGX9c+7P9iz4VJXyeRBo8Uzr0s
	Ny8lM8Wx9QvqLGNukBivq71aP0EowakjhfN110BS1Gr6nhmnKExCfUZgRLOhSAFwqYhp6NtNYy/jm
	DO3QBsF6/rC5ZWt1EzFXbumCqlYcOlyaf4RAV8QrfEE+IrcfNAqE/Qk+jVQdU1+u7oTj2sdlFzexY
	Zp754CFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7zj-009xD1-JR; Thu, 25 Aug 2022 08:13:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7zW-009x1x-QG
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 08:13:32 +0000
Received: by mail-lj1-x229.google.com with SMTP id l23so7633410lji.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qn5tnLFNpGNvBrf/K98/ZrzIzWDByL2/KUE+XN0e2lI=;
        b=ZAkMiEwm1HWoU57iTsHZcx4crwgdjTbODQ5RTgCOhXbJF2c2UfRpNRQByhuFrxaLt2
         /jt0tiffVj5XoGQirXeuwMRm6rDtV954NtlKcxvgyKZ1/ArLeA0aL45SW76utZHFzVhb
         m8EehFJCDeX0WZDyXTc8PLfidLri9PJD/JP82XqEsBf8Qzy54p6m+5/ltJ+3xHGe50IS
         +kTZLbTvjgmAqUYh41o3UvLDmp2TR9kDXNmQxIeY2yCe8nFQcA9R8762uEUtSHT0ckbP
         gBqwltQVcBlHAuPr+fQX3w4JFdGmbvdTN2l92vMNVEFHACvYYdFugMxeD4P9u6CHei2T
         UDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qn5tnLFNpGNvBrf/K98/ZrzIzWDByL2/KUE+XN0e2lI=;
        b=kBcdqfy5baMxKio+w1+Up9mlDFM0I7fKn8n12rFBDn4t0qIAXfTfwr4DJXYIfiiNQ+
         B/UUk+/76zq+4EXLwU1Q7pZ0k3tt8Z7LjdrCNmcSfTudzL1JEemVEAOJer7guiU6E34H
         S0KWFQwH1mNOtqzf+aTNt9FiYl97sMapE22Jn4VcnnrDzaFSvrtdT9+++YEnCwmb4XkU
         HG8sOw0GSUntd+jzeSUYVeIYOHJXiP+HIYyqtBlnqPjLFdAozVHi3Z5I5ePovTvf+QW+
         h39F/oka0lFLI0dRZXHc50T+yJrFZAoN8pHuWi/C4Qm4LPYCoop7oQAIlJOpWkNjdkeN
         zbiA==
X-Gm-Message-State: ACgBeo0Vx9RmfRGgz5ELPNExauLhMv2VldmqBiJ2097TJdDLDbBKvfVO
	mSNmN3BY+U7JjEQzqA1gPPnQ5w==
X-Google-Smtp-Source: AA6agR4WcpGmr3YAjURQJ1NfYCPefM99Q4A+Vkw54i+ZJfnnK14evDd3BR8AXou5krL0fKPpiRaMWg==
X-Received: by 2002:a2e:824c:0:b0:25f:de27:f013 with SMTP id j12-20020a2e824c000000b0025fde27f013mr709733ljh.447.1661415206244;
        Thu, 25 Aug 2022 01:13:26 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id y7-20020a05651c106700b0025e42f8e771sm406559ljm.34.2022.08.25.01.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 01:13:25 -0700 (PDT)
Message-ID: <eb8dc532-f8d8-15ed-af12-a0d945db9a5e@linaro.org>
Date: Thu, 25 Aug 2022 11:13:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for
 MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "hsinyi@google.com" <hsinyi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
 <3ff08ae9-a4b6-2b74-23cb-69ea1d7e1033@linaro.org>
 <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_011330_870639_8B8DA536 
X-CRM114-Status: GOOD (  13.50  )
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

On 25/08/2022 09:59, Bo-Chen Chen wrote:
> 
> Hello Krzysztof,
> 
> Thanks for yor review.
> 
> From the functions perspective:
> 
> Hardware pipeline of VDOSYS0 has these components: COLOR, CCORR, AAL,
> GAMMA, DITHER.
> They are related to PQ (Picture Quality) functions and they makes
> VDOSYS0 supports PQ function while they are not including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component).
> It makes VDOSYS1 supports the HDR function while it's not including in
> VDOSYS0.
> 
> About mediatek ETHDR, you can refer to this series:
> 
> https://lore.kernel.org/all/20220819061456.8042-2-nancy.lin@mediatek.com/
> 
> To summary:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Is this description ok for you?
> If it is ok, I will put them into commit message in next version.
> 

Yes.

Best regards,
Krzysztof

