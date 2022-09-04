Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6FECAAD3
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Sep 2022 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaCiino+kPjk0mzeLjaGzc7ngCKP9nbk7eUckZ209Uc=; b=Huh9bzCCntaa/1RHN8zr9nIgQ3
	p3uYF5MPXsB/i7yhDHZhVts7AxSx1mY3iFGARF0NiTAhATiywVPHrqV4g43uSBKvNmwATPzS1FhFx
	kDpKCV/MM1PI6B3aavlqhoBU0nXk9BFNeRa9x0Hyzku6NyFPQ2BnB7c+VCvilGfmpkXSK43f7yCyy
	2YGnGEJLMMWq4JXfPnSl6V+jUQ61OH9waWkJRhUuWsqP2Pjf0sAbIt+TuzGskIMfrJgbw8lreN2BY
	JAGM5WP8KUHJGirjlYJDZuw/kJb7L4yPN73uX38aLIlxmxk069zSPk9MS3nSPs+bcx7zlhUQ6Am5L
	hOTbvYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUpDp-005wGw-Q4; Sun, 04 Sep 2022 12:59:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUpDm-005w9F-Mw; Sun, 04 Sep 2022 12:59:31 +0000
Received: by mail-lj1-x232.google.com with SMTP id x10so6752860ljq.4;
        Sun, 04 Sep 2022 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MaCiino+kPjk0mzeLjaGzc7ngCKP9nbk7eUckZ209Uc=;
        b=nGmzIqyW8Gkt2mTsg3NQcRYeGgZXxAFa0SKkwwbtnDhOav/cvEu3IEgIS5XEWAujOc
         ckBTBJ+9zEbtTbV0nmLx99sKsvVsIbVQuOxq9SgTHxVuvgcfm9i9UwZQm7hIQFx6otRJ
         eVvoLDVBHXxQSmVg2U3fSE+lQYqe35iSj5dsJqgbrFqod/6dyxRb36Aav+p1G7BfZjS1
         ipvEWGJDjk3RtOsB29GEL5phjWhVZxU7G2yvnb5K0pme2LJpPlud4Slnk+iAYG+XXJok
         7NDF42stOftqkhA7YNClQZCjL60ASc+gWIXZi2ikDYdmdO6t2uiRUL+QU++1cWVOUtJd
         TbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MaCiino+kPjk0mzeLjaGzc7ngCKP9nbk7eUckZ209Uc=;
        b=km3QeeNeXMKatOln4cpLA4ZfTi0BQPA2S2C/qbc0cJOpxCC6SiPHw12+Uev0kU801c
         lv8U/5XU5GsekCaobkEZb3KfTp3nFr+aHUwolgqz5SF43OdlkSiqWV2L4RFOYAy+tX2V
         dQP43b5iuhcAMrneQapvRj6IB+gJMXotGCE4gCtpBUxyztf7M7Nuj2AyHbfrgl3c14PO
         kDj4bMl0JotKxVZ7j3RA+rU65X89c96L4zZO766AfqztXR9KRyfiH7XmtOybazazBOmg
         2T3pyo1iyosaTD8i4TLzrzZChXxm6+UY5EtZKvrm+aW1CbErfaFx6DW5WoFXWgc4AltS
         +z4g==
X-Gm-Message-State: ACgBeo1JcUURF1x5PgfqyMvdj8QEuG6YcXiVdFzACNT/oYzhlRKUsUWC
	UbYLgVo1P8zqzOEAXEfCHXI=
X-Google-Smtp-Source: AA6agR7oDNcqN4n23e8Kl3aqZxtaX3bou67PPbdyBcJiiFNQKq37CjJs3UzaOWRhwQ3dpvALHXbedQ==
X-Received: by 2002:a2e:b892:0:b0:25f:db66:3b86 with SMTP id r18-20020a2eb892000000b0025fdb663b86mr14179513ljp.79.1662296367003;
        Sun, 04 Sep 2022 05:59:27 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id x17-20020ac259d1000000b004947e89ae4bsm888951lfn.294.2022.09.04.05.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 05:59:26 -0700 (PDT)
Message-ID: <af23462c-2d3b-470a-7fd6-2bf09a3174cb@gmail.com>
Date: Sun, 4 Sep 2022 15:59:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_055930_783979_D1060748 
X-CRM114-Status: UNSURE (   8.89  )
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

01.09.2022 07:41, Bo-Chen Chen пишет:
> This patch is separated from v10 which is including dp driver, phy driver
> and dpintf driver. This series is only contained the DisplayPort driver.
> 
> This series can be tested using 5.19-rc2 kernel and I test it in MT8195
> Tomato Chromebook. Modetest these modes:

Applied to drm-misc-next, thanks!

