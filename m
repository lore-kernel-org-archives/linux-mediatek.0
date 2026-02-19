Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303C7E9A05F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 20:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=; b=ome70k9aP6XdPYmlK6yCDCumXj
	Jec5rUWt60EO72LCvgnoWbUGig++mPdgt6wD/b08XVNmRdwAo5sEVtQKcrvtEgiYe57ujskZ9LMZW
	6hjalv2wZ6+m9V2dguyY1NngO/bTsY76kwhvLNMGCwV93wldAqbTzk/uycmMEF3Me5AmaStQqyLc/
	P6rD7R4MRtuDw0xTi2Qdl1ko7UT+4H152TPFoZYnFoeVV+s1sywgCt1GcpneS62pUw7IWh1QJyhVe
	ybaVbzf+FOW0VzgLqfA/u9IFLCTZBTzledzexLLtCNZPq/4GVEJNQODBZ5FrOOJrfL8OAvFoItr7H
	7LapsT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAxe-0000000C43h-0KH9;
	Thu, 19 Feb 2026 20:49:22 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtAxb-0000000C437-14jL
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 20:49:21 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-463a0e14b4cso521936b6e.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Feb 2026 12:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771534158; x=1772138958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=GwwxhKhxu3llA0hEpopnUabf8CRB91MJdaDX+UrJllpzQgG1LK7s3VIRYdK2NLhg38
         fYywg871cMwD/7u9M57vBNeWtciAkcht0G/v2ugZD0j5Snht4pDIlANUCN1zU4JC0xBB
         rskkkG1UV7GSWLAfPsWBy6V+XMSjsng/xYZW59jKqQRsTp7CYgAzUYs9txqBU5WmjAQQ
         mtsbciZ3INzIoR9vB5MjDzAjou41J3kHg6DSFYpePQGoqek/ajKSNorI+t2jCaTCwd+2
         ZsnbivXVeAqBkEuUTgG95Uk8nqSuqNUugEc0czIbhHIXP6N9nDtxilX+7P/RhCr702CN
         oIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534158; x=1772138958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtgTLfGOcjGDe5PL0CHRRM4ZPGAPDgJhQWgABhxIwOI=;
        b=MH8x/qj7KltCKWikudKkX+gdqBVQ7+ETJzYgULeb9jB2Xw5MB/s4q8Z+pKktO7K073
         qzgGjZqHizBBnEpxy42mk7qesLkh9ia1iN8nj3yuQFv4PGr/1onfER0Q64EWxtOWyeXo
         GqBh6L55DWqhEw3FWyZpBl/gDVEa8t+97kmGkIp85aTICgla2jybgI766zVbFl1upCyn
         fadCRyWBTRhFL8+oYhEPcUwFH2PvWXAqP9nqTGz+MMVOmjXPCKUVK52uxpo90jDdw3kf
         +BrhFikrHs46d2zi5tkVIueWXtpn7kgpunL1UK5PXjlqnAfFK+CWeWTbDoC/E4KzeRVI
         ELeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhadmSwdZ26+ihfk+6MfOttkfwUh4nxTAbEeB8Ff4MsXlM2CEV/QWRfiY9/eKb9Lr5N/a8m3aC+rIA/nGiTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyGnITjZgIecb33lBcnpMZxrai+QacMxjQOhqzvd9k8mMwyfE1
	5Lo6lMsSIG7XlbGhxl5AIugI0vN2gskOpH4iPzmCYHtOvVjN5rCkK23vmRprd+arMik=
X-Gm-Gg: AZuq6aIqzi4jfXZ37ZzbLnbI3eG0xeE8uKSJ+y7Ojg+ksnuPC2AkINt07QNAAU5KIhB
	a+saGg96VUkUdzPX0vxdvITF54hOKQBdr4z/clyDNPBSSMqES1qLBBrGBAW3gZFQPFIwZtT+whS
	P4zS7Myvr5Bgq96EjTxq3bIJj+CVO+2r32LPVCHK+BtVk7R2H3gB6Hox/QICy/VwaU0ulxT/v1g
	UXQw8C5grUJGyzJWU2L3FIokCT2vWbKyvdp1g28RjUSk/SitFg4o/8pIdxPx5BvAETwadjvd5GI
	hfOUsuQ4pGwOSNKI691n3Suq/UExV/oSCXee+IbqAPIFO/01Cucef9+Is1rWWKg/DAAMkW+TLcc
	3EGUvTkwVI4O19zW/kVh3xYWfi2ij5XhPGsbAgyWhlKFLG0o4AS0s4zJvheZri7r1xAxgrRv7Jt
	+X1hbmFWwpjZDkW8L6Ht5DaHtCOPNyf7pv/bUqZ3TG1WBnCwFGw+Mn8iOOle522dbiz0GNx2wqe
	KAShE44
X-Received: by 2002:a05:6808:1448:b0:459:b569:702f with SMTP id 5614622812f47-46410b94689mr3904867b6e.15.1771534158258;
        Thu, 19 Feb 2026 12:49:18 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463a4ede045sm13618351b6e.9.2026.02.19.12.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 12:49:17 -0800 (PST)
Message-ID: <4b22e998-b38e-4452-82ce-1389d7086a04@baylibre.com>
Date: Thu, 19 Feb 2026 14:49:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-6-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_124919_556372_F2DE8325 
X-CRM114-Status: UNSURE (   9.19  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---

...

> +static const struct mtk_gate vlp_ck_clks[] = {
> +	GATE_VLP_CK(CLK_VLP_CK_VADSYS_VLP_26M_EN, "vlp_vadsys_vlp_26m", "clk26m", 1),
> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",

Should "VLP_fmipi_csi_up26m" be all lower-case to match the style of all of
the other clock names? i.e. "vlp_fmipi_csi_up26m"

> +			  "osc_d10", 11, CLK_IS_CRITICAL),
> +};
> +

