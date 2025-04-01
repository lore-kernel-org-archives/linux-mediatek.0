Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A9EC36014
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=; b=Ka4Dk5ZQUms4tKXhZsZUickd9w
	JiCI7tdd5dkaD9O77CxqdxdYDj9EWIvHWIp+T7Tr5GHpkhhfSBvASecbjavi93Ll033jDe974rFkr
	9ncyZGKHgHWpznnhlkHaa+lekODn5pfLV2lzeyz7JuFB6Z04L+4L7X6MQClHVIQzyCa9GTxNG+wqm
	7BCFVJFwbKFPPyk5GP7RoZRsxm6KLclLpvtD0lMfUbZhR3XqzgGQBs+vsNPeZFWRANnqNmph3WlWS
	HvadgeXV/9MMIinPru/grnLOc/HLvIRTXSejnUuWaZ+K8cRKJp3N9UVz8AxEMDR6mwslOsRJkRd0x
	Wht0x81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYcp-00000002azx-0OdX;
	Tue, 01 Apr 2025 10:13:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYH4-00000002Wwa-1hMz
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 09:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743501072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=;
	b=cC02/npY3r3Rp0e8vz3bUlzIE3jIQVWjjxZpj19sOJgGocJlJPbYuvqMmSJNha4Q6ymTKF
	vjnfo2lfolUEM56KPHaQYQ3oMW98zFMGh5SICB8rRiIug7Znz8+EkFHVfQb4eIXODEl7Yi
	r5xOzrMBjZuGMbzQUIJvmGpgj5r3BrY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-BsKJ7O23PZimrIZxgOrfBg-1; Tue, 01 Apr 2025 05:49:41 -0400
X-MC-Unique: BsKJ7O23PZimrIZxgOrfBg-1
X-Mimecast-MFC-AGG-ID: BsKJ7O23PZimrIZxgOrfBg_1743500980
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso31128825e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Apr 2025 02:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500980; x=1744105780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=;
        b=VQyn1ik9P3AfufF5Uf6GFc41U+V1QYSLzyTOQYSghv1zV9tDPxzQlIK+aFy9hMudFa
         XwoRRR7erSa0ymGMi/muTuFSLTFTgTn7wEH62JeYJSofE5khJci3DzXaBXejM3SbM2wf
         0RMjqENgRGaCAmMn2NCBU738qnMSe3Y9DLm2B0IF1hdAVr3UJFfn/FtJLUcQo69gmIan
         NVxy/yjJsPrLtlFK3MEB+Ky1CpVbiAVvMkjfLq0A/lyFAFZFxfggrumHr7m3DIYtqDHc
         /Au2zjhITbCVMpQwS58iOiDCK9jc3sL0oWUOFruXN3tYhzRwxiCH/WeEkOtnKHiLkv6d
         9+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUn0NoKddM8r5bRn8v42DqWaWqLOYJPRAm+lTuuWSO9pHTGeprmmmhfSUYm+tEBxVsfMdkzflGg2ZNPGVzOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwsyiOTbx04XrDBBV1JPtZl7y8mvITbm5+5Hazuzq3u/lNXYlo
	QpSC+WdZQRnIwsdjUHh7hQzOyTyBS6W1lb9+hHGxWCbpk1dd3ARGD/4Qar7a8PDfUdldQ/BQ4os
	boKEBaO+1+hj5XSL8S/xS3a6l/Fcm2KQut8U31kj/zGOgwe1atC2qe/PnyrNBxpp4PfxJ3g==
X-Gm-Gg: ASbGncufn7ahXb0QGSZHaw3P4pXXRgwKLXXAgplR2+HLthNZd/9x8peagwlLaUyBBf5
	n4pNGeIkmMFxDXa+Woa6qwcCCewr5GHie7fPAhq9/sVmnIPaZ8heORhqvIdvre37ZU7WTwQU/kS
	1OrWZDY6I1vz1V+GTSi2MytPW4xYvN13bM9joT8oZ5WxJzFuEeQaME8HLfL5blz8bRclvr2cVN4
	oNpP9Nhsj12qcAZ6S992m0/56+ifnDqpp08upzn+IFAXCJYHR1kpqMqg7+Z9OYGUc/i0+Kht+nP
	bjfpnJHHa2pY6A==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr86356865e9.4.1743500980215;
        Tue, 01 Apr 2025 02:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq6P/LONQIdq2pleoYEuzzxgyj99hAud3WvWbJHB5zZUAUKpRXcJTP2ISiVIGMBWKtclaTMA==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr86356785e9.4.1743500979880;
        Tue, 01 Apr 2025 02:49:39 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm192609015e9.19.2025.04.01.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:49:39 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:49:38 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix ETS priomap validation
Message-ID: <Z-u2svZqo4NC0JGm@dcaratti.users.ipa.redhat.com>
References: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qLZQqVw1u86vESE4Ne-fMe8SUoB54IXqkAmYh5qNNtk_1743500980
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_025114_532041_B57602CE 
X-CRM114-Status: UNSURE (   8.70  )
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

On Mon, Mar 31, 2025 at 06:17:31PM +0200, Lorenzo Bianconi wrote:
> ETS Qdisc schedules SP bands in a priority order assigning band-0 the
> highest priority (band-0 > band-1 > .. > band-n) while EN7581 arranges
> SP bands in a priority order assigning band-7 the highest priority
> (band-7 > band-6, .. > band-n).
> Fix priomap check in airoha_qdma_set_tx_ets_sched routine in order to
> align ETS Qdisc and airoha_eth driver SP priority ordering.
> 
> Fixes: b56e4d660a96 ("net: airoha: Enforce ETS Qdisc priomap")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

LGTM!

Reviewed-by: Davide Caratti <dcaratti@redhat.com>


