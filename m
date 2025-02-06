Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED049C02196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2025 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=; b=Cfp7o8S64YHnnQOAbLQ+z+UqPt
	NvPYO93q20qZR2NLsww5YM3WS+vYaKiXz0kJe/UMOKjcOx6Rfo8/bD0mhPvXxS52U9/XJkFbODxeG
	UQc+U7Cyti7RcEI/laSgHLQmlLTsJsSbmKMp/GL3XxFo0qYDO0bfAuywjLTIzIuEdDk3s9E7rOq2L
	QrG1QJU4rA80PuhizzpwpAqgDb4uLAIOK+FG4PZsdMbHIM6KaLY8p479x+rdVkvN5c5ep4NFR+mU3
	K18Bj2wX4wxbLxKe01MW0pY760gkRxKfrx8Alk3IFGwWyvmVixPL4AThAqv8wZ7WQt5QGNVTv0HpO
	0Aa2U91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2rW-00000006Zlv-08Sh;
	Thu, 06 Feb 2025 14:28:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2lH-00000006YPm-0Kxl
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Feb 2025 14:21:48 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab6f636d821so175578066b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2025 06:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851705; x=1739456505; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=;
        b=a9JmQQbMvWIGEMIa5lYqYoOZ9AnQgPKFG5W+Du6akSsPErozUe6vkTB0uk03PRMH3s
         mtQo+AO9P4w2anF7ULcNDvb8rgJvAXiKgu1sv6dnXwxlD0moc2QMLGBvzlZUfzXo68i/
         J5PfMhSkE4SQbfOktafdlbaFEx8EjsFH0B3EDw8ytaeD9gIW3G5IHXvBbMbCHpy24Jdd
         JUSJXOVv7q+wsQz5hnKjF98utzX1aOfQQyUW0P4kpliqO1GyviQQOlCQ7H8Ne4WtqdBu
         RzBdmNXViSY+TL0QWmL/frIrR+B7dCSDn9hhbbP0IMitns4mL/s9c61OwxHqgsqJl3mz
         3pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851705; x=1739456505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzREIBb+bKP5i/Ck51DCfeo3RpAWV5APsV60x0FMqs4=;
        b=f2MzauGqomQXQuNsUqwsHhpDcL0fylZG8TDJ7ELIJ4K5GH1D/0UkVmrCxZ4xZ/KtcT
         2u0mU9vLAm7UPgQupKSxos95eti0NskdvFgwgwd1y43gYkTeHcR4uuXMWD3fyJUORzxt
         eD43FsL+Q8fML8KeynY2uB4xPD1pZDMr0f4PQORpm2NIzOY3sQhMQ6iFc3cf+UlkEsEO
         juZTaqggS3D4cSNgQK8ssXuj+k3NjxoMx3vQRWt5dILHbcjZxmRD+NRBdr23ZinKRcHE
         KSgostG/28gwX2FTcZp4DB5Z55GmLXa0B8jdGpF41XHHEN3IM427CFRvXJbEGDqLZ98z
         O6gA==
X-Forwarded-Encrypted: i=1; AJvYcCVCHm7Fn+0DIaHPdi8LdMo5y7egLXtyDARl9kUysC0j6k5YoI2bcUJnZ6FDBytv/hnxAzWJnqWfRro3zv/coQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyprXs0RKBeBsXetZTD1N91GlGcflt3FMtlIiRgqXVV6BqVCrCO
	3ZOaPj4dBLyDwEQ4GQ1s7lveQe1/fb7oC9VzKyZyqymS9jptf/q2Re00NzhuXck=
X-Gm-Gg: ASbGncuEBKiemVPIXXDX896AOXz5QUhLn2/5UVlRlt/P+9I+SOw389CQVpn+WWR+jDg
	lUKZSZyVxLu9AHi1e+gBvuz77lWLMt2VFZtI+D/AmXnZjYwz3uiKGEhmjhmK+8bmVJxedKrY7Dx
	abREUnESLwXViUrg2p0wjolYDHQbBr1bXYMU9yDQuX0wNX+dKKz4KVUbWxVT2U+GBIAp858Ly2g
	mDLtsq613z1mUnQV4FV4cO8fQ+fMhMK+UUHHhZfUHylT0jLonXWjZge21a9DzukeklKQO/Ndw+5
	E5/4/1NkUBu9OLMbUFmKGcWr6GjF+Qbsht8+Ko7sqD087HA=
X-Google-Smtp-Source: AGHT+IHYDakGj/X5YiewxYiKiang3LLrhidWY47Oe3DTivu/rcwezti/yOY3bxt3zD/zpLuTb7KrqA==
X-Received: by 2002:a17:906:6a16:b0:ab6:f59e:8737 with SMTP id a640c23a62f3a-ab75e262320mr699358866b.27.1738851705010;
        Thu, 06 Feb 2025 06:21:45 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70bfsm106144666b.104.2025.02.06.06.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:21:44 -0800 (PST)
Message-ID: <fef59299-aac3-41b1-9783-3a3f35dbb7ac@blackwall.org>
Date: Thu, 6 Feb 2025 16:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 05/14] bridge: Add filling forward path from
 port to port
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
 <20250204194921.46692-6-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-6-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062147_114744_02A65D6D 
X-CRM114-Status: GOOD (  11.18  )
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
> If a port is passed as argument instead of the master, then:
> 
> At br_fill_forward_path(): find the master and use it to fill the
> forward path.
> 
> At br_vlan_fill_forward_path_pvid(): lookup vlan group from port
> instead.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/br_device.c  | 19 ++++++++++++++-----
>  net/bridge/br_private.h |  2 ++
>  net/bridge/br_vlan.c    |  6 +++++-
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


