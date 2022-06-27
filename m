Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3654AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3Mdp7WZpjNWUbLLF/KYYtNmAa+cGw6y3XcuLyzAU8g=; b=Q589qXY3Tj7xVGHQI6EOKI9Qmy
	vw0rT79SVn4HNg0j5Q9v4aXIQbvhxU5d0S4iaM10gTINI+MH/eh8hdHL0w3NmhzSaQAwz2lVqwqh3
	k91k4F07HdIs1UM+Y/+1fZOFzxJorI3XxlV2trsdkDlX/I2rovsIhI5SxWqCpFHWl5iTI60vs1C20
	3sJI+DXp4v3GaN67SUBgRCFev0RLAk+vVcx3PBijjjt5/pro/iFQL7Xv7YnrBTO3mdLsh0WhjdRUh
	j2hhI+CHxmCcn4KJKYRLa9riuou1uhF1p6W4HpV+rvX6DPCsZgbunHtPYUdVE+BRNGSqjvKvaWms/
	/pkDhdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jsQ-00GiSK-Nc; Mon, 27 Jun 2022 08:13:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5jqU-00GhGg-1u
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 08:11:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id c65so11802180edf.4
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h3Mdp7WZpjNWUbLLF/KYYtNmAa+cGw6y3XcuLyzAU8g=;
        b=q5zVoP5clcIVDrY6ERK2vmP9OZfarqRkGci7A4OY51STVO6GItSzvcoNw2yUOg1pzf
         uWCwOYwOpqK2kdRRsLnqGOj1sRNqw86F532Mk6NKDwsmyjKnbAteN8GFce0kuHx8nTZS
         +O1deikonijJCWXPURdyN9w2XbTMjfe/Z6Q198aSE/8tPdNYVo8ZJqXmPwWbDdgZavZ4
         RF2/XAmi7XGqB675rtl3JAO8nbKSfvE/1dXXCCw3zpnwuk+FfgHgn67sRzv+vcoDzzr+
         u4Gy5tGwrAZi1vRxNkeGBHnVLXrSXLYI6DBsUIyR4pKuJTJOJ6LD9V6NkO94CFludcuA
         aSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h3Mdp7WZpjNWUbLLF/KYYtNmAa+cGw6y3XcuLyzAU8g=;
        b=i04uWCviKjihn8hcgq6sbKAZRKe/9vxn0nTXvm0JP+zM8yPgHlmhuJQ1ko4JrUgkFw
         mbGmV9qfHgHUdNCKa6QMmqRxLMSgLmJXeKJVwsDaJNqi1dahJkWzS98t10Oadv2ZWHA+
         3FghtdhySMXb5YOSTdosXtotu4taeUOQAMQhI+u9OlXA+S0Ta6IX2t3aAf12VZ7rYKD0
         46hlbYw8dpWV4xT3cYyVgomDRf3MkBKRfF8y9jhUsp9yEB+FHKPnNm+Y6MoHz2JVUHxB
         ntUgpqGQXH+zTEBsPCoCGU3oNoPthFz1hf6IUt1mRlVjl0FHEM+jbS9nLOiOl2ewGjvi
         /lRA==
X-Gm-Message-State: AJIora+cQPbaWPNAsZKRI691a0sokYxuUd60gDcuHYeXlDsqqNvyNPG/
	iTpqtpWzmD/KdJkyyQhGnddl8g==
X-Google-Smtp-Source: AGRyM1sktl7RIZL1/G0JBzWDl6xiJ0SUDo+RA0dlLEqNiPs2faaTLxqZ1tas7kNDD7zvUSp224wxPw==
X-Received: by 2002:a05:6402:5306:b0:437:8bbd:b313 with SMTP id eo6-20020a056402530600b004378bbdb313mr6563242edb.123.1656317503401;
        Mon, 27 Jun 2022 01:11:43 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709060f5200b006fe9e717143sm4726972ejj.94.2022.06.27.01.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:11:42 -0700 (PDT)
Message-ID: <e1156747-e7ea-c35e-b24e-61f9318bf45f@linaro.org>
Date: Mon, 27 Jun 2022 10:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, djakov@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220607140556.6278-1-johnson.wang@mediatek.com>
 <20220607140556.6278-2-johnson.wang@mediatek.com>
 <4e452af8-e96d-fb06-7800-707f3bf75155@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4e452af8-e96d-fb06-7800-707f3bf75155@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_011146_164071_B6B8A614 
X-CRM114-Status: GOOD (  10.31  )
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

On 10/06/2022 12:43, AngeloGioacchino Del Regno wrote:
> Il 07/06/22 16:05, Johnson Wang ha scritto:
>> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
>>
>> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Georgi Djakov <djakov@kernel.org>
>> ---
>>   .../bindings/interconnect/mediatek,cci.yaml   | 141 ++++++++++++++++++
> 
> Uhm, I've just noticed that this is being put in the bindings/interconnect folder.
> The mediatek,cci is *not* an interconnect driver, but a devfreq one and is not
> using any ICC APIs.
> 
> Shouldn't this go to bindings/devfreq/ instead?!

No, devfreq is not a hardware subsystem.

Best regards,
Krzysztof

