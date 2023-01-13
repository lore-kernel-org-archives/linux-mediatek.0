Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECCBC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn2+fCHl5ad18BYclTOTd/dWOtO4Qcidi7ooXugxCNQ=; b=NrGdcBWlnEcDs/T2jgITTQ1QGp
	HJUJqnAK9lXb9z+4bXXT+hYVDySoSig7GVUGG4uG4MKepwNBY811pL2Y2+eQo2sdsBjKlvRGQkWMf
	54HSzPlsl7AWmpLssXY/4kSZJNK+PPT8zcDDSVUmp4DTx6iXmoQFo+gyUJOyiGU+WNlJt2xKnbAPr
	mIk70ZatXtfaVehovWeUQB0D6rXwDWqLAMvkRpkWaItSMTGc4EswFPP8QeBq/OspeI6QZhEnQV1z+
	aJdEtNOkQLinv9iiIepSffngIWPIejMH/P+0eJ82QtxK5hiRH9VUmIMfAiBRqDLHl4fJrSHUktKQy
	fc+opVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIUt-002Ihs-CR; Fri, 13 Jan 2023 11:45:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIUh-002IcI-ID; Fri, 13 Jan 2023 11:45:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bs20so20817145wrb.3;
        Fri, 13 Jan 2023 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn2+fCHl5ad18BYclTOTd/dWOtO4Qcidi7ooXugxCNQ=;
        b=GS3kERsiiAD8MQz1KiiAaDhKe1WJ+iBm9SjGh2QWZZYbCE1EzGzfumiTO88BBNSkAi
         Q+RAVpaO7n1uTFgTnBCmsb3BRoh3ytBvrDF81ddV6XKevC1O/Q7xabgIxvH6guBsg9DK
         lDqyo+jPJpdg1n9P3KJvfu+pnzQETtAFPpvopSqo4Fxuxo7qfF/EoUcwJK9s8Ehy//WJ
         wuXUXMEw6D2LThQnGJc9o0nMRN4rjA/nreRDExeBtz0i1wU7MpDAPYFk+z+dMoyORkH8
         MkjoiZSMXLxgrI88yAwxdrUTz+GpyZwpaR/Jig/lnzZ0L5KurNn7slGxFQGtv+lM0nwU
         aJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn2+fCHl5ad18BYclTOTd/dWOtO4Qcidi7ooXugxCNQ=;
        b=sPlTPNxPE2FKtQmppF9o/0S6StXuAzgTtSA7tCwpwo+9jfqj9hOVvJ+/SmFicSdG7u
         eF8YYnrtRKpjLiiZ/8id3r/2JAu9F0250VvNoJRhvrbNAwEWQvWcPtKI+DiH0HCteaSS
         iuWfZkAbRAIKXaAfQCzdDqhBv9RpMfhh03LSPc71k5cjG4xSmxw04R9LQyN1r2v7ZVVa
         v6MFZqp2CkO7mm/Yyj9a6Te2cyNEYzMCNy0t7lyBaTGXQDe6yi6tC2QMKOdUj0+mnajy
         Oig4oVfTKg8CqdFf4U7uCiNdjBZWTPe33v6vzr8bH6ArY7Ct/3Bdlhecm5liaaOPpr/2
         oIGg==
X-Gm-Message-State: AFqh2kpznpDD2R22Tw/wsiHU36qeHwuNe4DhPHoj56RpfghrOqLq6HJH
	seyCMoht/Mo6QOZwbZZpsj4=
X-Google-Smtp-Source: AMrXdXtfcJLQrWeIUr4UDN6ImK6x+hSR/nhLfjBfN+6jtiLjGDc4A5OGvU9xqAwrDkqqZLh6yaSVoA==
X-Received: by 2002:adf:e7cd:0:b0:2bd:d782:c2b8 with SMTP id e13-20020adfe7cd000000b002bdd782c2b8mr3630527wrn.29.1673610306993;
        Fri, 13 Jan 2023 03:45:06 -0800 (PST)
Received: from [192.168.0.30] ([37.222.254.155])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb52000000b0025e86026866sm21956492wrs.0.2023.01.13.03.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:45:06 -0800 (PST)
Message-ID: <1e5d5341-4ed4-0333-a56d-673f8342aeed@gmail.com>
Date: Fri, 13 Jan 2023 12:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 3/6] arm64/dts/mt8195: Add efuse node to mt8195
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230112152855.216072-1-bchihi@baylibre.com>
 <20230112152855.216072-4-bchihi@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230112152855.216072-4-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_034511_657012_1AE15729 
X-CRM114-Status: GOOD (  13.10  )
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



On 12/01/2023 16:28, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add efuse node.
> This will be required by the thermal driver to get the calibration data.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5d31536f4c48..09df105f4606 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
>   			dp_calibration: dp-data@1ac {
>   				reg = <0x1ac 0x10>;
>   			};
> +			lvts_efuse_data1: lvts1-calib@1bc {
> +				reg = <0x1bc 0x14>;
> +			};
> +			lvts_efuse_data2: lvts2-calib@1d0 {
> +				reg = <0x1d0 0x38>;
> +			};
>   		};
>   
>   		u3phy2: t-phy@11c40000 {

