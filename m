Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7214C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YShaIEE2n1AP/XmAoZ6cI2525vmt3gMFMVbfTPWkEG4=; b=1kknuqagtxE11hR05H5xAhRXRr
	33sqSyevue0hXx1Ex34VLN2zJs5UdTpENl4SBMaIaeA30T38jjDOCOXUBNrspnNkSwL4kgqhNGwIB
	wx+fouKIp8vyFMg8FB+zdn3stg9RM3jdXl7p0REfQ8OlOwviwAzNv9tynDQh4LcbhBCi+1xsDHIFc
	NcER+2l6da0Pp/N4oBNcrC5Ih8o7Fl/J0Hr35C07l+FwCCVGfRVTKcnaM5ng9Y17OCDY4yqbdWbsn
	1BKXo05CEhV26I0H5y8f1UWUW0z2wYxjOlbLiSJK4r3THJmh/KzpN+aiMvWSyRm1fp6sQQEiq9dT5
	nlTc6bcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBVX-00F1K0-23;
	Tue, 28 Mar 2023 15:45:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBVS-00F1HM-3D;
	Tue, 28 Mar 2023 15:45:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id i9so12726866wrp.3;
        Tue, 28 Mar 2023 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680018304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YShaIEE2n1AP/XmAoZ6cI2525vmt3gMFMVbfTPWkEG4=;
        b=op44MGXiytPNzHsMY8Qa562tKDkt6Zljv8o6X1578ufXQvVmLmWObICRLSanQNz/nK
         L1njb3ISzi3LQnOF8trNxGLUfKP/VqwxKM9wpVkann+GFOQacxxiSH+aCQGP6o8QzCuf
         A3vhh6TWd/wIsfmjFtEornFz4wGmErpHb1BAbMbeD09k6sMjn1g10IAUAYYvZ7DR8FNT
         csr+XAieBMFXDw4H3lHd2TdOd7hBJyyo2q2IHy0/5M8fS9JRm/YJNzzB8MGMbZZruIin
         Z6rqGAHXJZYfZlWNGhdKaTM1Uq9nsBAVQp0KVsbgQTY9GcODbP84gD+rrwVim53Di9A3
         zPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680018304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YShaIEE2n1AP/XmAoZ6cI2525vmt3gMFMVbfTPWkEG4=;
        b=NwW0lm+zinsLv9z65rYdG00cUs7z0eaCB6qUdS7gsWSer8Pn1F5PAOtwIejQ3lTSlz
         /ac49ureOn8+ix+9iqG5pSvtskF2kazKvnP8S0CZAD/C19lDHTsOC8qUuRgKCr0c83de
         2SiXcYWUT4+osqQcHUCQp2LGOHmHoSlfVsPxWW/vv4dUysmALfVp59QpNGvfj7TTH73V
         C0hQe1GPVGNnKMin2dKF4zZrFWAbpRzerGp6Kvztz/rORISt/Rq4dKFmPgXlKYbUBuV6
         QyzuCVJMIuGlgPbdoa3f+L1uLwsF550nxFZU64vwdyPSNudFxL21cZ/wwUJZ21wmBPFl
         uVxQ==
X-Gm-Message-State: AAQBX9doiXkL8PThTDnayDZYHowW01vARqxeb3pTXoeuEjzPAjvfuoe9
	3Ur3nvmm4TaS1hBNI2ypHoE=
X-Google-Smtp-Source: AKy350YJdoctHDsWO4ux7IHFatibNdv13QqeV0dtJJ2n415kxQijkrneQ55rqEfPfo7vXPQEfgxX1A==
X-Received: by 2002:a5d:424a:0:b0:2d2:39d3:ce7c with SMTP id s10-20020a5d424a000000b002d239d3ce7cmr12517738wrr.70.1680018304116;
        Tue, 28 Mar 2023 08:45:04 -0700 (PDT)
Received: from [192.168.42.225] ([81.95.8.244])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d4d83000000b002dfca33ba36sm6440301wru.8.2023.03.28.08.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 08:45:02 -0700 (PDT)
Message-ID: <78a6478d-b8c3-e46f-e995-c4813b6e76f7@gmail.com>
Date: Tue, 28 Mar 2023 17:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] clk: mediatek: Remove unused configs with
 COMMON_CLK_MT6765 prefix
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Owen Chen <owen.chen@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230321042641.21592-1-lukas.bulwahn@gmail.com>
 <98c0a46d-05da-7863-1a30-51727c20da23@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <98c0a46d-05da-7863-1a30-51727c20da23@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084507_057179_0892185E 
X-CRM114-Status: GOOD (  11.45  )
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



On 3/21/23 09:55, AngeloGioacchino Del Regno wrote:
> Il 21/03/23 05:26, Lukas Bulwahn ha scritto:
>> Commit 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support") adds
>> fourteen configs with COMMON_CLK_MT6765 prefix, but only uses seven of 
>> them
>> to configure inclusion of drivers.
>>
>> Remove the seven unused COMMON_CLK_MT6765 configs.
>>
>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Please add the required Fixes tag (you even reference the commit to fix 
> already!),
> then you'll get my R-b at v2 :-)
> 

What bug get's fixed by this? This is just a code clean-up, no bug get's 
fixed with it. So there is no reason to be backported to any stable or 
distribution kernels.

Regards,
Matthias

