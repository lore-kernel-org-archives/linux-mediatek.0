Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l7aMfmqCryjQwAP7nUR3rR023wPhPFZ45uqdGA6vXU=; b=dIqJI+ifi/YiT1NcOhKveN69HD
	Mxi6f+G/p0fFz86BFH+5/JeuwtJh1614UF/CVlURDZK8GUHP3Ee0hUIFohMBo2fT/mVB2Da8NmXPE
	sK22ntT4ayNSWZjplr7MzKWogmizO8qrwctbGzieLiPXjtpI9DX3I4yXDOX8S3YKoLVajOCRGAU4+
	da5G3XFtaLq62lOgsA+6srVwKRQZ3ojnIhLSK7KbLIdTlOrd4CkyuvZlTfT/m46WocbBdbjr2D+di
	cuvMYi202F6cAddpuEuZTjrnb0s2a6j2G2nAI7c8R+nk0bt0CgIsuD9WzofejKBmhAjv8Z19znAon
	AcQVdrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaf8u-004rVL-3C; Tue, 20 Sep 2022 15:26:36 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaf8d-004rNC-Pb
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:26:21 +0000
Received: by mail-lj1-x235.google.com with SMTP id l12so3415666ljg.9
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4l7aMfmqCryjQwAP7nUR3rR023wPhPFZ45uqdGA6vXU=;
        b=ug41M0juoWTyFjlJFI3JO/BxOIkOyJX1HmmPygZID/A2DnhJvRY/vpvmZ6zDKaoN/9
         0iVDpLlXaxIX34fhgBHkS0UgbP2o5Zt97FlJwookkZY45p4frVPv0qG7BPk2Awsn68VM
         00DNt0kp/ihgQi2peCOsZnd7seMCnVOyGujvrhehLXya/jMDPjvMCG7H4luP04o0/LKP
         UAOYwyc4vImp7vdyM17Ul+GmrEkDW6T9/anC236oZqGTSAfAB+0b7xtPmcpXgEdYKGF7
         XC6tXPY5gYECtmW51sXIvoEKcsBSnFO+u20x9LPS+xAtOAHyyMwueAqo14sEm/sPdmjG
         aSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4l7aMfmqCryjQwAP7nUR3rR023wPhPFZ45uqdGA6vXU=;
        b=MAA5k2a5ouh/L8gvxk4UxVjVCvJWp8v9kSsh1e6o+E1EZKqBYkW1P3+ckh3E80+q05
         rGJmX1umQwuc5jUXoIGtDbTbPaEjZnClzpo0VxCf2e18zzzGfi6LiB4Sg45OnU/3D7NB
         NCbW/JjTVbQaQ3F8dg7Gl8EPjJttBjFFsrTPpMsBqH/6KJ1IFNQ6yHDNcesxRCVcwKpY
         oC4GSsfIPoEWBliB9WQNTu87OUliLnFoAFi5GuKxOYjtvluVpKU2E/ccDefU8xqdWIrS
         vCa0ElZSQ8l7OndgjePf3Arz2LU7F4Y8B9eXWUbNMZQ65kB7l9t4dY/F693wOkLijzpv
         fV5A==
X-Gm-Message-State: ACrzQf2KO4KaMypBXrA53jWm3ruoaQ3u4ch0gA79fBjz9PNEhmGI90Lh
	Vhvq24Ndb9h4I8W84I6uRdNuPg==
X-Google-Smtp-Source: AMsMyM4JKyvwhM7YiHyZtwVoNrtUcBKYR2S6GGTDusaMteI1RsYMqBPofBm3W7n40MgCMtIOk+opOg==
X-Received: by 2002:a2e:a549:0:b0:26c:4988:2742 with SMTP id e9-20020a2ea549000000b0026c49882742mr4206383ljn.11.1663687575964;
        Tue, 20 Sep 2022 08:26:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be17-20020a056512251100b0049a4862966fsm10743lfb.146.2022.09.20.08.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:26:15 -0700 (PDT)
Message-ID: <ada6ef7f-0106-6a30-64ad-66b3277d987b@linaro.org>
Date: Tue, 20 Sep 2022 17:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: net: mediatek-dwmac: add support for
 mt8188
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220920083617.4177-1-jianguo.zhang@mediatek.com>
 <20220920083617.4177-2-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920083617.4177-2-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_082619_836550_7C86C732 
X-CRM114-Status: UNSURE (   7.82  )
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

On 20/09/2022 10:36, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>

Please version your patches. git format-patch can do it for you.

Best regards,
Krzysztof

