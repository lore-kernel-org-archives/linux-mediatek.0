Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D68C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCD7Xd2zaqm/TPiNrfE16a0/uvuE9zBuS+YvyBVXAdQ=; b=FBgEV7FvsQzMDS
	Y7Ays6LyX5lmMzr6QtQh640/N9OBqpPkgongaQdeAH9uV2MdTBuYSxICvGkTfFiRx35AxkiElviQw
	gD8vj04rmLw9S/2IonZfS8ez06G3+Q2zYkGqZKEpe607PsPxfV0hHuMLwCBGm+KfdIlaggvZ5qBQM
	+jxrMa3sbUvOaMF+R4aw7pEgLPubTuXjwUxc4/Eg8Uqc9BwlXYX2pSb4T3PCZgV4reseF/elZYggm
	ZlB1xuSOZDeFpFQwwA1IEdyD97u695DuZrOoIg6xN0NnnpjHyte+E0egng2Cq6r73mhdzoIEX3BOV
	wL7ZoucmTjTy+p1JfLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOGjA-00930C-Jq; Sun, 27 Feb 2022 10:24:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOGj5-0092zF-KF
 for linux-mediatek@lists.infradead.org; Sun, 27 Feb 2022 10:24:29 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 749593F33A
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Feb 2022 10:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645957466;
 bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=EuFZ0vkaAKB/9qRIc3eZwgPijY2VALOQRfvnCI72KMCq8FNEI6DVHbpH23tHKbwm4
 1aLPmH4pr3OBlEg7T4B7dHlxXiIrTyNes1+6D4NaLMkEEHak1dZ8MwHGJbJj8LfRtP
 +IyQCuMel2lpAsOkSMKOlPooJkuABgLg5oqSwMtFIHs4gZvWFXK4pUdIKBe/RhmGlD
 IRChFvrY8rQslpglNkwM7AvlFCrQirGwpSj4T6/cfbnedFeULFyhEvIMBNmgAv8gMo
 akT2bM5z9C8w6XDmgm0bn6cLaSYxN/BoiFxJSAseT7miee8e5QYWYX9LAcFfhtPjYW
 1mEEZfSzsjotw==
Received: by mail-lj1-f199.google.com with SMTP id
 n9-20020a2e82c9000000b002435af2e8b9so4322175ljh.20
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Feb 2022 02:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gFalKRe8JlGPelOo/R9VR3IL4dqyePAFZHwDnlwRlEk=;
 b=rqWEcRuR7hiwmmx5aKeLZrri68NP2LWUk5z1HdHX/ot30ToRwlgfQyZW29MOXhLfgy
 hEz5WzGv52E5NlWmLQnEwOt+CRNmh96ioqvruBwTpnfLL4gwg8FSfpvMS60B/OUVxOPF
 f6F2yuNkb26gA25heexA2AoBDEY/xTrmHiGUQ1jR5tMbdejaHeQc7qtCA4EpR8no2Ndz
 B+nFsSFkOVPKZty6VBWtRSlA1z4Jc/8yRBerz4+NawpjWWfqkP18Sb/E74m5ceqDOFhQ
 FNmxmApmZ8w4jBYGnmL/JOv9wpuE1fktvljHJ9q9oSbEztCEzLOn7QsrsI5RtrjNx8pp
 Hg5g==
X-Gm-Message-State: AOAM531GukQ8U+0Waq2F6kROFRX4GzOtWvCrqI/V6B000ElTJFJ54EKg
 HyzR268LaM04A9pF/QVZvQfE3d37r5Xq+XpMjDfwtg8uqqZk8Dq3TyfTN+IOnsZPmxEpSiBNAmm
 CxPaPR/51/huEa5P2bGezn+CiPs4q6vNElnjSsPXHvhG0ZBBteQ==
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id
 rp8-20020a170906d96800b006d0fc05bdc3mr11342177ejb.719.1645957455579; 
 Sun, 27 Feb 2022 02:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl3Y8M/TgNxwE3/0YwpdpPk65xBu71Ro8HLF5s9NgyHBBUg649P8bP26tAeg/OT/XsQvSm8w==
X-Received: by 2002:a17:906:d968:b0:6d0:fc05:bdc3 with SMTP id
 rp8-20020a170906d96800b006d0fc05bdc3mr11342141ejb.719.1645957455350; 
 Sun, 27 Feb 2022 02:24:15 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 el9-20020a170907284900b006cf8e3c83e3sm3243768ejc.168.2022.02.27.02.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 02:24:14 -0800 (PST)
Message-ID: <8ba5fb1b-2b5f-e625-0dbe-2acc3b6656e7@canonical.com>
Date: Sun, 27 Feb 2022 11:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/15] dt-bindings: ufs: add common platform bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Yaniv Gardi <ygardi@codeaurora.org>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-2-krzysztof.kozlowski@canonical.com>
 <YhktWpoJekR2Lj0D@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhktWpoJekR2Lj0D@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_022427_813702_92097819 
X-CRM114-Status: GOOD (  16.48  )
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

On 25/02/2022 20:26, Rob Herring wrote:
> On Tue, Feb 22, 2022 at 03:58:40PM +0100, Krzysztof Kozlowski wrote:
>> Add bindings for common parts (platform) of Universal Flash Storage
>> (UFS) Host Controllers in dtschema format.
>>
>> The 'freq-table-hz' is not correct in dtschema, because '-hz' suffix
>> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
>> and use 'freq-table' instead.
> 
> -hz is an array type. We can extend it to matrix if needed.
> 
> I do think this property is a bit questionable. Do we really need a 
> minimum in DT and if not, wouldn't assigned-clocks-rate work? Or an OPP 
> table.
> 

I think the proper solution is OPP table, see also comments from Bjorn:
https://lore.kernel.org/all/YhUodbzxx4wbr+gy@ripper/

I would rather refrain from converting it to OPP tables, because I won't
be able to test any changes in the driver.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
