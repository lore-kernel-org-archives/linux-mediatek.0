Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1FBC7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGk02VW36o8oi9xKpds5rY0RuBS6XODiauPH5sa2EDk=; b=T7sTUAtv2kul1WJXbzIJCSoL4r
	25gvM1vjFKqYQLTs/xYtMam9WYotDDg5vA7oLwf+K+CmBDW+P1FJlVYXh2gGac7bbI47TJcrOVhD1
	gGCvPkg1Skr3Z56vrBHBuK2gaMW5n34dVZyL+q7R7/K+Pnsi08q9K5PqXSrqStNjfHfQMCCIGMP/w
	stRd9CVEb01Y+PGFjr5eG98ywbmeAQ+mK/80+fL178QHD15D1/SlTApXo70gpQQyMV82HOLwPPNbo
	5Q/1Ipn5SAt85pLRqsqUPvc/TE3woMDDTQ/TVii7fLH0RZoZJA0VIi6sa5ZrTpVBRbjux/xGPxfAg
	vGgihK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Qqo-00ABaY-2L;
	Tue, 23 May 2023 12:10:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Qqm-00ABZe-1s
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 12:10:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3093eb8cd1fso4598778f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684843846; x=1687435846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGk02VW36o8oi9xKpds5rY0RuBS6XODiauPH5sa2EDk=;
        b=1+hx8JRMv8bN6bR9C5NNLW6j3oMCk8dl5nP2zPiCTdzFTyYS6CMOWzYCAiyr2LbJKq
         stWoCqsYd1ZFVflnqCQlsMXyKLScSJgyNJfWrF8oy3pkxaPTIpyLGGrB5Pble1GU5YbF
         2eS4IGtUlX3yflBdysz+r7R63PGwkXLgQ84zSRvb07Kh8UBAqV4thC5UN2FaoD9Vu6M9
         FszYXip6ViB509VU11lVE1QKqOfqcMft+qzm4ZM6dAhDfnZK8vfdlk8PGmKDSJC58IG6
         w30vkFHRYKAmLbtlms+ciDK/pCVgcWb9Vd0i0bB+IqDOLVFdnLSjFVYeWXQE6wWQyzOW
         a1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843846; x=1687435846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGk02VW36o8oi9xKpds5rY0RuBS6XODiauPH5sa2EDk=;
        b=fRryXN4LoQP8sm9AWAwrXbMZEE3cX56MXgLYpGbprHl1B2NsBPO90MiODj0Ru0T+lw
         sxDR1o/3yTqcik07AVd+9cvsZISbeSQOoT0s/18UAJOA1QDRKzR7uPhsvSwTjJrz+rZQ
         ZOauQl4QbRXERF0tfwNP4NWHiFfnEf4kRnvukTQ4XPAINsFyZidKzeDAsd9d2Ys+PepR
         nMfB0e8c5TqzpMLFXO8CifAPTwr0bF9RWpLE7IhyWnpvik38VXuVDlwQjSl/e1qrwy7r
         cAJYRo04rB4Fw10+NuhW3abudz+7VLAY+0hzzpnxvBTy/+duhtzuFRFQ3ohSVpOsR0VW
         Iluw==
X-Gm-Message-State: AC+VfDy7x+m0YxdTTLse5gAIi8MgVgGj4PsjthuNKttDlq5a3tdHCMgS
	scjT/0baXSXFfkfYtqnSyiLOdw==
X-Google-Smtp-Source: ACHHUZ42YAfaQnb/Yc6os9IZAlXJp0vBw8ve0qBJR7shOA52HC7aoC6d1NzgFID1WFdnGb+5LV4Qkw==
X-Received: by 2002:a5d:6b4c:0:b0:2f5:83a8:a9a9 with SMTP id x12-20020a5d6b4c000000b002f583a8a9a9mr10876277wrw.16.1684843846192;
        Tue, 23 May 2023 05:10:46 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k6-20020adfe8c6000000b003095a329e90sm10788563wrn.97.2023.05.23.05.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 05:10:45 -0700 (PDT)
Message-ID: <2a22b9e1-a828-8a88-e125-f8e603bf1796@baylibre.com>
Date: Tue, 23 May 2023 14:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: mtk_vcodec_dec_hw: Use
 devm_pm_runtime_enable()
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230515141610.v2.1.I0d1657be3fea5870f797e975a7aa490291e17993@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_051048_619682_7F57C1BC 
X-CRM114-Status: UNSURE (   7.91  )
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

On 15/05/2023 08:16, Fei Shao wrote:
> Convert pm_runtime_enable() to the managed version, and clean up error
> handling and unnecessary .remove() callback accordingly.
> 
> Signed-off-by: Fei Shao<fshao@chromium.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


