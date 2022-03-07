Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332AAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbvgPMBexYNjyA4VLzRV+ux5Ef3nYNzyCsLbcBXhiTQ=; b=I20mxAivOneQuy
	qBYnIlR8TesUBU/Cp0Rqk3DmkIBay2G6W/9D+nZ+oS8ptNyGUjyQvLdRFp7P79dtRvpjtzPCl9SeD
	Ykwevujx77CqYAz/MQ3n0DGGjCa0JEKPvlkjiVS615uen3ATrs310/smOCwVM0JOQQE5BD9kijkvo
	epi/n+X/LuwhLbyLe6ge/AuZhNqMKr62ac/zYcRCsRZyA6hFXHXwKkNtItIhGEYhNiZfc7nTqsIcq
	NBfMOLpRjLZI8uumlPe4J6F/mddba09gbMPvXZiUeEylH34H3rJD3HtRX3aRxG7YNXuzI7AOgNxA4
	Znjec9p4eD2DEyRDD3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR9OT-00Ge5B-ET; Mon, 07 Mar 2022 09:11:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR9OP-00Ge2a-2f
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 09:11:03 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 680613F222
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646644259;
 bh=5EuchempEFVBJsNObrSN9bZUlyRNhaE6rhfvz/HPvrQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=b7GtmgRNyaJH54H+na4BUOczzUlLSBG0J2uW//cuoyMA3O4MkKgfIqVf4V25HRkIA
 lGmPAtV7G6bosyHhDq2Aeby3BNAiEKVimrUteC2N1+zEkeXdIgZnX25F3OFdjWFUk8
 TtgZnfQGiGrg9qj+BvUfgCMOdIbsHCJ+ICDPdg2GjBQanqOL5VvrEs1Jjxg5OJbLqD
 AxNrNlad3TeFyMHmg5XlpVvcYZf54Fe10WV0KCrE32N7X5Fc6plloJ26VAnO3F7JRh
 QIBMK70oOn6zu/f03y9KeY2BrRm5P2aXfwWyokXnspc0YfKGqOzIXNF3qCax9ksTwo
 mnrsyv40Bn9Xg==
Received: by mail-ed1-f69.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so4773930edb.6
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 01:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5EuchempEFVBJsNObrSN9bZUlyRNhaE6rhfvz/HPvrQ=;
 b=VfgFxxHYp71OPaDeu6WEicEgzjTphx2p2PyHBMt1W5yIj5QL3M7PC7lZCcPvyl5b10
 Fsu9MghLYUyImOfZWxoJTGlVpjURdUkN17AQUsXqWbI9VO0r7iPCEly8u3IQc6L46BRm
 OBy0r3KA8/Rg48uEuQ66DGkSVTTRL0+54pGaTbrA9UaEB66+WnaKGfvXTQRPocZI2GNN
 jWhNPNzkl2dIK5TqVh7cnG8nZtpCoRJBXoa3fIGMlrmIZ3670Oj8WOxGSGAFz5/34ATw
 ku6cbxON3vW0hjBhIBjUTlOHb0Zd3QLz/pptvrNkYJXqVOxwAzRhvEjkza9oHRnOFNwz
 9H/Q==
X-Gm-Message-State: AOAM531OTIeAmyqwYQ0n2fFRG+Ko8oAFyowAvTu0PhD6qJbYuOpBvtS+
 c7qHHfeYaWu+oW81X/T5r/a0bpjQKsJHK8/OumvsLQ5DwyKNjzsQujjsEhTXIfM5ucL3hfn/Oco
 EH1DcIcIDGVRHvzhhP5x2etj8lNU2HtgQofx5ky7eoVvEnPDRdg==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id
 me20-20020a170906aed400b006daaa56c923mr8053744ejb.148.1646644257473; 
 Mon, 07 Mar 2022 01:10:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtBtJQDeExiXsvhuBndc2H+XAln/uM67ymh7Rq5QR/XjrVGGF3p74nHBCcZCCYoYOwudMCpA==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id
 me20-20020a170906aed400b006daaa56c923mr8053730ejb.148.1646644257300; 
 Mon, 07 Mar 2022 01:10:57 -0800 (PST)
Received: from [192.168.0.141] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 kv9-20020a17090778c900b006da693d5e91sm4442728ejc.122.2022.03.07.01.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 01:10:56 -0800 (PST)
Message-ID: <02bd539c-f704-dbe5-4d58-fc62314025a7@canonical.com>
Date: Mon, 7 Mar 2022 10:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 03/12] dt-bindings: ufs: cdns,ufshc: convert to dtschema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross
 <agross@kernel.org>, Jan Kotas <jank@cadence.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Avri Altman <avri.altman@wdc.com>,
 Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Li Wei <liwei213@huawei.com>,
 linux-kernel@vger.kernel.org, Stanley Chu <stanley.chu@mediatek.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <20220306111125.116455-4-krzysztof.kozlowski@canonical.com>
 <1646623480.209864.1496443.nullmailer@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1646623480.209864.1496443.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_011101_385010_C7CFD0F0 
X-CRM114-Status: GOOD (  14.07  )
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

On 07/03/2022 04:24, Rob Herring wrote:
> On Sun, 06 Mar 2022 12:11:16 +0100, Krzysztof Kozlowski wrote:
>> Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
>> format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
>>  .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
>>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
>>  3 files changed, 71 insertions(+), 36 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
>>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ufs/cdns,ufshc.example.dt.yaml: ufs@fd030000: freq-table-hz: 'anyOf' conditional failed, one must be fixed:
> 	[[0, 0], [0, 0]] is too long
> 	[0, 0] is too long
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/property-units.yaml
> 

This will be fixed with my dtschema patch:
https://github.com/devicetree-org/dt-schema/pull/69


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
