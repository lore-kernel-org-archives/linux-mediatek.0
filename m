Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88546EE14D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 05:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ragyha6lBrnhd2E4z05r5Sz67SJVNmBsRmnvqyiefU0=; b=fFLOQny8h9pje19m0XK5yB/EPl
	BdD4fcn0WbLiHurmMp4nfk1imSas+hB7NygBnReJvw1R4uYINkFcDtFkwcdxfVtcIh3IlC/dLsz3I
	ARLZFQM52/jDFvDEAEvYzmPjLx8sxCvAD+bx/q0kn+Aw0+Qid8o13ROfKztCMT/V6NTTtusyfzohg
	+rqpOQcqhD8z5+AuOt0qWCnBDBt7GNUp0i5B2BJbIlsE7TknuEa4gNsRIELRu9zIRDNWcgVjeSjKH
	rPWk+Y8BkyY7jnAexstGmA3PMonaVuz70i3XZ5R2AGFxMiCbsIP/H8kO71aLV73X2VQ4+KoazY73u
	twz4Dbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe82A-00BOwY-0K;
	Thu, 07 Sep 2023 05:58:30 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe827-00BOvi-0H
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Sep 2023 05:58:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so3595660a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694066305; x=1694671105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ragyha6lBrnhd2E4z05r5Sz67SJVNmBsRmnvqyiefU0=;
        b=LDh39Aj97uLNM4G9nrPwUH633TJNbk5sc2UYEbG2NvZRVYrpU9Txe0/HcD08JmRabX
         evXNMwq6glJKfKPxkBHKUFYicpZDjsXAwbk6gmAW2FIuKnW0bzm8fcGxiynx7Vn5CZUi
         uIVZNS8PAnRT1jkeXTt4HdH4/8NKt9uavYWyPDMDWYBOWBs8DvIk0eo951+8CjbAHk7U
         wsOrp32d4DyLFHUh1pTyXLgQR2AcP3OrMG8Lx8Q9T8GOFdlIYwPJpwpTB8iPQ7fU7WUU
         pMMXhFOpZziOgYzdmIul97ny+Nf1Vt9Z3pd6LXjl6YIS/4wudBCprcyu4a1MxLVQ5nqq
         Moag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694066305; x=1694671105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ragyha6lBrnhd2E4z05r5Sz67SJVNmBsRmnvqyiefU0=;
        b=fh6xshFnXRXYFqgK/K3lXMViKKpa8kzMJKPJUWLu1aIeIJasWhkAsj/UBuOOURFBND
         LB7f26ldWRB9DyLvS3Kw57HduizKJvl/XPNzCmysvpqftucc5mKyGNP02ZBRfM8JyXr+
         OKXZFxAy8slwIoUZB10d9NYaoOCJx3OMoHiKUQevJCFW2ZpvvdaAKTd5dfaTkSmxSNz+
         TRt1kBUWR7kLePGGHGg1p2a5C45Vg/RvlRLEnr2FHFS98eP/xcuPICE2IBCT4J7gUCXL
         7+GqG4DRRBKahSQzARDIhzFb9DOUVwekFYAfJLnthErbO147jbQKU438310GKJkFy/h/
         NKDA==
X-Gm-Message-State: AOJu0Yz/MzYbwPER1L1lUb33FsYnUgZUOzFhaBc3L61Vbe6PHAFA1hBm
	SCuuK7pdL7Jf6yjE+VGHwzt2pNab4D19VZLV5Bo=
X-Google-Smtp-Source: AGHT+IEP5lHuo6K1dRgooEVKve4Q+c2iLkWlLM+qsv5lJAaTMcXKxc9v7sPbPiK8aU4DbGM8Si9Acg==
X-Received: by 2002:a05:6402:26ca:b0:523:72fe:a3c4 with SMTP id x10-20020a05640226ca00b0052372fea3c4mr2255438edd.0.1694066304465;
        Wed, 06 Sep 2023 22:58:24 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id bm26-20020a0564020b1a00b005288f0e547esm9343359edb.55.2023.09.06.22.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 22:58:24 -0700 (PDT)
Message-ID: <07acf4c5-6a03-0196-335c-88f7c367a526@linaro.org>
Date: Thu, 7 Sep 2023 07:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
To: Macpaul Lin <macpaul.lin@mediatek.com>, frank-w@public-files.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
 <bero@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
 <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
 <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com>
 <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org>
 <c951f693-b219-4745-be20-a8e1fee0099d@mediatek.com>
 <E3DEDA34-C203-4560-B07D-8BCB44204FF3@public-files.de>
 <8db8823d-8313-5515-78ca-effc8d6bc47f@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8db8823d-8313-5515-78ca-effc8d6bc47f@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_225827_123240_1361A25D 
X-CRM114-Status: GOOD (  15.42  )
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

On 07/09/2023 06:07, Macpaul Lin wrote:
> 
> 
> On 9/6/23 20:19, Frank Wunderlich wrote:
>> 	
>>
>> External email : Please do not click links or open attachments until you 
>> have verified the sender or the content.
>>
>> Can you please only target Reviewers/Maintainers and mailinglists reported by get_maintainers script?
>>
>> I have only sent patches for mediatek and did some tests. So i'm not interested in patches for hardware i do not have here :). I guess i'm not alone...
>> regards Frank
> 
> I'm sorry for bothering you and other contributors.
> I've indeed run get_maintainers.sh script for these 2 patches.
> Here's the result.
> 
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED 
> DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN 
> FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:3/4=75%)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND 
> FLATTENED DEVICE TREE BINDINGS)
> Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC 
> support,commit_signer:3/4=75%,in file)
> ...
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> 
> (reviewer:ARM/Mediatek SoC 
> support,commit_signer:2/4=50%,authored:1/4=25%,added_lines:1/12=8%)
> Frank Wunderlich <frank-w@public-files.de> 
> (commit_signer:1/4=25%,authored:1/4=25%,added_lines:1/12=8%)
> ...
> [striped...]
> 
> You've contributed the similar percentage as Angelo for these files.
> So I think both of you could be important reviewers.
> I'll try to skip contributors who add lines less then 10% next time and see
> if this will help.

No, commit_signer is 1. Don't cc people unrelated people. Unrelated is
everyone which is not maintainer, reviewer, discussion list.

Best regards,
Krzysztof


