Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D9FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=; b=k6Plx18FlEmldjSYwr8AJ1FELF
	AsObQ8sSJNv2h74Zwl6h2u6hd0AbgEUDCoQg45GuwnLuXiKiJ1/8EMKVlflGdYYaFUrJQftL2VN4T
	6gRCpPi5cOjPsMe3GC7U43C+8RTVlGatreOp5Q9WH3xWVn661MtSdhzTrWCXZFQ3Pd5S3XD6j7p98
	4wBOpHRoCVY+lK2D0kx7LZeIA0SBXLk1eRVjvuxhk1/MAwCNJiSc1+I5O8dMPU3K8txNzrQtbFimX
	301mfh2BmlYsv25zwXQtp1A2ifZWLWS8K2lW7zTUhuq4goKLErFFbi6PRomWsnAsEqWjoUvNjGR3D
	xGHQtUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHMQ-003fP2-6f; Thu, 08 Sep 2022 13:14:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHMB-003fBG-4q
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 13:14:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a8so6066064lff.13
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
        b=KHawKIkFgPkUxVPkrjS1pBxHZgetgHTNXzqxeOnAcSGLyIQMDySoPJY0z20Bkyivns
         RPFgcCuGjz4+xShlNPgjCl+R9EueMyB2ktLSK2dZpqECBuL0feaVHYpwNepFy7K7tYSu
         2KvMpZD6jpzhfIwYGIZKHCxFgYI5bGqvoTmZWHyH8sMHA5ne2vHmdeHMcUdzXfZxdrrB
         DrvjEFNw6NB0C4OcfJ7W298bdxJKmhSiODQpTt1GczHtkKhnZfrsDf26fCWUok8Y0zbT
         DyXGnZFjOllz5290Yz1gzA/LcwKkLPd4YWczB9p99j3HJhONBxS5BBuVJOE3kBfLtayx
         ge8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
        b=XC6x5EwE/najrlH2Z52gMSjvAj4k6Oo/5aF8QfEE0FjHwzGj1BsHEhMU65JYRgRFdp
         Er+vyFFz2AhwRlj/G4GioXn4Kh1goFAS2P7tZCeM+OPhACLc58hv451qrrm/hSbkFY3I
         rzCH9wniMFezagORCgnaGCMWjs+pu5OiNBdoQK9MC+Jke3cpnQY3X77a+g0s8v5j/O6I
         /H7peOged8VyA1ENLE8o5fcxQyaVt+oDuzGbH/kdp5rY4kOShdCVpctaz2cCaTxUP9K0
         NnWjrzQiDo7istmnwlw2qjbBC4p+staC8SDam0U4gRr2zs3/jovg5IlT9UA3o1WTE0O7
         Knzg==
X-Gm-Message-State: ACgBeo08lgIht50fqHBt59YB6bxDKZ46181ISQn4duoJxfWu87dWhtya
	Vp/QcJySD5eMhVYNoIfNh36dew==
X-Google-Smtp-Source: AA6agR4avfuGtI4mV/LW9eH4t+t9Zcbij4SZp+wKUzY4VSoj42JgpHx8sPN67mwk8vwBWDoNPbikJg==
X-Received: by 2002:a05:6512:3f05:b0:497:9e06:255b with SMTP id y5-20020a0565123f0500b004979e06255bmr2549468lfa.175.1662642849511;
        Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w22-20020a0565120b1600b004946d1f3cc4sm3028045lfu.164.2022.09.08.06.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Message-ID: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
Date: Thu, 8 Sep 2022 15:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/6] Add first version mt8188 vdosys0 driver
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 lancelot.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_061411_246546_06284663 
X-CRM114-Status: GOOD (  10.93  )
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

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> This path is based on [1] and [2]
> [1] Add MediaTek SoC(vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
> [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
> 

Can you stop ccing internal/fake/non-existing email addresses?

Your message couldn't be delivered to wsd_upstream@mediatek.com because
the remote server is misconfigured. See the technical details below for
more information.


Best regards,
Krzysztof

