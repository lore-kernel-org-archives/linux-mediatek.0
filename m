Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56332C36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=; b=wuKFJ96CsPY6zSNjnB7+qKVDbK
	lPcHVObiK7mufFZUFxfsCwqbxvR5maB8aEa/FPOC4Zhb9Kzz0eBla+k8DD8ODFEuuQrmmOzIXRksb
	P3rzY2ZPRjJA9oLrV8nf/7nu//BPc5Ovx2i+kFyBBTdiCb/348G+tpmhNyr6cXVn8aY7vfK3UmGTM
	7Fl32SSx2VKx+GWjN2HuQlPnJ65wpClZ3KENkpuU6ivwIniOyGLYhOZ0lerUhLXuHd7PDX4Qb32Ce
	Ep6GFxhSAaaVL3jehy0iVxZCkTM9dp9mSJ38bXqcuPKSnDg1Y3r+yU4TOUMhnK2KUB4Rt1pAoGBDc
	AK5I6EuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2R4Y-00000006d6Z-13FR;
	Wed, 09 Apr 2025 08:46:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2R4V-00000006d5R-2ggO
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 08:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744188369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=;
	b=MHV4ZhI9yPO3LnEm28W+ZCCxkTLrt4OWySpTS9UgB8Y2ORL/N/mcaDwb3/xZb9IToPD3UY
	Mqtp+sxiWMJiSCRLxgPLNMGlu7nBHCLFXzFstpyfa/MJpTvPDuwEq7++0HwJNCaMhdWHxf
	h4nBqCW4uDNkwLjMKYc0mBcAD/9+llU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-L-7FKsLbNoSq1rGZFtvl9Q-1; Wed, 09 Apr 2025 04:46:08 -0400
X-MC-Unique: L-7FKsLbNoSq1rGZFtvl9Q-1
X-Mimecast-MFC-AGG-ID: L-7FKsLbNoSq1rGZFtvl9Q_1744188367
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fc9861cso2633062f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Apr 2025 01:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188367; x=1744793167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=;
        b=YLaJCypeQpkldF0uIujtux7dq1euRRzCducD30xP9PS7rBiwNt5U0BVJW9zASIR1JA
         pBmEWz2mGujjKVtmVrciKl9w6o0XWykIUl5z5I+ZY/aErBuY0s0GSa66gm27wFZrYuE7
         mYBWhQfaet6q+87KTC6wzGgJGh1B5uD3FibtCgP9ErV8/IK1nu83zacPoD/uioOtrNHh
         rpxcKVvDoVInDycxJkW8sviv1+dSF3Ecn9gEKbGUfdYrAEjns37zlc8tPpxyODUc2Ji+
         vwtv3MrbX5+aL8u8OJdV9nztR+4NXqasC9fANYeZYVDdqyq6bv7Qndyj4NJG8r3puYf/
         MsOg==
X-Forwarded-Encrypted: i=1; AJvYcCXAJS9DTgkwwiMi0CwWAT13Nghlxei7vz8ZWKF7AiklAn8X5ehqt9DV6akNvi65jX16svnV9IZOb6izhL4TlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhzlg+h1Qn00RRi7f1ZTUOc+TXtzC5zBMe7W++g3++nqHrezQ3
	dWenPm6AfT7rSFPN4qYqQ1bb6JnAlFx2H37aHYYIk0w65tZRIOp7KSGM0bnPMA+cFr5q3HYCbTV
	4mJFHnvc0/Nl9T17TKaOyY5I58ZpLBCI4asZBtn/O/H/JAEd6bFTDvGHkKTbFZHaZZ/sSZA==
X-Gm-Gg: ASbGnctAlWRZusMqQmJ7MshIkfqIp8SYNl52iGBH0Jl3vU81ILssa4XL4sIP49ixRMx
	JM0lSM+mAllwTMg0LN5IiBUtXH2t7PYkdNlKUkXn/aEPaczmQ5fHFLjfB2UZTd/uNMMXN8qX356
	32x6PfdWvysmsxixoohkTTTkCZV9dg50LGaP87lUCwGTk20qTRUu8gEvpuVGdYMu3y3VlKvwJ4s
	1fO2YTNsJbScOld5yNI3lMa3ZZqljGaiMn7B7u2ibDWozVXDyPgAtHvBs7pO5nrfRmORB17M63U
	bHDRa2+KxQ==
X-Received: by 2002:a5d:59a8:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39d87aa83f7mr1836450f8f.17.1744188366942;
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy+550CSY65ENB+HIM0YP9gUefmg712FU2KtH7qBXHCJBM64fPaYYk4BYRgiS6DoCFcosTjQ==
X-Received: by 2002:a5d:59a8:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39d87aa83f7mr1836423f8f.17.1744188366581;
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89389f72sm948917f8f.42.2025.04.09.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:46:05 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Add matchall filter offload
 support
Message-ID: <Z_YzzeUVd8ww6sjf@dcaratti.users.ipa.redhat.com>
References: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T2AqDgrPDpK785FxJXD_xdmsMbJTsjIOYZNUHQe6ltA_1744188367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_014611_788285_1D2469C9 
X-CRM114-Status: UNSURE (   9.15  )
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

hi,

On Wed, Apr 09, 2025 at 01:15:32AM +0200, Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> The current implementation supports just drop/accept as exceed/notexceed
> actions. Moreover, rate and burst are the only supported configuration
> parameters.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Validate act police mtu parameter
> - Link to v1: https://lore.kernel.org/r/20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org
> ---

for v2:

Reviewed-by: Davide Caratti <dcaratti@redhat.com>


