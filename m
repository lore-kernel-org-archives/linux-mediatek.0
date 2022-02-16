Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4981DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lP7CFrFepFMNPG0yPaag+oDErC3WSEme9o9qNEllrdU=; b=yFIbrshE3FNTS5
	+crp0yaQ89EEIteeZdzHh96eZEQESDY0eWafUoh8oBkgpb5C+6wTan1Cjs1vPpeVBDJZcCHYbtSGl
	d6YEOObE/TD4XYivkq5TiSwijUnLL7lGBbVOcT0nTxA9YziN8q4TEoapGJJBsaf39oSuDQQTxwLSx
	NJq0refOdcplVPPR72B/vGAQGcvLfGLm04QQ/qtyhrpIhdeNJzHVOlk3SWvsENNjITkG6tGYklaRB
	30/S1nq+bTyx1QTdK6JabdugWwz+DAJ4ONLxB4940GrB0ZbXSArZpaLSLdouAiH2CKZ9N5tQRTGbY
	O6N8FNs2/VW/9IqOTLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHUJ-006Vzk-Bb; Wed, 16 Feb 2022 10:24:43 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHUF-006Vwm-H4
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:24:41 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 42BE440610
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645007078;
 bh=qXI75zjxBTeJPXxSNeUlZDMty7S4WiqV/haz2dU/d9I=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PecQq3tejtp5Jau67bo4UcH1/xWqLKGIaCxj45Za9OsRjTsZYh4jBAKs3mfGCaad1
 KYfdS3py5kfawShnF8DdS1V+YZrrWYjMka3rc8Nbys6n8CwMwRHtvmrQdV+K9aJY6Z
 9ynjEirNI1CLoFkdY32U1iLTeOEFjvw7g5c0bMsNhaNdo7Bg2sE9ZaFEOoaDS0KDkU
 r041vpZ5gTXR49mAtz5uzresSC9NmuajfRiGBR9i0WpVLZbz9Q4w1a6GAg0JoGXoE0
 JLdCWVzsu+Q50uugl63USdWuk/bAoZQ9T3JkBPmLHyPLGabKi4H0BMiusb8fAeLRly
 UrtSxecSp+FCw==
Received: by mail-wm1-f70.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so288250wmh.7
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXI75zjxBTeJPXxSNeUlZDMty7S4WiqV/haz2dU/d9I=;
 b=KgyLzZF4P7AMEY0nXjYR/UwI6c2/ef1xhgZRwJoH04EDzh79kCxxEaFdcl87PsfHXp
 Ev+29FVcGJUwcAfPcghjPxVE/xXzEbTpvwTxn09z8r9k/zRhDO9eKAufRlVZmfhi3egj
 mrkfxsuRNpJYgZ+I5e9mAL7HKmv5D0Mpw4XB0lc82nhYHJGSJXKDqptUGkbGBnxdhiYy
 SGuxQKqjkeDl83ltGIrdSo7A+BpAEUHbOjuGtOvwWBkz+k3DWfsL4e8BCWzG15f1kYwo
 x6Mc3QRAIGolldFL0dh8DTWBFOneNRHXTCpQ8VdaTWKb1rcFqXzlF+/UuoWpKQVHXe7c
 RQOg==
X-Gm-Message-State: AOAM531A/I1vF2MQfXKnU/eTdeNKSuCa2q7gcsgG3TI0CuWskXc+5+q3
 4H5HjysJ+dHGdxEqRuve3ozTm63L2OkhNrkf/7vRY0J1z2K21XAhyRwwQJRNQCXBocjDntIQFam
 dEe8LM5pDEiu+5iBs9Zhihs8eCYZt1L1SF1QZNV7f5BRyToyG1w==
X-Received: by 2002:a5d:644b:0:b0:1e3:6a41:d2f4 with SMTP id
 d11-20020a5d644b000000b001e36a41d2f4mr1739117wrw.356.1645007077832; 
 Wed, 16 Feb 2022 02:24:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWwVSVkA73YJkXT0kBUhoy4TKJmeRjjeKYqoW7WsaeJTgwFiRf0g49sq90wFOpXdDBBG2d1A==
X-Received: by 2002:a5d:644b:0:b0:1e3:6a41:d2f4 with SMTP id
 d11-20020a5d644b000000b001e36a41d2f4mr1739092wrw.356.1645007077612; 
 Wed, 16 Feb 2022 02:24:37 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id h2sm1635791wmm.27.2022.02.16.02.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:24:37 -0800 (PST)
Message-ID: <435f7269-7f34-ba6a-0219-abcc01ffef88@canonical.com>
Date: Wed, 16 Feb 2022 11:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,0/4] Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_022439_791300_A7E0993B 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Changes since v1:
> 1. Fixed formatting issues mentioned in the v1.
> 2. Delete pwm-mtk-disp.txt.
> 3. Add mtk_pwm dt_maintainers.
> 4. Add "#pwm-cells" & power-domains properties.
> 5. Make dt_checking successful.

Any reason in changing your email address in all patches? Maybe some
mail client misconfiguration?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
