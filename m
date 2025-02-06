Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB5C02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THjRLKw27fymwkm9c9udCcZ4ry8EIlt6eJdjpKX8aMI=; b=F1vZ0aCCBtHCLtN/Xc3tA5OB60
	oQaEsVGnJSMY+k6jIVpt5AK7FBbpfmUghQkYla1gr1REgAZgpPxsgC74vymOyzFoPkFRDZqsdn11F
	cud72l6s5rHyROwC6seisB1uwb4iY3wEOLLxjC5lWehGFvbtpaWGEUSdbOCcyGP/FymEcjIAykGMK
	xdkhHbI/kNMT+A0uhW0Hg7co/Jpk4yeW19Ie29gMz7m6g42HCicNUqIotE+Du6jsojkfrS8s4hu5G
	oOMsRYvLCoVNqZsUUyb3jcfYI0DZr5/M7flmrCPUHLXWYcQC+jz/h6f3V7YD/qlNSosV4gFFIbC84
	WBHXmIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3C4-00000006dtd-2wTg;
	Thu, 06 Feb 2025 14:49:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg32J-00000006cIh-0O8z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:39:25 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a4f1so2078859a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852761; x=1739457561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THjRLKw27fymwkm9c9udCcZ4ry8EIlt6eJdjpKX8aMI=;
        b=09bwIQb6gU/MmAM02SU3iYHWhdJGM047GvMpcM2oCfP1SxEjWJ8DXr56VKPY2BWc5x
         VXnnmOd0Io/P6T8Ffp6fW7yz/Ow1JHoim+tjGoRRmelUqrVnxP57SaNv3+mkGaE6/xr1
         JS8AMq2j7LinuRw5jJSpvtTkGSR+TafIOyAJjKMpeum6+axYM/1bbUFeqfRFOjlKR9cI
         MA3DZgo1bZdieBPQWmJNRKOzFFGensp0elYnlgox3wx5AFEy/OOe873DS2qY7MXIofaN
         RB0dLeFngEiGW41pfLBsk9iiPmT1YIK9O2YLkq5Xx1Z6aKq3hDPt4CJP0ha2ygxNmoUu
         nGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852761; x=1739457561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THjRLKw27fymwkm9c9udCcZ4ry8EIlt6eJdjpKX8aMI=;
        b=tl6wqD0cLuFzKDLb5BEn2qfSIXjQSIfxVA/m8NP7XrM3cj+7RQC2pd9sT01h2TBaLQ
         sOahDhkyBMdclDDuGyUYvtutPWbeCmdd3omIjfGR1HFJy9B660HnEIZDsdH2eDibEWzh
         0YaYdldoIxJWa5e5T5meVa2ubtB4Ir9+aWEFoaARt3MXqvaj8zfdBeJXUPIxd514QmsR
         SP1xXi4UlRROnddXtyxXgWLqApP6LDkNoHijb/2a5WqTgjT3eoOcvqjGQE69xrPzxGDZ
         WRoGT2hlrGrH5ZTPhadVYaADBt41FBNtMORaUV8yLR6CLvDDEQzhSfJkxlHS9VpCwDn9
         gkjw==
X-Forwarded-Encrypted: i=1; AJvYcCVz+Bg2ikqhwpX5h5tJXKOM1ur+YlRrSO9bAsjPcEcfLgAM83ORBpX96cfHYUqAC8IzH7Hsm8uqVGAPFIjAdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/w62fwfnLm5U1xyQUHOnZ1fUIKUAx28mzxof5HCBj/vXoJUBA
	dXq/VrirVPjOwfZ26XAMRJei2INoQ3kZnr3z3id0rvFcH1fixkTXdYOjvmyrvcM=
X-Gm-Gg: ASbGncse+t5N7QHZO/rkre7X4auRi/eSS0ScOKwJ5yw53nMuq8QzWeaf1kMAdbDb6t/
	O6nik4dBmKDJzSNhW+cytmHpUfaYiQlmSIUS81Hq8iFLGzQDbcgbI/ZvBkBJlqi/CXYVZtYgOQy
	CrSIihPm6T8i9pdKQIXfGn3TE1PWOZD0uXv0gKbtkt3GPPMPmBR/2Tgmw47JwVmt3xNV9xgfQBp
	xv9dovy8Rj22lWUDqu4DfMfTaFH/EEeE8WfL2AyNcSV4w/jUFbVzBM3FwuGxVNyAFtavdg4vQq4
	DlQJsmN2U+fcGyVyy3+3LUgAZcHcS4Fj8hot+RSdvmRq09s=
X-Google-Smtp-Source: AGHT+IFlbmeulV0zbsnKd23pIgbY7sXFFTYPJ1StMcXHIPOGJvEQyfJ18rL8z1Xxot6BGyZS0rrfLw==
X-Received: by 2002:a17:906:ca48:b0:ab7:6e14:c03f with SMTP id a640c23a62f3a-ab76e14c0d5mr312575166b.21.1738852761390;
        Thu, 06 Feb 2025 06:39:21 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f843a9sm109650266b.67.2025.02.06.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:20 -0800 (PST)
Message-ID: <114ff1da-c7f4-4851-af3e-1a4fdabde9f5@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 07/14] netfilter :nf_flow_table_offload: Add
 nf_flow_rule_bridge()
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-8-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-8-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_063923_134342_BEBE3334 
X-CRM114-Status: UNSURE (   8.61  )
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

On 2/4/25 21:49, Eric Woudstra wrote:
> Add nf_flow_rule_bridge().
> 
> It only calls the common rule and adds the redirect.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/netfilter/nf_flow_table.h |  3 +++
>  net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


