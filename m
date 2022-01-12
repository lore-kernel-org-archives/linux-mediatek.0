Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfG9Ix3kiw+FvQgOdMpTNsz8stoZikWIpGcEOKAoHkc=; b=fZR9qzprxtlX8N
	+e2C9Hx6XNMKlM4YjrjPsQEUwG/Huwm4AD9LcIaeOah2M+j3KDnQdRs4AfLbtU0teMQj7QEqjqgnt
	s33vbSS1vwOJbfX0RH+Bz+qvIOTPm/C1h+vz/87sUZrXAUj6Nyhza9x3y7wuDksS28Zck8AExAzX6
	3ggmL9hLDo6K9H15RHSvmf76XFRJlKkal8T71vq+uob2yGcsMtwcsRDhpgjEX5s2p0E+BXbCdo792
	pCKBpizf7gNfKta29jWTXrTib4Hp5QZVg7qqp3Ntdi65CfS/o1QnTr9IO9Ih8SylxLH4BTpuvOqVz
	AgEWPH+8zrPmT6zWTqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7gqb-003BML-Vv; Wed, 12 Jan 2022 16:51:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7gqN-003BJS-El; Wed, 12 Jan 2022 16:51:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so3820650wmo.5; 
 Wed, 12 Jan 2022 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4ZjYXj8qv6hS2+wAqvl/1Wwk2r8Pq9/2mXi3yeFtF7s=;
 b=G8hh+mN2ry5Cl0PdUPbwUVdIr12Ls+UpaTmKZrd8cd4bl/ww1l0YrKPrZoNwqqocx+
 xFzIhogN9FhfLGSHoDKjxkrR78G2GFuIm1ZkLsp3HxQ7N1JLDeDOoXz7W3TovhLK4UwG
 MSOPegKkisyPZhvXmVVyRmmhGuygElbWdv0Bahf5VF31bTBAkSUVu3gLSZf1IUvyArYg
 6g04YWmKok+0kL6y3ZW+WbdFufYeIWnpOGtz0IdfDT7ron4g0gZbiiWs+RmpA4YohuH/
 ra0G4g53zdx7sMBqUaejufmmW2aEIMZUwYy/yeBOV3C8MKOrzQJKAOJ+GTdBawaEwyLd
 M9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ZjYXj8qv6hS2+wAqvl/1Wwk2r8Pq9/2mXi3yeFtF7s=;
 b=4mdRQZEO1KYeD2kH7lRAw++7oabftCTijhjyA5en/L/IhTHyMtcYREe1VbaC4YoPW/
 sGd0Yi/P0CCJRgPdehOCTVgDsYXjakLOuEz61lFnxVcMiZApVODsLm4YDxUorrtqhEHl
 0DGNWks1NYdPrSKRiiRnxkrYnS+5D/J1+QUehZhx2IufcPHzoVdC2D0znpcMT8RDjQi0
 6zoyhUwAE8AQwPpJwnkfHXuxUevxvoVcVqaFSdXdaL4LUK9F0uozwe2dXlTLill2wPgl
 gwFVLPejAydX3qghgfEs2heqgBaM0/SJYSkwJwVyPkWegI62CKv44njkmuOZWLTn7AzU
 Ppow==
X-Gm-Message-State: AOAM533QGKgXYs67ECgBkMQImgpld2LV/yBYlVgY1N55wLUZf6xO8x5W
 q8JjS0U0jRHdH0acF0VxlyE=
X-Google-Smtp-Source: ABdhPJwtsfyctmVr0hfiK420v1vmhZrSn70gHUl4KHbqdmHhSLTtJsJyC092jeLQk0GpCHzE1DUivw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr310500wmq.152.1642006285088; 
 Wed, 12 Jan 2022 08:51:25 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id f9sm362657wry.115.2022.01.12.08.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 08:51:24 -0800 (PST)
Message-ID: <d36d276a-c3be-431b-3636-c313cabda3d4@gmail.com>
Date: Wed, 12 Jan 2022 17:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/5] Update MT8192 Clock Setting
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220112115542.10606-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_085127_558306_6E4CF074 
X-CRM114-Status: GOOD (  12.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/01/2022 12:55, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch is base on v5.16-rc8,
> series "Mediatek MT8192 clock support"[1], [2] annd [3].
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
> [3] https://lore.kernel.org/all/20210825011120.30481-1-chun-jie.chen@mediatek.com/

Please update that list to only who the patches that are not yet upstream. That 
will help me to understand if I can take them right now or if we have to wait 
for something to get applied first.

Thanks,
Matthias

> 
> changes since v2:
>   - add missing "clock" at the end of commit message
> 
> changes since v1:
>   - update the commit message
> 
> Allen-KH Cheng (5):
>    arm64: dts: mediatek: Correct uart clock of MT8192
>    arm64: dts: mediatek: Correct SPI clock of MT8192
>    arm64: dts: mediatek: Correct Nor Flash clock of MT8192
>    arm64: dts: mediatek: Correct I2C clock of MT8192
>    arm64: dts: mediatek: Correct system timer clock of MT8192
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 92 +++++++++++++-----------
>   1 file changed, 52 insertions(+), 40 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
