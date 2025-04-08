Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F4CC3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=; b=jaiH3jTgEoRxmlkvZghFcJUOBW
	7FOBmRF8h4KBdPq/ZFiC/YKPQOGFgdmWf8buB7MyVdkT9ucVoTJInWR6ogOk39CrSlw+GwJvvpUtT
	2S08FLna9Gj/IzbOUZlFf+kg8jZy7kqMREzJ0PkjROswqof5bhNJAgU/9DI7CmGlOTsed0U/y6oyM
	K6m4alPCsq0iXcv8WMoRKxCFg6Nk3bW58JPBf8PRNAIgHl05ls4t3RTMH4w56lM/XTrz/S0MZ4yeP
	Ee9zs/WUuYKb0+M8TA4oNAx8YyS+0OV8/AcpfN0acEG6grCAMYoUieIYRbnZ2smSCb5dWzCodldm4
	MRhgmSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23xf-00000003BO4-36nH;
	Tue, 08 Apr 2025 08:05:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23xd-00000003BMK-1vAg
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 08:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744099531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=;
	b=KXWfQ4G7L52eNLL9h+uZ1DQXDn+8OwSUJVbGXvHdFCPRC73i9dmQNANPvqQNNIAQNrOu0F
	spOshWReY3AvlLb5Q2xQ7VlG+xc29F1TC7df+wgyOHRsav6iISB9ciax57mgO2/7XtOpyI
	gE5hRFDvXQlMx/EokLhp4frQQ1gaxEE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-FRZFnnoOPhijPpY5-fQdbA-1; Tue, 08 Apr 2025 04:05:30 -0400
X-MC-Unique: FRZFnnoOPhijPpY5-fQdbA-1
X-Mimecast-MFC-AGG-ID: FRZFnnoOPhijPpY5-fQdbA_1744099529
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241ae15dcbso62427575ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 01:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099528; x=1744704328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=;
        b=oGjb+LHvz0gdoO0DZJAX8N7MGERPgpYZkBjOhYivIuSVU6sVXjORHkU8UrUeL79lFN
         m6bpT91mFgzvedCbMIbLiyr/YAFzNScmb2OQ28I1HfUNTClsiJHjdU4PnFlZXBWZSUkm
         +yhtll8IyvxbHGXd9RCpds/2gsjLmWUcDybwy0xjMBqnH+mlfIS5JZW8UzJB+Yqa5Lex
         fuMa0wJ6Q/ZKJD7HFWe0+ta8JmMGXaL5Dypq2+uB/E9rToETT7D5J0L49RfVfSZ9lFYg
         Dk7kQxV9ePW7YNXVYz2tNX5krnmDtaVOMfEdiLGGhfMPKXbIBf/icStQvbgUcoQkZtSt
         bqMw==
X-Forwarded-Encrypted: i=1; AJvYcCUdqtfFdC/X+5aVmBNdbixxMBYMtwVXDHXlg5f2rALDxmPy/FqMIu5bYwANiPQT7M3zKddnKr7LQAOi6H1Q2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx95gpZ9/9kqitp1z0fY866DFoLqPGjpKAKjiC9WsqyYDOc245
	8NbdZwlCzdke6xxqNlbepp26G2jn7Bo1s5UdJeP6Wct6faCnhRk/pvEJIqcixon4lqfNTD6keAJ
	lOBoLMMRU0pJ0ghzirQDFqqofogoEzXLgStc8k8uQL+ms3THHiTBAquotm7WFW4JiSaqq2fgy3Z
	yo+va1Ve549enStbY0O9DjRNWUZv9yK9wTuEc+u2tlz2yMwFETXRri
X-Gm-Gg: ASbGncv8CfM3zb7eJ6e0Ce2+vEVTzIM3kYUHKNYy1GaBb9/QIuqC4L6TnQUt6yGcBLR
	YBWk80ISvQ9yBDy/TpjJcqqCiqpPDS0c4/MmfCnIPx/QeLLDkBjxE17IeFFjDqpeNqSJDTRBROh
	IjfsbRzIc+MxrnkNDQL3Vix+/G8v7Q
X-Received: by 2002:a17:902:ef46:b0:224:1acc:14db with SMTP id d9443c01a7336-22a8a065a92mr216812295ad.29.1744099528585;
        Tue, 08 Apr 2025 01:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxt6JXSAKwtzMhURmlwXUeHTpsebb4IGewHFs0bIb9p2YTTOJJynYQGNzCWOOkQfdVElwjfxkR47pQbpLQyHc=
X-Received: by 2002:a17:902:ef46:b0:224:1acc:14db with SMTP id
 d9443c01a7336-22a8a065a92mr216812095ad.29.1744099528326; Tue, 08 Apr 2025
 01:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
In-Reply-To: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
From: Davide Caratti <dcaratti@redhat.com>
Date: Tue, 8 Apr 2025 10:05:17 +0200
X-Gm-Features: ATxdqUEwnkKiKF8g-PFRZFZFOa_vl1d4t-NasxHHhEMxF0J2LDMD5D2Hq6aL9t8
Message-ID: <CAKa-r6tNa+Ltxb61g6E3h66pxW0XTDb76T6Wc2XMJCu8xuAvPg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: Add matchall filter offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ihmDP20PQNfBcR_1QK8D50ZTiF3Ls3ChG_sAM_Jfew_1744099529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_010533_561532_05E021FE 
X-CRM114-Status: GOOD (  11.06  )
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

hello Lorenzo, thanks for this patch!

On Mon, Apr 7, 2025 at 10:04=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
>
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
>
> Curennet implementation supports just drop/accept as exceed/notexceed
> actions. Moreover, rate and burst are the only supported configuration
> parameters.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

[...]

> +
> +       if (act->police.peakrate_bytes_ps || act->police.avrate ||
> +           act->police.overhead) {
> +               NL_SET_ERR_MSG_MOD(f->common.extack,
> +                                  "peakrate/avrate/overhead not supporte=
d");
> +               return -EOPNOTSUPP;
> +       }

I think the driver should also validate the so-called "mtu policing"
parameter. E.g, configuring it in the hardware if it has non-zero
value in act->police, or alternatively reject offloading of police
rules where act->police.mtu is non-zero (like done in the hunk above).
WDYT?
--=20
davide


