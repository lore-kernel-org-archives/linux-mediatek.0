Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB039C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=; b=If9JVUXtV0wtOR7/DzQipzhBmJ
	zTR9AyhoGlwzBQRk5hZjOEi2I+gEM9A/dqtbYEb2AfXXq7v17i4u41mDOE5utWNv6GaAgCUQu3w2S
	/zSb/7SbqWLEuyum0LvL+4oOsX1HV1bHd0moUmVfTN5BCAgDGEhYYoq8zZtRynwnEXvRiPqKNfnk2
	b0g+VyNNbeBc7N7+5f1py/fw9YBpVmc35bS4DcuXjgky5WBI2uapFkhDlAIi6FdYH7/sg3A2wYinD
	8MzdULn/tuhinKrpc993lHuLB8jVZtmss6/TN8CmUCeeLFB5oHwiP4Hc2ZnmX6NLi/4H/kVucvJwi
	zQC8wJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treya-00000003AH9-46uW;
	Mon, 10 Mar 2025 15:23:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdy5-00000002um9-1X6Q
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Mar 2025 14:18:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac25d12935fso36011466b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Mar 2025 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741616336; x=1742221136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=;
        b=bU136z4I0di7d/Ig+ISCSkzjg648SUwZRjaZGwdMeg6tqyNAnFP58aEcZ7Q1rZQQmO
         Nos46WzbJz1jt1PnHMX8eoUhV87GpJpty708/5cq6KQHwjudGKDV6Z+zhztvyihHKe32
         jehWJmyfYbLtParNDZMdugycwsYbfrTWawD7DNMQUN+kcMWjwcMxnMk9GJe9QGfCAWIe
         rK+xKo7FOB+CbrvppNwieX558OKmHg2FS6c7gyLic+Cb8gXqftTL5V8rNSQaUJIB9x1l
         ymlwYlWJMrZmz6HmCNBkSmjDEIzbpYvEaSOrHZGi9UgnaiwT8HpTCkm79c6fJtVEejmS
         By+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616336; x=1742221136;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=;
        b=WFvMOb2FO2f+KYnuMfut9x+G7iYGm9lAdYWjI8lU5DWvOX6j6UBn5NW48uoDe3b3qP
         Yg5unaijQaT0blNZ8lbAzIuDMhb+u9OHjzDWR58zZaQepR0nnWBF9Q8Zt+6WSBtyqYPU
         E6pLPSa96HYYTBHl6OCczNFiJE/czJpU0hQHXwQ6ZJTCdOuPBEP9/bN/4jIWLIwsOEBo
         RBde/W/qBkFDdD69+AV3YAlo4P4Db1SA0RWwI6jNRZ/NcUkmZ4Nt8cEM0+kKMDHUzFCP
         Bx+c5UgDHvbxsRxwGkv2qci/ZH+ciiSI3kUIGhbmqaEUOVOCJK7Vy2Q/Wvx5BxRjZ8fU
         +jDg==
X-Forwarded-Encrypted: i=1; AJvYcCX7PIoUiU3/eIhacDfOUhpvkpZJCREeLtfh+nuU7qTKMIEJDWedR8ZAGImQ4eefOKl8MuTtLDFRqOkiNKcLGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB624lNHFA8RVlQWgIn6nb1Xkgu8X+7OeEtPRoZ3zGfzM+wZFA
	xnBoAE4tGJgl7Gb5/oURx13+9kZXhi0MJmxY09+H9mmitWel/kbvGrKQGO7JOIs=
X-Gm-Gg: ASbGnctZ/o1di6dLuWhQqaOW7WRiC8S3D5IRcjxDbRFB7gZCG59hjA+0yEJDNJHFKRW
	MK5B+FO4STx3po+vT+18io8u6d17yWKM0ie5SgCDrLN5di4fLn6RSUBpi4t8gcgYyrY84IZBvwm
	QnJqnLzXYb6hwy0TGDMrcIIzgUCP9SVyXZYikuTTzw2OmfMaSBcriIUs5ZHefWXfErqSDIHQyEQ
	kosiEbPqnFKVO/iRX25zumgkMC+lytMatj3m2N7Q5J3+YbjilsNlIGDvf0ZW1XUriEb34irVH0u
	A5mEQjNBaDBTMCfaf+DBgVWUWod3Nt6akAssHn48LPKf6dYXm07egDYKF3eF
X-Google-Smtp-Source: AGHT+IHS0jBvu9XaHak0lQufHDfvzvcPfBU6Anyh683mM3GmEZy4fDxzSj+b5ABDl3rLWTDSOFRSVw==
X-Received: by 2002:a17:906:478a:b0:aac:619:6411 with SMTP id a640c23a62f3a-ac27162dcf7mr355324066b.11.1741616335619;
        Mon, 10 Mar 2025 07:18:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988e590sm763446566b.150.2025.03.10.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
References: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
Subject: Re: [PATCH] memory: mtk-smi: Add ostd setting for mt8192
Message-Id: <174161633416.57206.15365261153795396869.b4-ty@linaro.org>
Date: Mon, 10 Mar 2025 15:18:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_071857_412695_AB8BD101 
X-CRM114-Status: UNSURE (   6.52  )
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


On Fri, 07 Mar 2025 13:45:08 +0800, Xueqi Zhang wrote:
> Add initial ostd setting for mt8192. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement.
> Without this, the VENC HW work abnormal while stress testing.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Add ostd setting for mt8192
      https://git.kernel.org/krzk/linux-mem-ctrl/c/90a0fbaac4a588a1116a191521c3c837c25582ee

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


