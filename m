Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A586C02196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=; b=Ua05HUrJT9XWbf8Y9Z2uJVU6g8
	zkEzsu+1otGPpepo94reXaFynpIiUgiC9Ktw4UUDTqsyTQRYZDqfOuxgwPSm6l+2FsLECiLNolKFV
	nefcN5ei4Lr+m3UPyY6g/q2BxZHG7j8ku1TzYn2CJhs6IvGkWyW7E5sEx+kTmopFvfoA9yJlCzrkY
	tbesH0eqArXftONGszjep0qQ93b1UsFEw0HZI0Lewuve0gyCvdU7iULdD3jQe8RRrIVyv85gEioHr
	2sNyhXlbQHK3Yw7V/K23l4At07gzTXqWS+XoMKa6pf+8hqLNFSM4oGh6p69701iWgbzOL5btQxKR5
	gN5Bv6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2uE-00000006aa7-02RJ;
	Thu, 06 Feb 2025 14:31:02 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2lX-00000006YRy-3ukJ
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:22:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5dcef821092so1117058a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851722; x=1739456522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=dQHCfSeXd3Cq7MyEmSl+4BXco82f1utsexiOCeDqwrygGc5qLYFZTuy83xKjGtIcUG
         L6YUlW4K1mz7H2gi1sMOmCHCnHdGAwgafUev/O8nqSsGLEfR75Me1GHW004O6l1LITVx
         DC3tVWEmXDcjow5IX87U+UjBGidsPan2EYrtzIiRggyg7cOLsPzjCYrtGs9Wm2LcOq0u
         yEqKhb8y137ml//cxJcuNxB4xMUikMmho8IRYuAQMqD+UQ8y8F+mreqsiAL3cdWcgMpa
         m05PaMJymiejk+ukGL24MV0hpCnNKKKAI+gj9ja9SPDMrBUSpqjpRpf6bis8RkDAIdQI
         p17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851722; x=1739456522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=Ii2j44IzRBwxI9N1JOefqx/p7DYilgf15M4lL5L5mEZayg+fZWY8xWwr6CNvJVnIyd
         7wg/g5JjWr9R4hARSPZixpBzGxXK69X5Y5q7aa+lhQg2bXW/M4LBVWnltZYtGRV+7K6M
         BVp8cn7Ktuz9TolPihyEaaLAqiJmyhiL1oPhQFVncV00u186Cyu/sgTAsHXTX5oC8G5I
         CY8gko+gpslmKXf34pds7gfS01384neU0KUkCsEGksm24AwIe0rQd5tn7kakY0MgkQ8G
         b2Pq8LNJKHgwH6aPsHBU+Hw3KbU6bQi/d27b+FD1oYLPmrYynZqp97zlN6DuE/MGlJr1
         5Kog==
X-Forwarded-Encrypted: i=1; AJvYcCVQZWyTPnpacE9QeEA6LXpEyyTjReaSeh1PU/8jM76LZCVm/8GHmPpJVMcBAdiDxdhsq5Pg8WhFIyWm1WBcnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/asK+kbvWjYdM77x4DYyolDAVmA5u1ZqtSQey7LOvjThKfgJr
	PXomIFqh0xxQJcEpg7unuxViboaEVdDfWp70rHD+o5Me6HazU+lKQ+PmPuPnO4M=
X-Gm-Gg: ASbGnctM9fywmW4NlEF8QbwB1go9tIsWEYKWLj9e9LB1m8IiU4dIDoIUZLdHopa92lN
	CrBReSc4/+3VWcpSY/96bzwIX0K2cnWSyFjrRmeHSMOwa6+JWrrZO3zUG/AJ1m4M7xuXgQVSem2
	N9FhL+kXzPsOi9vyfYXrVI1WrnEGkydwBYkgQ88irv1ZDokIM2j+VW4XUaSp38sCpFTY2EuGsgU
	Nn6Lgag7v3G/JflpOVKZBAtzJg3KfTzAAZUpqNok/bhHSA/42UihAuTMLiDPtuGv135BsGsucSz
	P4W3SHB4s3a8XM71Gsb2fwoD5ITkwRb4DArD+TbXoT7jjrw=
X-Google-Smtp-Source: AGHT+IEe7WdSsNkjgnty/HyvHskjlhljY6wt44W4IMiUaDBB3MI2H2nfwFKZUIVfpj7A/eSHa7SXrA==
X-Received: by 2002:a05:6402:4486:b0:5db:f423:19b9 with SMTP id 4fb4d7f45d1cf-5dcdb72958cmr8121194a12.16.1738851721184;
        Thu, 06 Feb 2025 06:22:01 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b85a3fsm941354a12.46.2025.02.06.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:22:00 -0800 (PST)
Message-ID: <cd2926cf-b32b-4de7-851e-97a3ce2118af@blackwall.org>
Date: Thu, 6 Feb 2025 16:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
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
 <20250204194921.46692-13-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-13-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062203_986430_AB58046E 
X-CRM114-Status: GOOD (  16.90  )
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
> In network setup as below:
> 
>              fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    |               +---------------+
> |    |               |  DSA-SWITCH   |
> |    |    vlan 1     |               |
> |    |      to       |               |
> |    |   untagged    1     vlan 1    |
> |    +---------------+---------------+
> .         /                   \
>  ----->wlan1                 lan0
>        .                       .
>        .                       ^
>        ^                     vlan 1 tagged packets
>      untagged packets
> 
> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> filling in from brlan.1 towards wlan1. But it should be set to
> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> is not correct. The dsa switchdev adds it as a foreign port.
> 
> The same problem for all foreignly added dsa vlans on the bridge.
> 
> First add the vlan, trying only native devices.
> If this fails, we know this may be a vlan from a foreign device.
> 
> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
> is set only when there if no foreign device involved.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/switchdev.h   |  1 +
>  net/bridge/br_private.h   | 10 ++++++++++
>  net/bridge/br_switchdev.c | 15 +++++++++++++++
>  net/bridge/br_vlan.c      |  7 ++++++-
>  net/switchdev/switchdev.c |  2 +-
>  5 files changed, 33 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


