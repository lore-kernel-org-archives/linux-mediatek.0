Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8DAC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We10J4fWEL3o9gPo1GTbj94c6JiGIW8ao4zynuCzkwM=; b=35RDCMIViKDQsa8FyVzdpIzPAQ
	hIRGxZ93xUwb0r7N7yh2FbJWfgzttzMJMjlNGykdoHLF4F8E+0jggaSuaMral2+cb9sfWfSwwl6Rg
	vLWBe/hS/dSCJmiH/RQcIijPuc5H4zmeSVpxxlfGpTtsqVQawwmOm7sj1D3qWdTsQGtrwD99Di0Fu
	jpKUHNwMwtRUHgyHC8UUmnQpTNMKjU6nLwTebt0YU7sjaONyVGNtTdaq1ZsHsOcjTbAN9kUeOS4oO
	mZ61Y++d/WtrrEuUnBocBUU79DJfoZLzlVZnqesB74D4/RJuJfwXDBy8RO7KAekAsc0DWACKj7QrT
	a6bNb05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F7h-00BcVA-UQ; Tue, 14 Jun 2022 22:34:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F7d-00BcQr-Qu; Tue, 14 Jun 2022 22:34:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g8so3708937plt.8;
        Tue, 14 Jun 2022 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AHmm98PAzPcJptU2nMgRv/dq7HuAyrlYg6vwIKYPXjA=;
        b=EVNEZd6o3bpvxYSFtFISdR9FG0168s4U0mz6ypOOJp99KiPoh9Ik/oZ+zIH3YUQnQ2
         HrLxu1Giim5FZGhqPLXL1rHISZdFRouO9OtygCS6VSiunI9tDUdPmn0m24L9MmwXzu/j
         KKNxIRlyokhcdqHq/190VDPEBsYt9a9HA8rLwuOC3I/KPwrPeCzRGuV4OCfN3xsv2HTk
         3usgarfpE6/+sGxJyaVyfingn3erRrmcX78ZcUX56lKkhOVREgGEatdxuQzuaaWVhmr+
         GvbPnDykhxVOgptRVZZnEjSXobDOW6H8uZ+Dc+sRRS/+eK4TEVX6cK2Jt0EiNNTGzQhW
         /t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AHmm98PAzPcJptU2nMgRv/dq7HuAyrlYg6vwIKYPXjA=;
        b=AdHq8bP7Wgt30H2ZNJTKPvvPNZ8JmKFGQXduT3Bq8z+EnhzQTvy4wgm3pJxe6vTdZI
         v7fNAIClYDd8Nz6Q8seCtd/4VuwA7h0+oPRcw4zWWfK30DyM9oCaYWW2OU5JIBqgBYUs
         KUYSe5uFDOv40/UoIOgSzQcNLNVgKh02sRpcAbiio3gyhSQ/HYJzZ8eMTk6coLD6fcbi
         etaA4i/YB5WsV2kIouqhTLU0mbgyp2LkDYc9tDbMSvyAUeHBJj1VDJDkpEq8EXGYacBE
         eLQbDBLfnr8lnNpJ4OAVocvrDhYWfIygtiKGeV8mYHSYW3yXWhtbaRNodXFBfTOG0MgG
         ngrw==
X-Gm-Message-State: AJIora9yG7zLxFEJ8keuk1AybHLsVMZf0C8Wjmr0dBsVwyVE/5wd/eq8
	XQfMNaTh+CCL28yPVL4b59Y=
X-Google-Smtp-Source: AGRyM1vSg0Mq52lrM13IeIik3eO1LGcurCS+YdMXofPrDxWGFdT/IKpkZVfHH2wr8mkFmN+be5zWIw==
X-Received: by 2002:a17:90b:3b45:b0:1e8:8688:219d with SMTP id ot5-20020a17090b3b4500b001e88688219dmr6695879pjb.231.1655246090167;
        Tue, 14 Jun 2022 15:34:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q21-20020a170902edd500b0016797c33b6csm7736666plk.116.2022.06.14.15.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 15:34:49 -0700 (PDT)
Message-ID: <749728f6-fe32-bf3f-e71b-020e58a4cde1@gmail.com>
Date: Tue, 14 Jun 2022 15:34:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/6] net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-3-linux@fw-web.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220610170541.8643-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153453_956636_FDFB64AA 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/10/22 10:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Rework vlan_add/vlan_del functions in preparation for dynamic cpu port.
> 
> Currently BIT(MT7530_CPU_PORT) is added to new_members, even though
> mt7530_port_vlan_add() will be called on the CPU port too.
> 
> Let DSA core decide when to call port_vlan_add for the CPU port, rather
> than doing it implicitly.
> 
> We can do autonomous forwarding in a certain VLAN, but not add br0 to that
> VLAN and avoid flooding the CPU with those packets, if software knows it
> doesn't need to process them.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
