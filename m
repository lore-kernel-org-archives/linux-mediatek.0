Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62471C28B28
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Mar 2025 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=; b=LRZFuIB/dRJB3TGYO7b21QCmr/
	b8USykomi6fvIpmpqFrOROds8HTA92ebmV80oGzDCWZdUGjZXHFpcYXm4vapNvPnS8xX5oOkBC22x
	qUH0md0vRNxWmGkmCVAQMQO/Rpljckl06wLQUnqJ1avvU2Ck/mez+TBnxw1ELL5QANKu+oUJZI+AP
	jg/1VmIva1vxYXNk/+8SZulM3IB39ACTAVGd7eHs/5AmwpXMgEqJc99B1PbR3k7p7O8VvqriAzfxF
	KfOB6U4g6pUAzfRO7iBITR5y97peBHe0DL3xy5n5s94KdpZ47KujACoSTNdh8jTvu5OwLcj8s1snG
	78KZAuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTwv-00000005SL1-1v6V;
	Tue, 18 Mar 2025 10:13:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTwt-00000005SK5-3Phn
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Mar 2025 10:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742292807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
	b=AQpgYCmfpA2TBL9C2S2jkX34ddR0CnZKOoYKQbKX/3evvYkWW+bPjcFOit+tFC/2noS2Sc
	pyp1YrNhQ7zrpCScspKNxPf0WUP2hGBvrIKKkpyQYCY+Iy25TtxlD4uXMvxSsRhl3DfwEw
	zoXJeNtVbPahL/3ghvYnAf2svs3QQh8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-PWNE4E2sMcqHZtCmjFVefQ-1; Tue, 18 Mar 2025 06:13:25 -0400
X-MC-Unique: PWNE4E2sMcqHZtCmjFVefQ-1
X-Mimecast-MFC-AGG-ID: PWNE4E2sMcqHZtCmjFVefQ_1742292804
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso18759835e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Mar 2025 03:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292804; x=1742897604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
        b=ttA2Xae9UXl/kUeFiTe0LsmV5pAHEbMPzWdkG/B+vlqYL/WK3BRPaMpNVU3PYMA9vH
         zyTxgKh5vpWpxkMOu2hAVF5/lHJ9gqNkAu7XrdEwR6w8FEMVkcVGGSf7GoYu/SJTBrSA
         OBanQTRv4o6t1Z1F/UNKnoS4V3supTM8tI3t8QH1BW8GtQE4rxkJL8hyXiYzWmVxrmh9
         nffRwKVTSTje4zk6O/jc7WK13eR/YF07M69ISWOvOUbiJinIuTjMcDmP69cqhtQA46IT
         2LW5FnsmpvoJ3KQHQ1gLomH26j/eTTdC+C5i/1NhuUOZJ/tFH1hqwclm9kHKhO8TbEW0
         iumA==
X-Forwarded-Encrypted: i=1; AJvYcCXz4rKIpallm6PA2fAemFozpcSvfps2fv9VZeEkUFZxORI6IKh5StlPQvS4myuGDcuiHil48QRb7X5CpW/CoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP/GgnGY84bmKy7iN83TBv/M1uT3MHBd89LG0rw7zbn+AfI2RW
	PyGOG3q8IcACHG0opA2tzokh0gyPC8Dao2BcbqTUrZwNdCVicE0Zj0hRUosEJbxr0gInUCXMDhH
	kNyfVWt1AEOfkoi6C7rwQhHjcyscsd6afM6iQvp2S7widULXaP5cHVrIw/OWgxOjMUbFt2A==
X-Gm-Gg: ASbGncv8/fGVXnErIXqvwe3dqiwQWTrWd3FnM6X19bkmykuzilsVAfd2eDb1eA7ddPG
	JAnhH/PQS9T8W67FNOct6JyWHkX8q85d7qy+/M8NKrQsrLml7XGxkxD4SlnGenL+Ceg49Z5gdM5
	HXNdl5nuaBK+DWJa8F6I9L0Jj8FWXVW+CQUh+fAGzqN1K5QwECFZvhKKQsVlma7Na0qh0KPQCFu
	VQb+1tPZA9NfSds+UnH0fZMKdDui8cn8JWgIXR+16qlzPT4TmYrmxw+qBdWuJOiJCNrqyeYcRri
	q8pC0Os53sbUWLk1fXmhQVkloG9XV/LapghdxADOl+zw7w==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14645125e9.19.1742292804466;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa2x79C78ENEoyzPPniqeGCkHBce2M9I0jdc1yv0/RSaEENBZYufXun9PO4beIARs4YqnHHQ==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14644695e9.19.1742292804010;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609dasm129105475e9.28.2025.03.18.03.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:13:23 -0700 (PDT)
Message-ID: <6259af5f-f518-4f88-ada9-31c3425ce6ed@redhat.com>
Date: Tue, 18 Mar 2025 11:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZP2IQzFCZsPmh9Yp1h1IxZKXnRs8nrW-aZgO-8AUk80_1742292804
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_031327_929086_E5E0489C 
X-CRM114-Status: UNSURE (   7.56  )
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

On 3/11/25 1:18 PM, Lorenzo Bianconi wrote:
> Introduce missing metadata support for some xdp drivers setting metadata
> size building the skb from xdp_buff.
> Please note most of the drivers are just compile tested.

I'm sorry, but you should at very least report explicitly on per patch
basis which ones have been compile tested.

Even better, please additionally document in each patch why/how the
current headroom is large enough.

Thanks,

Paolo


