Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFBDC02194
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=; b=R4iTk6NRV62I8Qe7NIF3MUS4XE
	+AwfI6QicrIw5Dn2VCOXBxX7cD69vswii25QRl/QGJnW3EltNuJLMhPIspzQzU08KtXW/RDIy2Fck
	rTr5rHSOj1yvlk7knqVAwDXkMMRHINgUXX8KQlXt30xYq2g9nUoEX/emve+AFLXdwaQ+PZKkUzWzg
	/Ok/oFsPj/tYo6BauMv+N1UgFmiZAzBi18mi8ilB491ptiUkZqyO7wfs6+vf5qvifGdFQSU6j/anQ
	blUvy0px1oPhwK86vdhiUD1JzckhKv6VGtH0cf4JuEYBxeYCIKh8OodjWQ0Pq2ktUodOK2w7L5nr3
	CYKfNkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3El-00000006eJl-2dcp;
	Thu, 06 Feb 2025 14:52:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg337-00000006cW2-0Eqo
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:40:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so185668166b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852811; x=1739457611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=Gzym8A2Ibzt+wn3IdQB0NzoYeJAuKNJsEiuO29boJyKlQymFxSqqShjJrfgQa1q+I+
         srvySRbYNosk9TcZJCvjvzmt/F+EQ2i2155UsJoYCFBbwgJIU8An4HWpAEayzdLa9aZh
         p75E4PFnflurKlG+enEVTTLmXNJ1iLbMaENDbr4tDcStYDN/FKyJOA2vucNL0TOTrYsA
         /xa066JYkmLHeQm+IgQBCUC4unR5ZMFjCQVbADksWKD3lBNZXa3BAauplxL0R9iNoJ92
         x20Kv+w+5jTdtfdQZsYWCfmPUwWgET5LjAcuO0bJoYq+CoXNVWUD5aJYY5YRJrEJuRlN
         2gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852811; x=1739457611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=bMU0SIn3yxwnp3MpLe6UxYeeczh9MNEuRhuJShjEAW7ghIlajmCkPt/6x//GPjL42p
         uqNb7AsGSFwtFFs3G1BXuEfA157OKrrSS2ySmIwlrh7OVUazlZPs/JufhzxeVulsC30T
         S/sl2+NyE55tI/YOzZ0W1627mMKv1Fe9rk1EBh7lj8VXrNfTHZjeUDC3l0s6pPPHwG2h
         I3fj9lFmXUT19zx+kM9L+39sSb381YOewa5vuY7Gua4FTnQoW3g2+vOOVFhLY/irPOJV
         S8BRau/CQs/GuDrCjb/lJiQPOFBiHjTAslIV3GKJ8k6hBaNY4m/xb8xOiL8XTrwWNh9U
         vKLw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGF9tk13vFFe2rDnCE+NLrsWtaR5ziH2N9yb/SgT2aMZO43zCBQe40XgmYu4A/9wpn1A2m2/LoxVf0DP7tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPV7/12xCt2DMdLyupoWp3Dk9K5+nK3PpkMIW46IVeT8QLZnzM
	Va4RO8q7Yfm4KOjRhebBTE/MUhuvPtPTpqwruDNSm5Nscwt48c2ez6O6L7jkKxs=
X-Gm-Gg: ASbGncuJVRR63gYYtCJDQAOOXqHGU5RYxX3Xscrc6sj36N7VB7fFXNB1EjH/py8bbt0
	8/Fz/k4Fs/v7ZnEp8kQ5uRlLwi0O1jIq5dxkQ9FPYqm+8epxejiv3XN2Ufwpt3++pZQjeAN9CUV
	jJq9Gg5WYC2E7HeIwsB/I/y8KvbAhRDWH3WYGndU3Gz/iN6n+qGh7Zza8rZr6H7bXh/wtHbWd54
	MdL3FF6dxkz2gSS6AD24jVwuxOT5y/8OEN+pm7lApg4HdnVVAm+XpdoWD16u9bi8mbSxKM1XYTH
	TT1uhEpaltxz1vhqas5Ql03urX6roxzi74dV44WTN2JRrT0=
X-Google-Smtp-Source: AGHT+IHgsuIEgT7GkKcahm86w7XZdDg7vZ/AvkvTuqQKdmdxISVptZgStfdEuYmSzkdA2CsT8SZ/Jw==
X-Received: by 2002:a17:907:7d90:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab75e347a2dmr784608966b.42.1738852811550;
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7826ed43esm24954566b.58.2025.02.06.06.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Message-ID: <6cd38146-aec2-40ac-9372-13064dd99363@blackwall.org>
Date: Thu, 6 Feb 2025 16:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 09/14] netfilter: nft_flow_offload: Add
 NFPROTO_BRIDGE to validate
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
 <20250204194921.46692-10-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-10-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_064013_120989_AB30419E 
X-CRM114-Status: UNSURE (   8.93  )
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
> Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
> the bridge-fastpath.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


