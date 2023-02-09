Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A111C636D7
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5iTn5qHICfiqsqpN93+glR9L8WT+oZVNTGa3s9jneQ=; b=Pjpoxb4YmaYk1qKlrVZoWqJpwn
	QElnaRYWrPMpNXiwihyfbfmxcRZwMSj08nrnQRWrB4J229KndLtk6oj248B0HwiQt/VtD1+tOHysg
	IIyBt03ivxNCeh6//jjzH6asftFBjwFRbI5RrUrgE30lLKLGivBHOGUAe6/Rf+S4CQR3YHz5uF/qY
	gMIIYvgNkjDqV+dXSKYMGC6ZdUE/MhYyxUGFmZSduFHRQaslr4F904YpWTETKsjw7Mepq1VbWurQZ
	GG0YPIjg7Q79dxdqKweTFXHNNP/6pYZ5IBMtU49/CgBkcAguvRTBRt7GeuZ0DG3WiBNpRRTCCs2da
	bq/fQbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8yR-002F0T-SO; Thu, 09 Feb 2023 15:36:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8yH-002ExJ-MI
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 15:36:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4185556wms.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 07:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5iTn5qHICfiqsqpN93+glR9L8WT+oZVNTGa3s9jneQ=;
        b=V6pxhFNcWiY6mQbH5NekoKlp+dqbovfjIGFV8l+kROcxRDUZaJsEDDWIcdAC7W9/kk
         sZ21StiNutAsgGazHGsI662OnXW/i7wj2Alb8WjipjIeOjNgDCYCa79z0C/IAc4aRe0U
         hUR5MDdDm3C4mZXs37j6dYBlffdXCrsEImUsHZpAD5rqYyl6XoiylpDLMZpmvN/sRWlZ
         Wy1bajfh/Af0leXOvVpEscESFtM4l3UybtwS9woafTliRr2Zd/bwbs0j0wY8B9ksZNlE
         RV9sx0u4O1Ozxox6akiFHhLPYQxwN1/x66PNG45NRygf8Ah4b3RjxcwoCCWpGYf0MAFY
         fM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5iTn5qHICfiqsqpN93+glR9L8WT+oZVNTGa3s9jneQ=;
        b=dwKtkiGyorBhBauGI1kv0syIwoFj3+8Ss1d99ihyjjBwNI3mv4YlkkLGoRso4IJ+YX
         pUm8VZilNnRrYF+HctXwf1scCTDiXDXKrzfN2F1HRskQCSkyiz9NsoCIrVTYNqHP3dVf
         Iy5hvKqksLFK1CUjynVQcPKWC+DK/acyzpiKhReeqURkVIxnK/ArlPMLTbqdtHWV0+CU
         MH7D6sAvIto/lKP7LgrGCm9hxaDTaACXURvi+RWg5+EtQICc6L3cCqcTBENBNUrbMi7r
         ZYeUxOb8k7n/N32qLaLfCEbMb/jrfu6oJ+YIYbdTIUXSVGj8apwEzJajJ/F+pIz5vQbR
         gIJw==
X-Gm-Message-State: AO0yUKUXxhz3WnJe9JV+xLZhkEPZv0LWYxYJOMC6uY7Ovi13XhGR3dwt
	tz/1WWEGMzSVklO6lRaO4Dlauw==
X-Google-Smtp-Source: AK7set+j3J7QEIYeKrfO0e2DuDvHdVBcKUSH+28YT1lZlaJ4hA645APpgWyq/dludToICms8VZ1ndQ==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:46f6:e607 with SMTP id b26-20020a05600c4a9a00b003dc46f6e607mr10495670wmp.3.1675956980059;
        Thu, 09 Feb 2023 07:36:20 -0800 (PST)
Received: from [172.17.49.168] (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.googlemail.com with ESMTPSA id o19-20020a05600c379300b003b47b80cec3sm5162406wmr.42.2023.02.09.07.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 07:36:19 -0800 (PST)
Message-ID: <fdcea75c-1ddf-c4f4-5d46-f32a6619b66d@linaro.org>
Date: Thu, 9 Feb 2023 16:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/3] Support timer drivers as loadable modules
Content-Language: en-US
To: walter.chang@mediatek.com, Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230208094813.20874-1-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_073625_747185_AB0F9431 
X-CRM114-Status: UNSURE (   8.36  )
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

On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
> From: Walter Chang <walter.chang@mediatek.com>
> 
> This patch exports functions in kernel so that timer drivers,
> such as timer-mediatek.c can become loadable modules in GKI.

What for ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


