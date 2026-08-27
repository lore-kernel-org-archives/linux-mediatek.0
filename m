Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA7C5DF9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=; b=H8rYA+od5he2CLgxfgHKbcPXw/
	UirrNyxfmsx1pI/mhr3BAgz0p96vQWbYY6A4mzN1egy/LlXXYAOoCMg/Oqa5/1iyYl8HWINB5+Ft9
	O4rWLWAUU12uTEZbkCrL3qUhYHF4Cr5o2UK75MP925+WRCS/FFsL8uOsHgkzrMfTa/6hoH7XqhXiC
	XmLoHfka3f43m+zDt6rzrrC+5zC/GUNqjNq3UX2CGe0SoqMoodRrExKng9lmnCgKyLx+noBXVfY6y
	Mf6869XpDmUqFQsuC7KZ7wTz4CeS14N5HVA9z0FxNWnWMqQxzbTe/znzqNjf+QikuZhnrhsUpELQh
	bA219LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVKv-00000003cgU-0aBp;
	Thu, 27 Aug 2026 08:19:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVKr-00000003ceU-0Btb
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 08:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=;
	b=ZQossVzUDsQ+vVemwjvQ7xYZwIW9Z8Y+2xxXDDTppueh9GCRwlWdgSJcRRPKp/z6gdm0vL
	QgQS9ZQjaq8nEZELPsqxMLe0zM/0Vx+KXy/+O++qmDPibuVngYEZH+kA871Udcxj3ECeT4
	Qivv3llDFK3a4ep49en/a54PPePu9tA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-tZt_WuDdO7yGz8vZ9RhPXw-1; Thu, 27 Aug 2026 04:19:40 -0400
X-MC-Unique: tZt_WuDdO7yGz8vZ9RhPXw-1
X-Mimecast-MFC-AGG-ID: tZt_WuDdO7yGz8vZ9RhPXw_1787818779
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b64e98e94so2717365e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 01:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818779; x=1788423579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT8QHmdIgh8C/99Uph+9sWbsTLGNaTSQ6OcKusUcL0k=;
        b=WnYGbkeyh/Cwrab68/qWUR3/02eiwUhB8rNkx6DTVHNrMumAD9w1daWIuhArzr+Eez
         NmSE+SXEStS5uvpIPxxvKBvUg4NLb5SKC0ioL2orcmXgC0b4L1KgbEPJ96Ps5t9w1O4Y
         7F5BSm+8b05b6iQ7zbG3KnnOUEtOoJGLmHFP+WrVAQ1Pm9i3tJOpoluimNjwK3q9vrk1
         DUCDyHCOYVDsf0ZaKyXW6fhMjsJnyeFhOz6MRlvaS/XxUlAD1hhYzfmTBqgB+GjzOrdH
         gBYGKFsgirZc/ZgozTLUt3tDS3P9aUDgxFYniAZsg4pgGTMZveDcibfqE1mvgFl0+BrE
         EkAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1eVLUhAmuDVYY477L+hLXE2/YBHf/sDseoDqkNs8Mb9nNoEG+K86lNJJ3bdXCV14KnXUNtdQJDYENRKuvMA==@lists.infradead.org
X-Gm-Message-State: AFuF++n3fimSaIT6OJ9MRKQo80XDronFwBvQPTUek3zRXIgP4x2w2UH7
	OgyBdLnBJ38a92fQ2poq4Xa9JHkcaRIhNvbQ80hOE8WBxqw58x8LwWAlQmI65SMpvrc4RLNzyyj
	dmiEtLKK8TL37bfBnVPokGPAwdejXIUQPItbhW6rwHB7K6E/tmrGusSy8vIBz4RiAT7taH7lsRg
	==
X-Gm-Gg: AR+sD12NOaFAhgQ51w0Qb6sdVJ8AqeSLGq6QdC+o0aVpLQnSIkAIFScxX2O/Mv9IqS6
	xNNwCT0rBJO26x1pgHxDKWKidJekF6KBHEjUGyVdu+OVQsgWice6bCOC4GA7XKIRcW07rI+ZohU
	RqmdKOivzdeuDplfzk1vCYWxcTLr9Sd+K7Ea6O4NS87b/yjHTtON8Af+sIg4MK0QTaFSKDVTl4X
	gyIf4+cSsmo/0WIudgZyi4FEq28rvPAT7AqUSODXK4ao3UnwZoqGdczKlKC6sjmH79jkBpxGIXn
	xNJk+QqFjW6ChLG6ziHe5ihDu8BacRLMJPCMDaP3k9CXbbNZE0O0tnYV/GoAsrEECyULgoc/Ebr
	ZWC5xUs/bewZCgwC09K/gGAlIvQjWf863TH3ghaDM7hotTQTs2qgDDtNu8rnOuTDkZqfSK88=
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b0dfcd4c2mr46298625e9.6.1787818779470;
        Thu, 27 Aug 2026 01:19:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b0dfcd4c2mr46298095e9.6.1787818779033;
        Thu, 27 Aug 2026 01:19:39 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0dd3e148sm29013275e9.1.2026.08.27.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:19:38 -0700 (PDT)
Message-ID: <ad731f07-3b80-4d48-a6fa-c0e405eedefd@redhat.com>
Date: Thu, 27 Aug 2026 10:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 0/3] net: phy: mediatek: support EcoNet
 EN751221 gbit SoC PHY
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org,
 ansuelsmth@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260826202103.2280645-1-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260826202103.2280645-1-cjd@cjdns.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zZYpLZBB24WEeywjeh6hp8OwUXPnEWlEC27ZLO8M0CM_1787818779
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_011945_154118_1974D51B 
X-CRM114-Status: UNSURE (   7.00  )
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

On 8/26/26 10:21 PM, Caleb James DeLisle wrote:
> NOTE: This patchset bases on https://lore.kernel.org/netdev/20260708102341.53919-1-ansuelsmth@gmail.com/
> 
> Add support for the EcoNet EN751221 SoC gigabit PHY, as identified by
> product IDs 9451, and 9471.
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed



