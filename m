Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD152CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=; b=LPG/zhOTiwK9oZee51GAbNTKni
	JNwF12BNN6k48zJ02jMjLhwEl0PkCpNgTGjeXjVRmvMn9gQiT0mOglmW4EvqJ1Am2pDE+ShRTp0KA
	fRaiWjD+MYABsyZnKBkeqv0RFKJAe0yrRdH6zS58yWj7g28ZB02k6Yo61Dly3+4sACF3AaYrfW0OE
	IEre0MVmIs+DP8qGkNpuHx5TTQTzptuAXMAaiYPKqcVL4y6MhqT+VUBLHcadP5cFWgesbZNTe6RiW
	TQvOlAgnujqi8WxFj7AZXb/AO6XffdaVCkOqMEGpe7TJ0z0vlL1oywickg9GJ4IfUylM7ldI+akp/
	DgE9AZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTpI-00000002vkl-4ADw;
	Tue, 29 Sep 2026 09:08:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTpH-00000002vjc-0Vjv
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 09:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
	b=Laz9U01a9dvZ71QmzsnFfD4BjNqv21bngLSf7dfMmRLb+sdamLaqXa2dO96I5vEFMH3dzN
	SQK1mFwfgEfgue6KoIejh97Ww6S2/zy80f9eNjwllWPmvN2QqkfOweJbkvFlSoHjUeaIvG
	f2+bKwWQEghTyWHwDW2VnqZ0FzJW3VU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-ZdKzNCwxM-Gw1MXGqtMGDA-1; Tue, 29 Sep 2026 05:08:37 -0400
X-MC-Unique: ZdKzNCwxM-Gw1MXGqtMGDA-1
X-Mimecast-MFC-AGG-ID: ZdKzNCwxM-Gw1MXGqtMGDA_1790672916
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso35177095e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 02:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672916; x=1791277716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/tDQmq8LLYXlBRzwGWyXEcI6FT4qeqUihRf6IwcU/I=;
        b=D7x6A4hWGHz22mCNQ0FQBKVr/BfstkzafTXC3CjhNl9jVpD8l+BqUBoqQ+gyh5tyTu
         dgPyN1r52TEjim4hkoRn8lZg9U9PBM3B/NzQdOL2KCNrzZhvdbJtPxz5rzxB8tED04ie
         adhlAyUC6V/PirBJelM6xrCpInrIcHAGcprfLqbiyuteWQj62kgg1MRTZHeuIijTO1zx
         /XJJpWywcO++xdhkxVLYeQO270cgxsnZPrvQDtX57c4Y/3eITW20Ljv2/KExMMFNUHET
         NBe3KYBPVq45pbL7F9wnyRfSbelh8xpbfOwwDZKq+4OGJLQ0nwIEwmjDobIDFN2TINBa
         nBKg==
X-Forwarded-Encrypted: i=1; AKwUvBy4ghlktgdjyqrHKzu+z2A2dhhatjanRLPfD3A2LP+bDUJgvgfYgPhQ9iRgOur+wViv+e+6s/qsl7vMgz1i2Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nekE8XtsTJIoijLJKJIz4q5LBkkBr+QgvHTG3GouV9bWTZDnJH
	BK5EIOatmqAbzg94piiXRCwCLzT4PmevfICMbUVXoPyqA+gMruMwZDBjxhDpPQ8tC3C5wSJss1w
	y2jy4IgLVp4Gcfp6pstuErAlDLzg87e3zsl7MohLbobUZJ31hZ/8QZiFsApr9ed95IsN3/vcwQA
	==
X-Gm-Gg: AYBFou3673uo0HeRmQEVSF7e3aOhfgd4vyWTb0bxEj3bBXk2nEPgNp69XZ4YVQukcf8
	NHLdGgM8cPwbv40T8g/sgMh5OH3MO2LWkgQh8CnPT2kjc3zYIlGRB/4ACGPe6qLcglBPGeDzEv+
	cued4Xa92M8+IyFX9E3mZ7OImiDErjGMeVCzYl/M9Ss8Q+hx4ytlgvnjdQ0I+g4MvNvnKro4dY9
	1HW36MvwyptzFGPbzNE6J2D1DUl838e07TxBZz1EwW24qW+BXk5lvcBddika65174pPO7AYNseW
	DT+qupZzx3UQspqE8ZAZN8FCSTXa1pFz3b0H37tV66bVW5d6EJ23Gjrl2veFSyeh9FP6nFmStPD
	l94gqrsRN1h55+/yhFgddVlOfZGqZP7hJ5pFRx9d/PBzn+m/qRWFi+0RMXKWebVUUpji0Pcl0gA
	==
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475505e9.27.1790672915010;
        Tue, 29 Sep 2026 02:08:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:49f:fd2d:23d1 with SMTP id 5b1f17b1804b1-49ffd2d2627mr138475085e9.27.1790672914566;
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5080925sm2483598f8f.25.2026.09.29.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:08:34 -0700 (PDT)
Message-ID: <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
Date: Tue, 29 Sep 2026 11:08:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding
 and egress tagging
To: Tao Gong <gongtao0607@gmail.com>, netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260923055103.949540-1-gongtao0607@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: als2G4MfeM84YQYcXuWn9UPl9fhAkLNcZF59qAJz9-g_1790672916
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020839_234753_1F50348F 
X-CRM114-Status: GOOD (  11.84  )
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

On 9/23/26 07:51, Tao Gong wrote:
> This series resolves two issues in the MT7530 DSA switch driver preventing
> trapped link-local control frames (such as STP BPDUs) from reaching the CPU
> host when bridge VLAN filtering is enabled:
> 
> 1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trapped
>     link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN tags,
>     but in hardware this disables the per-packet override and causes
>     trapped frames to follow the CPU port's active VLAN table (VAWD2) rule.
>     When bridge VLAN filtering is active, the CPU port is in stack mode,
>     causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed with
>     a VLAN tag, which userspace STP daemons (such as ustpd) and the kernel
>     bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire state
>     (untagged frames stay untagged, tagged frames stay tagged).
> 
> 2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
>     CPU_PMAP alone is insufficient; the switch MAC forwarding control
>     (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured for
>     trapped frames to exit to the CPU conduit.
It's unclear to me if you are observing the issue with real H/W or if the
patches comes from LLMs or static analysis. Please clarify such info
in the next iteration.

Also clashiko feedback looks relevant, please have a look. You should
address LLM's feedback proactively.

/P


