Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D780606A327
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I42Lc2nq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+sQzHvq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=; b=I42Lc2nqzUBQWp
	8tEVLyUU3+Svg4xUIPX7W2Oe4ASzvLU4nRh3FKEsqA3Jn/GRit5xY/wu/PTJgWWsocHbYgshh+qum
	Q10Jz71QA0Mfs6fza0lY4PHY+vsfRiM9lQNSxNnXz0ZkG9soORb/9iUthzkAmxcxGFD/3mfXumf3Q
	k4FxKyT/sLC3trag2ZQ8hqM51XVTd6SrhRfwGA1lmpieT06KdZfCP0J1MyYrFaEaGQGCXW2dMFf1s
	jVv+9izPbp/ET8Awh3prX9c9A3yR5OVBaKsSVXuY6/8fOS5kgoG7l0waL/3jo8mEw1+1EWrce9dzS
	/Gja857sfYTIO5S8pHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNixC-0000000FSmx-39rj;
	Mon, 02 Nov 2026 03:43:26 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNixA-0000000FSmI-213E
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 03:43:25 +0000
Received: by mail-oo2-x06.google.com with SMTP id 006d021491bc7-6de056f06beso1161301eaf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 19:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591003; x=1794195803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=Y+sQzHvqvW/Uk54R/xLxFfyYlqmCC9cTY+YI/dAOREEavhhBoBazY7Y+eFnkMWMLsQ
         FCCvUJDqsKrCdnjKBD/LElPXdCKZgQjbF1T8EplGaiyO4/eBEozr289k1g5tZmAX4fvh
         PMzSlFMcnNDomUOqiFfUuo8URBmBFIvJ8kdC9kOKlskNFTOGYQOOAKrWpGDt6eIPKgxz
         VVM+XQHAyVOGhtZBnq61wb3/rUl20b7FuVnCvLdJtxSZJgxLSEBrercxjaPbANm/sCEy
         tcNwqzKNeUYKuC17qBLEMoN8FlzHWGy7yHDN8CWa0Ipv2qH55WbZ5wZgrSQhuK1E7KO1
         SYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591003; x=1794195803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y22dJky2pUpCcr74PVyRbYeXh/3j4uzhyru4cz+gIJM=;
        b=JKECJpOR3V3LLmXh9eLr8Tz9HeUWbtY2lBC6/1IFdEl63wjeAG5p2Ok+2iWPT+gM+V
         H7GCdMtR66LXGJDNgVkJzRzj6e4LGhrSwH7qt5CYILGFK2lmJDkCjaoPOWyhoKrETHC7
         9pnT9h2kuLtkHEjXAqPOyg6pDjOLi4IUGdwo9MpqLeqFFuOuSrsQS3BqSh9RGehdK3pk
         CY7cnW1MTI3HlLsTs+zwgV0J2a4NfOmhNUmQrx+htADSFq0BtSRbOsHul7UfBmvntqhl
         SQncRtEuq7wCsYqRmZYP3Jnw5N+sqePk2P8aoh7A9o4ilUU6Hgpj2w5hSpUhbB6PZ1iP
         nxkA==
X-Forwarded-Encrypted: i=1; AKwUvBzjUYtzE6GqLT23wpzbdt0OtkpxCOiN7PfvhhwcE8YFzcJh+iy247pHqpLuS1gV+0Q7l1B8xLIYveOTZuBXVw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKI9Ml+IDZwe/RUxXqwyMuj+bfgLd25Df/dMcVLIKYJ4pNw+G0Y
	p1wpD2JXvthaWzXF6q6CFK+6Keawcu3h2kzSB4aRm6mm7JVWCOwpiJPo
X-Gm-Gg: AYBFou1UHY+aWNNJeN/xJ2TPplbk5fGJpT2cB1LXPNy/bNTBt1p1lTl0J2WtK5POa7T
	jkWEB62NlMuN51NBBa7KYbp4rq+tfJW3aZGuOG/CR630RdMwaCmhmk1YT5eZRquXzQPrahYo7Tx
	FJzaYDzzrHbHOMaAzSPbHbZrmi6g593aNtJJ9bfiRtctQ/fH8Pys2c4o5AOqFVhzi5zfxgrbXO/
	MLeXOHsYVx7kYI4JhF5qsmyO6p6dLzoeggVQnN+pORhKAAqWVv76KycqaFDRpZkmN8gHU2bkDdq
	UEGmRxGgEOsgoggjftMn5sV6wpiif9fNJTxTebLD6ZXMiqAPrCBkfd66N94O/25buvhHBba2HXb
	U7tVFgutDrHYayl7jDXlH1empZKMj3ge+SzhHMHIqbO1nICcoeDih0VhG/qw1hcektIJZgt+oQR
	qCiT7pckI1EV7W5LvYROS2KG/L/oSXsdrhvAvOyfv9dKDE8+ZSNCSixGf8nXhB0Zi2Ylm6N5hc9
	zPhiCLDfeqjB0PFhUy0jezgRw6Tp4A+TSrTYX/K11D09SXDv1YaL543sSTh9KioScjC/Zqc0v4a
	f/vPqvMkPsFxG5BjBQX7M9/CpIvVUowFM0+M9Uw7t85g
X-Received: by 2002:a05:6820:f008:b0:6b8:ce67:77e9 with SMTP id 006d021491bc7-714f1fd628dmr4883384eaf.12.1793591003181;
        Sun, 01 Nov 2026 19:43:23 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2d16197sm7682911eaf.6.2026.11.01.19.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:43:21 -0800 (PST)
Message-ID: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
Date: Sun, 1 Nov 2026 21:43:20 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_194324_549054_75A18BC6 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg,

Gentle ping on this one, there hasn't been any replies since the resend 
on Sept 29. It fixes system suspend on MT8173 in gadget mode after a 
soft disconnect. I've been running it on an Amazon Fire HD 10 (2017) 
since September.

Thanks,
Ryan

