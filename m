Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286ADC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=; b=0GVOIau3Y8XKuLxydr0UrO4rqh
	Xeuy6RM486MXfexKAShlenEp1H145XSB/zNvXynBWgT/fehwqTwtQMhJpbqTUMsQbndc2XqNBFbcX
	pBGMbbW846X8B7pSLCPGw9KLkFlVo5o7B6u36fbODZz+kLuEs/nY99/FN4R2N7fB1Ns0khCRTfwec
	y8usXVpIEuXX9gHCT5+gIKHwHZzcD6IX64gVQlyoK0cxPVR5Y2HFP+a7wYV7twJaBNIsL72z6cLo2
	G4LILT81x210qTYyT+Do8ccmqjbgdnfaSSVLkoc14AzP88tG9WKa5PpgbxsgcOH4uNzKY9zrNSBB6
	ceeP5SWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFXl-0000000HUeA-2S2J;
	Tue, 23 Apr 2024 12:46:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFXi-0000000HUaY-1GT0
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 12:46:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-34b3374ae22so1810237f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876396; x=1714481196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=bW50M0aHeVQXGcb9kn5B+xG2oisAilmU+fnFzMXlhDu+ammYAlxzTyKnjbfu8xB8oD
         Jpn9d896KffMkN37bxuWTParMBEPOttN25jEKMUHLBaKVnO0aOGLG1OcSoCDEV9lRIMG
         KD9kEy7j44HAtgdLYNntkkGqhp7NbLVIX00u0VtaKdFRkL7pAIvVgUxSQzPHHqpK9lxt
         ifH4bRTArbQcFrf+NWinD4gILCKQEsKETgZWaOUDvEZfNyUWgX9zCwwuxPqsrlzytfP4
         ZKMT4gw/8WtcNhl/ldVuVjm98lsLRBGXI1dIOg0+dCpY6nQbZH39600ofFd6ZB9XAlu9
         63tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876396; x=1714481196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
        b=JEHwIbcr5WiaDGDAfq8Q6d4WUU03aPBeLfT9jVBh+ZnFdLHv9fspy18CE2GXzBOpZ9
         tPMo9nJ0awch/q/TLt2aEAMSL1IHipnSbdKSAdUboPq48n9PQwRd1Nsv2P51lEIicW9R
         emwV0j1/CIzLcRnX3ueGuV1XUdIxkSBFjJZEbl4lHYdIwHbb5ng37TfPBXq6aj1WTWk2
         m5bNUeSl+I8gjrFxDm/mTbuWbfa9vqcMhBK8i9dALKx/JoI8weLa67CJKhsPLbfeBzfK
         y+TP03LqKbxQCJaB6elIhj/xuKkrV2Pi64Zm9mCFAtRZLUF6MN9PD5PFAmYJW114QbjG
         SiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgRiWULHqSB3WyAjtWS5pWE8aDOxAy8cFZ/iB0lL6Szlwgp5BAFnUQdxXRgMRxtI+Imd3xYg9QeQ35Eur9GNshxoLlqbnIeIYVMkHor3Ysmsvt
X-Gm-Message-State: AOJu0YxYADYfXU6dIFulM5F8C5nHv/0cjLZ3CO+luQvhBbhsQgYECNYE
	/CKEKQRpjhJPsMf1Wdot8NEWgjO0/PFJd3Z9Z7X2S76HoWNpLdfUXfNXW0tjjpI=
X-Google-Smtp-Source: AGHT+IG+1vx5mJkN+16nkw6DrmjKX/bCAbSI7iHWCeWcx9NCAuHfmO/i6PUYzl4PV0Sl6Y/Ow1sbhA==
X-Received: by 2002:adf:b197:0:b0:349:f83f:9ebf with SMTP id q23-20020adfb197000000b00349f83f9ebfmr11081490wra.5.1713876396189;
        Tue, 23 Apr 2024 05:46:36 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6207000000b00346f9071405sm14531796wru.21.2024.04.23.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:46:35 -0700 (PDT)
Message-ID: <44d6ab8c-3810-46ac-8e54-c125b5c29199@linaro.org>
Date: Tue, 23 Apr 2024 13:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/35] media: platform: mtk-mdp3: Use refcount_t for
 job_count
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054638_501168_C118B0A8 
X-CRM114-Status: UNSURE (   8.52  )
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of job_count.
> 
> Found by cocci:
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Same comment here as per the previous patch.

You should explain in terms of the memory ordering that refcount_t gives 
so that the intention of the WARNING and the API change is well 
communicated.

---
bod


