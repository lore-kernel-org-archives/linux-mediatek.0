Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B7EC83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 04:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=; b=X1vTLBOi6pD/ac804Mr1EGZn1Y
	Oi375WaIC5drJlV5uu4EWiNyUcLDqdviaaOOICFC8JrfYK0z+wwkcBZwirmQ9FYrjpYjgqeB3Mo0x
	TBaxYPs2iBs2dFjkTAuwJSC8bqCZJAWXkWBTG53xhUzKx/chRKefsV5XmLxyXWw75QQtSutDSB8ou
	nbb68m8GqAo+HKXP3HfgcvSJnBU4q2F7l4fUvWuj/F0RF+k3B+sBykvFqFUjq+mm9gvO8wJhTxNuu
	g6DYdI6kMbA7J7O9lXiSuQN+W8xr/KaEE63TDHZMvBeKVVu2FVmpsPqXxEk+VqOmqQbJFRz9zZk6c
	6Aj8akGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4OJ-00000001F49-3TmN;
	Tue, 22 Jul 2025 04:14:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4L4-00000001Ejp-11P1
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 04:10:52 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso3837686a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 21:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753157449; x=1753762249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=;
        b=Ph/KSLzDUyCCUMSFZlyRSwTff+rrrytcrg+Ngq/BIGtBBZS8jTo6BCsK0we7GaWlhO
         hdh16xoKozJlL3M/hyJ7YjYHByJtHFQmohuVPY0BmP8p4GyQpjAv3hk/Mh8szsZYRJEM
         FK3UUlyjuA6bDfW1vpbPdupHULOyDnq0nzHfXycewdIfALdpj04ijlaAi4TnLboov4LO
         1t4Eq4ocM66R38QncaiF//aU/6UUdjf+AWydbHCbX8cGCc2bHw5ql+/el7ogNXVPoEUA
         Mo5S8KN2XOPZm4S7637fSWbxpg6eFjRWT32m1NSpdmVvMvbvQ9W+5cVR+9qkLUdkidU3
         4+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753157449; x=1753762249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=;
        b=O4DOhwFSUxecCDv/kAOMN4eKcAVBYmFGQq8XA81vRH4l9yu6Y9dWG9Zda7QbjU1IZI
         ozNMt1/Bbx00YDLERsGB2YnQQL0dolFD0vobtFFXdusmfwa+fuRLZyl3LTar8FU9rvc1
         GaYBb7770UtZuiGO5+cQJyhjUz3vUEDuI4DHWA7Ny8WMZahAncogHHC3h2b/SZ2wYeQH
         HQkLr7n4jLNxwuF7smEHvPMXumtitsz42wGH9JuK1XYugzk8EAt6IPdROZeUY4IYJnCI
         UY1b4P6mqba1U1qux/MFu2akmEjYzWXzqUREytKblBI4gbcJmpJe7XY59Oz/nMf+MOwI
         OMGg==
X-Forwarded-Encrypted: i=1; AJvYcCXpubARByPNOzoImWSm2LzbZ8ykuHd+TQk4mRxdRIb38YVuxxpQHRcV39w37HK3vzHR1H4CEgAxpiQIjFkqUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqEac/VlWIWu9u+MQOBorKwdE/19n/mAh2xuFCmyTmeMhCvM/f
	LauTWq15HG9uPie9EGas4U+thSGRk/gxLuxx3P0YnOW7g2+Y+SYkRqX+nVEcAFlS0lc=
X-Gm-Gg: ASbGncsmDTTAeixgW5Ew5OLQwvhQuHUuFSoTnp6Weo1Mb274FLebci+gf6OPmX3lWNY
	Kjgt+vBUorP0Lp3fTKVqVWhgUn4fomi46Dn636xFozttGv924zR3WTvtIWZZ4XWZviiAeJ/fZ8a
	5AsNTYSrodbb8umQhf2QVOMi9wXXv24Ie2d9v0BX9JbGZJHUc6yDULesqanwkP/cZocbMHjj16d
	80u6T6VKtSK+O6ZylcD9qMLixfYbM3K3OWufHQcR0BfplbVHCwxdLFIgCbJTgaUGu+O/ac9fuOb
	RseY/zoSTST7YnOA7q18gnb/M0Zf8DpgpvO+aqYUYLUiGooIJ8uvXLC8rCElyg7RNan1tvUtVGu
	hZOoy0xsefo8bBrMsZTCq/GoggVfqG/nn4w==
X-Google-Smtp-Source: AGHT+IHOKWMEzyu46KKsaJPjgo0xgycpcDzWx6CxVzgF6SZy+41yLFML71qXIxEHlqlltMpTlo5GzA==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr31553876637.36.1753157449486;
        Mon, 21 Jul 2025 21:10:49 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2c91sm6537501b3a.5.2025.07.21.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 21:10:48 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:40:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/4] MT8196 CPUFreq Support
Message-ID: <20250722041046.lf4b267bmolm4exq@vireshk-i7>
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_211050_841638_0C6D79BD 
X-CRM114-Status: GOOD (  15.07  )
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

On 16-07-25, 19:51, Nicolas Frattaroli wrote:
> This series adds the necessary bindings and driver changes to integrate
> MT8196 CPUFreq into the existing mediatek-cpufreq-hw driver. This
> necessitated two preparatory cleanup patches to the driver.
> 
> The CPU frequency was verified to actually be changing by comparing
> sysbench cpu numbers between fdvfs being enabled and it not being
> enabled.
> 
> Enablement in the DT will be done once the MT8196 DT lands, so don't be
> surprised that no node uses these new compatibles so far.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v3:
> - bindings: changed title as per angelo's suggestions
> - bindings: dropped the fdvfs magic register range
> - bindings: dropped redundant description for #performance-domain-cells
> - driver: made fdvfs frequency divisor a `#define` instead of part of
>   the variant struct
> - driver: dropped fdvfs magic check
> - driver: reworked performance domain resource offset
> - Link to v2: https://lore.kernel.org/r/20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com

Applied. Thanks.

-- 
viresh

