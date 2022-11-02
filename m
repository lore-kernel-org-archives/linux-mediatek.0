Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F5C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VJS1eRrGEpJHqFbLWtcQx5ZPGULvRnL+9bh/Twyl1k=; b=m99hOwBkYfVG204Xue5Uq/Dl2+
	wUWl5VKPjujrNDin+AeegcjbqW3rPE9IgL0b570CjfzIvdoCMyXTiP7IUiWIedsc0fJGPe/oKSaOn
	e8vsGB3uEQMjrjwvY41VT+RHqmd12ZziVPnbmJgt/kVnniDgiv4eFltve/NfqrNaxohHJQwhdHHKD
	HZxGnLwtorRHj05h4fF/Bb1Yjlq0r7KTBSteaAmlbPD2NzMm5xYRE6p2FMU5jR9tnLajamQPJIaJ3
	LvHpPHm7F+aptlhZrJGGox6vI/bMuuJehauwgnco74sBrEWvkKKEgO0Z4V0QGpQY5maDwjcC0xVIt
	CxJ3hBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGK8-00C0BH-Ou; Wed, 02 Nov 2022 16:10:40 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGK6-00C09v-Co; Wed, 02 Nov 2022 16:10:39 +0000
Received: by mail-oi1-f169.google.com with SMTP id r83so19676270oih.2;
        Wed, 02 Nov 2022 09:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VJS1eRrGEpJHqFbLWtcQx5ZPGULvRnL+9bh/Twyl1k=;
        b=Q08aCtMnEqJ8Nmt1sqQBuNO6cjoSrsiA3Pv1EAAL+nZmejb3ejJgXM1+StqN91gu33
         Pj82R65kbUmelwlxtBfXs2kQ3tqg/FEpCfLyhl2v/rT5xvhiTiAhVggyYTBZTJEHHlqO
         6cmoOIG3dZU8gsootgCMslAUCcsVVioofg61FHMuc/suxbYtbr5/qauwK8C8n0uGmclD
         c+gmzF4u2z9T2NHcO355b9RtXScJJCicha5UidtTJr/gMCk3PAdM0X1kwrDxDr/pvAmu
         5DfnF8HrZTTvOnOjfqBNOQxG1qzNwdTXaO3vJmtkur1/5jfqnTJ3jOQDx/ls93OKoiYm
         CueA==
X-Gm-Message-State: ACrzQf2zx+odlyqcLt+SytHqjeixeKMiRzsKwdazLY20KpJ2luapPXm0
	DacATu3YndJiD4YrjNQCmyluMptJ4g==
X-Google-Smtp-Source: AMsMyM6uvwcr+id62GI7restHplkU8LVzfDM4M4rB3BUnjN2xlN1CKN4Kar/50fuLvLckJshJYeTDw==
X-Received: by 2002:a05:6808:2009:b0:35a:1a52:2716 with SMTP id q9-20020a056808200900b0035a1a522716mr7585504oiw.211.1667405436161;
        Wed, 02 Nov 2022 09:10:36 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a25-20020a056870a19900b0012d6f3d370bsm6149597oaf.55.2022.11.02.09.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:10:35 -0700 (PDT)
Received: (nullmailer pid 3983046 invoked by uid 1000);
	Wed, 02 Nov 2022 16:10:37 -0000
Date: Wed, 2 Nov 2022 11:10:37 -0500
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "chunxu . li" <chunxu.li@mediatek.com>, Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v5 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <166740543691.3982990.2425692188339189211.robh@kernel.org>
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
 <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_091038_453105_6FA0A3FF 
X-CRM114-Status: GOOD (  11.34  )
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


On Mon, 31 Oct 2022 20:22:23 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

