Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53074C36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=; b=FpktJqVfhQByNDoaix90OlMjCW
	5iY+I4G2Dj34coX9kr0+OkdzYzeC1drBom3yjFDep0sjB/76r9QsHivgsIilfwUl6Yeau1/YIv8p3
	v0+gY2Bvv+cDw6mM3QaxRXdJM0mC2yW4W5MrVV9bs5Y8XQXWLZdYoJ+iUBJBZpNtQhkhzVCAyEQek
	YLsTeQyO7zYSxDFY+hon9PQlMTMmreXJ9J+6csRHkr8zGBNJ2nn6JQLN3wJ80GRTBCyyqksFQJGFG
	eEYTmnadlvQraBkO7scyVwlwAf+y4MJHCEcZlU/GKa9t7EKbfhc7oxMPxqF7+UNhAW8W4d+/eMayL
	BLfeO3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZMf-00000002hyx-0azv;
	Tue, 01 Apr 2025 11:01:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ55-00000002f7H-1DZg
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 10:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743504174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=;
	b=QNNIBO5qDk/jSuIu7mMhoumnGOsL4pigICNlBC3LqPe9EUB8b5ZrO2IG+0t6lXI6RMnL0v
	+CMwtV0ihSocpsci+ufC07wpT4CUj9FvLilmR7Zipz5s9DraCwedD6Dc460tbRfvSGC4M/
	DeHOBxvab9NWv2mvDGEBm/Q2VqODFwM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-lKw2_XkoNWiBDt9BNebKYg-1; Tue, 01 Apr 2025 06:42:51 -0400
X-MC-Unique: lKw2_XkoNWiBDt9BNebKYg-1
X-Mimecast-MFC-AGG-ID: lKw2_XkoNWiBDt9BNebKYg_1743504170
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-399744f742bso1597331f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Apr 2025 03:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504169; x=1744108969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=;
        b=kuactNGhCum5lTrN73t4wSij9BOR3ytBHw9NOnsq94YBt8Wyaqgqcmf8VHMs3J8rlT
         psCMV8AwIIkN3eul0ouTBbOXfGq4b2AgagpGVjYTvFwSeBUgCXDjepiI+YioSlBHgEnR
         tdytPLORjF0VqkLdSkUnQEvGPTTge7TvreRtgALpHh48Y1TENqool+rmT7E0fawztH1w
         vVGcz9twXqY5Qv+iEVVwijGroYzgKQRcUl+fuRtyqF7R0UInPf9N7IRIGhcnQmFVDpj1
         gWbpM3jjcKZLcHvyy9VcSGUhDqdx3TG4gti663aNf5fNZoBS/qjaCryT+UpQgQxoBRVt
         g3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUS7g9JLls2Bg8sHYHJllqrjrBIPUGmSThtovkkhZ5iXaEHWXyPy9H0vKecRIUyfhWr3y3JPPUha7lyWO1WWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8IuINtI3+2LBHmcVM18JuPZGspQhgq6/hQprbm936m8Y2ZcfO
	us7sNVl9QCAd7TcVY+p9fOBzgw3hFJt/ehC8M6GVr8171zS0V06IOZBlinPoBGFtBVm2ny8jkuU
	fbDoorvAKFGtd8b8cWPCkoZBs/UwECDKKFa7eJBQWEWRmZeim83RY7zUfG/yw0lDyFfln0g==
X-Gm-Gg: ASbGncv5UIsvbLapCi2aSw9MEIaovZhRbh2OzFMXaRAZmfLhbF0Ywr5YR2KFTqwFWlb
	4TVVxhZjWSSgjwkYLI9HBCaN9HFQWJ3hE8skArjKSG+jXcxTAgE2K+uwkWTxWjSYsfhepzncu5L
	syY8OYWwS5hPXQopxciQQr/50y4ck2R6yJVFS1PBgXoQtX/yk7sqFJirMBz1XLNgMZchRNjVRws
	inYG4g5wpQ7q9BhO/xMeD02atXVGY6VxMuYA7XC1pfYS+Q43Q3LEUeT6Szxy8hars4om0GJMmuw
	GK7Q0NDnl8ElmMOzXXdqVIco1jIiG3xeN5/428/mruVcww==
X-Received: by 2002:a05:6000:2409:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39c14106c25mr9465874f8f.45.1743504169665;
        Tue, 01 Apr 2025 03:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErjtyNpQgTEEfLNTpXMht6fpOiuyDyvAzgK2cO+MDz04IWniLzgBXbdUzCkiAA6Wpk9SMqnw==
X-Received: by 2002:a05:6000:2409:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39c14106c25mr9465851f8f.45.1743504169250;
        Tue, 01 Apr 2025 03:42:49 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e31csm13961368f8f.68.2025.04.01.03.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:42:48 -0700 (PDT)
Message-ID: <d994809c-7960-4fea-b10a-9c1937f00fa5@redhat.com>
Date: Tue, 1 Apr 2025 12:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix qid report in
 airoha_tc_get_htb_get_leaf_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WP5VJqk41JBNrh_5eRS7Ejf95PGj-q0aWsxcIFAFbQ8_1743504170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_034255_404845_2D1C0A04 
X-CRM114-Status: UNSURE (   6.74  )
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

On 3/31/25 8:52 AM, Lorenzo Bianconi wrote:
> Fix the following kernel warning deleting HTB offloaded leafs and/or root
> HTB qdisc in airoha_eth driver properly reporting qid in
> airoha_tc_get_htb_get_leaf_queue routine.
> 
> $tc qdisc replace dev eth1 root handle 10: htb offload
> $tc class add dev eth1 arent 10: classid 10:4 htb rate 100mbit ceil 100mbit
> $tc qdisc replace dev eth1 parent 10:4 handle 4: ets bands 8 \
>  quanta 1514 3028 4542 6056 7570 9084 10598 12112
> $tc qdisc del dev eth1 root
> 
> [   55.827864] ------------[ cut here ]------------
> [   55.832493] WARNING: CPU: 3 PID: 2678 at 0xffffffc0798695a4
> [   55.956510] CPU: 3 PID: 2678 Comm: tc Tainted: G           O 6.6.71 #0
> [   55.963557] Hardware name: Airoha AN7581 Evaluation Board (DT)
> [   55.969383] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   55.976344] pc : 0xffffffc0798695a4
> [   55.979851] lr : 0xffffffc079869a20
> [   55.983358] sp : ffffffc0850536a0
> [   55.986665] x29: ffffffc0850536a0 x28: 0000000000000024 x27: 0000000000000001
> [   55.993800] x26: 0000000000000000 x25: ffffff8008b19000 x24: ffffff800222e800
> [   56.000935] x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8008b19000
> [   56.008071] x20: ffffff8002225800 x19: ffffff800379d000 x18: 0000000000000000
> [   56.015206] x17: ffffffbf9ea59000 x16: ffffffc080018000 x15: 0000000000000000
> [   56.022342] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000001
> [   56.029478] x11: ffffffc081471008 x10: ffffffc081575a98 x9 : 0000000000000000
> [   56.036614] x8 : ffffffc08167fd40 x7 : ffffffc08069e104 x6 : ffffff8007f86000
> [   56.043748] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
> [   56.050884] x2 : 0000000000000000 x1 : 0000000000000250 x0 : ffffff800222c000
> [   56.058020] Call trace:
> [   56.060459]  0xffffffc0798695a4
> [   56.063618]  0xffffffc079869a20
> [   56.066777]  __qdisc_destroy+0x40/0xa0
> [   56.070528]  qdisc_put+0x54/0x6c
> [   56.073748]  qdisc_graft+0x41c/0x648
> [   56.077324]  tc_get_qdisc+0x168/0x2f8
> [   56.080978]  rtnetlink_rcv_msg+0x230/0x330
> [   56.085076]  netlink_rcv_skb+0x5c/0x128
> [   56.088913]  rtnetlink_rcv+0x14/0x1c
> [   56.092490]  netlink_unicast+0x1e0/0x2c8
> [   56.096413]  netlink_sendmsg+0x198/0x3c8
> [   56.100337]  ____sys_sendmsg+0x1c4/0x274
> [   56.104261]  ___sys_sendmsg+0x7c/0xc0
> [   56.107924]  __sys_sendmsg+0x44/0x98
> [   56.111492]  __arm64_sys_sendmsg+0x20/0x28
> [   56.115580]  invoke_syscall.constprop.0+0x58/0xfc
> [   56.120285]  do_el0_svc+0x3c/0xbc
> [   56.123592]  el0_svc+0x18/0x4c
> [   56.126647]  el0t_64_sync_handler+0x118/0x124
> [   56.131005]  el0t_64_sync+0x150/0x154
> [   56.134660] ---[ end trace 0000000000000000 ]---
> 
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Paolo Abeni <pabeni@redhat.com>


