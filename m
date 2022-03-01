Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DE4C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjtoYXo7W11Qa6zdQsjdq1RV7sqJa9HrSrSEkiuOHt0=; b=Lv7CSJWpJ87jhN
	8c2Y1hDbEGchohUxAcYPgTlWYbE3vReGHEysNYrG8DqQXq98vADzkUcHgZZd7t04pxjtmOUIfnRvS
	VGycokvZFfiJjG+BeGq990NPsaWV/zSFRmP3Q/pRsTFamUBzocqydqslWIjI667OO4sfjLFc0eMpB
	PKqdXR2+pCeBg/38Lp2OU3lyqwmQsYp3W5t1kTuwEgPKOIGKfhylEkuQjgloX4mjXyshqTj2mMQsb
	2IDIr2+FPbg9WbiWmEvCpSx66y8h2FSOA54BFgZBRGBP92MpZCV3CCfYxIHX8pBWCjg+Ubvce7L1e
	p8hhMhAZ+4QGclEJJK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxJR-00FQBk-NF; Tue, 01 Mar 2022 07:52:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxJE-00FQ8Z-MA; Tue, 01 Mar 2022 07:52:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ay10so1187894wrb.6;
 Mon, 28 Feb 2022 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QgCQToL8Lxm+3TwetMYVdeOe6DqGsRMNEoAu1Q0sX+Q=;
 b=Msr+Hdu9PMBLEomg31EkVjWkx3w3yOPysT2gAqSsy1Q8nTjFwVq5fEbEWtj3XQfw3Z
 wMwbYkeUhIY4R3e6edyqcz31O0ayYBQBeTF9mfI0KdFDK4ix/14+r91r9UN2lMhMgIUo
 tDRCl2FLV/pL+h6THIresY/D+6F9qhrlKH9j+cwyWurGztms0gn39cBZKr2FJ0hC6JqC
 JYlnREcZjjSoUNB+nTruURcr8p4TR3yf18qqtGf7vf/VdB/OHqtftki4oYuae8/SztBA
 SFPvyV2QxBecnvHvAvu9Uunxik32gNB5/6isELdv+ooSqK8z2SLFe0d9Sr9bpY4QBiu7
 31Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QgCQToL8Lxm+3TwetMYVdeOe6DqGsRMNEoAu1Q0sX+Q=;
 b=jbVY0Bx3lpmWy/EQ1Cjkv90jXAOxW1CC7q9NGTj089XxPbnPQOmxEacKav3vS3XJhs
 89nLgrcuVXcSDFC9wL67yRQrEFU4vuQpuCo2Phna37sw5igQVJsDa57/HKJnkYUp5CvT
 H2Tub28OdYn4/qZdcF1oqHFwFy281qQnmy4GcJDjFSBKEuCb7zYGIv+jvuHTS7uhx/mc
 hF1eyuqrPPq+Yh3tMxrVdohdslSpX2zjDf0sWSZws5+HELNz87N9Glqu3l7pY3LeTJNx
 MUM2ew2xoO4Op9P7nideizJb3xV1XYy1FosLfAM/it/hpXTlM+LKOjhcSEmScOuU3J/O
 wBWg==
X-Gm-Message-State: AOAM531nv9pQjxr45l6MpW8cRxu3JqIlWVBtVGg3tgC9+1oGGChBy4TV
 54w0fqypBz14HV3jrn6RYW0=
X-Google-Smtp-Source: ABdhPJzVpzmSMCRiuFoBWFG4z44NNPbssCQl1YdBpK/b+IG5izDPFtRvAM2Rl+lb0blw3AIeZ7Vk3Q==
X-Received: by 2002:a05:6000:8d:b0:1ed:9ed7:c915 with SMTP id
 m13-20020a056000008d00b001ed9ed7c915mr18482884wrx.543.1646121154834; 
 Mon, 28 Feb 2022 23:52:34 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d598a000000b001efab095615sm7602985wri.29.2022.02.28.23.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:52:34 -0800 (PST)
Message-ID: <95f33dbd-4388-20ec-1e4c-ac323de9d18a@gmail.com>
Date: Tue, 1 Mar 2022 08:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/2] Add PMIC wrapper support for Mediatek MT8186 SoC IC
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org
Cc: angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220207083034.15327-1-johnson.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220207083034.15327-1-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_235236_759053_19DED65F 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/02/2022 09:30, Johnson Wang wrote:
> This series add PMIC wrapper support for Mediatek MT8186 SoC IC
> 
> Changes since v2:
> - Replace meaningless suffix _V2 with _MT8186 because
>    these IPs are only for MT8186 SoC.
> - Remove not used capability PWRAP_CAP_MONITOR_V2.
> 
> Changes since v1:
> - Fix the conditional logic in pwrap_probe() function.
> 
> Johnson Wang (2):
>    soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
>    dt-bindings: mediatek: add compatible for MT8186 pwrap
> 
>   .../bindings/soc/mediatek/pwrap.txt           |  1 +
>   drivers/soc/mediatek/mtk-pmic-wrap.c          | 71 +++++++++++++++++++
>   2 files changed, 72 insertions(+)
> 

Series applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
