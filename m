Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC05C19F32
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=; b=0Rkq1QnM0YvQtBMmIfIh//wlUf
	IIXh2Dn9iEYdEewma3uEeeKxvnSmp+YKyLaZPe5W5CPYLSzJ7Rc81G3yXk5znKqHY8ZjNESU2pLi/
	xCbA4D5Y+7oht690dLdxqxCBPIW8EfDNleLnQinXGJcJlfjxpV/NSkWFLYqOshSRFjyD5KzNOiaA3
	X1drO1zn/HuFfsICPftKWjFncdXyZBxegWUKKZo1m3mvyZUDArHD5f/Gsz06U6UXTfyd4Jy6ndC5d
	oKY2PWLyZMozIZXZZnQ0y0r2swPUkuKRnJ3mf+g5Eb/koISm9DWSR4bYNr0RUQDhZAWnjj83ZKYPo
	rMZp9KUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkDT-00000007O5m-2Rzs;
	Wed, 05 Mar 2025 08:34:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk8t-00000007NPV-3fMy
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 08:30:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30b83290b7bso75731801fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Mar 2025 00:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741163414; x=1741768214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=;
        b=kKTS4QwaEapkyxfdXEwSKoie65z/sFM+48i7Njc1SHxRrAiEsswbT/M4GI/xTzCfEv
         2OnEkgpiOf3eVq96Wsj8SchTFTN8nNyZxDL3tT7kDAMjVNQC2IKroLcKlEWZJ3a44eEH
         mFMsDJcHxVwC8ADzKUkrdtqeSU12kYYxkqU/FQ7kDaZSjgkCn3cS3TeJLOJRIldPhs6b
         NzN0UkRXHZ1FsMEFR4IB/ZVLjnfwUP4AgJEPR3XNlbdfqb5sUtClR1isc5tYsOy11OA+
         26xETT48NOOVzQ7UXviE8hO+1M2Gg6zSlr2zWlL1FbKPO0oX7KBtfyM0HHJs2dmMULUc
         cj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163414; x=1741768214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=;
        b=nRdexLWfdsz2CCrTMe2oSqJubVPBpz5ra4mxqvuQPkOzf46I/Q0ivgxnEssvnbsVFw
         lVAl6UVz6CK6JjdYlN0bCpkZkJwwfSBj/NSSTrjoksgHTkqKsIwbrQkWk7tN5koCFNgZ
         M1/75uDSVtGZIvzBjXiCceRL/PfGicNQjU/2yn/pBJ57ZHj6QZ7b5cdW2e/iin/up5fm
         QeZiiej+ELsN5sY+8hw9c3Mc/ieK0MYXoFdePFLIDx2ZGAZkMOhoRMSUHoJB1SDOY4Cr
         ct4rb0IwB9V0Se/hi1Mxy69itxgW+tlrZfWvoheOUM9deQaYQ5h0tC0RCMaLugHLTdlu
         /Jzg==
X-Forwarded-Encrypted: i=1; AJvYcCVhiSjdQ5qQhzTOlc2froWPRECVFYQDx8Jd4YuXt1w5CiarRwQNEH4W4KW7ogdN7HE206yMFkQz8vRiIbhvAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeEP8mdhuh0JurhNPyc9TMBD2GkroYwmykhBPCNLg4kg8uSfdI
	9y8aTfKoTeKOgfd0jmXBfw5xLjW2UthDvNbfBuVM9VjSXRD7RnFtW8ik40x3LdA8MdQigxxdWk9
	f1UU=
X-Gm-Gg: ASbGncuH8/JtPoEmvK+jbcv4Qpj8NZTadGB7hVcupWHDFFC5fKTbTsvIH+aFNjgKqN6
	BzSjBdeWCnexZ/rrwVPWWn2aiIw7BlD50PAfIBD1xS1dp1mjC2cuz8MjCpt8hVlkkp0155VbLKR
	SSUocSHHDjvUweP/Pv2S4rn1o1pd8/GILUg2jj3prhrLywnOZ8nx0Wv1tLXJmJbbOwAy4VOIELE
	hWZ6BpZDEq657XxWwA8biVcm0f4Akq3OqePtZ4Un0e08bhaQk3QSsX/yHwOgIg5sz6nm2GvgmCX
	k0DgNtUjNfzDs5DVOnyeAFKEe3Rn3CyEgIH0Y0tSHd3OMqge+/wkfyPcbjWsyyMsTFaAngsk2wF
	M
X-Google-Smtp-Source: AGHT+IHSB1wDKnA9pHV1GSviWm2eGdZkD28ziFa7v6M0Rd/G5QVSKS+XqVwTfVjxopyszVvymfpwQA==
X-Received: by 2002:a05:6402:40cf:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5e59f470c8dmr2220203a12.22.1741162957444;
        Wed, 05 Mar 2025 00:22:37 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6dbbbsm9395036a12.22.2025.03.05.00.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:22:36 -0800 (PST)
Message-ID: <350a057e-39ae-4e8d-a4ec-12b2f78f51cb@blackwall.org>
Date: Wed, 5 Mar 2025 10:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 11/15] netfilter: nft_flow_offload: Add
 DEV_PATH_MTK_WDMA to nft_dev_path_info()
To: Eric Woudstra <ericwouds@gmail.com>,
 Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250228201533.23836-1-ericwouds@gmail.com>
 <20250228201533.23836-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_003015_908265_F571B16B 
X-CRM114-Status: GOOD (  17.81  )
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

On 2/28/25 22:15, Eric Woudstra wrote:
> In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
> forward path is filled, ending with mediatek wlan1.
> 
> Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
> with info.indev = NULL. Then nft_dev_forward_path() returns without
> setting the direct transmit parameters.
> 
> This results in a neighbor transmit, and direct transmit not possible.
> But we want to use it for flow between bridged interfaces.
> 
> So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
> direct transmission possible.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
> index 323c531c7046..b9e6d9e6df66 100644
> --- a/net/netfilter/nft_flow_offload.c
> +++ b/net/netfilter/nft_flow_offload.c
> @@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
>  		switch (path->type) {
>  		case DEV_PATH_ETHERNET:
>  		case DEV_PATH_DSA:
> +		case DEV_PATH_MTK_WDMA:
>  		case DEV_PATH_VLAN:
>  		case DEV_PATH_PPPOE:
>  			info->indev = path->dev;
> @@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
>  				i = stack->num_paths;
>  				break;
>  			}
> +			if (path->type == DEV_PATH_MTK_WDMA) {
> +				i = stack->num_paths;
> +				break;
> +			}
>  
>  			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
>  			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


