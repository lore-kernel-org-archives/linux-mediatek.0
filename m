Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A48FA3740
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l76ylH5GQKStXCE5+N4w0FN1gGvZpR+mdU/Dav6ek2g=; b=R7CqVx1lS44f9m
	dPVaI0fXi4BN30B1SmGUd7fs3jWVT2CqvcyppcJ+IJY64TWcvdJOktqPly++0GxKGtRcNkIHWZbdz
	wqhke1kwz1ncs3ERQsACqkTZGxFk2fskd9+V6TC4rOB7y801Yei3qSCReVw2fGpChySpL6qQkms8W
	aHRwVv7Whf/bjhebgRP3YeW+M2Wru4ZYZwTpSwd9y3mzHdpCeYfoCGOG5gUKd1Bn1qGebyDQ6a/er
	2sRxikLoJdctvc95sT0Prl8UFF3XKmhJViioJLIf1SlmlETE7NfWDxz+dOEfJadriCZE5KpOqxS8W
	r+isfy6B21KfeZdy9Z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaXw-00FFUO-OL; Sun, 23 Oct 2022 12:57:44 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaXM-00FFAs-Kn
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 12:57:10 +0000
Received: by mail-qk1-x72f.google.com with SMTP id b25so4748458qkk.7
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Oct 2022 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l76ylH5GQKStXCE5+N4w0FN1gGvZpR+mdU/Dav6ek2g=;
        b=rDq6PKWuQHQO4Rdv+Abeg8LG0aYl97e8yTPMgp9eLn8CSF+01B+go8oJZXQopcV7Qz
         V5NvsUcAbgicOSnC0GA81j0Ea/AGvJV6hTa00m9JkocgV2fh8q/mKLJRK+Ua7F7gsznZ
         7HnKxoCOMk52YNp9H3lWWblItAF4YcTr9w0aRORJrdNSoIBQddaT645FHZEJJvFwG610
         HUJ2bsBYZu/6sURDIWRYI9uuwNdhOfo3RAZd5m2JBnb7gIaYnjVmU/Pzs4oJi/vmV2Uz
         hgVB6OQ8HWmzPhklXWGbHLuK2OHmSjpyjUF5dqYLj3esHbGoIh/72z10F867HsPNn93/
         Shng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l76ylH5GQKStXCE5+N4w0FN1gGvZpR+mdU/Dav6ek2g=;
        b=0sOjmkmsZfq8x0q7zwyCVMBwAJTYgyj41DEgJ7N7lE+ED6reRNUBgq35yfyYJOV5s4
         UgDuS57ntekgWb737+qKX7JmeDbTUPxPfTQlX586cL+RFJeqF8SRCvJveF25TkmFZJKU
         2DkQjl5PYcAzelZumVyEf3ICORW1/LmaZ65IfcMOvJgHGoIF76tv0TNE+h7ozVIEhb2I
         BFOKTsXe2rt03pZ6nFFWe+jBIe3ppCGLMROIPENBNz9gV1ZvsxTObEU1YdyYZBfVyZVc
         hqSOK5aRZWBc9NDWl+8B8G0CLKvlfXEnYm5l1+YcD8+xH9YxLNQo+d78tbK9jQM8a5Ko
         1LOg==
X-Gm-Message-State: ACrzQf29BnKkqQiABMMJ+8lFWtaeC830wrlaT2vDOWosouVIrIDy0AZ0
	PkA151vKeZMkr1Q7tw9lqiyA7w==
X-Google-Smtp-Source: AMsMyM7iTj/q2zHPaO5muCBKpEWDYRLPI/oOPZQq/+1HYrpS0Ua3aH34MqtS+47QydypiO08YmFfcQ==
X-Received: by 2002:a05:620a:44c2:b0:6ee:7a72:50b3 with SMTP id y2-20020a05620a44c200b006ee7a7250b3mr19416101qkp.124.1666529821463;
        Sun, 23 Oct 2022 05:57:01 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u9-20020a05622a198900b0039cbe823f3csm11430021qtc.10.2022.10.23.05.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 05:57:00 -0700 (PDT)
Message-ID: <a0121e0a-9f62-8630-45c5-d32eaa91d46f@linaro.org>
Date: Sun, 23 Oct 2022 08:56:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/7] dt-bindings: mmc: mtk-sd: add mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221023091247.70586-1-linux@fw-web.de>
 <20221023091247.70586-4-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023091247.70586-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_055708_728336_C0778E7C 
X-CRM114-Status: UNSURE (   6.97  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/10/2022 05:12, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add SoC specific section for defining clock configuration.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


