Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E5EC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8UGna3NvU6BqJN38fD7BOeeWmtWz0VHiahdkErFzDM=; b=Jn1i4HKU8UIRjYqtDwgHePDyCC
	EyRsc7P+3DOyveeqzbN/n7tfI/c8QbGGzckPZ0uAYi8wmPZTrAiLCkqAB33oZqi8ZFopFXHE1MA6S
	a2KYlN6p16E6GHxRFt5gC0CERRt//WynpSQ0drU3oQBgl9hWMKh0DRS/saXeZd5ZOe+33+kUWYZMd
	jiLbgtn8wH3ZMszmAFQM/G495oRRP4Xzsyk0sT6vx4HRUsQHPYygaOrDVvccjYVrXla8pCNlxFuI7
	MyPUjQ3cOhiWLy5w5Dkfl9w2hTlmz40DGT6vZcMNvmyYCIzN8g6nq1b7W6jkBoGOYKTkOz5HHgaGH
	OPQ9Qnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHAg-001jaM-3U; Fri, 13 Jan 2023 10:20:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHAb-001jYM-SA
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 10:20:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id t5so16190235wrq.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 02:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8UGna3NvU6BqJN38fD7BOeeWmtWz0VHiahdkErFzDM=;
        b=HS9/A2RUs3GRmV+lBocazW5E1MWmENkSmuwiLhNXJO2BMnSkGeFBqYzG3mUal5UDYc
         2lcNIy/Z4bTYpdVa2E9B1aByagDK9ndV+D8TCDCuO0cvAunJevXAHtk4QM4UktkDP6OG
         98pbpfTGZTSkvWXyQNKjZlwqVXLFnSrvb3t80dsOVbv6YJnIXHC9AdbYTg2Dxex9JFhz
         4I363Se8rd8CkIWcPvKUIz/wvptVWP4Cbcss7FDHhZXIn/We626mkGZbBPWpll8MB+8m
         Yzxi8xzy5hTb4agJE6AEAlIWw59igVwLjOe5z5MZ74YxSTHJUpEWcO8waVNkkc0qyWpe
         wfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8UGna3NvU6BqJN38fD7BOeeWmtWz0VHiahdkErFzDM=;
        b=MX3iO8gUegQ8b7HxhpaujIxAbyqMinfeZ4iIfc0z4cd/TKb6e6QcP68E5dhn6HX8lz
         LeZtIZ+10SgUfRhZUZBf0a53TeNQW2h8f618BZzm2tAIC0BV1ftLo6jzmiiNqf6AkamO
         2Zhq+ME+jGlklsvi9adUAdDurFzipa3nuHuYT+ZxZAwULbnqxIz78MBSl5424M8U/vaO
         4t8v0SVjdKEBFV/z+szp8+tNzstlGrhs22RPtUI3MohMDnmRya8dw8kpkkXmI21Ire0V
         h0l/AaITK80d/AIVoOjnOC5jxIaTsu28Ux94TWGxTdb38TI3YetohSGmfQaYsWVLM1ZJ
         skRA==
X-Gm-Message-State: AFqh2kotJzp1tyd6PHm1QeGZfkBotVBhc5e2nTaYOy8nZqmVV4CxphG4
	B8sIvrGL03jpHuhgwlvlMI+NCA==
X-Google-Smtp-Source: AMrXdXuBnifufZaaMMgkYNy2Rnx2O9dvBZ6xWhzIFG2CPXcx9HLtGHFcu6BxzWXzZOVP58AvU+FJFg==
X-Received: by 2002:adf:f585:0:b0:2bd:dc3f:336a with SMTP id f5-20020adff585000000b002bddc3f336amr2080800wro.58.1673605218639;
        Fri, 13 Jan 2023 02:20:18 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id w4-20020adfee44000000b0029100e8dedasm18482938wro.28.2023.01.13.02.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:20:18 -0800 (PST)
Message-ID: <d855d1c5-330b-f87c-1db1-139b131d930f@linaro.org>
Date: Fri, 13 Jan 2023 11:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: mtk_thermal: fix kernel-doc function name
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230113064449.15061-1-rdunlap@infradead.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230113064449.15061-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_022021_975616_3AA1E35F 
X-CRM114-Status: UNSURE (   8.02  )
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

On 13/01/2023 07:44, Randy Dunlap wrote:
> Use the correct function name in a kernel-doc comment to prevent
> a warning:
> 
> drivers/thermal/mtk_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Amit Kucheria <amitk@kernel.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


