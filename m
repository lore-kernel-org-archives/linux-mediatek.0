Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47099C636D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfHweyQypgT88dcV2bDP1Gsm9WfNuarzKmo0tThjIPw=; b=YgFJRsbjMVQm/9
	SIkSmLF/YQ2JRo94rvcQuksjHC/6A675I9YaHDNsxfvkisH+LxUkDhBicfVdg1fSkTWx5w4LhIKYC
	oIJtUJ8gmF2LsQPyhdNUwclh6YSC0ASfv9KOkKgwr5driuG9dDi6ug/+RCUyxQ5WykHnKFKP1Si8T
	gM8h8XvJbjs/9l4Z/zaQd6NYAJPeD8X1UcPJ3N3jrdLennXjsKnoU53R+P2zc4kadb3jzbUTqdP5D
	eadayf80VPUJEt+fZzWSYrL6xo2W5FhgLiMcpHvVfI9bAlsFN83yXvsCVKuJbD4cx6Gp0JRqK1Pr2
	M+qxAjHlVrisO+8j3azQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP5sN-009aDc-0X; Mon, 06 Feb 2023 18:05:59 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP5sB-009aB0-Nm; Mon, 06 Feb 2023 18:05:49 +0000
Received: by mail-qt1-x832.google.com with SMTP id w3so13814789qts.7;
        Mon, 06 Feb 2023 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfHweyQypgT88dcV2bDP1Gsm9WfNuarzKmo0tThjIPw=;
        b=QmIBFvFjPEuuMs7kluLSdEAuJuxt12IW0UIZv2K+BY3Pg7LXI/PdEoitple6kt5q62
         4KNqoC213XLKUmx0UUVFPyOLe5ps/YZqZFOwIlFlq7YlkL+n3yjOD55leHNoDT3ZYxLe
         EhNqeW+hmlbpQLinwTz5ROJY1Z/74Zz6Ba9AdRzaDttETXiYMd/Z38oWojtZb+zRR8Z7
         6B9CC31DAJWyEbryzsA9IkpHB38yEjAzVu2DrBUSEfUo7YJiKNvlBCD3Hg5MUTbWQrll
         JRQnOLi3X9rzVVf4LNP6ROF672RCrLpYO5KSd2nY9xUZxzKGgLDE10VFr2Mwfhy4vFSJ
         SWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfHweyQypgT88dcV2bDP1Gsm9WfNuarzKmo0tThjIPw=;
        b=sEpVFFqOfG7/nUVPZAyoyMwx7G2JTjnWSz4ewKaOAdWofhjFzmA9i+kBspe3skrDI3
         a66y3JOiVQwrtEQTFheZevaicD6nP8/AJSbyNbdE0jVH0uu3NMcVDvHz9D0RvI5uoPPG
         tU8nYImu7Gjp3CofnASGk665idMT9NelDpGrwJ9yczk4lfHtO0+6T/O1cOAZrlNE8Wgk
         gWNPeNSTqMPRyNhp0IqqnlSJovt/B24GHpsF4CMO4oG90qD6ui49ha5ox7yhAwtCovns
         yRY6vzPw8iizOoLXz/TCPgyJxlqJ+V/HlzAcEkSig/U1n4CWITGCMCUkSKzTP43ux8L3
         WIcA==
X-Gm-Message-State: AO0yUKUhm0Mq2ml+DCMeHDhELErZLUxGFJcA8vX0q51pA2qb7A3uR7f4
	0SiId5h41Yxh5lC0dRiAGOE=
X-Google-Smtp-Source: AK7set+JDjyRia7uB1q+yROPDUU/xoNvixXPaC99c+QpibrRazWR6cN0o1/qd+rpqn+zhZ5BBM3Lcg==
X-Received: by 2002:a05:622a:1052:b0:3b6:313a:e27a with SMTP id f18-20020a05622a105200b003b6313ae27amr303395qte.40.1675706744651;
        Mon, 06 Feb 2023 10:05:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t66-20020a374645000000b0072862fcbbdcsm803599qka.42.2023.02.06.10.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 10:05:43 -0800 (PST)
Message-ID: <9cf4eb5f-64d8-5e7f-6fa1-39ed08d66e77@gmail.com>
Date: Mon, 6 Feb 2023 10:05:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_100547_805255_E753106F 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/5/23 06:07, Vladimir Oltean wrote:
> Frank reports that in a mt7530 setup where some ports are standalone and
> some are in a VLAN-aware bridge, 8021q uppers of the standalone ports
> lose their VLAN tag on xmit, as seen by the link partner.
> 
> This seems to occur because once the other ports join the VLAN-aware
> bridge, mt7530_port_vlan_filtering() also calls
> mt7530_port_set_vlan_aware(ds, cpu_dp->index), and this affects the way
> that the switch processes the traffic of the standalone port.
> 
> Relevant is the PVC_EG_TAG bit. The MT7530 documentation says about it:
> 
> EG_TAG: Incoming Port Egress Tag VLAN Attribution
> 0: disabled (system default)
> 1: consistent (keep the original ingress tag attribute)
> 
> My interpretation is that this setting applies on the ingress port, and
> "disabled" is basically the normal behavior, where the egress tag format
> of the packet (tagged or untagged) is decided by the VLAN table
> (MT7530_VLAN_EGRESS_UNTAG or MT7530_VLAN_EGRESS_TAG).
> 
> But there is also an option of overriding the system default behavior,
> and for the egress tagging format of packets to be decided not by the
> VLAN table, but simply by copying the ingress tag format (if ingress was
> tagged, egress is tagged; if ingress was untagged, egress is untagged;
> aka "consistent). This is useful in 2 scenarios:
> 
> - VLAN-unaware bridge ports will always encounter a miss in the VLAN
>    table. They should forward a packet as-is, though. So we use
>    "consistent" there. See commit e045124e9399 ("net: dsa: mt7530: fix
>    tagged frames pass-through in VLAN-unaware mode").
> 
> - Traffic injected from the CPU port. The operating system is in god
>    mode; if it wants a packet to exit as VLAN-tagged, it sends it as
>    VLAN-tagged. Otherwise it sends it as VLAN-untagged*.
> 
> *This is true only if we don't consider the bridge TX forwarding offload
> feature, which mt7530 doesn't support.
> 
> So for now, make the CPU port always stay in "consistent" mode to allow
> software VLANs to be forwarded to their egress ports with the VLAN tag
> intact, and not stripped.
> 
> Link: https://lore.kernel.org/netdev/trinity-e6294d28-636c-4c40-bb8b-b523521b00be-1674233135062@3c-app-gmx-bs36/
> Fixes: e045124e9399 ("net: dsa: mt7530: fix tagged frames pass-through in VLAN-unaware mode")
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


