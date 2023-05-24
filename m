Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053F6C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2DZMvMkI+V5RMAcXCANfBiGO0oQRS/4+8XHUn3qgoQ=; b=AilURrzUQWMvSwzysuNtVYAplC
	jOsfrRm8KpJmRIxTwLOtyE9GgsUCovPXyWsknOK4aofPHtTaPlgKPSpOhcCYt99R5Kd1+Cikrw1Xo
	masdUua1hi8Y1acqnavBrLdz/KMLRbk5fDOg3KrJfORpKsfrC6GpWuZaORcNkQfinLnKk/pplAHaq
	G5Kh/4Wil8r2/pTMNquasxEKoD0nWcbXxXq9FfeB6BalRJg313W0PMAcF+IqnxYwKzPxyYe2t1Kae
	XztuDLomoj4jBSBJ1hWwW4D3qItWaS5i6j7ts7r/A1/DZy6PstkkwB5KLI6jDjk7m7zQjxscrDuFv
	brNxW5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ppa-00Dk77-2H;
	Wed, 24 May 2023 14:51:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ppX-00Dk5n-2a
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 14:51:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f605d8a8a9so12569755e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684939869; x=1687531869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2DZMvMkI+V5RMAcXCANfBiGO0oQRS/4+8XHUn3qgoQ=;
        b=YT+4PyG2PpzfKSBHI8via/8/85UUkYBO2UQIpGyWv6Za+qBrjWJtqy48/7FF0kjuXS
         RMowXnKeB9ZUFdWVc02eXhlevD7TG5KMShelI1AdHdYOdM2/focKmgSgHkJTQVl1hH1E
         583D9fVRRW7QNbiEQsBi1u+lVIRB+0IiP8nSx5Q3NGOOjOE1p4Fv3Gdxj9zcGgldrsN0
         v+Owz0hzn7fVsVQl/QfZp38PHyTcyN9qsiWdkr2Z04AyMtXOSKDIvDODXJyyQKKt5bJ7
         Q8rffHMfEiZe4LyTr8tGRM0t/YtOcfIAT3wI0MsdXaO+QrL6w6KCtyeSFa3/ARp0/w+i
         fPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939869; x=1687531869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2DZMvMkI+V5RMAcXCANfBiGO0oQRS/4+8XHUn3qgoQ=;
        b=KIGn/vPU47KQ4TuG8pnZhePgsescrCjsIr8u21z0rgojLnbGcSUtMHavZvp4itHPIb
         xELjNsURCmZRy35RW6PGJ3vX7QtszSugrb9yRhDlfHljBZpJ/EbuDt2oF4yyvDWCiP7w
         hpDpxdrVAiNl5Jax9yIrj10xAUU/XJu12dYk9IPvyLgYPXu5GoWTNJmIHJm3AxgK4hn/
         Rfa/om+My7D2Uns8Z1dEJNZmuIG1yc55POgoLS0bqOdTeW4AHbSDyHs7xOnfjFX3fBGx
         FU1iy+zACuxUU5li75TOj9suZ38o7lDVTLMAp7VTb7YDPPA3fOjQmjIttomgN1HjcNCk
         BojQ==
X-Gm-Message-State: AC+VfDzzwnPg9UZ17QlhCa5agt+7meU1ZT3KK9StHeYd0TRy1nilx24m
	3BEqn08FCvL10UExbUI7jt0cXw==
X-Google-Smtp-Source: ACHHUZ5wWAGNXmRoeycTsyYGzAOS1ytBUa6At8n0AYB/K3UfJLVFRhbZwiqycV6JUKARY/EvMGybsA==
X-Received: by 2002:a7b:c40a:0:b0:3f1:72fb:461a with SMTP id k10-20020a7bc40a000000b003f172fb461amr86103wmi.2.1684939869319;
        Wed, 24 May 2023 07:51:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id x26-20020a05600c21da00b003f423f5b659sm2675744wmj.10.2023.05.24.07.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:51:08 -0700 (PDT)
Message-ID: <e13c2670-4877-7e75-aaa2-623f4ed927c0@baylibre.com>
Date: Wed, 24 May 2023 16:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/7] ASoC: soc-dapm.c: clean up debugfs for freed
 widget
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-6-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_075111_837674_EC598EB3 
X-CRM114-Status: GOOD (  12.10  )
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

On 23/05/2023 04:19, Trevor Wu wrote:
> When a widget is added to dapm via snd_soc_dapm_new_widgets,
> dapm_debugfs_add_widget is also called to create a corresponding debugfs
> file. However, when a widget is freed by snd_soc_dapm_free_widget, the
> corresponding debugfs is not cleared. As a result, the freed widget is
> still seen in the dapm directory.
> 
> This patch adds dapm_debugfs_free_widget to free the debugfs of a
> specified widget, and it's called at snd_soc_dapm_free_widget to clean
> up the debugfs for freed widget.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


