Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX+a7I71O/XGDDOzCMIizqBFVYbjwhysA/pOZu5zAlA=; b=C3XcU0aiV0BWWW
	PKwLBgQ3we9fk2b04pbfW4VYX7p79/M2TPDuADe94Qj6wLjWX2f5AdUBd3q7ICuvmoQcslM3b9x8c
	JRWkvkJnHK9+f8kt9tQ5LpDt9RRI69/zhCFEifW+TDulL0Hg7F7kbS0+F9m3tnDjShXEANTN7++1g
	AaPN3KMcPwlDEX0eZp/o21RY9c90FnZE96P1JU1zSnzPEyvvG1fJi6Nl4Sx2CWU0Ip6lhyC8GoO0r
	TMMwEMcf+74PP2uRE2hhv1V2+6Re0wqyclpTnPDK3P3ciIXHTppiTfWYvL4KAK6q74+euqfDLiJMM
	0lrh12Du3qStIGMfp0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZFR6-00D2Cc-JI; Tue, 29 Mar 2022 17:15:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZFQs-00D29Q-H1
 for linux-mediatek@lists.infradead.org; Tue, 29 Mar 2022 17:15:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id r13so36477355ejd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Mar 2022 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u4/Xoq8QX2+BSN1akZ5eJ0B56WB/4G+OnIBGzph+8D8=;
 b=Uqle8LLPZRhi7EFrBAFaa3v0GJirU8cirdL4/0+sEr4luHTyY44LMh/eNY2bjY14q4
 aYAHCvphytwYlzNtmOVjY5J4zofpkdMkXDH27OhFhaSXwqoLQmnrckfUaxTK7keEbL9a
 vFfm5O4zrJEMHp+P3J/Lab5BUDEWoYXhs/oswOmVGtVQwyE15ol0UN/UR3+qI/Nht4dH
 yHJ1loyFFR4NMMEhc5VaHdSzS+uoWlngIPdGKGZ3MBO6Tz8dcC7tnhnZ/bPvLUERAe7W
 lIpZ9vj6gg93r/xmvrzO9tKZG2p3ZtLRRwodCX8rEUemAUhC+DOftKx/q/jL1LABxcW6
 g5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u4/Xoq8QX2+BSN1akZ5eJ0B56WB/4G+OnIBGzph+8D8=;
 b=P7iF7jWZywcxFK7yAvv0th5u5V2hzf7v2C5jeqz6ZkJCtzriSUZkCgkCFX4IA8/VBv
 BHesRsUhT2/z/WqZM+GFcMviQ5zYW6uk+W2yacqcMojFj54TzC4Pw8agDadsOy7br3oC
 8gkI0m3hhYee8sAhtfcP6KDtvTGCfSpYwXKZ8GdXf7HWt6MI+7oxM4N4/bKNYuduILbr
 ssrdrDttqdg2NakMmBpT7XGOOWNmOd2AuoivC/jnF4S5IssGGcCFxdTyzFZp8E+xWuBa
 664+hMXWnKNTP7tYdHFQVdxvbquavO9hbJ/f9ImDAMMia29eg2GPNE7aaxW6pl8hxrTO
 krpw==
X-Gm-Message-State: AOAM531BHjGfaSeraUtGSCQ6gPXw0sCo6HMZRgwyb5/kV3SFvGUN0ly4
 +drn8iqi600oWeOk+yR1HLRqOw==
X-Google-Smtp-Source: ABdhPJyO+8+whle+3kOlbJHCsgtYjuqBeH8vGylEvAwP94rgXmdsghv9CEj0b2o9qYXnTEPXWCihvg==
X-Received: by 2002:a17:907:6093:b0:6e0:dabf:1a9f with SMTP id
 ht19-20020a170907609300b006e0dabf1a9fmr20867752ejc.424.1648574100077; 
 Tue, 29 Mar 2022 10:15:00 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b004193fe50151sm8782747edr.9.2022.03.29.10.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 10:14:59 -0700 (PDT)
Message-ID: <a1c70fd7-efe5-aacc-bb4f-74d7a21a310e@linaro.org>
Date: Tue, 29 Mar 2022 19:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] dt-bindings: PCI: mediatek-gen3: Remove clock-names
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "allen-kh . cheng" <allen-kh.cheng@mediatek.com>
References: <20220329071526.10298-1-jianjun.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329071526.10298-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_101502_599760_C34B90AF 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29/03/2022 09:15, Jianjun Wang wrote:
> Some SoC may have different clocks (e.g. MT8192 uses clock 'top_133m',
> but MT8195 use clock 'peri_mem' instead), since these clocks do not have
> any timing dependencies and the PCIe controller driver uses
> 'devm_clk_bulk_get_all' to gets all of them, remove 'clock-names' in
> dt-bindings file for compatible with different SoCs.

One driver behaves like this, other different. Driver implementation
might not be a reliable source. :)

The clock entries are expected to be ordered and fixed, so clock-names
should stay.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
